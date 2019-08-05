// use builder pattern to construct a user object

public class User{
	private String firstName;
	private String lastName;
	private int age;
	private String address;
	private String phone;

	private User(UserBuilder builder){
		this.firstName = builder.firstName;
		this.lastName = builder.lastName;
		this.age = builder.age;
		this.address = builder.address;
		this.phone = builder.phone;
	}

	public String getFirstName(){
		return firstName;
	}

	public String getLastName(){
		return lastName;
	}

	public int getAge(){
		return age;
	}

	public String getAddress(){
		return address;
	}

	public String getPhone(){
		return phone;
	}

	public static class UserBuilder{
		private String firstName;
		private String lastName;
		private int age;
		private String address;
		private String phone;

		public UserBuilder setFirstName(String firstName){
			this.firstName = firstName;
			return this;
		}
			
		public UserBuilder setLastName(String lastName){
			this.lastName = lastName;
			return this;
		}

		public UserBuilder setAge(int age){
			this.age = age;
			return this;
		}

		public UserBuilder setAddress(String address){
			this.address = address;
			return this;
		}

		public UserBuilder setPhone(String phone){
			this.phone = phone;
			return this;
		}

		public User  build(){
			return new User(this);
		}
	}
}
