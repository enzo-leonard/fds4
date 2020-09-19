import { magenta } from "ansi-colors"

const initQuizz = () => {

    const quizzContainer = document.querySelector('.quizz-center')
    const propContainer = document.querySelector('.prop-container')
    const h2 = document.querySelector('.quizz-center h2')
    const beginBtn = document.querySelector('.btn-valid')
    let text = document.querySelector('#question')

    const questionMeta = document.querySelectorAll('[data-type="question"]')
    let questions = []
    questionMeta.forEach((meta) => {questions.push(meta.dataset.uid) })
  
    
    if (beginBtn){
        beginBtn.addEventListener('click', () => {
            //quizzContainer.classList.add('question')
            next()
        })
    }

    const next = () => {
        text = document.querySelector('#question')
        let random = Math.floor(Math.random() * questions.length); 
        let id = questions[random]
        
        text.classList.add('active')
        let good_answer = document.querySelector(`#projet_${id} [data-type="good"]`)
        let prop_1 = document.querySelector(`#projet_${id} [data-type="prop_1"]`)
        let prop_2 = document.querySelector(`#projet_${id} [data-type="prop_2"]`)
        let quizzRound = document.querySelector('#quizz-round') 
        let quizzRound_mobile = document.querySelector('.quizz-round-mobile') 
        
        if (quizzRound) quizzRound.setAttribute("fill", "#5771BE");
        if (quizzRound_mobile) { quizzRound_mobile.classList.add('active'); ; quizzRound_mobile.classList.remove('answer') }
        console.log(quizzRound_mobile)
      
       // quizzRound.outerHTML = '<circle id="quizz-round" cx="348.662" cy="348.662" r="400" transform="translate(1309.424 980.356) rotate(180)" fill="#5771BE" stroke="#000" stroke-miterlimit="10" stroke-width="1"/>'
        Ellipse_64
        let point = document.querySelector('#Ellipse_64') 

        //point.outerHTML = `<ellipse id="Ellipse_64" data-name="Ellipse 64" cx="10.164" cy="10.164" rx="10.164" ry="10.164" fill="#FFF"></ellipse>`
        


        h2.classList.add('hidden')
       
        text.innerHTML = document.querySelector(`#projet_${id} [data-type="question"]`).content
        propContainer.innerHTML = ""
        let randomOrder = Math.floor(Math.random() * 3);
        console.log(good_answer.content)
        if (good_answer.content == "Les deux, à la fois parc d'activités ludiques et laboratoire d'innovation et de découverte ") console.log('IIIIIIII')
        if (good_answer.content == "Les deux, à la fois parc d'activités ludiques et laboratoire d'innovation et de découverte ") randomOrder = 2 
        if (randomOrder == 0) propContainer.insertAdjacentHTML('beforeend', `<div id="good" class="prop large">${good_answer.content}</div>`)
        propContainer.insertAdjacentHTML('beforeend', `<div id="bad_1" class="prop large">${prop_1.content}</div>`)
        if (randomOrder == 1) propContainer.insertAdjacentHTML('beforeend', `<div id="good" class="prop large">${good_answer.content}</div>`)
        if (prop_2) propContainer.insertAdjacentHTML('beforeend', `<div id="bad_2" class="prop large">${prop_2.content}</div>`)
        if (randomOrder == 2) propContainer.insertAdjacentHTML('beforeend', `<div id="good" class="prop large">${good_answer.content}</div>`)

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
        text.classList.remove('active')
        let title = ""
        let color = ""
        let answer = document.querySelector(`#projet_${id} [data-type="answer"]`).content
        let quizzRound = document.querySelector('#quizz-round') 
        let quizzRound_mobile = document.querySelector('.quizz-round-mobile') 
        quizzRound.setAttribute("fill", "#EFEFEF");
        if (quizzRound) quizzRound.setAttribute("fill", "#EFEFEF");
        if (quizzRound_mobile) { quizzRound_mobile.classList.add('answer'); quizzRound_mobile.classList.remove('active')} 
      
        title = (result == true) ?  "Bonne réponse !" :  "Faux"
        color = (result == true) ? "#039F3A" : "#FF010E"
        text.innerHTML = `<h2 style="color:${color}">${title}</h2> ${answer}`
        propContainer.innerHTML = `<div data-target="#modal_${id}" class="prop green bold"> En savoir plus </div> <div id="next" class="prop green">Question suivante</div>`

        const toggleBtn = document.querySelectorAll('.prop[data-target]')
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