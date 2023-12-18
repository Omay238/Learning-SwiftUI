struct Story {
    struct Page {
        var text: String
        var choices: [(String, Int)]
    }
    
    var pages: [Page]
}

let story = Story(
    pages: [
        Story.Page(
            text: "{name}, you are a ranger at Yellowstone national park. Wednesday, June 8, 1949. You are getting ready to head back to the ranger station for the night. Shortly before you arrive, you hear some shouting. You can’t tell where it’s from, but it’s incredibly loud, so it must be somewhere nearby. The ranger station is in sight, so if the shouting was from someone in a dangerous situation, you could run away, but you’re paid not to do that.",
            choices: [
                ("Ignore it", 1),
                ("Search in a random direction", 2),
                ("Circle the area", 3)
            ]
        ),
        Story.Page(
            text: "You ignore the shouting, and head back to your ranger station. You question to yourself if that was the right choice, but after five minutes, it stops and you sit down in the station. You have a hobby of bird watching, part of why you came out for this job. You take out your notebook and binoculars, and look out the window. You immediately notice a murder of crows. They fly down to where you know a clearing to be. What they are doing, you aren’t sure. Looking around some more, you scream when you see a bloody, detached arm hanging off a tree. For a moment, you are stunned, but get your bearings and make your choice.",
            choices: [
                ("Leave the station, and investigate", 4),
                ("Hide in the station, and wait for whatever may have done that to leave", 5)
            ]
        ),
        Story.Page(
            text: "You decide to go east, or to your right. After five minutes, you see nothing of interest, with the shouting going down, then finally disappearing. It didn’t disappear gradually, as you would expect as you traveled away, but suddenly. Whatever was making the sound must have stopped. You head back to where you came from, and see a patch of trees that have been destroyed.",
            choices: [
                ("Investigate the broken trees", 4),
                ("Go to the ranger station", 5)
            ]
        ),
        Story.Page(
            text: "You head east, and go around in a circle, around two hundred feet in diameter. A bit under halfway around the circle, you reach a clearing with a corpse laying on the ground, with no trace of any footprints, even though it looks like some sort of an attack. You notice crows suddenly above your head, seemingly attracted by the body.",
            choices: [
                ("Leave, and go to the ranger station", 5),
                ("Investigate more", 4)
            ]
        ),
        Story.Page(
            text: "Looking around in the clearing, you see blood seemingly everywhere. In the middle, there is a man, likely in his mid 20s. Seeing a bloody, dead body is making you uncomfortable, so you head back to the ranger station, which is really your only safe haven in the case that there is something killing people.",
            choices: [
                ("Get a weapon. It might take some extra time outside, but it would help.", 6),
                ("Go straight to the ranger station.", 5)
            ]
        ),
        Story.Page(
            text: "In the ranger station, you try to find a good place to hide. You are worried whatever did that would still be out there. You see a couple of good hiding places, and you want to get somewhere fast. You could head out and get a weapon, although you aren’t sure if that’s a good idea with this creature around...",
            choices: [
                ("Get a weapon from outside", 6),
                ("Hide in the bathroom", 7),
                ("Hide under the bed", 8),
                ("Hide in the closet", 9)
            ]
        ),
        Story.Page(
            text: "You go to the weapon lockup just outside the ranger station. Opening it, you see two guns. One Colt 1911 pistol, and an M1903 Springfield rifle. The pistol would shoot faster, but do less damage, while the rifle would do much more damage, and take a couple seconds to reload. Depending on what the thing is, either one would be good.",
            choices: [
                ("Grab the pistol", 13),
                ("Grab the rifle", 14)
            ]
        ),
        Story.Page(
            text: "You go into the bathroom, and hide on the ground behind the shower curtains. Hopefully the creature doesn’t look here, although this might not be the greatest hiding option. You don’t feel comfortable leaving, so you have to stay here and pray. You hear a noise at the door, a strong scratching sound, alongside heavy breathing, somehow audible from inside the bathroom.",
            choices: [
                ("Continue", 10)
            ]
        ),
        Story.Page(
            text: "You hide under the bed. It’s classic, but a goodie. If this was a human, this would be stupid, but theres no chance something that powerful and violent would actually be one, although it must be something intelligent, because how else would it know you were here? You are panicked, as you hear the door fracture, and a creature moving in, breathing heavily.",
            choices: [
                ("Continue", 11)
            ]
        ),
        Story.Page(
            text: "You hide in the closet. It seems like the best option, because it’s in the back of the station, in a place that even you forget about sometimes. You go into the closet, and just as you close the door, you hear the door smash, with a large sounding being breathing heavily. You struggle not to shout from shock.",
            choices: [
                ("Continue", 12)
            ]
        ),
        Story.Page(
            text: "The door of the station caves in, and the creature runs in, finding you immediately after seeing your outline through the curtains. In your last moments, you realize that you forgot to close the restroom door in your panic. You look up, and see a tall, pale, humanoid figure staring at you, before it crushes your skull into dust.",
            choices: [
                ("Ending One", 15)
            ]
        ),
        Story.Page(
            text: "The monster moves in, and doesn’t see you for a moment, but it notices a faint motion from under the bed. It knocks it aside with a swift, strong motion, revealing you. You shout in pain from getting hit with the bed, but it’s cut off early with a large blow to the back of your head, and you instantly perish.",
            choices: [
                ("Ending One", 15)
            ]
        ),
        Story.Page(
            text: "The creature looks around in the station. It checks the bathroom, the bed, the desk, and goes into the room where you are hiding. It waits there, looking for a sign of someone. The creature is a tall pale humanoid, with distorted facial features. You manage to stifle a gasp from the shock of seeing something like this. Fortunately, it doesn’t notice, and leaves. You take a deep breath, slowly, making sure to stay quiet in the case that you are in earshot of the creature. You wait for what feels like years, but in reality is likely mere hours.",
            choices: [
                ("Continue", 16)
            ]
        ),
        Story.Page(
            text: "You grab the pistol from the lock box, then hear a sound from the other side of the station. You quickly load the gun, only taking a couple seconds. The creature hears you, and goes around the station. You watch the creature, and once it’s around, you start unloading on it. The gun is too weak, and just infuriates it. It goes faster, and knocks the gun out of your hand, before pinning you down and slowly beating you to death. It really is clever, getting angry and making you suffer before you die.",
            choices: [
                ("Ending 3", 17)
            ]
        ),
        Story.Page(
            text: "You grab the rifle, which will hopefully be strong enough to take it down. You start loading the gun, when you hear the creature on the other side. It hears you, and you are now on a clock. You load faster, and get the gun cocked and ready. As it turns the corner, you fire, hitting it accurately enough to make it recoil in pain. This gives you time to reload, and you fire again, making it recoil once more. With a final shot, it seems to be down. Regardless of how it seems, you make sure it’s dead by putting the last two bullets in its head.",
            choices: [
                ("Ending 4", 18)
            ]
        ),
        Story.Page(
            text: "Ending 1\n\nYou are killed by the creature. The next day, when you aren’t responding to any radio messages, they send out somebody to find you. They find your body in the shelter, marred by the creature. They don’t know what has happened, but they send out a team to solve the mystery.",
            choices: [
                ("Restart", 0)
            ]
        ),
        Story.Page(
            text: "Ending 2\n\nYou manage to hide from the monster, and as soon as it’s gone, you radio higher authorities, although they don’t believe you. It is now your life’s goal to kill the creature, and you will not rest until it is done.",
            choices: [
                ("Restart", 0)
            ]
        ),
        Story.Page(
            text: "Ending 3\n\nYou attacked the creature, and it was certainly wounded, but it still won the battle. The next day, when you aren’t responding to any radio messages, they send out somebody to get direct contact with you. When they find your mutilated body by the weapon lockup, they send out a team to try to solve the mystery of what happened to you.",
            choices: [
                ("Restart", 0)
            ]
        ),
        Story.Page(
            text: "Ending 4\n\nYou managed to kill the creature with the rifle, and it died. You contact authorities, and they send scientists to examine the body of the creature. They confirm that this is a supernatural creature of some sort, as nothing could ever realistically be like it. You are given a medal for its discovery, although you aren’t famous for it, rather the scientists who research it are.",
            choices: [
                ("Restart", 0)
            ]
        )
    ]
)
