# piRNAPred

piRNAPred is an algorithm for the computational identification of piRNAs using features based on RNA sequence, structure, thermodynamic and physicochemical properties.

The PERL scripts, features used in the developemnt of piRNAPred algorithm along with the results and predictive models are provided here. Users can download individual files or can download the zipped version of piRNAPred (piRNAPred-GitHub.zip).

There are four folders within the piRNAPred algortihm folder:
1. Dataset files: FASTA and SVM format of main Dataset (D3349) and tissue specific datasets used in the development of piRNAPred. 

2. models: SVM-based predictive models MDTTP-A+B+C,  MDTTP-A+B+C+BINARY1+10 and models developed on the tissue specific datasets termed as testes-MDTTP-A+B+C+BINARY1+10 and  ovary-MDTTP-A+B+C+BINARY1+10

3. PERL scripts: open-access to the PERL scripts used to calculate k-mer nucleotide composition (k-MNC), thermodynamic, SSTE and physicochemical properties in their respective sub-folders. Further, PERL scripts to call SVMlight and implement 10-fold cross-validation (10nCV).

4. Results: Performance of individual and hybrid features during 10nCV.
