Content-Type: multipart/mixed; boundary="===============5755283577670850503=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ceph/messenger_v1.c:346 get_connect_authorizer() error: uninitialized symbol 'auth_proto'.
Date: Tue, 07 Dec 2021 11:04:25 +0800
Message-ID: <202112071144.sVPWoGn6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5755283577670850503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ilya Dryomov <idryomov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f80ef9e49fdfbfbc4197711230098b90e6b05a7e
commit: 2f713615ddd9d805b6c5e79c52e0e11af99d2bf1 libceph: move msgr1 protoc=
ol implementation to its own file
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-m021-20211206 (https://download.01.org/0day-ci/arch=
ive/20211207/202112071144.sVPWoGn6-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ceph/messenger_v1.c:346 get_connect_authorizer() error: uninitialized s=
ymbol 'auth_proto'.

Old smatch warnings:
net/ceph/messenger_v1.c:1111 read_partial_message() error: we previously as=
sumed 'con->in_msg' could be null (see line 1090)

vim +/auth_proto +346 net/ceph/messenger_v1.c

2f713615ddd9d80 Ilya Dryomov 2020-11-12  324  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  325  /*
2f713615ddd9d80 Ilya Dryomov 2020-11-12  326   * Connection negotiation.
2f713615ddd9d80 Ilya Dryomov 2020-11-12  327   */
2f713615ddd9d80 Ilya Dryomov 2020-11-12  328  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  329  static int get_connect_author=
izer(struct ceph_connection *con)
2f713615ddd9d80 Ilya Dryomov 2020-11-12  330  {
2f713615ddd9d80 Ilya Dryomov 2020-11-12  331  	struct ceph_auth_handshake *=
auth;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  332  	int auth_proto;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  333  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  334  	if (!con->ops->get_authorize=
r) {
2f713615ddd9d80 Ilya Dryomov 2020-11-12  335  		con->auth =3D NULL;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  336  		con->out_connect.authorizer=
_protocol =3D CEPH_AUTH_UNKNOWN;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  337  		con->out_connect.authorizer=
_len =3D 0;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  338  		return 0;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  339  	}
2f713615ddd9d80 Ilya Dryomov 2020-11-12  340  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  341  	auth =3D con->ops->get_autho=
rizer(con, &auth_proto, con->auth_retry);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  342  	if (IS_ERR(auth))
2f713615ddd9d80 Ilya Dryomov 2020-11-12  343  		return PTR_ERR(auth);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  344  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  345  	con->auth =3D auth;
2f713615ddd9d80 Ilya Dryomov 2020-11-12 @346  	con->out_connect.authorizer_=
protocol =3D cpu_to_le32(auth_proto);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  347  	con->out_connect.authorizer_=
len =3D cpu_to_le32(auth->authorizer_buf_len);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  348  	return 0;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  349  }
2f713615ddd9d80 Ilya Dryomov 2020-11-12  350  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5755283577670850503==--

