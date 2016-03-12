# whatmp3

whatmp3 transcodes audio files and creates torrents for them

whatmp3 takes a list of directories containing FLAC files and
a list of formats to transcode to. For each top level directory passed,
a new directory containing the transcoded audio files and optionally
a torrent (with `mktorrent`) are created.

whatmp3 requires `flac`, `metaflac`, at least one kind of encoder (eg
`lame`, `oggenc`).

`mktorrent` and replaygain tools (eg `vorbisgain`) are optionally
required.

whatmp3 will not overwrite any files in output directories unless
passed -w.

whatmp3 will `touch FAILURE' in each top level dir in which a
critical error has occurred while transcoding.

## installation

edit `config.mk` to match your local setup  if required, then run
(as root if necessary):

	make clean install

gmake is required on systems with bsdmake installed by default

## usage

whatmp3 will spawn a simultaneous transcoding process for each cpu core
detected. This can be overridden with `--threads`.

torrents are created with the `-p` flag, indicating a private tracker.

see `whatmp3 -h` or `man whatmp3` for more information.

## configuration

whatmp3 can be completely configured with the command line options, but
default options can be changed by editing the file itself.

changes to the script itself are required to support changes to or new
audio formats, but knowledge of python is not required.

## example

	whatmp3 -rz -o ~/tor -t "http://my.tracker/announce" --Q8 --V0 "Svartrit - I" "Svartrit - II"

create directories "Svartrit - I (Q8)", etc in ~/tor containing
ogg vorbis Q8 and mp3 V0 transcodes with zeropadded tracknumbers and
replaygain applied, and torrents "Svartrit - I (Q8).torrent", etc in
~/tor with the specified announce URL.
