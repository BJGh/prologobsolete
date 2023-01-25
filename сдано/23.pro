domains
element_d = integer
list_d = element_d*
predicates
last(list_d, element_d)
clauses
last([Element],Element):-!.
last([_|Tail],Element):-
	last(Tail,Element).
goal
last([1,2,4],X).