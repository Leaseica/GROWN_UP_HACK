# config/initializers/pg_search.rb


PgSearch.multisearch_options = { :using => { :tsearch => {:prefix => true }, :trigram => {} }, :ignoring => :accents }
