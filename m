Content-Type: multipart/mixed; boundary="===============6448540541673445153=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/afs/server.c:406 afs_put_server() warn: variable dereferenced before check 'server' (see line 402)
Date: Mon, 15 Aug 2022 10:33:56 +0800
Message-ID: <202208151006.5QHVQK8p-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6448540541673445153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 2757a4dc184997c66ef1de32636f73b9f21aac14 afs: Fix access after dec =
in put functions
date:   12 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 days ago
config: parisc-randconfig-m031-20220807 (https://download.01.org/0day-ci/ar=
chive/20220815/202208151006.5QHVQK8p-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/afs/server.c:406 afs_put_server() warn: variable dereferenced before che=
ck 'server' (see line 402)

vim +/server +406 fs/afs/server.c

452181936931f0 David Howells  2019-06-20  395  =

d2ddc776a4581d David Howells  2017-11-02  396  /*
d2ddc776a4581d David Howells  2017-11-02  397   * Release a reference on a =
server record.
^1da177e4c3f41 Linus Torvalds 2005-04-16  398   */
452181936931f0 David Howells  2019-06-20  399  void afs_put_server(struct a=
fs_net *net, struct afs_server *server,
452181936931f0 David Howells  2019-06-20  400  		    enum afs_server_trace =
reason)
^1da177e4c3f41 Linus Torvalds 2005-04-16  401  {
2757a4dc184997 David Howells  2022-07-06 @402  	unsigned int a, debug_id =
=3D server->debug_id;
c56f9ec8b20f93 David Howells  2022-07-06  403  	bool zero;
c56f9ec8b20f93 David Howells  2022-07-06  404  	int r;
d2ddc776a4581d David Howells  2017-11-02  405  =

^1da177e4c3f41 Linus Torvalds 2005-04-16 @406  	if (!server)
^1da177e4c3f41 Linus Torvalds 2005-04-16  407  		return;
^1da177e4c3f41 Linus Torvalds 2005-04-16  408  =

2757a4dc184997 David Howells  2022-07-06  409  	a =3D atomic_inc_return(&se=
rver->active);
c56f9ec8b20f93 David Howells  2022-07-06  410  	zero =3D __refcount_dec_and=
_test(&server->ref, &r);
2757a4dc184997 David Howells  2022-07-06  411  	trace_afs_server(debug_id, =
r - 1, a, reason);
c56f9ec8b20f93 David Howells  2022-07-06  412  	if (unlikely(zero))
977e5f8ed0ab27 David Howells  2020-04-17  413  		__afs_put_server(net, serv=
er);
977e5f8ed0ab27 David Howells  2020-04-17  414  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  415  =


:::::: The code at line 406 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6448540541673445153==--

