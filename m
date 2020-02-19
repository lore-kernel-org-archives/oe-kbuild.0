Content-Type: multipart/mixed; boundary="===============2808433783345584191=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [mlankhorst:locking-rework 20/21] drivers/gpu/drm/i915/gt/intel_context.c:463 intel_context_create_request() error: uninitialized symbol 'rq'.
Date: Wed, 19 Feb 2020 08:36:29 +0300
Message-ID: <20200219053629.GH19641@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2808433783345584191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://people.freedesktop.org/~mlankhorst/linux locking-rework
head:   815e39f70354544bbdf2e396c3ed5c0375c2dd3b
commit: 9372cceb3c597ab5b169b0eb96063962ec340fc2 [20/21] drm/i915: Use ww p=
inning for intel_context_create_request()

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_context.c:463 intel_context_create_request() =
error: uninitialized symbol 'rq'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:132 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 124)

git remote add mlankhorst git://people.freedesktop.org/~mlankhorst/linux
git remote update mlankhorst
git checkout 9372cceb3c597ab5b169b0eb96063962ec340fc2
vim +/rq +463 drivers/gpu/drm/i915/gt/intel_context.c

5e2a0419ef7cb2 Chris Wilson      2019-04-26  441  struct i915_request *inte=
l_context_create_request(struct intel_context *ce)
5e2a0419ef7cb2 Chris Wilson      2019-04-26  442  {
9372cceb3c597a Maarten Lankhorst 2020-02-14  443  	struct i915_gem_ww_ctx w=
w;
5e2a0419ef7cb2 Chris Wilson      2019-04-26  444  	struct i915_request *rq;
5e2a0419ef7cb2 Chris Wilson      2019-04-26  445  	int err;
5e2a0419ef7cb2 Chris Wilson      2019-04-26  446  =

9372cceb3c597a Maarten Lankhorst 2020-02-14  447  	i915_gem_ww_ctx_init(&ww=
, true);
9372cceb3c597a Maarten Lankhorst 2020-02-14  448  retry:
9372cceb3c597a Maarten Lankhorst 2020-02-14  449  	err =3D intel_context_pi=
n_ww(ce, &ww);
9372cceb3c597a Maarten Lankhorst 2020-02-14  450  	if (!err) {
5e2a0419ef7cb2 Chris Wilson      2019-04-26  451  		rq =3D i915_request_cre=
ate(ce);
5e2a0419ef7cb2 Chris Wilson      2019-04-26  452  		intel_context_unpin(ce);
9372cceb3c597a Maarten Lankhorst 2020-02-14  453  	} else if (err =3D=3D -E=
DEADLK) {
9372cceb3c597a Maarten Lankhorst 2020-02-14  454  		err =3D i915_gem_ww_ctx=
_backoff(&ww);
9372cceb3c597a Maarten Lankhorst 2020-02-14  455  		if (!err)
9372cceb3c597a Maarten Lankhorst 2020-02-14  456  			goto retry;

"rq" not set on this path.

9372cceb3c597a Maarten Lankhorst 2020-02-14  457  	} else {
9372cceb3c597a Maarten Lankhorst 2020-02-14  458  		rq =3D ERR_PTR(err);
9372cceb3c597a Maarten Lankhorst 2020-02-14  459  	}
9372cceb3c597a Maarten Lankhorst 2020-02-14  460  =

9372cceb3c597a Maarten Lankhorst 2020-02-14  461  	i915_gem_ww_ctx_fini(&ww=
);
5e2a0419ef7cb2 Chris Wilson      2019-04-26  462  =

d3717eb59c723a Maarten Lankhorst 2020-01-28 @463  	if (IS_ERR(rq))
                                                                   ^^

d3717eb59c723a Maarten Lankhorst 2020-01-28  464  		return rq;
d3717eb59c723a Maarten Lankhorst 2020-01-28  465  =

d3717eb59c723a Maarten Lankhorst 2020-01-28  466  	/*
d3717eb59c723a Maarten Lankhorst 2020-01-28  467  	 * timeline->mutex shoul=
d be the inner lock, but is used as outer lock.
d3717eb59c723a Maarten Lankhorst 2020-01-28  468  	 * Hack around this to s=
hut up lockdep in selftests..
d3717eb59c723a Maarten Lankhorst 2020-01-28  469  	 */
d3717eb59c723a Maarten Lankhorst 2020-01-28  470  	lockdep_unpin_lock(&ce->=
timeline->mutex, rq->cookie);
d3717eb59c723a Maarten Lankhorst 2020-01-28  471  	mutex_release(&ce->timel=
ine->mutex.dep_map, _RET_IP_);
d3717eb59c723a Maarten Lankhorst 2020-01-28  472  	mutex_acquire(&ce->timel=
ine->mutex.dep_map, SINGLE_DEPTH_NESTING, 0, _RET_IP_);
d3717eb59c723a Maarten Lankhorst 2020-01-28  473  	rq->cookie =3D lockdep_p=
in_lock(&ce->timeline->mutex);
d3717eb59c723a Maarten Lankhorst 2020-01-28  474  =

5e2a0419ef7cb2 Chris Wilson      2019-04-26  475  	return rq;
5e2a0419ef7cb2 Chris Wilson      2019-04-26  476  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2808433783345584191==--

