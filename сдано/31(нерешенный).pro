domains
int=integer
intl=int*
 
predicates
nondeterm nth(intl,int,int)
nondeterm task(intl,intl,intl)
 
clauses
nth([H|_],1,H).
nth([_|T],N,R) :- N1=N-1, nth(T,N1,R).
 
task(_,[],[]).
task(S,[H|T],[U|Z]) :- nth(S,H,U), task(S,T,Z).



goal
task([1,2,3,4],[3,2,1,4],[8,2,5,9]).

