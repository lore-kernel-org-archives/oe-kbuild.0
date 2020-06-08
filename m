Content-Type: multipart/mixed; boundary="===============3377569577906141925=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 26/28] drm/i915: Fair low-latency scheduling
Date: Tue, 09 Jun 2020 04:27:01 +0800
Message-ID: <202006090415.GE74iHaQ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3377569577906141925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200607222108.14401-26-chris@chris-wilson.co.uk>
References: <20200607222108.14401-26-chris@chris-wilson.co.uk>
TO: Chris Wilson <chris@chris-wilson.co.uk>
TO: intel-gfx(a)lists.freedesktop.org
CC: Chris Wilson <chris@chris-wilson.co.uk>

Hi Chris,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next linus/master v5.7 next-20200608]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Chris-Wilson/drm-i915-Adju=
st-the-sentinel-assert-to-match-implementation/20200608-062434
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/gpu/drm/i915/gt/intel_lrc.c:5664:3: warning: %d in format string=
 (no. 2) requires 'int' but the argument type is 'unsigned int'. [invalidPr=
intfArgType_sint]
     snprintf(ve->base.name, sizeof(ve->base.name),
     ^
>> drivers/gpu/drm/i915/gt/intel_lrc.c:1117:8: warning: Local variable dead=
line shadows outer variable [shadowVar]
      u64 deadline =3D
          ^
   drivers/gpu/drm/i915/gt/intel_lrc.c:1102:6: note: Shadowed declaration
    u64 deadline =3D I915_DEADLINE_NEVER;
        ^
   drivers/gpu/drm/i915/gt/intel_lrc.c:1117:8: note: Shadow variable
      u64 deadline =3D
          ^
   drivers/gpu/drm/i915/gt/intel_lrc.c:5821:24: warning: Local variable rq =
shadows outer variable [shadowVar]
     struct i915_request *rq =3D READ_ONCE(ve->request);
                          ^
   drivers/gpu/drm/i915/gt/intel_lrc.c:5771:23: note: Shadowed declaration
    struct i915_request *rq, *last;
                         ^
   drivers/gpu/drm/i915/gt/intel_lrc.c:5821:24: note: Shadow variable
     struct i915_request *rq =3D READ_ONCE(ve->request);
                          ^
   drivers/gpu/drm/i915/gt/intel_lrc.c:4326:33: warning: Clarify calculatio=
n precedence for '&' and '?'. [clarifyCalculation]
     (flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
                                   ^
   drivers/gpu/drm/i915/gt/intel_lrc.c:4348:33: warning: Clarify calculatio=
n precedence for '&' and '?'. [clarifyCalculation]
     (flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
                                   ^

# https://github.com/0day-ci/linux/commit/4e2dc7aa430c1b1de4e6da6a012e1f032=
c86a032
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 4e2dc7aa430c1b1de4e6da6a012e1f032c86a032
vim +1117 drivers/gpu/drm/i915/gt/intel_lrc.c

7dc56af5260e95 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2019-09=
-24  1096  =

eb8d0f5af4ec2d drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2019-01=
-25  1097  static struct i915_request *
4cc79cbb01ef35 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2019-05=
-15  1098  __unwind_incomplete_requests(struct intel_engine_cs *engine)
7e4992ac045ccd drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2017-09=
-28  1099  {
b16c765122f987 drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2018-10=
-01  1100  	struct i915_request *rq, *rn, *active =3D NULL;
85f5e1f385b764 drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2018-10=
-01  1101  	struct list_head *uninitialized_var(pl);
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1102  	u64 deadline =3D I915_DEADLINE_NEVER;
7e4992ac045ccd drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2017-09=
-28  1103  =

422d7df4f090bb drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2019-06=
-14  1104  	lockdep_assert_held(&engine->active.lock);
7e4992ac045ccd drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2017-09=
-28  1105  =

7e4992ac045ccd drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2017-09=
-28  1106  	list_for_each_entry_safe_reverse(rq, rn,
422d7df4f090bb drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2019-06=
-14  1107  					 &engine->active.requests,
422d7df4f090bb drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2019-06=
-14  1108  					 sched.link) {
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1109  		if (i915_request_completed(rq)) {
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1110  			list_del_init(&rq->sched.link);
22b7a426bbe1eb drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2019-06=
-20  1111  			continue; /* XXX */
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1112  		}
7e4992ac045ccd drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2017-09=
-28  1113  =

e61e0f51ba7974 drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2018-02=
-21  1114  		__i915_request_unsubmit(rq);
7e4992ac045ccd drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2017-09=
-28  1115  =

4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1116  		if (i915_request_started(rq)) {
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07 @1117  			u64 deadline =3D
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1118  				i915_scheduler_next_virtual_deadline(rq_prio(rq));
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1119  			rq->sched.deadline =3D min(rq_deadline(rq), deadline);
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1120  		}
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1121  =

4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1122  		if (rq_deadline(rq) !=3D deadline) {
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1123  			deadline =3D rq_deadline(rq);
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1124  			pl =3D i915_sched_lookup_priolist(engine, deadline);
4e2dc7aa430c1b drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-06=
-07  1125  =

097a94815fb61b drivers/gpu/drm/i915/intel_lrc.c    Micha=C5=82 Winiarski 20=
17-09-28  1126  		}
8db05f5947132b drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2018-09=
-19  1127  		GEM_BUG_ON(RB_EMPTY_ROOT(&engine->execlists.queue.rb_root));
097a94815fb61b drivers/gpu/drm/i915/intel_lrc.c    Micha=C5=82 Winiarski 20=
17-09-28  1128  =

422d7df4f090bb drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2019-06=
-14  1129  		list_move(&rq->sched.link, pl);
672c368f939804 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-01=
-16  1130  		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
672c368f939804 drivers/gpu/drm/i915/gt/intel_lrc.c Chris Wilson     2020-01=
-16  1131  =

b16c765122f987 drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2018-10=
-01  1132  		active =3D rq;
b16c765122f987 drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2018-10=
-01  1133  	}
b16c765122f987 drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2018-10=
-01  1134  =

eb8d0f5af4ec2d drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2019-01=
-25  1135  	return active;
7e4992ac045ccd drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2017-09=
-28  1136  }
7e4992ac045ccd drivers/gpu/drm/i915/intel_lrc.c    Chris Wilson     2017-09=
-28  1137  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3377569577906141925==--

