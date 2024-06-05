const songsLayout =async (page) => {
  if (page > 0) {
    await fetch(`http://localhost:5173/api/song/getallsongs?page=${page}`, {
      method: 'GET',
      headers: {
        "apikey": getCookie("session_id")
      }
     
    })
      .then(response => response.json())
      .then(jsonData => {
        songs = jsonData;
        str = `<div class="page-title">Kpotify
              </div>
              <div id="songs" class="song-list-container">`;

        str += songs.map(song =>
            `<div class="song-list" data-value="${song.id}"
              data-image="${song.image_path}"
              data-audio="${song.audio_path}"
              data-judul="${song.judul}"
              data-penyanyi="${song.penyanyi}"
            >
              <div class="img-detail">
                <img class="img-search" src="${song.image_path}" alt=""/>
                <div class="detail-song">
                  <label class="song-title">${song.judul}</label>
                  <label>${song.penyanyi}</label>
                </div>
              </div>
              <label class="label">${(song.duration/60) >> 0}:${("0" + song.duration%60).slice(-2)}</label>
            </div>`
        ).join("");

        str += `
          </div>
          <div class="page-anchor">
          <button class="page-anchor-button" onclick="songsLayout(${page - 1})">\<</button>
          <label><b>${page}</b></label>
          <button class="page-anchor-button" onclick="songsLayout(${page + 1})">\></button>
          </div>`;

        document.getElementById("page-container").innerHTML =  str;

        window.history.replaceState(
          null,
          "",
          window.location.origin + window.location.pathname + "?page=" + page
        );
      })
      .catch(error => {
        console.error('Error:', error);
      });
   
  }
}
songsLayout(1);

const clickSongDetail = (id) => {
  window.location.href = `${window.location.protocol}//${window.location.host}/song.html?id=${id}`;
}

document.addEventListener("click", function(e) {
  if (e.target.getAttribute("class") == "song-list") {
    const id = e.target.getAttribute("data-value");
    clickSongDetail(id);
  }
});