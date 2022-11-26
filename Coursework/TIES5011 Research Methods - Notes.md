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
  
## Week 3: Simulation

### Simulation process (Dooley 2002)

A simulation, in general, is a computer program whose behavior
approximates that of some dynamic system.
Simulations can be used to make predictions on how the systems
they approximate will evolve in the future or respond to changes
in parameters. In other words it can answer "what if" questions,
whereas other research methods have more limited predictive power.

Three main types of simulation:
- Discrete event simulation
	- System consists of state elements (often resources and consumers)
	  which interact in a discrete manner, only changing at a finite number
	  of time instances
	- May be "stochastic", meaning random distributions are involved for
	  some parts of state, e.g. time intervals.
	  This requires in-depth statistical analysis
	- "Bottom-up" method, i.e. interaction is described locally and
	  larger patterns emerge from simulation
	- Topic of the course TIES481 Simulation at JYU
- System dynamics
	- System consists of continuous variables whose interactions
	  are described by differential equations
	- Solution done with numerical methods (or in rare cases
	  possible analytically)
	- Most commonly used in physics (since the vast majority of physics
	  models are differential equations), but can also model e.g.
	  biological and economic systems (populations, markets)
	- "Top-down" approach, i.e. interaction is described globally
	  and there is no "emergent" behavior, many properties of solutions
	  are known in advance
	- This is the stuff I do, topic of courses like TIES594 PDE Solvers
- Agent-based simulation
	- System consists of agents encapsulating variables and behaviors
	  interacting with each other and external resources
	  to maximize some measure of utility (or minimize some measure of cost)
	- Similar to discrete event simulation if employed in a discrete
	  setting (and also touched upon on the course TIES481 Simulation),
	  sometimes even interchangeable
	- Unlike DES, can also operate in continuous state space,
	  and agents can encode behavior that changes both
	  per individual and over time (learning)
	- Also a "bottom-up" method

Purposes of simulation:
- Prediction
	- The most common purpose, simulation used to test changes to systems
	  that are expensive, dangerous, or impossible to test experimentally
	- Model validity is extremely important
- Theory discovery
	- Simulation can explore a large variety of systems that don't need to
	  exist in the real world, potentially leading to surprising results
	  that suggest new theories or topics of experimental research
- Performance
	- Prediction combined with optimization to find parameters that
	  give the best results by some metric
- Training
	- Interactive simulations used to train people to operate in situations
	  that are dangerous or difficult to arrange in the real world
- Education
	- Instead of training a practical skill, using simulations to illustrate
	  and gain insight into how complex systems work
- Entertainment
	- Simulation is common in video games not just as an educational
	  component but also a fun one
- Proof
	- "Prove existence of a possible solution"?
	  This doesn't sound like what mathematicians call a proof.
	  I don't quite get what this one's about

Stages of a simulation study:
- Conceptual design
	- Deciding the simulation method, elements and parameters
	  of the system, etc.
- Development of the simulation program
	- Writing the code. General software development practices apply
- Validation
	- Measuring how well the simulation predicts the real system
	  (more on this after I read the other paper)
- Experimental design
	- Coming up with experiments to run using the simulation
	  that produce statistically valid results on the effects of parameters,
	  similar to designing real-world experiments
- Implementation
	- Running the experiments and gathering results
- Analysis and interpretation
	- Assessment of statistical properties of results
	  and making conclusions based on this

### Validation (Martis 2006)

To validate a model is to confirm that it predicts the behavior
of the real system it simulates to a desired degree of accuracy.
Without validation there can't be confidence about the applicability
of simulation results to real situations.

In general, there's no way to *prove* that a model is valid
and no single way to test validity. Instead, multiple tests should
be performed, each increasing confidence in the model's validity.
Criteria for validity depend on the purposes of the model;
validity means it is useful for its designated purposes.
A valid model will still most likely break down in most situations
it isn't meant for.

The process of validation involves quantifying error, uncertainty
and their causes where possible, followed by comparison with
real data. In the case of stochastic simulations this requires
statistical analysis; with deterministic models it's more simple
since there's no uncertainty.

Failure in validation can originate from multiple places:
the model itself, the simulation implementation, 
the data fed to it, the real data compared against, etc.
This is one of the reasons why many tests are required
for satisfactory validation.

Martis (2006) lists a wide variety
of questions one can ask during the verification process, e.g.
about relating the structure and parameters of the model
to real-life structures and quantities or examining simulation
behavior with small or extreme variations in parameter values.
These are categorized as tests of _suitability_ (whether the model
is internally coherent and describes the right things),
_consistency_ (whether the model applies under all desired conditions)
and _utility/effectiveness_ (whether the model can be used by the
desired audience and for the desired purposes).

### Application to a master's thesis

Questions of model building and robust verification likely require
too much expertise to be feasible at a master level.
On the other hand, implementing simulations based on existing models
is much simpler, typically only a moderate amount of work,
and can apply to a variety of topics which may make good thesis subjects.
A simulation study can combine IT with many other fields such as physics,
sociology, or economics, which makes it an attractive choice for students
interested in multidisciplinary study.

### Sources

- Dooley, K. (2002), “Simulation research methods,”
  Companion to Organizations, Joel Baum (ed.),
  London: Blackwell, p. 829-848.
- Martis, M. (2006). "Validation of Simulation Based Models:
  A Theoretical Outlook". The Electronic Journal of Business
  Research Methods Volume 4 Issue 1, pp. 39-46

## Week 4: Theoretical-conceptual research

Theoretical-conceptual research concerns itself with
the development of theories, models and frameworks. The purpose
of these things is to explain how some phenomenon works in a way
that is consistent with results of previous research and can be used
to predict future results. Theories can be derived from empirical
research or by logical deduction from a set of axioms.

Theories are built out of concepts and constructs. Concepts exist
on the language level to put the theory to words, while constructs are
the objects/variables/whatever whose interactions the theory describes.
Järvinen (???) presents the structure of a theory according to Weber,
which consists of constructs, laws of their interaction, and a permitted
region of state and event space. Here state space describes the possible
states constructs can be in, and event space describes transitions between
different states.

There is not a single agreed upon definition of what constitutes a theory,
but theories can be categorized based on purposes:
- analysis and description
	- answers "what is" by categorizing and describing, e.g. taxonomies
- understanding
	- answers "how" and "why" but does not predict the future
- prediction
	- answers "what will happen", but may not necessarily explain how or why
- explanation and prediction
	- all of the above included in one. "traditional" theory
- planning and action
	- answers "how to act to achieve the best results",
	  similar to prediction but requires more information

Järvinen (???) describes a few example theories, one on the
correspondence between states of reality and states of information systems
informing users about reality, one on the common control flow
found in structural programming, and one on assessing how successful
information systems are. A common feature of these is that they
are taking several examples and producing one abstract description
that encapsulates important parts of all examples (importance being
defined subjectively based on the needs of the researchers).

The way theories provide unified abstractions over real phenomena
reminds me of abstraction in programming. We define a language/interface
to express ideas in the problem domain, and the simpler the interface
the less it can be generalized to different circumstances. How much
to simplify depends on the needs of the user.

Järvinen (???) doesn't provide much of a discussion of what's important
in theoretical studies. I think it's crucial to decide strictly the field the
theory should apply to and gather comprehensive reference literature.
A strong understanding of all that literature is necessary to come up
with a theory that encapsulates it all in a generalizable way.
For deductive theory development knowing the field is less crucial
but still important, otherwise you run the risk of proving something
already known.

Koskela et al. (2013) present a "conceptual analysis" of group management
systems in peer-to-peer networking. The study is structured much like a
literature review, with the purpose being to classify and compare
methods found in literature. This fits in the "analysis and description"
category defined earlier. They first define terminology for components of P2P
systems, different methods of implementing those components, and
desirable properties of systems like performance, security, scalability, etc.
They then proceed to analyze how different methods affect these properties
in different systems described in the literature.

For a master's thesis, this is definitely the most challenging method
discussed so far. While it resembles a literature review, developing
theory requires thorough examination of sources and deep expertise
in the field generally. I think this is feasible in a master's thesis
only if the student already has significant experience in the field,
which probably requires a highly specific topic.

Sources:
- Järvinen, ?. (???). Teoreettis-käsitteellinen tutkimus.
- Koskela, T., Kassinen, O., Harjula, E., & Ylianttila, M. (2013).
  P2P group management systems: A conceptual analysis.
  ACM Computing Surveys (CSUR), 45(2), 20.
  [link](https://dl.acm.org/doi/pdf/10.1145/2431211.2431219?casa_token=s8zWUD3icD0AAAAA:lA3XusN6eYyDJuJT4u5gw-2rOnuHX8eFmyA7pei792cUgQZeFW0EN_SHFGZB9JMbsKvcnVgjqUC6xA)

## Week 5: Diverse other methods

Many topics this week; mine is "controlled experiment". Specifically,
Ko et al. (2015) talk about experiments involving humans using software
and looking for quantitative results.
The following is all paraphrased from the aforementioned article.

Experimental studies are historically rare in software engineering
due to their difficulty to perform correctly and risk of
inconclusive results. The first difficulty is coming up with a
research question that can be answered by a quantitative experiment.
These should be related to some measurable quality such as speed
(do users get things done faster with this tool than another)
or some other measure of efficiency or usefulness.

These questions can be answered using other methods like case studies,
but a controlled experiment has the advantage of the best _variable
isolation_ — it's the strongest kind of study for determining effects
of changes in a single variable. In these cases that variable is
usually a software system. This is accomplished using a _control group_,
which receives all the same conditions as the _experimental group_,
except that the variable being studied is set to some baseline alternative.

It may be difficult to design conditions in a way that only
changes the intended variable between the control and the experiment.
Both groups' conditions need some degree of realism,
which presents a tradeoff since more realism likely means more divergence
between the control and experimental conditions and thus worse variable
isolation.

Parts of a study that need to be designed in advance:
1. Recruitment
	- Finding people willing to participate
	- Strategies may vary depending on demographic, e.g. students
	  are easier to reach than professional developers
	- Number of people to recruit can be decided using a _power analysis_
	  assessing things like expected effect size and variation
2. Selection
	- Picking people representative of the intended population, e.g.
	  if measuring a tool for web developers, picking people with experience
	  in web technologies
3. Consent
	- Written **informed** consent from participants is required
	  for ethical reasons
4. Procedure
	- Designing the actions participants will take, along with instructions
	  they will receive
5. Demographic measurements
	- Gathering relevant data about the participants, e.g. experience
	- Parts of this may happen during recruitment if it's part of
	  the selection criteria
6. Group assignment
	- Placement of participants in groups (control & experiment)
	- Often done randomly for even distribution of demographic variables
	- With low sample sizes random assignment may not perform well, in these
	  cases there are alternatives such as _within-subjects_ experiments
	  where every participant does both a control task and an experiment task
7. Training
	- Teaching participants tools and terminology they need in their tasks
	- Should aim to give every participant the same skills that they
	  would already have if they were using the software in real life,
	  increasing the robustness of the control
	- training for software that takes a long time to learn is difficult and
	  expensive -> experiments are better suited for software that is easy to learn
8. Tasks
	- Design of tasks is where the tradeoff between realism and control
	  happens — more moving parts and options in a task leads to
	  more realism and less control
	- Tasks can be "found" in practical scenarios or designed from scratch;
	  found tasks are, again, more realistic but less controllable
9. Outcome measurements
	- After tasks are done, measuring things like degree of success,
	  time to complete, etc. depending on research questions
	- Measuring success requires defining a goal state and a way of
	  determining when it has been reached, along with communicating these
	  to participants in an unambiguous way so as not to introduce
	  extraneous variation from misunderstanding of the goals
	- Participant self-assessment can provide information that's harder to
	  quantify objectively such as "usefulness", but this requires asking
	  good questions to be valid. Already validated models and standard
	  questionnaires can help with this
10. Debrief and compensate
	- Technically optional, but good ethical practice. Tell participants
	  how they did, what the correct solutions to tasks were,
	  how the results will be studied etc.
	  and give them whatever compensation was agreed upon

Ways to increase confidence in an experiment's ability to measure the
intended variable:
- increase the effect of the variable
	- the more difference between the experimental software and the
	  baseline used for control, the easier it is to observe that difference
- increase the number of participants
	- the more people, the smaller differences will be statistically significant
- decrease extraneous variation
	- variation is considered extraneous if it comes from factors that
	  aren't "natural" variation that exists in the real world
	  like participants' ability to learn quickly; i.e. factors arising
	  from the artificial nature of the experiment

Pilot studies with smaller groups of participants can be used to
eliminate problems in the experiment construction before carrying out the
study with the full group, but this is not common practice in software
engineering yet. For instance this could find usability problems in the
experiment software that would otherwise make it difficult to assess
the usefulness of that software's functionality.

Sources:
- Ko, A. J., Latoza, T. D., & Burnett, M. M. (2015).
  A practical guide to controlled experiments of software engineering tools
  with human participants. Empirical Software Engineering, 20(1), 110-141.
  [link](https://link.springer.com/article/10.1007/s10664-013-9279-3)