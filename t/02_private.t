use strict;
use warnings;
use Test::More;

use App::cal;

subtest 'month name' => sub {
    my @monthes = qw/Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec/;
    for my $i (1..12) {
        is App::cal::_month_name($i), $monthes[$i-1];
    }
};

subtest 'year calendar' => sub {
    my $app = App::cal->new;

    $app->{year} = 2013;
    my @cals = $app->_get_colored_cal_year;
    is scalar(@cals), 12;
};

subtest 'validate' => sub {
    my $app = App::cal->new;

    eval {
        $app->{year} = -1;
        $app->_validate;
    };
    like $@, qr/option should >= 0/;

    for my $invalid_month (0, 13) {
        eval {
            $app->{year} = 2013;
            $app->{month} = $invalid_month;
            $app->_validate;
        };
        like $@, qr/Invalid month/;
    }
};

done_testing;
