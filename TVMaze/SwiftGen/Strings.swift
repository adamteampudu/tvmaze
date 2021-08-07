// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Continue
  internal static let `continue` = L10n.tr("Localizable", "continue")
  /// Create your watchlist
  internal static let createYourWatchlist = L10n.tr("Localizable", "create_your_watchlist")
  /// Episodes
  internal static let episodes = L10n.tr("Localizable", "episodes")
  /// Rate your favourites
  internal static let rateYourFavourites = L10n.tr("Localizable", "rate_your_favourites")
  /// Search for your favourite actors
  internal static let searchForYourFavouriteActors = L10n.tr("Localizable", "search_for_your_favourite_actors")
  /// Season
  internal static let season = L10n.tr("Localizable", "season")
  /// Seasons
  internal static let seasons = L10n.tr("Localizable", "seasons")
  /// Shows
  internal static let shows = L10n.tr("Localizable", "shows")
  /// Welcome
  internal static let welcome = L10n.tr("Localizable", "welcome")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
