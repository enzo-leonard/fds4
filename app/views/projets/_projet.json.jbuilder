json.extract! projet, :id, :name_structure, :title, :url, :keywords, :difficulty, :date, :live, :synopsis, :image, :territory, :duration, :stars, :stars_text, :theme_id, :target_id, :form_id, :created_at, :updated_at
json.url projet_url(projet, format: :json)
