# Coasts

## Contributors 

[Cameron Rivera](https://github.com/CameronRivera) 

[Brendon Cecilio](https://github.com/bcecilio)

[Kelby Mittan](https://github.com/kelby-mittan)

## About

Coasts is an application that aims to promote awareness about climate change. More specifically, Coasts is focused on how climate change impacts the sea level. Rather than focus on the world as a whole, we have decided to make use of specific locations around the world to demonstrate the severity of the issue. Each location featured within the app contains a brief summary of the location, as well as some interesting facts, accompanied by charts and graphs to help the user visualize what is happening. 

What sets this application apart from other resources is its use of an AR feature. We created models of locations around the world that users can interact with to witness how sea level rise will progress from now until the year 2100. For now, only New York City supports the AR feature. In the later versions of the application, we would like to provide a model for each location featured in the app.  

It should be noted that the water levels are not to scale with the model. No one knows how climate change will progress in the future, which means we cannot provide a 100% accurate model of how sea levels will exist in the coming years. However, in an effort to demonstrate just how bad the situation could be, we have decided to use data that falls more in line with worst case scenario predictions.

Finally, we have included a resources section that allows users to get involved. This section informs users about lifestyle changes they can make in order to reduce their carbon footprint.

## Technologies Used
Xcode 11, Swift 5, ARKit, RealityKit, AVFoundation

## Using this Application

- Currently this application only supports iOS 13.5 and beyond. 
- This application makes use of CocoaPods.

## Code Snippet of Challenging parts

### Accessibility Extension
```swift
extension UIView{
    /**
     - Description:
     Adds accessiblity to a UIElement. Since most UIElements inherit from UIView, this can be used on anything from a label, to a UICollectionViewCell.
     
     - Parameters:
        - trait: A set of accessibility traits that describes how an element behaves. Examples include, button, image, and plays sound. For a label, you'll want to set this value to .none.
        - label: The text that voiceOver will read when the user selects an element.
        - hint: Briefly describes the result of performing an action on an accessibility element
        - isAccessible: Indicates whether the accessibility element is an assistive application can access.
        - value: Represents the current value of the accessibility element. For example, a slider might have a value of 10. If this is applied to a text field, it is the text that the field contains.
 */
    func addAccessibility(_ trait: UIAccessibilityTraits, _ label: String, _ hint: String?, _ value: String?, _ isAccessibile: Bool = true){
        self.accessibilityTraits = trait
        self.accessibilityLabel = label
        self.accessibilityHint = hint
        self.isAccessibilityElement = isAccessibile
        self.accessibilityValue = value
    }
    
}
```

## Screenshot of the App

## Gif
