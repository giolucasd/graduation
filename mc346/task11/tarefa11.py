"""
Paradigmas de Programacao - Tarefa 11

Giovanne RA173317
"""

from typing import Generator, Iterator, T


def desigual(fst: Iterator[T], snd: Iterator[T]) -> Generator[T, None, None]:
    """
    Pairwise equality comparison generator.

    Args:
        fst: the first iterable for the comparison.
        snd: the second iterable for the comparison.

    Returns:
        A generator for pairwise equality comparison.

    Raises:
        StopIteration: when one of the two given iterators reach its limit.
    """
    return (
        (fst_curr, snd_curr) for fst_curr, snd_curr in zip(fst, snd)
        if fst_curr != snd_curr
    )
