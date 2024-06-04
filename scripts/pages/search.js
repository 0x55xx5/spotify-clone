
const populateData = () => {
 
  var str='';
  getAPI("http://localhost:5173/api/song/genre", (data) => {
    const jsonData = JSON.parse(data);
    const genres = jsonData;
    console.log(genres);
    const genreSelect = document.getElementById("genre");
  
    genres.data.forEach((genre) => {
      const option = document.createElement("option");
      option.value = genre;
      option.innerHTML = genre;
      genreSelect.appendChild(option);
      
    });
   
  });
}

const populateData2 =async() => {
 
await fetch("http://localhost:5173/api/song/genre")
  .then(response => response.json())
  .then(jsonData => {
    const genres = jsonData;
    const genreBtns = document.getElementById("genreBtns");
    let str = '';
    genres.data.forEach((genre) => {
      str += `<input class="genre-button" spellcheck="false" data-value="${genre}" value="${genre}">`;
    });
    genreBtns.innerHTML += str;
  })
  .catch(error => {
    console.error('Error:', error);
  });
  
}


const searchLayout =async (query, filter, sort, page) => {
  console.log(query, filter, sort, page);
  if (page > 0) {
    let apiCall;

    if (filter == ""){
      apiCall = `http://localhost:5173/api/search?q=${query}&sort=${sort}&page=${page}&filter=genre`;
    } else {
      apiCall = `http://localhost:5173/api/search?q=${query}&filter=${filter}&sort=${sort}&page=${page}`;
    }
   await fetch(apiCall)
      .then(response => response.json())
      .then(jsonData => {
        songs = jsonData;
        document.getElementById("page-container").innerHTML = '';
        str = `
        <div class="search-bar-container">
          <form>
            <div class="search-bar">
              <input id="search-input" type="text" name="query" placeholder="What do you want to listen to?"/>
              <input id="submit-search" type="button" onclick="searchLayout(this.form.query.value, this.form.genre.value, this.form.sort.value, 1)" value="Search"/>
            </div>
            <div class="search-bar">
              <label for="sort">Sort by</label>
              <select name="sort" id="sort">
                <option value="asc">Ascending</option>
                <option value="desc">Descending</option>
              </select>
              <label for="genre">Genre</label>
              <select name="genre" id="genre">
                <option value="" disabled selected>Genres</option>
              </select>
            </div>
            <div name="genreBtns" id="genreBtns"  class="genre-buttons">
            </div>
          </form>
        </div>
        `;
        
        document.getElementById("page-container").innerHTML = str;

        str = `<div id="songs" class="song-list-container">`;

        str += songs.map(song =>
          `<div class="song-list" data-value="${song.id}">
            <div class="img-detail">
              <img class="img-search" src="${song.image_path}" alt=""/>
              <div class="detail-song">
                <label>${song.judul}</label>
                <label>${song.penyanyi}</label>
              </div>
            </div>
            <label class="label">${(song.duration/60) >> 0}:${("0" + song.duration%60).slice(-2)}</label>
          </div>`
        ).join("");

        str += `
          </div>
          <div class="page-anchor">
            <button class="page-anchor-button" onclick="searchLayout('${query}', '${filter}', '${sort}', ${page - 1})">\<</button>
            <label><b>${page}</b></label>
            <button class="page-anchor-button" onclick="searchLayout('${query}', '${filter}', '${sort}', ${page + 1})">\></button>
          </div>`;

        document.getElementById("page-container").insertAdjacentHTML("beforeend", str);

        if (filter == "") {
          window.history.replaceState(
            null,
            "",
            window.location.origin + window.location.pathname + "?q=" + query+ "&sort=" + sort + "&page=" + page
          );
        } else {
          window.history.replaceState(
            null,
            "",
            window.location.origin + window.location.pathname + "?q=" + query + "&filter=" + filter + "&sort=" + sort + "&page=" + page
          );
        }
      })
      .catch(error => {
        console.error('Error:', error);
      });
   
    populateData();
    populateData2();
  }
}

populateData();
populateData2();
const clickSongDetail = (id) => {
  window.location.href = `${window.location.protocol}//${window.location.host}/song.html?id=${id}`;
}

document.addEventListener("click", function(e) {
  if (e.target.getAttribute("class") == "song-list") {
    const id = e.target.getAttribute("data-value");
    console.log(id);
    clickSongDetail(id);
  }
});
document.addEventListener("click", function(e) {
  if (e.target.getAttribute("class") == "genre-button") {
    const id = e.target.getAttribute("data-value");
    const kw=document.getElementById("search-input").value;
    console.log(id);
    searchLayout(kw, id, null, 1);
    
  }
});