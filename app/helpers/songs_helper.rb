module SongsHelper

    def artist_select(song)
        if params[:artist_id]
            song.artist_name
        else
            select_tag "song[artist_name]", options_from_collection_for_select(Artist.all, :name, :name), id: "song_artist_id"
        end
    end

    def edit_song_link(song)
        if song.artist
            link_to "Edit Song", edit_artist_song_path(song.artist, song)
        else
            link_to "Edit Song", edit_song_path(song)
        end
    end

    def current_artist(song)
        if params[:artist_id]
            hidden_field_tag "song[artist_name]", song.artist_name
        end
    end
end
