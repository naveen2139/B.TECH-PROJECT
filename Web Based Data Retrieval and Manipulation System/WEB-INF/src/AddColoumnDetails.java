package DTO;

public class AddColoumnDetails {
	
	private String colname;
	private String datatype;
	private int colsize;
	private String constr;
	public String getColname() {
		return colname;
	}
	public void setColname(String colname) {
		this.colname = colname;
	}
	public String getDatatype() {
		return datatype;
	}
	public void setDatatype(String datatype) {
		this.datatype = datatype;
	}
	public int getColsize() {
		return colsize;
	}
	public void setColsize(int colsize) {
		this.colsize = colsize;
	}
	public String getConstr() {
		return constr;
	}
	public void setConstr(String constr) {
		this.constr = constr;
	}

}
