package io.planb.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MemberVO implements UserDetails {
	private int no;
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	private String birth;
	private String gender;
	private String emailReceive;
	private String country;
	private String city;
	private int question;
	private String answer;
	private String type;
	private String rest;
	private String ban;
	private String regDate;
	private String lastDate;
	private String profileImg;
	private int reportCnt;
	private String beforePassword;
	private int selectKeywords;
	private String authority;
	
	public MemberVO() {}

	public MemberVO(int no, String email, String password, String firstName, String lastName, String birth,
			String gender, String emailReceive, String country, String city, int question, String answer, String type,
			String rest, String ban, String regDate, String lastDate, String profileImg, int reportCnt,
			String beforePassword, int selectKeywords, String authority) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birth = birth;
		this.gender = gender;
		this.emailReceive = emailReceive;
		this.country = country;
		this.city = city;
		this.question = question;
		this.answer = answer;
		this.type = type;
		this.rest = rest;
		this.ban = ban;
		this.regDate = regDate;
		this.lastDate = lastDate;
		this.profileImg = profileImg;
		this.reportCnt = reportCnt;
		this.beforePassword = beforePassword;
		this.selectKeywords = selectKeywords;
		this.authority = authority;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmailReceive() {
		return emailReceive;
	}

	public void setEmailReceive(String emailReceive) {
		this.emailReceive = emailReceive;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getQuestion() {
		return question;
	}

	public void setQuestion(int question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRest() {
		return rest;
	}

	public void setRest(String rest) {
		this.rest = rest;
	}

	public String getBan() {
		return ban;
	}

	public void setBan(String ban) {
		this.ban = ban;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}

	public String getBeforePassword() {
		return beforePassword;
	}

	public void setBeforePassword(String beforePassword) {
		this.beforePassword = beforePassword;
	}

	public int getSelectKeywords() {
		return selectKeywords;
	}

	public void setSelectKeywords(int selectKeywords) {
		this.selectKeywords = selectKeywords;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", email=" + email + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", birth=" + birth + ", gender=" + gender + ", emailReceive="
				+ emailReceive + ", country=" + country + ", city=" + city + ", question=" + question + ", answer="
				+ answer + ", type=" + type + ", rest=" + rest + ", ban=" + ban + ", regDate=" + regDate + ", lastDate="
				+ lastDate + ", profileImg=" + profileImg + ", reportCnt=" + reportCnt + ", beforePassword="
				+ beforePassword + ", selectKeywords=" + selectKeywords + ", authority=" + authority + "]";
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(getAuthority()));
		
		return authorities;
	}

	@Override
	public String getUsername() {
		return email;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
