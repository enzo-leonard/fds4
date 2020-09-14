import { magenta } from "ansi-colors"

const initQuizz = () => {

    const quizzContainer = document.querySelector('.quizz-center')
    const propContainer = document.querySelector('.prop-container')
    const h2 = document.querySelector('.quizz-center h2')
    const beginBtn = document.querySelector('.btn-valid')
    const text = document.querySelector('#question')

    const questionMeta = document.querySelectorAll('[data-type="question"]')
    let questions = []
    questionMeta.forEach((meta) => {questions.push(meta.dataset.uid) })
  
    

    beginBtn.addEventListener('click', () => {
        //quizzContainer.classList.add('question')
        next()
    })

    const next = () => {
        
        let random = Math.floor(Math.random() * questions.length); 
        let id = questions[random]
        let good_answer = document.querySelector(`#projet_${id} [data-type="good"]`)
        let prop_1 = document.querySelector(`#projet_${id} [data-type="prop_1"]`)
        let prop_2 = document.querySelector(`#projet_${id} [data-type="prop_2"]`)
        let quizzRound = document.querySelector('#quizz-round') 
        quizzRound.outerHTML = '<circle id="quizz-round" cx="348.662" cy="348.662" r="348.662" transform="translate(1309.424 980.356) rotate(180)" fill="#039F3A" stroke="#000" stroke-miterlimit="10" stroke-width="1"/>'
        
   
        


        h2.classList.add('hidden')
        text.innerHTML = document.querySelector(`#projet_${id} [data-type="question"]`).content
        propContainer.innerHTML = ""
       
        propContainer.insertAdjacentHTML('beforeend', `<div id="good" class="prop">${good_answer.content}</div>`)
        propContainer.insertAdjacentHTML('beforeend', `<div id="bad_1" class="prop">${prop_1.content}</div>`)
        if (prop_2) propContainer.insertAdjacentHTML('beforeend', `<div id="bad_2" class="prop">${prop_2.content}</div>`)

        let good = document.querySelector('#good')
        let bad_1 = document.querySelector('#bad_1')
        let bad_2 = document.querySelector('#bad_2')

        questions.splice(random, 1);
        beginBtn.classList.add('hidden')
      
        good.addEventListener('click', () => console.log('JUSTE'))
        good.addEventListener('click', () => {go_answer(true, id)})
        bad_1.addEventListener('click', () => {go_answer(false, id)})
        if(bad_2) bad_2.addEventListener('click', () => {go_answer(false, id)})
       
    }

    const go_answer = (result, id) => {
     
        let title = ""
        let answer = document.querySelector(`#projet_${id} [data-type="answer"]`).content
      
        title = (result == true) ?  "Bonne réponse" :  "Faux"
        text.innerHTML = `<h2>${title}</h2> ${answer}`
        propContainer.innerHTML = `<div data-target="#modal_${id}" class="prop"> En savoir plus </div> <div id="next" class="prop">Suivant</div>`

        const toggleBtn = document.querySelectorAll('[data-target]')
        const blurBtn = document.querySelector('.background-modal')
        const modals = document.querySelectorAll('.modal-container')

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

        document.querySelector('#next').addEventListener('click', next)
        
    }

    

    
   


}

export default initQuizz