"""
Paradigmas de Programacao - Tarefa 10

Giovanne RA173317
"""

from typing import List


class descontinuar:
    """Indicates that the wrapped function will deprecate at the first call."""

    def __init__(self, function):
        self.function = function
        self.first_run = True

    def __call__(self, *args, **kwargs):
        if self.first_run:
            print(
                f'Esta função ("{self.function.__name__}") será '
                'descontinuada na próxima versão da biblioteca!'
            )
            self.first_run = False
        return self.function(*args, **kwargs)


def group_components_into_answer(sent_ids: List[str], answer_types: List[str],
                                 values: List[str], complemented_questions: List[str]):
    """
    Group sentences, types, values and complement components into answers.

    Args:
        sent_ids: a list with the ids of the sentences in the original text.
        answer_types: a list with the types of the correspondent values.
        values: a list with the values or complements.
        complemented_questions: a list with the complemented question types.

    Returns:
        A list of tuples with matching sentence id, answer type, answer value
        and answer complement.

    Examples:
        >>> sent_ids = ['SENT10', 'SENT11', 'SENT13']
        >>> answer_types = ['tipo1', 'aparece no texto', 'tipo2', 'tipo3',
        >>>     'aparece no texto']
        >>> values = ['blabla', 'b1abl4', 'lalalala', 'kkkkk', 'k7k7k7k7']
        >>> complemented_questions = ['tipo1','tipo3']
        >>> answers = group_components_into_answer(sent_ids, answer_types,
        >>>     values, complemented_questions)
        >>> answers
        [
            ('SENT10', 'tipo1', 'blabla', 'b1abl4'),
            ('SENT11', 'tipo2', 'lalalala', None),
            ('SENT13', 'tipo3', 'kkkkk', 'k7k7k7k7')
        ]
    """
    iterator_ids, iterator_types, iterator_values = iter(
        sent_ids), iter(answer_types), iter(values)

    output = list()
    has_next = True

    while has_next:
        try:
            sent_id = next(iterator_ids)
        except StopIteration:
            sent_id = None
        try:
            answer_type = next(iterator_types)
        except StopIteration:
            answer_type = None
        try:
            value = next(iterator_values)
        except StopIteration:
            value = None

        has_next = (value is not None) or (answer_type is not None) \
            or (sent_id is not None)

        if not has_next:
            continue

        has_complement = False
        if answer_type is not None and answer_type in complemented_questions \
                and value != 'N/A':
            has_complement = True

        if has_complement:
            try:
                complement = next(iterator_values)
                answer = (sent_id, answer_type, value, complement)
            except StopIteration as error:
                raise ValueError(
                    'Missing answer complement for sentence {} with type {} and'
                    ' value {}'.format(sent_id, answer_type, value)
                ) from error

            try:
                # TODO: test if answer_type is actually a complement
                next(iterator_types)
            except StopIteration as error:
                raise ValueError(
                    'Missing answer type for sentence {} with value {} and'
                    ' complement {}'.format(sent_id, value, complement)
                ) from error
        else:
            answer = (sent_id, answer_type, value, None)

        output.append(answer)

    return output
