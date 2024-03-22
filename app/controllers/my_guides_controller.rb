require 'prawn'

class MyGuidesController < ApplicationController
  before_action :set_article, only: [:new, :create, :edit, :update]
  before_action :set_my_guide, only: [:show, :edit, :update, :destroy, :summary]
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy, :summary]

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
        format.html { redirect_to summary_my_guide_path(@my_guide), notice: "My Guide was successfully created." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def summary
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
    redirect_to restaurant_path(@my_guide.article), status: :see_other
  end

  private

  def set_my_guide
    @my_guide = MyGuide.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_article
    @article = Article.find(params[:article_id])
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
      user_attributes: [
        :first_name,
        :last_name,
        :"birthday(3i)",
        :"birthday(2i)",
        :"birthday(1i)",
        :email,
        :nationality,
        :occupation,
        :address,
        :social_security,
        :gender
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
      pdf.text "Nationality: #{user.nationality}"
      pdf.text "Occupation: #{user.occupation}"
      pdf.text "Address: #{user.address}"
      pdf.text "Social Security Number: #{user.social_security}"

      pdf.render
    end
  end
end
