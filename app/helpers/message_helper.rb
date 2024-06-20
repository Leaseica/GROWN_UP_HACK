# app/helpers/message_helper.rb
module MessageHelper
  def random_messages
    messages = [
      "🔍 On gratte encore les fonds de tiroir à la recherche du manuel pour ce sujet.<br>Revenez voir si on a trouvé quelque chose !",
      "🚣 On est tous dans le même bateau et, pour l'instant, on rame un peu sur ce sujet.<br>Laissez-nous un peu de temps pour naviguer vers la solution !",
      "🕵️‍♂️ Nos experts sont en mission secrète pour dénicher les astuces de survie sur ce thème.<br>Restez connectés, ils reviennent bientôt avec des nouvelles !",
      "☕ Nos écrivains sont en pause café, revenez plus tard !",
      "📜 On est toujours en train de déchiffrer le mode d'emploi sur ce sujet... Patience !",
      "🌍 Ça semble être une zone encore inexplorée.<br>On part en expédition et on vous ramène des infos !",
      "🧭 On cherche encore le mode d'emploi pour ce sujet...<br>Revenez un peu plus tard, on aura peut-être trouvé les bonnes instructions !"
    ]
    messages.sample.html_safe
  end
end
