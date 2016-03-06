---
author: bascht
date: 2007-08-27
slug: eines-schonen-nachmittags-in-symfony
status: publish
title: 'Eines schönen Nachmittags in #symfony'
comments: true
wordpress_id: '228'
? ''
: - internet
  - internet
  - lustiges
  - lustiges
  - programmierung
  - programmierung
  - symfony
  - symfony
  - Uncategorized
---

Ich will ja nich parteiisch sein - aber OpenSource ist einfach nur
das Paradies! :)
    [27.08 19:03] * bascht starts copying sfSimpleCMSPlugin to sfDoctrineSimpleCMSPlugin....
    [27.08 19:03] < bascht> .oO( who cares. I got coffee... )
    [27.08 19:06] < Garfield-fr> bascht: It's possible to make a config file with orm tag [propel|doctrine] and make the code into the same project
    [27.08 19:08] < mahono> Garfield-fr: is that all to mix Propel with Doctrine?
    [27.08 19:08] < Garfield-fr> This is for choise the ORM
    [27.08 19:08] < Garfield-fr> orm: propel or orm: doctrine
    [27.08 19:09] < bascht> Garfield-fr: But is it possible to have both of them?
    [27.08 19:09] < Garfield-fr> And into the code sfConfig::get('xx_orm')
    [27.08 19:09] < mahono> you mean for the CMS plugin?
    [27.08 19:10] < Garfield-fr> I don't tested this
    [27.08 19:10] < Garfield-fr> It is an idea for simplify
    [27.08 19:11] < mahono> yeah
    [27.08 19:11] < Garfield-fr> Because, i have 2 plugins for the same fonctionality
    [27.08 19:12] < Garfield-fr> pffff
    [27.08 19:12] < mahono> yes, I already posted this problem a few times on the mailing list..
    [27.08 19:13] < bascht> Garfield-fr: But the problem for me is, that the propel-tasks keep reading my doctrine-yml's and vice versa. Could this be solved by two
    different configs?
    [27.08 19:13] < Garfield-fr> Your schema is into /config/doctrine/schema.yml ?
    [27.08 19:14] < bascht> Garfield-fr: Yes
    [27.08 19:14] < Garfield-fr> Zut !!!
    [27.08 19:16] < bascht> But the Propel-Tasks also read the schema files from the /doctrine directories...
    [27.08 19:16] < Garfield-fr> I check symfony propel task
    [27.08 19:17] < DrRotmos> bascht: I have a pretty well functioning Doctrine port of SimpleCMSPlugin
    [27.08 19:18] < mahono> cool
    [27.08 19:18] < bascht> DrRotmos: You've ported it by yourself???
    [27.08 19:18] < DrRotmos> yeah
    [27.08 19:19] < bascht> DrRotmos: So, would you like to share it with us?
    [27.08 19:19] < DrRotmos> although I've added some stuff, like locking, and there's still a bug
    [27.08 19:19] < DrRotmos> well, yes, but I need to clean up some stuff first
    [27.08 19:19] < mahono> maybe we could help with that bug :-)
    [27.08 19:20] < bascht> yepyepyep!

Auch wenn es Futter für Harald ist, aber damit gibt es bald ein
neues Plugin am Symfony-Himmel. :)


