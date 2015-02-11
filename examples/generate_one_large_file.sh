#!/bin/bash
mkdir -p generate_one_large_file
cd generate_one_large_file
temp="<?php
class SlowTest extends PHPUnit_Framework_TestCase {"
for j in {1..2500}; do
   temp="${temp}
            public function test_true"${j}"() {
                      \$this->assertTrue(true);
            }"
done
echo -e "${temp} }" > oneLargeTest.php
