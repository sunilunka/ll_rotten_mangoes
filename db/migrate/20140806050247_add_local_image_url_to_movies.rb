class AddLocalImageUrlToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :local_image_url, :string
  end
end
