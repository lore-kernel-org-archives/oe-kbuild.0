Content-Type: multipart/mixed; boundary="===============0141248445124606969=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [gfs2:for-next 9/11] fs/gfs2/file.c:796:24: sparse: unsigned int *
Date: Thu, 17 Mar 2022 09:59:50 +0800
Message-ID: <202203170954.vFlMcTje-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0141248445124606969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: cluster-devel(a)redhat.com
CC: linux-kernel(a)vger.kernel.org
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git=
 for-next
head:   a20050c14edf19add5a9588cb196bb00aa410650
commit: 165d142ffacdef3e620819a1031df3d896aa29ab [9/11] gfs2: Fix should_fa=
ult_in_pages() logic
:::::: branch date: 10 hours ago
:::::: commit date: 12 hours ago
config: sh-randconfig-s032-20220313 (https://download.01.org/0day-ci/archiv=
e/20220317/202203170954.vFlMcTje-lkp(a)intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.g=
it/commit/?id=3D165d142ffacdef3e620819a1031df3d896aa29ab
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git=
/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 for-next
        git checkout 165d142ffacdef3e620819a1031df3d896aa29ab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
h SHELL=3D/bin/bash fs/gfs2/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   fs/gfs2/file.c:796:24: sparse: sparse: incompatible types in comparison =
expression (different signedness):
>> fs/gfs2/file.c:796:24: sparse:    unsigned int *
   fs/gfs2/file.c:796:24: sparse:    int *
>> fs/gfs2/file.c:796:24: sparse: sparse: cannot size expression

vim +796 fs/gfs2/file.c

33c3de32872ef3 fs/gfs2/ops_file.c Steven Whitehouse   2006-11-30  772  =

00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  773  stat=
ic inline bool should_fault_in_pages(ssize_t ret, struct iov_iter *i,
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  774  				=
	 size_t *prev_count,
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  775  				=
	 size_t *window_size)
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  776  {
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  777  	siz=
e_t count =3D iov_iter_count(i);
165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  778  	siz=
e_t size, offs;
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  779  =

00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  780  	if =
(likely(!count))
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  781  		re=
turn false;
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  782  	if =
(ret <=3D 0 && ret !=3D -EFAULT)
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  783  		re=
turn false;
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  784  	if =
(!iter_is_iovec(i))
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  785  		re=
turn false;
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  786  =

165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  787  	siz=
e =3D PAGE_SIZE;
165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  788  	off=
s =3D offset_in_page(i->iov[0].iov_base + i->iov_offset);
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  789  	if =
(*prev_count !=3D count || !*window_size) {
165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  790  		in=
t nr_dirtied;
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  791  =

165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  792  		si=
ze =3D ALIGN(offs + count, PAGE_SIZE);
165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  793  		si=
ze =3D min_t(size_t, size, SZ_1M);
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  794  		nr=
_dirtied =3D max(current->nr_dirtied_pause -
165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  795  				=
 current->nr_dirtied, 8);
165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07 @796  		si=
ze =3D min(size, nr_dirtied << PAGE_SHIFT);
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  797  	}
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  798  =

00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  799  	*pr=
ev_count =3D count;
165d142ffacdef fs/gfs2/file.c     Andreas Gruenbacher 2022-03-07  800  	*wi=
ndow_size =3D size - offs;
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  801  	ret=
urn true;
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  802  }
00bfe02f479688 fs/gfs2/file.c     Andreas Gruenbacher 2021-10-18  803  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0141248445124606969==--

