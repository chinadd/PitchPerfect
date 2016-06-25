# PitchPerfect
Create an iPhone app that records a conversation with you and a friend and plays it back to make you sound like a chipmunk or Darth Vader!

Basic Functionality

The app contains two pages of content (one each for recording and playing audio), and uses UINavigationController to navigate between these two scenes.
UI elements are appropriately positioned on the screen for iPhone and iPad portrait and landscape layouts.

Actions and Outlets

The app connects each button on the Storyboard to the correct IBAction method.
In the first scene, the Record and Stop buttons are enabled and disabled appropriately. When no recording is taking place, the Record button is enabled and the Stop button is disabled. When recording is taking place, the Record button is disabled and the Stop button is enabled.

AVAudioRecorder

The app successfully uses AVAudioRecorder to record audio.

Delegates and Segues

The app uses the delegate pattern and implements the audioRecorderDidFinishRecording() method.
The app does not use a Storyboard segue hardcoded to the Stop button. A segue from the first scene to the second is programmatically triggered via performSegueWithIdentifier().

UINavigationController

The app allows the user to re-record by navigating back to the first scene from the second.
Sound Effects

The second scene of the app contains the following buttons for audio effects: Snail (slow), Rabbit (fast), Chipmunk (high pitch), Darth Vader (low pitch), Echo and Reverb. All six buttons work properly to play the associated sounds.

Code Quality

Potentially repetitive blocks of code are effectively abstracted into reusable methods.
Code adheres to Swift naming and style conventions.
Code is readable and easy to follow. Any code that may be hard to understand is commented effectively.
