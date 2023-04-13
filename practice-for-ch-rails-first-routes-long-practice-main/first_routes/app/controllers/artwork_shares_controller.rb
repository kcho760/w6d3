class ArtworkSharesController < ApplicationController

    def index
        render json: User.select('artworks.title').joins(:shares)
    end 

    def create
        # debugger
        artwork_shares = ArtworkShare.new(artwork_shares_params)
        if artwork_shares.save!
          render json: artwork_shares
        else
          render json: artwork_shares.errors.full_messages, status: :unprocessable_entity
        end
    end

    def artwork_shares_params
        params.require(:artwork_shares).permit(:viewer_id, :artwork_id)
    end

    def destroy
        ArtworkShare.find(params[:id]).destroy
        redirect_to artwork_shares_url
      end
end