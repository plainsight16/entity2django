from django.db import models

class Customer(models.Model):

   name = models.CharField(max_length=256)

   description = models.CharField(max_length=256)

   website = models.CharField(max_length=256)


   def __unicode__(self):
       return "Customer: {0}".format(self.name)
               
 
    

class Contact(models.Model):

   name = models.CharField(max_length=256)

   phone = models.CharField(max_length=256)

   email = models.CharField(max_length=256)

   customer = models.ForeignKey(Customer)

 
    

   