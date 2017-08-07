require_relative 'methods.rb'
require_relative 'scrapper.rb'
# Message de bienvenue
# Demande qu'elle action l'utilisateur veut réaliser
# en lui présentant les options possible
# Puis lui reproposer des actions tant que l'utilisateur n'a pas
# demander à quitter
# Socker l'action que l'utilisateur veut réaliser et l'afficher

# créer un nouveau fichier ruby
# ajouter un lien vers le fichier method dans interface.rb
# créer un hash permettant de stocker les items de la gift list
# créer plusieurs méthodes pour les action list, add, delete
# rejeter les actions qui diffèrent de list, add et delete
puts "🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁"
puts "🎁 🎁 🎁 Welcome to your Christmas giftlist🎁 🎁 🎁"
puts "🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁 🎁"
puts ""
action = "add"

# giftlist = load_from_csv
giftlist = []
gift_to_delete = 0
until action == "quit"
  puts "Which action [list|add|delete|mark|quit|etsy]?"
  print "> "
  action = gets.chomp
  case action
  when "add"
    puts "What item would you like to add?"
    print "> "
    giftlist << { item: gets.chomp, bought: false}
    puts "Here is your list now:"
    list(giftlist)

  when "list"
    puts "Your giftlist is composed of these items:"
    list(giftlist)

  when "delete"
    puts "Your giftlist is composed of these items:"
    list(giftlist)
    puts "Which item number would you like to delete?"
    print "> "

    index = gets.chomp.to_i - 1
    remove_gift = giftlist.delete_at(index)
    puts "#{giftlist[index][:item]} has been deleted, here is the list now:"
    list(giftlist)
  when "quit"
    save_to_csv(giftlist)
    puts "Goodbye Sir!"

  when "mark"
    list(giftlist)
    puts "Which item would you like to mark? "
    index = gets.chomp.to_i - 1
    mark(giftlist, index)

  when "etsy"
    etsy_ideas = scrap.each_with_index do |idea, index|
      puts "#{index + 1} - #{idea}"
    end
    puts "Which idea number would you like to add?"
    print "> "
    index = gets.chomp.to_i - 1
    giftlist << { item: "#{etsy_ideas[index]}", bought: false}
    puts "Here is your list now:"
    list(giftlist)

  else
    puts "Wrong action, try again"

  end
end



