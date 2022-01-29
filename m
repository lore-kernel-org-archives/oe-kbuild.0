Content-Type: multipart/mixed; boundary="===============1392708423984430911=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jlayton:ceph-fscrypt 53/53] net/ceph/osd_client.c:5775:17: sparse: sparse: typename in expression
Date: Sat, 29 Jan 2022 11:52:32 +0800
Message-ID: <202201291129.oSSSQduO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1392708423984430911==
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
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: s390-randconfig-s031-20220124 (https://download.01.org/0day-ci/arch=
ive/20220129/202201291129.oSSSQduO-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git=
/commit/?id=3D3f014b82b65ebbf30b8e4cd0b307f1f2794d183f
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/=
git/jlayton/linux.git
        git fetch --no-tags jlayton ceph-fscrypt
        git checkout 3f014b82b65ebbf30b8e4cd0b307f1f2794d183f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
390 SHELL=3D/bin/bash net/ceph/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> net/ceph/osd_client.c:5775:17: sparse: sparse: typename in expression
   net/ceph/osd_client.c:5775:21: sparse: sparse: Expected ; at end of stat=
ement
   net/ceph/osd_client.c:5775:21: sparse: sparse: got off
   net/ceph/osd_client.c:5775:17: sparse: sparse: undefined identifier 'u64'

vim +5775 net/ceph/osd_client.c

33d07337962c7bb Yan, Zheng  2014-11-04  5746  =

3f014b82b65ebbf Jeff Layton 2022-01-25  5747  static int osd_sparse_read(st=
ruct ceph_connection *con, u64 *len, char **buf)
3f014b82b65ebbf Jeff Layton 2022-01-25  5748  {
3f014b82b65ebbf Jeff Layton 2022-01-25  5749  	struct ceph_osd *o =3D con->=
private;
3f014b82b65ebbf Jeff Layton 2022-01-25  5750  	struct ceph_sparse_read *sr =
=3D &o->o_sparse_read;
3f014b82b65ebbf Jeff Layton 2022-01-25  5751  	u32 count =3D __le32_to_cpu(=
sr->sr_count);
3f014b82b65ebbf Jeff Layton 2022-01-25  5752  	int ret =3D 1;
3f014b82b65ebbf Jeff Layton 2022-01-25  5753  =

3f014b82b65ebbf Jeff Layton 2022-01-25  5754  	switch (sr->sr_state) {
3f014b82b65ebbf Jeff Layton 2022-01-25  5755  	case CEPH_SPARSE_READ_COUNT:
3f014b82b65ebbf Jeff Layton 2022-01-25  5756  		/* number of extents */
3f014b82b65ebbf Jeff Layton 2022-01-25  5757  		*len =3D sizeof(sr->sr_coun=
t);
3f014b82b65ebbf Jeff Layton 2022-01-25  5758  		*buf =3D (char *)&sr->sr_co=
unt;
3f014b82b65ebbf Jeff Layton 2022-01-25  5759  		sr->sr_state =3D CEPH_SPARS=
E_READ_EXTENTS;
3f014b82b65ebbf Jeff Layton 2022-01-25  5760  		break;
3f014b82b65ebbf Jeff Layton 2022-01-25  5761  	case CEPH_SPARSE_READ_EXTENT=
S:
3f014b82b65ebbf Jeff Layton 2022-01-25  5762  		/* the extent array */
3f014b82b65ebbf Jeff Layton 2022-01-25  5763  		*len =3D count * sizeof(*sr=
->sr_extent);
3f014b82b65ebbf Jeff Layton 2022-01-25  5764  		if (count > 1) {
3f014b82b65ebbf Jeff Layton 2022-01-25  5765  			/* can't use the embedded =
extent array */
3f014b82b65ebbf Jeff Layton 2022-01-25  5766  			sr->sr_extent =3D kmalloc_=
array(count, sizeof(*sr->sr_extent),
3f014b82b65ebbf Jeff Layton 2022-01-25  5767  						   GFP_NOIO);
3f014b82b65ebbf Jeff Layton 2022-01-25  5768  			if (!sr->sr_extent)
3f014b82b65ebbf Jeff Layton 2022-01-25  5769  				return -ENOMEM;
3f014b82b65ebbf Jeff Layton 2022-01-25  5770  		}
3f014b82b65ebbf Jeff Layton 2022-01-25  5771  		*buf =3D (char *)sr->sr_ext=
ent;
3f014b82b65ebbf Jeff Layton 2022-01-25  5772  		sr->sr_state =3D CEPH_SPARS=
E_READ_DATA;
3f014b82b65ebbf Jeff Layton 2022-01-25  5773  		break;
3f014b82b65ebbf Jeff Layton 2022-01-25  5774  	case CEPH_SPARSE_READ_DATA:
3f014b82b65ebbf Jeff Layton 2022-01-25 @5775  		u64 off =3D le64_to_cpu(sr-=
>sr_extent[sr->sr_index].off);
3f014b82b65ebbf Jeff Layton 2022-01-25  5776  		u64 len =3D le64_to_cpu(sr-=
>sr_extent[sr->sr_index].len);
3f014b82b65ebbf Jeff Layton 2022-01-25  5777  =

3f014b82b65ebbf Jeff Layton 2022-01-25  5778  		/* ret to 0 if this is the =
last extent */
3f014b82b65ebbf Jeff Layton 2022-01-25  5779  		++sr->sr_index;
3f014b82b65ebbf Jeff Layton 2022-01-25  5780  		if (sr->sr_index >=3D count)
3f014b82b65ebbf Jeff Layton 2022-01-25  5781  			ret =3D 0;
3f014b82b65ebbf Jeff Layton 2022-01-25  5782  		break;
3f014b82b65ebbf Jeff Layton 2022-01-25  5783  	}
3f014b82b65ebbf Jeff Layton 2022-01-25  5784  	return ret;
3f014b82b65ebbf Jeff Layton 2022-01-25  5785  }
3f014b82b65ebbf Jeff Layton 2022-01-25  5786  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1392708423984430911==--

