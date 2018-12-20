To update the MediaWiki skin:

- See the long angry rant in the Dockerfile
- You have to rebuild the whole container. Yup, stupid.
- Rebuild the MW container while the docker pod is still running (won't effect the docker pod)
- When finished rebuilding the MW container, restart the docker pod.

```
# switch to main poddirectory
cd ../

# rebuild all containers
docker-compose build

# restart the pod
sudo service dockerpod-charlesreid1 restart
```

To verify that the skin has correcty been installed, you can check
the skin file inside the container. First, get a shell in the container:

```
docker exec -it podcharlesreid1_stormy_mw_1 /bin/bash
```

Once inside the container, the main web directory is `/var/www/html/`,
so the skins should be in `/var/www/html/skins/`. You can use `cat` to
print the file to the screen and verify it is correct.

