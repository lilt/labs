#!/usr/bin/env bash

#wget http://www.latl.unige.ch/swissadmin/swissadmin_aligned_2014_05_26.zip
#unzip swissadmin_aligned_2014_05_26.zip

#en-fr test data
paste -d'|' <(tail -1320 fr-en/2013fr.txt) <(tail -1320 fr-en/2013en.txt) | awk -F'|' '{split($1,fr," ");split($2,en," "); if(length(en) < 200 && length(fr) < 200)print}' | cut -d'|' -f1 >swissadmin.en-fr.test.fr
paste -d'|' <(tail -1320 fr-en/2013fr.txt) <(tail -1320 fr-en/2013en.txt) | awk -F'|' '{split($1,fr," ");split($2,en," "); if(length(en) < 200 && length(fr) < 200)print}' | cut -d'|' -f2 >swissadmin.en-fr.test.en

#en-fr adaptation data
for l in en fr; do
  cat fr-en/201{1,2,3}$l.txt | head -18163 >swissadmin.en-fr.train.$l
done


#en-de test data
paste -d'|' <(tail -1300 de-en/2013de.txt) <(tail -1300 de-en/2013en.txt) | awk -F'|' '{split($1,fr," ");split($2,en," "); if(length(en) < 200 && length(fr) < 200)print}' | cut -d'|' -f1 >swissadmin.en-de.test.de
paste -d'|' <(tail -1300 de-en/2013de.txt) <(tail -1300 de-en/2013en.txt) | awk -F'|' '{split($1,fr," ");split($2,en," "); if(length(en) < 200 && length(fr) < 200)print}' | cut -d'|' -f2 >swissadmin.en-de.test.en

#en-de adaptation data
for l in en de; do
  cat de-en/201{1,2,3}$l.txt | head -18621 >swissadmin.en-de.train.$l
done
