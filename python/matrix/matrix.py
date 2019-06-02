class Matrix(object):
    def __init__(self, matrix_string):
        self.rows = [list(map(int, row.split(' ')))  for row in matrix_string.split("\n")]

    def row(self, one_based_index):
        return self.rows[one_based_index-1]

    def column(self, one_based_index):
        return [row[one_based_index-1] for row in self.rows]
