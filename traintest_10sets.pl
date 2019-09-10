#!/usr/bin/perl

#### To generate five training and test sets and Main_data#;


system "cat set1 set2 set3 set4 set5 set6 set7 set8 set9>> train_1.pat";
system "cat set1 set2 set3 set4 set5 set6 set7 set8 set10>> train_2.pat";
system "cat set1 set2 set3 set4 set5 set6 set7 set9 set10>> train_3.pat";
system "cat set1 set2 set3 set4 set5 set6 set8 set9 set10>> train_4.pat";
system "cat set1 set2 set3 set4 set5 set7 set8 set9 set10>> train_5.pat";
system "cat set1 set2 set3 set4 set6 set7 set8 set9 set10>> train_6.pat";
system "cat set1 set2 set3 set5 set6 set7 set8 set9 set10>> train_7.pat";
system "cat set1 set2 set4 set5 set6 set7 set8 set9 set10>> train_8.pat";
system "cat set1 set3 set4 set5 set6 set7 set8 set9 set10>> train_9.pat";
system "cat set2 set3 set4 set5 set6 set7 set8 set9 set10>> train_10.pat";

###############

system "cp set10 test_1.pat";
system "cp set9 test_2.pat";
system "cp set8 test_3.pat";
system "cp set7 test_4.pat";
system "cp set6 test_5.pat";
system "cp set5 test_6.pat";
system "cp set4 test_7.pat";
system "cp set3 test_8.pat";
system "cp set2 test_9.pat";
system "cp set1 test_10.pat";

system "cat set10 set9 set8 set7 set6 set5 set4 set3 set2 set1 >> Main_data";
##system "test_1.pat test_2.pat test_3.pat test_4.pat test_5.pat test_6.pat test_7.pat test_8.pat test_9.pat test_10.pat  >> Main_data";
