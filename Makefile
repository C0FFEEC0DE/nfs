stest:
	vagrant up client1
	vagrant provision client1
	vagrant up client2
	vagrant provision client2
atest:
	rake test
clean:
	vagrant destroy -f
