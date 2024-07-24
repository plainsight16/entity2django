module transform::Entities2Django

import AST;
import String;


public str entities2django(Entities e){
   return "from django.db import models
   '<for (es <- e.entity_list) {>
   '<entity2django(es)>
   '<}>
   ";
}

public str entity2django(Entity e){
    return "class <e.entityName>(models.Model):
    '<for (attr <- e.attributes) {>
    '   <attr2django(attr)>
    '<}>
    '<for (entity_iden <- e.entity_identlist) {>
    '   <entityIden2django(e, entity_iden)>
    '<}> 
    ";
}

public str attr2django(Attribute attr){
    switch(attr){
        case simpleType(attrName, tp): return "<attrName> = <type2django(tp)>";
        case associationType(attrName, tp): return "<attrName> = <type2django(tp)>";
        default: return "";
    }
}

public str entityIden2django(Entity e, EntityIdent entityIdent){
    return "def __unicode__(self):
            '    return \"<e.entityName>: {0}\".format(self.<entityIdent.attrName>)
            ";
}

public str type2django(Type tp){
    switch(tp){
        case name(id): return "models.ForeignKey(<id>)";
        case string(): return "models.CharField(max_length=256)";
        default: return "";
    }
}



