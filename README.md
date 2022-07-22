# Weixin Wang's PhD Dissertation

My PhD dissertation is focused on using the **matrix Fisher distribution** to model the uncertainty of 3D attitude.
Matrix Fisher distribution is a probability density defined intrinsically on SO(3), so it is suitable to arbitrarily **large attitude uncertainty**.
Specifically, the correlation between attitude and Euclidean variables is studied by introducing a new probability distribution on $\mathrm{SO}(3)\times \mathbb{R}^n$, referred to as the **matrix Fisher-Gaussian distribution**.
And based on this, new filtering algorithms are designed for three classic estimation problems:
(i) attitude estimation with gyroscope and direction measurements, 
(ii) loosely coupled IMU-GNSS navigation,
and (iii) visual-inertial navigation.

[PDF of dissertation](thesis-WW.pdf)

[PDF of slides for defense](slides/slides.pdf)

## Defense

I will defend my dissertaion on Thursday July 21, 2022, at 10:00 am in Estern time (Washington DC).
The defense is open to public on ZOOM, at [https://gwu-edu.zoom.us/j/6784720048?pwd=NzNKQytTQm5HRmY3VlF1VFYrTjEydz09](https://gwu-edu.zoom.us/j/6784720048?pwd=NzNKQytTQm5HRmY3VlF1VFYrTjEydz09). Meeting ID: 678 472 0048. Passcode: 1aPgXw.
Anyone who are interested is welcomed.

## Committee
Dr. Taeyoung Lee (supervisor), George Washington University

Dr. Kausik Sarkar, George Washington University

Dr. Peng Wei, George Washington University

Dr. Chung Hyuk Park, George Washington University

Dr. Uwe Hanebeck, Karlsruhe Institute of Technology

Dr. Kyle DeMars, Texas A\&M University

## Abstract

Modeling the uncertainty of three dimensional attitude is critical in numerous estimation problems in aerospace engineering and robotics.
However, the widely used Gaussian distribution is unable to accurately model large attitude uncertainties, due to the special geometric structure of the space for 3D rotations, namely the three dimensional special orthogonal group $\mathrm{SO}(3)$.
In this dissertation, the matrix Fisher distribution developed in directional statistics is used to model the attitude uncertainty.
The matrix Fisher distribution is defined intrinsically on $\mathrm{SO}(3)$, so it can accurately model arbitrarily large attitude uncertainties in a global fashion while fully respecting the underlying geometric structure of $\mathrm{SO}(3)$.

Although various properties of the matrix Fisher distribution have been studied in directional statistics, calculating its normalizing constant and moments still remains challenging.
In this dissertation, a recursive algorithm is proposed to calculate the central moment of matrix Fisher distribution up to an arbitrary order.
Also, an approximation for the matrix Fisher distribution is developed when it is highly concentrated in two degrees of freedom.
And based on this, approximate expressions for the normalizing constant and its derivatives are provided to reduce computation demand.

Next, a new probability density function on $\mathrm{SO}(3)\times \mathbb{R}^n$, referred to as the matrix Fisher-Gaussian distribution (MFG) is proposed to model the correlation between attitude and other random variables in the Euclidean space.
MFG greatly generalizes the application of matrix Fisher distribution, as in a lot of practical estimation problems, the attitude must be concurrently estimated with other quantities in the Euclidean space, and the correlation between them is crucial to transfer information from one to the other.
In addition, the Bingham-Gaussian distribution on $\mathbb{S}^3\times \mathbb{R}^n$ which is equivalent to MFG is constructed using the Lie group homomorphism from $\mathbb{S}^3$ to $\mathrm{SO}(3)$.
Various properties of these two distributions are studied, and a closed form approximate maximum likelihood estimation is presented for fast inference of their parameters required for real time implementations.

Finally, MFG is applied to three representative estimation problems, namely attitude estimation, IMU-GNSS integration, and visual-inertial odometry.
Specifically, the observability of attitude with angular velocity and single direction measurements is studied, where two new observable conditions are discovered.
Then, MFG is used to design a recursive Bayesian filter to estimate the attitude and gyroscope bias concurrently with attitude or direction measurements.
The uncertainty propagation step in this filter is further generalized into a full inertial navigation setting, where the estimated attitude is used to transform the accelerometer readings into the inertial frame which is integrated twice into position.
Based on this, a filter for IMU-GNSS navigation is developed with position measurements.
Furthermore, the MFG is also used to model the six dimensional pose that aligns two point sets.
This is combined with the uncertainty propagation scheme to design a visual-inertial odometry/navigation algorithm.
The proposed filters based on MFG are compared with the Gaussian distribution based multiplicative extended Kalman filter, where it is validated through simulation studies that the MFG filters have better accuracy in very challenging cases when the attitude has large uncertainty.
