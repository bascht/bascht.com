---
author: bascht
date: '2009-10-13 17:04:41'
layout: post
slug: rules-of-database-app-aging
status: publish
title: Rules of Database App Aging
wordpress_id: '587'
? ''
: - databases
  - databases
  - programming
  - programming
  - ruby
  - ruby
  - Uncategorized
---

> ### [Rules of Database App Aging](http://push.cx/2009/rules-of-database-app-aging)
> 
> I [mentioned](http://push.cx/2009/washington-post-update) I’ve
> learned some rules of how database apps change over time, now that
> I’ve done a few dozen. They are:
> 
> 1.  ### All Fields Become Optional
> 
>     As your dataset grows, exceptions creep in. There’s not enough
>     research time to fill in all your company profiles, there’s one guy
>     in Guam when you expected everyone to be in a U.S. state, there’s
>     data missing from the page you’re scraping, you have to pull
>     updates from a new source.
> 
>     Every field eventually loses that beautiful NOT NULL sheen, your
>     code gets filled up with guard clauses of one kind
>     [or another](http://weblog.raganwald.com/2008/01/objectandand-objectme-in-ruby.html)
>     and every <div\> in your template is wrapped by an if statement.
>     And this happens to foreign keys, too, so OR IS (NOT) NULL sneaks
>     in and left joins mutate into outer joins.
> 
>     This is by far the biggest effect on apps over time. It’s getting
>     to the point that I can gauge age by eyeballing the number of
>     fields that retain their NOT NULL constraint.
> 
> 2.  ### All Relationships Become Many-to-Many
> 
>     Some guy works in DC but lives in Virginia, so he needs two
>     Locations. A new type of incoming email needs to be shoveled out to
>     different feeds. A state has both a primary and a caucus. Someone
>     eventually realizes categories never really were mutually
>     exclusive.
> 
>     The modern database paradigm is defined by relations, so of course
>     that's what falls apart as soon as you get an app into production.
>     The urge to hack is overwhelming, fudge in a little denormalization
>     or duplicate a row and the pressure's off for now, but it's like
>     freezing a bottle of water, it always grows and breaks worse in the
>     end.
> 
> 3.  ### Chatter Always Expands
> 
>     All the little oddities that change database schemas affect the
>     user presentation as well. Chatter is the intro and outro text
>     around the content of a page that almost no one ever reads. But it
>     has to be there to explain what's going on, the source of
>     information, why things may seem peculiar, the limitations of the
>     dataset, etc. Add in the difficulty of writing succintly and
>     chatter grows until you burn it all down by rebuilding the app.
> 
> 
> And when you do rebuild the app from the ground up, you have your
> chance to slip some NULLs back on, renormalize your data to have
> easy one-to-many relationships, and present the data in a
> self-evident and consistent fashion. Then, about a week later,
> there's a politician who's a Democrat but running for re-election
> as an Independent...
> 
> « [Rails Forum Roundup](http://push.cx/2009/rails-forum-roundup)
> [Two Interactions With Amazon](http://push.cx/2009/two-interactions-with-amazon)
> »
> If you play any tabletop games (like
> [D&D](http://nearbygamers.com/tag/D&D),
> [Magic](http://nearbygamers.com/tag/Magic), and
> [Settlers](http://nearbygamers.com/tag/Settlers)), visit my site
> [NearbyGamers](http://nearbygamers.com) to find folks to game
> with.

via [push.cx](http://push.cx/2009/rules-of-database-app-aging)
Kleines Datenbank-Manifest.



