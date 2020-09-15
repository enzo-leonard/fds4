const initModal = () => {

    const toggleBtn = document.querySelectorAll('[data-target]')
    const blurBtn = document.querySelector('.background-modal')
    const modals = document.querySelectorAll('.modal-container')
    const navBar = document.querySelector('nav')
    const underBar = document.querySelector('.under-bar')

    navBar.addEventListener('click', () => { underBar.classList.toggle('active')})

    toggleBtn.forEach((btn) => {
       
        btn.addEventListener('click', () => {
            console.log('hey')
            const target = btn.dataset.target 
            console.log(target)
            document.querySelector(`${target}`).classList.toggle('hidden')
            blurBtn.classList.toggle("hidden")
        })
    })

    
    blurBtn.addEventListener('click', () => {
        modals.forEach((modal) => {modal.classList.add('hidden')})
        blurBtn.classList.add("hidden")
    })

}

export default initModal