import * as bodyParser from "body-parser";
import * as cors from "cors";
import * as logger from "morgan";
import { config } from "dotenv";

const SETTINGS = config();

export default app => {

    // console.log(app);

    app.disable("x-powered-by");
    app.set("env", SETTINGS.parsed.ENV);
    app.set("config", SETTINGS.parsed);

    app.locals.env = app.get("env");
    app.locals.config = app.get("config");

    if (SETTINGS.parsed.ENV !== "test") {
        app.use(logger("combined"));
    }

    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded({ extended: false }));
    app.use(cors());
};