### NSUserNotificationPrivate
#### Private API showcase for NSUserNotification

![Example app](https://raw.github.com/indragiek/NSUserNotificationPrivate/master/images/example-ui.png)

Around OS X, you can see quite a few features in the Notification Center API (`NSUserNotification` et. al) that aren't being exposed to developers publicly. For example, the way that iTunes uses album artwork in place of its icon.

I class-dumped the `NSUserNotification` header and quickly found how to access these features and put together an example app to make it easy to try each one. Here's an overview of the private stuff I found (there's probably more):

(**NOTE: This should go without saying, but using any of this will result in your app being rejected from the MAS and potentially breaking if the APIs change. This is just for fun.**)

#### Identity Image

This is how iTunes swaps in album artwork for the icon. When the `_identityImage` property is set, it shows the set image in place of the icon and moves the app icon to the left of the notification title. The default value of `nil` makes it use the app icon. The result looks like this:

![Identity image](https://raw.github.com/indragiek/NSUserNotificationPrivate/master/images/itunes-notification.png)

There's even an option to turn off the default border by setting the `_identityImageHasBorder` to `NO`.

#### Ignore Do Not Disturb

The `_ignoresDoNotDisturb` property allows you to override the user's Do Not Disturb settings and post the notification anyways. Default value is `NO`.

#### Lockscreen Only

The `_lockscreenOnly` property allows you to make it so that a notification is only posted if the computer is locked. This means that you can only see the missed notification in the lock screen and it disappears as soon as you unlock the computer. Default value is `NO`.

#### Poofs on Cancel

If the notification type is set to "Alert", the `_poofsOnCancel` property lets you configure whether there should be a poof animation when the Cancel button is clicked. Default value is `YES`.

#### Show Alternate Action Menu

If the notification type is set to "Alert", the `alternateActionButtonTitles` property lets you set an array of additional menu item titles to be shown in an action menu that can be accessed by hovering on the Action button and clicking on the arrow. It looks like this:

![Action items](https://raw.github.com/indragiek/NSUserNotificationPrivate/master/images/custom-items.png)

Once a notification is handled, the index of the action can be retrieved using the `_alternateActionIndex` property.

### License

There's hardly any code here, do whatever you want with it.