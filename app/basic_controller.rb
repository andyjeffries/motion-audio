class BasicController < UIViewController
  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor
    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle "Click me", forState: UIControlStateNormal
    @button.frame = [[100, 100], [100, 50]]
    @button.addTarget(self,
          action: :playAudio,
          forControlEvents: UIControlEventTouchUpInside)

    self.view.addSubview @button
  end

  def playAudio
    mySoundURL = NSBundle.mainBundle.URLForResource("dummy", withExtension:"wav")

    soundID = Pointer.new("I")

    AudioServicesCreateSystemSoundID(mySoundURL, soundID)

    AudioServicesPlaySystemSound(soundID[0])
  end

end