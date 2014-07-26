use 5.008003;
package Module::Install::Gloom;
use strict;
use warnings;

use Module::Install::Base;

use base 'Module::Install::Base';
our $VERSION = '0.18';
our $AUTHOR_ONLY = 1;

sub use_gloom {
    my $self = shift;
    my $module = shift
        or die "use_gloom requires the name of a target module";

    return unless $self->is_admin;

    my $gloom_path = $self->admin->find_in_inc('Gloom') or return;
    open IN, $gloom_path or die "Can't open '$gloom_path' for input";
    my $code = do { local $/; <IN> };
    close IN;

    $code =~ s/package Gloom;/package $module;/;

    my $target = $module;
    $target =~ s/::/\//g;
    $target = "lib/$target.pm";
    open OUT, '>', $target or die "Can't open '$target' for output";
    print OUT $code;
    close OUT;
}

1;

=encoding utf8

=head1 NAME

Module::Install::Gloom - Module::Install Support for Gloom

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
