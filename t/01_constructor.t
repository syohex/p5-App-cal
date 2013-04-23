use strict;
use warnings;
use Test::More;

use App::cal;

subtest 'constructor' => sub {
    my $app = App::cal->new;
    ok $app;
    isa_ok $app, 'App::cal';
    is $app->{show_year}, 0;
};

done_testing;
