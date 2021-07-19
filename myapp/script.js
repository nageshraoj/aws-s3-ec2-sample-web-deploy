function showUser(userinfo) {
  const user = document.createElement('div')
  user.classList.add = 'user-container'
  user.innerHTML = `
     <div class="user-header">
            <img class="profile-image" src=${userinfo.picture.medium} alt="profile-pic">
            <div class="user-name"><strong>Name:</strong> ${userinfo.name.title} ${userinfo.name.first} ${userinfo.name.last} </div>
             <div class="user-body">
           <small> Address:  ${userinfo.location.city} ${userinfo.location.state} </small> 
            </div>
        </div>
    `
  document.body.appendChild(user)
}

function getUser() {
  fetch('https://randomuser.me/api/?results=50')
    .then((response) => response.json())
    .then((data) => data.results.map((usr) => showUser(usr)))
}

getUser()
