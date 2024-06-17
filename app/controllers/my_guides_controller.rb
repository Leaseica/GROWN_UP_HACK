require 'prawn'

class MyGuidesController < ApplicationController
  before_action :set_article, only: [:new, :create, :edit, :update]
  before_action :set_my_guide, only: [:show, :edit, :update, :destroy, :summary]
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy, :summary]
  before_action :set_reminder, only: [:new, :create, :edit, :update, :destroy]


  # GET my_guides/new
  def new
    @my_guide = MyGuide.new
    @my_guide.user = current_user
  end

  # GET my_guides/1
  def show
    @view_mode = params[:view_mode] || 'edit'
  end

  # POST /my_guides
  def create
    @my_guide = MyGuide.new(my_guide_params)
    @my_guide.user = current_user

    respond_to do |format|
      if @my_guide.save
        create_reminders_for_my_guide(@my_guide)
        format.html { redirect_to summary_my_guide_path(@my_guide), notice: "My Guide was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # GET my_guides/1/edit
  def edit
  end

  # PATCH/PUT /my_guides/1
  def update
    respond_to do |format|
      if @my_guide.update(my_guide_params)
        format.html { redirect_to summary_my_guide_path(@my_guide), notice: "My Guide was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def summary
    @reminders = @my_guide.reminders
  end

  def download
    @my_guide = MyGuide.find(params[:id])
    pdf = generate_pdf(@my_guide)
    send_data pdf.render, filename: "my_guide_#{params[:id]}.pdf", type: "application/pdf", disposition: "inline"
  end

  def redirect
  end

  def destroy
    @my_guide.destroy
    redirect_to my_guide_path(@my_guide.article), status: :see_other
  end



  private
  def create_reminders_for_my_guide(my_guide)
    # Créez ici vos rappels spécifiques en fonction du type de guide
    # Exemple : démarches pour freelance
    if my_guide.article.title.include?("freelance")
      create_freelance_reminders(my_guide)
    elsif my_guide.article.title.include?("clefs")
      create_lost_keys_reminders(my_guide)
    end
  end

  def set_my_guide
    @my_guide = MyGuide.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_article
    @article = Article.find(params[:article_id])
  rescue ActiveRecord::RecordNotFound
    @article = @my_guide.article if @my_guide.present?
  end

  def set_reminder
    @reminder = Reminder.find(params[:reminder_id]) if params[:reminder_id].present?
  end

  def my_guide_params
    params.require(:my_guide).permit(
      :article_id,
      :business_structure,
      :is_micro_entrepreneur,
      :is_business_extension,
      :has_previous_self_employment,
      :representative_role,
      :representative_type,
      # Due to its strong parameter requirements in Rails, we need to explicitly permit the nested attributes for the user model.
      user_attributes: [
        :first_name,
        :last_name,
        :birthday,
        :email,
        :country,
        :occupation,
        :address,
        :phone_number,
        :gender,
        :zip_code,
        :city,
        :title
      ]

    )
  end


  def generate_pdf(my_guide)
    Prawn::Document.new do |pdf|
      pdf.text "My Guide Summary", size: 20, style: :bold
      pdf.move_down 10

      # Assuming `business_structure` and other attributes are directly accessible
      # on `my_guide`. Adapt these as necessary to match your actual data structure.
      pdf.text "Business Structure: #{my_guide.business_structure}"
      pdf.text "Micro Entrepreneur Status: #{my_guide.is_micro_entrepreneur ? 'Yes' : 'No'}"
      pdf.text "Business Extension: #{my_guide.is_business_extension ? 'Yes' : 'No'}"
      pdf.text "Previous Self Employment: #{my_guide.has_previous_self_employment ? 'Yes' : 'No'}"
      pdf.text "Representative Role: #{my_guide.representative_role}"
      pdf.text "Representative Type: #{my_guide.representative_type}"

      # Accessing user information. Ensure `user` is associated with `my_guide` for this to work.
      user = my_guide.user # This assumes a `user` association exists
      pdf.text "User Details:", style: :bold
      pdf.text "First Name: #{user.first_name}"
      pdf.text "Last Name: #{user.last_name}"
      pdf.text "Date of Birth: #{user.birthday.strftime('%d/%m/%Y') if user.birthday}"
      pdf.text "Email: #{user.email}"
      pdf.text "Gender: #{user.gender}"
      pdf.text "Country: #{user.country}"
      pdf.text "Occupation: #{user.occupation}"
      pdf.text "Address: #{user.address}"
      pdf.text "phone_number: #{user.phone_number}"

      pdf.render
    end
  end



  def create_freelance_reminders(my_guide)
    Reminder.create!(
      title: "Immatriculation de l'entreprise",
      description: "Commencez les démarches d'immatriculation de votre entreprise.",
      url: "",
      start_time: 2.months.before(my_guide.created_at),
      end_time: 2.months.before(my_guide.created_at),
      status: 'À faire',
      user: my_guide.user,
      my_guide: my_guide
    )
    # Étape 1: Déclaration de l'activité
  Reminder.create!(
    title: "Déclaration de l'activité auto-entrepreneur",
    description: "Déclarez votre activité en tant qu'auto-entrepreneur au Guichet unique ou sur autoentrepreneur.urssaf.fr.",
    url: 'https://procedures.inpi.fr/?/',
    status: 'À faire',
    start_time: DateTime.now,
    end_time: DateTime.now + 1.hour,
    user: my_guide.user,
    my_guide: my_guide
  )

  # Étape 2: Demande d'Acre (optionnelle mais conseillée)
  Reminder.create!(
    title: "Demande d'Acre",
    description: "Effectuez votre demande d'Acre auprès de l'Urssaf dès que votre activité est déclarée pour bénéficier d'allègements de cotisations.",
    status: 'À faire',
    url: 'https://www.autoentrepreneur.urssaf.fr/portail/accueil/une-question/nous-contacter/courriel.html?choixacre=ok',
    start_time: DateTime.now + 1.day,
    end_time: DateTime.now + 2.days,
    user: my_guide.user,
    my_guide: my_guide
  )
  Reminder.create!(
    title: "Demande d'Acre : Consulter la réponse de l'Urssaf",
    description: "En cas de réponse favorable, l'Urssaf délivre une attestation disponible dans la rubrique 'Mes attestations' dès sa prise en compte par mon Urssaf.
    En cas de rejet de la demande, l'Urssaf motive et notifie sa décision.
    En cas d'absence de réponse dans un délai d'un mois, l'Acre est considérée comme accordée.",
    status: 'À faire',
    url: 'https://login.urssaf.fr',
    start_time: DateTime.now + 1.day,
    end_time: DateTime.now + 30.days,
    user: my_guide.user,
    my_guide: my_guide
  )

  # Étape 3: Création de l'espace Urssaf
  Reminder.create!(
    title: "Création de votre espace Urssaf",
    description: "Créez votre espace sur le site de l'Urssaf pour déclarer et payer vos cotisations en ligne.",
    status: 'À faire',
    start_time: DateTime.now + 2.days,
    end_time: DateTime.now + 2.days + 1.hour,
    user: my_guide.user,
    my_guide: my_guide
  )

  # Étape 4: Réception du numéro Siret
  Reminder.create!(
    title: "Réception de votre numéro Siret",
    description: "Attendez de recevoir votre numéro Siret, environ 15 jours après la déclaration de votre activité.",
    status: 'À faire',
    start_time: DateTime.now + 15.days,
    end_time: DateTime.now + 15.days + 1.hour,
    user: my_guide.user,
    my_guide: my_guide
  )

  # Étape 5: Réception de la notification d'affiliation
  Reminder.create!(
    title: "Réception de la notification d'affiliation Urssaf",
    description: "Vous recevrez votre notification d'affiliation de l'Urssaf en tant que travailleur indépendant sous 4 à 10 semaines.",
    status: 'À faire',
    start_time: DateTime.now + 4.weeks,
    end_time: DateTime.now + 10.weeks,
    user: my_guide.user,
    my_guide: my_guide
  )

  # Étape 6: Début de l'activité
  Reminder.create!(
    title: "première déclaration",
    description: "Vous pouvez commencer à émettre des factures et devez déclarer votre chiffre d'affaires à l'issue des 90 premiers jours d'activité.",
    status: 'À faire',
    start_time: DateTime.now + 90.days,
    end_time: DateTime.now + 90.days + 1.hour,
    user: my_guide.user,
    my_guide: my_guide
  )
  end

  def create_lost_keys_reminders(my_guide)
    Reminder.create!(
      title: "Prendre rendez-vous avec un serrurier",
      description: "Contacter un serrurier pour remplacer la serrure.",
      url: "",
      status: 'À faire',
      start_time: DateTime.now + 1.day,
      end_time: DateTime.now + 1.day + 2.hours,
      user: my_guide.user,
      my_guide: my_guide
    )
    # Ajoutez d'autres rappels spécifiques à la perte de clefs ici
  end

end
