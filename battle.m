function RematchTracker = battle(self,enemy,wildOrTrainer) 
% This function conducts the battle between the player and an enemy pokemon
% and adjusts the battle text depending on whether the battle is wild or
% not

% "self" and "enemy" are structures with the following fields:
% HP, Name, Attack, Defense, Type, Level, and Moves (up to two)

% Some text changes when RematchTracker = 1 or 2
% in the game script, it checks the value of RematchTracker
% so if you lose, you just get to battle again

% switch statement here for wild battle or trainer battle
switch wildOrTrainer
    case 1 % wild pokemon
        clc
        fprintf('A wild %s appeared!\n',enemy.Name)
        pause(1.5)
        fprintf('You sent out %s!\n',self.Name)
        pause(2)
    case 2 % trainer battle
        clc
        fprintf('You were challenged to a battle!\n')
        pause(1.5)
        fprintf('The opponent sent out %s!\n',enemy.Name)
        pause(1.5)
        fprintf('You sent out %s!\n',self.Name)
        pause(2)
    case 3 % trainer rematch
        clc
        fprintf('You challenged the opponent to a rematch after coming back from the Pokemon Center!\n')
        pause(4)
        fprintf('The opponent sent out %s!\n',enemy.Name)
        pause(1.5)
        fprintf('You sent out %s!\n',self.Name)
        pause(2)
    case 4 % wild pokemon rematch
        clc
        fprintf('You looked for the wild %s and battled it again!\n',enemy.Name)
        pause(4)
        fprintf('You sent out %s!\n',self.Name)
        pause(2)
end


while self.HP > 0 && enemy.HP > 0 % battle ends once either pokemon hits 0 HP
clc

% displays the current status of each pokemon at the start of each round
fprintf('%s''s HP: %d\n',self.Name,self.HP)
fprintf('%s''s HP: %d\n',enemy.Name,enemy.HP)
fprintf('\n')
pause(2)

% 0 or 1 is generated; if 1, then player moves first, if 0 then enemy first
turn = randi([0,1],1);

if turn == 1 % player gets to move first
    fprintf('It''s your turn!\n')
    fprintf('Select a move.\n')
    pause(1.5)
    printMoves(self) % prints moves that the player can use
    
    move = moveSelect(self); % checks if move input is valid; if it is, it's assigned to move
    enemy.HP = enemyDamage(move,self,enemy); % deals damage depending on which move was chosen
    
    if enemy.HP > 0 %prevents enemy from acting if they've already fainted
        enemyMove = enemyMoveSelect(enemy); % enemy randomly chooses a move
        self.HP = selfDamage(enemyMove,self,enemy); % deals damage to player's Pokemon depending on the enemy's move
    end
    
else % enemy gets to move first
    enemyMove = enemyMoveSelect(enemy);
    self.HP = selfDamage(enemyMove,self,enemy);
    
    if self.HP > 0 %prevents player from taking action if their Pokemon has already fainted
        fprintf('It''s your turn!\n')
        fprintf('Select a move.\n')
        pause(1.5)
        printMoves(self) 
        
        move = moveSelect(self); 
        enemy.HP = enemyDamage(move,self,enemy);
    end

end

end % end of while loop for both HP above 0

if (wildOrTrainer == 1 || wildOrTrainer == 4) && self.HP > 0
    clc
    fprintf('The wild %s fainted.\n',enemy.Name)
    fprintf('\n')
    pause(1.5)
    fprintf('You won!\n')
    fprintf('\n')
    RematchTracker = 0; % no need to rematch
elseif (wildOrTrainer == 2 || wildOrTrainer == 3) && self.HP > 0
    clc
    fprintf('The enemy %s fainted.\n',enemy.Name)
    fprintf('\n')
    pause(1.5)
    fprintf('You defeated the opponent Trainer!\n')
    fprintf('\n')
    RematchTracker = 0; % no need to rematch
elseif (wildOrTrainer == 2 || wildOrTrainer == 3) && self.HP < 0
    clc
    fprintf('Oh no! Your %s fainted!\n',self.Name)
    fprintf('\n')
    pause(1.5)
    fprintf('You ran to the nearest Pokemon Center...\n')
    pause(7)
    RematchTracker = 1; %You lost to the trainer and you get to rematch them next time
elseif (wildOrTrainer == 1 || wildOrTrainer == 4) && self.HP < 0
    clc
    fprintf('Oh no! Your %s fainted!\n',self.Name)
    fprintf('\n')
    pause(1.5)
    fprintf('You ran to the nearest Pokemon Center...\n') 
    pause(7)
    RematchTracker = 2; %You lost to the Pokemon and you look for them to get a rematch
end
    

end % overall battle function end


function printMoves(self)
% This function prints the moves that the player can use
fprintf('1. %s ',self.Move1)
if ~isequal([],self.Move2)
    fprintf('2. %s ',self.Move2)
end
fprintf('\n')
end %ends printMoves


function move = moveSelect(self)
% This function takes the user's input, checks if it's a valid move, then
% selects that move

move_check = 0; % initializing move_check; while it's 0, the player keeps being prompted to enter a valid move

while move_check == 0

move_select = input('Enter a number: ','s'); % the user enters a move number

% these lines allow characters without single quotes to be entered,
% preventing the red error message from appearing, but they'll be seen as
% invalid inputs 
move_select = move_select - '0';
move_select = sum(move_select); 

% checks if input was valid (i.e. a number between 1 and 4)
if isempty(move_select)
    fprintf('\n')
    fprintf('Invalid move.\n')
    fprintf('\n')
elseif (move_select == 2 && isequal([],self.Move2)) || ...
       (move_select == 3 && isequal([],self.Move3)) || ...
       (move_select == 4 && isequal([],self.Move4)) || ...
       (move_select >4 || move_select < 1)  
    fprintf('\n')
    fprintf('Invalid move.\n')
    fprintf('\n')
    move_check = 0;
elseif move_select <= 4 && move_select >= 1
    move_check = 1; 
end % ends if/elseif

end % ends while move_check == 0

switch move_select % assigns chose move to output "move"
    case 1
        move = self.Move1;
        
    case 2
        move = self.Move2;
       
    case 3
        move = self.Move3;
        
    case 4
        move = self.Move4;
        
end % ends switch


end % ends moveSelect function


function enemyMove = enemyMoveSelect(enemy)
%uses a random number generator to choose an enemy move

if isequal([],enemy.Move2)
    enemyMove = enemy.Move1;
elseif ~isequal([],enemy.Move2)
    randomMove = randi([1,2],1);
    switch randomMove
        case 1
            enemyMove = enemy.Move1;
        case 2
            enemyMove = enemy.Move2;
    end
end %ends if statement

end %ends enemyMoveSelect function


function newEnemyHP = enemyDamage(move,self,enemy)
% This function calculates the damage done to the enemy and then deals the damage

% the following calculates the damage based on the chosen move and type
% advantages
if isequal(move,'Tackle')
    Damage = round((((((((2*self.Level)/5)+2)*self.Attack*30)/enemy.Defense)/50)+2)*(randi([217,255],1))*(1/255));
    newEnemyHP = enemy.HP - Damage;
    fprintf('%s used Tackle!\n',self.Name)
    pause(1.5)
    fprintf('The enemy took %d damage!\n',Damage)
    fprintf('\n')
    pause(1.5)  
    
elseif isequal(move,'Ember')
    x = 2;
    %checks for type effectiveness
        if enemy.Type == 3
            y = 0.5;
        elseif enemy.Type == 4
            y = 2;
        elseif enemy.Type == 1 || enemy.Type == 2
            y = 1;
        end
    %calculates the damage
    Damage = round((((((((2*self.Level)/5)+2)*self.Attack*40)/enemy.Defense)/50)+2)*x*y*(randi([217,255],1))*(1/255));
    newEnemyHP = enemy.HP - Damage;
    fprintf('%s used Ember!\n',self.Name)
    pause(1.5)
    fprintf('The enemy took %d damage!\n',Damage)
    fprintf('\n')
    pause(1.5)  
    
elseif isequal(move,'Water Gun')
    x = 2;
    %checks for type effectiveness
        if enemy.Type == 4
            y = 0.5;
        elseif enemy.Type == 2
            y = 2;
        elseif enemy.Type == 3 || enemy.Type == 1
            y = 1;
        end
    %calculates the damage
    Damage = round((((((((2*self.Level)/5)+2)*self.Attack*40)/enemy.Defense)/50)+2)*x*y*(randi([217,255],1))*(1/255));
    newEnemyHP = enemy.HP - Damage;
    fprintf('%s used Water Gun!\n',self.Name)
    pause(1.5)
    fprintf('The enemy took %d damage!\n',Damage)
    fprintf('\n')
    pause(1.5)  
    
elseif isequal(move,'Mega Drain')
    x = 2;
    %checks for type effectiveness
        if enemy.Type == 2
            y = 0.5;
        elseif enemy.Type == 3
            y = 2;
        elseif enemy.Type == 1 || enemy.Type == 4
            y = 1;
        end
    %calculates the damage
    Damage = round((((((((2*self.Level)/5)+2)*self.Attack*40)/enemy.Defense)/50)+2)*x*y*(randi([217,255],1))*(1/255));
    newEnemyHP = enemy.HP - Damage;
    fprintf('%s used Mega Drain!\n',self.Name)
    pause(1.5)
    fprintf('The enemy took %d damage!\n',Damage)
    fprintf('\n')
    pause(1.5)  
end % ends the damage calculation for all the moves


end %ends the newEnemyHP function


function newSelfHP = selfDamage(enemyMove,self,enemy)
% calculates the damage done to the player by the enemy, then deals the
% damage

if isequal(enemyMove,'Tackle')
    if enemy.Type == 1
        x=1.5;
    else
        x=1;
    end
    Damage = round((((((((2*enemy.Level)/5)+2)*enemy.Attack*30)/self.Defense)/50)+2)*x*(randi([217,255],1))*(1/255));
    newSelfHP = self.HP - Damage;
    fprintf('%s used Tackle!\n',enemy.Name)
    pause(1.5)
    fprintf('Your %s took %d damage!\n',self.Name,Damage)
    fprintf('\n')
    pause(1.5)  
    
elseif isequal(enemyMove,'Peck')
    if enemy.Type == 1
        x=1.5;
    else
        x=1;
    end
    Damage = round((((((((2*enemy.Level)/5)+2)*enemy.Attack*35)/self.Defense)/50)+2)*x*(randi([217,255],1))*(1/255));
    newSelfHP = self.HP - Damage;
    fprintf('%s used Peck!\n',enemy.Name)
    pause(1.5)
    fprintf('Your %s took %d damage!\n',self.Name,Damage)
    fprintf('\n')
    pause(1.5)  
   
elseif isequal(enemyMove,'Ember')
    %checks for STAB
    if enemy.Type == 2
        x=1.5;
    else
        x=1;
    end
    
    %checks for type effectiveness
    if self.Type == 3
        y=0.5;
    elseif self.Type == 4
        y=2;
    elseif self.Type == 2
        y=1;
    end
    
    %calculates the damage
    Damage = round((((((((2*enemy.Level)/5)+2)*enemy.Attack*30)/self.Defense)/50)+2)*x*y*(randi([217,255],1))*(1/255));
    newSelfHP = self.HP - Damage;
    fprintf('%s used Ember!\n',enemy.Name)
    pause(1.5)
    fprintf('Your %s took %d damage!\n',self.Name,Damage)
    fprintf('\n')
    pause(1.5)
    
elseif isequal(enemyMove,'Water Gun')
    %checks for STAB
    if enemy.Type == 3
        x=1.5;
    else
        x=1;
    end
    
    %checks for type effectiveness
    if self.Type == 4
        y=0.5;
    elseif self.Type == 2
        y=2;
    elseif self.Type == 3
        y=1;
    end
    
    Damage = round((((((((2*enemy.Level)/5)+2)*enemy.Attack*30)/self.Defense)/50)+2)*x*y*(randi([217,255],1))*(1/255));
    newSelfHP = self.HP - Damage;
    fprintf('%s used Water Gun!\n',enemy.Name)
    pause(1.5)
    fprintf('Your %s took %d damage!\n',self.Name,Damage)
    fprintf('\n')
    pause(1.5)
    
elseif isequal(enemyMove,'Mega Drain')
    %checks for STAB
    if enemy.Type == 4
        x=1.5;
    else
        x=1;
    end
    
    %checks for type effectiveness
    if self.Type == 2
        y=0.5;
    elseif self.Type == 3
        y=2;
    elseif self.Type == 4
        y=1;
    end
    
    Damage = round((((((((2*enemy.Level)/5)+2)*enemy.Attack*30)/self.Defense)/50)+2)*x*y*(randi([217,255],1))*(1/255));
    newSelfHP = self.HP - Damage;
    fprintf('%s used Mega Drain!\n',enemy.Name)
    pause(1.5)
    fprintf('Your %s took %d damage!\n',self.Name,Damage)
    fprintf('\n')
    pause(1.5)

end %ends the damage calculation for all moves

end %ends selfDamage function

