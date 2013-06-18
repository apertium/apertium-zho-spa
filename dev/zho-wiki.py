#!/usr/bin/python
# coding=utf-8
# -*- encoding: utf-8 -*-

import sys; 
insec = False;

cats = '';

pos = ['Noun', 'Verb', 'Adjective', 'Particle', 'Interjection', 'Adverb', 'Article', 'Conjunction', 'Determiner', 'Pronoun', 'Numeral', 'Preposition', 'Postposition'];

for line in sys.stdin.readlines(): #{

	if line[0] == '=' and line[1] == '=' and line[2] != '=': #{
		insec = False;
	#}
	if line.count('==Mandarin==') > 0 or line.count('== Mandarin ==') > 0: #{
		insec = True;
	#}

	if insec: #{
		if line.count('===') > 1: #{
			cat = line.strip('= \n');
			if cat in pos: 
				cats = cats +':' + cat;
		#}
	#}
#}
print(cats);
