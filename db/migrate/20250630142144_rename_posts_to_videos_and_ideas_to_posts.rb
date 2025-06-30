class RenamevideosToVideosAndpostsTovideos < ActiveRecord::Migration[7.1]
  def change
    rename_table :videos, :videos
    rename_table :posts, :videos
  end
end