class PrintWorker
  include Sidekiq::Worker
 
  def perform(email,signd,uname,name,model)
   # puts str 
    puts "List Of Users and their Details"
    puts " "
 	i=0
     email.each do
        print i
        print " "
	puts email[i]
        i=i+1
	end
	i=0
   puts " "
   puts "List Of Username"
    puts " "
     uname.each do
        print i
        print " "
        puts email[i]
	puts uname[i]
        i=i+1
	end
    puts " "
   puts "List Of Users Signed In count"
    puts " "
     i=0
     signd.each do
        print i
        print " "
	puts signd[i]
        i=i+1
	end

 
puts " "
   puts "List Of MObile Name"
    puts " "
     i=0
     name.each do
        print i
        print " "
	puts name[i]
        i=i+1
	end

  puts " "
   puts "List Of Mobile Model"
    puts " "
     i=0
     model.each do
        print i
        print " "
	puts model[i]
        i=i+1
	end


 puts " "
 puts "Listing all Users together"
  i=0
  uname.each do
        print "User:"
        print i
        print " "
        print email[i]
        print "   "
	print uname[i]
        print "   "
	print signd[i]
        puts " "
        i=i+1
	end
  
 puts "Listing all Mobiles"
  i=0
  name.each do
        print "Mobile:"
        print i
        print " "
        print name[i]
        print "   "
	print model[i]
        
        puts " "
        i=i+1
	end
  
  end

 
end
