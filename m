Content-Type: multipart/mixed; boundary="===============0733026186340688610=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [hch-misc:kernel_setsockopt 4/34] net/core/sock.c:758 sock_set_sndtimeo() warn: always true condition '(secs < ((~0 >> 1)) / 1000 - 1) => (0-u32max < 9223372036854774)'
Date: Wed, 13 May 2020 05:49:57 +0800
Message-ID: <202005130554.NXUSXMPJ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0733026186340688610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git kernel_setsockopt
head:   4da78fb394429318d6adcee849cf9d2c3c6d236a
commit: a155ec10ca34eadd0eeab78d264c1b3d86ccf307 [4/34] sock_set_sndtimeo
:::::: branch date: 13 hours ago
:::::: commit date: 15 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/core/sock.c:758 sock_set_sndtimeo() warn: always true condition '(secs =
< ((~0 >> 1)) / 1000 - 1) =3D> (0-u32max < 9223372036854774)'

git remote add hch-misc git://git.infradead.org/users/hch/misc.git
git remote update hch-misc
git checkout a155ec10ca34eadd0eeab78d264c1b3d86ccf307
vim +758 net/core/sock.c

5c391485201393 Christoph Hellwig 2020-05-11  754  =

a155ec10ca34ea Christoph Hellwig 2020-05-11  755  void sock_set_sndtimeo(st=
ruct sock *sk, unsigned int secs)
a155ec10ca34ea Christoph Hellwig 2020-05-11  756  {
a155ec10ca34ea Christoph Hellwig 2020-05-11  757  	lock_sock(sk);
a155ec10ca34ea Christoph Hellwig 2020-05-11 @758  	if (secs && secs < MAX_S=
CHEDULE_TIMEOUT / HZ - 1)
a155ec10ca34ea Christoph Hellwig 2020-05-11  759  		sk->sk_sndtimeo =3D sec=
s * HZ;
a155ec10ca34ea Christoph Hellwig 2020-05-11  760  	else
a155ec10ca34ea Christoph Hellwig 2020-05-11  761  		sk->sk_sndtimeo =3D MAX=
_SCHEDULE_TIMEOUT;
a155ec10ca34ea Christoph Hellwig 2020-05-11  762  	release_sock(sk);
a155ec10ca34ea Christoph Hellwig 2020-05-11  763  }
a155ec10ca34ea Christoph Hellwig 2020-05-11  764  EXPORT_SYMBOL(sock_set_sn=
dtimeo);
a155ec10ca34ea Christoph Hellwig 2020-05-11  765  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0733026186340688610==--

