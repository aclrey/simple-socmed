const mysql = require('mysql2')
const eksekusi = require('../config/database').eksekusi
const moment = require('moment')
moment.locale('id')

module.exports =
{

    insert: function (req, file1_name, file2_name, file3_name) {
        let data = {
            caption: req.body.form_caption,
            file1: (file1_name) ? file1_name : null,
            file2: (file2_name) ? file2_name : null,
            file3: (file3_name) ? file3_name : null,
            created_at: moment().format("YYYY-MM-DD HH:mm:ss"),
            created_by: req.session.user[0].id,
        }

        return eksekusi(mysql.format(
            `INSERT INTO post SET ?`,
            [data]
        ))
    },

    get_all: function () {
        return eksekusi(mysql.format(
            `SELECT
                p.*,
                u.username, u.nama_lengkap, u.foto
            FROM post AS p
            LEFT JOIN user AS u ON u.id = p.created_by  
            ORDER BY p.id DESC`
        ))
    },

    get_all_users: function () {
        return eksekusi(mysql.format(
            `SELECT * FROM user`
        ))
    },

    get_post: function (idk_post) {
        return eksekusi(mysql.format(
            `SELECT
            p.*,
            u.username, u.nama_lengkap, u.foto
            FROM post AS p
            LEFT JOIN user AS u ON u.id = p.created_by  
            WHERE p.id = ?`,
            [idk_post]
        ))
    },

    get_postcomment: function (idk_post) {
        return eksekusi(mysql.format(
        `SELECT 
        komentar.*,       -- Select all fields from the komentar table
        post.*,           -- Select all fields from the post table
        user.username,    -- Select specific fields from the user table
        user.foto
        FROM post
        LEFT JOIN komentar ON komentar.id_post = post.id   -- Join komentar with post based on post ID
        LEFT JOIN user ON user.id = komentar.created_by    -- Join user with komentar based on user ID
        WHERE post.id = ?;                             -- Filter by a specific post ID (replace ? with your value)
        `,
        [idk_post]
        ))
    },

    insert_comment: function (data) {

        return eksekusi(mysql.format(
            `INSERT INTO komentar SET ?`,
            [data]
        ))
    },
   
}