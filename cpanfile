requires 'Calendar::Simple';
requires 'Calendar::Japanese::Holiday';
requires 'Calendar::MoreUtils';
requires 'Encode::Locale';

on test => sub {
    requires 'Test::More', 0.98;
};

on configure => sub {
};

on 'develop' => sub {
};
