const initModal = () => {

    const toggleBtn = document.querySelectorAll('[data-target]')
    const blurBtn = document.querySelectorAll('.background-modal, .close-btn, .close-btn-black')
  
    const modals = document.querySelectorAll('.modal-container, .modal-container-mobile')
    const navBar = document.querySelector('nav')
    const underBar = document.querySelector('.under-bar')
    const mobile = document.querySelector('.mobile')

 

    navBar.addEventListener('click', () => { underBar.classList.toggle('active')})

        // some code..
       
         console.log('MOBILE')

        toggleBtn.forEach((btn) => {
            
        
            btn.addEventListener('click', () => {
                console.log(mobile.style.display)

                const target = btn.dataset.target 
               
                document.querySelector(`${target}`).classList.toggle('hidden')
                
                if (btn.dataset.type == "close"){
                    blurBtn[0].classList.add("hidden")
                }
                else{
                    blurBtn[0].classList.remove("hidden")
                }
              
            })
        })

        
        blurBtn.forEach((btn) => {
            btn.addEventListener('click', () => {
            modals.forEach((modal) => {modal.classList.add('hidden')})
            blurBtn[0].classList.add("hidden")
            })

        })
    

}

export default initModal