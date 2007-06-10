\name{LR.ind}
\alias{LR.ind}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Likelihood Ratio for DNA Evidence (Independent Alleles Within and Between Ethnic Groups) }
\description{
Calculates likelihood ratio for DNA evidence, comparing two hypotheses about the origin of the mixture
at the crime scene. Contributors to the mixture may come from one or more ethnic groups. Independence 
of alleles within and between ethnic groups is assumed. 
}
\usage{
LR.ind(alleles, prob, x1, x2, u1 = NULL, u2 = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{alleles}{vector of distinct alleles (from one specific locus) found in the crime sample}
  \item{prob}{matrix of allele proportions in a population. Element (i, j) contains proportion 
  of the i-th allele from \code{alleles} in the j-th ethnic group }
  \item{x1}{ vector of nonnegative integers. The j-th element contains number of unknown contributors 
  from the j-th ethnic group under the prosecution proposition. }
  \item{x2}{ vector of nonnegative integers. The j-th element contains number of unknown contributors 
  from the j-th ethnic group under the defence proposition. }
    \item{u1}{vector of alleles from the mixture, which are not carried by known contributors under 
    the prosecution proposition. 
      If \code{u1=NULL} (default), all alleles from the crime sample are carried by known contributors.}
    \item{u2}{vector of alleles from the mixture, which are not carried by known contributors under 
    the defence proposition. Default is \code{u2=NULL}.}
}
\details{ Likelihood ratio (LR) is computed as a ratio of two conditional probabilities of DNA evidence \eqn{E} 
\deqn{LR=\frac{P(E|H_0)}{P(E|H_A)},}{P(E|H_0) / P(E|H_A),}
where \eqn{H_0} denotes the prosecution proposition and \eqn{H_A} the defence proposition. 
For calculation of \eqn{P(E|H)} see \code{\link{Pevid.ind}}.

Likelihood ratio is used for assigning the weight of evidence for one locus. The overall LR can be obtained
by multiplying over all loci, under the assumption of independent alleles between loci. 
   
}
\note{We only need to specify the ethnic groups to which the unknown contributors
belong to. We do not need to care about the ethnic groups of the known contributors.   }
\value{
likelihood ratio for DNA evidence at the crime scene 
}
\references{
Evett IW, Weir BS (1998), Interpreting DNA evidence;
  Statistical genetics for forensic scientists. Sinauer, Sunderland, MA.

Fukshansky N, Bar W (1998), Interpreting forensic DNA evidence on the basis of hypotheses testing.
International Journal of Legal Medicine 111, 62-66.

Fung WK, Hu YQ (2001), The evaluation of mixed stains from different ethnic origins: general result
and common comments. International Journal of Legal Medicine 115, 48-53.

Weir BS, Triggs CM, Starling L, Stowell LI, Walsh KAJ, Buckleton J (1997), 
Interpreting DNA mixtures. Journal of Forensic Sciences 42, 213-222. 

 }
\author{ Miriam Marusiakova \email{maruskay@gmail.com} 

The work was supported by the project 1M06014 of the 
Ministry of Education, Youth and Sports of the Czech Republic.}
\seealso{ \code{\link{Pevid.ind}}, \code{\link{Pevid.gen}} }
\examples{
## Simpson case (Fung and Hu (2001))
## From the crime scene: mixed profile a,b,c at a locus D2S44 
m = c("a", "b", "c")
## profile of the defendant: a,b
## profile of the victim: a,c
## allele frequencies (African - American, Caucasian)
p_aa <- c(0.0316, 0.0842, 0.0926)
p_c <- c(0.0859, 0.0827, 0.1073)
## the number of contributors to the mixed sample is taken 2
## Prosecution proposition: Contributors were the victim and the suspect 
## Defence proposition: Contributors were 2 unknown people
##
## Likelihood ratios for DNA evidence for different alternatives:
## two unknown people are African-American
LR.ind(alleles = m, prob = cbind(p_aa, p_c), x1 = c(0, 0), 
  x2 = c(2, 0), u2 = m)
LR.ind(alleles = m, prob = p_aa, x1 = 0, x2 = 2, u2 = m)
## one unknown person is African-American and one is Caucasian 
LR.ind(alleles = m, prob = cbind(p_aa, p_c), x1 = c(0, 0), 
  x2 = c(1, 1), u2 = m)
## two unknown people are Caucasian
LR.ind(alleles = m, prob = cbind(p_aa, p_c), x1 = c(0, 0), 
  x2 = c(0, 2), u2 = m)
LR.ind(alleles = m, prob = p_c, x1 = 0, x2 = 2, u2 = m)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
