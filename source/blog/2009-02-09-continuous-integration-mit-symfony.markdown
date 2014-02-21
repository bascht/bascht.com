---
author: bascht
date: '2009-02-09 18:29:09'
slug: continuous-integration-mit-symfony
status: publish
title: Continuous Integration mit Symfony
comments: true
wordpress_id: '522'
? ''
: - agile development
  - agile development
  - ci
  - ci
  - lernen
  - lernen
  - php
  - php
  - programming
  - programming
  - symfony
  - symfony
  - unsortiertes
  - unsortiertes
---

Auf Wunsch eines einzelnen
[Herren](http://twitter.com/denderello/status/1191900184) werde ich
mal kurz den Stand meiner Forschungsarbeiten auf dem Gebiet
[Continuous Integration](http://de.wikipedia.org/wiki/Kontinuierliche_Integration)
mit Symfony festhalten. Skoop
([Stefan Koopmanschap](http://www.leftontheweb.com/who)) hatte
bereits seit einiger Zeit einen Proof of Concept für die
Integration von lime in das von phpUnderControl benötigte
XML-Format geschrieben - der wurde jedoch nie released. Nun ists
endlich soweit - Version 0.0.1 des
[symfonyUnderControlPlugin](http://www.symfony-project.org/plugins/symfonyUnderControlPlugin)
liegt im Repo. Also, frisch ans Werk - Plugin eingebunden - Task
probiert - **Fehler**. Hab mich mit Skoop kurzgeschlossen, das
Plugin ist derzeit nur Symfony 1.2 erprobt. Bei Versionen < 1.2
scheint das Autoloading fehlzuschlagen. Einfach per Hand nachrüsten
und los gehts: [sourcecode language="php"]
include\_once(sfConfig::get('sf\_plugins\_dir') .
'/symfonyUnderControlPlugin/lib/SymfonyUnderControlOutput.class.php');
include\_once(sfConfig::get('sf\_plugins\_dir') .
'/symfonyUnderControlPlugin/lib/SymfonyUnderControlTest.class.php');
[/sourcecode] Wer zu Faul zum tippen ist, nimmt meinen Patch:
[phpuc.p0](http://www.bascht.com/uploads/2009/02/phpuc.p0). Jetzt
das Build-File für ant noch erstellen, dabei einfach der Anleitung
auf der Pluginwebseite folgen. Ich hab lediglich noch einen Task
zur Modelerstellung unter Doctrine hinzugefügt. `` Das wars - jetzt
den Java-Buildserver von CruiseControl starten und warten bis die
ersten Builds durchrollen.
[![symfonyundercontrol](http://www.bascht.com/uploads/2009/02/symfonyundercontrol.png "symfonyundercontrol")](http://www.bascht.com/uploads/2009/02/symfonyundercontrol.png)
Happy Coding! Bei Fragen, einfach
irc://irc.freenode.net:6667/\#symfony und dort skoop. :-)


