\name{Pevid.rel}
\alias{Pevid.rel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Probability of DNA Evidence With the Presence of Relatives }
\description{
Computes probability of DNA evidence, given the proposition about who the 
contributors to the mixture were. Two main cases are considered: 
tested suspect (noncontributor) with an unknown relative (contributor), 
or unknown suspect (contributor) with a tested relative (noncontributor) 
and two unknown related people as contributors.
}
\usage{
Pevid.rel(alleles, prob, x, u = NULL, k = c(1, 0, 0), S = NULL)
}
\arguments{
  \item{alleles}{ vector of distinct alleles (from one specific locus) 
  found in the crime sample. }
  \item{prob}{ vector of corresponding allele proportions in a population }
  \item{x}{ nonnegative integer. The number of unknown contributors to 
  the mixture.  }
  \item{u}{ vector of alleles from the mixture, which are not carried by 
  known contributors (and have to be carried by some unknown contributors). 
  If \code{u=NULL} (default), all alleles from the crime sample are carried 
  by known contributors. }
  \item{k}{ vector of kinship coefficients \eqn{(k_0, k_1, k_2)}, where 
  \eqn{k_i} is the probability that two people will share \eqn{i} alleles 
   identical by descent, \eqn{i = 0, 1, 2}.  
    }
  \item{S}{object of class genotype (package \pkg{genetics}), or a string 
    of length 1 with two alleles seperated by '/'.
  Genotype of the typed person (declared noncontributor) whose untyped 
  relative is assumed to be a contributor to the sample. 
  If \code{S = NULL} (default), we consider two related unknown contributors. }
}
\details{
Table of kinship coefficients for commonly encountered relationships:
\tabular{llll}{
Relationship \tab \eqn{k_0} \tab \eqn{k_1} \tab \eqn{k_2} \cr
Parent - child \tab 0 \tab 1 \tab 0 \cr
Grandparent - grandchild \tab 1/2 \tab 1/2 \tab 0 \cr  
Full sibs \tab 1/4 \tab 1/2 \tab 1/4 \cr 
Halfsibs \tab 1/2 \tab 1/2 \tab 0\cr 
Uncle - nephew \tab 1/2 \tab 1/2 \tab 0\cr 
First cousins \tab 3/4 \tab 1/4 \tab 0\cr 
Second cousins \tab 15/16 \tab 1/16 \tab 0\cr 
Unrelated \tab 1 \tab 0 \tab 0 \cr 
}
The formulas (and their derivations) for the evaluation of the probabilities 
of DNA evidence with the presence of at most 2 relatives can be found in 
Hu and Fung (2003).
}

\value{
probability of DNA evidence
}
\references{ 
Balding DJ, Nichols RA (1994), DNA profile match probability calculation: how 
to allow for population stratification, relatedness, database selection and 
single bands. Forensic Science International 64, 125-140.

Fung WK, Hu YQ (2000), Interpreting DNA mixtures based on the NRC-II recommendation 
4.1. Forensic Sci Commun. Available at http://www.fbi.gov/hq/lab/fsc/backissu/oct2000/fung.htm

Hu YQ, Fung WK (2003), Interpreting DNA mixtures with the presence of relatives. 
International Journal od Legal Medicine 117, 39-45.
 
Evett IW, Weir BS (1998), Interpreting DNA evidence.
  Statistical genetics for forensic scientists. Sinauer, Sunderland, MA.
}
\author{ Miriam Marusiakova  \email{maruskay@gmail.com} 

The work was supported by the project 1M06014 of the 
Ministry of Education, Youth and Sports of the Czech Republic.}
\seealso{ \code{\link{Pmatch}}}
\examples{
## Rape case in Hong Kong (Fung and Hu (2000))
## mixture (loci: D3S1358, vWA, FGA)
m1 <- c(14, 15, 17, 18)
m2 <- c(16, 18)
m3 <- c(20, 24, 25)
## genotype of the victim (loci: D3S1358, vWA, FGA): 
victim_1 = "15/18"
victim_2 = "18/18"
victim_3 = "20/24"
## genotype of the suspect (loci: D3S1358, vWA, FGA):
suspect_1 = "14/17"
suspect_2 = "16/16"
suspect_3 = "25/25"
## allele proportions 
p1 <- c(0.033, 0.331, 0.239, 0.056)
p2 <- c(0.155, 0.158)
p3 <- c(0.042, 0.166, 0.106)
##
## Likelihood ratio for DNA evidence:
## Prosecution proposition: 
## Contributors were the victim and the suspect.
## Defence proposition 1: 
## Contributors were the victim and one relative of the suspect (sibling).
print(LR11 <- 1 / Pevid.rel(alleles = m1, prob = p1, x = 1, 
  k = c(1/4, 1/2, 1/4), S = suspect_1, u = c(14, 17)))
print(LR12 <- 1 / Pevid.rel(alleles = m2, prob = p2, x = 1, 
  k = c(1/4, 1/2, 1/4), S = suspect_2, u = 16))
print(LR13 <- 1 / Pevid.rel(alleles = m3, prob = p3, x = 1, 
  k = c(1/4, 1/2, 1/4), S = suspect_3, u = 25))
##
## Defence proposition 2: 
## Contributors were one relative of the suspect (sibling) and one unknown. 
print(LR21 <- 1 / Pevid.rel(alleles = m1, prob = p1, x = 2, 
  k = c(1/4, 1/2, 1/4), S = suspect_1, u = m1))
print(LR22 <- 1 / Pevid.rel(alleles = m2, prob = p2, x = 2, 
k = c(1/4, 1/2, 1/4), S = suspect_2, u = m2))
print(LR23 <- 1 / Pevid.rel(alleles = m3, prob = p3, x = 2, 
k = c(1/4, 1/2, 1/4), S = suspect_3, u = m3))
##
## Defence proposition 3: 
## Contributors were two related people (siblings).
print(LR31 <- 1 / Pevid.rel(alleles = m1, prob = p1, x = 2, 
k = c(1/4, 1/2, 1/4), u = m1))
print(LR32 <- 1 / Pevid.rel(alleles = m2, prob = p2, x = 2, 
k = c(1/4, 1/2, 1/4), u = m2))
print(LR33 <- 1 / Pevid.rel(alleles = m3, prob = p3, x = 2, 
k = c(1/4, 1/2, 1/4), u = m3))
##
## Likelihood ratios overall:
## for defence proposition 1
LR11*LR12*LR13
## for defence proposition 2
LR21*LR22*LR23
## for defence proposition 3
LR31*LR32*LR33
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
