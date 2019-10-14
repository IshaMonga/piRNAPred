#!/usr/bin/perl

open(MAP,">>RESULT");
print MAP "\t \t Pr-cor\tcof-R2\tRMSE\tMAE\n";

#@cc=qw(0.0001 0.0005 0.001 0.002 0.003 0.004 0.005 0.006 0.007 0.008 0.009 0.01 0.02 0.05 0.1 0.2 0.5 1 5 10 20 50 100 200 500);
#@cc=qw(0.0015 0.0018 0.0019 0.002 0.0021 0.0022 0.0023 0.0025 0.0028 0.003 0.0035 0.004 0.0045 0.005);

#@dd=qw(1 2 2.5 2.8 3 3.2 3.5 3.8 4 4.2 4.5 5 6 7 8 9 10 11 12 13 14 15); 
#@dd=qw(1 2 2.5 2.8 3 3.2 3.4 3.6 3.8 4 4.2 4.4 4.6 4.8 5 5.2 5.4 5.6); 

@gg=qw(0.0001 0.0003 0.0005 0.0008 0.001 0.003 0.005 0.008 0.01 0.05 0.1 0.5 1 5);
#@gg=qw(0.0001 0.00015 0.0002 0.0003 0.0004 0.0005 0.0006 0.0007 0.0008 0.0009 0.001 0.002 0.003 0.004 0.005 0.006 0.007 0.008 0.009 0.01 0.02 0.05 0.1);

#@gg=qw(0.0001 0.0005 0.0008 0.001 0.002 0.0025 0.0028 0.003 0.0032 0.0035 0.0038 0.004 0.0042 0.0045 0.005 0.006);
@cc=qw(0.001 0.005 0.01 0.05 0.1 0.5 1  10 50 100 150 200 250 300);
#@gg=qw(0.001 0.1);
#@cc=qw(1);
#@jj=qw(0.8 0.9 1 1.1 1.2);


#for($y=0;$y<@cc;$y++){
#for($y1=0;$y1<@dd;$y1++){
for($y2=0;$y2<@gg;$y2++){
for($y3=0;$y3<@cc;$y3++){
#for($y4=0;$y4<@jj;$y4++){
    for($num=1;$num<11;$num++)
    {	
	#system "./svm_learn -z c -t 0 -c $cc[$y] train_$num.pat model_$num";
        #system "./svm_learn -z c -t 1 -d $dd[$y1] train_$num.pat model_$num";
        #system "./svm_learn -z c -t 2 -g $gg[$y2] train_$num.pat model_$num";
        #system "./svm_learn -z c -t 2 -c $cc[$y3] train_$num.pat model_$num";
	#system "./svm_learn -z c -t 2 -j $jj[$y4] train_$num.pat model_$num";
        #system "./svm_learn -z c -t 2 -g $gg[$y2] -c $cc[$y3] train_$num.pat model_$num";
        system "/home/mongaisha/svm_light_linux64/svm_learn -z r -t 2 -g $gg[$y2] -c $cc[$y3]  train_$num.pat model_$num";
	system "/home/mongaisha/svm_light_linux64/svm_classify test_$num.pat model_$num out_$num";
	system "cat out_$num >> observed_data";
	system "cut -d ' ' -f 1 test_$num.pat >>actual";
	system "rm model_$num out_$num";
    }
	system "paste -d , actual observed_data > act-pred";
	#print MAP  "g $gg[$y2]   c  $cc[$y3]  \t";
	print MAP  "g=$gg[$y2]\tc=$cc[$y3]\t";
	system "perl /home/mongaisha/act-pred-processing.pl RESULT";
	#system "perl /media/mongaisha/avppred2/correl_sirna.pl observed_data actual";
	#open(MAJ,">>RESULT");
	#print MAJ"-------linear kernel----------------c=$cc[$y]---------\n";
	#print MAJ"-------polynomial kernel------------d=$dd[$y1]--------\n";
        #print MAJ"-------RBF kernel-------------------G=$gg[$y2]--------\n";
        #print MAJ"-------RBF kernel-------------------C=$cc[$y3]--------\n";
	#print MAJ"-------RBF kernel-------------------J=$jj[$y4]--------\n";
        #print MAJ"-------RBF kernel-----G=$gg[$y2]-----C=$cc[$y3]--------\n";
        #print MAJ"-------RBF kernel-----G=$gg[$y2]-----C=$cc[$y3]-----J=$jj[$y4]-----\n";
        #close MAJ;
    
    #system "/home/isha/isha_sirna_pred/svmc_accuracy_sirna.pl";
    system "rm observed_data actual ";	
}
}

