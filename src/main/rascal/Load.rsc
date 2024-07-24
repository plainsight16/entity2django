module Load

import AST;
import Parse;
import Implode;


public Entities load(){
    return implode(parseEntities(programPath()));
}

loc programPath(){
    return |project://entity2django/src/main/rascal/Example.ttl|;
}