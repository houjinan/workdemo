class V2::ProductsApi < Grape::API
          format :json

          resource :products_api do

              desc "get Products information by id",{
                entity:ProductEntity
              }
              params do
                requires :id, type: Integer, desc: "Product ID"
             end
              get ":id" do
                  product =Product.find(params[:id])
                  present product, with: ProductEntity
              end

             desc "get all Products information"
              get do
                  Product.all
              end
          end
 end
