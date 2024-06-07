module ApplicationHelper

  def countries_list
    # ISO3166::Country.all.map { |country| country.nationality }.uniq.sort
    common_countries = [ "France",
                        "Belgique",
                        "Suisse",
                        "Allemagne",
                        "Espagne",
                        "Italie",
                        "Royaume-Uni",
                        "États-Unis"]

    all_countries = ISO3166::Country.all_translated('fr').uniq.sort
    ( common_countries + ["-- Toutes les nationalités --"] + all_countries).uniq
  end

  def get_binding
    binding
  end
end
