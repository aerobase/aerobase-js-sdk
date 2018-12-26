# How to contribute

Thank you for your interest in contributing to the AeroBase project. We want
keep this process as easy as possible so we've outlined a few guidelines below. 
For more information about the AeroBase community and project , visit 
[our website](https://aerobase.io/community/).

## Asking for help

Whether you're contributing a new feature or bug fix, or simply submitting a ticket, the AeroBase team is available for technical advice or feedback. 
You can reach us at #aerobase on [Freenode IRC](https://freenode.net/) or join the  [mailing list](https://groups.google.com/forum/#!forum/aerobase)
-- both are actively monitored.

## Getting started

* Make sure you have a [JIRA account](https://aerobase.atlassian.net)
* Make sure you have a [GitHub account](https://github.com/signup/free)
* Submit a ticket for your issue to the 
[AeroBase project]("https://aerobase.atlassian.net/projects/AEROBASE), assuming one does 
not already exist.
  * Clearly describe the issue including steps to reproduce when it is a bug.
  * Make sure you fill in the earliest version that you know has the issue.
* Fork the repository on GitHub.

## Making changes

* Create a topic branch from where you want to base your work.
  * This is usually the master branch.
  * To quickly create a topic branch based on master; `git checkout -b
    <branch name> master`. By convention we typically include the JIRA issue 
    key in the branch name, e.g. `AEROBASE-1234-my-feature`.
  * Please avoid working directly on the `master` branch.
* Make commits of logical units.
* Prepend your commit messages with a JIRA ticket number, e.g. "AEROBASE-1234: Fix
  spelling mistake in README."
* Follow the coding style in use.
* Check for unnecessary whitespace with `git diff --check` before committing.
* Make sure you have added the necessary tests for your changes.
* Run _all_ the tests to assure nothing else was accidentally broken.

## Submitting changes

* Push your changes to a topic branch in your fork of the repository.
* Submit a pull request to the repository in the [AeroBase GitHub organization]
  (https://github.com/aerobase) and choose branch you want to patch 
  (usually master). 
  * Advanced users may want to install the [GitHub CLI](https://hub.github.com/) 
    and use the `hub pull-request` command.
* Update your JIRA ticket to mark that you have submitted code and are ready 
for it to be reviewed (Status: Dev Complete).
  * Include a link to the pull request in the ticket.
* Add detail about the change to the pull request including screenshots 
  if the change affects the UI.

## Reviewing changes

* After submitting a pull request, one of AeroBase team members will review it.
* Changes may be requested to conform to our style guide and internal 
  requirements.
* When the changes are approved and all tests are passing, a AeroBase team
  member will merge them.
* Note: if you have write access to the repository, do not directly merge pull 
  requests. Let another team member review your pull request and approve it.

# Additional Resources

* [General GitHub documentation](http://help.github.com/)
* [GitHub pull request documentation](https://help.github.com/articles/about-pull-requests/)
* [Read the Issue Guidelines by @necolas](https://github.com/necolas/issue-guidelines/blob/master/CONTRIBUTING.md) for more details
