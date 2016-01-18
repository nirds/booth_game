# NIRDgossip

NIRDgossip is an interactive twitter game meant to help stimulate hype at conventions. The basic premise is that convention-goers stop by the NIRD booth at a con, sign up with their contact information, then they tweet @NIRDhosting with #conname and they're entered to win a prize. If they get someone to retweet them - their chances to win are increased greatly!

## Using NIRDgossip

### App Setup
After installing, you'll have a default admin account with the following credentials:

```
email:    admin@example.com
password: password
```

You should obviously change this. Creating new accounts is dissabled so that convention-goers can't get sneaky, so if you want to creat additional admin accounts, you'll need to ssh into your server and create them manually.

### Game Setup
When you first navigate to the app, all you will see is a welcom page that informs you that there is no game happening currently. There are no sign-in links so you will need to navigate to ```/admins/sign_in``` in order to get started.

After you sign in, you'll be returned to the home page where you can either start a new game or view all of the contact information you've collected so far. Click on the "start new game" button and fill in the twitter handle and the hastag you wish to use for the game. After submission you will find yourself on the game's page. I reccomend having this page open on another device at your booth so convention-goers can sign up while you engage them. If you do this, make sure you're not signed in on that device to prevent any mischif!

After creating the game - you'll want to list the prizes convention-goers could potentially win. Click on the "add a prize button" that with the bank of buttons at the bottom of the page. Fill in a url for an image of the prize as well as a short description. After submission you will be redirected back to the submission form to speed up the process of adding prizes. When you're finished, you can click "go to game" to return back to the game page or "view prizes" to see all of the prizes you've entered for this game.

### Running the game
Have convention-goers sign up for the game from either the root page or from the game page by clicking on the "join the game" button. They must fill out all required fields in order to participate. Once they've done this, they must tweet at the games chosen twitter handle and inclued the game's chosen hash tag within that tweet to be entered to win. If they get retweeted, their chances to win increase dramatically.

Periodically, an admin must click on the "update game" button to ping the twitter API and update scores. The limit on this (at the time of this README's writing) is 60 per minute).

At any point, an admin may select a winner out of the pool of contestants by clicking on the "draw a winner" button on the game's page. Doing so will display a contestant's name and twitter handle, as well as the prize that they have won. This removes the contestant from being in the running for future drawings and prevents the prize from being awarded again. If at any time you try to make a drawing when you don't have any potential winners or prizes, the game will inform you. I suggest not listing one of your prizes so it doesn't get awarded to a random winner but rather is awarded to the contestant with the most retweets.

To end a game an admin just needs to click on the "end game" button on the game's page.
