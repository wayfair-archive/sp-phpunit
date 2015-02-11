#!/bin/bash
mkdir -p generate_many_files_small_test_suites
cd generate_many_files_small_test_suites
for i in {1..25}; do
  mkdir -p $i
  cd $i
  for j in {1..100}; do
    echo -e "<?php
    class Test_"${i}"_"${j}" extends PHPUnit_Framework_TestCase {
      public function test_true() {
                    \$this->assertTrue(true);
          }
    }" > test${j}Test.php
  done
  cd ..
done
