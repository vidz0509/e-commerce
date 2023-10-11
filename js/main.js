(function ($) {
    "use strict";
    $(document).ready(function () {
        function toggleNavbarMethod() {
            if ($(window).width() > 992) {
                $('.navbar .dropdown').on('mouseover', function () {
                    $('.dropdown-toggle', this).trigger('click');
                }).on('mouseout', function () {
                    $('.dropdown-toggle', this).trigger('click').blur();
                });
            } else {
                $('.navbar .dropdown').off('mouseover').off('mouseout');
            }
        }
        toggleNavbarMethod();
        $(window).resize(toggleNavbarMethod);
    });
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });
    $('.vendor-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0: {
                items: 2
            },
            576: {
                items: 3
            },
            768: {
                items: 4
            },
            992: {
                items: 5
            },
            1200: {
                items: 6
            }
        }
    });
    $('.related-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 2
            },
            768: {
                items: 3
            },
            992: {
                items: 4
            }
        }
    });
    $('.quantity button').on('click', function (e) {
        e.preventDefault();
        var button = $(this);
        var oldValue = button.closest('.quantity').find('input.qty').val();
        if (button.hasClass('btn-plus')) {
            if (oldValue < 5)
                var newVal = parseFloat(oldValue) + 1;
            else
                newVal = oldValue
        } else {
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        button.parent().parent().find('input').val(newVal);
    });

    $(document).on('change', '#filterForm .custom-control [type=checkbox]', function () {
        var attributes = [];
        $('#filterForm').find('input.attr:checked').each(function () {
            var value = $(this).val();
            attributes.push(value);
        });
        console.log(attributes);
        showLoader();
        setTimeout(function () {
            $.ajax({
                url: 'ajaxCallbacks/filterProducts.php',
                dataType: 'json',
                method: 'post',
                data: {
                    attributes: attributes
                },
                success: function (response) {
                    $(document).find('.shop-list').empty().append(response.content);
                    hideLoader();
                },
                error: function (error) {
                    console.log(error);
                    hideLoader();
                }
            });
        }, 1000);
    });

    $(document).on('click', '.add-to-cart', function (e) {
        e.preventDefault();
        var product = $(this).attr('data-product');
        var product_price = $(this).closest('.product-cart-action').find("[name=product_price]").val();
        var product_name = $(this).closest('.product-cart-action').find("[name=product_name]").val();
        var product_image = $(this).closest('.product-cart-action').find("[name=product_image]").val();
        var product_qty = $(this).closest('.product-cart-action').find("[name=product_qty]").val();
        if (!product_qty)
            product_qty = 1;

        var product = {
            id: product,
            price: product_price,
            name: product_name,
            image: product_image,
            qty: product_qty
        }

        $.ajax({
            url: 'ajaxCallbacks/add_to_cart.php',
            dataType: 'json',
            method: 'post',
            data: {
                product: product
            },
            success: function (response) {
                alertify.set('notifier', 'position', 'top-right');
                if (response.success) {
                    $(document).find('#cart-text').text(response.total);
                    alertify.notify('Product added to cart!', 'success', 5);
                } else {
                    alertify.notify('Something went wrong', 'error', 5);
                }
                hideLoader();
            },
            error: function (error) {
                console.log(error);
                alertify.set('notifier', 'position', 'top-right');
                alertify.notify('Something went wrong', 'error', 5);
                hideLoader();
            }
        });

    });

    $(document).on('click', '.remove-cart-item', function (e) {
        e.preventDefault();
        var cart_key = $(this).attr('data-id');

        // var product = {
        //     id: product,
        // }

        $.ajax({
            url: 'ajaxCallbacks/delete_from_cart.php',
            dataType: 'json',
            method: 'post',
            data: {
                cart_key: cart_key
            },
            success: function (response) {
                alertify.set('notifier', 'position', 'top-right');
                if (response.success) {
                    alertify.notify('Product removed from cart!', 'error', 5);
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000)
                } else {
                    alertify.notify('Something went wrong', 'error', 5);
                }
                hideLoader();
            },
            error: function (error) {
                console.log(error);
                alertify.set('notifier', 'position', 'top-right');
                alertify.notify('Something went wrong', 'error', 5);
                hideLoader();
            }
        });

    });

    function hideLoader() {
        $(document).find('.loader-wrap').hide();
    }

    function showLoader() {
        $(document).find('.loader-wrap').show();
    }

    $(function () {
        var url = window.location.pathname,
            urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
        $('.site-nav a').each(function () {
            if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
                $(this).addClass('active');
            }
        });
    });

    $(document).on('click', '.tab-links .link', function (e) {
        e.preventDefault();
        var id = $(this).attr('data-id');
        $('.tab-links li').removeClass('active');
        $(this).parent().addClass('active');
        $('.tab-content').removeClass('show');
        $("#" + id).addClass('show');
    });

    $(document).on('click', "#place_order", function (e) {
        e.preventDefault();
        var __this = $(this);
        var __form = __this.closest('.order-form');
        var fullname = __form.find("#fullname").val();
        var email = __form.find("#emailid").val();
        var phone_no = __form.find("#phone").val();
        var final_amount = __form.find("#final_amount").val();

        var address = __form.find("#address").val();
        var city = __form.find("#city").val();
        var zip = __form.find("#zipcode").val();
        var state = __form.find("#state").val();
        var country = __form.find("#country").val();

        console.log('Creating Customer...');

        $.ajax({
            url: "ajaxCallbacks/revioPayCreateClient.php",
            method: "post",
            dataType: "json",
            data: {
                customerData: {
                    full_name: fullname,
                    email: email,
                    phone: phone_no,
                }
            },
            success: function (result) {
                let response = result.response;
                console.log(response);
                if (response.isSuccess) {
                    let customer = response.data
                    console.log('Customer is created.');
                    console.log('Creating Purchase...');
                    $.ajax({
                        url: "ajaxCallbacks/revioPayCreatePurchase.php",
                        method: "post",
                        dataType: "json",
                        data: {
                            client_id: customer.id,
                            brand_id: 'd85e524d-19b8-48ca-aef3-3aa1ab54b32d',
                            total_amount: final_amount,
                        },
                        success: function (result) {
                            let response = result.response;
                            console.log(response);
                            if (response.isSuccess) {
                                let purchase = response.data
                                console.log('Purchase is created...');
                                $.ajax({
                                    url: "ajaxCallbacks/revioPayCallback.php",
                                    method: "post",
                                    dataType: "json",
                                    data: {
                                        address: address,
                                        city: city,
                                        zipcode: zip,
                                        state: state,
                                        country: country,
                                        total_amount: final_amount,
                                        transaction_id: purchase.id
                                    },
                                    success: function (res) {
                                        if (res.success) {
                                            console.log(purchase.checkout_url);
                                            if (purchase.checkout_url) {
                                                window.location.replace(purchase.checkout_url);
                                            }
                                        }
                                    }
                                });
                            } else {
                                showError(response.errorMessage);
                            }
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });
                } else {
                    showError(response.errorMessage);
                }
            },
            error: function (error) {
                console.log(error);
            }

        })

        function showError(errorMessage) {
            alertify.set('notifier', 'delay', 5);
            alertify.error(errorMessage);
            alertify.set('notifier', 'position', 'top-right');
        }
    });

})(jQuery);

