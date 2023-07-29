var ip = require('ip')
var fs = require('fs')
var http = require('http')
const https = require('https')
const express = require('express')
const Mock = require('mockjs')

const app = express()
const PORT = 8001
const SSLPORT = 8002
const httpServer = http.createServer(app)
const httpsServer = https.createServer({
    key: fs.readFileSync('./certs/private.pem', 'utf8'),
    cert:fs.readFileSync('./certs/file.crt', 'utf8')
}, app)

var localIp = ip.address()
var localHost = `http://${localIp}:${PORT}`

app.use("/resource", express.static('static'))


app.get("/getAllPosts", (req, res, next)=>{
    let ret = [
        {
            id: 1001, 
            imageUrl: `${localHost}/resource/course/8778de4ccd67425a762cea15361639ee.jpg?x-oss-process=image/resize,m_fill,h_336,w_254`,
            thumbImageUrl: `${localHost}/resource/course/8778de4ccd67425a762cea15361639ee.jpg`, 
            title: "MongoDB高手课",
            desc: "Tapdata CTO、MongoDB中文社区主席、前MongoDB大中华区首席架构师",
            price: 129,
            teacher: "唐建法",
            total: 47,
            update: 9,
            studentCount: 2205,
            detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社",
            courseList: "第一章：MongoDB再入门 (9讲)"
        },
        {
            id: 1002,
            imageUrl: `${localHost}/resource/course/a6c8ecd93024e4ba483bd3800dac3148.jpg?x-oss-process=image/resize,m_fill,h_336,w_254`,
            thumbImageUrl: `${localHost}/resource/course/a6c8ecd93024e4ba483bd3800dac3148.jpg",
            title: "JavaScript核心原理解析`,
            desc: "重构你对JavaScript语言的认知",
            price: 129,
            teacher: "周爱民",
            total: 21,
            update: 4,
            studentCount: 2532,
            detail: "作为前端工程师必备技能，JavaScript 的重要性不言而喻。但是，很多人对 JavaScript 的印象都只是“简单易学”，对其掌握也仅仅停留在“会用就好”，以至于不求甚解、迷失于 JavaScript 。究其原因，他们从来都只是“写代码”，而没有去真正去了解、去探索“什么是语言”。.",
            courseList: "从零开始 (3讲)"
        },
    ]
    res.send(JSON.stringify(ret))
})

httpServer.listen(PORT, function(){
    console.log(`Mock server has been started. Listen to address: http://${localIp}:${PORT}`)
})
// httpsServer.listen(SSLPORT, function(){
//     console.log(`Mock server has been started. Listen to address: http://${localIp}:${SSLPORT}`)
// })
