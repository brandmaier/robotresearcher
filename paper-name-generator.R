#
# Title: Psychological research paper generator 
# Author: Andreas M. Brandmaier <brandmaier@mpib-berlin.mpg.de>
#
# Description: This program generates new research paper titles 
# by inserting random terms into title templates.
# The generated title may be posted to to a twitter account.
#
# 
#
# last modified:
# 12th May 2015


# List of title templates. Up to three placeholders can be
# included. Valid placeholders are <X>, <Y>, and <Z>.

titles <- c(
"The role of <X> in <Y>.",
"Age differences in the effect of <X> on <Y>. ",
"The prognostic value of <X> while controlling for <Y>",
"Adult age differences in <X>-related <Y>.",
"<X> or <Y>? A case study.",
"Does <X> affect <Y>? Results from the twin registry.",
"Does <X> affect <Y>? Results from a Swedish cohort study.",
"Does <X> and <Z> affect <Y>? A review.",
"A review of <X>-based <Y>.",
"<X>: A threat to <Y>?",
"Does <X> change with <Y>?",
"When does <X> matter most? A comparison with respect to <Y> and <Z>.",
"Benefits and costs of <X> and links to <Y>.",
"Chronic <X> causes <Y>.",
"Exploring the specificity of <X> with and witout <Y>",
"A systemic-wholistic view on differences of <X> in <Y>",
"Time lag changes in <X>: For better or worse of <Y>?",
"Intraindividual variability in <X> and <Y> in an older sample.",
"<X> predicts differences in perceived <Y>.",
"Analyzing <X> and <Y> and interaction effects with latent state-trait models.",
"Does <X> matter? A longitudinal study of the facilitating role of <Y>.",
"Overcoming <X>: The interactive roles of <Y> and <Z>.",
"<X>: Exploring contextual influences on <Y>.",
"Taking it to another level: Does <X> matter to firm <Y>?",
"Is <X> always beneficial? <Y> as a moderator.",
"<X> and <Y>:  A multifoci theoretical extension.",
"How and when <X> influences <Y>.",
"Interpreting relationships between <X> and <Y>.",
"Drivers of <X>: <Y> and <Z>.",
"From <X> to <Y>.",
"Using <X> and <Y> to predict <Z>.",
"Patterns and sources of <X> and <Y> in old age.",
"Costs and benefits of <X>. Why <Y> matters.",
"Self-reports of <X> and <Y>: Evidence for differential assessment.",
"<X>, <Y>, and <Z>: Evidence of cross-domain buffering effects",
"An integrated model of <X>, <Y>, and <Z>.",
"Gender differences in <X> and <Y>.",
"Beyond <X>: Influences of <Y> on <Z>.",
"The role of <X> in prediction of <Y>.",
"The relationship of <X> and <Y>. A preliminary empirical model.",
"The role of <X> on <Y>. A dyadic perspective."
)

terms <- c("false-memory formation", "environmental radioactivity", "emotional valence", "scientific success",
        "existential crisis", "nihilistic feeling", "globalization", "mathematical anxiety",
       "unwanted memory", "early marriage", "generosity", "midlife crisis", "canteen food consumption",
       "mobile phone use", "time until remarriage", "narcissism", "city pollution", "paranormal activity",
       "extrasensory perception", "gravitational theory", "the Oedipus complex", "climate change denial",
       "hypnosis treatment", "cat food consumption","work-family conflict","time allocation at work",
       "emotional exhaustion", "hand hygiene", "sleep quality","masculinity of smokers",
       "the aging brain","body modification","competition","complaining behavior",
       "the concept of self","emotional intelligence","humor","sadism","subliminal advertising",
       "visual perception","optimism","subjective well-being","cognitive development","peer pressure",
       "gambling","guilt","smoking cessation","sibling rivalry","birth order",
	   "egotistic admiration", "pursuit of gratification", "healthy self-love","egocentrism",
	   "normal development", "sexual narcissism", "social networking", "selfishness",
	   "agressive drive", "omnipotence", "self-enhancement", "oral fixation", "shame",
	   "guilt","anger","exhibitionism","pathological lying", "lack of empathy", "lack of guilt",
	   "antisocial behavior", "paranoia","mutual intimacy")
	   
tags <- c("#futurescience", "#researchproposal","#proposal","#psych","#psychresearch",
		"#fundraising","#letsdoit")

rndstr <- function(titles, num=1) {
  titles[sample(1:length(titles),num)]
}

tag <- sample(tags,1)

# random title
title <- rndstr(titles)
guess <- rndstr(terms,3)

title <- sub("<X>",guess[1],title)
title <- sub("<Y>",guess[2],title)
title <- sub("<Z>",guess[3],title)

title <- paste(
  toupper(substr(title,1,1)), 
  substr(title,2,nchar(title))
         ,sep="")
  




# send to twitteR
require("twitteR")

load("api.Rdata")

setup_twitter_oauth(apikey, apisecret, token, tokensecret)
tweet(paste(title, tag))

cat(title)