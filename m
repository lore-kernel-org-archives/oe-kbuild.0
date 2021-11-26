Content-Type: multipart/mixed; boundary="===============1633893462970538955=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V1 1/2] mm/damon/dbgfs: Modify Damon dbfs interface dependency in Kconfig
Date: Fri, 26 Nov 2021 13:32:27 +0800
Message-ID: <202111261310.jsnbkhsX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1633893462970538955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <fbf27c39e8f23d12d5474b9b659d3d45f8dd38ca.1637429074.git.xhao(=
a)linux.alibaba.com>
References: <fbf27c39e8f23d12d5474b9b659d3d45f8dd38ca.1637429074.git.xhao(a=
)linux.alibaba.com>
TO: Xin Hao <xhao@linux.alibaba.com>
TO: sj(a)kernel.org
CC: xhao(a)linux.alibaba.com
CC: akpm(a)linux-foundation.org
CC: linux-mm(a)kvack.org
CC: linux-kernel(a)vger.kernel.org

Hi Xin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hnaz-mm/master]

url:    https://github.com/0day-ci/linux/commits/Xin-Hao/mm-damon-dbgfs-Mod=
ify-Damon-dbfs-interface-dependency-in-Kconfig/20211121-012819
base:   https://github.com/hnaz/linux-mm master
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc-randconfig-c024-20211123 (https://download.01.org/0day-ci/a=
rchive/20211126/202111261310.jsnbkhsX-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/496f4e2cc535ba7b71a6ff2b8=
2840693d413ae02
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Xin-Hao/mm-damon-dbgfs-Modify-Damo=
n-dbfs-interface-dependency-in-Kconfig/20211121-012819
        git checkout 496f4e2cc535ba7b71a6ff2b82840693d413ae02
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mm/damon/dbgfs.c: In function 'dbgfs_target_ids_write':
>> mm/damon/dbgfs.c:409:17: error: implicit declaration of function 'damon_=
pa_set_primitives'; did you mean 'damon_va_set_primitives'? [-Werror=3Dimpl=
icit-function-declaration]
     409 |                 damon_pa_set_primitives(ctx);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 damon_va_set_primitives
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on SMP && (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOO=
KE
   Selected by
   - PM_SLEEP_SMP && SMP && (ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSS=
IBLE && PM_SLEEP


vim +409 mm/damon/dbgfs.c

4bc05954d00766 SeongJae Park 2021-09-07  353  =

4bc05954d00766 SeongJae Park 2021-09-07  354  static ssize_t dbgfs_target_i=
ds_write(struct file *file,
4bc05954d00766 SeongJae Park 2021-09-07  355  		const char __user *buf, siz=
e_t count, loff_t *ppos)
4bc05954d00766 SeongJae Park 2021-09-07  356  {
4bc05954d00766 SeongJae Park 2021-09-07  357  	struct damon_ctx *ctx =3D fi=
le->private_data;
2ba00bca84ef3f SeongJae Park 2021-10-28  358  	bool id_is_pid =3D true;
4bc05954d00766 SeongJae Park 2021-09-07  359  	char *kbuf, *nrs;
4bc05954d00766 SeongJae Park 2021-09-07  360  	unsigned long *targets;
4bc05954d00766 SeongJae Park 2021-09-07  361  	ssize_t nr_targets;
4f521143b7d82a Rongwei Wang  2021-10-28  362  	ssize_t ret;
4bc05954d00766 SeongJae Park 2021-09-07  363  	int i;
4bc05954d00766 SeongJae Park 2021-09-07  364  =

4bc05954d00766 SeongJae Park 2021-09-07  365  	kbuf =3D user_input_str(buf,=
 count, ppos);
4bc05954d00766 SeongJae Park 2021-09-07  366  	if (IS_ERR(kbuf))
4bc05954d00766 SeongJae Park 2021-09-07  367  		return PTR_ERR(kbuf);
4bc05954d00766 SeongJae Park 2021-09-07  368  =

4bc05954d00766 SeongJae Park 2021-09-07  369  	nrs =3D kbuf;
2ba00bca84ef3f SeongJae Park 2021-10-28  370  	if (!strncmp(kbuf, "paddr\n"=
, count)) {
2ba00bca84ef3f SeongJae Park 2021-10-28  371  		id_is_pid =3D false;
2ba00bca84ef3f SeongJae Park 2021-10-28  372  		/* target id is meaningless=
 here, but we set it just for fun */
2ba00bca84ef3f SeongJae Park 2021-10-28  373  		scnprintf(kbuf, count, "42 =
   ");
2ba00bca84ef3f SeongJae Park 2021-10-28  374  	}
4bc05954d00766 SeongJae Park 2021-09-07  375  =

4f521143b7d82a Rongwei Wang  2021-10-28  376  	targets =3D str_to_target_id=
s(nrs, count, &nr_targets);
4bc05954d00766 SeongJae Park 2021-09-07  377  	if (!targets) {
4bc05954d00766 SeongJae Park 2021-09-07  378  		ret =3D -ENOMEM;
4bc05954d00766 SeongJae Park 2021-09-07  379  		goto out;
4bc05954d00766 SeongJae Park 2021-09-07  380  	}
4bc05954d00766 SeongJae Park 2021-09-07  381  =

2ba00bca84ef3f SeongJae Park 2021-10-28  382  	if (id_is_pid) {
4bc05954d00766 SeongJae Park 2021-09-07  383  		for (i =3D 0; i < nr_target=
s; i++) {
4bc05954d00766 SeongJae Park 2021-09-07  384  			targets[i] =3D (unsigned l=
ong)find_get_pid(
4bc05954d00766 SeongJae Park 2021-09-07  385  					(int)targets[i]);
4bc05954d00766 SeongJae Park 2021-09-07  386  			if (!targets[i]) {
4bc05954d00766 SeongJae Park 2021-09-07  387  				dbgfs_put_pids(targets, i=
);
4bc05954d00766 SeongJae Park 2021-09-07  388  				ret =3D -EINVAL;
4bc05954d00766 SeongJae Park 2021-09-07  389  				goto free_targets_out;
4bc05954d00766 SeongJae Park 2021-09-07  390  			}
4bc05954d00766 SeongJae Park 2021-09-07  391  		}
4bc05954d00766 SeongJae Park 2021-09-07  392  	}
4bc05954d00766 SeongJae Park 2021-09-07  393  =

4bc05954d00766 SeongJae Park 2021-09-07  394  	mutex_lock(&ctx->kdamond_loc=
k);
4bc05954d00766 SeongJae Park 2021-09-07  395  	if (ctx->kdamond) {
2ba00bca84ef3f SeongJae Park 2021-10-28  396  		if (id_is_pid)
4bc05954d00766 SeongJae Park 2021-09-07  397  			dbgfs_put_pids(targets, nr=
_targets);
4bc05954d00766 SeongJae Park 2021-09-07  398  		ret =3D -EBUSY;
4bc05954d00766 SeongJae Park 2021-09-07  399  		goto unlock_out;
4bc05954d00766 SeongJae Park 2021-09-07  400  	}
4bc05954d00766 SeongJae Park 2021-09-07  401  =

2ba00bca84ef3f SeongJae Park 2021-10-28  402  	/* remove targets with previ=
ously-set primitive */
2ba00bca84ef3f SeongJae Park 2021-10-28  403  	damon_set_targets(ctx, NULL,=
 0);
2ba00bca84ef3f SeongJae Park 2021-10-28  404  =

2ba00bca84ef3f SeongJae Park 2021-10-28  405  	/* Configure the context for=
 the address space type */
2ba00bca84ef3f SeongJae Park 2021-10-28  406  	if (id_is_pid)
2ba00bca84ef3f SeongJae Park 2021-10-28  407  		damon_va_set_primitives(ctx=
);
2ba00bca84ef3f SeongJae Park 2021-10-28  408  	else
2ba00bca84ef3f SeongJae Park 2021-10-28 @409  		damon_pa_set_primitives(ctx=
);
2ba00bca84ef3f SeongJae Park 2021-10-28  410  =

4f521143b7d82a Rongwei Wang  2021-10-28  411  	ret =3D damon_set_targets(ct=
x, targets, nr_targets);
4f521143b7d82a Rongwei Wang  2021-10-28  412  	if (ret) {
2ba00bca84ef3f SeongJae Park 2021-10-28  413  		if (id_is_pid)
4bc05954d00766 SeongJae Park 2021-09-07  414  			dbgfs_put_pids(targets, nr=
_targets);
4f521143b7d82a Rongwei Wang  2021-10-28  415  	} else {
4f521143b7d82a Rongwei Wang  2021-10-28  416  		ret =3D count;
4bc05954d00766 SeongJae Park 2021-09-07  417  	}
4bc05954d00766 SeongJae Park 2021-09-07  418  =

4bc05954d00766 SeongJae Park 2021-09-07  419  unlock_out:
4bc05954d00766 SeongJae Park 2021-09-07  420  	mutex_unlock(&ctx->kdamond_l=
ock);
4bc05954d00766 SeongJae Park 2021-09-07  421  free_targets_out:
4bc05954d00766 SeongJae Park 2021-09-07  422  	kfree(targets);
4bc05954d00766 SeongJae Park 2021-09-07  423  out:
4bc05954d00766 SeongJae Park 2021-09-07  424  	kfree(kbuf);
4bc05954d00766 SeongJae Park 2021-09-07  425  	return ret;
4bc05954d00766 SeongJae Park 2021-09-07  426  }
4bc05954d00766 SeongJae Park 2021-09-07  427  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1633893462970538955==--

