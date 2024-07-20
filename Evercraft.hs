import Control.Exception (SomeException)

type Undefined = SomeException

type Name = Undefined
type ArmorClass = Undefined
type HitPoints = Undefined
type AbilityScore = Undefined
type DamageDealt = Undefined
type Roll = Undefined
type ModifiedAttributes = Undefined
type Experience = Undefined
type Level = Undefined
type CharacterDead = Undefined
type UnsuccessfulAttack = Undefined
type SuccessfulAttack = Undefined

data Alignment = Good | Evil | Neutral

data Abilities = Abilities {
  strength :: AbilityScore,
  dexterity :: AbilityScore,
  constitution :: AbilityScore,
  wisdom :: AbilityScore,
  intelligence :: AbilityScore,
  charisma :: AbilityScore
}

data Character = Character {
  name :: Name,
  alignment :: Alignment,
  armorClass :: ArmorClass,
  hitpoints :: HitPoints,
  abilities :: Abilities,
  experience :: Experience,
  level :: Level
}

data Combatants = Combatants {
  attacker :: Character,
  defenders :: [Character]
}

data AttackResult = AttackResult {
  attackStatus :: Either UnsuccessfulAttack SuccessfulAttack,
  characters :: [Character] 
}

type Attack = Combatants -> Roll -> AttackResult 

type Damage = Character -> DamageDealt -> Either CharacterDead Character

type ModifyAttributes = Attack -> ModifiedAttributes

type GainExperience = Character -> Attack -> Character

type LevelUp = Character -> Character
