# AjeditsDB Freelancer Online Business

## Introduction
For my final project, I want to create a database representing the clients I did video editing for on fiverr as a freelancing online business

## Overview
Ajedits26 is a freelancing video editing online business hosted on fiverr, and it offers viral short-form and long-form edits with clean animations and motion graphics. The software I use to edit every project is called Davinci Resolve. A client clicks on my gig page and views the description, chooses a pricing package ranging from Basic, Standard, Premium, they can look at reviews from previous clients, and can browse sample projects. Clients will send a message to the seller to discuss requirements or ask about my skills, click order now, provide detailed project instructions/deadlines, and remain in real-time constant contact with sellers to track work progress. 

## Features
- Client management
- List of freelancers
- Service packages (Basic, Standard, Premium)
- Orders and deadlines tracking
- Reviews and ratings
- Messaging simulation

## Technologies
- PostgreSQL
- pgAdmin4
- SQL
- CSV datasets
- Git/Github

## Business Context
Ajedits26 is a Fiverr-based freelance video editing business specializing in:
- Short-form viral edits
- Long-form edits
- Motion graphics
- Clean animations

## How to Run/Test
- Install pgAdmin4
    - Start new query in database
    - Create database tables
    - Open Schemas
        - Tables: import respective csv files for each table.
    - Make new queries using SELECT statements setting a LIMIT constraint to 10.
        - displays 10 rows of data out of 1000 for each table.
    - TODO: Make new queries using INSERT statements to add new data to each table.
- open SQL Shell (psql)
    - CREATE DATABASE ajeditsdb;
    - \c ajeditsdb