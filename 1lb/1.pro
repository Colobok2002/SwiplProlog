
parent(ilya, marina).
parent(ilya, viktor).
parent(ilya, misha).
parent(ilya, luba).
parent(marina, misha).
parent(marina, luba).
parent(viktor, misha).
parent(viktor, luba).
man(ilya).
man(viktor).
man(misha).
woman(marina).
woman(luba).
married(ilya, marina).
married(marina, ilya).
married(viktor, luba).
married(luba, viktor).

father(Father, Child) :-
    parent(Father, Child),
    man(Father).

mother(Mother, Child) :-
    parent(Mother, Child),
    woman(Mother).

sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    Sibling1 \= Sibling2.

brother(Brother, Person) :-
    sibling(Brother, Person),
    man(Brother).

sister(Sister, Person) :-
    sibling(Sister, Person),
    woman(Sister).

print_family_member(Name) :-
    (   man(Name) ->
        format('~w is a man.~n', [Name])
    ;   woman(Name) ->
        format('~w is a woman.~n', [Name])
    ),
    (   father(Father, Name) ->
        format('~w is the father of ~w.~n', [Father, Name])
    ;   true
    ),
    (   mother(Mother, Name) ->
        format('~w is the mother of ~w.~n', [Mother, Name])
    ;   true
    ),
    (   brother(Sibling, Name) ->
        format('~w is a brother of ~w.~n', [Sibling, Name])
    ;   true
    ),
    (   sister(Sibling, Name) ->
        format('~w is a sister of ~w.~n', [Sibling, Name])
    ;   true
    ),
    (   married(Name, Spouse),
        man(Name) ->
        format('~w is married to ~w.~n', [Name, Spouse])
    ;   married(Spouse, Name),
        woman(Name) ->
        format('~w is married to ~w.~n', [Name, Spouse])
    ;   true
    ).

print_family :-
    write('Family Members:'), nl,
    forall(parent(Parent, _), print_family_member(Parent)),
    forall(married(_, Spouse), print_family_member(Spouse)).


draw_family_tree :-
    write('             Ilya (man)  Marina (woman)'), nl,
    write('               |            |'), nl,
    write('         ------------------------'), nl,
    write('         |           |          |'), nl,
    write('       Misha       Luba      Viktor'), nl.

main :-
    print_family,
    nl,
    draw_family_tree.

:- initialization(main).
