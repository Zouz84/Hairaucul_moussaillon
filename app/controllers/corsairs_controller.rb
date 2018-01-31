class CorsairsController < ApplicationController

#créé un nouveau formulaire pour faire un nouveau profile. (comme le User = User.new ;) )
def new
	@corsair = Corsair.new

end 

#affiche le profile une fois remplit, grâce à l'id passé en paramètre.
def show
	@corsair = Corsair.find(params[:id])
end

#permet d'editer le profil, tujours en selectionnant le profil dans le hash en fonction de son ID.
def edit
	 @corsair = Corsair.find(params[:id])
end

#genere un nouveau profil en fonction de la methode corsaire_param définie en private.

def create
		@corsair = Corsair.new(corsair_params)
		if @corsair.save
		redirect_to @corsair
		else render 'new'
		end
	end

	#permet de réecrire le profil choisi

  def update
  	@corsair = Corsair.find(params[:id])
		if @corsair.update(corsair_params)
			redirect_to corsairs_path
		else 
			render 'edit'
		end
	end

	# delete le profil grâce à .destroy et redirige sur le corsair_path.

	def destroy
		@corsair = Corsair.find(params[:id])
		@corsair.destroy
		redirect_to corsairs_path
	end
		#liste les profils completés grâce au .all 
def index
	@corsairs = Corsair.all
end

private
	def corsair_params
  	params.require(:corsair).permit(:first_name, :age, :likeness)
	end


end
