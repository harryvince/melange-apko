import { Hono } from "hono";
import { serve } from "@hono/node-server";

const app = new Hono();

app.get("/", (c) => {
	return c.text("Hello, Node!");
});

serve(app, () => console.log("Listening on http://localhost:3000"));
