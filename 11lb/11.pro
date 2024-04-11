
sum_positives([], 0).
sum_positives([H|T], Sum) :-
    H > 0,
    sum_positives(T, RestSum),
    Sum is H + RestSum.
sum_positives([H|T], Sum) :-
    H =< 0,
    sum_positives(T, Sum).

max_element([X], X).
max_element([H|T], Max) :-
    max_element(T, TailMax),
    (H > TailMax ->
        Max = H
    ;
        Max = TailMax
    ).

find_position(_, [], _, _) :-
    write('Element not found in the list.'), nl.
find_position(Element, [Element|_], Position, Position) :-
    write('Element found at position '), write(Position), nl.
find_position(Element, [_|T], CurrentPosition, Position) :-
    NextPosition is CurrentPosition + 1,
    find_position(Element, T, NextPosition, Position).

example :-
    List = [1, -2, 3, 4, -5, 6, 7],
    sum_positives(List, Sum),
    write('Sum: '), write(Sum), nl,
    max_element(List, Max),
    write('Max: '), write(Max), nl,
    find_position(6, List, 1, Position).

:- example.
