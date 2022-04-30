Content-Type: multipart/mixed; boundary="===============4034694234531138672=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [willy-pagecache:for-next 61/69] fs/ocfs2/aops.c:287 ocfs2_read_folio() warn: variable dereferenced before check 'page' (see line 281)
Date: Sat, 30 Apr 2022 13:11:41 +0800
Message-ID: <202204301341.LV01wtKn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4034694234531138672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   git://git.infradead.org/users/willy/pagecache for-next
head:   00da6d4b7219d455e5f7e8870e4f93aaef4fc0d2
commit: 09869d256e32daa8e71a45af97ba8bfcf84a597c [61/69] ocfs2: Convert ocf=
s2 to read_folio
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: nios2-randconfig-m031-20220428 (https://download.01.org/0day-ci/arc=
hive/20220430/202204301341.LV01wtKn-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ocfs2/aops.c:287 ocfs2_read_folio() warn: variable dereferenced before c=
heck 'page' (see line 281)

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +/page +287 fs/ocfs2/aops.c

6798d35a31c413 Mark Fasheh             2007-09-07  277  =

09869d256e32da Matthew Wilcox (Oracle  2022-04-29  278) static int ocfs2_re=
ad_folio(struct file *file, struct folio *folio)
ccd979bdbce9fb Mark Fasheh             2005-12-15  279  {
09869d256e32da Matthew Wilcox (Oracle  2022-04-29  280) 	struct page *page =
=3D &folio->page;
ccd979bdbce9fb Mark Fasheh             2005-12-15 @281  	struct inode *inod=
e =3D page->mapping->host;
6798d35a31c413 Mark Fasheh             2007-09-07  282  	struct ocfs2_inode=
_info *oi =3D OCFS2_I(inode);
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  283  	loff_t start =3D (=
loff_t)page->index << PAGE_SHIFT;
ccd979bdbce9fb Mark Fasheh             2005-12-15  284  	int ret, unlock =
=3D 1;
ccd979bdbce9fb Mark Fasheh             2005-12-15  285  =

9558156bcf8e47 Tao Ma                  2011-02-22  286  	trace_ocfs2_readpa=
ge((unsigned long long)oi->ip_blkno,
9558156bcf8e47 Tao Ma                  2011-02-22 @287  			     (page ? pag=
e->index : 0));
ccd979bdbce9fb Mark Fasheh             2005-12-15  288  =

e63aecb651ba73 Mark Fasheh             2007-10-18  289  	ret =3D ocfs2_inod=
e_lock_with_page(inode, NULL, 0, page);
ccd979bdbce9fb Mark Fasheh             2005-12-15  290  	if (ret !=3D 0) {
ccd979bdbce9fb Mark Fasheh             2005-12-15  291  		if (ret =3D=3D AO=
P_TRUNCATED_PAGE)
ccd979bdbce9fb Mark Fasheh             2005-12-15  292  			unlock =3D 0;
ccd979bdbce9fb Mark Fasheh             2005-12-15  293  		mlog_errno(ret);
ccd979bdbce9fb Mark Fasheh             2005-12-15  294  		goto out;
ccd979bdbce9fb Mark Fasheh             2005-12-15  295  	}
ccd979bdbce9fb Mark Fasheh             2005-12-15  296  =

6798d35a31c413 Mark Fasheh             2007-09-07  297  	if (down_read_tryl=
ock(&oi->ip_alloc_sem) =3D=3D 0) {
c7e25e6e0b0486 Jan Kara                2011-06-23  298  		/*
c7e25e6e0b0486 Jan Kara                2011-06-23  299  		 * Unlock the pag=
e and cycle ip_alloc_sem so that we don't
c7e25e6e0b0486 Jan Kara                2011-06-23  300  		 * busyloop waiti=
ng for ip_alloc_sem to unlock
c7e25e6e0b0486 Jan Kara                2011-06-23  301  		 */
e9dfc0b2bc4276 Mark Fasheh             2007-05-14  302  		ret =3D AOP_TRUNC=
ATED_PAGE;
c7e25e6e0b0486 Jan Kara                2011-06-23  303  		unlock_page(page);
c7e25e6e0b0486 Jan Kara                2011-06-23  304  		unlock =3D 0;
c7e25e6e0b0486 Jan Kara                2011-06-23  305  		down_read(&oi->ip=
_alloc_sem);
c7e25e6e0b0486 Jan Kara                2011-06-23  306  		up_read(&oi->ip_a=
lloc_sem);
e63aecb651ba73 Mark Fasheh             2007-10-18  307  		goto out_inode_un=
lock;
e9dfc0b2bc4276 Mark Fasheh             2007-05-14  308  	}
ccd979bdbce9fb Mark Fasheh             2005-12-15  309  =

ccd979bdbce9fb Mark Fasheh             2005-12-15  310  	/*
ccd979bdbce9fb Mark Fasheh             2005-12-15  311  	 * i_size might ha=
ve just been updated as we grabed the meta lock.  We
ccd979bdbce9fb Mark Fasheh             2005-12-15  312  	 * might now be di=
scovering a truncate that hit on another node.
352198e3bea3ed Matthew Wilcox (Oracle  2022-04-29  313) 	 * block_read_full=
_folio->get_block freaks out if it is asked to read
ccd979bdbce9fb Mark Fasheh             2005-12-15  314  	 * beyond the end =
of a file, so we check here.  Callers
54cb8821de07f2 Nicholas Piggin         2007-07-19  315  	 * (generic_file_r=
ead, vm_ops->fault) are clever enough to check i_size
ccd979bdbce9fb Mark Fasheh             2005-12-15  316  	 * and notice that=
 the page they just read isn't needed.
ccd979bdbce9fb Mark Fasheh             2005-12-15  317  	 *
ccd979bdbce9fb Mark Fasheh             2005-12-15  318  	 * XXX sys_readahe=
ad() seems to get that wrong?
ccd979bdbce9fb Mark Fasheh             2005-12-15  319  	 */
ccd979bdbce9fb Mark Fasheh             2005-12-15  320  	if (start >=3D i_s=
ize_read(inode)) {
eebd2aa355692a Christoph Lameter       2008-02-04  321  		zero_user(page, 0=
, PAGE_SIZE);
ccd979bdbce9fb Mark Fasheh             2005-12-15  322  		SetPageUptodate(p=
age);
ccd979bdbce9fb Mark Fasheh             2005-12-15  323  		ret =3D 0;
ccd979bdbce9fb Mark Fasheh             2005-12-15  324  		goto out_alloc;
ccd979bdbce9fb Mark Fasheh             2005-12-15  325  	}
ccd979bdbce9fb Mark Fasheh             2005-12-15  326  =

6798d35a31c413 Mark Fasheh             2007-09-07  327  	if (oi->ip_dyn_fea=
tures & OCFS2_INLINE_DATA_FL)
6798d35a31c413 Mark Fasheh             2007-09-07  328  		ret =3D ocfs2_rea=
dpage_inline(inode, page);
6798d35a31c413 Mark Fasheh             2007-09-07  329  	else
352198e3bea3ed Matthew Wilcox (Oracle  2022-04-29  330) 		ret =3D block_rea=
d_full_folio(page_folio(page), ocfs2_get_block);
ccd979bdbce9fb Mark Fasheh             2005-12-15  331  	unlock =3D 0;
ccd979bdbce9fb Mark Fasheh             2005-12-15  332  =

ccd979bdbce9fb Mark Fasheh             2005-12-15  333  out_alloc:
d324cd4c80b9cb piaojun                 2018-04-05  334  	up_read(&oi->ip_al=
loc_sem);
e63aecb651ba73 Mark Fasheh             2007-10-18  335  out_inode_unlock:
e63aecb651ba73 Mark Fasheh             2007-10-18  336  	ocfs2_inode_unlock=
(inode, 0);
ccd979bdbce9fb Mark Fasheh             2005-12-15  337  out:
ccd979bdbce9fb Mark Fasheh             2005-12-15  338  	if (unlock)
ccd979bdbce9fb Mark Fasheh             2005-12-15  339  		unlock_page(page);
ccd979bdbce9fb Mark Fasheh             2005-12-15  340  	return ret;
ccd979bdbce9fb Mark Fasheh             2005-12-15  341  }
ccd979bdbce9fb Mark Fasheh             2005-12-15  342  =


:::::: The code at line 287 was first introduced by commit
:::::: 9558156bcf8e4750d20034e941213273743ed86a ocfs2: Remove mlog(0) from =
fs/ocfs2/aops.c

:::::: TO: Tao Ma <boyu.mt@taobao.com>
:::::: CC: Tao Ma <boyu.mt@taobao.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4034694234531138672==--

