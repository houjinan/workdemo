class ProductEntity < Grape::Entity
  expose :id,       documentation: {required: true, type: "Integer", desc: "product ID"}
  expose :title,   documentation: {required: true, type: "String", desc: "名称"}
  expose :description,  documentation: {required: false, type: "String", desc: "描述"}
end