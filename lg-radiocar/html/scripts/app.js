var player;
var vueApp = new Vue({
    el: '#radio',
    data: {
        show: false,
        songs: [],
        playing: false,
        currentSong: { label: "Unknown", url: "" },
        volume: 50,
        currentTime: '00:00'
    },
    methods: {
        playMusic(index) {
            var song = this.songs[index];
            this.playUrl(song.url, song.label);
            $.post('https://lg-radiocar/play', JSON.stringify({ url: song.url, name: song.label }));
        },
        playCustom(url, name) {
            this.playUrl(url, name);
            $.post('https://lg-radiocar/play', JSON.stringify({ url: url, name: name }));
        },
        playUrl(url, name) {
            this.playing = true;
            this.currentSong = { label: name, url: url };
            if (player && player.loadVideoByUrl) {
                player.loadVideoByUrl(url);
                player.setVolume(this.volume);
            }
        },
        showIndex(index) {
            $("#editSong").show();
            // You might want to store the index being edited
            this.editingIndex = index;
        },
        saveSong() {
            var name = $("#AddName").val();
            var url = $("#AddUrl").val();
            if(this.editingIndex !== undefined && this.songs[this.editingIndex]) {
                this.songs[this.editingIndex].label = name;
                this.songs[this.editingIndex].url = url;
            }
            $("#editSong").hide();
        },
        close() {
            this.show = false;
            $.post('https://lg-radiocar/close', JSON.stringify({}));
        },
        togglePlay() {
            if (player && player.getPlayerState() == 1) {
                player.pauseVideo();
                this.playing = false;
            } else if (player) {
                player.playVideo();
                this.playing = true;
            }
        },
        volumeUp() {
            if (this.volume < 100) this.volume += 5;
            if (player) player.setVolume(this.volume);
        },
        volumeDown() {
            if (this.volume > 0) this.volume -= 5;
            if (player) player.setVolume(this.volume);
        }
    }
});

// NUI Message Listener
window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.type === "ui") {
        if (item.status == true) {
            vueApp.show = true;
            vueApp.songs = item.list;
            $("#radio").show();
        } else {
            vueApp.show = false;
            $("#radio").hide();
        }
    } else if (item.type === "play") {
        vueApp.playUrl(item.url, item.name);
    }
});

// Close on Escape key
document.onkeyup = function (data) {
    if (data.which == 27) {
        vueApp.close();
    }
};

// YouTube API Ready
function onYouTubeIframeAPIReady() {
    player = new YT.Player('trash', {
        height: '0',
        width: '0',
        events: {
            'onReady': onPlayerReady
        }
    });
}

function onPlayerReady(event) {
    event.target.setVolume(50);
}

// Button Listeners (connecting the static HTML buttons to Vue methods)
$(document).ready(function() {
    $("#buttonOff").click(function() {
        vueApp.close();
    });
    $("#play").click(function() {
        vueApp.togglePlay();
    });
    $("#volumeup").click(function() {
        vueApp.volumeUp();
    });
    $("#volumedown").click(function() {
        vueApp.volumeDown();
    });
});
