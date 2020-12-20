/**
 * Giovanne RA173317
 * Paradigmas de Programacao
 * Tarefa 6
 */

maior([A], A).
maior([A, B|C], D) :-
    maior([B|C], E),
    maximo(A, E, D).

maximo(A, B, A) :-
    A >= B.

maximo(A, B, B) :-
    A < B.
