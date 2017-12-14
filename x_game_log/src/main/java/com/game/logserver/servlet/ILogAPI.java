package com.game.logserver.servlet;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/log")
public interface ILogAPI {
	@GET
	@Path(value = "/sendLog")
	@Produces({ MediaType.TEXT_PLAIN })
	public int sendLog(@QueryParam("regionID") int regionID,
			@QueryParam("serverID") int serverID,
			@QueryParam("clazzName") String clazzName,
			@QueryParam("jsonText") String jsonText);


	@GET
	@Path(value = "/submitAllLog")
	@Produces({ MediaType.TEXT_PLAIN })
	public int submitAllLog();
}
