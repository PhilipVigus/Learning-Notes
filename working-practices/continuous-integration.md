[Main TOC](../README.md)
# Continuous Integration
Continuous integration (CI) is where all developers' working copies are merged into a shared branch multiple times every day. The idea behind the concept is to prevent situations where an individual developer's working copy diverges significantly from the shared main branch.

There are several aspects to the technique:

1. Automated tests are run locally before any commit to the main repo, which helps make sure changes don't break another developer's work
2. The complete code is regularly compiled using build servers, with the results reported to developers. Unit tests are often run at this stage as well
3. Other quality control process are often integrated during the build phase, including integration tests and performance profiling