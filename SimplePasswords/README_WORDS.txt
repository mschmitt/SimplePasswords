Credits for English wordlist:

 - Webster's dictionary of 1934
 - Copyright has lapsed
 - Taken from the OpenBSD 4.8 distribution

Credits for German wordlist:

 - Compiled by Heinz Knutzen,
    < heinz dot knutzen at web dot de>
 - Used under the original terms as mentioned 
    at http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=131124
 - Downloaded from:
     ftp://ftp.informatik.uni-kiel.de/pub/kiel/dicts/
- cat *txt | perl -pe 's/A"/ä/g;s/O"/ö/g;s/U"/ü/g;s/a"/ä/g;s/o"/ö/g;s/u"/ü/g;s/sS/ß/g;s|/.*$||' | sort > words