import sys;

conv = {'Noun':'n', 'Particle':'part', 'Adverb':'adv', 'Postposition':'post', 'Adjective':'adj', 'Preposition':'pr', 'Verb':'vblex', 'Numeral':'num', 'Conjunction':'cnj', 'Pronoun':'prn', 'Interjection':'ij'};

tagset = set();
entries = [];
for line in open(sys.argv[1]).readlines(): #{
	print(line, file=sys.stderr);
	row = line.split('\t');
	tags = row[1].strip().split(':');
	lemma = row[0].replace('.wiki', '');
	lemma = lemma.split('/')[-1];
	for tag in tags: #{
		if tag == '': continue;
		if tag not in tagset: #{
			tagset.add(tag);
		#}
		entries.append((lemma, tag));
	#}
#}

print('<dictionary>');
print('  <alphabet/>');
print('  <sdefs>');
for tag in tagset: #{
	print('    <sdef n="' + conv[tag] + '" c="' + tag + '"/>');
#}
print('  </sdefs>');
print('  <pardefs>');
for tag in tagset: #{
	print('    <pardef n="x__' + conv[tag] + '">');
	print('      <e><p><l></l><r><s n="' + conv[tag] + '"/></r></p></e>');
	print('    </pardef>');
#}
print('  </pardefs>');
print('  <section id="main" type="postblank">');
for entry in entries: #{

	print('    <e lm="' + entry[0] + '"><i>' + entry[0] + '</i><par n="x__' + conv[entry[1]] + '"/></e>');
#}
print('  </section>');
print('</dictionary>');
