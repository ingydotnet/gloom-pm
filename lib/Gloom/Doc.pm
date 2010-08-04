=encoding utf-8

=head1 NAME

Gloom::Doc - All About Gloom (the Great Little OO Module)

=head1 SYNOPSIS

    package MyModule::OO;
    do 'MyModule/Gloom.pm';

and:

    package MyModule::Foo;
    use MyModule::OO -base;

and:

    package MyModule::

=head1 DESCRIPTION

Gloom is a very small OO module that can be used by CPAN modules that
need to be OO, but don't want to add a dependency module to do it.

Gloom provides single inheritance, standard C<new> and C<init> constructor
methods, and C<has> attribute accessors. It also turns on C<strict> and
C<warnings> automatically.

Gloom is cascading. In other words, using Gloom as a base class for
class C<Foo>, enables C<Foo> to later be used as a Gloomy base class.
Using the C<-base> syntax invokes all the Gloom functionality.

=head2 Accessors

Gloom takes its C<has> accessors from Class::Field, so they are not
Moose replicas. They are always read/write. They provide an optional
default value as well as an optional initialization code snippet.

    package Foo;
    use Bar -base;

    has 'this';
    has 'that' => {};    # Defaults to a hash;
    has 'thus', -init => '$self->set_thus';

=head1 HOWTO

If I have an OO CPAN module called Foo, I symlink lib/Foo/Gloom.pm to
the Gloom.pm in the Gloom repository (see below). (When you make a tarball, Perl
turns the symlink into a copied real file.)

Then I create a module called Foo::Base that looks like this:

    package Foo::Base;
    do 'Foo/Gloom.pm';

That's it. Now I can make Foo::Bar OO like this:

    package Foo::Bar;
    use Foo::Base -base;
    has 'stuff';

and:

    package Foo::Bar::Baz;
    use Foo::Bar -base;
    has 'more_stuff';

=head1 WHY DO?

You don't I<use> Gloom, you I<do> it. Gloom.pm has no package statement.
Perl's C<do> command will still find it in the C<@ISA> path, but it will
eval the code under your package.

=head1 REPOSITORY

L<http://github.com/ingydotnet/gloom-pm>

If you use the symlink trick, you'll probably want to checkout this repo
next to you other repos.

=head1 AUTHOR

Ingy döt Net <ingy@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2010. Ingy döt Net.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See http://www.perl.com/perl/misc/Artistic.html

=cut
