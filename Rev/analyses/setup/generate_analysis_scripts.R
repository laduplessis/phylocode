# NOTE: This file is setup to be sourced from the Rev folder
# Specify number of copies of analyses, initial seed
n_replicate_analyses <- 4
first_seed <- 42

GMRF_template <- readLines("analyses/setup/GMRF_bison_template.Rev")
HSRF_template <- readLines("analyses/setup/HSRF_bison_template.Rev")

seed <- first_seed
dir.create("analyses/src", recursive=TRUE, showWarnings=FALSE)

# Generate GMRF analysis files
for (i in 1:n_replicate_analyses) {
  this_GMRF <- GMRF_template
  this_GMRF <- gsub("THISSEED",seed,this_GMRF)
  this_GMRF <- gsub("THISREP",i,this_GMRF)
  cat(this_GMRF,file=paste0("analyses/src/analyze_GMRF_",i,".Rev"),sep="\n")
  seed <- seed + 1
}

# Generate HSRF analysis files
for (i in 1:n_replicate_analyses) {
  this_HSRF <- HSRF_template
  this_HSRF <- gsub("THISSEED",seed,this_HSRF)
  this_HSRF <- gsub("THISREP",i,this_HSRF)
  cat(this_HSRF,file=paste0("analyses/src/analyze_HSRF_",i,".Rev"),sep="\n")
  seed <- seed + 1
}