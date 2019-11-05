#!/usr/bin/perl
########### USAGE {perl validation_classify.pl <overall_training_pat> <overall_validation_pat> <g-value> <c-value>}#############

open(FH1,$ARGV[0]);@model1=<FH1>;
open(FH2,$ARGV[1]);@val=<FH2>;
$g=$ARGV[2];
$c=$ARGV[3];
system "chmod -R 777 *";
system "/home/isha/Desktop/svm_light/svm_learn -z c -t 2 -g $g -c $c $ARGV[0] model_final";
system "/home/isha/Desktop/svm_light/svm_classify $ARGV[1] model_final pred_final";
system "cut -d ' ' -f1 $ARGV[1] > actual_final";
#system "perl correl.pl pred_final actual_final";
system "paste -d ' ' actual_final pred_final > data_val";
system "chmod -R 777 *";
system "perl /home/isha/Desktop/piRNA/piRNA-prediction/classification-progs/accuracy_val.pl $ARGV[1] pred_final OUT_VAL";
system "perl /home/isha/Desktop/piRNA/piRNA-prediction/classification-progs/accuracy.pl $ARGV[1] pred_final OUT_VAL";
close FH1;
close FH2;
