### Category devops

---

 - [Aliasing An Ansible Host](#aliasing-an-ansible-host)
 - [Allow Cross-Origin Requests To Include Cookies](#allow-cross-origin-requests-to-include-cookies)
 - [Allow HTTPS Through Your UFW Firewall](#allow-https-through-your-ufw-firewall)
 - [Check The Status Of All Services](#check-the-status-of-all-services)
 - [Check The Syntax Of nginx Files](#check-the-syntax-of-nginx-files)
 - [Connect To An RDS PostgreSQL Database](#connect-to-an-rds-postgresql-database)
 - [Determine The IP Address Of A Domain](#determine-the-ip-address-of-a-domain)
 - [Path Of The Packets](#path-of-the-packets)
 - [Push Non-master Branch To Heroku](#push-non-master-branch-to-heroku)
 - [Reload The nginx Configuration](#reload-the-nginx-configuration)
 - [Resolve The Public IP Of A URL](#resolve-the-public-ip-of-a-url)
 - [Running Out Of inode Space](#running-out-of-inode-space)
 - [SSH Into A Docker Container](#ssh-into-a-docker-container)
 - [SSL Certificates Can Cover Multiple Domains](#ssl-certificates-can-cover-multiple-domains)
 - [Wipe A Heroku Postgres Database](#wipe-a-heroku-postgres-database)

---

# Aliasing An Ansible Host

When specifying the hosts that Ansible can interact with in the
`/etc/ansible/hosts` file, you can put just the IP address of the host
server, like so:

```yml
192.168.1.50
```

IP addresses are not particularly meaningful for a person to look at though.
Giving it a name serves as better documentation and makes it easier to see
what host servers are in play during a task.

Ansible makes it easy to alias host servers. For example, we can name our
host `staging` like so:

```yml
staging ansible_host=192.168.1.50
```

[source](http://docs.ansible.com/ansible/intro_inventory.html)

# Allow Cross-Origin Requests To Include Cookies

When making a cross-origin fetch request from a client (e.g. browser) to a
server, all kinds of CORS protections are enforced by the browser. One of those
protections, by default, is to avoid XSS attacks by not sending credentials
(e.g. cookies, authorization headers or TLS client certificates) in the request
or expose credentials to the client JavaScript code.

This is controlled by the
[Access-Control-Allow-Credentials](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Credentials)
header.

If we want to include things like cookies in the request, then we need to have
both the client-originating request and the server to agree to allow
credentials.

The client-side fetch will need to specify that credentials should be included:

```javascript
fetch(url, {
  credentials: 'include'
})
```

The server, either in response to a GET or a preflight request, will need to do
two things. First, the response headers need to have
`Access-Control-Allow-Credentials` set to `true`. Second, the
[`Access-Control-Allow-Origin`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin)
will need to name the specific origin (the client). In other words, the allowed
origin cannot be set to `*`.

[source](https://stackoverflow.com/a/24689738/535590)

# Allow HTTPS Through Your UFW Firewall

UFW -- Uncomplicated Firewall -- is just what is sounds like. I have it
running on a DigitalOcean box and it is only letting through traffic on
ports 80 (HTTP) and 22 (SSH). I am setting up SSL for a domain hosted on
this box which means I need to also let through traffic on 443 (HTTPS).

The allowed ports can be checked with the `status` command:

```bash
$ sudo ufw status

Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
Nginx HTTP                 ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
Nginx HTTP (v6)            ALLOW       Anywhere (v6)
```

As we can see, `HTTPS` has not yet been allowed by `ufw`. We can _allow_
HTTPS traffic with the `allow` command.

```bash
$ sudo ufw allow https
```

Check the status again and see that `HTTPS` is now included in the list.

[source](https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server)

h/t Dillon Hafer

# Check The Status Of All Services

In a Linux environment, you can quickly check the status of a number of
different services. By running `[sudo] service --status-all`, the status
command will be invoked for all services under the `/etc/init.d/` directory.

So, if you want to check the status of something like `nginx` or `apache`,
just run `service --status-all` and find it in the list. The `-` symbol
means it isn't running, the `+` symbol means it is up, and the `?` symbol
means that it cannot determine the status.

# Check The Syntax Of nginx Files

The syntax of [`nginx`](https://www.nginx.com/) configuration files can be a
bit finicky. On top of that, some `nginx` server commands can fail silently.
Get more confidence by using the following command to check for syntax
errors in those files:

```bash
$ [sudo] nginx -t
```

If there is an error, you might see something like this:

```bash
$ sudo nginx -t
nginx: [emerg] unexpected ";" in /etc/nginx/nginx.conf:16
nginx: configuration file /etc/nginx/nginx.conf test failed
```

If all looks good, then you'll see this:

```bash
$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

# Connect To An RDS PostgreSQL Database

You can connect to an RDS PostgreSQL database remotely via `psql`. First,
you need to tell AWS that connections from your IP address are allowed. This
is done by configuring the VPC (Virtual Private Cloud) that is associated
with the RDS instance. You'll need to add an inbound rule to the Security
Group associated with that VPC. You'll add an inbound rule that allows a
Postgres connection on port 5432 from your IP address -- which is identified
by a [CIDR
address](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking#cidr-notation).

![create inbound rule](https://i.imgur.com/Ypb9Du7.png)

Once this rule has been added to the security groups associated with the VPC
that is associated with your RDS instance, you'll be able to connect from
your machine with `psql`.

```bash
$ psql my-rds-endpoint.cbazqrhkmyo.us-east-1.rds.amazonaws.com \
    --port 5432 \
    --user rdsusername \
    postgres
```

Assuming the database username is `rdsusername` and the specific database is
named `postgres`, you'll be prompted for that user's password and then
connected.

# Determine The IP Address Of A Domain

The `dig` (domain information grouper) command can be used to get more
information about a domain name. To discover the IP address for a given
domain, invoke `dig` with the domain as an argument.

```bash
$ dig joshbranchaud.com

; <<>> DiG 9.8.3-P1 <<>> joshbranchaud.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 26589
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;joshbranchaud.com.             IN      A

;; ANSWER SECTION:
joshbranchaud.com.      86400   IN      A       198.74.60.157

;; Query time: 118 msec
;; SERVER: 75.75.75.75#53(75.75.75.75)
;; WHEN: Sun Jan 17 22:32:18 2016
;; MSG SIZE  rcvd: 51
```

The *answer section* tells me that the IP address for `joshbranchaud.com` is
`198.74.60.157`.

See `man dig` for more details.

# Path Of The Packets

You can use `traceroute` to determine the network path packets follow from
your machine to some host server. For instance, if I want to know path
between my laptop (connected to airport wifi) and my website
[joshbranchaud.com](http://joshbranchaud.com), I can run the following
command:

```
$ traceroute joshbranchaud.com
traceroute to joshbranchaud.com (198.74.60.157), 64 hops max, 52 byte packets
 1  hotspot.boingohotspot.net (192.168.144.1)  1.209 ms  1.427 ms  1.080 ms
 2  192.168.13.1 (192.168.13.1)  5.272 ms  3.545 ms  6.231 ms
 3  10.106.144.1 (10.106.144.1)  13.671 ms  15.311 ms  12.895 ms
 4  68.13.10.184 (68.13.10.184)  14.789 ms  12.980 ms  13.628 ms
 5  68.13.8.221 (68.13.8.221)  19.922 ms  12.611 ms  17.853 ms
 6  nyrkbprj01-ae3.0.rd.ny.cox.net (68.1.5.157)  48.917 ms  56.641 ms  51.771 ms
 7  eqix.e-2-3.tbr2.ewr.nac.net (198.32.118.157)  62.977 ms  52.970 ms  48.667 ms
 8  0.e1-2.tbr2.mmu.nac.net (209.123.10.114)  66.253 ms  57.311 ms  52.242 ms
 9  207.99.53.46 (207.99.53.46)  57.478 ms  53.443 ms  54.510 ms
10  joshbranchaud.com (198.74.60.157)  59.853 ms  56.375 ms  55.393 ms
```

See `man traceroute` for more details.

# Push Non-master Branch To Heroku

When using git to deploy your app to Heroku, it is expected that you push
to the `master` branch. When you run the following command

```
$ git push heroku master
```

Heroku will attempt to build and run your app. However, if you have a
`staging` branch for your application that you want to push to your
staging environment on Heroku, you cannot simply run

```
$ git push heroku staging
```

Heroku will only perform a build on pushes to the remote `master` branch.
You can get around this, though, by specifying that your `staging` branch
should be pushed to the remote `master` branch, like so

```
$ git push heroku staging:master
```

[source](https://coderwall.com/p/1xforw/make-heroku-run-a-non-master-branch)

# Reload The nginx Configuration

If you've modified or replaced the configuration file, nginx will not
immediately start using the updated nginx configuration.
Once a `restart` or `reload` signal is received by nginx, it
will apply the changes. The `reload` signal

```
$ service nginx reload
```

tells nginx to reload the configuration. It will check the validity of the
configuration file and then spawn new worker processes for the latest
configuration. It then sends requests to shut down the old worker processes.
This means that during a *reload* nginx is always up and processing
requests.

[source](http://nginx.org/en/docs/beginners_guide.html)

# Resolve The Public IP Of A URL

The `dig` command is a utility for doing DNS lookups. You can run it with a
URL argument to lookup the public IP for that domain.

```bash
$ dig joshbranchaud.com

; <<>> DiG 9.8.3-P1 <<>> joshbranchaud.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 62836
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;joshbranchaud.com.             IN      A

;; ANSWER SECTION:
joshbranchaud.com.      1800    IN      A       159.203.106.229

;; Query time: 50 msec
;; SERVER: 75.75.75.75#53(75.75.75.75)
;; WHEN: Sun Apr 14 12:34:52 2019
;; MSG SIZE  rcvd: 51
```

The output is a bit noisy, but if you parse down to the _ANSWER SECTION_,
you'll see the IP address that it resolves to.

Alternatively, you can skip the noise and get right to the IP address by
including the `+short` flag.

```bash
$ dig joshbranchaud.com +short
159.203.106.229
```

See `man dig` for more details.

# Running Out Of inode Space

Unix systems have two types of storage limitations. The first, and more
common, is a limitation on physical storage used for storing the contents of
files. The second is a limitation on `inode` space which represents file
location and other data.

Though it is uncommon, it is possible to run out of `inode` space before
running out of disk space (run `df` and `df -i` to see the levels of each).
When this happens, the system will complain that there is `No space left on
device`. Both `inode` space and disk space are needed to create a new file.

How can this happen? If lots of directories with lots of empty, small, or
duplicate files are being created, then the `inode` space can be used up
disproportionately to the amount of respective disk space. You'll need to
clean up some of those files before you can continue.

Sources: [this](http://blog.scoutapp.com/articles/2014/10/08/understanding-disk-inodes) and [this](http://www.linux.org/threads/intro-to-inodes.4130/)

# SSH Into A Docker Container

Before you can SSH into a Docker container, you need to know the name of the
container.

Run

```bash
$ docker ps
```

to list the currently running containers and find the name of the one you want
to connect to. If you don't see the one you are looking for, it may not be
running.

Then, you can connect to it by name with a bash session like so:

```bash
$ docker exec -it <container name> /bin/bash
```

The
[`-it`](http://docs.docker.oeynet.com/engine/reference/commandline/container_exec/)
flags open an interactive emulated terminal connection. `/bin/bash` is the
command that gets run in that context.

[source](https://phase2.github.io/devtools/common-tasks/ssh-into-a-container/)

# SSL Certificates Can Cover Multiple Domains

When registering an SSL certificate, you can list multiple domains to be
covered by it.

One use case is registering a certificate that covers both the apex domain
(`example.com`) and all subdomains using a wildcard (`*.example.com`). The
wildcard alone will not cover `example.com`. If you want `example.com`,
`www.example.com`, `blog.example.com`, etc. covered under the same certificate,
then you'll need to include both the apex and wildcard domains.

# Wipe A Heroku Postgres Database

If you have some sort of non-production version of an application running on
Heroku, you may encounter a time when you need to wipe your database and
start fresh. For a rails project, it may be tempting to do `heroku run rake
db:drop db:setup`. Heroku doesn't want you to accidentally do anything
stupid, so it prevents you from running `rake db:drop`. Instead, you must
send a more explicit command

```
$ heroku pg:reset DATABASE_URL
```

Heroku will ask you to confirm that you indeed want to wipe out the database
and will then proceed.

For the curious reader, running `heroku config` will list the values of a
number of variables including `DATABASE_URL`.

