
# Feedback on Project Structure, Workflow, and Code Structure

**Student:** Saskia Pearce

---

## General Project Structure and Workflow

- **Directory Organization**: The project is well-organized, with weekly folders (`Week1`, `Week2`, `Week3`) and clear subdirectories (`code`, `data`, `results`, `sandbox`). This structure enhances readability and allows easy navigation through each week’s tasks and outputs.
- **README Files**: The README files provide an overview of each week’s focus and instructions on dependencies. However, adding specific usage examples for key scripts, such as `DataWrang.R`, `apply1.R`, `Girko.R`, and `TreeHeight.R`, could further clarify how to run these scripts and interpret outputs.

### Suggested Improvements:
1. **Expand README Files**: Include usage examples, input/output details, and expected results for complex scripts.
2. **Add .gitignore**: A `.gitignore` file is present but could include additional patterns for unnecessary temporary files.

## Code Structure and Syntax Feedback

### R Scripts in `week3/code`

1. **break.R**: This script demonstrates a loop with a break condition effectively. Adding inline comments explaining conditions like `i == 10` would improve readability.
2. **sample.R**: This script illustrates sampling techniques with and without vectorization. Adding comments summarizing performance differences would enhance understanding.
3. **Vectorize1.R**: This file demonstrates a time comparison between loop-based and vectorized summation. Adding comments to describe the performance benefits of vectorization would make it more instructive.
4. **R_conditionals.R**: Contains functions to check numeric properties. Expanding edge case handling (e.g., `NA` values) and adding detailed comments for each function would improve robustness.
5. **apply1.R**: Demonstrates `apply()` for row and column calculations effectively. Adding descriptions of each calculation step would improve readability.
6. **basic_io.R**: Manages file I/O well but encountered an error due to the missing `trees.csv` file. Streamlining redundant I/O operations could also improve efficiency.
7. **Girko.R**: Creates an eigenvalue plot using `ggplot2`, but ran into a runtime error. Ensuring required packages are pre-installed or documented would prevent such issues.
8. **boilerplate.R**: Basic template script with clear structure. Adding comments on argument types and function returns would make it more user-friendly.
9. **apply2.R**: Uses `apply()` to manipulate matrix rows. Adding comments to clarify the conditional checks in `SomeOperation` would enhance readability.
10. **DataWrang.R**: This script performs extensive data wrangling. Adding comments for each data transformation step would make the process easier to follow.
11. **control_flow.R**: Demonstrates control flow with if, for, and while statements. Adding a header summarizing each control type would clarify the purpose of each structure.
12. **MyBars.R**: This script uses `ggplot2` but encountered an error due to the missing `Results.txt` file. Including example data or specifying input requirements would prevent this.
13. **TreeHeight.R**: Calculates tree height from angles and distances but raised an error due to missing data. Including example data or an example calculation in comments would help demonstrate usage.
14. **plotLin.R**: Plots linear regression but encountered a runtime error with `ggplot2`. Verifying all libraries are loaded beforehand or including directory creation steps would prevent such issues.
15. **next.R**: Uses `next` within a loop to skip iterations. Adding comments explaining this usage would improve clarity.
16. **browse.R**: Contains interactive debugging points using `browser()`. Commenting out `browser()` in production code or moving this to `sandbox` would keep production scripts cleaner.
17. **preallocate.R**: Compares preallocation benefits well but encountered a runtime error. Comments describing performance timing would make it clearer.

### General Code Suggestions

- **Consistency**: Ensure consistent spacing and indentation across scripts for readability.
- **Error Handling**: Consider enhancing error handling, such as using `tryCatch()` in `try.R`, to allow for controlled responses to errors.
- **Comments**: Add more explanatory comments to complex scripts like `DataWrang.R` and `Girko.R` for easier understanding.

---
