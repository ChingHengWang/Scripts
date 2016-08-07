
class Greeter(object):

	def __init__(self,name,aa):
		self.name=name
		self.aa=aa

	def greet(self,loud=False):
		if loud:
			print 'HELLO %s %s' % (self.name.upper(),self.aa)
		else:
			print 'HELLO.%s' % self.name

g=Greeter('Fred','So Cool')
g.greet()
g.greet(loud=True)

