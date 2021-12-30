Content-Type: multipart/mixed; boundary="===============3176168426088144462=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/5] erofs: use meta buffers for super operations
Date: Fri, 31 Dec 2021 06:49:58 +0800
Message-ID: <202112310650.TDDinvVT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3176168426088144462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211229041405.45921-4-hsiangkao@linux.alibaba.com>
References: <20211229041405.45921-4-hsiangkao@linux.alibaba.com>
TO: Gao Xiang <hsiangkao@linux.alibaba.com>
TO: linux-erofs(a)lists.ozlabs.org
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
TO: Liu Bo <bo.liu@linux.alibaba.com>
CC: LKML <linux-kernel@vger.kernel.org>
CC: Gao Xiang <hsiangkao@linux.alibaba.com>

Hi Gao,

I love your patch! Perhaps something to improve:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on next-20211224]
[cannot apply to v5.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gao-Xiang/erofs-get-rid-of=
-erofs_get_meta_page/20211229-121538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev=
-test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20211230 (https://download.01.org/0day-ci/ar=
chive/20211231/202112310650.TDDinvVT-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/erofs/super.c:153 erofs_read_metadata() warn: possible memory leak of 'b=
uffer'

vim +/buffer +153 fs/erofs/super.c

5efe5137f05bbb drivers/staging/erofs/super.c Gao Xiang 2019-06-13  125  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  126  #if=
def CONFIG_EROFS_FS_ZIP
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  127  /* =
read variable-sized metadata, offset will be aligned by 4-byte */
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29  128  sta=
tic void *erofs_read_metadata(struct super_block *sb, struct erofs_buf *buf,
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  129  			=
	 erofs_off_t *offset, int *lengthp)
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  130  {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  131  	u8=
 *buffer, *ptr;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  132  	in=
t len, i, cnt;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  133  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  134  	*o=
ffset =3D round_up(*offset, 4);
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29  135  	pt=
r =3D erofs_read_metabuf(buf, sb, erofs_blknr(*offset), EROFS_KMAP);
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29  136  	if=
 (IS_ERR(ptr))
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29  137  		r=
eturn ptr;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  138  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  139  	le=
n =3D le16_to_cpu(*(__le16 *)&ptr[erofs_blkoff(*offset)]);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  140  	if=
 (!len)
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  141  		l=
en =3D U16_MAX + 1;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  142  	bu=
ffer =3D kmalloc(len, GFP_KERNEL);
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29  143  	if=
 (!buffer)
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29  144  		r=
eturn ERR_PTR(-ENOMEM);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  145  	*o=
ffset +=3D sizeof(__le16);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  146  	*l=
engthp =3D len;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  147  =

14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  148  	fo=
r (i =3D 0; i < len; i +=3D cnt) {
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  149  		c=
nt =3D min(EROFS_BLKSIZ - (int)erofs_blkoff(*offset), len - i);
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29  150  		p=
tr =3D erofs_read_metabuf(buf, sb, erofs_blknr(*offset),
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29  151  			=
		 EROFS_KMAP);
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29  152  		i=
f (IS_ERR(ptr))
6477e408d41152 fs/erofs/super.c              Gao Xiang 2021-12-29 @153  			=
return ptr;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  154  		m=
emcpy(buffer + i, ptr + erofs_blkoff(*offset), cnt);
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  155  		*=
offset +=3D cnt;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  156  	}
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  157  	re=
turn buffer;
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  158  }
14373711dd54be fs/erofs/super.c              Gao Xiang 2021-03-29  159  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3176168426088144462==--

