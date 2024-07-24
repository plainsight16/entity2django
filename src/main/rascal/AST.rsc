module AST

extend Syntax;

data Entities = entities(str moduleName, list[Entity] entity_list);

data Entity = entity(str entityName, list[Attribute] attributes, list[EntityIdent] entity_identlist);

data EntityIdent = entityIdent(str attrName);

data Attribute = simpleType(str attrName, Type tp) 
                | associationType(str attrName, Type tp);

data Type = name(str id) | string();