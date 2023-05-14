<?php
function limit_description($string, $length)
{
    $string = strip_tags($string);
    if (strlen($string) > $length) {
        $stringCut = substr($string, 0, $length);
        $endPoint = strrpos($stringCut, ' ');
        $string = $endPoint ? substr($stringCut, 0, $endPoint) : substr($stringCut, 0);
        $string .= '...';
    }
    return $string;
}
