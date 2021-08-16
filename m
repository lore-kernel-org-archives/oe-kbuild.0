Content-Type: multipart/mixed; boundary="===============3684494492774289635=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/erofs/super.c:149 erofs_read_metadata() error: buffer overflow 'ptr' 4096 <= 8191
Date: Mon, 16 Aug 2021 08:46:00 +0800
Message-ID: <202108160857.SbJEiywu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3684494492774289635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Gao Xiang <hsiangkao@redhat.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ecf93431963a95c0f475921101bedc0dd62ec96d
commit: 14373711dd54be8a84e2f4f624bc58787f80cfbd erofs: add on-disk compres=
sion configurations
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-m031-20210816 (attached as .config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/erofs/super.c:149 erofs_read_metadata() error: buffer overflow 'ptr' 409=
6 <=3D 8191
fs/erofs/super.c:149 erofs_read_metadata() error: buffer overflow 'ptr' 409=
6 <=3D 8191
fs/erofs/super.c:149 erofs_read_metadata() error: buffer overflow 'ptr' 409=
6 <=3D 8191

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

--===============3684494492774289635==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Tdo9fWgoHV6sBJmhGVtOzf8DvbRkmAGnAQA=
--===============3684494492774289635==--

