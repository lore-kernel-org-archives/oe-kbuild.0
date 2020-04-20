Content-Type: multipart/mixed; boundary="===============8596961497744236186=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [peterz-queue:perf/urgent 1/1] kernel/events/core.c:7498:61: sparse: expected struct task_struct *p
Date: Mon, 20 Apr 2020 22:49:50 +0800
Message-ID: <202004202243.fnHMYuow%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8596961497744236186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ian Rogers <irogers@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git pe=
rf/urgent
head:   02625541e7b0aa1fb278e2d9f07a69b999c636c3
commit: 02625541e7b0aa1fb278e2d9f07a69b999c636c3 [1/1] perf/core: fix paren=
t pid/tid in task exit events
reproduce:
        # apt-get install sparse
        # sparse version: =

        git checkout 02625541e7b0aa1fb278e2d9f07a69b999c636c3
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   kernel/events/core.c:574:26: sparse: warning: function 'perf_pmu_name' w=
ith external linkage has definition
   kernel/events/core.c:1443:15: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:1443:15: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:1443:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1456:28: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:1456:28: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:1456:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3354:18: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:3354:18: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:3354:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3355:23: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:3355:23: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:3355:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3397:25: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:3397:25: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:3397:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3398:25: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:3398:25: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:3398:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4515:25: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:4515:25: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:4515:25: sparse:    struct perf_event_context *
   kernel/events/core.c:5773:9: sparse: error: incompatible types in compar=
ison expression (different address spaces):
   kernel/events/core.c:5773:9: sparse:    struct perf_buffer [noderef] <as=
n:4> *
   kernel/events/core.c:5773:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5249:24: sparse: warning: incorrect type in assignm=
ent (different base types)
   kernel/events/core.c:5249:24: sparse:    expected restricted __poll_t [u=
sertype] events
   kernel/events/core.c:5249:24: sparse:    got int
   kernel/events/core.c:5479:22: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:5479:22: sparse:    struct perf_buffer [noderef] <a=
sn:4> *
   kernel/events/core.c:5479:22: sparse:    struct perf_buffer *
   kernel/events/core.c:5615:14: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:5615:14: sparse:    struct perf_buffer [noderef] <a=
sn:4> *
   kernel/events/core.c:5615:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5648:14: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:5648:14: sparse:    struct perf_buffer [noderef] <a=
sn:4> *
   kernel/events/core.c:5648:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5705:14: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:5705:14: sparse:    struct perf_buffer [noderef] <a=
sn:4> *
   kernel/events/core.c:5705:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5791:14: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:5791:14: sparse:    struct perf_buffer [noderef] <a=
sn:4> *
   kernel/events/core.c:5791:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5804:14: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:5804:14: sparse:    struct perf_buffer [noderef] <a=
sn:4> *
   kernel/events/core.c:5804:14: sparse:    struct perf_buffer *
   kernel/events/internal.h:204:1: sparse: warning: incorrect type in argum=
ent 2 (different address spaces)
   kernel/events/internal.h:204:1: sparse:    expected void const [noderef]=
 <asn:1> *from
   kernel/events/internal.h:204:1: sparse:    got void const *buf
   kernel/events/core.c:6487:6: sparse: warning: symbol 'perf_pmu_snapshot_=
aux' was not declared. Should it be static?
   kernel/events/core.c:7302:23: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:7302:23: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:7302:23: sparse:    struct perf_event_context *
   kernel/events/core.c:7393:13: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:7393:13: sparse:    struct perf_buffer [noderef] <a=
sn:4> *
   kernel/events/core.c:7393:13: sparse:    struct perf_buffer *
   kernel/events/core.c:7498:61: sparse: warning: incorrect type in argumen=
t 2 (different address spaces)
>> kernel/events/core.c:7498:61: sparse:    expected struct task_struct *p
>> kernel/events/core.c:7498:61: sparse:    got struct task_struct [noderef=
] <asn:4> *real_parent
   kernel/events/core.c:7500:61: sparse: warning: incorrect type in argumen=
t 2 (different address spaces)
   kernel/events/core.c:7500:61: sparse:    expected struct task_struct *p
   kernel/events/core.c:7500:61: sparse:    got struct task_struct [noderef=
] <asn:4> *real_parent
   kernel/events/core.c:8187:23: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:8187:23: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:8187:23: sparse:    struct perf_event_context *
   kernel/events/core.c:8916:17: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:8916:17: sparse:    struct swevent_hlist [noderef] =
<asn:4> *
   kernel/events/core.c:8916:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:8936:17: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:8936:17: sparse:    struct swevent_hlist [noderef] =
<asn:4> *
   kernel/events/core.c:8936:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9056:16: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:9056:16: sparse:    struct swevent_hlist [noderef] =
<asn:4> *
   kernel/events/core.c:9056:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9067:9: sparse: error: incompatible types in compar=
ison expression (different address spaces):
   kernel/events/core.c:9067:9: sparse:    struct swevent_hlist [noderef] <=
asn:4> *
   kernel/events/core.c:9067:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:9056:16: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:9056:16: sparse:    struct swevent_hlist [noderef] =
<asn:4> *
   kernel/events/core.c:9056:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9106:17: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:9106:17: sparse:    struct swevent_hlist [noderef] =
<asn:4> *
   kernel/events/core.c:9106:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10456:1: sparse: warning: symbol 'dev_attr_nr_addr_=
filters' was not declared. Should it be static?
   kernel/events/core.c:12190:9: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:12190:9: sparse:    struct perf_event_context [node=
ref] <asn:4> *
   kernel/events/core.c:12190:9: sparse:    struct perf_event_context *
   kernel/events/core.c:12300:17: sparse: error: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:12300:17: sparse:    struct perf_event_context [nod=
eref] <asn:4> *
   kernel/events/core.c:12300:17: sparse:    struct perf_event_context *
   kernel/events/core.c:9056:16: sparse: error: incompatible types in compa=
rison expression (different address spaces):
   kernel/events/core.c:9056:16: sparse:    struct swevent_hlist [noderef] =
<asn:4> *
   kernel/events/core.c:9056:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:12724:17: sparse: error: incompatible types in comp=
arison expression (different address spaces):
   kernel/events/core.c:12724:17: sparse:    struct swevent_hlist [noderef]=
 <asn:4> *
   kernel/events/core.c:12724:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:157:9: sparse: warning: context imbalance in 'perf_=
ctx_lock' - wrong count at exit
   kernel/events/core.c:165:17: sparse: warning: context imbalance in 'perf=
_ctx_unlock' - unexpected unlock
   kernel/events/core.c:1463:17: sparse: warning: context imbalance in 'per=
f_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1490:17: sparse: warning: context imbalance in 'per=
f_pin_task_context' - unexpected unlock
   kernel/events/core.c:2782:9: sparse: warning: context imbalance in '__pe=
rf_install_in_context' - wrong count at exit
   kernel/events/core.c:4487:17: sparse: warning: context imbalance in 'fin=
d_get_context' - unexpected unlock

# https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?=
id=3D02625541e7b0aa1fb278e2d9f07a69b999c636c3
git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git=
/peterz/queue.git
git remote update peterz-queue
git checkout 02625541e7b0aa1fb278e2d9f07a69b999c636c3
vim +7498 kernel/events/core.c

67516844625f45 kernel/events/core.c  Jiri Olsa                2013-07-09  7=
473  =

cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar              2009-09-21  7=
474  static void perf_event_task_output(struct perf_event *event,
52d857a8784a09 kernel/events/core.c  Jiri Olsa                2013-05-06  7=
475  				   void *data)
60313ebed739b3 kernel/perf_counter.c Peter Zijlstra           2009-06-04  7=
476  {
52d857a8784a09 kernel/events/core.c  Jiri Olsa                2013-05-06  7=
477  	struct perf_task_event *task_event =3D data;
60313ebed739b3 kernel/perf_counter.c Peter Zijlstra           2009-06-04  7=
478  	struct perf_output_handle handle;
c980d1091810df kernel/perf_event.c   Arnaldo Carvalho de Melo 2010-12-04  7=
479  	struct perf_sample_data	sample;
9f498cc5be7e01 kernel/perf_counter.c Peter Zijlstra           2009-07-23  7=
480  	struct task_struct *task =3D task_event->task;
c980d1091810df kernel/perf_event.c   Arnaldo Carvalho de Melo 2010-12-04  7=
481  	int ret, size =3D task_event->event_id.header.size;
8bb39f9aa06826 kernel/perf_event.c   Mike Galbraith           2010-03-26  7=
482  =

67516844625f45 kernel/events/core.c  Jiri Olsa                2013-07-09  7=
483  	if (!perf_event_task_match(event))
67516844625f45 kernel/events/core.c  Jiri Olsa                2013-07-09  7=
484  		return;
67516844625f45 kernel/events/core.c  Jiri Olsa                2013-07-09  7=
485  =

c980d1091810df kernel/perf_event.c   Arnaldo Carvalho de Melo 2010-12-04  7=
486  	perf_event_header__init_id(&task_event->event_id.header, &sample, eve=
nt);
60313ebed739b3 kernel/perf_counter.c Peter Zijlstra           2009-06-04  7=
487  =

c980d1091810df kernel/perf_event.c   Arnaldo Carvalho de Melo 2010-12-04  7=
488  	ret =3D perf_output_begin(&handle, event,
a7ac67ea021b46 kernel/events/core.c  Peter Zijlstra           2011-06-27  7=
489  				task_event->event_id.header.size);
ef60777c9abd99 kernel/perf_event.c   Peter Zijlstra           2010-05-18  7=
490  	if (ret)
c980d1091810df kernel/perf_event.c   Arnaldo Carvalho de Melo 2010-12-04  7=
491  		goto out;
60313ebed739b3 kernel/perf_counter.c Peter Zijlstra           2009-06-04  7=
492  =

cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar              2009-09-21  7=
493  	task_event->event_id.pid =3D perf_event_pid(event, task);
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar              2009-09-21  7=
494  	task_event->event_id.tid =3D perf_event_tid(event, task);
02625541e7b0aa kernel/events/core.c  Ian Rogers               2020-04-17  7=
495  =

02625541e7b0aa kernel/events/core.c  Ian Rogers               2020-04-17  7=
496  	if (task_event->event_id.header.type =3D=3D PERF_RECORD_EXIT) {
02625541e7b0aa kernel/events/core.c  Ian Rogers               2020-04-17  7=
497  		task_event->event_id.ppid =3D perf_event_pid(event,
02625541e7b0aa kernel/events/core.c  Ian Rogers               2020-04-17 @7=
498  							task->real_parent);
02625541e7b0aa kernel/events/core.c  Ian Rogers               2020-04-17  7=
499  		task_event->event_id.ptid =3D perf_event_pid(event,
02625541e7b0aa kernel/events/core.c  Ian Rogers               2020-04-17  7=
500  							task->real_parent);
02625541e7b0aa kernel/events/core.c  Ian Rogers               2020-04-17  7=
501  	} else {  /* PERF_RECORD_FORK */
02625541e7b0aa kernel/events/core.c  Ian Rogers               2020-04-17  7=
502  		task_event->event_id.ppid =3D perf_event_pid(event, current);
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar              2009-09-21  7=
503  		task_event->event_id.ptid =3D perf_event_tid(event, current);
02625541e7b0aa kernel/events/core.c  Ian Rogers               2020-04-17  7=
504  	}
60313ebed739b3 kernel/perf_counter.c Peter Zijlstra           2009-06-04  7=
505  =

34f439278cef7b kernel/events/core.c  Peter Zijlstra           2015-02-20  7=
506  	task_event->event_id.time =3D perf_event_clock(event);
34f439278cef7b kernel/events/core.c  Peter Zijlstra           2015-02-20  7=
507  =

cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar              2009-09-21  7=
508  	perf_output_put(&handle, task_event->event_id);
393b2ad8c757ba kernel/perf_counter.c Arjan van de Ven         2009-09-12  7=
509  =

c980d1091810df kernel/perf_event.c   Arnaldo Carvalho de Melo 2010-12-04  7=
510  	perf_event__output_id_sample(event, &handle, &sample);
c980d1091810df kernel/perf_event.c   Arnaldo Carvalho de Melo 2010-12-04  7=
511  =

60313ebed739b3 kernel/perf_counter.c Peter Zijlstra           2009-06-04  7=
512  	perf_output_end(&handle);
c980d1091810df kernel/perf_event.c   Arnaldo Carvalho de Melo 2010-12-04  7=
513  out:
c980d1091810df kernel/perf_event.c   Arnaldo Carvalho de Melo 2010-12-04  7=
514  	task_event->event_id.header.size =3D size;
60313ebed739b3 kernel/perf_counter.c Peter Zijlstra           2009-06-04  7=
515  }
60313ebed739b3 kernel/perf_counter.c Peter Zijlstra           2009-06-04  7=
516  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8596961497744236186==--

