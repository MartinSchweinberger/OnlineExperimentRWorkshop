library(jaysire)

# set directory (deletes any existing old experiment builds in it)
my_directory <- file.path("starting_exp")
# create the empty folder if necessary
if(dir.exists(my_directory)) {
  unlink(my_directory, recursive = TRUE)
}

instructions <- trial_instructions(
  pages = c(
    "Welcome! Use the arrow buttons to browse these instructions",
    "In this experiment you will solve some equations.<BR><BR>It is <em>very important</em> that you do your best.",
    "Press the 'Forward' button to begin!"
  ),
  button_label_next = "FLAH",
  button_label_previous = "BLAH",
  show_clickable_nav = TRUE,
  post_trial_gap = 500
)

trial1 <- trial_html_button_response(
  stimulus = "13 + 23 = 36",
  choices = c("true", "false"),
  post_trial_gap = 500
)

trial2 <- trial_html_button_response(
  stimulus = "2 + 2 = 5",
  choices = c("true", "false", "I don't know"),
  stimulus_duration = 500,
  post_trial_gap = 500
)

build_experiment(
  timeline = build_timeline(instructions,trial1,trial2),
  path = my_directory,
  on_finish = fn_save_locally()
)


