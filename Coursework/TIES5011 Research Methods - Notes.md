## Week 1: Systematic literature mapping & review

Both types of studies are about collecting a representative sample
of all the literature in a field/topic of research.
The objective of mapping studies is a summary/inventory
of work in the field, examining things like recent trends,
whereas reviews gather evidence on a specific topic and aim
to produce new conclusions via quantitative analysis.
Mapping studies can serve as inputs for reviews, reusing the search
and taking a closer look at the results of articles found.

Tasks to perform when doing a study like this (paraphrased from
Petersen et al. (2008) and Kitchenham & Charters (2007)):
1. planning
	- identify need, specify research questions and scope
	- develop a protocol for search, review, etc. and evaluate it
2. conducting
	- gather articles using your search strategy
	- select your starting set of studies from these
	  using your selection criteria
	- develop the search further based on initial results (snowball etc.)
	- evaluate the search results (is this a good sample of the population)
	- possibly extract data relevant to the research questions
	  and synthesize summarizing data
3. reporting
	- disseminate (i.e. publish and promote) the results:
	  journals, press releases, posters, websites etc.
	- create appropriate formats of the report for all release platforms
	- possibly solicit peer review if publishing outside of journals
	  (for journals review is done by the journal)
	  
Important considerations:
- must have a well-defined research question
- must have clear rules for classifying and selecting articles
  to include and exclude, which should aim for a representative sample
  of all research on the topic
	- guidelines exist for these which should be cited to make evaluation easier
- process of searching for articles should also be documented;
  keywords and search engines used etc. as well as the methods of
  coming up with keywords and testing the completeness of the search.
- the goal of the last two points is to make the process repeatable
- gathering a broad starting set is crucial. With articles from multiple
  communities, publishers, times etc. the "snowball" stage
  (gathering citations of the starting set) is effective
	- it can't ever be known whether the entire field is covered though,
	  we can only give an educated guess
- multiple people should participate in the selection process
  to reduce likelihood of biased results
- validity threats (reasons why the results may be incorrect or invalid,
  e.g. researcher bias or poorly defined classification criteria)
  should be discussed and mitigated
- tooling for bibliography management is very important at this scale

For a master's thesis, this is an attractive kind of study for those
looking to continue to a PhD because it gives the student a good
overview of their field of choice early on in their studies.
However, doing a study like this thoroughly is a very
large amount of work, likely too much for many students.
Since it's very similar to our usual literature review bachelor's thesis
in the IT faculty, only with additional depth and rigor,
similar topics such as my review of real-time fluid simulation
techniques would be applicable.

Sources:
- Petersen, K., Feldt, R., Mujtaba, S., & Mattsson, M. (2008, June).
  Systematic mapping studies in software engineering.
  In Ease (Vol. 8, pp. 68-77).
- B. Kitchenham and S. Charters, “Guidelines for performing
  systematic literature reviews in software engineering,”
  Tech. Rep. EBSE 2007-001, 2007. N.B.
  [link](https://www.researchgate.net/profile/Barbara-Kitchenham/publication/302924724_Guidelines_for_performing_Systematic_Literature_Reviews_in_Software_Engineering/links/61712932766c4a211c03a6f7/Guidelines-for-performing-Systematic-Literature-Reviews-in-Software-Engineering.pdf)

## Week 2: Design Science

Design science is a kind of research that creates and then
evaluates artifact-based (software, hardware, models, etc.,
categories of artifacts covered later in this note)
solutions to observed problems.

Essential questions (Hevner et al. 2004):
> What utility does the new artifact provide?
> What demonstrates that utility?

Steps (Peffers et al. 2007):
1. problem identification and motivation
	- what's the problem we're solving and why is it a problem?
	- what's the current state of the art?
	- similar to requirements construction in engineering
2. definition of the objectives for a solution
	- in what ways do we intend to improve on the current state of the art?
	- quantitative (efficiency improvement) or qualitative
	  (solution to problems not solved before, improvement of user experience)
	  improvement? (or both?)
3. design and development
	- actually make the thing
	- this part takes engineering skill and creativity, and varies a lot
	  depending on the nature of the artifact
4. demonstration
	- practically use the artifact to solve the intended problem
5. evaluation
	- measure or otherwise assess how well the solution worked
	- also varies a lot based on the artifact, could be e.g. precise
	  metrics like execution time or indirect results like
	  survey results, simulations
6. communication
	- publish results and promote them to other practicioners of the field
	- journals, conferences etc. as well as less formal avenues as appropriate

These steps need not be sequential. Principles of agile development
can be applied, and any of the first four steps may be the starting point.

This is very similar to regular engineering, and indeed engineering projects
can often be turned into design science research. All that is needed is
knowledge of prior art, a goal that is somehow novel in light of said
prior art, and a rigorous way of evaluating success.

Types of artifacts (Hevner et al. 2004):
- constructs
	- language frameworks and concepts for communicating problems and solutions
	- e.g. numbers and symbols in math, terminology of OOP/FP
	  such as objects, inheritance, pure functions, side effects
- models
	- problems and solutions represented using constructs,
	  without actually implementing them
	- e.g. agile/scrum as organisational models,
	  mathematical models of physical phenomena
- methods
	- problem solving processes
	- range from mathematical algorithms to collections of best practices
	- e.g. the practice of agile/scrum, numerical methods
	  to solve mathematical models of physical phenomenta
- instantiations
	- actual products, software or otherwise
	- the previous notes on Peffers et al. (2007) focus on these

For a master's thesis, the scope of the artifact has to be quite limited
due to limited time and the expectation of working alone. This may
make it difficult to come up with a good topic, but such a thesis would
serve as good practice especially for students looking to move on to
engineering jobs rather than PhD studies.

I think my thesis subject could be described as design science.
I'm creating an artifact based on a model and method in order
to evaluate the mathematical properties of the method.
On the other hand it could also be taken as simulation,
which is next week's topic.

Sources:
- Hevner, A., March, S., Park, J., & Ram, S. (2004).
  Design Science in Information Systems Research.
  MIS Quarterly, Vol. 28, No. 1 (Mar., 2004), pp. 75-105.
  [link](https://www.jstor.org/stable/pdf/25148625.pdf?casa_token=aL-GOZaR53MAAAAA:OHDaJqZo_pFGz8lfLtSMCDnZobIjuDE5YA6R18l14IfkrAZxEykZQPQt9Tg9Kn7yBScW6VNpyQMlpz45V1lq6y9xOOnTCu3jb02jy4Ax5R964cSCHwRL)
- Peffers, K., Tuunanen, T., Rothenberger, M. A., & Chatterjee, S. (2007).
  A design science research methodology for information systems research.
  Journal of management information systems, 24(3), 45-77.
  [link](https://www.tandfonline.com/doi/pdf/10.2753/MIS0742-1222240302?casa_token=tCCWvIYR2kQAAAAA:bcia-j5KrTlDtlybwXGESz3a16UQKa5LldkzRl0g5pfZIsWgTc8k-vIEoyzsnqMykjA33CvyHj18CA)