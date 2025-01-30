# FetchTakeHomeProject

### Summary: Include screen shots or a video of your app highlighting its features
The app downloads rescipes and present them a list. Each recipe is shown along with a small image, its name, cuisine and source or youtube links if available. There is a reload button, on the top right used to refresh the data and use any new data if available.
![Image](https://github.com/user-attachments/assets/6abbc53c-606f-4497-8577-569017fdb298)

There is also larger view of the recipes, that displays a larger image, alongside the previous descriptions.
![Image](https://github.com/user-attachments/assets/b21abb8d-8923-47c3-89a0-b9825d466845)

Demo: 

https://github.com/user-attachments/assets/fdea7bd4-3aa8-4707-afa1-3ec267ea35dd

https://github.com/user-attachments/assets/0520aaba-56c3-4741-bbb9-2343e9948b4f

https://github.com/user-attachments/assets/ec6bdd58-1ab1-4303-8dad-a69fe6be2643

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I prioritized efficient image caching and view set up to limit bandwidth use. This was done by only downloading images when the recipe appeared on the screen, and also if they weren't already downloaded. I chose to focus on these areas because it improves the user's experience. Efficient downloads and views ensure they don't experience jitter, lag, or long loading screens. It all seem's real time, and the app won't ever clog up the phones memory further leading to unpleasant experiences. I also focused on the structure and architecture of the app (MVVM), as it is important to maintain clarity in order to make easier for someone else to pick up where I left off.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spend about 5 hours working on this project. I spend about 1.5 hours working with the api requests and image caching. I spent 1.5 hours creating unit tests, as well as testing my app. I spent another 2 hours setting up and testing all the views.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
I chose to use apples NSCache over developing it from scratch. I also decided to focus on the "backend" over the design of the views.

### Weakest Part of the Project: What do you think is the weakest part of your project?
I would definitely say the views needs some work, at the moment they are very basic only showing what is necessary. The app could really benefit form different layouts or added animations. I think they are weak because they are not appealing to the eye, I feel like they would struggle to potentially grasp users attention. 
