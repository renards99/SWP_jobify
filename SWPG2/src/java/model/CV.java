/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author PC
 */
public class CV {
    int id;
    String username;
    String fullname;
    String dob;
    String gender;
    int locationID;
    String location;
    String phone;
    String contact;
    int educationID;
    String education;
    String school;
    String experience;
    String image;
    int statusID;
    String status;
    int jobid;
    String company;
    String jobName;
    String email;
    String phonecompany;
    String Jobusername;
    String time;
    
    public CV(String username) {
        this.username = username;
    }
    public CV(String fullname, String dob, String gender, int locationID, String phone, String contact, int educationID, String school, String experience) {
        this.fullname = fullname;
        this.dob = dob;
        this.gender = gender;
        this.locationID = locationID;
        this.phone = phone;
        this.contact = contact;
        this.educationID = educationID;
        this.school = school;
        this.experience = experience;
    }

    public CV(int id, String username,String fullname, String phone, String education, String school, String status) {
        this.id = id;
        this.username=username;
        this.fullname = fullname;
        this.phone = phone;
        this.education = education;
        this.school = school;
        this.status= status;
    }
    
    public CV(String fullname, String dob, String gender, int locationID, String phone, String contact, int educationID, String school, String experience, int statusID) {
        this.fullname = fullname;
        this.dob = dob;
        this.gender = gender;
        this.locationID = locationID;
        this.phone = phone;
        this.contact = contact;
        this.educationID = educationID;
        this.school = school;
        this.experience = experience;
        this.statusID = statusID;
    }
       public CV(int id,String fullname, String dob, String gender, int locationID, String phone, String contact, int educationID, String school, String experience, String education, String location, String time) {
        this. id =id;
        this.fullname = fullname;
        this.dob = dob;
        this.gender = gender;
        this.locationID = locationID;
        this.phone = phone;
        this.contact = contact;
        this.educationID = educationID;
        this.school = school;
        this.experience = experience;
        this.education = education;
        this.location = location;
        this.time= time;
    }
    // 
    public CV(int id,String fullname, String dob, String gender, int locationID, String phone, String contact, int educationID, String school, String experience, String education, String location) {
        this. id =id;
        this.fullname = fullname;
        this.dob = dob;
        this.gender = gender;
        this.locationID = locationID;
        this.phone = phone;
        this.contact = contact;
        this.educationID = educationID;
        this.school = school;
        this.experience = experience;
        this.education = education;
        this.location = location;
    }
    // khai báo dữ liệu cho cv

    public CV(int statusID, String status, int jobid, String jobName, String company, String email, String phonecompany) {
        this.statusID = statusID;
        this.status = status;
        this.jobid = jobid;
        this.company = company;
        this.email = email;
        this.jobName = jobName;
        this.phonecompany = phonecompany;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getLocationID() {
        return locationID;
    }

    public void setLocationID(int locationID) {
        this.locationID = locationID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getEducationID() {
        return educationID;
    }

    public void setEducationID(int educationID) {
        this.educationID = educationID;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getJobid() {
        return jobid;
    }

    public void setJobid(int jobid) {
        this.jobid = jobid;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonecompany() {
        return phonecompany;
    }

    public void setPhonecompany(String phonecompany) {
        this.phonecompany = phonecompany;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getJobusername() {
        return Jobusername;
    }

    public void setJobusername(String Jobusername) {
        this.Jobusername = Jobusername;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "CV{" + "id=" + id + ", username=" + username + ", fullname=" + fullname + ", dob=" + dob + ", gender=" + gender + ", locationID=" + locationID + ", location=" + location + ", phone=" + phone + ", contact=" + contact + ", educationID=" + educationID + ", education=" + education + ", school=" + school + ", experience=" + experience + ", image=" + image + ", statusID=" + statusID + ", status=" + status + ", jobid=" + jobid + ", company=" + company + ", jobName=" + jobName + ", email=" + email + ", phonecompany=" + phonecompany + ", Jobusername=" + Jobusername + '}';
    }

}
