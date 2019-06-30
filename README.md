# JobsOrderCodeChallenge
On the Beach Coding Challenge

Input/Output Structure:

Given the following job structure: <br />
  a =>  
  b => c  
  c =>

Input Format: a,b:c,c <br />
Output: acb

Given the following job structure: <br />
  a =>  
  b =>  
  c => c

Input Format: a,b,c:c <br />
Output: Jobs can't depend on themselves

Given the following job structure: <br />
a => <br />
b => c <br />
c => f <br />
d => a <br />
e => <br />
f => b

Input Format: a,b,c:f,d:a,e,f:b <br />
Output: Jobs can't have circular dependencies
