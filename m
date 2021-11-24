Content-Type: multipart/mixed; boundary="===============4529226139101343166=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/damon/dbgfs.c:525 dbgfs_init_regions_write() warn: passing a valid pointer to 'PTR_ERR'
Date: Wed, 24 Nov 2021 23:12:01 +0800
Message-ID: <202111242346.HYZ46afv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4529226139101343166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: 90bebce9fcd6488ba6b010af3a16a0a0d7e44cb6 mm/damon/dbgfs: allow user=
s to set initial monitoring target regions
date:   3 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: nios2-randconfig-m031-20211123 (https://download.01.org/0day-ci/arc=
hive/20211124/202111242346.HYZ46afv-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
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


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4529226139101343166==--

