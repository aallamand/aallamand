def list(giftlist)
  puts
  giftlist.each_with_index do |item, index|
    check = item[:bought] ? "X" : " "
    puts "#{index + 1}- [#{check}] #{item[:item]}"
  end
  puts
end

def mark(giftlist, index)
   if giftlist[index][:bought] == true
      giftlist[index][:bought] = false
      puts "#{giftlist[index][:item]} has been marked as bought, here is the list now:"
      list(giftlist)
    else
      giftlist[index][:bought] = true
      puts "#{giftlist[index][:item]} has been marked as bought, here is the list now:"
      list(giftlist)
    end
end
