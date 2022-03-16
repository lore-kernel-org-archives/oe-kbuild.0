Content-Type: multipart/mixed; boundary="===============4776442983131580075=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [willy-pagecache:for-next 174/179] fs/nilfs2/inode.c:232 nilfs_dirty_folio() error: uninitialized symbol 'nr_dirty'.
Date: Wed, 16 Mar 2022 23:00:23 +0800
Message-ID: <202203162210.u0O3mmI4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4776442983131580075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   git://git.infradead.org/users/willy/pagecache for-next
head:   223ab4ed54499645015108bfbb3055e0f8c64613
commit: c5abb86e384b80b5b320c73668066e67142c706e [174/179] nilfs: Convert n=
ilfs_set_page_dirty() to nilfs_dirty_folio()
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-m001-20220314 (https://download.01.org/0day-ci/ar=
chive/20220316/202203162210.u0O3mmI4-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/nilfs2/inode.c:232 nilfs_dirty_folio() error: uninitialized symbol 'nr_d=
irty'.

Old smatch warnings:
fs/nilfs2/inode.c:1084 nilfs_fiemap() warn: should 'n << blkbits' be a 64 b=
it type?
fs/nilfs2/inode.c:1097 nilfs_fiemap() warn: should 'n << blkbits' be a 64 b=
it type?
fs/nilfs2/inode.c:1104 nilfs_fiemap() warn: should 'n << blkbits' be a 64 b=
it type?

vim +/nr_dirty +232 fs/nilfs2/inode.c

05fe58fdc10df9e Ryusuke Konishi         2009-04-06  201  =

c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  202) static bool nilfs_=
dirty_folio(struct address_space *mapping,
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  203) 		struct folio *fo=
lio)
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  204  {
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  205) 	struct inode *ino=
de =3D mapping->host;
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  206) 	struct buffer_hea=
d *head;
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  207) 	unsigned int nr_d=
irty;
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  208) 	bool ret =3D file=
map_dirty_folio(mapping, folio);
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  209  =

136e8770cd5d1fe Ryusuke Konishi         2013-05-24  210  	/*
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  211) 	 * The page may n=
ot be locked, eg if called from try_to_unmap_one()
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  212  	 */
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  213) 	spin_lock(&mappin=
g->private_lock);
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  214) 	head =3D folio_bu=
ffers(folio);
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  215) 	if (head) {
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  216) 		struct buffer_he=
ad *bh =3D head;
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  217) =

c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  218) 		nr_dirty =3D 0;
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  219  		do {
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  220  			/* Do not mark =
hole blocks dirty */
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  221  			if (buffer_dirt=
y(bh) || !buffer_mapped(bh))
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  222  				continue;
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  223  =

136e8770cd5d1fe Ryusuke Konishi         2013-05-24  224  			set_buffer_dirt=
y(bh);
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  225  			nr_dirty++;
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  226  		} while (bh =3D =
bh->b_this_page, bh !=3D head);
56d7acc792c0d98 Andreas Rohner          2014-09-25  227  	} else if (ret) {
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  228) 		nr_dirty =3D 1 <=
< (PAGE_SHIFT - inode->i_blkbits);
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  229) 	}
c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09  230) 	spin_unlock(&mapp=
ing->private_lock);
56d7acc792c0d98 Andreas Rohner          2014-09-25  231  =

c5abb86e384b80b Matthew Wilcox (Oracle  2022-02-09 @232) 	if (nr_dirty)
bcbc8c648d6cc88 Ryusuke Konishi         2010-12-27  233  		nilfs_set_file_d=
irty(inode, nr_dirty);
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  234  	return ret;
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  235  }
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  236  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4776442983131580075==--

