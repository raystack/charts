# Charts
Helm Charts for Open Data Platform

Use this repository to submit official Open Data Platform Charts for Helm. Charts are curated application definitions for Helm. For more information about installing and using Helm, see its README.md.

### Repository Structure

This GitHub repository contains the source for the packaged and versioned charts released in the Github Pages).
The Charts in the stable/ directory in the main branch of this repository match the latest packaged Chart in the Chart Repository, though there may be previous versions of a Chart available in that Chart Repository.
The purpose of this repository is to provide a place for maintaining and contributing official Charts, with CI processes in place for managing the releasing of Charts into the Chart Repository.
The Charts in this repository are organized into two folders:

stable
incubator
Stable Charts meet the criteria in the technical requirements.

Incubator Charts are those that do not meet these criteria. Having the incubator folder allows charts to be shared and improved on until they are ready to be moved into the stable folder. The charts in the incubator/ directory can be found in the Google Storage Bucket.
In order to get a Chart from incubator to stable, Chart maintainers should open a pull request that moves the chart folder.

Contributing a Chart
We'd love for you to contribute a Chart that provides a useful application or service for Kubernetes. Please read our Contribution Guide for more information on how you can contribute Charts.
Note: We use the same workflow, License and Contributor License Agreement as the main Kubernetes repository.
