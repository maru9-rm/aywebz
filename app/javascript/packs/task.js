import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {
    // ページ読み込みというイベントを監視して、それが行われたら続く関数を実行する。

    $('.task-show').each(function (index,element){
        // task-showクラスを持っているdivを探し、それぞれにおいて、以下の処理を行う。
        const dataset = $(element).data()
        // elementの中身はviewで与えたdata(設定したidとか)
        const taskId = dataset.taskId
        const user_id = dataset.userId
        // element内のtaskIdとかを使いやすいように定義。user_idとしてるのはリクエストする際にこっちじゃなきゃコントローラーで使えなかったから。
        // achievements_controller.rbのshowアクションにリクエストを飛ばす。
        axios.get(`tasks/${taskId}/achievement`,{params: {user_id}})
        .then((response) => {
          const hasAchievement = response.data.hasAchievement
          if (hasAchievement) {
            $(`#status-ok${user_id}-${taskId}`).removeClass('hidden')
          } else {
            $(`#status-yet${user_id}-${taskId}`).removeClass('hidden')
          }
        })


    $(`#status-ok${user_id}-${taskId}`).on('click', () => {
        window.confirm('状態を「未」に変更します。')
        axios.delete(`tasks/${taskId}/achievement`,{params: {user_id}})
        .then((response) => {
            if (response.data.status === 'ok') {
            $(`#status-ok${user_id}-${taskId}`).addClass('hidden')
            $(`#status-yet${user_id}-${taskId}`).removeClass('hidden')
            }
        })
        .catch((e) => {
            window.alert('Error1')
            console.log(e)
        })
    })

    $(`#status-yet${user_id}-${taskId}`).on('click', () => {
        axios.post(`tasks/${taskId}/achievement`,{user_id: user_id})
        .then((response) => {
            if (response.data.status === 'ok') {
            $(`#status-ok${user_id}-${taskId}`).removeClass('hidden')
            $(`#status-yet${user_id}-${taskId}`).addClass('hidden')
            }
        })
        .catch((e) => {
            window.alert('Error2')
            console.log(e)
        })
    })


})

})