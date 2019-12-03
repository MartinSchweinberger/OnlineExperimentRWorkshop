var timeline = {
  "timeline": [
    {
      "type": ["instructions"],
      "pages": ["Welcome! Use the arrow bottons to browse these instructions", "In this experiment you will solve some equations. <p> It is <em>very important<\/em> that you do your best.", "Press 'Forward' button to begin!"],
      "key_forward": ["rightarrow"],
      "key_backward": ["leftarrow"],
      "allow_backward": true,
      "allow_keys": true,
      "show_clickable_nav": true,
      "button_label_previous": ["Backward"],
      "button_label_next": ["Forward"],
      "post_trial_gap": [1000]
    },
    {
      "type": ["html-button-response"],
      "stimulus": ["13 + 23 = 36"],
      "choices": ["True", "False"],
      "margin_vertical": ["0px"],
      "margin_horizontal": ["8px"],
      "response_ends_trial": true,
      "post_trial_gap": [500]
    },
    {
      "type": ["html-button-response"],
      "stimulus": ["2 + 2 = 5"],
      "choices": ["True", "False", "I don't know."],
      "margin_vertical": ["0px"],
      "margin_horizontal": ["8px"],
      "stimulus_duration": [500],
      "response_ends_trial": true,
      "post_trial_gap": [500]
    }
  ]
};

jsPsych.init(
{
  "timeline": [timeline],
  "on_finish": function() {
      $.post('submit',{"content": jsPsych.data.get().csv()})
    }
}
);
