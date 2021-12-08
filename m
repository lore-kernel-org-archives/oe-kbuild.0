Content-Type: multipart/mixed; boundary="===============7380912719313989055=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/erofs/super.c:149 erofs_read_metadata() error: buffer overflow 'ptr' 4096 <= 8191
Date: Wed, 08 Dec 2021 18:58:15 +0800
Message-ID: <202112081732.7p50rsrC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7380912719313989055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Gao Xiang <hsiangkao@redhat.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 14373711dd54be8a84e2f4f624bc58787f80cfbd erofs: add on-disk compres=
sion configurations
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: arc-randconfig-m031-20211208 (https://download.01.org/0day-ci/archi=
ve/20211208/202112081732.7p50rsrC-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/erofs/super.c:149 erofs_read_metadata() error: buffer overflow 'ptr' 409=
6 <=3D 8191
fs/erofs/super.c:149 erofs_read_metadata() error: buffer overflow 'ptr' 409=
6 <=3D 8191
fs/erofs/super.c:149 erofs_read_metadata() error: buffer overflow 'ptr' 409=
6 <=3D 8191
fs/erofs/super.c:149 erofs_read_metadata() error: buffer overflow 'ptr' 409=
6 <=3D 8191

Old smatch warnings:
arch/arc/include/asm/thread_info.h:65 current_thread_info() error: uninitia=
lized symbol 'sp'.

vim +/ptr +149 fs/erofs/super.c

5efe5137f05bbb drivers/staging/erofs/super.c Gao Xiang 2019-06-13  124  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  125  #if=
def CONFIG_EROFS_FS_ZIP
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  126  /* =
read variable-sized metadata, offset will be aligned by 4-byte */
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  127  sta=
tic void *erofs_read_metadata(struct super_block *sb, struct page **pagep,
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  128  			=
	 erofs_off_t *offset, int *lengthp)
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  129  {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  130  	st=
ruct page *page =3D *pagep;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  131  	u8=
 *buffer, *ptr;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  132  	in=
t len, i, cnt;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  133  	er=
ofs_blk_t blk;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  134  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  135  	*o=
ffset =3D round_up(*offset, 4);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  136  	bl=
k =3D erofs_blknr(*offset);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  137  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  138  	if=
 (!page || page->index !=3D blk) {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  139  		i=
f (page) {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  140  			=
unlock_page(page);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  141  			=
put_page(page);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  142  		}
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  143  		p=
age =3D erofs_get_meta_page(sb, blk);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  144  		i=
f (IS_ERR(page))
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  145  			=
goto err_nullpage;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  146  	}
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  147  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  148  	pt=
r =3D kmap(page);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29 @149  	le=
n =3D le16_to_cpu(*(__le16 *)&ptr[erofs_blkoff(*offset)]);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  150  	if=
 (!len)
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  151  		l=
en =3D U16_MAX + 1;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  152  	bu=
ffer =3D kmalloc(len, GFP_KERNEL);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  153  	if=
 (!buffer) {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  154  		b=
uffer =3D ERR_PTR(-ENOMEM);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  155  		g=
oto out;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  156  	}
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  157  	*o=
ffset +=3D sizeof(__le16);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  158  	*l=
engthp =3D len;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  159  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  160  	fo=
r (i =3D 0; i < len; i +=3D cnt) {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  161  		c=
nt =3D min(EROFS_BLKSIZ - (int)erofs_blkoff(*offset), len - i);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  162  		b=
lk =3D erofs_blknr(*offset);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  163  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  164  		i=
f (!page || page->index !=3D blk) {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  165  			=
if (page) {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  166  			=
	kunmap(page);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  167  			=
	unlock_page(page);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  168  			=
	put_page(page);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  169  			}
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  170  			=
page =3D erofs_get_meta_page(sb, blk);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  171  			=
if (IS_ERR(page)) {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  172  			=
	kfree(buffer);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  173  			=
	goto err_nullpage;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  174  			}
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  175  			=
ptr =3D kmap(page);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  176  		}
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  177  		m=
emcpy(buffer + i, ptr + erofs_blkoff(*offset), cnt);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  178  		*=
offset +=3D cnt;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  179  	}
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  180  out:
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  181  	ku=
nmap(page);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  182  	*p=
agep =3D page;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  183  	re=
turn buffer;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  184  err=
_nullpage:
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  185  	*p=
agep =3D NULL;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  186  	re=
turn page;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  187  }
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  188  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7380912719313989055==--

