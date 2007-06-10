\name{Pevid.ind}
\alias{Pevid.ind}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Probability of DNA Evidence (Independent Alleles Within and Between Ethnic Groups)}
\description{
Calculates conditional probability of DNA evidence, given proposition about who the known and 
unknown contributors to the mixture were. Contributors to the mixture may come from one or 
more ethnic groups. Independence of alleles within and between ethnic groups is assumed. 
}
\usage{
Pevid.ind(alleles, prob, x, u = NULL)
}
\arguments{
  \item{alleles}{vector of distinct alleles (from one specific locus) found in the crime sample}
  \item{prob}{matrix of allele proportions in a population. Element (i, j) contains proportion 
  of the i-th allele from \code{alleles} in the j-th ethnic group }
  \item{x}{ vector of nonnegative integers. The j-th element contains number of unknown contributors 
  from the j-th ethnic group. }
  \item{u}{vector of alleles from the mixture, which are not carried by known contributors (and have 
  to be carried by some unknown contributors). 
  If \code{u=NULL} (default), all alleles from the crime sample are carried by known contributors.}
}
\details{
The formula for the evaluation of the probability of DNA evidence (and its derivation) can be found 
in Fukshansky and Bar (1998) and in Fung and Hu (2001) (different derivation of the formula). 
}
\value{
probability of DNA evidence
}
\references{ 
Evett IW, Weir BS (1998), Interpreting DNA evidence;
  Statistical genetics for forensic scientists. Sinauer, Sunderland, MA.

Fukshansky N, Bar W (1998), Interpreting forensic DNA evidence on the basis of hypotheses testing.
International Journal of Legal Medicine 111, 62-66.

Fung WK, Hu YQ (2000), Interpreting DNA mixtures based on the NRC-II recommendation 
4.1. Forensic Sci Commun. Available at http://www.fbi.gov/hq/lab/fsc/backissu/oct2000/fung.htm

Fung WK, Hu YQ (2001), The evaluation of mixed stains from different ethnic origins: general result
and common comments. International Journal of Legal Medicine 115, 48-53.

Fung WK, Hu YQ (2002), The statistical evaluation of DNA mixtures with contributors from 
different ethnic groups. International Journal of Legal Medicine 116, 79-86. 

Weir BS, Triggs CM, Starling L, Stowell LI, Walsh KAJ, Buckleton J (1997), 
Interpreting DNA mixtures. Journal of Forensic Sciences 42, 213-222. 

}
\author{ Miriam Marusiakova  \email{maruskay@gmail.com} 

The work was supported by the project 1M06014 of the 
Ministry of Education, Youth and Sports of the Czech Republic.}
\seealso{ \code{\link{LR.ind}}, \code{\link{Pevid.gen}} }
\examples{
## Simpson case (Fung and Hu (2001))
## From the crime scene: mixed profile a,b,c at the locus D2S44 
m = c("a", "b", "c")
## profile of the defendant: a,b
## profile of the victim: a,c
## the number of contributors to the mixed sample is taken 2
## Prosecution proposition: Contributors were the victim and the suspect.
## (The defendant was an African-American and the victim was a Caucasian,
## but we do not need this information for the calculation of LR)
## Defence proposition: Contributors were 2 unknown people.
## allele frequencies (African - American, Caucasian)
p_aa <- c(0.0316, 0.0842, 0.0926)
p_c <- c(0.0859, 0.0827, 0.1073)
##
## Likelihood ratios for DNA evidence for different alternatives:
## two unknown contributors were African-American
1/Pevid.ind(alleles = m, prob = cbind(p_aa, p_c), x = c(2, 0), u = m)
1/Pevid.ind(alleles = m, prob = p_aa, x = 2, u = m)
## one unknown contributor was African-American and one was Caucasian 
1/Pevid.ind(alleles = m, prob = cbind(p_aa, p_c), x = c(1, 1), u = m)
## two unknown contributors were Caucasian
1/Pevid.ind(alleles = m, prob = cbind(p_aa, p_c), x = c(0, 2), u = m)
1/Pevid.ind(alleles = m, prob = p_c, x = 2, u = m)

## Rape case in Hong Kong (Fung and Hu (2000), Fung and Hu (2002))
## the mixed stain at D3S1358
m = c(14, 15, 17, 18)
## suspect's genotype (14, 17)
## If the mixed stain did not originate from the victim, 
## we may consider the propositions:
## Prosecution: The contributors were the suspect and an unknown
## Defence: The contributors were two unknowns
## Arrested suspect was a Caucasian
## Possible ethnic groups of the unknowns:
## Caucasian, Chinese
p_ca = c(0.187, 0.213, 0.223, 0.127)
p_ch = c(0.033, 0.331, 0.239, 0.056)
## the both unknowns are Caucasian
Pevid.ind(alleles = m, prob = p_ca, x = 1, u = c(15, 18))/
  Pevid.ind(alleles = m, prob = p_ca, x = 2, u = m)
## first unknown is Caucasian, the second one Chinese
Pevid.ind(alleles = m, prob = p_ca, x = 1, u = c(15, 18))/
  Pevid.ind(alleles = m, prob = cbind(p_ca, p_ch), x = c(1, 1), u = m)
## first unknown is Chinese, the second one Caucasian
Pevid.ind(alleles = m, prob = p_ch, x = 1, u = c(15, 18))/
  Pevid.ind(alleles = m, prob = cbind(p_ca, p_ch), x = c(1, 1), u = m)
## the both unknowns are Chinese
Pevid.ind(alleles = m, prob = p_ch, x = 1, u = c(15, 18))/
  Pevid.ind(alleles = m, prob = p_ch, x = 2, u = m)
##
## Suppose the second suspect (Caucasian, (15, 18)) was arrested 
## Prosecution: The contributors were the two suspects 
## Defence: The contributors were two unknowns
## the both unknowns are Caucasian
1/Pevid.ind(alleles = m, prob = p_ca, x = 2, u = m)
## first unknown is Caucasian, the second one Chinese
1/Pevid.ind(alleles = m, prob = cbind(p_ca, p_ch), x = c(1, 1), u = m)
## first unknown is Chinese, the second one Caucasian
1/Pevid.ind(alleles = m, prob = cbind(p_ca, p_ch), x = c(1, 1), u = m)
## the both unknowns are Chinese
1/Pevid.ind(alleles = m, prob = p_ch, x = 2, u = m)

}
\keyword{misc }
