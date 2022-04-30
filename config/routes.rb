Rails.application.routes.draw do
  root 'formats#index'
  resouces :formats, only: [:index, :new, :create]
end
