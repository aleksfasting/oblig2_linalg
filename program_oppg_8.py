import sympy as sp

def ranking(A):
    A = sp.Matrix(A)
    x = A.shape[0]
    for i in range(x):
        if (A[:,i] == sp.zeros(x,1)):
            return ("ERROR: Matrix must be stochastic")
    m = 0.1
    S = sp.Matrix(sp.ones(x,x)/x)
    M = (1 - m) * A + m * S
    return (M - sp.eye(x)).nullspace()
