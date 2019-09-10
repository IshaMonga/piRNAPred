#!/usr/bin/perl
#take input in SVM format and convert in aac or dpc or others#
#use Getopt::Std;
#getopts('p:n:');
#$pos=$opt_p;
#$neg=$opt_n;
#open(FH1,$ARGV[0]);@posit=<FH1>;
#open(FH2,$ARGV[1]);@negat=<FH2>;
#system"perl pro2aac.pl -i $ARGV[0] -o pos_aac";
#system"perl pro2aac.pl -i $ARGV[1] -o neg_aac";
#system"perl pro2dpc -i $ARGV[0] -o pos_dpc";
#system"perl pro2dpc -i $ARGV[1] -o neg_dpc";
#system"perl col2svm.pl -i pos_aac -o pos_svm -s +1";
#system"perl col2svm.pl -i neg_aac -o neg_svm -s -1";
#system"cat pos_svm neg_svm > svm_input";
$fold=$ARGV[0];

for($i2=1; $i2 <= $fold; $i2++)
	{
		$count = $i2 - 1;
		open(FP1,"pir-pos-neg-mddt");
		#print"svm_input\n"
		open(FR1,">test_$i2");
		open(FR2,">train_$i2");
		while($t1=<FP1>)
		{
		    if(($count%$fold) == 0){print FR1 $t1;} else{print FR2 $t1;}
		    $count++;
		}
		close FP1;
		close FR1;
		close FR2;
	}

#system"cat pos_svm neg_svm > svm_input";
#system"perl shuffle10.pl pos_svm neg_svm ";
#@g=(0.001, 0.005);
#@c=(0.01, 10);
@g=(0.00001, 0.0001, 0.0005, 0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1, 5);
@c=(0.0001, 0.0005. 0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1, 5, 10, 50, 100, 200);
			for($i=0;$i<@g;$i++)
			{
    				for($i1=0;$i1<@c;$i1++)
    				{
				open(FP,">>OUT");	    
	    			print FP"\ng:$g[$i] c:$c[$i1]\n"; 
	    			print FP "**************************************\n";
	    
	    				for($s=1;$s<=$fold;$s++)	    
	    				{
					system "/home/isha/Desktop/svm_light/svm_learn -z c -t 2 -g $g[$i] -c $c[$i1] train_$s model_$s";
		
	        			system "/home/isha/Desktop/svm_light/svm_classify test_$s model_$s results_$s";
                			system "cat results_$s>>RESULT";
					#system"perl roc.pl RESULTS "
			
					system "cat test_$s>>TESTSET";
					system "rm model_$s results_$s";
	    				}
	    
	   
					system "cut -d ' ' -f1 TESTSET > testset1";
                        		system "paste -d ' ' testset1 RESULT > data";
                			#$roc = "";
                			#$roc = `perf -roc < data | perl -pi -e 's/ROC//g' | perl -pi -e 's/ //g'`;
                			#print FP "\tROC value\t$roc\n";

 
	    				system "perl /home/isha/Desktop/piRNA/piRNA-prediction/classification-progs/accuracy1.pl TESTSET RESULT OUT";
	    				system "perl /home/isha/Desktop/piRNA/piRNA-prediction/classification-progs/accuracy.pl TESTSET RESULT OUT";	    
	    				system "rm TESTSET RESULT";
				}
			}
				
