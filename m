Content-Type: multipart/mixed; boundary="===============3503710149227210796=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4042/4626] net/ceph/messenger_v2.c:311 alloc_conn_buf() error: kvmalloc() only makes sense with GFP_KERNEL
Date: Wed, 01 Dec 2021 23:26:46 +0800
Message-ID: <202112012323.erLbOTLT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3503710149227210796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michal Hocko <mhocko@suse.com>
CC: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   048aeae86c3967f4c40666cd26f2c1eb73a4b805
commit: 232323e9a580d6b34f3a513602b21359a79a09dd [4042/4626] mm: allow !GFP=
_KERNEL allocations for kvmalloc
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-m031-20211128 (https://download.01.org/0day-ci/archi=
ve/20211201/202112012323.erLbOTLT-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ceph/messenger_v2.c:311 alloc_conn_buf() error: kvmalloc() only makes s=
ense with GFP_KERNEL
net/ceph/osdmap.c:983 alloc_workspace() error: kvmalloc() only makes sense =
with GFP_KERNEL
net/ceph/osdmap.c:1193 osdmap_set_max_osd() error: kvmalloc() only makes se=
nse with GFP_KERNEL
net/ceph/osdmap.c:1506 set_primary_affinity() error: kvmalloc() only makes =
sense with GFP_KERNEL

Old smatch warnings:
net/ceph/osdmap.c:1194 osdmap_set_max_osd() error: kvmalloc() only makes se=
nse with GFP_KERNEL
net/ceph/osdmap.c:1195 osdmap_set_max_osd() error: kvmalloc() only makes se=
nse with GFP_KERNEL
net/ceph/osdmap.c:1225 osdmap_set_max_osd() error: kvmalloc() only makes se=
nse with GFP_KERNEL

vim +311 net/ceph/messenger_v2.c

cd1a677cad9940 Ilya Dryomov 2020-11-19  301  =

cd1a677cad9940 Ilya Dryomov 2020-11-19  302  static void *alloc_conn_buf(st=
ruct ceph_connection *con, int len)
cd1a677cad9940 Ilya Dryomov 2020-11-19  303  {
cd1a677cad9940 Ilya Dryomov 2020-11-19  304  	void *buf;
cd1a677cad9940 Ilya Dryomov 2020-11-19  305  =

cd1a677cad9940 Ilya Dryomov 2020-11-19  306  	dout("%s con %p len %d\n", __=
func__, con, len);
cd1a677cad9940 Ilya Dryomov 2020-11-19  307  =

cd1a677cad9940 Ilya Dryomov 2020-11-19  308  	if (WARN_ON(con->v2.conn_buf_=
cnt >=3D ARRAY_SIZE(con->v2.conn_bufs)))
cd1a677cad9940 Ilya Dryomov 2020-11-19  309  		return NULL;
cd1a677cad9940 Ilya Dryomov 2020-11-19  310  =

232323e9a580d6 Michal Hocko 2021-11-30 @311  	buf =3D kvmalloc(len, GFP_NOI=
O);
cd1a677cad9940 Ilya Dryomov 2020-11-19  312  	if (!buf)
cd1a677cad9940 Ilya Dryomov 2020-11-19  313  		return NULL;
cd1a677cad9940 Ilya Dryomov 2020-11-19  314  =

cd1a677cad9940 Ilya Dryomov 2020-11-19  315  	con->v2.conn_bufs[con->v2.con=
n_buf_cnt++] =3D buf;
cd1a677cad9940 Ilya Dryomov 2020-11-19  316  	return buf;
cd1a677cad9940 Ilya Dryomov 2020-11-19  317  }
cd1a677cad9940 Ilya Dryomov 2020-11-19  318  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3503710149227210796==--

