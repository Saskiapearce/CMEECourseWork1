
# Final CMEE Bootcamp Assessment: Saskia

- You had an .gitignore, good! You could have done with more exclusions specific to certain weeks (remember that you can include/exclude subdirectories/files/patterns). You may [find this useful](https://www.gitignore.io).

- You had a good overall Readme which gave a sufficient overview of the Repo as a whole, and gave general details of things like languages used. You also had weekly Readme files which went into more details relevant to each week. You could have included versions of languages and dependencies/packages used. Also check out [this resource](https://github.com/jehna/readme-best-practices).


## Week 1

  - Organized directory structure with folders for `Code`, `Data`, `Results`, and `Sandbox` clearly defined.
  - README provided a detailed summary of scripts and usage, outlining dependencies and project purpose.
  - `.gitignore` file was missing initially, leading to unnecessary files (e.g., `.DS_Store`) being tracked.
  - Results directory was correctly left empty, adhering to good practices.
  - Shell scripts demonstrated basic syntax but lacked inline comments explaining key operations.
  - Scripts like `tabtocsv.sh` and `CountLines.sh` were functional - found some typos (e.g., "contenses"(?)).

## Week 2

  - README expanded to include Python dependencies and usage instructions for scripts like `align_seqs.py` and `basic_csv.py`.
  - Results directory contained processed files.
  - Missing input files like `testcsv.csv` caused runtime errors in scripts.
  - Also errors in `align_seqs.py` and `basic_io1.py` - needed more  testing of scripts.


## Week 3

  - README updated with detailed descriptions of dependencies and script functionalities.
  - Input datasets required for R scripts were not always available, causing runtime issues.
  - Results directory contained output files; these could have been excluded from version control.

## Week 4

  - Unexpected R script file `GLM02.R`?
  - README included installation instructions for complex dependencies like `ggpubr` and `WebPower` - good (but avoid using too many packages).
 - Large repository size (17.49 MiB) - potential inclusion of binary or unnecessary files.
- `Florida.R` implemented autocorrelation analysis and permutation tests correctly - but could have avoided the loop (with seting seed in each iteration!).
- Include more inline comments for statistical tests and assumptions.
- The report concisely presented findings but could have had a more thorough discussion of results.
- The Autocorrelation practical code was efficient, providing a correct answer to the question. The statistical and biological/ecological interpretations in the report could have been stronger; had a somewhat weak conclusion at the end.
- Your Groupwork practicals were all in order, and your group did well in collaborating on it based on the commit/merge/pull history. Check the groupwork feedback pushed to your group repo for more details.   

---

## Git Practices

- Initial commits were frequent but lacked descriptive messages (e.g., "final push"), making version history unclear.
- `.gitignore` improvements were implemented in Week 2 but did not cover all generated files.
- Repository size grew significantly due to committed binary files like PDFs and images.
- Use detailed commit messages to track changes effectively (e.g., "Added error handling to align_seqs.py").
- Avoid committing generated files or outputs by refining the `.gitignore` file.

---

## Overall Assessment

Overall, a very good job! 

You demonstrated consistent improvement across the coursework. 

Commenting could be improved -- you are currently erring on the side of overly verbose comments at times (including in your readmes), which is nonetheless better than not commenting at all, or too little! This will improve with experience, as you will begin to get a feel of what is ``common-knowledge'' among programmers, and what stylistic idioms are your own and require explanation. In general though, comments should be written to help explain a coding or syntactical decision to a user (or to your future self re-reading the code!) rather than to describe the meaning of a symbol, argument or function (that should be in the function docstring in Python for example).

It was a tough set of weeks, but I hope they have given you a good start towards further training, a quantitative masters dissertation, and ultimately a career in quantitative biology!

### (Provisional) Mark
 *75*