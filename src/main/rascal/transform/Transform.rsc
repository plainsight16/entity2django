module transform::Transform

import Syntax;
import transform::Entities2Django;
import Implode;
import Prelude;
import ParseTree;

public void generateDjango(){
    loc src = |project://entity2django/src/main/rascal/Example.ttl|;
    pt = parse(#Entities, src);
    model = entities2django(implode(pt));
    writeFile(|project://entity2django/output/models.py|, model);
}