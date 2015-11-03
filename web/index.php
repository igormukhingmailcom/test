<?php

include_once dirname(__FILE__) . '/../vendor/autoload.php';

$calculator = new TestApp\Calculator();
$result = $calculator->calculate(2,3);

echo sprintf("Result is: %s<br/>", $result);
echo sprintf("Time: %s<br/>", date('Y-m-d H:i:s'));
echo sprintf("Env variable TEST: %s</br>", getenv('TEST'));

phpinfo(INFO_ENVIRONMENT);
