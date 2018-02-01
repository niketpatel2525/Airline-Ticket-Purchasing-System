package pojo;

public class Passanger {
	private int psid;
	private String name;
	private String address;
	private String gender;
	private int age;
	private String passportno;
	private String nationality;
	private String contact;
	private String freqflyerno;

	public Passanger() {
	}

	public Passanger(String name, String address, String gender, int age, String passportno, String nationality,
			String contact, String freqflyerno) {
		super();
		this.name = name;
		this.address = address;
		this.gender = gender;
		this.age = age;
		this.passportno = passportno;
		this.nationality = nationality;
		this.contact = contact;
		this.freqflyerno = freqflyerno;
	}

	public Passanger(int psid, String name, String address, String gender, int age, String passportno,
			String nationality, String contact, String freqflyerno) {
		this.psid = psid;
		this.name = name;
		this.address = address;
		this.gender = gender;
		this.age = age;
		this.passportno = passportno;
		this.nationality = nationality;
		this.contact = contact;
		this.freqflyerno = freqflyerno;
	}

	public Passanger(int psid, String name) {
		this.psid = psid;
		this.name = name;
	}

	public int getPsid() {
		return psid;
	}

	public void setPsid(int psid) {
		this.psid = psid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPassportno() {
		return passportno;
	}

	public void setPassportno(String passportno) {
		this.passportno = passportno;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getFreqflyerno() {
		return freqflyerno;
	}

	public void setFreqflyerno(String freqflyerno) {
		this.freqflyerno = freqflyerno;
	}

}
