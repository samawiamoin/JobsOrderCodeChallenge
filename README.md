# JobsOrderCodeChallenge
On the Beach Coding Challenge

Input/Output Structure:

Given the following job structure:
  a =>  
  b => c  
  c =>

Input Format: a,b:c,c
Output: acb

Given the following job structure:
  a =>  
  b =>  
  c => c

Input Format: a,b,c:c
Output: Jobs can't depend on themselves

Given the following job structure:
a => 
b => c 
c => f 
d => a 
e => 
f => b

Input Format: a,b,c:f,d:a,e,f:b
Output: Jobs can't have circular dependencies
