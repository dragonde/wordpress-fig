#!/usr/bin/perl -w

use strict;
use POSIX qw(strftime);


# Definición de Constantes
# Nombre de Cabecera, a buscar dragonde o mysql 

my $headname='dragonde|mysql';
my $segment='gs://vux';


my $datestring = strftime "%y%m%d-%H%M", localtime;

print "Iniciando Backup de Imagenes Docker";

print " \e[33m$datestring\e[0m\n";


my @imagenes=`docker images`;


foreach my $imagen (@imagenes) {
  if ($imagen=~/$headname/) {
     my @stringpartido=split(/\s+/,$imagen);
     my $name=$stringpartido[0];
     my $id=$stringpartido[2];
     print "Encontrado: \e[36m$name\e[0m, con ID \e[31m$id\n";
     # Si el nombre es dragonde/... se quita el dragonde
     my @namepartido=split(/\//,$name);
     my $nombrecorto=defined($namepartido[1])?$namepartido[1]:$name; 
     ### nombre de la forma dk.141204-1103.nginx-wordpress"
     my $shortname="dk.".$nombrecorto.".".$datestring;
     print "\e[0mSalvando Imagen: \e[33m$shortname\e[0m\n";
      `docker save -o="$shortname" $name`;
      `gzip -f $shortname`;
      `gsutil cp $shortname.gz $segment`;
      unlink ("$shortname.gz");  
  }
}
