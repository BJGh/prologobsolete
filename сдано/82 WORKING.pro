domains
int = integer
int1 = int*
treetype = node(treetype,treetype,int);null
predicates
nondeterm run
nondeterm do(char)

counter(treetype,int)

nondeterm print_tree(treetype, integer)
  nondeterm print_spaces(integer)
 
  
  nondeterm insInTree(treetype,int,treetype)
nondeterm list2tree(int1,treetype)
nondeterm readlist(int1)
nondeterm readTree(treetype)



clauses
%Vvod dereva!!!!


insInTree(null,X,node(null,null,X)).
insInTree(node(L,R,V),X,node(LL,R,V)) :- V>X, insInTree(L,X,LL).
insInTree(node(L,R,V),X,node(L,RR,V)) :- V<=X, insInTree(R,X,RR).

list2tree([],null).
list2tree([H|T],Tree) :- list2tree(T,Tree1), insInTree(Tree1,H,Tree). 
 
readlist([H|T]) :- readint(H),!,readlist(T).
readlist([]).

readTree(U) :- write("Enter tree elements:"),nl,readlist(Z),list2tree(Z,U). 
%Vivod dereva!!!!    
print_tree(null, _Depth):-!.
  print_tree(node(Left, Right,TopValue), Depth):-
    SubtreesDepth = Depth + 1,
    print_tree(Left, SubtreesDepth),
    print_spaces(Depth), write(TopValue), write("<"), nl,
    print_tree(Right, SubtreesDepth).
    
 print_spaces(SpaceNumber):-
    SpaceNumber <= 0, !;
    write("\t"),
    TailSpaceNumber = SpaceNumber - 1,
    print_spaces(TailSpaceNumber).
    
%Podschet list'ev dereva
counter(null,0).
counter(node(L,R,_),N) :- counter(L,NL), counter(R,NR), N=NL+NR+1.

run:-
write("Welcome"),nl,
write("enter 1 to start the program"),nl,
write("enter 0 to exit"),nl,
write("Choose the command >>"),readchar(N),write(N),nl,
do(N),
run.

do('1'):-
readTree(U), write("Your tree: "),nl, print_tree(U,0), nl, write("Number of nodes: "),counter(U,K), write(K),nl.


do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").
goal
run.