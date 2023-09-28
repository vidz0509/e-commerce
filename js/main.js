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
    $('.quantity button').on('click', function () {
        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
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
        var product_price = $(this).closest('.product-action').find("[name=product_price]").val();
        var product_name = $(this).closest('.product-action').find("[name=product_name]").val();
        var product_image = $(this).closest('.product-action').find("[name=product_image]").val();

        var product = {
            id: product,
            price: product_price,
            name: product_name,
            image: product_image
        }

        $.ajax({
            url: 'ajaxCallbacks/add_to_cart.php',
            dataType: 'json',
            method: 'post',
            data: {
                product: product
            },
            success: function (response) {
                alertify.set('notifier','position', 'top-right');
                if (response.success) {
                    $(document).find('#cart-text').text(response.total);
                    alertify.notify('Product added to cart!', 'success', 5);
                }else{
                    alertify.notify('Something went wrong', 'error', 5);
                }
                hideLoader();
            },
            error: function (error) {
                console.log(error);
                alertify.set('notifier','position', 'top-right');
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
                alertify.set('notifier','position', 'top-right');
                if (response.success) {
                    alertify.notify('Product removed from cart!', 'error', 5);
                    window.location.reload();
                }else{
                    alertify.notify('Something went wrong', 'error', 5);
                }
                hideLoader();
            },
            error: function (error) {
                console.log(error);
                alertify.set('notifier','position', 'top-right');
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

})(jQuery);

