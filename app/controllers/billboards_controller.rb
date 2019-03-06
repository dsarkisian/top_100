class BillboardsController < ApplicationController

    # after_action :capitalize_name, only: [:new]
    before_action :set_billboard, only:[:show]
  
    def index
      @billboards = Billboard.all
    end
  
    def show
    end
  
    private 
  
      def billboard_params
       params.require(:billboard).permit(:name)
      end
  
      def set_billboard
        @billboard = Billboard.find(params[:id])
      end
end
