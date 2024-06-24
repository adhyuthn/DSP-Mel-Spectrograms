```
1.  Basic signals: Generate the following discrete time signals for n=-10 to +10 and display
    the following in separate figures using “stem” Matlab function:
    a. Unit impulse δ [n]
    b. Unit step u[n]
    c. u[n-1]
    d. Do in lab (15 marks): Generate unit impulse δ [ n ]using u[n] and u[n-1]
    e. Do in lab (15 marks):: Unit ramp r[n], and also x[n]=r[2n] in one figure (using
       Matlab’s hold) with appropriate legend and title for n=-20 to +20.
    f. Generate unit step u [ n ] using r[n] and r[n-1].
    
2.  Perform the following using the stem function.
    a. Let x[n] = 20(0.9)n u[n].
      i. Choose c and generate y[n] =10(c)n u[n], which reaches zero slower than x[n]
      ii. Display x[n] and y[n] for n=-10 to +100 on the same plot with appropriate
          legend (using hold).
    b. Do in lab (10 marks): Let x[n] = 0.2(1.2)n u[n]
      i. Choose c and generate y[n] = 2(c) n u[n], which reaches infinity slower
         than x[.].
      ii. Display x[n] and y[n] for n=-10 to +100 on the same plot with appropriate
          legend (using hold).
    c. Generate and display following discrete time signals for n=-10 to +40 on the same
       plot using hold with appropriate legend:
      i. x[n] = (-0.8)n u[n]
      ii. x[n] = -(0.8)n u[n]
    d. Do in lab (10 marks): Generate complex exponential signal x[n] =e(-1/12 +jπ/6)n .
      i. Display the real part and imaginary parts of x[n] for n=0 to 20 in one
         subplot of one figure with appropriate legend.
      ii. Display the absolute value of x[n] for n=0 to 20 in another subplot of the
          same figure.

3. Perform the following.
    a. Generate x1[n]) = cos(0.2πn), x2[n] = cos(1.8.πn), x3[n] = cos(2.2πn). Compare
       the plots generated for the three cases for n=-10 to +10, and comment on your
       result. Plot all the signals in the same figure using hold.
    b. Do in lab (15 marks): x4[n]=cos(4πn/17), x5[n]=3cos(1.3πn)-4sin(0.5πn+0.5π),
       x6[n]=5cos(1.5πn+0.75π)+ 4cos(0.6πn)-sin(0.5πn). In each case, determine the
       period of the signal theoretically and verify the result by displaying the signal in a
       plot.

4. Random signal generation
    a. Do in lab (15 marks): Display all of the following in one plot using hold function
       and rand(.,.) function for N=100 including appropriate legend
        i. A random signal of length N with samples uniformly distributed in the
           interval [0,1]
        ii. Another random signal of length N with samples uniformly distributed in
            the interval [0,1]
        iii. A random signal of length N with samples uniformly distributed in the
             interval [-5.-3]
    b. Display all of the following in one plot using hold function and randn(.,.) function for N=100 including appropriate legend
    i. A random signal x[n] of length N with samples normally distributed with
      zero mean and unity variance;
    ii. Another random signal x[n] of length N with samples normally distributed
        with zero mean and unity variance;
    iii. A random signal x[n] of length N with samples normally distributed with
        zero mean and variance of 100;

5. Do in lab (40 marks): Convolution: Write a program to perform convolution of two         signals given by
    a. Create any two arbitrary signals x(n) and h(n) of short lengths and compute the
       result using your program. Use the “conv” function in MATLAB to verify your
       result.
    b. Set h(n) as the impulse signal δ [ n ] and compute the result. Comment on the 
       result.
    c. Create any two arbitrary signals x(n), h(n) and g(n) of short lengths and verify
       distributive property of convolution.
```
