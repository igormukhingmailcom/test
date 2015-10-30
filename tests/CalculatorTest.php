<?php

namespace TestApp\Tests;

use TestApp\Calculator;

class CalculatorTest extends \PHPUnit_Framework_TestCase
{
    private $calculator;

    public function setUp()
    {
        $this->calculator = new Calculator();
    }

    /**
     *
     */
    public function testCalculate()
    {
        $this->assertEquals(5, $this->calculator->calculate(2,3));
    }
}
