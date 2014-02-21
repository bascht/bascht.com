---
author: bascht
date: '2008-10-23 13:30:15'
slug: rake-zum-latex-kompilieren
status: publish
title: Rake zum LaTeX kompilieren
comments: true
wordpress_id: '427'
? ''
: - diplom
  - diplom
  - howto
  - howto
  - latex
  - latex
  - programmierung
  - programmierung
  - ruby
  - ruby
  - tips
  - tips
  - unsortiertes
  - unsortiertes
---

Wer ein bisschen mit LaTeX zu tun hat, wird sicher sein Trio aus
Tex, Makeindex und co. kennen. Die meisten IDE's sind zwar schon
flexibel und haben Build-Tools, aber ihr wisst ja: 'Because I Can'.
Flo hat mich daher letztens noch auf ein sehr cooles Tool getippt:
**rake**. Einfach einen Rakefile in eurem Projekt anlegen und los
gehts:
`` PROJECT_NAME = "thesis" namespace :dir do namespace :pyg do desc "Pygmentizes all files in the directory to latex" task :latex do Dir.glob('*.{rb,php,html}').each do |filename| puts "pygmentizing #{filename}" `pygmentize -f latex #{filename} > #{File.basename(filename, '.php') + '.tex'}` end end end namespace :dot do desc "Render all dot files to png files" task :png do Dir.glob('**/*.{dot,circo}').each do |filename| puts "Rendering #{filename} with ext: #{File.extname(filename)}" `dot #{filename} -Tpng -o #{filename}.png` if File.extname(filename) == '.dot' `circo #{filename} -Tpng -o #{filename}.png` if File.extname(filename) == '.circo' `sam2p -j:quiet #{filename}.png EPS:#{filename}.eps` `rm #{filename}.png` end end end end namespace :latex do task :all => [:index, :bib, :compile] desc "Counts words of main document" task :count do puts "#{`detex #{PROJECT_NAME} | wc -w`.strip} words in thesis" if (file = ENV["file"]) puts "#{`detex #{file} | wc -w`.strip} words in #{file}" end end desc "Generates the Index" task :index do puts "Generating Index for #{PROJECT_NAME}." `makeindex #{PROJECT_NAME}.nlo -s nomencl.ist -o #{PROJECT_NAME}.nls` end desc "Generating BibTeX" task :bib do puts "Generating BibTeX for #{PROJECT_NAME}." `bibtex #{PROJECT_NAME}` end desc "Compile LaTeX" task :compile do puts "Compiling #{PROJECT_NAME}." `latex #{PROJECT_NAME}` end desc "Generate PDF File" task :pdf do puts "Generating PDF for #{PROJECT_NAME}." `dvipdf #{PROJECT_NAME}.dvi` end end ``
desc "Grep out the TODO's" task :todo do puts "n\*\* Whats left to
do for \#{PROJECT\_NAME} \*\*n" puts \`grep -n %TODO \*.tex
\*/\*.tex\` end desc "All (dot, tex, pdf)" task :default =\>
["dir:dot:png", "latex:all", "latex:pdf", "todo"] Mit dem Rakefile
in eurem Hauptarchiv habt ihr folgende Kommandos zur Verfügung:
**rake** - baut alles (Bilder, LaTeX, Pdf, Todo)
**rake dir:dot:png** - baut aus den .dot Dateien .eps Bilder
**rake dir:pyg:latex** - Kompiliert die Quellcodebeispiele zu
Latex-Dateien **rake dir:bib** - baut die Bibliografie neu
**rake dir:index** - baut den Index neu **rake dir:count** - zählt
Worte **rake dir:pdf** - Lässt ein PDF raus **rake dir:bib** - baut
die Bibliografie neu **rake todo** - gibt alle übrigen *TODO*'s
aus. Viel Spaß. Dank an Flo. Fragen an mich. (Oder in den
Kommentaren an Skade.)


