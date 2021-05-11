# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Add initial role in database.


# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback


# Roles

unless Role.all.present?
    roles = Role.create(
        [
            {name: "superuser"},
            {name: "root"},
            {name: "guest"},
            {name: "user"},
            {name: "agent"},
            {name: "demo"},



            

        ])
else
    roles = Role.all

end



# Users
unless User.all.present?
    users = User.create([
        {login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "superuser").id},
        {login: "root",  email: "root@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "root").id},
        {login: "user",  email: "user@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "user").id},
        {login: "guest",  email: "guest@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "guest").id},
        {login: "demo",  email: "demo@gmail.com",  password: "demo2019", password_confirmation: "demo2019", role_id: Role.find_by(name: "superuser").id}


    
    ])
else   
    users = User.all
end



unless Profile.all.present?
    profile = Profile.create([
        {
            first_name: "Amos",  
            last_name: "DEMBELE",
            user_id: users.first.id
        },
        {
            first_name: "Alassane",  
            last_name: "BABY",
            user_id: users.last.id
        }
    
    ])

end


# Contract Type
unless OfferType.all.present?

    offer_types = OfferType.create([
        {name: 'Location', description: ''},
        {name: 'Colocation', description: ''},
        {name: 'Vente', description: ''}

    ])
else  
    offer_type = OfferType.all
end


# Property Type
unless PropertyType.all.present?

    property_types = PropertyType.create([
        {name: 'Appartement', description: '', user_id: users.first.id},
        {name: 'Bureau et Local professionnel', description: '', user_id: users.first.id},
        {name: 'Maison et Villa', description: '', user_id: users.first.id},
        {name: 'Loft', description: '', user_id: users.first.id},
        {name: "Immeuble", description: '', user_id: users.first.id},
        {name: "Gîte et Atelier", description: '', user_id: users.first.id},
        {name: "Garage et Parking", description: '', user_id: users.first.id},
        {name: "Entrepôt et local commercial", description: '', user_id: users.first.id},
        {name: "Hôtel particulier", description: '', user_id: users.first.id},
        {name: "Studio et chambre", description: '', user_id: users.first.id}

    ])
else   
    property_types = PropertyType.all
end

# Unity
unless Unity.all.present?

    unities = Unity.create([
        {name: 'An', user_id: users.first.id},
        {name: 'Mois', user_id: users.first.id},
        {name: 'Jours', user_id: users.first.id},
        {name: 'Heure', user_id: users.first.id}

    ])
else  
    unities = Unity.all
end



# Page 
unless Page.all.present?

    pages = Page.create([
        {title: "A propos", user_id: users.first.id},
        {title: "Conditions Générales d'Utilisation", user_id: users.first.id},
        {title: "Politiques de traitement et de protection des données personnelles", user_id: users.first.id},
        {title: "Comment ça marche", user_id: users.first.id},
        {title: "Publicité", user_id: users.first.id},
        {title: "Partenaires", user_id: users.first.id},
        {title: "Rejoignez-nous", user_id: users.first.id},


    ])
else  
    pages = Page.all
end



# Property
unless Property.all.present?

properties = Property.create([
    {name: "Appartement à louer à Kalaban Coura", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 40000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Bureau à louer à Kalaban Coura", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 75000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id , user_id: users.last.id},
    {name: "Garage à louer à Niamana", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 50000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Niamana", unity_id: unities.first.id , user_id: users.last.id},
    {name: "Villa à louer à Kalaban Coura ACI", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 150000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura ACI" , unity_id: unities.first.id, user_id: users.last.id},
    {name: "Studio à louer à Niamakoro", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 10000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Niamakoro", unity_id: unities.first.id , user_id: users.last.id},
    {name: "Terrain à vendre au Cité UNICEF", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 40000000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Niamakoro", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Terrain pour agriculture", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 400000, full_address: "Bamako", country: "Mali", city: 'Sénou', neighborhood: "Sénou", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Appartement meublé à Kalaban Coura", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 25000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Appartement meublé à Kalaban Coura", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 25000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Chambre d'hôtel", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 25000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Chambre climatisée", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 10000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "studio à Faladie", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 10000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Faladie", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Appartement à louer ", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 40000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Yirimadjo Zerni", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Terrain à vendre", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 15000000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Niamana", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Chambre climatisée", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 15000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coro", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Villa à louer", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 125000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Maison à vendre", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 6000000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Bureau à louer", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 100000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Parking à louer", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 75000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Chambre de passe", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 7000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Terrase à louer", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 40000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Espace à louer", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 40000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Studio à louer", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 7500, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Colocation d'un appartement", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 6000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Magasin à louer", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 50000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Appartement meublé", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 15000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Garage à louer", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 60000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Terrain à vendre", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 100000000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura",  unity_id: unities.first.id, user_id: users.last.id},
    {name: "Verger à louer", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 1000000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id},
    {name: "Appartement à louer à Kalaban Coura", description: '', offer_type_id: offer_types.first.id, property_type_id: property_types.first.id, price: 45000, full_address: "Bamako", country: "Mali", city: 'Bamako', neighborhood: "Kalaban Coura", unity_id: unities.first.id, user_id: users.last.id}
])
end