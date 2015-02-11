#!/bin/bash
mkdir -p generate_many_sleep
cd generate_many_sleep
for i in {1..10}; do
  mkdir -p $i
  cd $i
  for j in {1..10}; do
    echo -e "<?php
    class Test_"${i}"_"${j}" extends PHPUnit_Framework_TestCase {
      public function test_true() {
                    sleep("$(((${j}%3)))");
                    \$this->assertTrue(true);
          }
    }" > test${j}Test.php
  done
  cd ..
done
