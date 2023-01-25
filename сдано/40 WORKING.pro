domains 
  list = integer*
predicates
    last_elements(list, integer, list) 
    last_elements(list, integer, integer, list) 
    nondeterm run
nondeterm do(char)
nondeterm readlist(list)
clauses  
readlist([Head|Tail]):-
write("enter element of the list. Entering an empty value will finish op. INPUT >> "),
readint(Head),!,readlist(Tail).
readlist([]).

    last_elements(List, SublistLength, Sublist):-
      last_elements(List, _EndPos, SublistLength, Sublist).
      
    last_elements([], 0, SublistLength, []):-!.
    last_elements([Head|Tail], EndPos, SublistLength, Sublist):-
      last_elements(Tail, TailEndPos, SublistLength, SublistTail),
      TailEndPos >= SublistLength, !, 
      Sublist = SublistTail, EndPos = TailEndPos + 1.
    last_elements([Head|Tail], EndPos, SublistLength, Sublist):-
      last_elements(Tail, TailEndPos, SublistLength, SublistTail),
      TailEndPos < SublistLength, !, 
      Sublist = [Head|SublistTail], EndPos = TailEndPos + 1.  
      
run:-
write("Welcome"),nl,
write("enter 1 to start the program"),nl,
write("enter 0 to exit"),nl,
write("Choose the command >>"),readchar(N),write(N),nl,
do(N),
run.

do('1'):-
readlist(L),nl,
write("Enter a number of last elements that will be created a new list in the same order"),nl,
write("N = "), readint(N),
 last_elements(L, N, X),
write("Entered list L = "),write(L),write("Result list is :",X),nl.
do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").
goal
run.

%goal
    %last_elements([1,2,3,4,5,6,7,8,9], 4, X).