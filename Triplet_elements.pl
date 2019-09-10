#!/usr/bin/perl

############################################################################
# AUTHOR:  	Monga.I, mongaisha@imtech.res.in                                                                       #
# DATE:		28/09/2016                                                                                                          #
# FILENAME: Triplet_SVM.pl                                                                                                         #
# DESCRIPTION: Generate triplet elements from RNA secondary strcuture                                #
#				                                                                                                                     #
# USAGE:	perl Triplet_SVM.pl  < <input file in .tsv_format> > <output file>                      #
#                                                                                                                                                  #
###########################################################################


$input_file_1 = $ARGV[0];
open(IN_1, "$input_file_1")
or die "can't open the input file : $!";
$output_file = $ARGV[1];
open OUT_1, ">$output_file"
or die "Can not open $output_file : $!";
my $usage = "USAGE:	perl Triplet_SVM.pl  < <input file in RNAfold_format> > <output file> \n";

@lines=<IN_1>;
$lines_count=$#lines;
print $lines_count;

for($count=0;$count<=$lines_count;$count++)
{   
                    @triple_element_countNum=(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    
                     @each_line=split("\t",$lines[$count]);
    
                         @header_array=$each_line[0];
    
      
    print OUT_1 "@header_array\n";
    
    $len_sequence=length $each_line[1];
    @sequence_array=split('',$each_line[1]);
    #print OUT_1 "$each_line[1]\n";
    
    $symbol_dotBracket=$each_line[2];
    #print OUT_1 "$symbol_dotBracket";
	$symbol=$symbol_dotBracket;
    #$symbol=~tr/[.()]/[011]/;  print "$symbol,,,,";
	$symbol =~ tr/.()/011/; #print OUT_1 "$symbol";

    $len_symbol=length $symbol;
    @symbol_array=split('',$symbol);
    


    
    for($i=1; $i<$len_sequence; $i++)
    {
        #print  OUT_1 "$i\n";
        @Len=$i;
        
        foreach $i (@Len)
        {#
            #print  OUT_1 "$i\n";
            
            
            for($j=0; $j<($len_symbol-1); $j++)
            
            {
                if ($i==$j)
                {
                    
                    
                    push @triple_element_Query,$sequence_array[$i],$symbol_array[$j-1],$symbol_array[$j],$symbol_array[$j+1];  ##here,one triple-element is 4variables;so better to put-it in array.
                    
                    #print OUT_1 "@triple_element_Query\n";     ###printing triplet-element of query seqeunce in array space separated:A ( ( ( #
                    
                    
                    $triple_element = join('',@triple_element_Query);
                    #print OUT_1 "$triple_element\n";  ###printing triplet-element without space e.g. A(((#

                    @triple_element_feature=("A111","A110","A101","A011","A100","A010","A001","A000","C111","C110","C101","C011","C100","C010","C001","C000","U111","U110","U101","U011","U100","U010","U001","U000","G111","G110","G101","G011","G100","G010","G001","G000");
                   
                    #print OUT_1 "@triple_element_feature\n";   ###printing 32 triplet-elements
                    
                    
                    for($a=0; $a<32; $a++)
                    {
                           #$op++;
                        
                        
                        if ($triple_element_feature[$a] =~ /$triple_element/)
                            
                        {
                            
                            
                            
                            
                            $triple_element_countNum[$a]++;
                        }
                        
                    }
                    
                    
                }
                @triple_element_Query="";
               
            }
        }
        
        
        
        
        
    }
    
    
 print OUT_1"@triple_element_countNum\n";    #printing triple element count#
 
$k=0;
for ($n=1;$n<=$#triple_element_countNum+1;$n++)
{

print OUT_1"$n:$triple_element_countNum[$k] ";
$k++
}
print OUT_1"\n";
}



#print OUT_1 "\n\n\n\n $op \n\n\n\n";








