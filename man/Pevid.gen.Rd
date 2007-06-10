\name{Pevid.gen}
\alias{Pevid.gen}
\title{ Probability of DNA Evidence (Allowing for Population Substructure and Dependence)}
\description{
Calculates conditional probability of DNA evidence, given proposition about 
who the known and unknown contributors to the mixture were. 
All the  individuals involved in a case are assumed to come from the same
subpopulation with a given coancestry coefficient. Independence of alleles in 
the subpopulation (i.e., relatives are excluded) and dependence in the whole population is assumed.
}
\usage{
Pevid.gen(alleles, prob, x, T = NULL, V = NULL, theta = 0)
}
\arguments{
  \item{alleles}{ vector of distinct alleles (from one specific locus) found in 
    the crime sample.}
  \item{prob}{ vector of corresponding allele proportions in a population. 
   The allele proportions are estimated from the whole population.}
  \item{x}{ nonnegative integer. The number of unknown contributors to the mixture. }
  \item{T}{ object of class genotype (package \pkg{genetics}), or a vector of strings 
    where each string contains two alleles seperated by '/', corresponding to one known 
    contributor. The length of the vector equals the number of known contributors. 
    Default is NULL.
				 }
  \item{V}{ object of class genotype (package \pkg{genetics}), or a vector of strings 
    where each string contains two alleles seperated by '/', corresponding to one known 
    noncontributor. The length of the vector equals the number of known noncontributors. 
    Default is NULL.    
 }
  \item{theta}{ number from the interval [0,1). Coancestry coefficient \code{theta} describes 
    variation in allele proportions among subpopulations. Default is 0 (no variation, whole 
    population in Hardy-Weinberg equilibrium). The recommended values of theta are 0.01 for large 
    subpopulations such as USA, and 0.03 for small isolated subpopulations 
    (National Research Council, 1996).}
}
\details{
The general formula for the evaluation of the probability of DNA evidence (and its derivation) 
can be found in Zoubkova and Zvarova (2004). 

  If \code{theta = 0}, \code{Pevid.gen} returns the same numerical result as \code{\link{Pevid.ind}}.
}
\value{
probability of the DNA evidence
}
\references{ 
     Curran JM, Triggs CM, Buckleton J, Weir BS (1999), Interpreting DNA mixtures in structured populations,
     Journal of Forensic Sciences 44, 987-995.

     Evett IW, Weir BS (1998), Interpreting DNA evidence; Statistical
     genetics for forensic scientists. Sinauer, Sunderland, MA

     Fung WK, Hu YQ (2000), Interpreting forensic DNA mixtures: allowing for uncertainty 
     in population substructure and dependence, Journal of the Royal Statistical Society A 163, 241-254.
     
     National Research Council (1996), The evaluation of forensic DNA evidence National Academy Press, 
     Washington, DC.

     Zoubkova K, Zvarova J (2004), Statisticke metody ve forenzni genetice, Master's thesis, 
     Charles University, Prague.
     
 }
\author{ Miriam Marusiakova \email{maruskay@gmail.com}
 
The work was supported by the project 1M06014 of the 
Ministry of Education, Youth and Sports of the Czech Republic.}
\seealso{ \code{\link{Pevid.ind}}, \code{\link{LR.ind}}, \code{\link{Pmatch}} }
\examples{
   ## Rape case 
   ## The evidence profile: 
   m <- c(13, 14, 15) 
   ##  the victim's genotype:
   victim <- "13/14"
   ## the suspect's genotype 
   suspect <- "15/15"
   ## frequencies of alleles {13, 14, 15}:
   p <- c(0.042, 0.166, 0.106) 
   ## consensual partner of the victim
   partner <- "15/16"
   ## Prosecution proposition: 
   ## Contributors were the victim and the suspect.
   Pevid.gen( alleles = m, prob = p, T = c(victim, suspect), 
     V = partner, x = 0, theta = 0.03)
   ## Defence proposition: 
   ## Contributors were the victim and one unknown person.
   ## 
   ## Likelihood ratio for DNA evidence:
   ## structured population
   1/Pevid.gen( alleles = m, prob = p, T = victim, 
     V = c(suspect, partner), x = 1, theta = 0.03)
   ## Note: a person carrying both alleles different from the alleles 
   ## in the crime sample (e.g., with genotype "16/16") has no effect 
   ## on the value of LR: 
   1/Pevid.gen( alleles = m, prob = p, T = victim, 
     V = c(suspect, partner, "16/16"), x = 1, theta = 0.03)
   ## But the consensual partner of the victim having genotype "15/16" 
   ## influences the value of LR, compare:
   1/Pevid.gen( alleles = m, prob = p, T = victim, V = suspect, 
     x = 1, theta = 0.03)
   ## 
   ## population in Hardy - Weinberg equilibrium      
   1/Pevid.gen( alleles = m, prob = p, T = victim, 
     V = c(suspect, partner), x = 1)
   1/Pevid.gen( alleles = m, prob = p, T = victim, x = 1)
   ## compare
   1/Pevid.ind( alleles = m, prob = p, u = 15, x = 1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
