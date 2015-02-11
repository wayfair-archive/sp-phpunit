#!/bin/bash
mkdir -p generate_file_larger_test_suites
cd generate_file_larger_test_suites
for i in {1..25}; do
  temp="<?php
  class Test"${i}" extends PHPUnit_Framework_TestCase {"
  for j in {1..100}; do
    temp="${temp} public function test_true${j}() {
                        \$this->assertTrue(true);
              }\n"
  done
  echo -e "${temp} }" > test${i}Test.php
done
