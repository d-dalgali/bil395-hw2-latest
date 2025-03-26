#!/usr/bin/perl
use strict;
use warnings;

my %variables;

print "Hesap Makinesi (Perl)\nÇıkmak için Ctrl+D\n\n";

while (1) {
    print "> ";
    my $input = <STDIN>;
    last unless defined $input;
    chomp($input);
    $input =~ s/^\s+|\s+$//g;
    next if $input eq '';

    eval {
        if ($input =~ /^([a-zA-Z_]\w*)\s*=\s*(.+)$/) {
            my ($var, $expr) = ($1, $2);
            my $evaluated = evaluate($expr);
            if (defined $evaluated) {
                $variables{$var} = $evaluated;
                print "$var = $evaluated\n";
            }
        } else {
            my $result = evaluate($input);
            print "Sonuç: $result\n" if defined $result;
        }
    };
    if ($@) {
        print "Hata: $@";
    }
}

sub evaluate {
    my ($expr) = @_;

    # Tanımsız değişken kontrolü
    $expr =~ s/([a-zA-Z_]\w*)/
        exists $variables{$1}
            ? "($variables{$1})"
            : die "Tanımsız değişken: $1\n"
/ge;

    # Sadece izinli karakterler olmalı
    if ($expr !~ /^[\d+\-*\/().\s]+$/) {
        die "Geçersiz karakter tespit edildi!\n";
    }

    # Parantez kontrolü
    my $open = () = $expr =~ /\(/g;
    my $close = () = $expr =~ /\)/g;
    if ($open != $close) {
        die "Parantez hatası: Eşleşmeyen '(' ve ')' sayısı!\n";
    }

    my $result = eval $expr;

    if ($@ =~ /division by zero/i) {
        die "Sıfıra bölme hatası!\n";
    }
    if (!defined $result || $@) {
        die "İfade hatalı veya eksik!\n";
    }

    return $result;
}
