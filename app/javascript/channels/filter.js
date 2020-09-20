const initFilter =  () => {
    if(!document.querySelector('body.update, body.sessions')) {
        const inputs = document.querySelectorAll('input, select')
        const form = document.querySelector('form')
        inputs.forEach((input) => {
            input.addEventListener('change', () => {
                form.submit()
                console.log('go')
            })
        })

    
    }

} 


export default initFilter;