class Report < ActiveRecord::Base
  has_many :images

  attr_accessor :social_image

  REPORT_TYPE = {"Desconozco el tipo de delito electoral" => 'desconozco_delito_electoral',
      "Compra de Votos" => 'compra_votos',
      "Recolección de Credenciales de elector" => 'recolección_credenciales_elector',
      "Condicionamiento Regalos de programas sociales" => 'condicionamiento_regalos_programas_sociales',
      "Publicidad afuera de la casilla" => "publicidad_afuera_casilla",
      "Mapaches" => 'mapaches',
      "Violencia para obstruir la votacion" => 'violencia para obstruir la votacion'}

  accepts_nested_attributes_for :images,
      allow_destroy: true,
      reject_if: :all_blank
end
