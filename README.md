Sweet Parallel PHPUnit
==========================

This script creates a new xml file based off of current phpunit xml files and then backgrounds each process to achieve parallel runs

1. It takes your current phpunit xml file, parses out all of the directories and files for that suite
2. It then uses that to create a list of files that are contained in all of those directories and files(using your test suffix as the search term)
3. That list of files is then turned into test suites and put into a temporary xml file for use with phpunit in the parallel call later on.
  1. It puts an equal number of files in each suite, this means that some may have more test than others!
4. It then calls phpunit, with a backgrounded/parallel thread for each suite created

How to run
----------
sp-phpunit -h

    Synopsis:
        sp-phpunit
        --auto_prepend="</path/to/auto_prepend/>"
        --generate-from-xml="<test_suite>"
        --phpunit-xml-path="</path/to/phpunit/xmlfile>"
        [<options>]
    Sample usage:
        sp-phpunit --generate-from-xml="parallel_suite" --phpunit-xml-path="/usr/local/www/data/tests/conf/phpunit.xml" --test-file-suffix="_test.php" --auto-prepend="/usr/local/www/data/includes/auto_prepend.php"

    The following options are valid & required:

    --generate-from-xml         This is the test suite that you would like your xml file generated from
    --phpunit-xml-path          This is the path to your phpunit xml file

    The following options are optional

    --auto-prepend              Full path to your autoprepend file for php
    --dry-run                   This passes in the --dry-run option to parallel so that it returns the commands it would run
    --generated-xml-path        This is the path where you would like the generated xml file to be stored. Default /tmp/generated.xml
    --parallel-runs             How many different parallel jobs you want to run. Default: 3, best appears to be cores*3
    --test-file-suffix          This is the suffix that you use for your phpunit tests eg.Test.php
    --custom-exit-code          This is the exit code you would like returned if pmp-phpunit would normally exit with a non-0 code'

Example/Tests
-------------
1. Head into the examples directory. You'll find 4 scripts there that will generated sub-directories that will contain everything necessary to test.
2. Run any of the commands that you want to see test ex. sh generate_many_files_small_test_suites.sh
  1. This will generate a sub-directory with some combination of sub-directories and files.
3. From within the examples directory run sp-phpunit and you'll see the output as expected
  1. time sh ~/projects/sp-phpunit/sp-phpunit --generate-from-xml="generate_many_files_small_test_suites" --phpunit-xml-path="/home/<user>/projects/sp-phpunit/examples/example.xml" --test-file-suffix="Test.php" --generated-xml-path="./generated.xml"
  2. Recall that the phpunit-xml-path variable needs to be fully qualified
4. Feel free to run any other parallel(or not) versions of phpunit on the same directory to compare results.

Known Issues
------------
1. If you have commented out directories/files in your xml file for a suite, this won't respect that and it'll use them anyway.
2. You can get unlucky with how it "randomly" creates the temporary suites, since it has no way of knowing how long a test takes to run, you could get a temporary suite that takes much longer to run than all of the others, which would severely slow down performance.
