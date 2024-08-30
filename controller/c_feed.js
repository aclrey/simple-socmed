const m_post = require('../model/m_post')
const moment = require('moment')
moment.locale('id')


module.exports =
{
    index: async function (req, res) {
        let dataview = {
            req: req,
            message: req.query.msg,
            moment: moment,
            postingan: await m_post.get_all(),
            users: await m_post.get_all_users(),
        }
        res.render('feed/index', dataview)
    },

    post_detail: async function (req, res) {
        let idk_post = req.params.id_post;

        let dataview = {
            req: req,
            moment: moment,
            postingan: await m_post.get_post(idk_post),
            komentar: await m_post.get_postcomment(idk_post),
        }

        res.render('feed/post', dataview);
    },

    proses_komen: async function (req, res) {
        let idk_post = req.params.id_post; // Corrected parameter name
    
        // Ensure that user is logged in and session is available
        if (!req.session || !req.session.user || req.session.user.length === 0) {
            return res.redirect('/login'); // Redirect to login if user is not authenticated
        }
    
        // Prepare data for inserting the comment
        let data = {
            id_post: idk_post,  // Corrected: Should be the same parameter name
            komen: req.body.form_komen,
            created_at: moment().format("YYYY-MM-DD HH:mm:ss"),
            created_by: req.session.user[0].id,
        };
    
        // Insert the comment into the database
        await m_post.insert_comment(data); // Pass the `data` object correctly
    
        // Prepare data for rendering the view
        let dataview = {
            req: req,
            moment: moment,
            postingan: await m_post.get_post(idk_post), // Fetch the post details
            komentar: await m_post.get_postcomment(idk_post), // Fetch the comments for the post
        };
    
        res.render('feed/post', dataview);  // Render the view with the data
    },

}