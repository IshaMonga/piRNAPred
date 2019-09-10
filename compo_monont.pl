#!/usr/bin/perl
##to generate mono nucleotide composition##
$file1=$ARGV[0];
$file2=$ARGV[1];
print $file2;
open(MAK,"$file1");
while($line=<MAK>)
{
    chomp($line);
    $seq="ACGU";
    @nt=split(//,$seq);
    @ab=split(/ /,$line);
    $len=length($ab[1]);
  
    for($a=0;$a<$len;$a++)
    {
	$sub=substr($ab[1],$a,1);
	$aa[$j]=$sub;
	$j++;
    }
    $n=0;
    open(JAK,">>$file2");
    print JAK"$ab[0] ";
    for($c=0;$c<@nt;$c++)
    {
	$b=$nt[$c];
	    $n++;
	    print JAK"$n:";
	    $count=0;
	    
	    for($h=0;$h<@aa;$h++)
	    {
		if($b eq $aa[$h])
		{
		    $count++;		       
		}
	    }
	    $monocomp=($count/$len)*100;
	    printf JAK"%6.4f ",$monocomp;	
    }
    print JAK"\n";
    @aa="";
    $j=0;
}

