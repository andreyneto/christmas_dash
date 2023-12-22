game_over_scene=scene:extend({
	gui={},
	new_highscore=false,
	new_highcoins=false,
	new_highdistance=false,
	init=function(_ENV)
		gui = {
			{strings.distance,score.getdistance(),0,0},
			{strings.score,score.getpoints(),82,48},
			{strings.coins,score.getcoins(),40,1},
		}
		new_highscore = score.points[1] >= high_score[1] and score.points[2] > high_score[2]
		new_highcoins = score.coins[1] >= high_coins[1] and score.coins[2] > high_coins[2]
		new_highdistance = score.distance[1] >= high_distance[1] and score.distance[2] > high_distance[2]
		if new_highscore then dset(1, score.points[1]) dset(2, score.points[2]) end
		if high_coins then dset(3, score.coins[1]) dset(4, score.coins[2]) end
		if high_distance then dset(5, score.distance[1]) dset(6, score.distance[2]) end
		local total = total_coins
		for i=0,score.coins[2] do
			total[2] += i
			if(total[2] == 10000) then
				total[1]+=1
				total[2]=0
			end
		end
		total[1] += score.coins[1]
		dset(7,total[1]) dset(8, total[2])
	end,

	update=function(_ENV)
		if btnp(❎) then
			scene:load(game_scene)
		end
		if btnp(🅾️) then
			scene:load(title_scene)
		end
	end,

	draw=function(_ENV)
		if new_highscore or new_highcoins or new_highdistance then
			printc("new high score",32,10, true)
		else
			printc("game over",32,7, true)
		end
		printc("score.........."..score.getpoints(),56,new_highscore and 10 or 7, true)
		printc("distance......."..score.getdistance(),64,new_highdistance and 10 or 7, true)
		printc("coins.........."..score.getcoins(),72,new_highcoins and 10 or 7, true)
		print("🅾️ menu",8,112,7)
		print("❎ play again",69,112,7)
	end,
})