#!/usr/bin/perl

$file1=$ARGV[0];
$file2=$ARGV[1];
$file3=$ARGV[2];

open(CAT,"$file1");
while($line=<CAT>)
{
    chomp($line);
    @piR1 = split(/\s+/,$line);
    $aa[$i]=$piR1[0];
    $i++;    
}
close CAT;

open(GAT,"$file2");
while($bin=<GAT>)
{
    chomp($bin);
    $bb[$j]=$bin;
    $j++;
}
close GAT;
open(DAG,">>$file3");

$roc = `/home/users/mongaisha/VIRmiRPred/Progs/perf -roc < data_val | perl -pi -e 's/ROC//g' | perl -pi -e 's/ //g'`;
print DAG "ROC: $roc\n\n";
print DAG"Thres\tTP\tFP\tTN\tFN\tSen\tSpec\tAccuracy\tMcc\n";
for($a=-1.0;$a<=-0.1;$a=$a+0.1)
{	
	$tp=$tn=$fp=$fn=0;
	for($b=0;$b<@aa;$b++)
	{
   		if(($aa[$b] eq "+1") && ($bb[$b]>=$a))
    		{
			$tp++;
    		}
    		if(($aa[$b] eq "-1") && ($bb[$b]<$a))
    		{
			$tn++;
    		}
  	  	if(($aa[$b] eq "+1") && ($bb[$b]<$a))
   	 	{
			$fn++;
   	 	}
   	 	if(($aa[$b] eq "-1") && ($bb[$b]>=$a))
   	 	{
			$fp++;
   	 	}
		
	    }
	
	$Totalpos=$tp+$fn;
	$Totalneg=$tn+$fp;
	
	print DAG"$a\t$tp\t$fp\t$tn\t$fn\t";

	$total=$tp+$fp+$tn+$fn;
	if($Totalpos!=0)
	{
	    $sensitivity=$tp/($Totalpos)*100;
	}
	else
	{$sensitivity=0;}
	if($Totalneg!=0)
	{
	    $specificity=$tn/($Totalneg)*100;
	}
	else
	{$specificity=0;}

	$accuracy=(($tp+$tn)/$total)*100;
	if((($tp+$fn)*($tp+$fp)*($fn+$fp)*($tn+$fn))!=0)
	{
	    $mcc=($tp*$tn - $fp*$fn)/sqrt(($tp+$fp)*($tp+$fn)*($tn+$fp)*($tn+$fn));
	}
	else
	{
	    $mcc=0;
	}
	printf DAG"%4.2f",$sensitivity;
	print DAG"\t";
	printf DAG"%4.2f",$specificity;
	print DAG"\t";

	printf DAG"%4.2f",$accuracy;
	print DAG"\t";
	printf DAG"%4.2f",$mcc;
	print DAG"\n";
}
close DAG;
