# default- default value 
# Type: string, number, bool
# complex type: list(<type>) , set(<type>), map(<type>) , 
# object({<attr_name> = <type>,…}), tuple([<type>,…])
# any- can accept any value
# validation: A block to define validation rules, usually in addition to type constraints

variable "db_user" {
  description = "Testing variables"
  default = "test-user"
  type = string
  sensitive = true
}

