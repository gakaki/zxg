class CoffeePerson
	constructor: (@name, @age) ->
	toString: () ->
		"name is #{@name} age is #{@age} years old"
		
felix = new CoffeePerson "Felix Hoenikker", 63
console.log felix.toString()


class	People
	constructor: (@name, @birth,@hp) ->
		@age   = 2012 - @birth
		@life  = @age * 10

	dead: ->
		not @hp
		
	hurt:->
		@life -= Math.round Math.random() * 100
	sha:=>
		@hp -= 1 if @hp > 0
		
	sha_view:=>
			console.log "Your hp is #{@hp}"
		
	life_view:->
		if p.life < 0
			console.log "you're dead"
		else
			console.log "you are healthy , your life remains #{@life}"

p = new People 'gakaki',  1984 ,100
#loop
#	p.sha()
#	p.sha_view()

[1..p.life].map (i)->
	 p.sha()
p.sha_view()
console.log p.dead?

'''
loop
	break if p.life < 0
	p.hurt()
	p.life_view()
'''

	