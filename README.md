whatmp3 is a small script to create mp3 torrents out of FLACs.

Depends on flac, metaflac, mktorrent, and optionally oggenc, lame, neroAacEnc,
neroAacTag, mp3gain, aacgain, vorbisgain, and sox.

Configuration is handled either at the top of the file in the configuration
section, or via shell aliases.

Usage
-----
Running `whatmp3` on its own won't do too much. You need to specify the lame or oggenc flags you want to convert with, and the directories you want to convert.

Usage: whatmp3 [options] [--320 --V2 --Q8 --AAC ...] /path/to/FLAC

	--V0 --V2 --320 --Q8 --AAC --FLAC --ALAC ...
		convert to V0, V2, &c - you can add your own by editing the file

	--version             	show program's version number and exit
	-h, --help            	show this help message and exit
	-v, --verbose         	increase verbosity (Default: False)
	-n, --notorrent       	do not create a torrent after conversion (Default: False)
	-m, --copyother		copy additional files (Default: True)
	-z, --zeropad         	zeropad track numbers (Default: True)
	-r, --replaygain      	add ReplayGain to new files (Default: False)
	-d, --dither          	dither FLACs to 16/44 before encoding (Default: False)
	-c, --original        	create a torrent for the original FLAC
	-p, --passkey PASSKEY	tracker PASSKEY
	-t, --tracker URL	tracker URL (Default: "http://tracker.what.cd:34000/")
	-o, --output PATH	set the output PATH
	--threads THREADS     	set number of threads THREADS (Default: 1)
	--torrent-dir PATH	set independent torrent output directory
	--skipgenre		do not insert a genre tag in MP3 files (Default: False)
	--nodate		do not write the creation date to the .torrent file (Default: False)
	--nolog			do not copy log files after conversion (Default: False)
	--nocue			do not copy cue files after conversion (Default: False)

Minimally, you need a passkey, a tracker, and an encoding option to create a working torrent to upload.
However, `whatmp3` will work without tracker data with the `--notorrent` option.

You need to add your torrent passkey and output directory in order to make the `.torrent` file to upload to What.CD:

	passkey = "YOUR PASSKEY HERE"

Examples
--------
This will convert `OSI - Office of Strategic Influence` to V2 and V0:

	whatmp3 --V2 --V0 OSI\ -\ Office\ of\ Strategic\ Influence\ \(FLAC\)

The transcoded files will go into "OSI - Office of Strategic Influence (V0)" (or "[...] (V2)") in your `output` directory, which is by default your current directory.

This will convert `Porcupine Tree - Deadwing` and `Porcupine Tree - In Absentia` to 320 CBR, V0, and V2 (the "perfect three"):

	whatmp3 --320 --V2 --V0 "Porcupine Tree - Deadwing" "Porcupine Tree - In Absentia"

`.torrent` files will be created in `torrent-dir` directory, or by default your `output` directory.

Threading is supported by default. By default `whatmp3` will use as many threads as you have CPU cores.
To set manually, use the `--threads NUM` option (or set `max_threads`):

	whatmp3 --threads 2 --V2 "Enslaved - Isa"

Transcode verbosely to V2 and Q8 in ~/high/seas, zeropad track numbers, dither, apply replaigain, and do not create a torrent:
	
	whatmp3 -vzdrn --output ~/high/seas --Q8 --V2 Nightingale\ -\ I

Bugs
----
Entomologists are welcome to submit reports and patches via email, github, or other nefarious methods.

Contributors
------------
Primary author and maintainer: Sam Baldwin / shardz <fuhsaz 'at' cryptic 'dot' li>

Initial python port by demonstar55

Patches contributed by:
* Francis Drake - improved threading
* Tim Ekl <lithium3141 'at' gmail 'dot' com> - Use os.path.join()
* Etienne Perot <etienne 'at' perot 'dot' me> - Add --skiggenre, --nodate
* Michael Rodler <michael 'at' michaelrodler 'dot' at> - Fix lowcase flac/codec substring replacement
* Justin Duplessis <drfoliberg 'at' gmail 'dot' com> - Set default max thread count intelligently

Countless input and bug reports provided by unlisted and uncredited, but thanked, users.
