Content-Type: multipart/mixed; boundary="===============5615208212951096809=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/damon/dbgfs.c:525 dbgfs_init_regions_write() warn: passing a valid pointer to 'PTR_ERR'
Date: Sun, 21 Aug 2022 20:09:14 +0800
Message-ID: <202208212035.pgLlMHdc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5615208212951096809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15b3f48a4339e3c16acf18624e2b7f60bc5e9a2c
commit: 90bebce9fcd6488ba6b010af3a16a0a0d7e44cb6 mm/damon/dbgfs: allow user=
s to set initial monitoring target regions
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: parisc-randconfig-m031-20220821 (https://download.01.org/0day-ci/ar=
chive/20220821/202208212035.pgLlMHdc-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/damon/dbgfs.c:525 dbgfs_init_regions_write() warn: passing a valid point=
er to 'PTR_ERR'

vim +/PTR_ERR +525 mm/damon/dbgfs.c

90bebce9fcd648 SeongJae Park 2021-11-05  513  =

90bebce9fcd648 SeongJae Park 2021-11-05  514  static ssize_t dbgfs_init_reg=
ions_write(struct file *file,
90bebce9fcd648 SeongJae Park 2021-11-05  515  					  const char __user *buf=
, size_t count,
90bebce9fcd648 SeongJae Park 2021-11-05  516  					  loff_t *ppos)
90bebce9fcd648 SeongJae Park 2021-11-05  517  {
90bebce9fcd648 SeongJae Park 2021-11-05  518  	struct damon_ctx *ctx =3D fi=
le->private_data;
90bebce9fcd648 SeongJae Park 2021-11-05  519  	char *kbuf;
90bebce9fcd648 SeongJae Park 2021-11-05  520  	ssize_t ret =3D count;
90bebce9fcd648 SeongJae Park 2021-11-05  521  	int err;
90bebce9fcd648 SeongJae Park 2021-11-05  522  =

90bebce9fcd648 SeongJae Park 2021-11-05  523  	kbuf =3D user_input_str(buf,=
 count, ppos);
90bebce9fcd648 SeongJae Park 2021-11-05  524  	if (IS_ERR(kbuf))
90bebce9fcd648 SeongJae Park 2021-11-05 @525  		return PTR_ERR(kbuf);
90bebce9fcd648 SeongJae Park 2021-11-05  526  =

90bebce9fcd648 SeongJae Park 2021-11-05  527  	mutex_lock(&ctx->kdamond_loc=
k);
90bebce9fcd648 SeongJae Park 2021-11-05  528  	if (ctx->kdamond) {
90bebce9fcd648 SeongJae Park 2021-11-05  529  		ret =3D -EBUSY;
90bebce9fcd648 SeongJae Park 2021-11-05  530  		goto unlock_out;
90bebce9fcd648 SeongJae Park 2021-11-05  531  	}
90bebce9fcd648 SeongJae Park 2021-11-05  532  =

90bebce9fcd648 SeongJae Park 2021-11-05  533  	err =3D set_init_regions(ctx=
, kbuf, ret);
90bebce9fcd648 SeongJae Park 2021-11-05  534  	if (err)
90bebce9fcd648 SeongJae Park 2021-11-05  535  		ret =3D err;
90bebce9fcd648 SeongJae Park 2021-11-05  536  =

90bebce9fcd648 SeongJae Park 2021-11-05  537  unlock_out:
90bebce9fcd648 SeongJae Park 2021-11-05  538  	mutex_unlock(&ctx->kdamond_l=
ock);
90bebce9fcd648 SeongJae Park 2021-11-05  539  	kfree(kbuf);
90bebce9fcd648 SeongJae Park 2021-11-05  540  	return ret;
90bebce9fcd648 SeongJae Park 2021-11-05  541  }
90bebce9fcd648 SeongJae Park 2021-11-05  542  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5615208212951096809==--

