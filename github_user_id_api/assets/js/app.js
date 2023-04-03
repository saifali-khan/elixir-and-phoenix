// We import the CSS which is extracted to its own file by esbuild.
// Remove this line if you add a your own CSS build pipeline (e.g postcss).
import "../css/app.css"

// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket



// javascript with similar functionalitys


// let form = document.getElementById("myform");
// form.addEventListener("submit", function (event) {


//   event.preventDefault()
//   let search = document.getElementById("search")
//   let url = "https://api.github.com/users/";
//   let removeSpace = search.value.split(" ").join("")


//   fetch(url + removeSpace)
//     .then(response => response.json())
//     .then(data => {
//       if (data.message === "Not Found") {
        
//           document.getElementById("intro-container").style.display = "flex";
//         alert("No Such User");
//       } else {

//         document.getElementById("profile-card").style.display = "flex";
//         document.getElementById("intro-container").style.display = "none";
//         let name = document.getElementById("user-name");
//         let gitProfile = document.getElementById("git-profile");
//         let gitLink = document.getElementById("git-link");
//         let bio = document.getElementById("bio");
//         let repo = document.getElementById("repository");
//         let followers = document.getElementById("followers");
//         let following = document.getElementById("following");
//         let location = document.getElementById("location");
//         let twitter = document.getElementById("twitter");
//         let blog = document.getElementById("blog");
//         let company = document.getElementById("company");

//         name.innerHTML = data.name || data.login;

//         gitProfile.href = data.html_url;
//         gitProfile.innerHTML = `<img src='${data.avatar_url}' alt='user image'>`

//         gitLink.href = data.html_url;
//         gitLink.innerHTML = "@" + data.login;

//         bio.innerHTML = "bio: " + data.bio;
//         if (data.bio === null) {
//           bio.innerHTML = "bio: not available"
//         }

//         repo.innerHTML = data.public_repos;

//         followers.innerHTML = data.followers;

//         following.innerHTML = data.following;

//         location.innerHTML = " " + data.location;
//         if (data.location === null) {
//           location.innerHTML = " not available"
//         }

//         twitter.innerHTML = ' ' + data.twitter_username;
//         if (data.twitter_username === null) {
//           twitter.innerHTML = " not avilable"
//         }

//         blog.href = data.blog;
//         if (data.blog === "" || null) {
//           blog.innerHTML = "not available";
//         }

//         company.innerHTML = ' ' + data.company;
//         if (data.company === null) {
//           company.innerHTML = " not available"
//         }

//       }

//     })
//     .catch(document.getElementById("profile-card").style.display = "none")
//   search.value = "";
// })

