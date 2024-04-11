circle_properties(S, D, L) :-
    D is sqrt(4 * S / 3.14),
    L is 3.14 * D.

main :-
    circle_properties(150, D, L),
    write('Diameter: '), write(D), nl,
    write('Circumference: '), write(L), nl,
    halt.

:- initialization(main).
