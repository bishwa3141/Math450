from scipy import *
import sys
import pprint

def lupp(A):
    (m,n) = A.shape;
    if m != n:
        print('A is not a square matrix')
    else:
        P = eye(n);
        for k in xrange(n):
            q = max(xrange(k,n), key=lambda i: abs(A[i,k]))
            if q != k:
                A[[k,q]] = A[[q,k]];
                P[[k,q]] = P[[q,k]];
            for i in xrange(k+1,n):
                A[i,k] = A[i,k]/A[k,k];
                for j in xrange(k+1,n):
                    A[i,j] = A[i,j] - A[i,k]*A[k,j]
            L = eye(n) + tril(A,-1);
            U = triu(A);
    return (P, L, U)
                    
A = matrix(eval(sys.argv[1]));
#A = matrix([[1.,2.,3.],[4.,5.,6.],[7.,8.,0.]]);
#B = A;
P, L, U = lupp(A)
                    
#print("A:")
#pprint.pprint(A)
                    
#print("PA:")
#pprint.pprint(dot(P,B))
                    
print("P:")
pprint.pprint(P)
                    
print("L:")
pprint.pprint(L)
                    
print("U:")
pprint.pprint(U)

#print("LU:")
#pprint.pprint(dot(L,U))
