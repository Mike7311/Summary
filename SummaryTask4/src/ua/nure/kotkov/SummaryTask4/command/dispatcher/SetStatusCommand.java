package ua.nure.kotkov.SummaryTask4.command.dispatcher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import ua.nure.kotkov.SummaryTask4.Path;
import ua.nure.kotkov.SummaryTask4.command.Command;
import ua.nure.kotkov.SummaryTask4.db.DBManager;
import ua.nure.kotkov.SummaryTask4.exception.AppException;

/**
 * Set flight status
 * 
 * @author M.Kotkov
 *
 */
public class SetStatusCommand extends Command {

	private static final long serialVersionUID = 7106888242045482153L;

	private static final Logger LOG = LogManager.getLogger(SetStatusCommand.class);
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, AppException {
		LOG.traceEntry();
		int flightId = Integer.parseInt(request.getParameter("flightId"));
		int statusId = Integer.parseInt(request.getParameter("statuses"));
		int rows = 0;
		int success = 0;
		rows = DBManager.getInstance().updateFlightStatus(statusId, flightId);
		if(rows>0){
			success = 1;
		}
		LOG.traceExit();
		return Path.REDIRECT_FLIGHT + success;
	}

}
