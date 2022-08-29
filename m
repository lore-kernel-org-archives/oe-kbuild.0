Content-Type: multipart/mixed; boundary="===============4614548714768615071=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] fs/ufs: Replace kmap() with kmap_local_page()
Date: Mon, 29 Aug 2022 15:55:17 +0800
Message-ID: <202208291547.BmAKnrgu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4614548714768615071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/ufs/di=
r.c:475:23: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wan=
alyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220822144420.7442-1-fmdefrancesco@gmail.com>
References: <20220822144420.7442-1-fmdefrancesco@gmail.com>
TO: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
TO: Evgeniy Dushistov <dushistov@mail.ru>
TO: linux-kernel(a)vger.kernel.org
CC: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
CC: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>

Hi "Fabio,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc2 next-20220826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco=
/fs-ufs-Replace-kmap-with-kmap_local_page/20220822-224554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
1c23f9e627a7b412978b4e852793c5e3c3efc555
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20220824 (https://download.01.org/0day-ci/archi=
ve/20220829/202208291547.BmAKnrgu-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/763327c2d5b03a56937=
b79cd2e8e9e44843c5de8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Fabio-M-De-Francesco/fs-ufs-Replac=
e-kmap-with-kmap_local_page/20220822-224554
        git checkout 763327c2d5b03a56937b79cd2e8e9e44843c5de8
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   fs/ufs/dir.c: In function 'ufs_readdir':
>> fs/ufs/dir.c:475:23: warning: use of uninitialized value '<unknown>' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]
     475 |                 char *kaddr, *limit;
         |                       ^~~~~
     'ufs_readdir': event 1
       |
       |  471 |         if (pos > inode->i_size - UFS_DIR_REC_LEN(1))
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |
     'ufs_readdir': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'ufs_readdir': events 3-5
       |
       |  474 |         for ( ; n < npages; n++, offset =3D 0) {
       |      |                 ~~^~~~~~~~
       |      |                   |
       |      |                   (3) following 'true' branch...
       |  475 |                 char *kaddr, *limit;
       |      |                 ~~~~  ~~~~~
       |      |                 |     |
       |      |                 |     (5) use of uninitialized value '<unkn=
own>' here
       |      |                 (4) ...to here
       |
   fs/ufs/dir.c: In function 'ufs_empty_dir':
   fs/ufs/dir.c:626:15: warning: use of uninitialized value '<unknown>' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]
     626 |         void *page_addr;
         |               ^~~~~~~~~
     'ufs_empty_dir': event 1
       |
       |  626 |         void *page_addr;
       |      |               ^~~~~~~~~
       |      |               |
       |      |               (1) use of uninitialized value '<unknown>' he=
re
       |

vim +475 fs/ufs/dir.c

b71034e5e67d15 Evgeniy Dushistov     2006-06-25  451  =

b71034e5e67d15 Evgeniy Dushistov     2006-06-25  452  =

b71034e5e67d15 Evgeniy Dushistov     2006-06-25  453  /*
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  454   * This is blatantly =
stolen from ext2fs
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  455   */
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  456  static int
80886298c07234 Al Viro               2013-05-15  457  ufs_readdir(struct fi=
le *file, struct dir_context *ctx)
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  458  {
80886298c07234 Al Viro               2013-05-15  459  	loff_t pos =3D ctx->=
pos;
80886298c07234 Al Viro               2013-05-15  460  	struct inode *inode =
=3D file_inode(file);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  461  	struct super_block *=
sb =3D inode->i_sb;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  462  	unsigned int offset =
=3D pos & ~PAGE_MASK;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  463  	unsigned long n =3D =
pos >> PAGE_SHIFT;
5d754ced150e39 Fabian Frederick      2015-05-24  464  	unsigned long npages=
 =3D dir_pages(inode);
f336953bfdee8d Evgeniy Dushistov     2007-02-08  465  	unsigned chunk_mask =
=3D ~(UFS_SB(sb)->s_uspi->s_dirblksize - 1);
c472c07bfed9c8 Goffredo Baroncelli   2018-02-01  466  	bool need_revalidate=
 =3D !inode_eq_iversion(inode, file->f_version);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  467  	unsigned flags =3D U=
FS_SB(sb)->s_flags;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  468  =

abf5d15fd2e525 Evgeniy Dushistov     2006-06-25  469  	UFSD("BEGIN\n");
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  470  =

b71034e5e67d15 Evgeniy Dushistov     2006-06-25  471  	if (pos > inode->i_s=
ize - UFS_DIR_REC_LEN(1))
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  472  		return 0;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  473  =

b71034e5e67d15 Evgeniy Dushistov     2006-06-25  474  	for ( ; n < npages; =
n++, offset =3D 0) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25 @475  		char *kaddr, *limit;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  476  		struct ufs_dir_entr=
y *de;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  477  =

763327c2d5b03a Fabio M. De Francesco 2022-08-22  478  		struct page *page =
=3D ufs_get_page(inode, n, (void **)&kaddr);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  479  =

b71034e5e67d15 Evgeniy Dushistov     2006-06-25  480  		if (IS_ERR(page)) {
9746077a71d01b Harvey Harrison       2008-04-28  481  			ufs_error(sb, __fu=
nc__,
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  482  				  "bad page in #%=
lu",
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  483  				  inode->i_ino);
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  484  			ctx->pos +=3D PAGE=
_SIZE - offset;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  485  			return -EIO;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  486  		}
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  487  		if (unlikely(need_r=
evalidate)) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  488  			if (offset) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  489  				offset =3D ufs_va=
lidate_entry(sb, kaddr, offset, chunk_mask);
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  490  				ctx->pos =3D (n<<=
PAGE_SHIFT) + offset;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  491  			}
bb8c2d66bc6f7d Jeff Layton           2017-12-11  492  			file->f_version =
=3D inode_query_iversion(inode);
bb8c2d66bc6f7d Jeff Layton           2017-12-11  493  			need_revalidate =
=3D false;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  494  		}
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  495  		de =3D (struct ufs_=
dir_entry *)(kaddr+offset);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  496  		limit =3D kaddr + u=
fs_last_byte(inode, n) - UFS_DIR_REC_LEN(1);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  497  		for ( ;(char*)de <=
=3D limit; de =3D ufs_next_entry(sb, de)) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  498  			if (de->d_ino) {
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  499  				unsigned char d_t=
ype =3D DT_UNKNOWN;
^1da177e4c3f41 Linus Torvalds        2005-04-16  500  =

abf5d15fd2e525 Evgeniy Dushistov     2006-06-25  501  				UFSD("filldir(%s,=
%u)\n", de->d_name,
abf5d15fd2e525 Evgeniy Dushistov     2006-06-25  502  				      fs32_to_cpu=
(sb, de->d_ino));
abf5d15fd2e525 Evgeniy Dushistov     2006-06-25  503  				UFSD("namlen %u\n=
", ufs_get_de_namlen(sb, de));
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  504  =

b71034e5e67d15 Evgeniy Dushistov     2006-06-25  505  				if ((flags & UFS_=
DE_MASK) =3D=3D UFS_DE_44BSD)
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  506  					d_type =3D de->d=
_u.d_44.d_type;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  507  =

80886298c07234 Al Viro               2013-05-15  508  				if (!dir_emit(ctx=
, de->d_name,
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  509  					       ufs_get_d=
e_namlen(sb, de),
80886298c07234 Al Viro               2013-05-15  510  					       fs32_to_c=
pu(sb, de->d_ino),
80886298c07234 Al Viro               2013-05-15  511  					       d_type)) {
763327c2d5b03a Fabio M. De Francesco 2022-08-22  512  					ufs_put_page(pag=
e, kaddr);
^1da177e4c3f41 Linus Torvalds        2005-04-16  513  					return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  514  				}
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  515  			}
80886298c07234 Al Viro               2013-05-15  516  			ctx->pos +=3D fs16=
_to_cpu(sb, de->d_reclen);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  517  		}
763327c2d5b03a Fabio M. De Francesco 2022-08-22  518  		ufs_put_page(page, =
kaddr);
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  519  	}
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  520  	return 0;
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  521  }
b71034e5e67d15 Evgeniy Dushistov     2006-06-25  522  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4614548714768615071==--

