#!/usr/bin/perl -w
use strict;
use 5.012;
use File::Basename;
use Cwd qw [abs_path];
use Data::Printer;

my $usage = <<USAGE;

SYSNOPSIS
hicpro_summary.pl V1.1, written by corephi

This program is used to summarize hic

----------------------------------------------------------
More scripts? Join "bioinformatics*CN" QQ group: 276151571
If you have any probel or suggestions about this program, 
please mail to: hpyu\@genetics.ac.cn
----------------------------------------------------------

hicpro_summary.pl [options] hic_folder

   
USAGE
my $hic_folder = abs_path( $ARGV[0] );

my $data_folder = $hic_folder . "/hic_results/data";
print $data_folder,"\n";

#####get the sample names
opendir( my $data_dh, $data_folder ) || die "Can't opendir $data_folder: $!";
my @samples = grep { !/^\./ && -d "$data_folder/$_" } readdir $data_dh;

#####read the total pairs

my %data = ();
foreach my $sample (@samples) {
    my $mapping_folder = "$hic_folder/bowtie_results/bwt2/$sample";
    my @mapping_files  = glob "$mapping_folder/*.pairstat";
    my $mapping_file   = shift @mapping_files;

    open my $mapping_fh, "<", $mapping_file;
    while (<$mapping_fh>) {
        $data{$sample}{Total_pairs_processed} = $1
          if /Total_pairs_processed\s+(\d+)\s+/;
        $data{$sample}{Reported_pairs} = $1 if /Reported_pairs\s+(\d+)\s+/;
        $data{$sample}{Unique_paired_alignments} = $1
          if /Unique_paired_alignments\s+(\d+)\s+/;
        $data{$sample}{Multiple_pairs_alignments} = $1
          if /Multiple_pairs_alignments\s+(\d+)\s+/;
        $data{$sample}{Pairs_with_singleton} = $1
          if /Pairs_with_singleton\s+(\d+)\s+/;
    }
}

#####read the valid pairs
foreach my $sample (@samples) {
    my @hic_files  = glob "$hic_folder/hic_results/stats/$sample/*.mergestat";
   # print join ("\t",@hic_files),"\n";
    my $mapping_file = shift @hic_files;
    #print $sample,"\n";
    open my $mapping_fh, "<", $mapping_file;
    while (<$mapping_fh>) {
        $data{$sample}{valid_interaction_rmdup} = $1
          if /valid_interaction_rmdup\s+(\d+)\s+/;
        $data{$sample}{trans_interaction} = $1
          if /trans_interaction\s+(\d+)\s+/;
        $data{$sample}{cis_interaction} = $1 if /cis_interaction\s+(\d+)\s+/;
        $data{$sample}{cis_shortRange}  = $1 if /cis_shortRange\s+(\d+)\s+/;
        $data{$sample}{cis_longRange}   = $1 if /cis_longRange\s+(\d+)\s+/;
    }
}

foreach my $sample (@samples) {
    my @hic_files    = glob "$hic_folder/hic_results/stats/$sample/*.mRSstat";
    my $mapping_file = shift @hic_files;

    open my $mapping_fh, "<", $mapping_file;
    while (<$mapping_fh>) {
        $data{$sample}{Valid_interaction_pairs} = $1
          if /Valid_interaction_pairs\s+(\d+)\s+/;
        $data{$sample}{Valid_interaction_pairs_FF} = $1
          if /Valid_interaction_pairs_FF\s+(\d+)\s+/;
        $data{$sample}{Valid_interaction_pairs_RR} = $1
          if /Valid_interaction_pairs_RR\s+(\d+)\s+/;
        $data{$sample}{Valid_interaction_pairs_RF} = $1
          if /Valid_interaction_pairs_RF\s+(\d+)\s+/;
        $data{$sample}{Valid_interaction_pairs_FR} = $1
          if /Valid_interaction_pairs_FR\s+(\d+)\s+/;
        $data{$sample}{Valid_interaction_pairs} = $1
          if /Valid_interaction_pairs\s+(\d+)\s+/;
        $data{$sample}{Dangling_end_pairs} = $1
          if /Dangling_end_pairs\s+(\d+)\s+/;
        $data{$sample}{Religation_pairs} = $1 if /Religation_pairs\s+(\d+)\s+/;
        $data{$sample}{Self_Cycle_pairs} = $1 if /Self_Cycle_pairs\s+(\d+)\s+/;
        $data{$sample}{Dumped_pairs}     = $1 if /Dumped_pairs\s+(\d+)\s+/;
        $data{$sample}{Single_end_pairs} = $1 if /Single-end_pairs\s+(\d+)\s+/;
    }
}

my @mapping_info =
  qw(Total_pairs_processed Unique_paired_alignments Multiple_pairs_alignments Pairs_with_singleton Reported_pairs);
my @interaction_info =
  qw(trans_interaction cis_interaction cis_shortRange cis_longRange  valid_interaction_rmdup);
my @validation_info =
  qw(Dangling_end_pairs Religation_pairs Self_Cycle_pairs Dumped_pairs Single-end_pairs  Valid_interaction_pairs);

print
"SampleName\tTotalPairs\tReportedPairs\tRepotedRatio\tValidInteractionPairs\tFF\tRR\tRF\tFR\tLigationEfficiency\tValidRMDUP\tPCRDuplicationRatio\tLongIntraInteraction\tLongIntraRatio\tcis_interaction\tInterInteraction\tInterRatio\tLibraryEfficiency\n";
foreach my $sample (@samples) {
    my $total        = $data{$sample}{Total_pairs_processed};
    my $report       = $data{$sample}{Reported_pairs};
    my $report_ratio = sprintf "%0.2f%%", $report / $total * 100;

    my $valid               = $data{$sample}{Valid_interaction_pairs};
    my $ff                  = $data{$sample}{Valid_interaction_pairs_FF};
    my $rr                  = $data{$sample}{Valid_interaction_pairs_RR};
    my $rf                  = $data{$sample}{Valid_interaction_pairs_RF};
    my $fr                  = $data{$sample}{Valid_interaction_pairs_FR};
    my $ligation_efficiency = sprintf "%0.2f%%", $valid / $report * 100;

    my $valid_rmdup = $data{$sample}{valid_interaction_rmdup};
    my $pcr_ratio = sprintf "%0.2f%%", ( 1 - $valid_rmdup / $valid ) * 100;

    my $intra = $data{$sample}{cis_longRange};
    my $intra_ratio = sprintf "%0.2f%%", $intra / $valid_rmdup * 100;

    my $cis = $data{$sample}{cis_interaction};
    
    my $trans = $data{$sample}{trans_interaction};
    my $trans_ratio = sprintf "%0.2f%%", $trans / $valid_rmdup * 100;
    
    my $library_efficiency = sprintf "%0.2f%%", $valid_rmdup / $total * 100;

    print
"$sample\t$total\t$report\t$report_ratio\t$valid\t$ff\t$rr\t$rf\t$fr\t$ligation_efficiency\t$valid_rmdup\t$pcr_ratio\t$intra\t$intra_ratio\t$cis\t$trans\t$trans_ratio\t$library_efficiency\n";

}

print "Note:\n";
print "FF:RR:RF:FR ~= 1:1:1:1\n";
print "LongIntraRatio > 40%\n";

