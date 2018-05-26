#! /usr/share/bin

rails g model Category name
rails g model Review rating:integer description:text reviewable:references{polymorphic} user:references
rails g model Favorite favoritable:references{polymorphic} user:references
rails g model Serie title description:text thumbnail_key category:references featured_thumbnail_key thumbnail_cover_key

rails g model Movie title description:text thumbnail_key video_key episode_number:integer featured_thumbnail_key  serie:references{optional} category:references thumbnail_cover_key
rails g model Player start_date:datetime end_date:datetime elapsed_time:time movie:references user:references
rails g migration add_last_watched_episode_to_series last_watched_episode:references
