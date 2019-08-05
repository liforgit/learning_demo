// main function to execute process

public class Main{
	public static void main(String[] args){
		// create the first user which has phone
		User user1 = new User.UserBuilder()
			.setFirstName("li")
			.setLastName("ch")
			.setPhone("13558199694")
			.build();

		//create second user which has address
		User user2 = new User.UserBuilder()
			.setFirstName("huang")
			.setLastName("yang")
			.setAddress("chengdu")
			.build();

		//print the info of users in the command line
		System.out.println("user1 is-->" + user1.getFirstName() + " " + user1.getLastName() + "\n" 
				+ "user2 is-->" + user2.getFirstName() + " " + user2.getLastName() + "\n");
	}
}
