# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl RtM.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 4;
BEGIN { use_ok('RtM') };

#########################

use RtM;
my $tested = RtM->new();

can_ok('RtM', 'getPortCount', 'getPortName');

# Testing a number of MIDI port
my $count = undef;
$count = $tested->getPortCount();
ok( defined $count );
#is( $count, 0 );


SKIP:{
	if( $count == 0 ){
		skip("MIDI device is not connected.", 1);
	}
	# Testing the name of MIDI port
	my $name = undef;
	$name = $tested->getPortName($count-1);
	ok( defined $name, "PortName: $name" );
}

done_testing();

