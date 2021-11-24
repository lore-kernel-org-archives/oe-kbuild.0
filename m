Content-Type: multipart/mixed; boundary="===============0288608924276911032=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/damon/dbgfs.c:396 dbgfs_mk_context_write() warn: passing a valid pointer to 'PTR_ERR'
Date: Wed, 24 Nov 2021 18:57:06 +0800
Message-ID: <202111241830.QLGgkn9L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0288608924276911032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sjpark@amazon.de>
CC: Fernand Sieber <sieberf@amazon.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: 75c1c2b53c78bf3b3188ebb7b3508dadbf98bba1 mm/damon/dbgfs: support mu=
ltiple contexts
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: nios2-randconfig-m031-20211123 (https://download.01.org/0day-ci/arc=
hive/20211124/202111241830.QLGgkn9L-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/damon/dbgfs.c:396 dbgfs_mk_context_write() warn: passing a valid pointer=
 to 'PTR_ERR'
mm/damon/dbgfs.c:487 dbgfs_rm_context_write() warn: passing a valid pointer=
 to 'PTR_ERR'

vim +/PTR_ERR +396 mm/damon/dbgfs.c

75c1c2b53c78bf SeongJae Park 2021-09-07  385  =

75c1c2b53c78bf SeongJae Park 2021-09-07  386  static ssize_t dbgfs_mk_conte=
xt_write(struct file *file,
75c1c2b53c78bf SeongJae Park 2021-09-07  387  		const char __user *buf, siz=
e_t count, loff_t *ppos)
75c1c2b53c78bf SeongJae Park 2021-09-07  388  {
75c1c2b53c78bf SeongJae Park 2021-09-07  389  	char *kbuf;
75c1c2b53c78bf SeongJae Park 2021-09-07  390  	char *ctx_name;
75c1c2b53c78bf SeongJae Park 2021-09-07  391  	ssize_t ret =3D count;
75c1c2b53c78bf SeongJae Park 2021-09-07  392  	int err;
75c1c2b53c78bf SeongJae Park 2021-09-07  393  =

75c1c2b53c78bf SeongJae Park 2021-09-07  394  	kbuf =3D user_input_str(buf,=
 count, ppos);
75c1c2b53c78bf SeongJae Park 2021-09-07  395  	if (IS_ERR(kbuf))
75c1c2b53c78bf SeongJae Park 2021-09-07 @396  		return PTR_ERR(kbuf);
75c1c2b53c78bf SeongJae Park 2021-09-07  397  	ctx_name =3D kmalloc(count +=
 1, GFP_KERNEL);
75c1c2b53c78bf SeongJae Park 2021-09-07  398  	if (!ctx_name) {
75c1c2b53c78bf SeongJae Park 2021-09-07  399  		kfree(kbuf);
75c1c2b53c78bf SeongJae Park 2021-09-07  400  		return -ENOMEM;
75c1c2b53c78bf SeongJae Park 2021-09-07  401  	}
75c1c2b53c78bf SeongJae Park 2021-09-07  402  =

75c1c2b53c78bf SeongJae Park 2021-09-07  403  	/* Trim white space */
75c1c2b53c78bf SeongJae Park 2021-09-07  404  	if (sscanf(kbuf, "%s", ctx_n=
ame) !=3D 1) {
75c1c2b53c78bf SeongJae Park 2021-09-07  405  		ret =3D -EINVAL;
75c1c2b53c78bf SeongJae Park 2021-09-07  406  		goto out;
75c1c2b53c78bf SeongJae Park 2021-09-07  407  	}
75c1c2b53c78bf SeongJae Park 2021-09-07  408  =

75c1c2b53c78bf SeongJae Park 2021-09-07  409  	mutex_lock(&damon_dbgfs_lock=
);
75c1c2b53c78bf SeongJae Park 2021-09-07  410  	err =3D dbgfs_mk_context(ctx=
_name);
75c1c2b53c78bf SeongJae Park 2021-09-07  411  	if (err)
75c1c2b53c78bf SeongJae Park 2021-09-07  412  		ret =3D err;
75c1c2b53c78bf SeongJae Park 2021-09-07  413  	mutex_unlock(&damon_dbgfs_lo=
ck);
75c1c2b53c78bf SeongJae Park 2021-09-07  414  =

75c1c2b53c78bf SeongJae Park 2021-09-07  415  out:
75c1c2b53c78bf SeongJae Park 2021-09-07  416  	kfree(kbuf);
75c1c2b53c78bf SeongJae Park 2021-09-07  417  	kfree(ctx_name);
75c1c2b53c78bf SeongJae Park 2021-09-07  418  	return ret;
75c1c2b53c78bf SeongJae Park 2021-09-07  419  }
75c1c2b53c78bf SeongJae Park 2021-09-07  420  =

75c1c2b53c78bf SeongJae Park 2021-09-07  421  /*
75c1c2b53c78bf SeongJae Park 2021-09-07  422   * Remove a context of @name =
and its debugfs directory.
75c1c2b53c78bf SeongJae Park 2021-09-07  423   *
75c1c2b53c78bf SeongJae Park 2021-09-07  424   * This function should be ca=
lled while holding damon_dbgfs_lock.
75c1c2b53c78bf SeongJae Park 2021-09-07  425   *
75c1c2b53c78bf SeongJae Park 2021-09-07  426   * Return 0 on success, negat=
ive error code otherwise.
75c1c2b53c78bf SeongJae Park 2021-09-07  427   */
75c1c2b53c78bf SeongJae Park 2021-09-07  428  static int dbgfs_rm_context(c=
har *name)
75c1c2b53c78bf SeongJae Park 2021-09-07  429  {
75c1c2b53c78bf SeongJae Park 2021-09-07  430  	struct dentry *root, *dir, *=
*new_dirs;
75c1c2b53c78bf SeongJae Park 2021-09-07  431  	struct damon_ctx **new_ctxs;
75c1c2b53c78bf SeongJae Park 2021-09-07  432  	int i, j;
75c1c2b53c78bf SeongJae Park 2021-09-07  433  =

75c1c2b53c78bf SeongJae Park 2021-09-07  434  	if (damon_nr_running_ctxs())
75c1c2b53c78bf SeongJae Park 2021-09-07  435  		return -EBUSY;
75c1c2b53c78bf SeongJae Park 2021-09-07  436  =

75c1c2b53c78bf SeongJae Park 2021-09-07  437  	root =3D dbgfs_dirs[0];
75c1c2b53c78bf SeongJae Park 2021-09-07  438  	if (!root)
75c1c2b53c78bf SeongJae Park 2021-09-07  439  		return -ENOENT;
75c1c2b53c78bf SeongJae Park 2021-09-07  440  =

75c1c2b53c78bf SeongJae Park 2021-09-07  441  	dir =3D debugfs_lookup(name,=
 root);
75c1c2b53c78bf SeongJae Park 2021-09-07  442  	if (!dir)
75c1c2b53c78bf SeongJae Park 2021-09-07  443  		return -ENOENT;
75c1c2b53c78bf SeongJae Park 2021-09-07  444  =

75c1c2b53c78bf SeongJae Park 2021-09-07  445  	new_dirs =3D kmalloc_array(d=
bgfs_nr_ctxs - 1, sizeof(*dbgfs_dirs),
75c1c2b53c78bf SeongJae Park 2021-09-07  446  			GFP_KERNEL);
75c1c2b53c78bf SeongJae Park 2021-09-07  447  	if (!new_dirs)
75c1c2b53c78bf SeongJae Park 2021-09-07  448  		return -ENOMEM;
75c1c2b53c78bf SeongJae Park 2021-09-07  449  =

75c1c2b53c78bf SeongJae Park 2021-09-07  450  	new_ctxs =3D kmalloc_array(d=
bgfs_nr_ctxs - 1, sizeof(*dbgfs_ctxs),
75c1c2b53c78bf SeongJae Park 2021-09-07  451  			GFP_KERNEL);
75c1c2b53c78bf SeongJae Park 2021-09-07  452  	if (!new_ctxs) {
75c1c2b53c78bf SeongJae Park 2021-09-07  453  		kfree(new_dirs);
75c1c2b53c78bf SeongJae Park 2021-09-07  454  		return -ENOMEM;
75c1c2b53c78bf SeongJae Park 2021-09-07  455  	}
75c1c2b53c78bf SeongJae Park 2021-09-07  456  =

75c1c2b53c78bf SeongJae Park 2021-09-07  457  	for (i =3D 0, j =3D 0; i < d=
bgfs_nr_ctxs; i++) {
75c1c2b53c78bf SeongJae Park 2021-09-07  458  		if (dbgfs_dirs[i] =3D=3D di=
r) {
75c1c2b53c78bf SeongJae Park 2021-09-07  459  			debugfs_remove(dbgfs_dirs[=
i]);
75c1c2b53c78bf SeongJae Park 2021-09-07  460  			dbgfs_destroy_ctx(dbgfs_ct=
xs[i]);
75c1c2b53c78bf SeongJae Park 2021-09-07  461  			continue;
75c1c2b53c78bf SeongJae Park 2021-09-07  462  		}
75c1c2b53c78bf SeongJae Park 2021-09-07  463  		new_dirs[j] =3D dbgfs_dirs[=
i];
75c1c2b53c78bf SeongJae Park 2021-09-07  464  		new_ctxs[j++] =3D dbgfs_ctx=
s[i];
75c1c2b53c78bf SeongJae Park 2021-09-07  465  	}
75c1c2b53c78bf SeongJae Park 2021-09-07  466  =

75c1c2b53c78bf SeongJae Park 2021-09-07  467  	kfree(dbgfs_dirs);
75c1c2b53c78bf SeongJae Park 2021-09-07  468  	kfree(dbgfs_ctxs);
75c1c2b53c78bf SeongJae Park 2021-09-07  469  =

75c1c2b53c78bf SeongJae Park 2021-09-07  470  	dbgfs_dirs =3D new_dirs;
75c1c2b53c78bf SeongJae Park 2021-09-07  471  	dbgfs_ctxs =3D new_ctxs;
75c1c2b53c78bf SeongJae Park 2021-09-07  472  	dbgfs_nr_ctxs--;
75c1c2b53c78bf SeongJae Park 2021-09-07  473  =

75c1c2b53c78bf SeongJae Park 2021-09-07  474  	return 0;
75c1c2b53c78bf SeongJae Park 2021-09-07  475  }
75c1c2b53c78bf SeongJae Park 2021-09-07  476  =

75c1c2b53c78bf SeongJae Park 2021-09-07  477  static ssize_t dbgfs_rm_conte=
xt_write(struct file *file,
75c1c2b53c78bf SeongJae Park 2021-09-07  478  		const char __user *buf, siz=
e_t count, loff_t *ppos)
75c1c2b53c78bf SeongJae Park 2021-09-07  479  {
75c1c2b53c78bf SeongJae Park 2021-09-07  480  	char *kbuf;
75c1c2b53c78bf SeongJae Park 2021-09-07  481  	ssize_t ret =3D count;
75c1c2b53c78bf SeongJae Park 2021-09-07  482  	int err;
75c1c2b53c78bf SeongJae Park 2021-09-07  483  	char *ctx_name;
75c1c2b53c78bf SeongJae Park 2021-09-07  484  =

75c1c2b53c78bf SeongJae Park 2021-09-07  485  	kbuf =3D user_input_str(buf,=
 count, ppos);
75c1c2b53c78bf SeongJae Park 2021-09-07  486  	if (IS_ERR(kbuf))
75c1c2b53c78bf SeongJae Park 2021-09-07 @487  		return PTR_ERR(kbuf);
75c1c2b53c78bf SeongJae Park 2021-09-07  488  	ctx_name =3D kmalloc(count +=
 1, GFP_KERNEL);
75c1c2b53c78bf SeongJae Park 2021-09-07  489  	if (!ctx_name) {
75c1c2b53c78bf SeongJae Park 2021-09-07  490  		kfree(kbuf);
75c1c2b53c78bf SeongJae Park 2021-09-07  491  		return -ENOMEM;
75c1c2b53c78bf SeongJae Park 2021-09-07  492  	}
75c1c2b53c78bf SeongJae Park 2021-09-07  493  =

75c1c2b53c78bf SeongJae Park 2021-09-07  494  	/* Trim white space */
75c1c2b53c78bf SeongJae Park 2021-09-07  495  	if (sscanf(kbuf, "%s", ctx_n=
ame) !=3D 1) {
75c1c2b53c78bf SeongJae Park 2021-09-07  496  		ret =3D -EINVAL;
75c1c2b53c78bf SeongJae Park 2021-09-07  497  		goto out;
75c1c2b53c78bf SeongJae Park 2021-09-07  498  	}
75c1c2b53c78bf SeongJae Park 2021-09-07  499  =

75c1c2b53c78bf SeongJae Park 2021-09-07  500  	mutex_lock(&damon_dbgfs_lock=
);
75c1c2b53c78bf SeongJae Park 2021-09-07  501  	err =3D dbgfs_rm_context(ctx=
_name);
75c1c2b53c78bf SeongJae Park 2021-09-07  502  	if (err)
75c1c2b53c78bf SeongJae Park 2021-09-07  503  		ret =3D err;
75c1c2b53c78bf SeongJae Park 2021-09-07  504  	mutex_unlock(&damon_dbgfs_lo=
ck);
75c1c2b53c78bf SeongJae Park 2021-09-07  505  =

75c1c2b53c78bf SeongJae Park 2021-09-07  506  out:
75c1c2b53c78bf SeongJae Park 2021-09-07  507  	kfree(kbuf);
75c1c2b53c78bf SeongJae Park 2021-09-07  508  	kfree(ctx_name);
75c1c2b53c78bf SeongJae Park 2021-09-07  509  	return ret;
75c1c2b53c78bf SeongJae Park 2021-09-07  510  }
75c1c2b53c78bf SeongJae Park 2021-09-07  511  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0288608924276911032==--

