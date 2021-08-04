// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let color = ColorAsset(name: "Color")
  internal static let colorBackgroundBlue = ColorAsset(name: "color_background_blue")
  internal static let colorBackgroundScreen = ColorAsset(name: "color_background_screen")
  internal static let colorBlueMain = ColorAsset(name: "color_blue_main")
  internal static let colorControlButton = ColorAsset(name: "color_control_button")
  internal static let colorLightBackgroundBlue = ColorAsset(name: "color_light_background_blue")
  internal static let colorLightLineBlue = ColorAsset(name: "color_light_line_blue")
  internal static let colorLightText = ColorAsset(name: "color_light_text")
  internal static let colorLineBlue = ColorAsset(name: "color_line_blue")
  internal static let colorListRowBackground = ColorAsset(name: "color_list_row_background")
  internal static let colorRed = ColorAsset(name: "color_red")
  internal static let colorSelectedTabbar = ColorAsset(name: "color_selected_tabbar")
  internal static let colorShadowButton = ColorAsset(name: "color_shadow_button")
  internal static let colorTabbar = ColorAsset(name: "color_tabbar")
  internal static let colorTextBlack = ColorAsset(name: "color_text_black")
  internal static let colorTint = ColorAsset(name: "color_tint")
  internal static let colorUsedBatteryLight = ColorAsset(name: "color_used_battery_light")
  internal static let colorWhiteTextMain = ColorAsset(name: "color_white_text_main")
  internal static let icChecked = ImageAsset(name: "ic_checked")
  internal static let icCircleClose = ImageAsset(name: "ic_circle_close")
  internal static let icClose = ImageAsset(name: "ic_close")
  internal static let icHomeLogo = ImageAsset(name: "ic_home_logo")
  internal static let icMail = ImageAsset(name: "ic_mail")
  internal static let icMusicLogo = ImageAsset(name: "ic_music_logo")
  internal static let icPage = ImageAsset(name: "ic_page")
  internal static let icPassword = ImageAsset(name: "ic_password")
  internal static let icPerson = ImageAsset(name: "ic_person")
  internal static let icQuest = ImageAsset(name: "ic_quest")
  internal static let icSetting = ImageAsset(name: "ic_setting")
  internal static let icSplashView = ImageAsset(name: "ic_splash_view")
  internal static let icSpotifyLogo = ImageAsset(name: "ic_spotify_logo")
  internal static let icTabbarHome = ImageAsset(name: "ic_tabbar_home")
  internal static let icTabbarIcon = ImageAsset(name: "ic_tabbar_icon")
  internal static let icTabbarMywidget = ImageAsset(name: "ic_tabbar_mywidget")
  internal static let icTabbarSetting = ImageAsset(name: "ic_tabbar_setting")
  internal static let icTabbarWidgets = ImageAsset(name: "ic_tabbar_widgets")
  internal static let icTiktokLogo = ImageAsset(name: "ic_tiktok_logo")
  internal static let icTrash = ImageAsset(name: "ic_trash")
  internal static let icTwitterLogo = ImageAsset(name: "ic_twitter_logo")
  internal static let icUncheck = ImageAsset(name: "ic_uncheck")
  internal static let icUser = ImageAsset(name: "ic_user")
  internal static let icYoutubeLogo = ImageAsset(name: "ic_youtube_logo")
  internal static let icBack = ImageAsset(name: "ic_back")
  internal static let imgArashiBackground = ImageAsset(name: "img_arashi_background")
  internal static let imgBackground = ImageAsset(name: "img_background")
  internal static let imgCircleBattery = ImageAsset(name: "img_circle_battery")
  internal static let imgFrame = ImageAsset(name: "img_frame")
  internal static let imgFrame2 = ImageAsset(name: "img_frame2")
  internal static let imgHomeHeader = ImageAsset(name: "img_home_header")
  internal static let imgMockupMywidget = ImageAsset(name: "img_mockup_mywidget")
  internal static let imgMockupPhoto = ImageAsset(name: "img_mockup_photo")
  internal static let imgPlaceholder = ImageAsset(name: "img_placeholder")
  internal static let imgTutorial = ImageAsset(name: "img_tutorial")
  internal static let imgWeatherAtmosphere = ImageAsset(name: "img_weather_atmosphere")
  internal static let imgWeatherClear = ImageAsset(name: "img_weather_clear")
  internal static let imgWeatherCloud = ImageAsset(name: "img_weather_cloud")
  internal static let imgWeatherDrizzle = ImageAsset(name: "img_weather_drizzle")
  internal static let imgWeatherRain = ImageAsset(name: "img_weather_rain")
  internal static let imgWeatherSnow = ImageAsset(name: "img_weather_snow")
  internal static let imgWeatherThunderstorm = ImageAsset(name: "img_weather_thunderstorm")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
