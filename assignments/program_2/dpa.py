#Anthony Enem
#Program 2

import threading
import time
from threading import Lock
from time import sleep
import os
import random

# Layout of the table (P = philosopher, f = fork):
#          P0
#       f3    f0
#     P3        P1
#       f2    f1
#          P2

# Number of philosophers at the table. 
# There'll be the same number of forks.
numPhilosophers = 4

# Lists to hold the philosophers and the forks.
# Philosophers are threads while forks are locks.
philosophers = []
forks = []

class Waiter:
    def __init__(self):
        self.lock = Lock()
        self.lockingThread = -1        

    def getForks(self, phil_num):

        self.lock.acquire() #acquire waiter lock
        self.lockingThread = phil_num

        #assign left and right forks for Philosopher
        leftForkIndex = phil_num
        rightForkIndex = (phil_num - 1) % numPhilosophers

        while True: #while current Philosopher has not eaten

            if forks[rightForkIndex].acquire(False): #try acquiring right fork
                if forks[leftForkIndex].acquire(False): #try acquiring left fork

                    self.lock.release() #release waiter lock after philosopher acquires both forks
                    
                    startTime = time.time()
                    sleep(0.01) #hold forks for 0.01 seconds
                    print "Philosopher", phil_num, "ate for", time.time() - startTime, "seconds."

                    #release forks
                    forks[rightForkIndex].release()
                    forks[leftForkIndex].release()

                    break #break out of while loop after eating

                else:
                    forks[rightForkIndex].release() #release right fork acquired



class Philosopher(threading.Thread):
    def __init__(self, index, waiter):
        threading.Thread.__init__(self)
        self.index = index
        self.waiter = waiter

    def run(self):
        # Run forever
        while True:
            self.waiter.getForks(self.index)


if __name__ == "__main__":
    waiter = Waiter()

     # Create philosophers and forks
    for i in range(0, numPhilosophers):
        philosophers.append(Philosopher(i, waiter))
        forks.append(threading.Lock())
    
    #random.shuffle(philosophers) #for more unpredictable results 

    # All philosophers start eating
    for philosopher in philosophers:
        philosopher.start()

    # Allow CTRL + C to exit the program
    try:
        while True: sleep(0.1)
    except (KeyboardInterrupt, SystemExit):
        os._exit(0)