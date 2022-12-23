const express = require("express");
const router = express.Router();
const sportProc = require('../Functions&Procedures/SportManager_proc');

router.get("/",(req,res) => {
    res.render("sportManagerHome");
    
});
console.log(sportProc.clubsNeverScheduled())
module.exports = router;