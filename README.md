# Enigma
Turing School of Software and Design: 

###### [Backend Engineering Module 1 - Enigma Project](https://backend.turing.io/module1/projects/enigma/index) 

![](https://thumbs-prod.si-cdn.com/1R5BVwjtdeEalhj9HBOhH4bDgCo=/800x600/filters:no_upscale()/https://public-media.si-cdn.com/filer/f5/95/f59548db-c8c7-47a0-8404-9e44cd4b8db6/enigma.jpg)

## Table of Contents:
* [Project Overview](#project-overview)
* [Installation](#installation)
* [Running The Tests](#running-the-tests)
* [Self-Evaluation](#self-evaluation)

## Project Overview:
This project, built using Ruby, is a message encryption and decryption program based off the [Enigma Machine](https://en.wikipedia.org/wiki/Enigma_machine) used by Germany during WWII. 

The idea of this project is to translate a character by shifting it a certain number of places down the alphabet. However, instead of using the same shift for every character, the algorithm uses 4 different shifts known as the A, B, C, and D shifts. Every fourth character will be shifted by the same amount, so the 1st, 5th, and 9th characters will be shifted with the A shift, the 2nd, 6th, and 10th characters will be shifted with the B shift, etc.

## Installation:
Fork or clone this repository to your local machine.

## Running the Tests: 

### Encryption: 

Come up with a message that you would like to encrypt by editing the `message.txt` file. From the command line, run the following:

```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
```

A confirmation will appear, showing the destination file, the key, and the date used for encryption. For example: 

```
Created 'encrypted.txt' with the key 82648 and date 240818
```

### Decryption: 

From the command line, run the `decrypt.rb` runner file with your encrypted text file name, a new destination text file and the key and date given in the confirmation you received. 

```
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
```

You will again see a confirmation with the destination file and key/date given. You are now able to view these files and their outputs in your text editor. 

## Self-Evaluation:

[Evaluation Rubric](https://backend.turing.io/module1/projects/enigma/rubric)

#### **Functionality** `3`: Encryption and decryption methods are successfully implemented in the Enigma Class and the command line interface. 

#### **Object Oriented Programming** `4`: Code is well organized and implements the use of modules.

#### **Ruby Conventions and Mechanics** `4`: Methods are properly named and not excessively long. Code syntax is consistent and is properly indented.  

#### **Test Driven Development** `4`: Test coverage through `Simple_Cov` shows 100% coverage. Stubs were used appropriately and successfully. 

#### **Version Control** `3.5`: Appropriate amount of commits and pull requests. Most commits do not include multiple pieces of functionality. 
