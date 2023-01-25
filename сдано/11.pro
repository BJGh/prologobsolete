domains
int=integer
A,B,C,D,E = integer
list=int*
predicates
sum_n(list,int,list,list)
append(list,list,list)
clauses
append([],L,L):-!.
    append([H|T],P,[H|Y]):-append(T,P,Y).
/* увеличить каждый элемент списка на заданное число */
sum_n([],_,M,M):-!.
sum_n([H|T],N,L,List):-H1=H+N,
                       append(L,[H1],L2),
                       sum_n(T,N,L2,List).

goal
write("This program addition digit 1 to list"),nl,
write("For example, input 5 numbers to List and program will add to your list plus 1"),nl,
write("INPUT>>"),readInt(A),write(A),nl,
readInt(B),nl,
readInt(C),nl,
readInt(D),nl,
readInt(E),nl,
 
sum_n([A,B,C,D,E],1,[],List2),write(List2),nl.
