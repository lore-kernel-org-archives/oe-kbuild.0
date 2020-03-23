Content-Type: multipart/mixed; boundary="===============0356635811556392608=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [drm-drm-intel:drm-intel-next-queued 1/1] drivers/gpu/drm/i915/gt/intel_context.c:147 __intel_context_do_pin() warn: inconsistent returns 'ce->pin_mutex'.
Date: Mon, 23 Mar 2020 10:48:14 +0300
Message-ID: <20200323074544.GM4650@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0356635811556392608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://anongit.freedesktop.org/drm/drm-intel drm-intel-next-queued
head:   b412c63f1cba70b0e21927ae840aa45e024be97f
commit: b412c63f1cba70b0e21927ae840aa45e024be97f [1/1] drm/i915/gt: Report =
context-is-closed prior to pinning

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gt/intel_context.c:147 __intel_context_do_pin() warn: =
inconsistent returns 'ce->pin_mutex'.

git remote add drm-drm-intel git://anongit.freedesktop.org/drm/drm-intel
git remote update drm-drm-intel
git checkout b412c63f1cba70b0e21927ae840aa45e024be97f
vim +147 drivers/gpu/drm/i915/gt/intel_context.c

89f98d634f6b7a drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09   96  int __intel_context_do_pin(struct intel_context *ce)
89f98d634f6b7a drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09   97  {
89f98d634f6b7a drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09   98  	int err;
89f98d634f6b7a drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09   99  =

89f98d634f6b7a drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  100  	if (unlikely(!test_bit(CONTEXT_ALLOC_BIT, &ce->flags))) {
89f98d634f6b7a drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  101  		err =3D intel_context_alloc_state(ce);
89f98d634f6b7a drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  102  		if (err)
89f98d634f6b7a drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  103  			return err;
4c60b1aaa25520 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2019-08=
-09  104  	}
4c60b1aaa25520 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2019-08=
-09  105  =

e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  106  	err =3D i915_active_acquire(&ce->active);
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  107  	if (err)
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  108  		return err;
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  109  =

e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  110  	if (mutex_lock_interruptible(&ce->pin_mutex)) {
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  111  		err =3D -EINTR;
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  112  		goto out_release;
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  113  	}
89f98d634f6b7a drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  114  =

b412c63f1cba70 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-03=
-20  115  	if (unlikely(intel_context_is_closed(ce))) {
b412c63f1cba70 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-03=
-20  116  		err =3D -ENOENT;
b412c63f1cba70 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-03=
-20  117  		goto out_release;

This should be "goto out_unlock;"

b412c63f1cba70 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-03=
-20  118  	}
b412c63f1cba70 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-03=
-20  119  =

e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  120  	if (likely(!atomic_add_unless(&ce->pin_count, 1, 0))) {
b11b28ea0dd16c drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  121  		err =3D intel_context_active_acquire(ce);
b11b28ea0dd16c drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  122  		if (unlikely(err))
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  123  			goto out_unlock;
b11b28ea0dd16c drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  124  =

95f697eb024d7d drivers/gpu/drm/i915/intel_context.c    Chris Wilson 2019-03=
-08  125  		err =3D ce->ops->pin(ce);
b11b28ea0dd16c drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  126  		if (unlikely(err))
b11b28ea0dd16c drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  127  			goto err_active;
95f697eb024d7d drivers/gpu/drm/i915/intel_context.c    Chris Wilson 2019-03=
-08  128  =

c616d2387aeeb9 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-02=
-11  129  		CE_TRACE(ce, "pin ring:{start:%08x, head:%04x, tail:%04x}\n",
c616d2387aeeb9 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-02=
-11  130  			 i915_ggtt_offset(ce->ring->vma),
cba17e5d647b4d drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2019-06=
-25  131  			 ce->ring->head, ce->ring->tail);
cba17e5d647b4d drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2019-06=
-25  132  =

0881954965e3d9 drivers/gpu/drm/i915/intel_context.c    Chris Wilson 2019-03=
-08  133  		smp_mb__before_atomic(); /* flush pin before it is visible */
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  134  		atomic_inc(&ce->pin_count);
95f697eb024d7d drivers/gpu/drm/i915/intel_context.c    Chris Wilson 2019-03=
-08  135  	}
95f697eb024d7d drivers/gpu/drm/i915/intel_context.c    Chris Wilson 2019-03=
-08  136  =

0881954965e3d9 drivers/gpu/drm/i915/intel_context.c    Chris Wilson 2019-03=
-08  137  	GEM_BUG_ON(!intel_context_is_pinned(ce)); /* no overflow! */
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  138  	GEM_BUG_ON(i915_active_is_idle(&ce->active));
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  139  	goto out_unlock;
95f697eb024d7d drivers/gpu/drm/i915/intel_context.c    Chris Wilson 2019-03=
-08  140  =

b11b28ea0dd16c drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  141  err_active:
b11b28ea0dd16c drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-09  142  	intel_context_active_release(ce);
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  143  out_unlock:
0881954965e3d9 drivers/gpu/drm/i915/intel_context.c    Chris Wilson 2019-03=
-08  144  	mutex_unlock(&ce->pin_mutex);
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  145  out_release:
e5429340bfa2dc drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2020-01=
-27  146  	i915_active_release(&ce->active);
fa9f668141f4e5 drivers/gpu/drm/i915/gt/intel_context.c Chris Wilson 2019-04=
-26 @147  	return err;
95f697eb024d7d drivers/gpu/drm/i915/intel_context.c    Chris Wilson 2019-03=
-08  148  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0356635811556392608==--

