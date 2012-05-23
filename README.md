Route_Player
============

An iOS app that makes playlists for you based on your predicted journey time.

TODO
============
* Need to come up with an algorithm that selects songs that will fit into the time limit.
  * So far I am going to select songs from the top rated up until the time is finished... This isn't optimal as the first few songs will always be the same. 
  * Thinking about this - the collection of all items has to be sorted based on certain metrics. At the moment the only metric I've considered is rating. But this could be updated to include some other stuff (play count etc) and the best tracks would bubble (for want of a better word) to the top. The top tracks could be selected from this until only a few minutes are left. Then a search could be made of all the ramaining tracks (from the top of course) that could be added to fill the time best. This list of songs can then be 'randomised' to give the impression that some sort of random process is taking place.