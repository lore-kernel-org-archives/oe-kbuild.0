Content-Type: multipart/mixed; boundary="===============0147848086947388217=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 451/4212] drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c:381 igt_async_migrate() error: uninitialized symbol 'err'.
Date: Mon, 07 Feb 2022 23:28:27 +0800
Message-ID: <202202072312.jXrx1N2k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0147848086947388217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b3c0a155ef77550d48f6eb7c6fdd6075764a5622
commit: 950505cabe517ad40759cae6f88f33f0bdfbb7c8 [451/4212] drm/i915: Async=
hronous migration selftest
:::::: branch date: 11 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-m031-20220131 (https://download.01.org/0day-ci/ar=
chive/20220207/202202072312.jXrx1N2k-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c:381 igt_async_migrate=
() error: uninitialized symbol 'err'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:194 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 183)

vim +/err +381 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  301  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  302  /*
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  303   * This subtest test=
s that unbinding at migration is indeed performed
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  304   * async. We launch =
a spinner and a number of migrations depending on
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  305   * that spinner to h=
ave terminated. Before each migration we bind a
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  306   * vma, which should=
 then be async unbound by the migration operation.
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  307   * If we are able to=
 schedule migrations without blocking while the
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  308   * spinner is still =
running, those unbinds are indeed async and non-
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  309   * blocking.
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  310   *
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  311   * Note that each as=
ync bind operation is awaiting the previous migration
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  312   * due to the moving=
 fence resulting from the migration.
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  313   */
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  314  static int igt_async=
_migrate(struct intel_gt *gt)
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  315  {
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  316  	struct intel_engine=
_cs *engine;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  317  	enum intel_engine_i=
d id;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  318  	struct i915_ppgtt *=
ppgtt;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  319  	struct igt_spinner =
spin;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  320  	int err;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  321  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  322  	ppgtt =3D i915_ppgt=
t_create(gt, 0);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  323  	if (IS_ERR(ppgtt))
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  324  		return PTR_ERR(ppg=
tt);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  325  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  326  	if (igt_spinner_ini=
t(&spin, gt)) {
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  327  		err =3D -ENOMEM;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  328  		goto out_spin;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  329  	}
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  330  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  331  	for_each_engine(eng=
ine, gt, id) {
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  332  		struct ttm_operati=
on_ctx ctx =3D {
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  333  			.interruptible =
=3D true
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  334  		};
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  335  		struct dma_fence *=
spin_fence;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  336  		struct intel_conte=
xt *ce;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  337  		struct i915_reques=
t *rq;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  338  		struct i915_deps d=
eps;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  339  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  340  		ce =3D intel_conte=
xt_create(engine);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  341  		if (IS_ERR(ce)) {
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  342  			err =3D PTR_ERR(c=
e);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  343  			goto out_ce;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  344  		}
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  345  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  346  		/*
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  347  		 * Use MI_NOOP, ma=
king the spinner non-preemptible. If there
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  348  		 * is a code path =
where we fail async operation due to the
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  349  		 * running spinner=
, we will block and fail to end the
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  350  		 * spinner resulti=
ng in a deadlock. But with a non-
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  351  		 * preemptible spi=
nner, hangcheck will terminate the spinner
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  352  		 * for us, and we =
will later detect that and fail the test.
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  353  		 */
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  354  		rq =3D igt_spinner=
_create_request(&spin, ce, MI_NOOP);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  355  		intel_context_put(=
ce);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  356  		if (IS_ERR(rq)) {
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  357  			err =3D PTR_ERR(r=
q);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  358  			goto out_ce;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  359  		}
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  360  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  361  		i915_deps_init(&de=
ps, GFP_KERNEL);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  362  		err =3D i915_deps_=
add_dependency(&deps, &rq->fence, &ctx);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  363  		spin_fence =3D dma=
_fence_get(&rq->fence);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  364  		i915_request_add(r=
q);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  365  		if (err)
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  366  			goto out_ce;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  367  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  368  		err =3D __igt_lmem=
_pages_migrate(gt, &ppgtt->vm, &deps, &spin,
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  369  					       spin_fen=
ce);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  370  		i915_deps_fini(&de=
ps);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  371  		dma_fence_put(spin=
_fence);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  372  		if (err)
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  373  			goto out_ce;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  374  	}
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  375  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  376  out_ce:
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  377  	igt_spinner_fini(&s=
pin);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  378  out_spin:
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  379  	i915_vm_put(&ppgtt-=
>vm);
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  380  =

950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10 @381  	return err;
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  382  }
950505cabe517ad Thomas Hellstr=C3=B6m 2022-01-10  383  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0147848086947388217==--

