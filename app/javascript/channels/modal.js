const initModal = () => {

    const toggleBtn = document.querySelectorAll('[data-target]')

    toggleBtn.forEach((btn) => {
        btn.addEventListener('click', () => {
            const target = btn.dataset.target 
            console.log(target)
            document.querySelector(`${target}`).classList.toggle('hidden')
        })
    })
    console.log('couocu')
}

export default initModal