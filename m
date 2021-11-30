Content-Type: multipart/mixed; boundary="===============7143479464473801626=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/5] tracing: Disable preemption when using the filter buffer
Date: Tue, 30 Nov 2021 14:13:10 +0800
Message-ID: <202111301454.dzbIJfyp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7143479464473801626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211130024318.880190623@goodmis.org>
References: <20211130024318.880190623@goodmis.org>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: linux-kernel(a)vger.kernel.org
CC: Ingo Molnar <mingo@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Steven,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on linux/master hnaz-mm/master linus/master v5.16-=
rc3 next-20211129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Steven-Rostedt/tracing-Var=
ious-updates/20211130-104342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git for-next
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: x86_64-randconfig-s032-20211128 (https://download.01.org/0day-ci/ar=
chive/20211130/202111301454.dzbIJfyp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/1ac91c8764ae50601cd41dceb=
620205607ab59f6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Steven-Rostedt/tracing-Various-upd=
ates/20211130-104342
        git checkout 1ac91c8764ae50601cd41dceb620205607ab59f6
        # save the config file to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace.c:5710:1: sparse: sparse: trying to concatenate 9583-=
character string (8191 bytes max)
   kernel/trace/trace.c:392:28: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct trace_export **list @@ =
    got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:392:28: sparse:     expected struct trace_export **=
list
   kernel/trace/trace.c:392:28: sparse:     got struct trace_export [nodere=
f] __rcu **
   kernel/trace/trace.c:406:33: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct trace_export **list @@ =
    got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:406:33: sparse:     expected struct trace_export **=
list
   kernel/trace/trace.c:406:33: sparse:     got struct trace_export [nodere=
f] __rcu **
>> kernel/trace/trace.c:2769:27: sparse: sparse: assignment expression in c=
onditional
   kernel/trace/trace.c:2843:38: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct event_filter *filter @=
@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace.c:2843:38: sparse:     expected struct event_filter *=
filter
   kernel/trace/trace.c:2843:38: sparse:     got struct event_filter [noder=
ef] __rcu *filter
   kernel/trace/trace.c:3225:46: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected void const [noderef] __percp=
u *__vpp_verify @@     got struct trace_buffer_struct * @@
   kernel/trace/trace.c:3225:46: sparse:     expected void const [noderef] =
__percpu *__vpp_verify
   kernel/trace/trace.c:3225:46: sparse:     got struct trace_buffer_struct=
 *
   kernel/trace/trace.c:3241:9: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected void const [noderef] __percpu=
 *__vpp_verify @@     got int * @@
   kernel/trace/trace.c:3241:9: sparse:     expected void const [noderef] _=
_percpu *__vpp_verify
   kernel/trace/trace.c:3241:9: sparse:     got int *
   kernel/trace/trace.c:3251:17: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@     expected struct trace_buffer_struct *b=
uffers @@     got struct trace_buffer_struct [noderef] __percpu * @@
   kernel/trace/trace.c:3251:17: sparse:     expected struct trace_buffer_s=
truct *buffers
   kernel/trace/trace.c:3251:17: sparse:     got struct trace_buffer_struct=
 [noderef] __percpu *
   kernel/trace/trace.c:346:9: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   kernel/trace/trace.c:346:9: sparse:    struct trace_export [noderef] __r=
cu *
   kernel/trace/trace.c:346:9: sparse:    struct trace_export *
   kernel/trace/trace.c:361:9: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   kernel/trace/trace.c:361:9: sparse:    struct trace_export [noderef] __r=
cu *
   kernel/trace/trace.c:361:9: sparse:    struct trace_export *

vim +2769 kernel/trace/trace.c

2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2736) =

ccb469a198cffa Steven Rostedt            2012-08-02  2737  struct ring_buff=
er_event *
13292494379f92 Steven Rostedt (VMware    2019-12-13  2738) trace_event_buff=
er_lock_reserve(struct trace_buffer **current_rb,
7f1d2f8210195c Steven Rostedt (Red Hat   2015-05-05  2739) 			  struct trac=
e_event_file *trace_file,
ccb469a198cffa Steven Rostedt            2012-08-02  2740  			  int type, u=
nsigned long len,
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  2741  			  unsigned in=
t trace_ctx)
ccb469a198cffa Steven Rostedt            2012-08-02  2742  {
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2743) 	struct ring_buf=
fer_event *entry;
b94bc80df64823 Steven Rostedt (VMware    2021-03-16  2744) 	struct trace_ar=
ray *tr =3D trace_file->tr;
0fc1b09ff1ff40 Steven Rostedt (Red Hat   2016-05-03  2745) 	int val;
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2746) =

b94bc80df64823 Steven Rostedt (VMware    2021-03-16  2747) 	*current_rb =3D=
 tr->array_buffer.buffer;
0fc1b09ff1ff40 Steven Rostedt (Red Hat   2016-05-03  2748) =

b94bc80df64823 Steven Rostedt (VMware    2021-03-16  2749) 	if (!tr->no_fil=
ter_buffering_ref &&
1ac91c8764ae50 Steven Rostedt (VMware    2021-11-29  2750) 	    (trace_file=
->flags & (EVENT_FILE_FL_SOFT_DISABLED | EVENT_FILE_FL_FILTERED))) {
1ac91c8764ae50 Steven Rostedt (VMware    2021-11-29  2751) 		preempt_disabl=
e_notrace();
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2752) 		/*
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2753) 		 * Filtering i=
s on, so try to use the per cpu buffer first.
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2754) 		 * This buffer=
 will simulate a ring_buffer_event,
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2755) 		 * where the t=
ype_len is zero and the array[0] will
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2756) 		 * hold the fu=
ll length.
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2757) 		 * (see includ=
e/linux/ring-buffer.h for details on
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2758) 		 *  how the ri=
ng_buffer_event is structured).
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2759) 		 *
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2760) 		 * Using a tem=
p buffer during filtering and copying it
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2761) 		 * on a matche=
d filter is quicker than writing directly
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2762) 		 * into the ri=
ng buffer and then discarding it when
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2763) 		 * it doesn't =
match. That is because the discard
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2764) 		 * requires se=
veral atomic operations to get right.
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2765) 		 * Copying on =
match and doing nothing on a failed match
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2766) 		 * is still qu=
icker than no copy on match, but having
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2767) 		 * to discard =
out of the ring buffer on a failed match.
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2768) 		 */
1ac91c8764ae50 Steven Rostedt (VMware    2021-11-29 @2769) 		if (entry =3D =
__this_cpu_read(trace_buffered_event)) {
faa76a6c289f43 Steven Rostedt (VMware    2021-06-09  2770) 			int max_len =
=3D PAGE_SIZE - struct_size(entry, array, 1);
faa76a6c289f43 Steven Rostedt (VMware    2021-06-09  2771) =

0fc1b09ff1ff40 Steven Rostedt (Red Hat   2016-05-03  2772) 			val =3D this_=
cpu_inc_return(trace_buffered_event_cnt);
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2773) =

8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2774) 			/*
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2775) 			 * Preemption=
 is disabled, but interrupts and NMIs
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2776) 			 * can still =
come in now. If that happens after
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2777) 			 * the above =
increment, then it will have to go
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2778) 			 * back to th=
e old method of allocating the event
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2779) 			 * on the rin=
g buffer, and if the filter fails, it
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2780) 			 * will have =
to call ring_buffer_discard_commit()
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2781) 			 * to remove =
it.
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2782) 			 *
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2783) 			 * Need to al=
so check the unlikely case that the
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2784) 			 * length is =
bigger than the temp buffer size.
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2785) 			 * If that ha=
ppens, then the reserve is pretty much
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2786) 			 * guaranteed=
 to fail, as the ring buffer currently
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2787) 			 * only allow=
s events less than a page. But that may
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2788) 			 * change in =
the future, so let the ring buffer reserve
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2789) 			 * handle the=
 failure in that case.
8f0901cda14d3b Steven Rostedt (VMware    2021-06-09  2790) 			 */
faa76a6c289f43 Steven Rostedt (VMware    2021-06-09  2791) 			if (val =3D=
=3D 1 && likely(len <=3D max_len)) {
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  2792  				trace_event_=
setup(entry, type, trace_ctx);
0fc1b09ff1ff40 Steven Rostedt (Red Hat   2016-05-03  2793) 				entry->array=
[0] =3D len;
1ac91c8764ae50 Steven Rostedt (VMware    2021-11-29  2794) 				/* Return wi=
th preemption disabled */
0fc1b09ff1ff40 Steven Rostedt (Red Hat   2016-05-03  2795) 				return entry;
0fc1b09ff1ff40 Steven Rostedt (Red Hat   2016-05-03  2796) 			}
0fc1b09ff1ff40 Steven Rostedt (Red Hat   2016-05-03  2797) 			this_cpu_dec(=
trace_buffered_event_cnt);
0fc1b09ff1ff40 Steven Rostedt (Red Hat   2016-05-03  2798) 		}
1ac91c8764ae50 Steven Rostedt (VMware    2021-11-29  2799) 		/* __trace_buf=
fer_lock_reserve() disables preemption */
1ac91c8764ae50 Steven Rostedt (VMware    2021-11-29  2800) 		preempt_enable=
_notrace();
1ac91c8764ae50 Steven Rostedt (VMware    2021-11-29  2801) 	}
0fc1b09ff1ff40 Steven Rostedt (Red Hat   2016-05-03  2802) =

36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  2803  	entry =3D __tra=
ce_buffer_lock_reserve(*current_rb, type, len,
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  2804  					    trace_c=
tx);
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2805) 	/*
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2806) 	 * If tracing i=
s off, but we have triggers enabled
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2807) 	 * we still nee=
d to look at the event data. Use the temp_buffer
906695e5932463 Qiujun Huang              2020-10-31  2808  	 * to store the=
 trace event for the trigger to use. It's recursive
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2809) 	 * safe and wil=
l not be recorded anywhere.
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2810) 	 */
5d6ad960a71f0b Steven Rostedt (Red Hat   2015-05-13  2811) 	if (!entry && t=
race_file->flags & EVENT_FILE_FL_TRIGGER_COND) {
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2812) 		*current_rb =
=3D temp_buffer;
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  2813  		entry =3D __tr=
ace_buffer_lock_reserve(*current_rb, type, len,
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  2814  						    trace_=
ctx);
ccb469a198cffa Steven Rostedt            2012-08-02  2815  	}
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2816) 	return entry;
2c4a33aba5f9ea Steven Rostedt (Red Hat   2014-03-25  2817) }
ccb469a198cffa Steven Rostedt            2012-08-02  2818  EXPORT_SYMBOL_GP=
L(trace_event_buffer_lock_reserve);
ccb469a198cffa Steven Rostedt            2012-08-02  2819  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7143479464473801626==--

