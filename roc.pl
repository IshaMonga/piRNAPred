#os2 <- read.csv("/tmp/roc_int",header=F,sep="\t") 
#pred3 <- prediction(os2[2], os2[1])
#perf3 <- performance(pred3,"tpr","fpr")
#auc3=slot((performance(pred3, 'auc')),"y.values")
$ores=$ARGV[0];
$list=$ARGV[1];
open(LIST,$list);
@list=<LIST>;
close LIST;
$num=0;
open(R,">ROC.R");

print R "library(ROCR)\n";
print R "plot_file<-\"ROC.jpeg\"\n";
print R "jpeg(plot_file)\n";
@colo=("RED","green","blue");
undef @st1,@st2,@st3,@st4;
foreach $line(@list){
$num++;
$name="R$num";
chomp($line);
system "paste $ores $line>$line.ROC";
print R "$name\d <- read.csv(\"$line.ROC\",header=F,sep=\"\t\")\n";
print R "PRED$num <- prediction($name\d[2], $name\d[1])\n";
print R "PREF$num <- performance(PRED$num,\"tpr\",\"fpr\")\n";
print R "AUC$num=slot((performance(PRED$num, 'auc')),\"y.values\")\n";
$st1[$num-1]="0.6";
$st2[$num-1]="AUC$num";
$st3[$num-1]="\"$colo[$num-1]\"";
$st4[$num-1]="\"$line \"";
if($num eq 1){
print R "plot(PREF$num,col=\"$colo[$num-1]\")\n";
}
else{print R "plot(PREF$num,col=\"$colo[$num-1]\",add=T)\n";}

}
$j1=$j2=$j3=$j4='';
$j1=join(",",@st1);$j2=join(",",@st2);$j3=join(",",@st3);
$j4=join(",",@st4);
print R "legend(0.6,0.6,c($j2),col=c($j3),lwd=3)\n";
print R "legend(0.1,0.1,c($j4),col=c($j3),lwd=3)\n";
print R "dev.off()\n";
close R;
  system "R CMD BATCH ROC.R";