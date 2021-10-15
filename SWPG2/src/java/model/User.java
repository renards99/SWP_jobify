package model;

public class User {

    String username;
    String password;
    String email;
    String fullname;
    String dob;
    int gender;
    String address;
    String phone;
    String image;
    int roleID;
    int locationID;
    int majorID;

    String role;
    String location;
    String major;

    public User(String username, String password, String email, String fullname, String dob, int gender, String address, String phone, String image, int roleID, int locationID, int majorID, String role, String location, String major) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.phone = phone;
        this.image = image;
        this.roleID = roleID;
        this.locationID = locationID;
        this.majorID = majorID;
        this.role = role;
        this.location = location;
        this.major = major;
    }
    public User(String username, String password, String email, String fullname, String dob, int gender, String address, String phone, String image, int roleID, int locationID, int majorID) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.phone = phone;
        this.image = image;
        this.roleID = roleID;
        this.locationID = locationID;
        this.majorID = majorID;
    }
  
    // khai báo dữ liệu cho user
    public User(String username, String password, String email, int roleID) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.roleID= roleID;
    }
      public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

  
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getLocationID() {
        return locationID;
    }

    public void setLocationID(int locationID) {
        this.locationID = locationID;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public int getMajorID() {
        return majorID;
    }

    public void setMajorID(int majorID) {
        this.majorID = majorID;
    }

//   

    @Override
    public String toString() {
        return "User{" + "username=" + username + ", password=" + password + ", email=" + email + ", fullname=" + fullname + ", dob=" + dob + ", gender=" + gender + ", address=" + address + ", phone=" + phone + ", image=" + image + ", roleID=" + roleID + ", locationID=" + locationID + ", majorID=" + majorID + ", role=" + role + ", location=" + location + ", major=" + major + '}';
    }
}
