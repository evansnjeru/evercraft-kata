import Control.Exception (SomeException)

type Undefined = SomeException

type Name = Undefined
type ArmorClass = Undefined
type HitPoints = Undefined
type AbilityScore = Undefined
type Strength = Undefined
type Dexterity =Undefined
type Constitution = Undefined
type Wisdom = Undefined
type Intelligence = Undefined
type Charisma = Undefined
type DamageDealt = Undefined
type Roll = Undefined
type Modifier = Undefined
type Experience = Undefined
type Level = Undefined
type CharacterDead = Undefined

data Alignment = Good | Evil | Neutral

data Abilities = Abilities {
  strength :: Strength,
  dexterity :: Dexterity,
  constitution :: Constitution,
  wisdom :: Wisdom,
  intelligence :: Intelligence,
  charisma :: Charisma
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

data AttackStatus
  = SuccessfulAttack Combatants
  | UnsuccessfulAttack Combatants

data Result a b
  = Ok a
  | Error b

type Attack = Combatants -> Roll -> AttackStatus 

type Damage = Character -> DamageDealt -> Result Character CharacterDead

type ModifyAttribute = AbilityScore -> Modifier

type GainExperience = Character -> Attack -> Character

type LevelUp = Character -> Character
