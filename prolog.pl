male(john1).
male(peter).
male(rob).
male(george).
male(jay).
male(john2).

female(sue).
female(ida).
female(estelle).
female(grace).
female(mary).

wedding(sue,john1).
wedding(ida,peter).
wedding(estelle,george).
wedding(john1,sue).
wedding(peter,ida).
wedding(george,estelle).

parent(sue,rob).
parent(sue,estelle).
parent(john1,rob).
parent(john1,estelle).

parent(ida,george).
parent(ida,grace).
parent(peter,george).
parent(peter,grace).

parent(estelle,john2).
parent(estelle,mary).
parent(estelle,jay).
parent(george,john2).
parent(george,mary).
parent(george,jay).

grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X).
mother_in_law(X,Y) :- wedding(Z, Y), parent(X,Z), female(X).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(Z,Y), ancestor(X,Z).
uncle(X, Y) :- parent(Z,Y), brother(X,Z).


city(toronto).
city(detroit).
city(orlando).
city(chicago).

airport(toronto,pearson).
airport(detroit,wayne).
airport(orlando,mco).
airport(chicago,o_hare).
airport(chicago,midway).

ww2hero(o_hare).
ww2hero(wallenburg).
ww2hero(basilone).
ww2hero(schindler).

battle(midway).
battle(dieppe).
battle(sicily).
battle(normandy).

% hint: One of its airports is named after a World War II hero; the other airport, after a World War II battle
city_guess(X) :- airport(X, Y), ww2hero(Y), airport(X, Z), battle(Z), Y = Z.


my_last(X,[X]).
mylast(X, [|L]) :- my_last(X, L).

adjacent(X,Y,[Y|T]).
adjacent(X,Y,[X|T]) :- adjacent(X,Y,T).
adjacent(X,Y,[Z|T]) :- adjacent(X,Y,T).

reverse_list([], A, A). 
reverse_list([X|T], Y, Z):- reverse_list(T, [X|Y], Z).
same_verify([], []). 
same_verify([X|T1], [X|T2]):- same_verify(T1, T2).
palindrome(List):- reverse_list(List, [], Rev), same_verify(List, Rev).


fib(1, 0) :- !. 
fib(2, 1) :- !.
fib(X, Y) :-
        X > 1,
        X1 is X-1,
        X2 is X-2,
        fib(X1, Y1),
        fib(X2, Y2),
        Y is Y1+Y2.


sum([], 0).
sum([H|T], Sum) :-
   sum(T, Y),
   Sum is H + Y.

mean( List, Mean ):- 
    sum( List, Sum ),
    length( List, Length), 
    Mean is Sum / Length.

max([H|T], M) :- max(T, H, M).
max([], M, M).
max([H|T], Y, M) :- H =< Y, max(T, Y, M).
max([H|T], Y, M) :- H > Y, max(T, H, M).

min([H|T], M) :- min(T, H, M).
min([], M, M).
min([H|T], Y, M) :- H =< Y, min(T, H, M).
min([H|T], Y, M) :- H > Y, min(T, Y, M).