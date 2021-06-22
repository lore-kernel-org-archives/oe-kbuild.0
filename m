Content-Type: multipart/mixed; boundary="===============6714085480950277395=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:perf/core 10/10] kernel/events/core.c:3831:19: warning: Uninitialized variable: cpuctx [uninitvar]
Date: Wed, 23 Jun 2021 04:07:21 +0800
Message-ID: <202106230403.1Xk7hcPt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6714085480950277395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git pe=
rf/core
head:   a918097a296b40b4e4f7a75edf4380a293b84eb5
commit: a918097a296b40b4e4f7a75edf4380a293b84eb5 [10/10] perf: Fix task con=
text PMU for Hetero
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
        ^
   kernel/events/internal.h:121:2: warning: int result is returned as long =
value. If the return value is long to avoid loss of information, then you h=
ave loss of information. [truncLongCastReturn]
    return rb->nr_pages << (PAGE_SHIFT + page_order(rb));
    ^
   kernel/events/internal.h:126:2: warning: int result is returned as long =
value. If the return value is long to avoid loss of information, then you h=
ave loss of information. [truncLongCastReturn]
    return rb->aux_nr_pages << PAGE_SHIFT;
    ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

        ^
>> kernel/events/core.c:3831:19: warning: Uninitialized variable: cpuctx [u=
ninitvar]
    pmu =3D ctx->pmu =3D cpuctx->ctx.pmu;
                     ^

vim +3831 kernel/events/core.c

329c0e012b99fa kernel/perf_event.c   Frederic Weisbecker 2010-01-17  3820  =

e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian    2011-02-14  3821  =
static void perf_event_context_sched_in(struct perf_event_context *ctx,
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian    2011-02-14  3822  =
					struct task_struct *task)
235c7fc7c500e4 kernel/perf_counter.c Ingo Molnar         2008-12-21  3823  {
108b02cfce04ee kernel/perf_event.c   Peter Zijlstra      2010-09-06  3824  =
	struct perf_cpu_context *cpuctx;
a918097a296b40 kernel/events/core.c  Peter Zijlstra      2021-06-22  3825  =
	struct pmu *pmu;
a918097a296b40 kernel/events/core.c  Peter Zijlstra      2021-06-22  3826  =

a918097a296b40 kernel/events/core.c  Peter Zijlstra      2021-06-22  3827  =
	/*
a918097a296b40 kernel/events/core.c  Peter Zijlstra      2021-06-22  3828  =
	 * HACK: for HETEROGENEOUS the task context might have switched to a
a918097a296b40 kernel/events/core.c  Peter Zijlstra      2021-06-22  3829  =
	 * different PMU, force (re)set the context,
a918097a296b40 kernel/events/core.c  Peter Zijlstra      2021-06-22  3830  =
	 */
a918097a296b40 kernel/events/core.c  Peter Zijlstra      2021-06-22 @3831  =
	pmu =3D ctx->pmu =3D cpuctx->ctx.pmu;
235c7fc7c500e4 kernel/perf_counter.c Ingo Molnar         2008-12-21  3832  =

108b02cfce04ee kernel/perf_event.c   Peter Zijlstra      2010-09-06  3833  =
	cpuctx =3D __get_cpu_context(ctx);
556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3834  =
	if (cpuctx->task_ctx =3D=3D ctx) {
556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3835  =
		if (cpuctx->sched_cb_usage)
556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3836  =
			__perf_pmu_sched_task(cpuctx, true);
329c0e012b99fa kernel/perf_event.c   Frederic Weisbecker 2010-01-17  3837  =
		return;
556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3838  =
	}
329c0e012b99fa kernel/perf_event.c   Frederic Weisbecker 2010-01-17  3839  =

facc43071cc0d4 kernel/events/core.c  Peter Zijlstra      2011-04-09  3840  =
	perf_ctx_lock(cpuctx, ctx);
fdccc3fb7a42ea kernel/events/core.c  leilei.lin          2017-08-09  3841  =
	/*
fdccc3fb7a42ea kernel/events/core.c  leilei.lin          2017-08-09  3842  =
	 * We must check ctx->nr_events while holding ctx->lock, such
fdccc3fb7a42ea kernel/events/core.c  leilei.lin          2017-08-09  3843  =
	 * that we serialize against perf_install_in_context().
fdccc3fb7a42ea kernel/events/core.c  leilei.lin          2017-08-09  3844  =
	 */
fdccc3fb7a42ea kernel/events/core.c  leilei.lin          2017-08-09  3845  =
	if (!ctx->nr_events)
fdccc3fb7a42ea kernel/events/core.c  leilei.lin          2017-08-09  3846  =
		goto unlock;
fdccc3fb7a42ea kernel/events/core.c  leilei.lin          2017-08-09  3847  =

556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3848  =
	perf_pmu_disable(pmu);
329c0e012b99fa kernel/perf_event.c   Frederic Weisbecker 2010-01-17  3849  =
	/*
329c0e012b99fa kernel/perf_event.c   Frederic Weisbecker 2010-01-17  3850  =
	 * We want to keep the following priority order:
329c0e012b99fa kernel/perf_event.c   Frederic Weisbecker 2010-01-17  3851  =
	 * cpu pinned (that don't need to move), task pinned,
329c0e012b99fa kernel/perf_event.c   Frederic Weisbecker 2010-01-17  3852  =
	 * cpu flexible, task flexible.
fe45bafbd0e1b5 kernel/events/core.c  Alexander Shishkin  2017-01-19  3853  =
	 *
fe45bafbd0e1b5 kernel/events/core.c  Alexander Shishkin  2017-01-19  3854  =
	 * However, if task's ctx is not carrying any pinned
fe45bafbd0e1b5 kernel/events/core.c  Alexander Shishkin  2017-01-19  3855  =
	 * events, no need to flip the cpuctx's events around.
329c0e012b99fa kernel/perf_event.c   Frederic Weisbecker 2010-01-17  3856  =
	 */
8e1a2031e4b556 kernel/events/core.c  Alexey Budankov     2017-09-08  3857  =
	if (!RB_EMPTY_ROOT(&ctx->pinned_groups.tree))
329c0e012b99fa kernel/perf_event.c   Frederic Weisbecker 2010-01-17  3858  =
		cpu_ctx_sched_out(cpuctx, EVENT_FLEXIBLE);
63e30d3e52d4d8 kernel/events/core.c  Peter Zijlstra      2016-01-08  3859  =
	perf_event_sched_in(cpuctx, ctx, task);
556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3860  =

556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3861  =
	if (cpuctx->sched_cb_usage && pmu->sched_task)
556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3862  =
		pmu->sched_task(cpuctx->task_ctx, true);
556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3863  =

556cccad389717 kernel/events/core.c  Kan Liang           2020-08-21  3864  =
	perf_pmu_enable(pmu);
fdccc3fb7a42ea kernel/events/core.c  leilei.lin          2017-08-09  3865  =

fdccc3fb7a42ea kernel/events/core.c  leilei.lin          2017-08-09  3866  =
unlock:
facc43071cc0d4 kernel/events/core.c  Peter Zijlstra      2011-04-09  3867  =
	perf_ctx_unlock(cpuctx, ctx);
235c7fc7c500e4 kernel/perf_counter.c Ingo Molnar         2008-12-21  3868  }
235c7fc7c500e4 kernel/perf_counter.c Ingo Molnar         2008-12-21  3869  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6714085480950277395==--

