Tonmin = 500e-6;
Toffmin = 500e-6;
C = 100e-9;
Rmin = 1e3;
Rmax = 1e6;
Ra = 10e3;

cvx_begin gp
    variable t(1);
    variable G1(1);
    variable G2(1);
    variable G3(1);
    variable R1(1);
    variable R2(1);
    minimize ( t );
    subject to
        C * G1 * Ra + C * G1 * R1 <= t;
        C * G2 * Ra + C * G2 * R2 <= t;
        C * G3 * Ra + C * G3 * Rmax <= t;
        
        G1 * Ra >= Tonmin/C;
        G1 * Rmin >= Toffmin/C;
        
        G2 * Ra >= Tonmin/C;
        G2 * R1 >= Toffmin/C;
        
        G3 * Ra >= Tonmin/C;
        G3 * R2 >= Toffmin/C;
        
        R1 >= Rmin;
        R1 <= R2;
        R2 <= Rmax;
cvx_end