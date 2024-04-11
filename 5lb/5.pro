student(123456, 'John Doe', 'Group A', 2000, '123 Main St').
student(234567, 'Jane Smith', 'Group B', 2001, '456 Elm St').
student(345678, 'Alice Johnson', 'Group A', 1999, '789 Oak St').
student(456789, 'Bob Brown', 'Group B', 2000, '321 Pine St').
student(567890, 'Emily Wilson', 'Group C', 2002, '654 Maple St').
student(678901, 'Michael Lee', 'Group C', 1998, '987 Cedar St').
student(789012, 'Sophia Garcia', 'Group A', 2001, '246 Birch St').
student(890123, 'David Martinez', 'Group B', 2002, '135 Walnut St').
student(901234, 'Olivia Rodriguez', 'Group C', 1999, '579 Spruce St').
student(012345, 'Daniel Hernandez', 'Group A', 2000, '802 Cherry St').

study_language(123456, 'English').
study_language(234567, 'French').
study_language(345678, 'English').
study_language(456789, 'German').
study_language(567890, 'Spanish').
study_language(678901, 'English').
study_language(789012, 'English').
study_language(890123, 'French').
study_language(901234, 'Spanish').
study_language(012345, 'German').


older(X, Y) :- student(X, _, _, BirthYearX, _), student(Y, _, _, BirthYearY, _), BirthYearX > BirthYearY.
same_group(X, Y) :- student(X, _, Group, _, _), student(Y, _, Group, _, _), X \= Y.
language_study(X, Language) :- student(X, _, _, _, _), study_language(X, Language).


:- write('Is John Doe older than Jane Smith? '), (older(123456, 234567) -> write('Yes') ; write('No')), nl.
:- write('Are John Doe and Alice Johnson in the same group? '), (same_group(123456, 345678) -> write('Yes') ; write('No')), nl.
:- write('Who is studying English? '), nl, language_study(StudentID, 'English'), write(StudentID), nl, fail.
