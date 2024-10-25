import subprocess

p = subprocess.Popen(["echo", "Im taking to you, bash!"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

stdout, stderr = p.communicate()
stderr
stdout

print(stdout.decode())

p = subprocess.Popen(["ls", "-l"], stdout=subprocess.PIPE)
stdout, stderr = p.communicate()

