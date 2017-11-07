json.albums @tracking_request do |tr|
  json.id    tr.service
  json.title album.title

  json.artist_id album.artist ? album.artist.id : nil
end