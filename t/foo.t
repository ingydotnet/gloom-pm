use Test::More tests => 1;
use lib 't';
use Foo::Bar;

my $o = Foo::Bar->new(this => 'Gloomy');

is $o->this, 'Gloomy', 'this is Gloomy';
