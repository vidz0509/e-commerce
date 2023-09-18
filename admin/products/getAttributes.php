<?php
require("../config.php");
ob_start();
?>
<option value="">-- Select Attribute --</option>
<?php 
$query = "SELECT *  from attribute where variants_id = '" . $_POST['variant'] . "'";
if ($var_result = $conn->query($query)) {
    $i = 0;
    while ($var_row = $var_result->fetch_assoc()) {
?>
        <option value="<?php echo $var_row['id']; ?>"><?php echo $var_row['attribute_name']; ?></option>
<?php
        $i++;
    }
    $var_result->free();
}
$content = ob_get_clean();
$json['content'] = $content;
echo json_encode($json);
exit;
?>