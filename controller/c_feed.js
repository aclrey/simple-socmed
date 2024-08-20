module.exports = {
    index: function (req,res) {
        let dataView = {
            req: req
        }
        res.render("feed/index", dataView)
    },
}