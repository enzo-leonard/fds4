const initModal = () => {

    const toggleBtn = document.querySelectorAll('[data-target]')
    const blurBtn = document.querySelectorAll('.background-modal, .close-btn, .close-btn-black')
  
    const modals = document.querySelectorAll('.modal-container, .modal-container-mobile')
    const navBar = document.querySelector('nav')
    const underBar = document.querySelector('.under-bar')
    const mobile = document.querySelector('.mobile')
    
    let btnsMore = document.querySelectorAll('.item-container.form .item:not(.more) ')
    let btnsLess = document.querySelectorAll('.item-container.form .item.more')

    let btnsMoreTheme = document.querySelectorAll('.item-container.theme .item:not(.more) ')
    let btnsLessTheme = document.querySelectorAll('.item-container.theme .item.more')

    btnsMore.forEach((btn) => {
        let id = btn.dataset.id
        let inputMore = document.querySelector(`#more-${id}`)
        let inputLess = document.querySelector(`#less-${id}`)
 
        btn.addEventListener('click', () => {
            inputMore.value += btn.dataset.uid+';'
            btn.classList.add('more')
            document.querySelector(`#more-${id}`)
        })
    })

    btnsLess.forEach((btn) => {
        let id = btn.dataset.id
        let inputMore = document.querySelector(`#more-${id}`)
        let inputLess = document.querySelector(`#less-${id}`)
 
        btn.addEventListener('click', () => {
            inputLess.value += btn.dataset.uid+';'
            btn.classList.remove('more')
        })
    })

    btnsMoreTheme.forEach((btn) => {
        let id = btn.dataset.id
        let inputMore = document.querySelector(`#more-theme-${id}`)
        let inputLess = document.querySelector(`#less-theme-${id}`)
 
        btn.addEventListener('click', () => {
            inputMore.value += btn.dataset.uid+';'
            btn.classList.add('more')
        })
    })

    btnsLessTheme.forEach((btn) => {
        let id = btn.dataset.id
        let inputMore = document.querySelector(`#more-theme-${id}`)
        let inputLess = document.querySelector(`#less-theme-${id}`)
 
        btn.addEventListener('click', () => {
            inputLess.value += btn.dataset.uid+';'
            btn.classList.remove('more')
        })
    })
   
   
 

    navBar.addEventListener('click', () => { underBar.classList.toggle('active')})


    toggleBtn.forEach((btn) => {
        
        btn.addEventListener('click', () => {
            const target = btn.dataset.target    
            console.log(target)  
            console.log(document.querySelector(`${target}`))       
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