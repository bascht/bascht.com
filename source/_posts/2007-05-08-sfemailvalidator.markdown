---
author: bascht
date: '2007-05-08 01:08:54'
layout: post
slug: sfemailvalidator
status: publish
title: sfEmailValidator
comments: true
wordpress_id: '800'
? ''
: - Uncategorized
---

Bin grad bisschen mit Symfony unterwegs...
    names:
    Â  author:
    Â    required:      Yes
    Â    required_msg:  The name field cannot be left blank  email:
    Â    required:      No
    Â    validators:    emailValidatorbody:
    
    Â  required:      Yes
    
    Â    required_msg:  The text field cannot be left blank
    
    emailValidator:
    
    Â  class:         sfEmailValidator
    
    Â  param:
    
    Â    email_error: The email adress is not valid.

asdf


