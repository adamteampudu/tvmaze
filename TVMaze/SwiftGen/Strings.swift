// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Add to favorites
  internal static let addToFavorites = L10n.tr("Localizable", "add_to_favorites")
  /// Cancel
  internal static let cancel = L10n.tr("Localizable", "cancel")
  /// Continue
  internal static let `continue` = L10n.tr("Localizable", "continue")
  /// Create your watchlist
  internal static let createYourWatchlist = L10n.tr("Localizable", "create_your_watchlist")
  /// Episodes
  internal static let episodes = L10n.tr("Localizable", "episodes")
  /// OK
  internal static let ok = L10n.tr("Localizable", "ok")
  /// People
  internal static let people = L10n.tr("Localizable", "people")
  /// Rate your favorites
  internal static let rateYourFavorites = L10n.tr("Localizable", "rate_your_favorites")
  /// Remove from favorites
  internal static let removeFromFavorites = L10n.tr("Localizable", "remove_from_favorites")
  /// Search...
  internal static let search = L10n.tr("Localizable", "search")
  /// Search for your favorite actors
  internal static let searchForYourFavoriteActors = L10n.tr("Localizable", "search_for_your_favorite_actors")
  /// Season
  internal static let season = L10n.tr("Localizable", "season")
  /// Seasons
  internal static let seasons = L10n.tr("Localizable", "seasons")
  /// Show All
  internal static let showAll = L10n.tr("Localizable", "show_all")
  /// Show Favorites
  internal static let showFavorites = L10n.tr("Localizable", "show_favorites")
  /// Shows
  internal static let shows = L10n.tr("Localizable", "shows")
  /// Something is up with the API, try again later
  internal static let tryAgainLater = L10n.tr("Localizable", "try_again_later")
  /// Welcome
  internal static let welcome = L10n.tr("Localizable", "welcome")
  /// Whoops!
  internal static let whoops = L10n.tr("Localizable", "whoops")
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
