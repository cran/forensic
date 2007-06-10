\name{Pmatch}
\alias{Pmatch}
\title{Match Probabilities of Genotype}
\description{ 
Calculates match probability of the genotype of the suspect and that of the crime stain 
presumed to have come from an offender other than the suspect. 
Possible assumptions: the suspect and an unknown offender are unrelated, or are members of 
the same subpopulation with a given coancestry coefficient, or are close relatives. 
}
\usage{
Pmatch(prob, k = c(1, 0, 0), theta = 0)
}
\arguments{
  \item{prob}{ matrix with 2 rows and L columns (L is the number of loci, each locus has 
  2 alleles). Contains frequencies of alleles in a population found in the crime stain. 
For homozygous locus just one entry is nonzero. \code{prob} can also be a vector with 
     odd number of elements (it is then easily transformed to a matrix with
     two rows, the matrix is filled by columns)}
  \item{k}{ vector of kinship coefficients \eqn{(k_0, k_1, k_2)}, where 
  \eqn{k_i} is the probability that two people (the suspect and an unknown offender) 
  will share \eqn{i} alleles identical by descent, \eqn{i = 0, 1, 2}. }
  \item{theta}{ number from the interval [0,1). Coancestry coefficient 
  \code{theta} describes variation in allele proportions among subpopulations. 
  Default is 0 (no variation, whole population in Hardy-Weinberg equilibrium). 
  The recommended values of theta are 0.01 for large 
    subpopulations such as USA, and 0.03 for small isolated subpopulations 
    (National Research Council, 1996). 
    If \code{theta} is nonzero, the allele proportions are taken from the 
    whole population (not from the subpopulation).  
    }
}
\details{
The match probability is calculated as 
\deqn{k_2 + k_1 Z_1 + k_0 Z_2,} where
\eqn{k_0, k_1, k_2} are the kinship coefficients (for more information see 
Details of \code{\link{Pevid.rel}}),  
\deqn{
Z_2=\frac{\left[2\theta+(1-\theta)p_i\right] \left[3\theta+(1-\theta)p_i \right]}{(1+\theta)(1+2\theta)},}{%
Z_2 = [2*theta + (1-theta)*p_i]*[3*theta + (1-theta)*p_i] / [(1 + theta)*(1 + 2*theta)],}
\deqn{Z_2=\frac{2\left[\theta+(1-\theta)p_i\right] \left[\theta+(1-\theta)p_j \right]}{(1+\theta)(1+2\theta)}}{%
Z_2 = 2*[theta + (1-theta)*p_i]*[theta + (1-theta)*p_j] / [(1 + theta)*(1 + 2*theta)]}
are the match probabilities in the unrelated case for homozygotes and heterozygotes, respectively,
and
\deqn{Z_1=\frac{2\theta + (1-\theta)p_i}{1+\theta}}{%
Z_1 = (2\theta + (1-\theta) p_i)/ (1+\theta)
}
for the homozygote case and 
\deqn{Z_1=\frac{2\theta + (1-\theta)(p_i+p_j)}{2(1+\theta)}}{%
Z_1 = (2\theta + (1-\theta) (p_i+p_j))/ (2(1+\theta))
}
for the heterozygote case. The quantity \eqn{\theta} is the coancestry population \code{theta}.
The formula is derived in Balding and Nichols (1994).

 The match probability at all loci is calculated as a product of all
          single locus probabilities. We assume independence across loci. 
}
\value{
\code{Pmatch} returns a list with the following components:
  \item{prob }{matrix of allele proportions at each locus (input value in
                  \code{Pmatch})
}
  \item{match }{single locus match probabilities
}
\item{total_match}{match probability of genotype = multiplication of single
                  locus match probabilities
}  
}
\references{ 
Balding DJ, Nichols RA (1994), DNA profile match probability calculation: how 
to allow for population stratification, relatedness, database selection and 
single bands. Forensic Science International 64, 125-140.

Evett IW, Weir BS (1998), Interpreting DNA evidence;
  Statistical genetics for forensic scientists. Sinauer, Sunderland, MA.

National Research Council (1996), The evaluation of forensic DNA evidence 
National Academy Press, Washington, DC.
}
\author{Miriam Marusiakova  \email{maruskay@gmail.com} 

The work was supported by the project 1M06014 of the 
Ministry of Education, Youth and Sports of the Czech Republic. }
\seealso{ \code{\link{Pevid.rel}}, \code{\link{Pevid.gen}} }
\examples{
## match probability of thirteen-locus genotype 
    ## (11 heterozygous and 2 homozygous loci)
    p<-c(0.057,0.160,0.024,0.122,0.078,0.055,0.035,0.150,
      0.195,0.027,0.084,0.061,0.122,0.083,0.164,0.065,0.143,
      0.151,0.167,0.180,0.099,0.182,0.120,0,0.182,0)
    ## suspect and offender are unrelated 
    Pmatch(p)
    ## suspect and offender are unrelated but members of the same 
    ## subpopulation with the coancestry coefficient theta 
    Pmatch(p, theta = 0.03)
    ## suspect and offender are close relatives (cousins) 
    Pmatch(p, k = c(3/4, 1/4, 0))
    ## suspect and offender are close relatives (cousins) and 
    ## members of the same subpopulation with the coancestry 
    ## coefficient theta 
    Pmatch(p, k = c(3/4, 1/4, 0), theta = 0.03)
    ##
    ## one locus
    Pmatch(p[1:2], theta = 0.03)
    Pmatch(p[25:26], theta = 0.03)
    ## compare
    Pevid.gen(alleles = c(1, 2), prob = p[1:2], V = "1/2", x = 1, 
      theta = 0.03)
    Pevid.gen(alleles = "a", prob = p[25], V = "a/a", x = 1, 
      theta = 0.03)


}
\keyword{ misc }
