Content-Type: multipart/mixed; boundary="===============1120760095888432895=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jlayton:ceph-fscrypt 53/53] net/ceph/osd_client.c:5775 osd_sparse_read() warn: statement has no effect 3
Date: Sat, 29 Jan 2022 18:14:47 +0800
Message-ID: <202201291840.0djvF8MX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1120760095888432895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git c=
eph-fscrypt
head:   3f014b82b65ebbf30b8e4cd0b307f1f2794d183f
commit: 3f014b82b65ebbf30b8e4cd0b307f1f2794d183f [53/53] libceph: define a =
structure to track SPARSE_READ reply processing
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: openrisc-randconfig-m031-20220124 (https://download.01.org/0day-ci/=
archive/20220129/202201291840.0djvF8MX-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ceph/osd_client.c:5775 osd_sparse_read() warn: statement has no effect 3

Old smatch warnings:
include/linux/ceph/string_table.h:46 ceph_compare_string() error: we previo=
usly assumed 'cs' could be null (see line 41)

vim +5775 net/ceph/osd_client.c

33d07337962c7b Yan, Zheng  2014-11-04  5746  =

3f014b82b65ebb Jeff Layton 2022-01-25  5747  static int osd_sparse_read(str=
uct ceph_connection *con, u64 *len, char **buf)
3f014b82b65ebb Jeff Layton 2022-01-25  5748  {
3f014b82b65ebb Jeff Layton 2022-01-25  5749  	struct ceph_osd *o =3D con->p=
rivate;
3f014b82b65ebb Jeff Layton 2022-01-25  5750  	struct ceph_sparse_read *sr =
=3D &o->o_sparse_read;
3f014b82b65ebb Jeff Layton 2022-01-25  5751  	u32 count =3D __le32_to_cpu(s=
r->sr_count);
3f014b82b65ebb Jeff Layton 2022-01-25  5752  	int ret =3D 1;
3f014b82b65ebb Jeff Layton 2022-01-25  5753  =

3f014b82b65ebb Jeff Layton 2022-01-25  5754  	switch (sr->sr_state) {
3f014b82b65ebb Jeff Layton 2022-01-25  5755  	case CEPH_SPARSE_READ_COUNT:
3f014b82b65ebb Jeff Layton 2022-01-25  5756  		/* number of extents */
3f014b82b65ebb Jeff Layton 2022-01-25  5757  		*len =3D sizeof(sr->sr_count=
);
3f014b82b65ebb Jeff Layton 2022-01-25  5758  		*buf =3D (char *)&sr->sr_cou=
nt;
3f014b82b65ebb Jeff Layton 2022-01-25  5759  		sr->sr_state =3D CEPH_SPARSE=
_READ_EXTENTS;
3f014b82b65ebb Jeff Layton 2022-01-25  5760  		break;
3f014b82b65ebb Jeff Layton 2022-01-25  5761  	case CEPH_SPARSE_READ_EXTENTS:
3f014b82b65ebb Jeff Layton 2022-01-25  5762  		/* the extent array */
3f014b82b65ebb Jeff Layton 2022-01-25  5763  		*len =3D count * sizeof(*sr-=
>sr_extent);
3f014b82b65ebb Jeff Layton 2022-01-25  5764  		if (count > 1) {
3f014b82b65ebb Jeff Layton 2022-01-25  5765  			/* can't use the embedded e=
xtent array */
3f014b82b65ebb Jeff Layton 2022-01-25  5766  			sr->sr_extent =3D kmalloc_a=
rray(count, sizeof(*sr->sr_extent),
3f014b82b65ebb Jeff Layton 2022-01-25  5767  						   GFP_NOIO);
3f014b82b65ebb Jeff Layton 2022-01-25  5768  			if (!sr->sr_extent)
3f014b82b65ebb Jeff Layton 2022-01-25  5769  				return -ENOMEM;
3f014b82b65ebb Jeff Layton 2022-01-25  5770  		}
3f014b82b65ebb Jeff Layton 2022-01-25  5771  		*buf =3D (char *)sr->sr_exte=
nt;
3f014b82b65ebb Jeff Layton 2022-01-25  5772  		sr->sr_state =3D CEPH_SPARSE=
_READ_DATA;
3f014b82b65ebb Jeff Layton 2022-01-25  5773  		break;
3f014b82b65ebb Jeff Layton 2022-01-25  5774  	case CEPH_SPARSE_READ_DATA:
3f014b82b65ebb Jeff Layton 2022-01-25 @5775  		u64 off =3D le64_to_cpu(sr->=
sr_extent[sr->sr_index].off);
3f014b82b65ebb Jeff Layton 2022-01-25  5776  		u64 len =3D le64_to_cpu(sr->=
sr_extent[sr->sr_index].len);
3f014b82b65ebb Jeff Layton 2022-01-25  5777  =

3f014b82b65ebb Jeff Layton 2022-01-25  5778  		/* ret to 0 if this is the l=
ast extent */
3f014b82b65ebb Jeff Layton 2022-01-25  5779  		++sr->sr_index;
3f014b82b65ebb Jeff Layton 2022-01-25  5780  		if (sr->sr_index >=3D count)
3f014b82b65ebb Jeff Layton 2022-01-25  5781  			ret =3D 0;
3f014b82b65ebb Jeff Layton 2022-01-25  5782  		break;
3f014b82b65ebb Jeff Layton 2022-01-25  5783  	}
3f014b82b65ebb Jeff Layton 2022-01-25  5784  	return ret;
3f014b82b65ebb Jeff Layton 2022-01-25  5785  }
3f014b82b65ebb Jeff Layton 2022-01-25  5786  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1120760095888432895==--

