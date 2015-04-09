json.array! @universities do |university|
  json.university_id university.id
  json.name university.name
  json.logo_url university.logo_url
end