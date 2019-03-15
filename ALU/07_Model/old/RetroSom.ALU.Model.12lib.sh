module load samtools
module load exonerate
module load bcftools
module load bedtools

Retro=$3
sub=$1\_Model
sub2=$1$7
echo $1  ### subject ID ###
echo $2  ### path ###
echo $Retro ### output folder ###
echo $4  ### reference genome hg19 G37 hg38... ###
echo $5  ### filter level:0=no filter, 1=prefilter, 2=allfilters ### 
TE=ALU

masterpath=/home/xwzhu/levinson/RetroSom
mkdir $2/$sub
#rm -r $2/$sub/$Retro
mkdir $2/$sub/$Retro
mkdir $2/$sub/$Retro/$TE

### combine 6 invidual libraries ###
### combine SR support reads ###
awk '$5="lib1_"$5' OFS='\t' $8/$sub2\1/retro_v42_$6/$TE/$sub2\1.sr.pred.posreads > $2/$sub/$Retro/sr1.txt
awk '$5="lib2_"$5' OFS='\t' $8/$sub2\2/retro_v42_$6/$TE/$sub2\2.sr.pred.posreads > $2/$sub/$Retro/sr2.txt
awk '$5="lib3_"$5' OFS='\t' $8/$sub2\3/retro_v42_$6/$TE/$sub2\3.sr.pred.posreads > $2/$sub/$Retro/sr3.txt
awk '$5="lib4_"$5' OFS='\t' $8/$sub2\4/retro_v42_$6/$TE/$sub2\4.sr.pred.posreads > $2/$sub/$Retro/sr4.txt
awk '$5="lib5_"$5' OFS='\t' $8/$sub2\5/retro_v42_$6/$TE/$sub2\5.sr.pred.posreads > $2/$sub/$Retro/sr5.txt
awk '$5="lib6_"$5' OFS='\t' $8/$sub2\6/retro_v42_$6/$TE/$sub2\6.sr.pred.posreads > $2/$sub/$Retro/sr6.txt

awk '$5="lib1_"$5' OFS='\t' $2/$sub2\9/$Retro/$TE/$sub2\9.sr.pred.posreads > $2/$sub/$Retro/sr9.txt
awk '$5="lib2_"$5' OFS='\t' $2/$sub2\10/$Retro/$TE/$sub2\10.sr.pred.posreads > $2/$sub/$Retro/sr10.txt
awk '$5="lib3_"$5' OFS='\t' $2/$sub2\11/$Retro/$TE/$sub2\11.sr.pred.posreads > $2/$sub/$Retro/sr11.txt
awk '$5="lib4_"$5' OFS='\t' $2/$sub2\12/$Retro/$TE/$sub2\12.sr.pred.posreads > $2/$sub/$Retro/sr12.txt
awk '$5="lib5_"$5' OFS='\t' $2/$sub2\13/$Retro/$TE/$sub2\13.sr.pred.posreads > $2/$sub/$Retro/sr13.txt
awk '$5="lib6_"$5' OFS='\t' $2/$sub2\14/$Retro/$TE/$sub2\14.sr.pred.posreads > $2/$sub/$Retro/sr14.txt
cat $2/$sub/$Retro/sr1.txt \
    $2/$sub/$Retro/sr2.txt \
    $2/$sub/$Retro/sr3.txt \
    $2/$sub/$Retro/sr4.txt \
    $2/$sub/$Retro/sr5.txt \
    $2/$sub/$Retro/sr6.txt \
    $2/$sub/$Retro/sr9.txt \
    $2/$sub/$Retro/sr10.txt \
    $2/$sub/$Retro/sr11.txt \
    $2/$sub/$Retro/sr12.txt \
    $2/$sub/$Retro/sr13.txt \
    $2/$sub/$Retro/sr14.txt \
    > $2/$sub/$Retro/srall.txt
cp $2/$sub/$Retro/srall.txt $2/$sub/$Retro/$sub.$TE.sr.tabe.discover
rm $2/$sub/$Retro/sr*.txt

### combine the PE reads ###
awk '$5="lib1_"$5' OFS='\t' $8/$sub2\1/retro_v42_$6/$TE/$sub2\1.pe.pred.posreads > $2/$sub/$Retro/pe1.txt
awk '$5="lib2_"$5' OFS='\t' $8/$sub2\2/retro_v42_$6/$TE/$sub2\2.pe.pred.posreads > $2/$sub/$Retro/pe2.txt
awk '$5="lib3_"$5' OFS='\t' $8/$sub2\3/retro_v42_$6/$TE/$sub2\3.pe.pred.posreads > $2/$sub/$Retro/pe3.txt
awk '$5="lib4_"$5' OFS='\t' $8/$sub2\4/retro_v42_$6/$TE/$sub2\4.pe.pred.posreads > $2/$sub/$Retro/pe4.txt
awk '$5="lib5_"$5' OFS='\t' $8/$sub2\5/retro_v42_$6/$TE/$sub2\5.pe.pred.posreads > $2/$sub/$Retro/pe5.txt
awk '$5="lib6_"$5' OFS='\t' $8/$sub2\6/retro_v42_$6/$TE/$sub2\6.pe.pred.posreads > $2/$sub/$Retro/pe6.txt

awk '$5="lib1_"$5' OFS='\t' $2/$sub2\9/$Retro/$TE/$sub2\9.pe.pred.posreads > $2/$sub/$Retro/pe9.txt
awk '$5="lib2_"$5' OFS='\t' $2/$sub2\10/$Retro/$TE/$sub2\10.pe.pred.posreads > $2/$sub/$Retro/pe10.txt
awk '$5="lib3_"$5' OFS='\t' $2/$sub2\11/$Retro/$TE/$sub2\11.pe.pred.posreads > $2/$sub/$Retro/pe11.txt
awk '$5="lib4_"$5' OFS='\t' $2/$sub2\12/$Retro/$TE/$sub2\12.pe.pred.posreads > $2/$sub/$Retro/pe12.txt
awk '$5="lib5_"$5' OFS='\t' $2/$sub2\13/$Retro/$TE/$sub2\13.pe.pred.posreads > $2/$sub/$Retro/pe13.txt
awk '$5="lib6_"$5' OFS='\t' $2/$sub2\14/$Retro/$TE/$sub2\14.pe.pred.posreads > $2/$sub/$Retro/pe14.txt
cat $2/$sub/$Retro/pe1.txt \
    $2/$sub/$Retro/pe2.txt \
    $2/$sub/$Retro/pe3.txt \
    $2/$sub/$Retro/pe4.txt \
    $2/$sub/$Retro/pe5.txt \
    $2/$sub/$Retro/pe6.txt \
    $2/$sub/$Retro/pe9.txt \
    $2/$sub/$Retro/pe10.txt \
    $2/$sub/$Retro/pe11.txt \
    $2/$sub/$Retro/pe12.txt \
    $2/$sub/$Retro/pe13.txt \
    $2/$sub/$Retro/pe14.txt \
    > $2/$sub/$Retro/peall.txt
cp $2/$sub/$Retro/peall.txt $2/$sub/$Retro/$TE/$sub.$TE.novel.sites
rm $2/$sub/$Retro/pe*.txt

### make calls ###
grep -a Alu $2/$sub/$Retro/$sub.$TE.sr.tabe.discover | grep 'OK' | \
   awk '{print $1"\t"$2"\t"$3"\t"$5}' | sort -u | \
   sort -k1,1 -k2,3n | \
   mergeBed -d 40 -c 4 -o distinct -delim ";" \
   -i stdin | \
   awk '{split ($4, num, ";"); print $1"\t"$2"\t"$3"\tsr,"length(num)","$4}' \
   > $2/$sub/$Retro/$TE/$sub.$TE.SR.calls

### PE calling ###
### Alu PE calls ###
$masterpath/utls/06_ana_depth.pl $sub $2/$sub $Retro $TE
mv $2/$sub/$Retro/$TE/$sub.$TE.PE.calls $2/$sub/$Retro/$TE/$sub.$TE.PE.nodup.calls
$masterpath/utls/08_refine_depth.pl $sub $2/$sub $Retro $TE

### combine SR and PE ###
date '+%m/%d/%y %H:%M:%S'
echo "Calling PE phase ... Combine SR and PE"
$masterpath/utls/09_merge.SR.PE.support.sh $sub $2/$sub $Retro $TE

windowBed \
   -w 100 -v \
   -a $2/$sub/$Retro/$TE/$sub.$TE.SR.PE.calls \
   -b $masterpath/refTE/position/$4.fa_ALU_$6.bed \
   > $2/$sub/$Retro/$TE/$sub.$TE.novel.calls
