% V4 - story mode!

clearvars
clc
%%
%Starter Pokemon data
Charmander = struct('Name','Charmander','HP',25,'Attack',15,'Defense',13,'Type',2,'Move1','Tackle','Move2',[],'Level',5);
Squirtle = struct('Name','Squirtle','HP',25,'Attack',15,'Defense',13,'Type',3,'Move1','Tackle','Move2',[],'Level',5);
Bulbasaur = struct('Name','Bulbasaur','HP',25,'Attack',15,'Defense',13,'Type',4,'Move1','Tackle','Move2',[],'Level',5);

%Route 201 Wild Pokemon
Bidoof = struct('Name','Bidoof','HP',20,'Attack',10,'Defense',10,'Type',1,'Move1','Tackle','Move2',[],'Level',3);
Starly = struct('Name','Starly','HP',20,'Attack',10,'Defense',10,'Type',1,'Move1','Peck','Move2',[],'Level',3);

%Route 202 Trainer Pokemon
Buizel = struct('Name','Buizel','HP',25,'Attack',12,'Defense',12,'Type',3,'Move1','Water Gun','Move2','Tackle','Level',5);
Roselia = struct('Name','Roselia','HP',25,'Attack',12,'Defense',12,'Type',4,'Move1','Mega Drain','Move2','Tackle','Level',5);
Ponyta = struct('Name','Ponyta','HP',25,'Attack',12,'Defense',12,'Type',2,'Move1','Ember','Move2','Tackle','Level',5);

%Friend's Pokemon
CharmanderFriend = struct('Name','Charmander','HP',25,'Attack',11,'Defense',11,'Type',2,'Move1','Tackle','Move2','Ember','Level',5);
SquirtleFriend = struct('Name','Squirtle','HP',25,'Attack',11,'Defense',11,'Type',3,'Move1','Tackle','Move2','Water Gun','Level',5);
BulbasaurFriend = struct('Name','Bulbasaur','HP',25,'Attack',11,'Defense',11,'Type',4,'Move1','Tackle','Move2','Mega Drain','Level',5);
%%
%Moves
Tackle = struct('Name','Tackle','Type',1,'Damage',30);
Peck = struct('Name','Peck','Type',1,'Damage',35);
Ember = struct('Name','Ember','Type',2,'Damage',40);
WaterGun = struct('Name','Water Gun','Type',3,'Damage',40);
MegaDrain = struct('Name','Mega Drain','Type',4,'Damage',40);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%introduction to the game%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Welcome to MATLABMon, a condensed version of the popular video game franchise "Pokemon"!\n')
pause(6)
fprintf('\n')
fprintf('The premise of this game is that you live in a world inhabited by creatures known as Pokemon.\n')
pause(6)
fprintf('Humans live in harmony with these creatures, and they come in all shapes and sizes.\n')
pause(6)
fprintf('Many people own Pokemon and battle with them against other Pokemon to deepen their friendship.\n')
pause(6)
fprintf('These people are called Pokemon trainers, and many compete to become the strongest trainer in their region.\n')
pause(6)
fprintf('\n')
% enter player name, prevents empty inputs
while 1
    PlayerName = input('Please enter your name: ','s');
    fprintf('\n')
    if ~isempty(PlayerName)
        break
    end
end
pause(3)

fprintf('And that boy who lives next door, your new friend...')
pause(2)
fprintf(' What was his name again?\n')
pause(2)

% enter friend name, prevents empty inputs
while 1
    FriendName = input('Enter the name of your friend: ','s');
    fprintf('\n')
    if ~isempty(FriendName)
        break
    end
end

pause(2)
fprintf('Ah, yes! His name is %s!\n',FriendName) 
fprintf('\n') 
pause(4)

fprintf('OK %s, ',PlayerName) 
pause(2) 
fprintf('you''re ready to begin!\n')
pause(3)
fprintf('The world of Pokemon awaits you')
pause(1)
fprintf('.')
pause(1)
fprintf('.')
pause(1)
fprintf('.')
pause(1)
fprintf('\n')
pause(4)
%%%%%%%%%%%%%%%%%%%%%%%%end of game introduction%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc

%%%%%%%%%%%%%%%%%%%%%%%%morning dialogue%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:3
    fprintf('.')
    pause(1.5)
end
fprintf('!!!\n')
pause(3)
fprintf('(You wake up to the sound of Mom calling from downstairs.)\n')
pause(4)
fprintf('\n')
fprintf('Mom: %s? Come downstairs, breakfast is ready!\n',PlayerName)
pause(4)
fprintf('\n')
fprintf('(You head downstairs and begin eating breakfast.)\n')
pause(4)
fprintf('\n')
fprintf('Mom: How do you like it here in Twinleaf Town?\n') 
fprintf(' All of our neighbours have been so friendly and welcoming!\n')
pause(7)
fprintf('\n')
fprintf('Mom: Oh, that reminds me, Dr. Rowan swung by earlier.\n')
pause(4)
fprintf('Mom: He asked if you could come visit his laboratory later. I think it''s\n')
fprintf('about that summer internship he was talking about the other day.\n')
pause(9)
fprintf('\n')
fprintf('(After finishing breakfast, you get changed and head over to \n')
fprintf('Dr. Rowan''s laboratory a few blocks away from home.)\n')
pause(7)
fprintf('\n')

while 1
    progress0 = input('Enter 1 to head to Dr. Rowan''s lab: ');
    while isempty(progress0)
        progress0 = input('Enter 1 to head to Dr. Rowan''s Lab: ');
    end
    
    switch progress0
        case 1
            break
        otherwise
            progress0 = input('Enter 1 to head to Dr. Rowan''s Lab: ');
    end %ends switch for progress0
end %ends while for progression pause
%%%%%%%%%%%%%%%%%%%%end of morning dialogue%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc

%%%%%%%%%%%%%%%%%%%%%choosing a starter intro%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('(You enter the laboratory.)\n')
pause(4)
fprintf('Dr. Rowan: %s! It''s good to see you.\n',PlayerName)
pause(4)
fprintf(' I hope you''ve adjusted well to your new home.\n')
pause(4)
fprintf('\n')
fprintf('Dr. Rowan: You said you were interested in the summer internship,\n')
fprintf(' right? Splendid! Let''s get you started.\n')
pause(7)
fprintf('\n')
fprintf('Dr. Rowan: As you already know, many kinds of Pokemon inhabit\n')
fprintf(' our region. There is still so much to learn about their characteristics\n')
fprintf(' and behaviours.\n')
pause(10)
fprintf('\n')
fprintf('Dr. Rowan: This is where you come in. I want you to help me with my\n')
fprintf(' research by gathering information on the regional Pokemon.\n')
pause(10)
fprintf('\n')
fprintf('Dr. Rowan: I''ve created this nifty device that will help you with\n')
fprintf(' your task. It''s called a Pokedex!\n')
pause(8)

clc %text clearing

fprintf('(You obtained a Pokedex!)\n')
pause(4)
fprintf('\n')
fprintf('Dr. Rowan: That Pokedex there records data automatically through\n')
fprintf(' battle with other Pokemon.\n')
pause(7)
fprintf('\n')
fprintf('Dr. Rowan: Speaking of which, you don''t have a Pokemon yet, do you?\n')
pause(4)
fprintf(' Hm....\n')
pause(4)
fprintf('\n')
fprintf('Dr. Rowan: Oh, I know! How about I give you a Pokemon! I happen\n')
fprintf(' to have some here in the laboratory.\n')
pause(9)
fprintf('\n')
fprintf('Dr. Rowan: Think of this as a welcoming gift!\n')
pause(5)
%%%%%%%%%%%%%%%end of choosing a starter intro%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc %text clearing

%%%%%%%%%%%%%%%%%%%%actually choosing a starter%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Dr. Rowan: I have three Pokemon to choose from: Bulbasaur, Squirtle, and Charmander.\n')
pause(5)
fprintf('\n')

%info on each Pokemon
fprintf('Dr. Rowan: Would you like to learn about them? I''ll gladly tell you more\n')
fprintf(' about each Pokemon.\n')
pause(6)
fprintf('\n')

fprintf('(Select a number to learn more about each Pokemon.)\n')
while 1
    fprintf('1. Charmander   2. Squirtle   3. Bulbasaur    4. No more info needed\n')
    starterInfo = input('Selection: ');
    
    %makes sure the selection isn't empty
    while isempty(starterInfo)
        fprintf('\n')
        starterInfo = input('Selection: ');
    end
    
    %switch case printing each starter's info
    switch starterInfo
        case 1
            pause(2)
            clc
            fprintf('Dr. Rowan: Charmander is a fire-type Pokemon, meaning it\n')
            fprintf(' is weak to water-type Pokemon, and its fire-type moves are strong against\n')
            fprintf(' grass-type Pokemon.\n')
            fprintf('\n')
        case 2
            pause(2)
            clc
            fprintf('Dr. Rowan: Squirtle is a water-type Pokemon, meaning it\n')
            fprintf(' is weak to grass-type Pokemon, and its water-type moves are strong against\n')
            fprintf(' fire-type Pokemon.\n')
            fprintf('\n')
        case 3
            pause(2)
            clc
            fprintf('Dr. Rowan: Bulbasaur is a grass-type Pokemon, meaning it\n')
            fprintf(' is weak to fire-type Pokemon, and its grass-type moves are strong against\n')
            fprintf(' water-type Pokemon.\n')
            fprintf('\n')
        case 4
            break
        otherwise
            fprintf('\n')
            fprintf('(Please enter a valid number.)\n')
            pause(2)
    end %ends switch
end %ends while for starter info

clc 

fprintf('Dr. Rowan: Alright, which Pokemon will you choose?\n')
pause(3)
fprintf('\n')

fprintf('(Enter a number to choose your Pokemon.)\n')
while 1
    fprintf('1. Charmander   2. Squirtle   3. Bulbasaur\n')
    starterSelect = input('Selection: ');

    %makes sure the selection isn't empty
    while isempty(starterSelect)
        fprintf('\n')
        starterSelect = input('Selection: ');
    end
    
    %switch case for choosing the Pokemon
    switch starterSelect
        case 1
            self = Charmander;
            pause(2)
            clc
            fprintf('(You chose Charmander as your partner Pokemon!)\n')
            pause(3)
            break
        case 2
            self = Squirtle;
            pause(2)
            clc
            fprintf('(You chose Squirtle as your partner Pokemon!)\n')
            pause(3)
            break
        case 3
            self = Bulbasaur;
            pause(2)
            clc
            fprintf('(You chose Bulbasaur as your partner Pokemon!)\n')
            pause(3)
            break
        otherwise
            fprintf('\n')
            fprintf('(Please enter a valid number.)\n')
            pause(2)
    end %ends switch for starterSelect
end %ends while for choosing a starter

fprintf('Dr. Rowan: A wonderful choice! It looks like your %s likes you already.\n',self.Name)
pause(5)
%%%%%%%%%%%%%%%%%%%%%%end of actually choosing starter%%%%%%%%%%%%%%%%%%%%%
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%last lab dialogue%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('\n')
fprintf('Dr. Rowan: Now, like I mentioned earlier, the Pokedex gathers information through battle\n')
fprintf(' with other Pokemon. Together with your %s, I want you to battle as many Pokemon as you\n',self.Name)
fprintf(' can! There are many wild Pokemon and Pokemon trainers around.\n')
pause(10)
fprintf('\n')
fprintf('Dr. Rowan: Since this is your first experience with battling, I''ll explain how it works.\n')
pause(6)

clc
%explanation of battle
fprintf('Dr. Rowan: When you enter battle, simply select one of your Pokemon''s available moves.\n')
pause(6)
fprintf(' There is a random chance for either you or your opponent to attack first.\n')
pause(6)
fprintf(' Whichever Pokemon did not go first will then act after their opponent as taken their turn.\n')
pause(6)
fprintf(' The goal is to bring your opponent Pokemon''s HP, or health points, down to zero.\n')
pause(6)
fprintf(' The first to bring their opponent''s HP to zero wins!\n')
pause(7)

clc

fprintf('Dr. Rowan: Now, for your first task. I have an acquaintance named Mr. Pokemon who\n')
fprintf(' lives in the nearby Jubilife City. He has a penchant for rare, Pokemon-related items\n')
fprintf(' and he called me earlier today saying that he''s found something quite fascinating.\n')
pause(10)
fprintf('\n')
fprintf('Dr. Rowan: I''d like you to go and pick it up for me. Follow the signs to Sandgem Town,\n')
fprintf(' which you can reach by travelling along Route 201. From there, take Route 202 to\n')
fprintf(' Jubilife City. You''ll recognize Mr. Pokemon''s house right away; it is quite...\n')
fprintf(' eccentric, to say the least.\n')
pause(11)
fprintf('\n')

fprintf('Dr. Rowan: There are many wild Pokemon and Pokemon trainers along the way,\n')
fprintf(' so you''ll get plenty of chances to bond with your %s through battle! The best part\n',self.Name)
fprintf(' is that your Pokedex will automatically record data for me, so battle to your heart''s content!\n')
pause(11)
fprintf('\n')

fprintf('Dr. Rowan: If your Pokemon''s HP ever reaches zero, make sure you head\n')
fprintf(' to the nearest Pokemon Center. There they can restore your Pokemon to full health.\n')
pause(9)
fprintf('\n')

fprintf('Dr. Rowan: Before you go, here are some Potions. These restore your Pokemon''s\n')
fprintf(' HP, so you should use them in between battles.\n')
pause(7)
fprintf('\n')

fprintf('(You received Potions from Dr. Rowan!)\n')
pause(5)
fprintf('\n')

% player enters 1 to progress the story. This is so they can move on once
% they've had enough time to read Dr. Rowan's text
while 1
    progress1 = input('Enter 1 to head to Route 201: ');
    while isempty(progress1)
        progress1 = input('Enter 1 to head to Route 201: ');
    end
    
    switch progress1
        case 1
            break
        otherwise
            progress1 = input('Enter 1 to head to Route 201: ');
    end %ends switch for progress1
end %ends while for progression pause

%%%%%%%%%%%%%%%%%%%%%%%%%%end of last lab dialogue%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%route 201%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('(You head to Route 201.)\n')
pause(3)
fprintf('\n')

fprintf('(A seemingly endless path full of tall grass lies ahead...)\n')
pause(5)
fprintf('\n')

while 1
    progress2 = input('Enter 1 to walk through the tall grass: ');
    while isempty(progress2)
        progress2 = input('Enter 1 to walk through the tall grass: ');
    end
    
    switch progress2
        case 1
            break
        otherwise
            progress2 = input('Enter 1 to walk through the tall grass: ');
    end %ends switch for progress2
end %ends while for progression pause

%randomly generates a wild pokemon
chooseWildPkmn = randi([0,1],1);
switch chooseWildPkmn
    case 1
        enemy = Bidoof;
    case 0
        enemy = Starly;
end

%first of 2 wild battles
RematchTracker = battle(self,enemy,1);
while RematchTracker == 2 %you lost to the wild Pokemon
    RematchTracker = battle(self,enemy,4);
end

pause(3)
fprintf('(Your first victory! How exciting!)\n')
pause(4)
fprintf('(You use a Potion on %s to restore their HP.)\n',self.Name)
pause(4)
fprintf('\n')

fprintf('(There is more tall grass ahead, but you spot some buildings in the distance.)\n')
pause(3)
fprintf('(You''re almost at Sandgem Town!)\n')
pause(3)
fprintf('\n')

while 1 %progress pause
    progress3 = input('Enter 1 to continue through the tall grass: ');
    while isempty(progress3)
        progress3 = input('Enter 1 to continue through the tall grass: ');
    end
    
    switch progress3
        case 1
            break
        otherwise
            progress3 = input('Enter 1 to continue through the tall grass: ');
    end %ends switch for progress2
end %ends while for progression pause

%randomly generates a wild pokemon
chooseWildPkmn = randi([0,1],1);
switch chooseWildPkmn
    case 1
        enemy = Bidoof;
    case 0
        enemy = Starly;
end

%second of 2 battles 
RematchTracker = battle(self,enemy,1);
while RematchTracker == 2 %you lost to the wild Pokemon
    RematchTracker = battle(self,enemy,4);
end
pause(5)
%%%%%%%%%%%%%%%%%%%%%%%%%%end of route 201%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%levelling up%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
self.HP = 28;
self.Attack = 16;
self.Defense = 14;
self.Level = 6;
clc
fprintf('(Your %s grew stronger from battling!)\n',self.Name)
pause(3.5)
fprintf('\n')

%learning new move
if isequal(self.Name,'Charmander')
    self.Move2 = 'Ember';
    fprintf('(%s learned the move %s!)\n',self.Name,self.Move2)
    pause(3.5)
    fprintf('\n')
    fprintf('(You check your Pokedex.)\n')
    pause(3.5)
    fprintf('"%s is a move that matches the type of %s, which means it deals extra damage in battle."\n',self.Move2,self.Name)
    pause(3.5)
    fprintf('"Since it is also a fire-type move, it deals extra damage against grass-type Pokemon."\n')
    pause(3.5)
    fprintf('"However, it deals less damage against water-type Pokemon."\n')
    pause(3.5)
elseif isequal(self.Name,'Squirtle')
    self.Move2 = 'Water Gun';
    fprintf('(%s learned the move %s!)\n',self.Name,self.Move2)
    pause(3.5)
    fprintf('\n')
    fprintf('(You check your Pokedex.)\n')
    pause(3.5)
    fprintf('"%s is a move that matches the type of %s, which means it deals extra damage in battle."\n',self.Move2,self.Name)
    pause(3.5)
    fprintf('"Since it is also a water-type move, it deals extra damage against fire-type Pokemon."\n')
    pause(3.5)
    fprintf('"However, it deals less damage against grass-type Pokemon."\n')
    pause(3.5)
elseif isequal(self.Name,'Bulbasaur')
    self.Move2 = 'Mega Drain';
    fprintf('(%s learned the move %s!)\n',self.Name,self.Move2)
    pause(3.5)
    fprintf('\n')
    fprintf('(You check your Pokedex.)\n')
    pause(3.5)
    fprintf('"%s is a move that matches the type of %s, which means it deals extra damage in battle."\n',self.Move2,self.Name)
    pause(3.5)
    fprintf('"Since it is also a grass-type move, it deals extra damage against water-type Pokemon."\n')
    pause(3.5)
    fprintf('"However, it deals less damage against fire-type Pokemon."\n')
    pause(8)
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%end levelling up%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Sandgem town%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('(You arrive at Sandgem town and head to the Pokemon Center to heal your %s.)\n',self.Name)
pause(4)
fprintf('(Someone taps you on the shoulder. You turn around.)\n')
pause(4)
fprintf('\n')

fprintf('%s: Hey %s! What are you doing here in Sandgem Town?\n',FriendName, PlayerName)
pause(3)
fprintf('%s: ...\n',FriendName)
pause(3)
fprintf('%s: What''s with the blank stare? Don''t tell me you forgot who I am already!\n',FriendName)
pause(5)

fprintf('%s: I''m %s, remember? I live next door and we met the day you moved in!\n',FriendName,FriendName)
pause(5)
fprintf('%s: Oh, is that a Pokedex? So you''re helping with Dr. Rowan''s research as well?\n',FriendName)
pause(5)
fprintf('%s: That''s awesome! If you need any help, don''t be afraid to ask me.\n',FriendName)
pause(4)
fprintf('%s: I got a bit of a head start on you, so I have more experience with battling.\n',FriendName)
pause(4)
fprintf('%s: Anyways, I gotta go now, so I''ll see you around! Take care, %s!\n',FriendName,PlayerName)
pause(4)
fprintf('\n')

fprintf('(Your %s is now fully healed.)\n',self.Name)
pause(3)
while 1 %progress pause
    progress4 = input('Enter 1 to head to Route 202: ');
    while isempty(progress4)
        progress4 = input('Enter 1 to head to Route 202: ');
    end
    
    switch progress4
        case 1
            break
        otherwise
            progress4 = input('Enter 1 to head to Route 202: ');
    end %ends switch for progress4
end %ends while for progression pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%end of Sandgem Town%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Route 202%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('(You head to Route 202.)\n')
pause(4)
fprintf('\n')
fprintf('(There isn''t as much tall grass, but there are lots of people around...)\n')
pause(4)
fprintf('\n')

%first trainer battle, weak to your type
fprintf('(A stranger around your age meets your eyes and approaches you.)\n')
pause(4)
fprintf('\n')

fprintf('Marianne: Hey! Let''s battle!\n')
pause(4)
if isequal(self.Name,'Charmander')
    enemy = Roselia;
    fprintf('Marianne: My grass-type Roselia can''t be beat!\n')
    pause(5)
elseif isequal(self.Name,'Squirtle')
    enemy = Ponyta;
    fprintf('Marianne: My fire-type Ponyta can''t be beat!\n')
    pause(5)
elseif isequal(self.Name,'Bulbasaur')
    enemy = Buizel;
    fprintf('Marianne: My water-type Buizel can''t be beat!\n')
    pause(5)
end

RematchTracker = battle(self,enemy,2);
while RematchTracker == 1
    RematchTracker = battle(self,enemy,3);
end
pause(5)
fprintf('Marianne: Aww, I lost! That was fun though. Let''s battle another time!\n')
pause(5)
fprintf('\n')

fprintf('(You use a Potion on %s to restore their HP.)\n',self.Name)
pause(5)
fprintf('\n')

fprintf('(It looks like you''re almost at Jubilife City.)\n')
pause(4)
fprintf('\n')

while 1
    progress5 = input('Enter 1 to continue: ');
    while isempty(progress5)
        progress5 = input('Enter 1 to continue: ');
    end
    
    switch progress5
        case 1
            break
        otherwise
            progress5 = input('Enter 1 to continue: ');
    end %ends switch for progress5
end %ends while for progression pause
clc
%second trainer, same type as you
fprintf('(Another stranger approaches you.)\n')
pause(4)
fprintf('\n')

fprintf('Joey: Hey, let''s battle!\n')
pause(4)
if isequal(self.Name,'Charmander')
    enemy = Ponyta;
    fprintf('Joey: Oh? It seems our Pokemon are the same type. But my Ponyta is the best around!\n')
    pause(5)
elseif isequal(self.Name,'Squirtle')
    enemy = Buizel;
    fprintf('Joey: Oh? It seems our Pokemon are the same type. But my Buizel is the best around!\n')
    pause(5)
elseif isequal(self.Name,'Bulbasaur')
    enemy = Roselia;
    fprintf('Joey: Oh? It seems our Pokemon are the same type. But my Roselia is the best around!\n')
    pause(5)
end

RematchTracker = battle(self,enemy,2);
while RematchTracker == 1
    RematchTracker = battle(self,enemy,3);
end
pause(3)
fprintf('Joey: Whaaat? My %s lost? Aww...\n',enemy.Name)
pause(6)
fprintf('\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%end of route 202%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%levelling up again%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
self.HP = 30;
self.Attack = 17;
self.Defense = 15;
self.Level = 7;
clc
fprintf('(Your %s grew stronger from battling!)\n',self.Name)
pause(5)
fprintf('\n')
%%%%%%%%%%%%%%%%%%%%%%%%%end of levelling up again%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%jubilife city%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('(You finally arrive at Jubilife City.)\n')
pause(4)
fprintf('(An odd-looking house catches your eye. You head over and knock on the door.)\n')
pause(4)
fprintf('(An old man opens the door.)\n')
pause(3)
fprintf('\n')

fprintf('Mr. Pokemon: Hello! You must be %s, correct?\n',PlayerName)
pause(4)
fprintf('Mr. Pokemon: I am Mr. Pokemon, an old friend of Dr. Rowan.\n')
pause(4)
fprintf('\n')

fprintf('Mr. Pokemon: I like to research odd Pokemon-related artifacts and objects.\n')
pause(4)
fprintf('Mr. Pokemon: A few days ago, I found something quite peculiar! As you know, most Pokemon\n')
fprintf(' come from eggs. Well, I came across an egg with an odd pattern on it.\n')
pause(8)
fprintf('Mr. Pokemon: In all my years of research, I have never seen something quite like it before!\n')
pause(6)
fprintf('Mr. Pokemon: I want Dr. Rowan to help me examine it. Please be careful while you bring this\n')
fprintf(' back to the lab. Thank you!\n')
pause(8)
fprintf('\n')

fprintf('(You accepted the mysterious Pokemon egg from Mr. Pokemon!)\n')
pause(5)
fprintf('(You say good-bye and begin heading back to Twinleaf Town after resting at the Pokemon Center.)\n')
pause(6)

while 1
    progress6 = input('Enter 1 to continue: ');
    while isempty(progress6)
        progress6 = input('Enter 1 to continue: ');
    end
    
    switch progress6
        case 1
            break
        otherwise
            progress6 = input('Enter 1 to continue: ');
    end %ends switch for progress6
end %ends while for progression pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%end of jubilife city%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%rival battle%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('(Before you can leave Jubilife City, you see %s and approach him.)\n',FriendName)
pause(4)
fprintf('\n')

fprintf('%s: Oh, %s! I finished running my errands so I''m here training my Pokemon.\n',FriendName,PlayerName)
pause(5)
fprintf('%s: Are you heading back to the lab? Dr. Rowan told me about your task.\n',FriendName)
pause(5)
fprintf('%s: You must have battled lots of Pokemon along the way, right?\n',FriendName)
pause(5)
fprintf('%s: How about we do a quick battle? Your Pokemon must be nice and strong by now.\n',FriendName)
pause(5)
fprintf('\n')

if isequal(self.Name,'Charmander')
    enemy = SquirtleFriend;
    fprintf('%s: My water-type Squirtle has a type-advantage over your Pokemon, so this''ll be interesting!\n',FriendName)
    pause(6)
elseif isequal(self.Name,'Squirtle')
    enemy = BulbasaurFriend;
    fprintf('%s: My grass-type Bulbasaur has a type-advantage over your Pokemon, so this''ll be interesting!\n',FriendName)
    pause(6)
elseif isequal(self.Name,'Bulbasaur')
    enemy = CharmanderFriend;
    fprintf('%s: My fire-type Charmander has a type-advantage over your Pokemon, so this''ll be interesting!\n',FriendName)
    pause(6)
end

RematchTracker = battle(self,enemy,2);
while RematchTracker == 1
    RematchTracker = battle(self,enemy,3);
end
pause(3)

fprintf('%s: Wow, %s! You''ve become really good at battling! That was a fun battle.\n',FriendName,PlayerName)
pause(5)
fprintf('%s: Let''s head back home together. I''ll drop you off at the lab.\n',FriendName)
pause(6)

while 1
    progress7 = input('Enter 1 to head back to Twinleaf Town: ');
    while isempty(progress7)
        progress7 = input('Enter 1 to head back to Twinleaf Town: ');
    end
    
    switch progress7
        case 1
            break
        otherwise
            progress7 = input('Enter 1 to head back to Twinleaf Town: ');
    end %ends switch for progress7
end %ends while for progression pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%end of rival battle%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%finale%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('(After battling, you and %s head to Twinleaf Town.)\n',FriendName)
pause(4)
fprintf('(You enter Dr. Rowan''s lab and give him the mysterious egg.)\n')
pause(4)
fprintf('\n')

fprintf('Dr. Rowan: Great work, %s. I knew I could count on you.\n',PlayerName)
pause(4)
fprintf('Dr Rowan: So Mr. Pokemon''s item was an egg, eh? He always was fascinated by them,\n')
fprintf(' but indeed, this one does look different from others we''ve seen before.\n')
pause(10)
fprintf('\n')

fprintf('Dr. Rowan: Well, I sure hope you were able to bond with your %s today! It seems your Pokemon\n',self.Name)
fprintf(' has warmed up to you quite a bit, even though you only met recently.\n')
pause(10)
fprintf('Dr. Rowan: I''m sure that by the end of this internship, you''ll be best friends. Of course,\n')
fprintf(' you may keep your %s after the internship is over. That is your welcoming gift, after all!\n',self.Name)
pause(10)
fprintf('\n')

fprintf('Dr. Rowan: I don''t have anything else for you to do today, so you should probably go\n')
fprintf(' home and rest after all that battling you''ve been doing. See you tomorrow!\n')
pause(10)
fprintf('\n')

fprintf('(You head home, exhausted after a long day...)\n')
%%
clc

%the end!
fprintf('THE END\n')
fprintf('Thank you for playing!\n')