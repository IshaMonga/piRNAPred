#!/usr/bin/perl

$file =$ARGV[0];
open(FP,"$file");
while ($line=<FP>){
   chomp($line);
   $seq[$i] = $line;
   $i++;
}
   for ($i=0;$i<@seq;$i++){
    $n=$i;
    if ($n>9){
	$n= $n%10;
    }
    if ($n==0){
    open (FP, ">>set1");
    print FP "$seq[$i]\n";
}     
    if ($n==1){
    open (FP1, ">>set2");
    print FP1 "$seq[$i]\n";
}
    if ($n==2){
    open (FP2, ">>set3");
    print FP2 "$seq[$i]\n";
}
    if ($n==3){
    open (FP3, ">>set4");
    print FP3 "$seq[$i]\n";
}
    if ($n==4){
    open (FP4, ">>set5");
    print FP4 "$seq[$i]\n";
} 
############
    if ($n==5){
    open (FP5, ">>set6");
    print FP5 "$seq[$i]\n";
} 
    if ($n==6){
    open (FP6, ">>set7");
    print FP6 "$seq[$i]\n";
} 
    if ($n==7){
    open (FP7, ">>set8");
    print FP7 "$seq[$i]\n";
} 
    if ($n==8){
    open (FP8, ">>set9");
    print FP8 "$seq[$i]\n";
} 
    if ($n==9){
    open (FP9, ">>set10");
    print FP9 "$seq[$i]\n";
} 
##############

}
