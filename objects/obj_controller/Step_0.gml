/// @description Insert description here
// You can write your code in this editor
checkKeyboard();

if (counter == 1) {
	createProperties();
	instance_create_layer(player_x,player_y,"Instances",obj_player);
}
if (counter == 5) {
	createGroundCSV();
}
counter++;

if ((counter mod (5*room_speed)) == 0) {
	//agenda = getTravelAgenda();
	//createTraveler(agenda[0],agenda[1]);
}
