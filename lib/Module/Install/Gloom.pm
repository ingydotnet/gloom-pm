package Module::Install::Gloom;
use strict;
use warnings;

use Module::Install::Base;

use vars qw(@ISA);
BEGIN { @ISA = 'Module::Install::Base' }

sub use_gloom {
    my $self = shift;
    my $target = shift
        or die "use_gloom requires the name of a target module";
    $target =~ s/::/\//g;
    $target = "lib/$target.pm";
    my $gloom_path = $self->admin->find_in_inc('Gloom') or return;
    $self->admin->copy($gloom_path => $target);
}

1;

=encoding utf8

=head1 NAME

Module::Install::TestML - Module::Install Support for Gloom

=head1 SYNOPSIS

    use inc::Module::Install;

    name     'Foo';
    all_from 'lib/Foo.pm';

    use_gloom 'Foo::OO';

    WriteAll;

=head1 DESCRIPTION

This module copies Gloom.pm as your module distibution's OO base module.
See L<Gloom::Doc> for full details.

Now you can get full Gloom OO support for your module with no external
dependency on Gloom.

Just add this line to your Makefile.PL:

    use_gloom 'Your::Module::OO';

That's it. Really. Now Gloom is bundled into your module under the
name C<Your::Module::OO>, there is no burden on the person installing
your module.

=head1 AUTHOR

Ingy döt Net <ingy@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2010. Ingy döt Net.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
