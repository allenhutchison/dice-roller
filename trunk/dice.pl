#!/usr/bin/perl

use Storable;

my $file = "~/.dice";
my %stats1;
my %stats2;

my %stats;

print "Dice:> ";

while(<>) {
	if ($_ =~ /r/i) {
		my $rnd1 = int(rand(6)) + 1;
		my $rnd2 = int(rand(6)) + 1;
		$stats{'rolls'}{'sums'}{($rnd1 + $rnd2)}++;
		$stats{'rolls'}{'combos'}{"$rnd1 x $rnd2"}++;
		print "$rnd1 and $rnd2 = ", $rnd1 + $rnd2, "\n\n";
	} elsif (/s/i) {
		foreach my $key (sort {$a <=> $b} (keys(%{$stats{'rolls'}{'sums'}}))) {
			print "$key: $stats{'rolls'}{'sums'}{$key}\n";
		}
		foreach my $key (sort(keys(%stats2))) {
			print "$key: $stats2{$key}\n";
		}
	}
	print "Dice:> ";
}
