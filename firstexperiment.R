# activate package
#library(devtools)
# download jaysier from github
#remotes::install_github("djnavarro/jaysire")
# activate package
library(jaysire)
# get help
#?trial_instructions
# inspect working directory
#getwd()
# define directory
expdirectory <- getwd()
# set directory (deletes any existing old experiment builds in the directory)
expdirectory <- file.path("starting_exp")
# create the empty folder if neccessary
if(dir.exists(expdirectory)){unlink(expdirectory, recursive = T)}

# create instructions for experiment
# ?trial_instructions for info on modifiaction
instructions <- trial_instructions(
  pages = c("Welcome! Use the arrow bottons to browse these instructions",
            "In this experiment you will solve some equations. <p> It is <em>very important</em> that you do your best.",
            "Press 'Forward' button to begin!"),
  button_label_previous = "Backward", button_label_next = "Forward",
  show_clickable_nav = T,
  post_trial_gap = 1000)

# create a trial/experiment
trial1 <- trial_html_button_response(
  stimulus ="13 + 23 = 36", 
  choice = c("True", "False"),
  post_trial_gap = 500)

# add trial
trial2 <- trial_html_button_response(
  stimulus ="2 + 2 = 5", 
  choice = c("True", "False", "I don't know."),
  stimulus_duration = 500,
  post_trial_gap = 500)

# build experiment
build_experiment(
  timeline = build_timeline(
    instructions, 
    trial1,
    trial2),
  #path = file.path("starting_exp"), 
  path = expdirectory,
  on_finish = fn_save_datastore())

# NOTE: to run, type the following line in the Console!
#run_locally(file.path("starting_exp"))
#run_appengine(expdirectory, "MSchweinbergerOERWorkshop")
