Content-Type: multipart/mixed; boundary="===============4856698225469589179=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [willy-pagecache:for-next 44/79] fs/cramfs/inode.c:889:25: warning: use of NULL where non-null expected [CWE-476]
Date: Sun, 10 Jul 2022 22:56:29 +0800
Message-ID: <202207102236.ryHEZn5P-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4856698225469589179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/cramfs=
/inode.c:889:25: warning: use of NULL where non-null expected [CWE-476] [-W=
analyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   git://git.infradead.org/users/willy/pagecache for-next
head:   03b33c09ea22fa89dd204ad0a2058e512c691b9f
commit: 0ba02b002594cc1809da3a05a44bb5b9654448f6 [44/79] cramfs: read_mappi=
ng_page() is synchronous
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-c002-20220707 (https://download.01.org/0day-ci/archi=
ve/20220710/202207102236.ryHEZn5P-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add willy-pagecache git://git.infradead.org/users/willy/=
pagecache
        git fetch --no-tags willy-pagecache for-next
        git checkout 0ba02b002594cc1809da3a05a44bb5b9654448f6
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   fs/cramfs/inode.c: In function 'cramfs_read_folio':
>> fs/cramfs/inode.c:889:25: warning: use of NULL where non-null expected [=
CWE-476] [-Wanalyzer-null-argument]
     889 |                         memcpy(pgdata,
         |                         ^~~~~~~~~~~~~~
     890 |                                cramfs_read(sb, block_start, bloc=
k_len),
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
     891 |                                block_len);
         |                                ~~~~~~~~~~
     'cramfs_read_folio': event 1
       |
       |  808 | static int cramfs_read_folio(struct file *file, struct foli=
o *folio)
       |      |            ^~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'cramfs_read_folio'
       |
     'cramfs_read_folio': event 2
       |
       |include/linux/compiler.h:56:26:
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __V=
A_ARGS__) ) )
       |      |                          ^
       |      |                          |
       |      |                          (2) following 'true' branch...
   fs/cramfs/inode.c:820:9: note: in expansion of macro 'if'
       |  820 |         if (page->index < maxblock) {
       |      |         ^~
       |
     'cramfs_read_folio': events 3-4
       |
       |  278 |                 return cramfs_blkdev_read(sb, offset, len);
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (4) calling 'cramfs_blkdev_read' fro=
m 'cramfs_read_folio'
       |......
       |  821 |                 struct super_block *sb =3D inode->i_sb;
       |      |                                     ^~
       |      |                                     |
       |      |                                     (3) ...to here
       |
       +--> 'cramfs_blkdev_read': event 5
              |
              |  182 | static void *cramfs_blkdev_read(struct super_block *=
sb, unsigned int offset,
              |      |              ^~~~~~~~~~~~~~~~~~
              |      |              |
              |      |              (5) entry to 'cramfs_blkdev_read'
              |
            'cramfs_blkdev_read': event 6
              |
              |include/linux/compiler.h:56:26:
              |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond ,=
 ## __VA_ARGS__) ) )
              |      |                          ^
              |      |                          |
              |      |                          (6) following 'false' branc=
h...
   fs/cramfs/inode.c:192:9: note: in expansion of macro 'if'
              |  192 |         if (!len)
              |      |         ^~
              |
            'cramfs_blkdev_read': events 7-8
              |
              |  194 |         blocknr =3D offset >> PAGE_SHIFT;
              |......
              |  198 |         for (i =3D 0; i < READ_BUFFERS; i++) {
              |      |                       ~
              |      |                       |
              |      |                       (8) following 'true' branch (w=
hen 'i !=3D 2')...
              |
            'cramfs_blkdev_read': event 9
              |
              |  201 |                 if (buffer_dev[i] !=3D sb)
              |      |                     ~~~~~~~~~~^~~
              |      |                               |
              |      |                               (9) ...to here
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if=
_var'
              |   58 | #define __trace_if_var(cond) (__builtin_constant_p(c=
ond) ? (cond) : __trace_if_value(cond))
              |      |                                                    ^=
~~~
   fs/cramfs/inode.c:201:17: note: in expansion of macro 'if'
              |  201 |                 if (buffer_dev[i] !=3D sb)
              |      |                 ^~
              |
            'cramfs_blkdev_read': event 10
              |
              |include/linux/compiler.h:58:30:
              |   58 | #define __trace_if_var(cond) (__builtin_constant_p(c=
ond) ? (cond) : __trace_if_value(cond))
              |      |                              ^
              |      |                              |
              |      |                              (10) following 'true' b=
ranch...
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
              |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond ,=
 ## __VA_ARGS__) ) )
              |      |                            ^~~~~~~~~~~~~~
   fs/cramfs/inode.c:207:17: note: in expansion of macro 'if'
              |  207 |                 if (blk_offset > BUFFER_SIZE ||
              |      |                 ^~
              |
            'cramfs_blkdev_read': event 11
              |
              |include/linux/compiler.h:56:44:
              |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond ,=
 ## __VA_ARGS__) ) )
              |      |                                            ^
              |      |                                            |
              |      |                                            (11) ...t=
o here
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if=
_var'
              |   58 | #define __trace_if_var(cond) (__builtin_constant_p(c=
ond) ? (cond) : __trace_if_value(cond))
              |      |                                                     =
        ^~~~

vim +889 fs/cramfs/inode.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  807  =

5aab331ad68f7c Matthew Wilcox (Oracle  2022-04-29  808) static int cramfs_r=
ead_folio(struct file *file, struct folio *folio)
^1da177e4c3f41 Linus Torvalds          2005-04-16  809  {
5aab331ad68f7c Matthew Wilcox (Oracle  2022-04-29  810) 	struct page *page =
=3D &folio->page;
^1da177e4c3f41 Linus Torvalds          2005-04-16  811  	struct inode *inod=
e =3D page->mapping->host;
98310e581e0985 David VomLehn           2009-04-02  812  	u32 maxblock;
98310e581e0985 David VomLehn           2009-04-02  813  	int bytes_filled;
^1da177e4c3f41 Linus Torvalds          2005-04-16  814  	void *pgdata;
^1da177e4c3f41 Linus Torvalds          2005-04-16  815  =

09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  816  	maxblock =3D (inod=
e->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds          2005-04-16  817  	bytes_filled =3D 0;
98310e581e0985 David VomLehn           2009-04-02  818  	pgdata =3D kmap(pa=
ge);
98310e581e0985 David VomLehn           2009-04-02  819  =

^1da177e4c3f41 Linus Torvalds          2005-04-16  820  	if (page->index < =
maxblock) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  821  		struct super_bloc=
k *sb =3D inode->i_sb;
^1da177e4c3f41 Linus Torvalds          2005-04-16  822  		u32 blkptr_offset=
 =3D OFFSET(inode) + page->index * 4;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  823  		u32 block_ptr, bl=
ock_start, block_len;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  824  		bool uncompressed=
, direct;
^1da177e4c3f41 Linus Torvalds          2005-04-16  825  =

353ab6e97b8f20 Ingo Molnar             2006-03-26  826  		mutex_lock(&read_=
mutex);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  827  		block_ptr =3D *(u=
32 *) cramfs_read(sb, blkptr_offset, 4);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  828  		uncompressed =3D =
(block_ptr & CRAMFS_BLK_FLAG_UNCOMPRESSED);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  829  		direct =3D (block=
_ptr & CRAMFS_BLK_FLAG_DIRECT_PTR);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  830  		block_ptr &=3D ~C=
RAMFS_BLK_FLAGS;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  831  =

fd4f6f2a78aeae Nicolas Pitre           2017-10-12  832  		if (direct) {
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  833  			/*
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  834  			 * The block poi=
nter is an absolute start pointer,
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  835  			 * shifted by 2 =
bits. The size is included in the
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  836  			 * first 2 bytes=
 of the data block when compressed,
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  837  			 * or PAGE_SIZE =
otherwise.
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  838  			 */
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  839  			block_start =3D =
block_ptr << CRAMFS_BLK_DIRECT_PTR_SHIFT;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  840  			if (uncompressed=
) {
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  841  				block_len =3D P=
AGE_SIZE;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  842  				/* if last bloc=
k: cap to file length */
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  843  				if (page->index=
 =3D=3D maxblock - 1)
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  844  					block_len =3D
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  845  						offset_in_pag=
e(inode->i_size);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  846  			} else {
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  847  				block_len =3D *=
(u16 *)
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  848  					cramfs_read(sb=
, block_start, 2);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  849  				block_start +=
=3D 2;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  850  			}
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  851  		} else {
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  852  			/*
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  853  			 * The block poi=
nter indicates one past the end of
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  854  			 * the current b=
lock (start of next block). If this
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  855  			 * is the first =
block then it starts where the block
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  856  			 * pointer table=
 ends, otherwise its start comes
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  857  			 * from the prev=
ious block's pointer.
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  858  			 */
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  859  			block_start =3D =
OFFSET(inode) + maxblock * 4;
^1da177e4c3f41 Linus Torvalds          2005-04-16  860  			if (page->index)
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  861  				block_start =3D=
 *(u32 *)
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  862  					cramfs_read(sb=
, blkptr_offset - 4, 4);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  863  			/* Beware... pre=
vious ptr might be a direct ptr */
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  864  			if (unlikely(blo=
ck_start & CRAMFS_BLK_FLAG_DIRECT_PTR)) {
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  865  				/* See comments=
 on earlier code. */
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  866  				u32 prev_start =
=3D block_start;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  867  				block_start =3D=
 prev_start & ~CRAMFS_BLK_FLAGS;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  868  				block_start <<=
=3D CRAMFS_BLK_DIRECT_PTR_SHIFT;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  869  				if (prev_start =
& CRAMFS_BLK_FLAG_UNCOMPRESSED) {
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  870  					block_start +=
=3D PAGE_SIZE;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  871  				} else {
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  872  					block_len =3D =
*(u16 *)
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  873  						cramfs_read(s=
b, block_start, 2);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  874  					block_start +=
=3D 2 + block_len;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  875  				}
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  876  			}
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  877  			block_start &=3D=
 ~CRAMFS_BLK_FLAGS;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  878  			block_len =3D bl=
ock_ptr - block_start;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  879  		}
98310e581e0985 David VomLehn           2009-04-02  880  =

fd4f6f2a78aeae Nicolas Pitre           2017-10-12  881  		if (block_len =3D=
=3D 0)
^1da177e4c3f41 Linus Torvalds          2005-04-16  882  			; /* hole */
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  883  		else if (unlikely=
(block_len > 2*PAGE_SIZE ||
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  884  				  (uncompressed=
 && block_len > PAGE_SIZE))) {
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  885  			mutex_unlock(&re=
ad_mutex);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  886  			pr_err("bad data=
 blocksize %u\n", block_len);
98310e581e0985 David VomLehn           2009-04-02  887  			goto err;
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  888  		} else if (uncomp=
ressed) {
fd4f6f2a78aeae Nicolas Pitre           2017-10-12 @889  			memcpy(pgdata,
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  890  			       cramfs_re=
ad(sb, block_start, block_len),
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  891  			       block_len=
);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  892  			bytes_filled =3D=
 block_len;
98310e581e0985 David VomLehn           2009-04-02  893  		} else {
^1da177e4c3f41 Linus Torvalds          2005-04-16  894  			bytes_filled =3D=
 cramfs_uncompress_block(pgdata,
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  895  				 PAGE_SIZE,
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  896  				 cramfs_read(sb=
, block_start, block_len),
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  897  				 block_len);
fd4f6f2a78aeae Nicolas Pitre           2017-10-12  898  		}
353ab6e97b8f20 Ingo Molnar             2006-03-26  899  		mutex_unlock(&rea=
d_mutex);
98310e581e0985 David VomLehn           2009-04-02  900  		if (unlikely(byte=
s_filled < 0))
98310e581e0985 David VomLehn           2009-04-02  901  			goto err;
^1da177e4c3f41 Linus Torvalds          2005-04-16  902  	}
98310e581e0985 David VomLehn           2009-04-02  903  =

09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  904  	memset(pgdata + by=
tes_filled, 0, PAGE_SIZE - bytes_filled);
^1da177e4c3f41 Linus Torvalds          2005-04-16  905  	flush_dcache_page(=
page);
98310e581e0985 David VomLehn           2009-04-02  906  	kunmap(page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  907  	SetPageUptodate(pa=
ge);
^1da177e4c3f41 Linus Torvalds          2005-04-16  908  	unlock_page(page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  909  	return 0;
98310e581e0985 David VomLehn           2009-04-02  910  =

98310e581e0985 David VomLehn           2009-04-02  911  err:
98310e581e0985 David VomLehn           2009-04-02  912  	kunmap(page);
98310e581e0985 David VomLehn           2009-04-02  913  	ClearPageUptodate(=
page);
98310e581e0985 David VomLehn           2009-04-02  914  	SetPageError(page);
98310e581e0985 David VomLehn           2009-04-02  915  	unlock_page(page);
98310e581e0985 David VomLehn           2009-04-02  916  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  917  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  918  =


:::::: The code@line 889 was first introduced by commit
:::::: fd4f6f2a78aeaebb7094c1bb9b30623d18a86e4c cramfs: implement uncompres=
sed and arbitrary data block positioning

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4856698225469589179==--

