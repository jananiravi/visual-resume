## Creating a Visual Resume
## Janani Ravi
## October 18, 2018

# Set absolute path
library(here)
here()

# To read relevant Visual Resume datasets
library(tidyverse)
titles.l <- read_tsv("titles-left.txt", col_names=F)	# Left-aligned bylines
titles.r <- read_tsv("titles-right.txt", col_names=F)	# Right-aligned bylines
timeline <- read_tsv("timeline.txt")			# Data for Timeline
education <- read_tsv("education.txt")		# Data for Education
events <- read_tsv("events.txt")					# Data for events along the timeline

# Visual resume package by Nathaniel Phillips: https://github.com/ndphillips/VisualResume
library(VisualResume)
VisualResume::VisualResume(
	# TITLES
	titles.left = titles.l,			# Left text lines
	titles.right = titles.r,		# Right text lines
	titles.right.cex = c(2, 2, 1),
	titles.left.cex = c(3, 2, 1),
	# TIMELINE
	year.steps = 3,		# Year blocks 2002-2005-2008
	# col = c("red", "black"),
	trans = 0.5,			# Transparency of timeline blocks
	timeline.labels = c("Education", "Research"),	# Main Headings
	timeline.cex=1.4, events.cex=1.4, # Font size for timeline/events
	
	timeline = data.frame(title = timeline$org,		# Affiliation/Organization
												sub = timeline$role,		# Role at this position
												start = timeline$start,	# start YYYY of appointment
												end = timeline$end,			# end YYYY of appointment
												side = timeline$side),	# visual side of timeline 0/1
	# EDUCATION
	milestones = data.frame(title = education$org,	# University/Institute -> degree
													sub = education$degree,	# Degree e.g., BS, PhD, MD
													year = education$year),	# YYYY of completion
	# RESEARCH
	events = data.frame(year = events$year,
											title = events$title),
	interests = list(
									 "Comp/MathBio" = c(rep("Transcr. networks", 1),
									 									 rep("Dynamical Systems",1),
									 									 rep("Genomics", 1),
									 									 rep("Prob Models  ", 1)),
									 "Data Science" = c(rep("Analysis/Wrangling", 3),
									 									 rep("Tidyverse", 3),
									 									 rep("Visualization", 3),
									 								 rep("Stats&ML", 2)),
									 "Evolution" = c(rep("Phylogeny ", 1),
									 								rep("BLAST+ ", 1),
									 								rep("DB  ", 1),
									 								rep("Sequence-structure-function", 1)),
									 "Programming" = c(rep("R", 3),
									 									rep("C & C++", 3),
									 									rep("Matlab/Python", 2),
									 									rep("Unix/Linux", 4)))
)

