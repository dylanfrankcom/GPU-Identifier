<p align="center">
    <img src="https://dylanfrank.com/images/projects/gpu-identifier/appIcon.png" alt="GPU Identifier logo" width="128” maxHeight="128" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/macOS-10.15+-blue.svg" />
    <img src="https://img.shields.io/badge/Swift-5.2-orange.svg" />
    <img alt="Mastodon Follow" src="https://img.shields.io/mastodon/follow/109519296875218134">
    </a>
</p>

# GPU Identifier
GPU Identifier is a lightweight application for your Mac's menu bar that lets you easily see what GPU your dual-graphics equipped MacBook Pro is using.
This is helpful if you use applications that take advantage of the dedicated GPU when in use, like Sketch or iMovie, and can help you save battery life knowing that the more powerful GPU is in use if these applications are running in the background.
GPU Identifier is written entirely in Swift and does not collect or transmit any of your data.

<p align="center">
    <img src="https://dylanfrank.com/images/projects/gpu-identifier/hero.png" alt="GPU Identifier" width="80%">
</p>

## Compatibility
* GPU Identifier is compatible with macOS 10.15 or later.
* Not currently optimized for Apple Silicon as these machines do not have dual-graphics.
* GPU Identifier only works with dual-graphics equipped MacBook Pros. 
  * MacBook Pro (15-inch, Mid 2012) [MacBookPro9,1]
  * MacBook Pro (Retina, 15-inch, Mid 2012) [MacBookPro10,1]
  * MacBook Pro (Retina, 15-inch, Early 2013) [MacBookPro10,1]
  * MacBook Pro (Retina, 15-inch, Late 2013) [MacBookPro11,3]
  * MacBook Pro (Retina, 15-inch, Mid 2014) [MacBookPro11,3]
  * MacBook Pro (Retina, 15-inch, Mid 2015) [MacBookPro11,5]
  * MacBook Pro (15 inch, 2016) [ MacBookPro13,3]
  * MacBook Pro (15 inch, 2017) [MacBookPro14,3]
  * MacBook Pro (15 inch, 2018/2019) [MacBookPro15,1 and MacBookPro15,3]
  * MacBook Pro (16 inch, 2019) [MacBookPro16,1]

## Future

This application is effectively sunset given that Apple Silicon does not support dedicated or external graphics from third parties. However, if you are a user and have any feature requests you can <a href="mailto:hello@dylanfrank.com?subject=GPU Identifier Feature Request" target="_blank">email</a> or <a href="https://mastodon.social/@dylanfrankcom/" target="_blank">toot</a> me!

Edit: GPU Identifier was removed from the Mac App Store on August 19, 2024. Thank you everyone who gave it a try!

## Shout-outs
* Cody Krieger's [gfxCardStatus](https://github.com/codykrieger/gfxCardStatus) for the original inspiration. Check it out if you would like a more complete, feature rich solution.

## Disclaimer
* This app is free and open source but its license prohibits anyone from distributing it (free or paid) on any App Store or closed source solution. Please feel free to contribute or fork!
