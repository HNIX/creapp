# Be sure to restart your server when you modify this file.

# Version of your asset_listings, change this if you want to expire all your asset_listings.
Rails.application.config.assets.version = '1.0'

# Precompile additional asset_listings.
# application.js, application.css.scss, and all non-JS/CSS in app/asset_listings folder are already added.
# Rails.application.config.asset_listings.precompile += %w( search.js )
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/