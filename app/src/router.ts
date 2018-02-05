export default app => {
    // app.use('/',home)

    app
    .get("/", (req, res, next) => {
        res
            .status(200)
            .json({ data: "método get de home" });
    })
    .post("/", (req, res, next) => {
        console.log("body response", req.body);
        res
            .status(201)
            .json({ data: "método post" });
    });
};