xx = lerp(xx,x,0.5)
yy = lerp(yy,y,0.5)

wind_time += 0.02; 
var wind_force = sin(wind_time) * 3
rot = lerp(rot, wind_force, 0.1);

draw_sprite_ext(spr_flowerPot,image_index,xx,yy,image_xscale,image_yscale,rot,image_blend,image_alpha);
draw_self()

if alarm[1] > 0{
	mask_index = spr_flowerPotEmpty
}
else{
	mask_index = spr_flowerPot
}

