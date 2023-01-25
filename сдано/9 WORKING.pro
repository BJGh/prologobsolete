Domains 
list=integer*  
predicates
nondeterm insert(integer,list,list)
nondeterm solve(real,real,real,list)
nondeterm reply(real,real,real,list)


nondeterm run
nondeterm do(char)


clauses
insert(X,L,[X|L]). 
insert(X,L,[X|L]):-insert(X,L,L).
solve(_,_,R,_):- 
R<=0,
write("Use only natural numbers.\n\n"), 
run. 


solve(A,B,R,L):- 
R>0, 
reply(A,B,R,L). 

reply(A,B,R,L):- 
A+B<R, R<>0, 
C=B,
NewB=A+B, 
NewA=C, 
reply(NewA,NewB,R,L).
 
reply(A,B,R,L):- 
A+B=R, R<>0, 
NewR=R-(A+B), 
X=A+B, 
NewA=0, 
NewB=1, 
insert(X,L,NewL), 
reply(NewA,NewB,NewR,NewL).
 
reply(A,B,R,L):- 
A+B>R, R<>0, 
NewR=R-B, 
X=B, 
NewA=0, 
NewB=1, 
insert(X,L,NewL), 
reply(NewA,NewB,NewR,NewL). 
reply(_,_,R,L):- 
R=0, 
write(L), nl. 


run:-
write("Welcome"),nl,
write("enter 1 to start the program"),nl,
write("enter 0 to exit"),nl,
write("Choose the command >>"),readchar(N),write(N),nl,
do(N),
run.


do('1'):-
write("Input the natural number: "),readreal(R),nl, 
A=0, 
B=1, 
L=[], 
write("Summa of Fibonnaci"),nl,
solve(A,B,R,L). 
do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").
goal
run.