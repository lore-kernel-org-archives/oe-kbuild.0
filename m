Content-Type: multipart/mixed; boundary="===============1869832460479480762=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/damon/dbgfs.c:76 dbgfs_attrs_write() warn: passing a valid pointer to 'PTR_ERR'
Date: Wed, 24 Nov 2021 17:03:37 +0800
Message-ID: <202111241705.MxwRmAdL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1869832460479480762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sjpark@amazon.de>
CC: Leonard Foerster <foersleo@amazon.de>
CC: Fernand Sieber <sieberf@amazon.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: 4bc05954d0076655cfaf6f0135585bdc20cd6b11 mm/damon: implement a debu=
gfs-based user space interface
date:   3 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: nios2-randconfig-m031-20211123 (https://download.01.org/0day-ci/arc=
hive/20211124/202111241705.MxwRmAdL-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/damon/dbgfs.c:76 dbgfs_attrs_write() warn: passing a valid pointer to 'P=
TR_ERR'
mm/damon/dbgfs.c:196 dbgfs_target_ids_write() warn: passing a valid pointer=
 to 'PTR_ERR'
mm/damon/dbgfs.c:319 dbgfs_monitor_on_write() warn: passing a valid pointer=
 to 'PTR_ERR'

vim +/PTR_ERR +76 mm/damon/dbgfs.c

4bc05954d00766 SeongJae Park 2021-09-07   64  =

4bc05954d00766 SeongJae Park 2021-09-07   65  static ssize_t dbgfs_attrs_wr=
ite(struct file *file,
4bc05954d00766 SeongJae Park 2021-09-07   66  		const char __user *buf, siz=
e_t count, loff_t *ppos)
4bc05954d00766 SeongJae Park 2021-09-07   67  {
4bc05954d00766 SeongJae Park 2021-09-07   68  	struct damon_ctx *ctx =3D fi=
le->private_data;
4bc05954d00766 SeongJae Park 2021-09-07   69  	unsigned long s, a, r, minr,=
 maxr;
4bc05954d00766 SeongJae Park 2021-09-07   70  	char *kbuf;
4bc05954d00766 SeongJae Park 2021-09-07   71  	ssize_t ret =3D count;
4bc05954d00766 SeongJae Park 2021-09-07   72  	int err;
4bc05954d00766 SeongJae Park 2021-09-07   73  =

4bc05954d00766 SeongJae Park 2021-09-07   74  	kbuf =3D user_input_str(buf,=
 count, ppos);
4bc05954d00766 SeongJae Park 2021-09-07   75  	if (IS_ERR(kbuf))
4bc05954d00766 SeongJae Park 2021-09-07  @76  		return PTR_ERR(kbuf);
4bc05954d00766 SeongJae Park 2021-09-07   77  =

4bc05954d00766 SeongJae Park 2021-09-07   78  	if (sscanf(kbuf, "%lu %lu %l=
u %lu %lu",
4bc05954d00766 SeongJae Park 2021-09-07   79  				&s, &a, &r, &minr, &maxr)=
 !=3D 5) {
4bc05954d00766 SeongJae Park 2021-09-07   80  		ret =3D -EINVAL;
4bc05954d00766 SeongJae Park 2021-09-07   81  		goto out;
4bc05954d00766 SeongJae Park 2021-09-07   82  	}
4bc05954d00766 SeongJae Park 2021-09-07   83  =

4bc05954d00766 SeongJae Park 2021-09-07   84  	mutex_lock(&ctx->kdamond_loc=
k);
4bc05954d00766 SeongJae Park 2021-09-07   85  	if (ctx->kdamond) {
4bc05954d00766 SeongJae Park 2021-09-07   86  		ret =3D -EBUSY;
4bc05954d00766 SeongJae Park 2021-09-07   87  		goto unlock_out;
4bc05954d00766 SeongJae Park 2021-09-07   88  	}
4bc05954d00766 SeongJae Park 2021-09-07   89  =

4bc05954d00766 SeongJae Park 2021-09-07   90  	err =3D damon_set_attrs(ctx,=
 s, a, r, minr, maxr);
4bc05954d00766 SeongJae Park 2021-09-07   91  	if (err)
4bc05954d00766 SeongJae Park 2021-09-07   92  		ret =3D err;
4bc05954d00766 SeongJae Park 2021-09-07   93  unlock_out:
4bc05954d00766 SeongJae Park 2021-09-07   94  	mutex_unlock(&ctx->kdamond_l=
ock);
4bc05954d00766 SeongJae Park 2021-09-07   95  out:
4bc05954d00766 SeongJae Park 2021-09-07   96  	kfree(kbuf);
4bc05954d00766 SeongJae Park 2021-09-07   97  	return ret;
4bc05954d00766 SeongJae Park 2021-09-07   98  }
4bc05954d00766 SeongJae Park 2021-09-07   99  =

4bc05954d00766 SeongJae Park 2021-09-07  100  static inline bool targetid_i=
s_pid(const struct damon_ctx *ctx)
4bc05954d00766 SeongJae Park 2021-09-07  101  {
4bc05954d00766 SeongJae Park 2021-09-07  102  	return ctx->primitive.target=
_valid =3D=3D damon_va_target_valid;
4bc05954d00766 SeongJae Park 2021-09-07  103  }
4bc05954d00766 SeongJae Park 2021-09-07  104  =

4bc05954d00766 SeongJae Park 2021-09-07  105  static ssize_t sprint_target_=
ids(struct damon_ctx *ctx, char *buf, ssize_t len)
4bc05954d00766 SeongJae Park 2021-09-07  106  {
4bc05954d00766 SeongJae Park 2021-09-07  107  	struct damon_target *t;
4bc05954d00766 SeongJae Park 2021-09-07  108  	unsigned long id;
4bc05954d00766 SeongJae Park 2021-09-07  109  	int written =3D 0;
4bc05954d00766 SeongJae Park 2021-09-07  110  	int rc;
4bc05954d00766 SeongJae Park 2021-09-07  111  =

4bc05954d00766 SeongJae Park 2021-09-07  112  	damon_for_each_target(t, ctx=
) {
4bc05954d00766 SeongJae Park 2021-09-07  113  		id =3D t->id;
4bc05954d00766 SeongJae Park 2021-09-07  114  		if (targetid_is_pid(ctx))
4bc05954d00766 SeongJae Park 2021-09-07  115  			/* Show pid numbers to deb=
ugfs users */
4bc05954d00766 SeongJae Park 2021-09-07  116  			id =3D (unsigned long)pid_=
vnr((struct pid *)id);
4bc05954d00766 SeongJae Park 2021-09-07  117  =

4bc05954d00766 SeongJae Park 2021-09-07  118  		rc =3D scnprintf(&buf[writt=
en], len - written, "%lu ", id);
4bc05954d00766 SeongJae Park 2021-09-07  119  		if (!rc)
4bc05954d00766 SeongJae Park 2021-09-07  120  			return -ENOMEM;
4bc05954d00766 SeongJae Park 2021-09-07  121  		written +=3D rc;
4bc05954d00766 SeongJae Park 2021-09-07  122  	}
4bc05954d00766 SeongJae Park 2021-09-07  123  	if (written)
4bc05954d00766 SeongJae Park 2021-09-07  124  		written -=3D 1;
4bc05954d00766 SeongJae Park 2021-09-07  125  	written +=3D scnprintf(&buf[=
written], len - written, "\n");
4bc05954d00766 SeongJae Park 2021-09-07  126  	return written;
4bc05954d00766 SeongJae Park 2021-09-07  127  }
4bc05954d00766 SeongJae Park 2021-09-07  128  =

4bc05954d00766 SeongJae Park 2021-09-07  129  static ssize_t dbgfs_target_i=
ds_read(struct file *file,
4bc05954d00766 SeongJae Park 2021-09-07  130  		char __user *buf, size_t co=
unt, loff_t *ppos)
4bc05954d00766 SeongJae Park 2021-09-07  131  {
4bc05954d00766 SeongJae Park 2021-09-07  132  	struct damon_ctx *ctx =3D fi=
le->private_data;
4bc05954d00766 SeongJae Park 2021-09-07  133  	ssize_t len;
4bc05954d00766 SeongJae Park 2021-09-07  134  	char ids_buf[320];
4bc05954d00766 SeongJae Park 2021-09-07  135  =

4bc05954d00766 SeongJae Park 2021-09-07  136  	mutex_lock(&ctx->kdamond_loc=
k);
4bc05954d00766 SeongJae Park 2021-09-07  137  	len =3D sprint_target_ids(ct=
x, ids_buf, 320);
4bc05954d00766 SeongJae Park 2021-09-07  138  	mutex_unlock(&ctx->kdamond_l=
ock);
4bc05954d00766 SeongJae Park 2021-09-07  139  	if (len < 0)
4bc05954d00766 SeongJae Park 2021-09-07  140  		return len;
4bc05954d00766 SeongJae Park 2021-09-07  141  =

4bc05954d00766 SeongJae Park 2021-09-07  142  	return simple_read_from_buff=
er(buf, count, ppos, ids_buf, len);
4bc05954d00766 SeongJae Park 2021-09-07  143  }
4bc05954d00766 SeongJae Park 2021-09-07  144  =

4bc05954d00766 SeongJae Park 2021-09-07  145  /*
4bc05954d00766 SeongJae Park 2021-09-07  146   * Converts a string into an =
array of unsigned long integers
4bc05954d00766 SeongJae Park 2021-09-07  147   *
4bc05954d00766 SeongJae Park 2021-09-07  148   * Returns an array of unsign=
ed long integers if the conversion success, or
4bc05954d00766 SeongJae Park 2021-09-07  149   * NULL otherwise.
4bc05954d00766 SeongJae Park 2021-09-07  150   */
4bc05954d00766 SeongJae Park 2021-09-07  151  static unsigned long *str_to_=
target_ids(const char *str, ssize_t len,
4bc05954d00766 SeongJae Park 2021-09-07  152  					ssize_t *nr_ids)
4bc05954d00766 SeongJae Park 2021-09-07  153  {
4bc05954d00766 SeongJae Park 2021-09-07  154  	unsigned long *ids;
4bc05954d00766 SeongJae Park 2021-09-07  155  	const int max_nr_ids =3D 32;
4bc05954d00766 SeongJae Park 2021-09-07  156  	unsigned long id;
4bc05954d00766 SeongJae Park 2021-09-07  157  	int pos =3D 0, parsed, ret;
4bc05954d00766 SeongJae Park 2021-09-07  158  =

4bc05954d00766 SeongJae Park 2021-09-07  159  	*nr_ids =3D 0;
4bc05954d00766 SeongJae Park 2021-09-07  160  	ids =3D kmalloc_array(max_nr=
_ids, sizeof(id), GFP_KERNEL);
4bc05954d00766 SeongJae Park 2021-09-07  161  	if (!ids)
4bc05954d00766 SeongJae Park 2021-09-07  162  		return NULL;
4bc05954d00766 SeongJae Park 2021-09-07  163  	while (*nr_ids < max_nr_ids =
&& pos < len) {
4bc05954d00766 SeongJae Park 2021-09-07  164  		ret =3D sscanf(&str[pos], "=
%lu%n", &id, &parsed);
4bc05954d00766 SeongJae Park 2021-09-07  165  		pos +=3D parsed;
4bc05954d00766 SeongJae Park 2021-09-07  166  		if (ret !=3D 1)
4bc05954d00766 SeongJae Park 2021-09-07  167  			break;
4bc05954d00766 SeongJae Park 2021-09-07  168  		ids[*nr_ids] =3D id;
4bc05954d00766 SeongJae Park 2021-09-07  169  		*nr_ids +=3D 1;
4bc05954d00766 SeongJae Park 2021-09-07  170  	}
4bc05954d00766 SeongJae Park 2021-09-07  171  =

4bc05954d00766 SeongJae Park 2021-09-07  172  	return ids;
4bc05954d00766 SeongJae Park 2021-09-07  173  }
4bc05954d00766 SeongJae Park 2021-09-07  174  =

4bc05954d00766 SeongJae Park 2021-09-07  175  static void dbgfs_put_pids(un=
signed long *ids, int nr_ids)
4bc05954d00766 SeongJae Park 2021-09-07  176  {
4bc05954d00766 SeongJae Park 2021-09-07  177  	int i;
4bc05954d00766 SeongJae Park 2021-09-07  178  =

4bc05954d00766 SeongJae Park 2021-09-07  179  	for (i =3D 0; i < nr_ids; i+=
+)
4bc05954d00766 SeongJae Park 2021-09-07  180  		put_pid((struct pid *)ids[i=
]);
4bc05954d00766 SeongJae Park 2021-09-07  181  }
4bc05954d00766 SeongJae Park 2021-09-07  182  =

4bc05954d00766 SeongJae Park 2021-09-07  183  static ssize_t dbgfs_target_i=
ds_write(struct file *file,
4bc05954d00766 SeongJae Park 2021-09-07  184  		const char __user *buf, siz=
e_t count, loff_t *ppos)
4bc05954d00766 SeongJae Park 2021-09-07  185  {
4bc05954d00766 SeongJae Park 2021-09-07  186  	struct damon_ctx *ctx =3D fi=
le->private_data;
4bc05954d00766 SeongJae Park 2021-09-07  187  	char *kbuf, *nrs;
4bc05954d00766 SeongJae Park 2021-09-07  188  	unsigned long *targets;
4bc05954d00766 SeongJae Park 2021-09-07  189  	ssize_t nr_targets;
4bc05954d00766 SeongJae Park 2021-09-07  190  	ssize_t ret =3D count;
4bc05954d00766 SeongJae Park 2021-09-07  191  	int i;
4bc05954d00766 SeongJae Park 2021-09-07  192  	int err;
4bc05954d00766 SeongJae Park 2021-09-07  193  =

4bc05954d00766 SeongJae Park 2021-09-07  194  	kbuf =3D user_input_str(buf,=
 count, ppos);
4bc05954d00766 SeongJae Park 2021-09-07  195  	if (IS_ERR(kbuf))
4bc05954d00766 SeongJae Park 2021-09-07 @196  		return PTR_ERR(kbuf);
4bc05954d00766 SeongJae Park 2021-09-07  197  =

4bc05954d00766 SeongJae Park 2021-09-07  198  	nrs =3D kbuf;
4bc05954d00766 SeongJae Park 2021-09-07  199  =

4bc05954d00766 SeongJae Park 2021-09-07  200  	targets =3D str_to_target_id=
s(nrs, ret, &nr_targets);
4bc05954d00766 SeongJae Park 2021-09-07  201  	if (!targets) {
4bc05954d00766 SeongJae Park 2021-09-07  202  		ret =3D -ENOMEM;
4bc05954d00766 SeongJae Park 2021-09-07  203  		goto out;
4bc05954d00766 SeongJae Park 2021-09-07  204  	}
4bc05954d00766 SeongJae Park 2021-09-07  205  =

4bc05954d00766 SeongJae Park 2021-09-07  206  	if (targetid_is_pid(ctx)) {
4bc05954d00766 SeongJae Park 2021-09-07  207  		for (i =3D 0; i < nr_target=
s; i++) {
4bc05954d00766 SeongJae Park 2021-09-07  208  			targets[i] =3D (unsigned l=
ong)find_get_pid(
4bc05954d00766 SeongJae Park 2021-09-07  209  					(int)targets[i]);
4bc05954d00766 SeongJae Park 2021-09-07  210  			if (!targets[i]) {
4bc05954d00766 SeongJae Park 2021-09-07  211  				dbgfs_put_pids(targets, i=
);
4bc05954d00766 SeongJae Park 2021-09-07  212  				ret =3D -EINVAL;
4bc05954d00766 SeongJae Park 2021-09-07  213  				goto free_targets_out;
4bc05954d00766 SeongJae Park 2021-09-07  214  			}
4bc05954d00766 SeongJae Park 2021-09-07  215  		}
4bc05954d00766 SeongJae Park 2021-09-07  216  	}
4bc05954d00766 SeongJae Park 2021-09-07  217  =

4bc05954d00766 SeongJae Park 2021-09-07  218  	mutex_lock(&ctx->kdamond_loc=
k);
4bc05954d00766 SeongJae Park 2021-09-07  219  	if (ctx->kdamond) {
4bc05954d00766 SeongJae Park 2021-09-07  220  		if (targetid_is_pid(ctx))
4bc05954d00766 SeongJae Park 2021-09-07  221  			dbgfs_put_pids(targets, nr=
_targets);
4bc05954d00766 SeongJae Park 2021-09-07  222  		ret =3D -EBUSY;
4bc05954d00766 SeongJae Park 2021-09-07  223  		goto unlock_out;
4bc05954d00766 SeongJae Park 2021-09-07  224  	}
4bc05954d00766 SeongJae Park 2021-09-07  225  =

4bc05954d00766 SeongJae Park 2021-09-07  226  	err =3D damon_set_targets(ct=
x, targets, nr_targets);
4bc05954d00766 SeongJae Park 2021-09-07  227  	if (err) {
4bc05954d00766 SeongJae Park 2021-09-07  228  		if (targetid_is_pid(ctx))
4bc05954d00766 SeongJae Park 2021-09-07  229  			dbgfs_put_pids(targets, nr=
_targets);
4bc05954d00766 SeongJae Park 2021-09-07  230  		ret =3D err;
4bc05954d00766 SeongJae Park 2021-09-07  231  	}
4bc05954d00766 SeongJae Park 2021-09-07  232  =

4bc05954d00766 SeongJae Park 2021-09-07  233  unlock_out:
4bc05954d00766 SeongJae Park 2021-09-07  234  	mutex_unlock(&ctx->kdamond_l=
ock);
4bc05954d00766 SeongJae Park 2021-09-07  235  free_targets_out:
4bc05954d00766 SeongJae Park 2021-09-07  236  	kfree(targets);
4bc05954d00766 SeongJae Park 2021-09-07  237  out:
4bc05954d00766 SeongJae Park 2021-09-07  238  	kfree(kbuf);
4bc05954d00766 SeongJae Park 2021-09-07  239  	return ret;
4bc05954d00766 SeongJae Park 2021-09-07  240  }
4bc05954d00766 SeongJae Park 2021-09-07  241  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1869832460479480762==--

