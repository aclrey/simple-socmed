const bcrypt = require('bcryptjs')
const mysql = require('mysql2')
const db = require('../config/database').db
const eksekusi = require('../config/database').eksekusi

let cari_username = function(username) {
    return eksekusi(mysql.format(
        `SELECT * FROM user WHERE username = ?`,
        [username]
    ))
}

module.exports = {
    form_login: function(req,res) {
        if (req.session.user) {
            res.redirect('/feed')
        } else {
            let dataView = {
                message: req.query.msg
            }
            res.render('auth/form-login', dataView)
        }
    },

    proses_login: async function(req,res) {
        let username = req.body.form_username
        let password = req.body.form_password

        let user = await cari_username(username)
        if (user.length>0) {
            let passwordCocok = bcrypt.compareSync(password, user[0].password)
            if (passwordCocok) {
                //Set data session user yang login
                req.session.user = user

                //Arahkan ke halaman feed
                res.redirect('/feed')
            } else {
                let message = 'Password salah, coba ingat-ingat'
                res.redirect(`/login?msg=${message}`)
            }
        } else {
            let message = 'Tidak ada di database!!'
            res.redirect(`/login?msg=${message}`)
        }
    },
    cek_login: function(req,res,next) {
        if (req.session.user) {
            next()
        } else {
            let message = 'Sesi Anda habis, silakan login ulang'
            res.redirect(`login?msg=${message}`)
        }
    },

    proses_logout: function(req,res) {
        req.session.destroy( (err)=>{
            res.redirect('/')
        })
    },
}