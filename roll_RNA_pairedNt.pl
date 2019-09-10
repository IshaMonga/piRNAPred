#!/usr/bin/perl 

use Getopt::Std;
getopts('i:o:');
$file1=$opt_i;
$file2=$opt_o;

if($opt_i eq '' || $opt_o eq '' )
	{

	print "USAGE: roll_RNA_pairedNT.pl -i <sequence file in SVM format> -o <output file>";
    	exit();
	}

@thermo_pair_element=("AA","AC","AG","AU","CA","CC","CG","CU","GA","GC","GG","GU","UA","UC","UG","UU" );

@energies=("7","4.8","8.5","7.1","9.9","8.7","12.1","8.5","9.4","6.1","12.1","4.8","10.7","9.4","9.9","7");


open(OUT_1,">>$file2");
system "chmod 644 $file2";

open(IN_1,"$file1");

@input_file=<IN_1>;

for ($i=0; $i<scalar(@input_file); $i++)

{
chomp($input_file[$i]);

#print ID "\n$input_file[$i]/";

	@input_lines = split(" ",$input_file[$i]);

chomp(@input_lines[0]);
chomp(@input_lines[1]);

	$score=@input_lines[0];
	$seq=@input_lines[1];

$seq=~s/\r//g;

$miRNA=uc($seq);

#print $miRNA;
$len=length $miRNA;
#print $len;
#$j=0;

for($a=0;$a<$len-1;$a++)
    {

	$paired_dint=substr($miRNA, $a, 2);
	
	@dint_array[$a]=$paired_dint;

	}

#print @dint_array,"\n";
$length=@dint_array;
#print $length,"\n";

@f_energy="";

for($k=0;$k<16;$k++)
{
	chomp($thermo_pair_element[$k]);
	#print $thermo_pair_element[$k],"\n";
	
	$c1=0;

	for ($p=0;$p<$length;$p++)
	{
		
	if ($dint_array[$p] eq $thermo_pair_element[$k])
		{
			$c1=$c1+1;
		}
	}	
	#print $c1;                                 ####printing total dint_count
	$finalE=$energies[$k]*$c1;
	@f_energy[$k]=$finalE;
}

print OUT_1 "$score ";

$n=16;
for ($q=0; $q<16; $q++)

	{
         $n++;
	chomp($f_energy[$q]);

	print OUT_1 "$n:$f_energy[$q]";

	if ($q != 15)
	{ print OUT_1 " ";}

	}	
	print OUT_1 "\n";
}
