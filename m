Content-Type: multipart/mixed; boundary="===============8151659886713943185=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/damon/dbgfs.c:227 dbgfs_schemes_write() warn: passing a valid pointer to 'PTR_ERR'
Date: Thu, 31 Mar 2022 19:38:09 +0800
Message-ID: <202203311938.cvfJ0J5j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8151659886713943185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: af122dd8f3c0099349bc98ff69f0d90efd8b149f mm/damon/dbgfs: support DA=
MON-based Operation Schemes
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: arc-randconfig-m031-20220331 (https://download.01.org/0day-ci/archi=
ve/20220331/202203311938.cvfJ0J5j-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/damon/dbgfs.c:227 dbgfs_schemes_write() warn: passing a valid pointer to=
 'PTR_ERR'

vim +/PTR_ERR +227 mm/damon/dbgfs.c

af122dd8f3c009 SeongJae Park 2021-11-05  215  =

af122dd8f3c009 SeongJae Park 2021-11-05  216  static ssize_t dbgfs_schemes_=
write(struct file *file, const char __user *buf,
af122dd8f3c009 SeongJae Park 2021-11-05  217  		size_t count, loff_t *ppos)
af122dd8f3c009 SeongJae Park 2021-11-05  218  {
af122dd8f3c009 SeongJae Park 2021-11-05  219  	struct damon_ctx *ctx =3D fi=
le->private_data;
af122dd8f3c009 SeongJae Park 2021-11-05  220  	char *kbuf;
af122dd8f3c009 SeongJae Park 2021-11-05  221  	struct damos **schemes;
af122dd8f3c009 SeongJae Park 2021-11-05  222  	ssize_t nr_schemes =3D 0, re=
t =3D count;
af122dd8f3c009 SeongJae Park 2021-11-05  223  	int err;
af122dd8f3c009 SeongJae Park 2021-11-05  224  =

af122dd8f3c009 SeongJae Park 2021-11-05  225  	kbuf =3D user_input_str(buf,=
 count, ppos);
af122dd8f3c009 SeongJae Park 2021-11-05  226  	if (IS_ERR(kbuf))
af122dd8f3c009 SeongJae Park 2021-11-05 @227  		return PTR_ERR(kbuf);
af122dd8f3c009 SeongJae Park 2021-11-05  228  =

af122dd8f3c009 SeongJae Park 2021-11-05  229  	schemes =3D str_to_schemes(k=
buf, ret, &nr_schemes);
af122dd8f3c009 SeongJae Park 2021-11-05  230  	if (!schemes) {
af122dd8f3c009 SeongJae Park 2021-11-05  231  		ret =3D -EINVAL;
af122dd8f3c009 SeongJae Park 2021-11-05  232  		goto out;
af122dd8f3c009 SeongJae Park 2021-11-05  233  	}
af122dd8f3c009 SeongJae Park 2021-11-05  234  =

af122dd8f3c009 SeongJae Park 2021-11-05  235  	mutex_lock(&ctx->kdamond_loc=
k);
af122dd8f3c009 SeongJae Park 2021-11-05  236  	if (ctx->kdamond) {
af122dd8f3c009 SeongJae Park 2021-11-05  237  		ret =3D -EBUSY;
af122dd8f3c009 SeongJae Park 2021-11-05  238  		goto unlock_out;
af122dd8f3c009 SeongJae Park 2021-11-05  239  	}
af122dd8f3c009 SeongJae Park 2021-11-05  240  =

af122dd8f3c009 SeongJae Park 2021-11-05  241  	err =3D damon_set_schemes(ct=
x, schemes, nr_schemes);
af122dd8f3c009 SeongJae Park 2021-11-05  242  	if (err)
af122dd8f3c009 SeongJae Park 2021-11-05  243  		ret =3D err;
af122dd8f3c009 SeongJae Park 2021-11-05  244  	else
af122dd8f3c009 SeongJae Park 2021-11-05  245  		nr_schemes =3D 0;
af122dd8f3c009 SeongJae Park 2021-11-05  246  unlock_out:
af122dd8f3c009 SeongJae Park 2021-11-05  247  	mutex_unlock(&ctx->kdamond_l=
ock);
af122dd8f3c009 SeongJae Park 2021-11-05  248  	free_schemes_arr(schemes, nr=
_schemes);
af122dd8f3c009 SeongJae Park 2021-11-05  249  out:
af122dd8f3c009 SeongJae Park 2021-11-05  250  	kfree(kbuf);
af122dd8f3c009 SeongJae Park 2021-11-05  251  	return ret;
af122dd8f3c009 SeongJae Park 2021-11-05  252  }
af122dd8f3c009 SeongJae Park 2021-11-05  253  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8151659886713943185==--

