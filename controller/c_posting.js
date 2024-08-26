const m_user = require('./../model/m_user')
const path = require('path')
const moment = require('moment')
moment.locale('id')

module.exports = {
    index: function (req, res) {
        let dataView = {
            req: req,
            moment: moment,
            message: req.query.msg,
        }
        res.render('posting/index', dataView)
    },
    proses_insert: async function (req, res) {
        let bio = req.body
        let caption = req.files.form_caption
        let media1 = req.files.form_media1
        let media2 = req.files.form_media2
        let media3 = req.files.form_media3

        if (caption || (media1 || media2 || media3)) {

            try {

                let max_size = 1024 * 1024 * 3 //3MB

                //Else-if is used so that the whole posting process will fail if even one of the conditions are not met
                if (media1.size > max_size) {
                    return res.redirect('/posting?msg=Media 1 melebihi limit 3MB')
                }
                else if (media2.size > max_size) {
                    return res.redirect('/posting?msg=Media 2 melebihi limit 3MB')
                }
                else if (media3.size > max_size) {
                    return res.redirect('/posting?msg=Media 3 melebihi limit 3MB')
                }
                else {
                    console.log('File akan diinput ke database')
                    let insert = await m_post.insert(req)
                    if (insert.affectedRows > 0) {
                        return res.redirect('feed?msg=Berhasil kirim postingan')
                    }
                }
            } catch (error) {
                //Menangkap error dari proses try (insert ke db)
                console.log(error)
                res.redirect(`/posting?msg=${error}`)
            }
        } else {
            //Kirim pesan error/warning
            let pesan_error = 'Caption atau media harus terisi salah satu'
            res.redirect(`/posting?msg=${pesan_error}`)
        }

    },
}
