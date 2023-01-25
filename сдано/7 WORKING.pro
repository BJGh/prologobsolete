domains
int=integer
list=int*
predicates
nondeterm run
nondeterm do(char)
nondeterm readlist(list)
nondeterm connectList(list, list, list)
nondeterm reverseList(list, list)
nondeterm convertListToInteger(list, integer)

clauses

readlist([Head|Tail]):-
write("(input the empty SPACE will finish that) INPUT >> "),
readint(Head),!,readlist(Tail).
readlist([]).

connectList([], List, List).
connectList([X|List1], List2, [X|List3]):-
		connectList(List1, List2, List3).
		
		
reverseList([], []).
	reverseList([X|T], R):-
		reverseList(T, RT),
		connectList(RT, [X], R).
	
	
	convertListToInteger([LastElementList], LastElementList):- !.
	convertListToInteger([Head|Tail], ConvertedListToInteger):-
		convertListToInteger(Tail,TailConvertedListToInteger),
		ConvertedListToInteger = TailConvertedListToInteger * 10 + Head,
		write("10 * "), write(TailConvertedListToInteger), write(" + "), write(Head), write(" = "), write(ConvertedListToInteger), write("\n").

run:-
write("Welcome"),nl,
write("enter 1 to start the program"),nl,
write("enter 0 to exit"),nl,
write("Choose the command >>"),readchar(N),write(N),nl,
do(N),
run.


do('1'):-
readList(List),
		write("You've entered: "), write(List), nl,
		reverseList(List, ReversedList),
		convertListToInteger(ReversedList, ConvertedListToInteger),
		write("Result: "), write(ConvertedListToInteger), nl.
do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").
goal
run.