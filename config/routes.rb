Gifts::Application.routes.draw do

  devise_for :users do
  	get "admin/login", to: "devise/sessions#new", as: :login
  	get "admin/logout", to: "devise/sessions#destroy", as: :logout
  end

  get "contacts/index"

  get "about/index"

	get "itemdetails/index"
	get "catalog/index"
	get "dashboard/index"

	scope module: 'admin' do
		resources :news, path: 'admin/news'
		resources :items, path: 'admin/items'
		resources :categories, path: 'admin/categories'
		resources :contacts, path: 'admin/contacts'
	end

	root to: 'index#content', as: :main
	match 'admin/', to: 'admin/accounts#login'
	match 'admin/signup', to: 'admin/accounts#signup', as: :signup
	match 'admin/dashboard', to: 'admin/dashboard#index', as: :dashboard
	match 'catalog', to: 'catalog#index', as: :catalog
	match 'catalog/:id', to: 'catalog#index'
	match 'catalog/item/:id', to: 'itemdetails#index'
	match 'about', to: 'about#index', as: :about
	match 'contacts', to: 'contacts#index', as: :contacts_main
end
