Content-Type: multipart/mixed; boundary="===============2419197980195833986=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ceph/messenger_v1.c:403 prepare_write_connect() error: uninitialized symbol 'proto'.
Date: Fri, 26 Nov 2021 02:33:02 +0800
Message-ID: <202111260246.eVZNBVEh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2419197980195833986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ilya Dryomov <idryomov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5f53fa508db098c9d372423a6dac31c8a5679cdf
commit: 2f713615ddd9d805b6c5e79c52e0e11af99d2bf1 libceph: move msgr1 protoc=
ol implementation to its own file
date:   12 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 12 months ago
config: ia64-randconfig-m031-20211122 (https://download.01.org/0day-ci/arch=
ive/20211126/202111260246.eVZNBVEh-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ceph/messenger_v1.c:403 prepare_write_connect() error: uninitialized sy=
mbol 'proto'.

Old smatch warnings:
net/ceph/messenger_v1.c:1111 read_partial_message() error: we previously as=
sumed 'con->in_msg' could be null (see line 1090)

vim +/proto +403 net/ceph/messenger_v1.c

2f713615ddd9d80 Ilya Dryomov 2020-11-12  374  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  375  static int prepare_write_conn=
ect(struct ceph_connection *con)
2f713615ddd9d80 Ilya Dryomov 2020-11-12  376  {
2f713615ddd9d80 Ilya Dryomov 2020-11-12  377  	unsigned int global_seq =3D =
ceph_get_global_seq(con->msgr, 0);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  378  	int proto;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  379  	int ret;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  380  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  381  	switch (con->peer_name.type)=
 {
2f713615ddd9d80 Ilya Dryomov 2020-11-12  382  	case CEPH_ENTITY_TYPE_MON:
2f713615ddd9d80 Ilya Dryomov 2020-11-12  383  		proto =3D CEPH_MONC_PROTOCO=
L;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  384  		break;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  385  	case CEPH_ENTITY_TYPE_OSD:
2f713615ddd9d80 Ilya Dryomov 2020-11-12  386  		proto =3D CEPH_OSDC_PROTOCO=
L;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  387  		break;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  388  	case CEPH_ENTITY_TYPE_MDS:
2f713615ddd9d80 Ilya Dryomov 2020-11-12  389  		proto =3D CEPH_MDSC_PROTOCO=
L;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  390  		break;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  391  	default:
2f713615ddd9d80 Ilya Dryomov 2020-11-12  392  		BUG();
2f713615ddd9d80 Ilya Dryomov 2020-11-12  393  	}
2f713615ddd9d80 Ilya Dryomov 2020-11-12  394  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  395  	dout("prepare_write_connect =
%p cseq=3D%d gseq=3D%d proto=3D%d\n", con,
2f713615ddd9d80 Ilya Dryomov 2020-11-12  396  	     con->connect_seq, globa=
l_seq, proto);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  397  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  398  	con->out_connect.features =
=3D
2f713615ddd9d80 Ilya Dryomov 2020-11-12  399  	    cpu_to_le64(from_msgr(co=
n->msgr)->supported_features);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  400  	con->out_connect.host_type =
=3D cpu_to_le32(CEPH_ENTITY_TYPE_CLIENT);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  401  	con->out_connect.connect_seq=
 =3D cpu_to_le32(con->connect_seq);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  402  	con->out_connect.global_seq =
=3D cpu_to_le32(global_seq);
2f713615ddd9d80 Ilya Dryomov 2020-11-12 @403  	con->out_connect.protocol_ve=
rsion =3D cpu_to_le32(proto);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  404  	con->out_connect.flags =3D 0;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  405  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  406  	ret =3D get_connect_authoriz=
er(con);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  407  	if (ret)
2f713615ddd9d80 Ilya Dryomov 2020-11-12  408  		return ret;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  409  =

2f713615ddd9d80 Ilya Dryomov 2020-11-12  410  	__prepare_write_connect(con);
2f713615ddd9d80 Ilya Dryomov 2020-11-12  411  	return 0;
2f713615ddd9d80 Ilya Dryomov 2020-11-12  412  }
2f713615ddd9d80 Ilya Dryomov 2020-11-12  413  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2419197980195833986==--

