const populateAlbumSelector = () => {
  getAPI(
    `./api/album/getallalbums.php`, (resp) => {
      const data = (JSON.parse(resp));
      data?.payload?.map((album) => {
          document.getElementById("album_lagu").insertAdjacentHTML(
              "beforeend",
              `<option value="${album?.album_id}">${album?.judul}</option>`
          )
      })
    },
  );
};

const setArtist =async () => {
  const album_id = document.getElementById("album_lagu").value;
  await fetch(`http://svelte-demo-mu.vercel.app/api/api/album/getalbum.php?id=${album_id}`, {
    method: 'GET',
    headers: {
      "apikey": getCookie("session_id")
		}
   
  })
    .then(response => response.json())
    .then(data => {
      document.getElementById("penyanyi_lagu").value = data?.payload?.penyanyi;
    })
    .catch(error => {
      console.error('Error:', error);
    });
  /*getAPI(
    `./api/album/getalbum.php?id=${album_id}`, (resp) => {
      const data = (JSON.parse(resp));
      document.getElementById("penyanyi_lagu").value = data?.payload?.penyanyi;
    },
  );*/
}

populateAlbumSelector();
