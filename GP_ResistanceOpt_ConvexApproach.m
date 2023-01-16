Tonmin = 500e-6;
Toffmin = 500e-6;
C = 100e-9;
Rmin = 1e3;
Rmax = 1e6;

c = log(C);
r0 = log(Rmin);
r2 = log(Rmax);
konmin = log(Tonmin/C);
koffmin = log(Toffmin/C);

cvx_begin gp
    variable t(1);
    variable g1(1);
    variable g2(1);
    variable ra(1);
    variable r1(1);
    expression y1(1)
        y1 = log(exp(c * g1 * ra) + exp(c * g1 * r1));
    expression y2(1);
        y2 = log(exp(c * g2 * ra) + exp(c * g2 * r2));
    minimize ( t );
    subject to
        y1 <= t;
        y2 <= t;
        g1 + ra >= konmin;
        g1 + r0 >= koffmin;
        g2 + ra >= konmin;
        g2 + r1 >= koffmin;
        r1 >= r0;
        r1 <= r2;
cvx_end