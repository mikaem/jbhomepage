# Numerical methods

In my recent paper {cite}`mortensen2023` I describe a new, highly efficient and generic spectral Petrov-Galerkin method that always leads to strictly banded and well conditioned coefficient matrices. The method can be understood as a Petrov-Galerkin description of the [integration preconditioner method](https://www.researchgate.net/profile/Evangelos-Coutsias/publication/233743145_Integration_preconditioners_for_differential_operators_in_spectral_-methods/links/0912f50afe96f81dfb000000/Integration-preconditioners-for-differential-operators-in-spectral-methods.pdf) by Coutsias et al. (1995).

My (now finished) PhD student Miroslav Kuchta has been looking at numerical methods to solve
saddle point systems arising from trace constraints coupling 2D and 1D domains,
or 3D and 1D domains {cite}`kuchta2016,kuchta2016preconditioning,kuchta15`.

We have also been studying the singular Neumann problem of linear elasticity
{cite}`kuchta2016singular`.
Four different formulations of the problem have been analyzed and mesh independent preconditioners established for the resulting linear systems within the framework of operator preconditioning. We have proposed a preconditioner for the (singular) mixed formulation of linear elasticity, that is robust with respect to the material parameters. Using an orthonormal basis of the space of rigid motions, discrete projection operators have been derived and employed in a modification to the conjugate gradients method to ensure optimal error convergence of the solution.

With colleagues at the Extreme Computing Research Center (ECRC), King Abdullah University of Science and Technology (KAUST), we have been using [spectralDNS](https://github.com/spectralDNS) to investigate time integration of Fourier pseudospectral Direct Numerical Simulations {cite}`ketcheson2020`. We investigate the use of higher‐order Runge‐Kutta pairs and automatic step size control based on local error estimation. We find that the fifth‐order accurate Runge‐Kutta pair of Bogacki and Shampine gives much greater accuracy at a significantly reduced computational cost.

In the SISC paper {cite}`mortensen2023` I describe a very efficient strictly banded method for solving differential equations with polynomial coefficients. This method has been implemented in `Shenfun`. Also in SISC, the paper {cite}`mortensen_siam25` describes the fastest known Legendre to Chebyshev (and vice versa) transform, based on the fast multipole method of Alpert and Rokhlin {cite}`alpert1991fast`. This method is implemented in the github repository [SISC-Legendre-to-Chebyshev](https://github.com/mikaem/SISC-Legendre-to-Chebyshev).

+++

## References

```{bibliography} ../../references.bib
:filter: docname in docnames
```
