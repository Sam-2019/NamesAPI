module Api
    module V1   
        class NamesController < ApplicationController

            def index 
                names = Name.order('created_at DESC');
                render json: {status: 'SUCCESS',message:'Loaded names', data:names}, status: :ok 
            end


            def show
                name = Name.find(params[:id])
                render json: {status: 'SUCCESS',message:'Loaded name', data:name}, status: :ok 
            end  

            def create
                 name = Name.new(name_params)

                 if name.save
                    render json: {status: 'SUCCESS',message:'Name saved', data:name}, status: :ok 
                 else
                    render json: {status: 'ERROR', message:'Name not saved', data:name.errors},status: :unprocessable_entity
                 end
            end   

            def destroy 
                name = Name.find(params[:id])
                name.destroy
                render json: {status: 'SUCCESS',message:'Name deleted', data:name}, status: :ok 
            end
 
            def update
                name = Name.find(params[:id])

                if name.update(name_params)
                   render json: {status: 'SUCCESS', message:'Name updated', data:name}, status: :ok 
                else
                   render json: {status: 'ERROR', message:'Name not updated', data:name.errors},status: :unprocessable_entity
                end
            end 

            
        private

            def name_params
                params.permit(:first_name, :last_name)
            end

        end
    end
end