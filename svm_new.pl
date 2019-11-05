#!/usr/bin/perl

$fold=$ARGV[0];

for($i2=1; $i2 <= $fold; $i2++)
	{
		$count = $i2 - 1;
		open(FP1,"pir-pos-neg-mddt");
		
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
			                system "cat test_$s>>TESTSET";
					system "rm model_$s results_$s";
	    				}
	    
	   
					system "cut -d ' ' -f1 TESTSET > testset1";
                        		system "paste -d ' ' testset1 RESULT > data";
                			
 
	    				system "perl /home/isha/Desktop/piRNA/piRNA-prediction/classification-progs/accuracy1.pl TESTSET RESULT OUT";
	    				system "perl /home/isha/Desktop/piRNA/piRNA-prediction/classification-progs/accuracy.pl TESTSET RESULT OUT";	    
	    				system "rm TESTSET RESULT";
				}
			}
				
