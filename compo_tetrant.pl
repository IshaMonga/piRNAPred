#!/usr/bin/perl
# to generate tetra nucleotide composition#

$file1=$ARGV[0];
$file2=$ARGV[1];
open(MAK,"$file1");
while($line=<MAK>){
    chomp($line);
    $seq="ACGU";
    @nt=split(//,$seq);
    @ab=split(/ /,$line);
    $len=length($ab[1]);
    $len1=$len-3;
    for($a=0;$a<$len1;$a++){
	$sub=substr($ab[1],$a,4);
	$aa[$j]=$sub;
	$j++;
    }
    $n=0;
    open(JAK,">>$file2");
    print JAK"$ab[0] ";
    for($c=0;$c<@nt;$c++){
	$b=$nt[$c];
	for($m=0;$m<@nt;$m++){
	    $l=$nt[$m];
	    for($d=0;$d<@nt;$d++){
		$k=$nt[$d];
		for($e=0;$e<@nt;$e++){
		    $s=$nt[$e];
		    $join=$b.$l.$k.$s;
		    $n++;
		    print JAK"$n:";
		    $count=0;
		    
		    for($h=0;$h<@aa;$h++){
			if($join eq $aa[$h]){
			    $count++;		       
			}
		    }
		    $tetracomp=($count/($len1))*100;
		    printf JAK"%6.4f ",$tetracomp;	
		}   
	    }
	}
    }
    print JAK"\n";
    @aa="";
    $j=0;
}
