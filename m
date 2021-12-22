Content-Type: multipart/mixed; boundary="===============4663434947509269224=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4363/8895] fs/erofs/data.c:222 erofs_iomap_begin() warn: bitwise AND condition is false here
Date: Wed, 22 Dec 2021 08:07:50 +0800
Message-ID: <202112220726.HtBSPET6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4663434947509269224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christoph Hellwig <hch@lst.de>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2850c2311ef4bf30ae8dd8927f0f66b026ff08fb
commit: de2051147771017a61b62c02fd4e883c9b07712d [4363/8895] fsdax: shift p=
artition offset handling into the file systems
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001-20211213 (https://download.01.org/0day-ci/ar=
chive/20211222/202112220726.HtBSPET6-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/erofs/data.c:222 erofs_iomap_begin() warn: bitwise AND condition is fals=
e here

vim +222 fs/erofs/data.c

dfeab2e95a75a4 Gao Xiang         2021-10-14  198  =

a08e67a0280215 Huang Jianan      2021-08-05  199  static int erofs_iomap_be=
gin(struct inode *inode, loff_t offset, loff_t length,
a08e67a0280215 Huang Jianan      2021-08-05  200  		unsigned int flags, str=
uct iomap *iomap, struct iomap *srcmap)
a08e67a0280215 Huang Jianan      2021-08-05  201  {
a08e67a0280215 Huang Jianan      2021-08-05  202  	int ret;
a08e67a0280215 Huang Jianan      2021-08-05  203  	struct erofs_map_blocks =
map;
dfeab2e95a75a4 Gao Xiang         2021-10-14  204  	struct erofs_map_dev mde=
v;
a08e67a0280215 Huang Jianan      2021-08-05  205  =

a08e67a0280215 Huang Jianan      2021-08-05  206  	map.m_la =3D offset;
a08e67a0280215 Huang Jianan      2021-08-05  207  	map.m_llen =3D length;
a08e67a0280215 Huang Jianan      2021-08-05  208  =

c5aa903a59db27 Gao Xiang         2021-08-20  209  	ret =3D erofs_map_blocks=
(inode, &map, EROFS_GET_BLOCKS_RAW);
a08e67a0280215 Huang Jianan      2021-08-05  210  	if (ret < 0)
a08e67a0280215 Huang Jianan      2021-08-05  211  		return ret;
a08e67a0280215 Huang Jianan      2021-08-05  212  =

dfeab2e95a75a4 Gao Xiang         2021-10-14  213  	mdev =3D (struct erofs_m=
ap_dev) {
dfeab2e95a75a4 Gao Xiang         2021-10-14  214  		.m_deviceid =3D map.m_d=
eviceid,
dfeab2e95a75a4 Gao Xiang         2021-10-14  215  		.m_pa =3D map.m_pa,
dfeab2e95a75a4 Gao Xiang         2021-10-14  216  	};
dfeab2e95a75a4 Gao Xiang         2021-10-14  217  	ret =3D erofs_map_dev(in=
ode->i_sb, &mdev);
dfeab2e95a75a4 Gao Xiang         2021-10-14  218  	if (ret)
dfeab2e95a75a4 Gao Xiang         2021-10-14  219  		return ret;
dfeab2e95a75a4 Gao Xiang         2021-10-14  220  =

a08e67a0280215 Huang Jianan      2021-08-05  221  	iomap->offset =3D map.m_=
la;
de205114777101 Christoph Hellwig 2021-11-29 @222  	if (flags & IOMAP_DAX) {
de205114777101 Christoph Hellwig 2021-11-29  223  		iomap->dax_dev =3D mdev=
.m_daxdev;
de205114777101 Christoph Hellwig 2021-11-29  224  		iomap->offset +=3D mdev=
.m_dax_part_off;
de205114777101 Christoph Hellwig 2021-11-29  225  	} else {
de205114777101 Christoph Hellwig 2021-11-29  226  		iomap->bdev =3D mdev.m_=
bdev;
de205114777101 Christoph Hellwig 2021-11-29  227  	}
a08e67a0280215 Huang Jianan      2021-08-05  228  	iomap->length =3D map.m_=
llen;
a08e67a0280215 Huang Jianan      2021-08-05  229  	iomap->flags =3D 0;
771c994ea51f57 Gao Xiang         2021-08-05  230  	iomap->private =3D NULL;
a08e67a0280215 Huang Jianan      2021-08-05  231  =

a08e67a0280215 Huang Jianan      2021-08-05  232  	if (!(map.m_flags & EROF=
S_MAP_MAPPED)) {
a08e67a0280215 Huang Jianan      2021-08-05  233  		iomap->type =3D IOMAP_H=
OLE;
a08e67a0280215 Huang Jianan      2021-08-05  234  		iomap->addr =3D IOMAP_N=
ULL_ADDR;
a08e67a0280215 Huang Jianan      2021-08-05  235  		if (!iomap->length)
a08e67a0280215 Huang Jianan      2021-08-05  236  			iomap->length =3D leng=
th;
a08e67a0280215 Huang Jianan      2021-08-05  237  		return 0;
a08e67a0280215 Huang Jianan      2021-08-05  238  	}
a08e67a0280215 Huang Jianan      2021-08-05  239  =

a08e67a0280215 Huang Jianan      2021-08-05  240  	if (map.m_flags & EROFS_=
MAP_META) {
771c994ea51f57 Gao Xiang         2021-08-05  241  		struct page *ipage;
771c994ea51f57 Gao Xiang         2021-08-05  242  =

771c994ea51f57 Gao Xiang         2021-08-05  243  		iomap->type =3D IOMAP_I=
NLINE;
771c994ea51f57 Gao Xiang         2021-08-05  244  		ipage =3D erofs_get_met=
a_page(inode->i_sb,
dfeab2e95a75a4 Gao Xiang         2021-10-14  245  					    erofs_blknr(mdev=
.m_pa));
771c994ea51f57 Gao Xiang         2021-08-05  246  		if (IS_ERR(ipage))
771c994ea51f57 Gao Xiang         2021-08-05  247  			return PTR_ERR(ipage);
771c994ea51f57 Gao Xiang         2021-08-05  248  		iomap->inline_data =3D =
page_address(ipage) +
dfeab2e95a75a4 Gao Xiang         2021-10-14  249  					erofs_blkoff(mdev.m_=
pa);
771c994ea51f57 Gao Xiang         2021-08-05  250  		iomap->private =3D ipag=
e;
771c994ea51f57 Gao Xiang         2021-08-05  251  	} else {
a08e67a0280215 Huang Jianan      2021-08-05  252  		iomap->type =3D IOMAP_M=
APPED;
dfeab2e95a75a4 Gao Xiang         2021-10-14  253  		iomap->addr =3D mdev.m_=
pa;
771c994ea51f57 Gao Xiang         2021-08-05  254  	}
a08e67a0280215 Huang Jianan      2021-08-05  255  	return 0;
a08e67a0280215 Huang Jianan      2021-08-05  256  }
a08e67a0280215 Huang Jianan      2021-08-05  257  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4663434947509269224==--

