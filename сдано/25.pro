domains
int=integer
list=int*
predicates
nondeterm p(list,int)

clauses
p([X,_],X).
p([_|T],X):-p(T,X).


goal
p([1,2,3,4],X).

