Content-Type: multipart/mixed; boundary="===============5841853399546947343=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/ring_buffer.c:5897 test_ringbuffer() warn: passing zero to 'PTR_ERR'
Date: Sun, 19 Dec 2021 09:24:41 +0800
Message-ID: <202112190945.uJ9b95NJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5841853399546947343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3f667b5d4053ad54aee13dab5c94f04ff75ddfdf
commit: 1e688dd2a3d6759d416616ff07afc4bb836c4213 powerpc/bug: Provide bette=
r flexibility to WARN_ON/__WARN_FLAGS() with asm goto
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-m031-20211218 (https://download.01.org/0day-ci/a=
rchive/20211219/202112190945.uJ9b95NJ-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/ring_buffer.c:5897 test_ringbuffer() warn: passing zero to 'PT=
R_ERR'
kernel/trace/trace_events_hist.c:1693 create_hist_field() error: we previou=
sly assumed 'field' could be null (see line 1627)

vim +/PTR_ERR +5897 kernel/trace/ring_buffer.c

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5855) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5856) static __init in=
t test_ringbuffer(void)
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5857) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5858) 	struct task_str=
uct *rb_hammer;
13292494379f92f Steven Rostedt (VMware   2019-12-13  5859) 	struct trace_bu=
ffer *buffer;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5860) 	int cpu;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5861) 	int ret =3D 0;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5862) =

a356646a56857c2 Steven Rostedt (VMware   2019-12-02  5863) 	if (security_lo=
cked_down(LOCKDOWN_TRACEFS)) {
ee19545220a8663 Stephen Rothwell         2019-12-06  5864  		pr_warn("Lockd=
own is enabled, skipping ring buffer tests\n");
a356646a56857c2 Steven Rostedt (VMware   2019-12-02  5865) 		return 0;
a356646a56857c2 Steven Rostedt (VMware   2019-12-02  5866) 	}
a356646a56857c2 Steven Rostedt (VMware   2019-12-02  5867) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5868) 	pr_info("Runnin=
g ring buffer tests...\n");
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5869) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5870) 	buffer =3D ring=
_buffer_alloc(RB_TEST_BUFFER_SIZE, RB_FL_OVERWRITE);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5871) 	if (WARN_ON(!bu=
ffer))
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5872) 		return 0;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5873) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5874) 	/* Disable buff=
er so that threads can't write to it yet */
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5875) 	ring_buffer_rec=
ord_off(buffer);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5876) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5877) 	for_each_online=
_cpu(cpu) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5878) 		rb_data[cpu].b=
uffer =3D buffer;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5879) 		rb_data[cpu].c=
pu =3D cpu;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5880) 		rb_data[cpu].c=
nt =3D cpu;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5881) 		rb_threads[cpu=
] =3D kthread_create(rb_test, &rb_data[cpu],
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5882) 						 "rbtester=
/%d", cpu);
62277de758b155d Wei Yongjun              2016-06-17  5883  		if (WARN_ON(IS=
_ERR(rb_threads[cpu]))) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5884) 			pr_cont("FAIL=
ED\n");
62277de758b155d Wei Yongjun              2016-06-17  5885  			ret =3D PTR_E=
RR(rb_threads[cpu]);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5886) 			goto out_free;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5887) 		}
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5888) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5889) 		kthread_bind(r=
b_threads[cpu], cpu);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5890)  		wake_up_proce=
ss(rb_threads[cpu]);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5891) 	}
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5892) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5893) 	/* Now create t=
he rb hammer! */
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5894) 	rb_hammer =3D k=
thread_run(rb_hammer_test, NULL, "rbhammer");
62277de758b155d Wei Yongjun              2016-06-17  5895  	if (WARN_ON(IS_=
ERR(rb_hammer))) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5896) 		pr_cont("FAILE=
D\n");
62277de758b155d Wei Yongjun              2016-06-17 @5897  		ret =3D PTR_ER=
R(rb_hammer);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5898) 		goto out_free;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5899) 	}
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5900) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5901) 	ring_buffer_rec=
ord_on(buffer);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5902) 	/*
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5903) 	 * Show buffer =
is enabled before setting rb_test_started.
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5904) 	 * Yes there's =
a small race window where events could be
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5905) 	 * dropped and =
the thread wont catch it. But when a ring
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5906) 	 * buffer gets =
enabled, there will always be some kind of
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5907) 	 * delay before=
 other CPUs see it. Thus, we don't care about
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5908) 	 * those droppe=
d events. We care about events dropped after
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5909) 	 * the threads =
see that the buffer is active.
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5910) 	 */
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5911) 	smp_wmb();
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5912) 	rb_test_started=
 =3D true;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5913) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5914) 	set_current_sta=
te(TASK_INTERRUPTIBLE);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5915) 	/* Just run for=
 10 seconds */;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5916) 	schedule_timeou=
t(10 * HZ);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5917) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5918) 	kthread_stop(rb=
_hammer);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5919) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5920)  out_free:
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5921) 	for_each_online=
_cpu(cpu) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5922) 		if (!rb_thread=
s[cpu])
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5923) 			break;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5924) 		kthread_stop(r=
b_threads[cpu]);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5925) 	}
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5926) 	if (ret) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5927) 		ring_buffer_fr=
ee(buffer);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5928) 		return ret;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5929) 	}
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5930) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5931) 	/* Report! */
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5932) 	pr_info("finish=
ed\n");
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5933) 	for_each_online=
_cpu(cpu) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5934) 		struct ring_bu=
ffer_event *event;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5935) 		struct rb_test=
_data *data =3D &rb_data[cpu];
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5936) 		struct rb_item=
 *item;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5937) 		unsigned long =
total_events;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5938) 		unsigned long =
total_dropped;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5939) 		unsigned long =
total_written;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5940) 		unsigned long =
total_alloc;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5941) 		unsigned long =
total_read =3D 0;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5942) 		unsigned long =
total_size =3D 0;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5943) 		unsigned long =
total_len =3D 0;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5944) 		unsigned long =
total_lost =3D 0;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5945) 		unsigned long =
lost;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5946) 		int big_event_=
size;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5947) 		int small_even=
t_size;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5948) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5949) 		ret =3D -1;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5950) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5951) 		total_events =
=3D data->events + data->events_nested;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5952) 		total_written =
=3D data->bytes_written + data->bytes_written_nested;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5953) 		total_alloc =
=3D data->bytes_alloc + data->bytes_alloc_nested;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5954) 		total_dropped =
=3D data->bytes_dropped + data->bytes_dropped_nested;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5955) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5956) 		big_event_size=
 =3D data->max_size + data->max_size_nested;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5957) 		small_event_si=
ze =3D data->min_size + data->min_size_nested;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5958) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5959) 		pr_info("CPU %=
d:\n", cpu);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5960) 		pr_info("     =
         events:    %ld\n", total_events);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5961) 		pr_info("     =
  dropped bytes:    %ld\n", total_dropped);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5962) 		pr_info("     =
  alloced bytes:    %ld\n", total_alloc);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5963) 		pr_info("     =
  written bytes:    %ld\n", total_written);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5964) 		pr_info("     =
  biggest event:    %d\n", big_event_size);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5965) 		pr_info("     =
 smallest event:    %d\n", small_event_size);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5966) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5967) 		if (RB_WARN_ON=
(buffer, total_dropped))
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5968) 			break;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5969) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5970) 		ret =3D 0;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5971) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5972) 		while ((event =
=3D ring_buffer_consume(buffer, cpu, NULL, &lost))) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5973) 			total_lost +=
=3D lost;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5974) 			item =3D ring=
_buffer_event_data(event);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5975) 			total_len +=
=3D ring_buffer_event_length(event);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5976) 			total_size +=
=3D item->size + sizeof(struct rb_item);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5977) 			if (memcmp(&i=
tem->str[0], rb_string, item->size) !=3D 0) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5978) 				pr_info("FAI=
LED!\n");
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5979) 				pr_info("buf=
fer had: %.*s\n", item->size, item->str);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5980) 				pr_info("exp=
ected:   %.*s\n", item->size, rb_string);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5981) 				RB_WARN_ON(b=
uffer, 1);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5982) 				ret =3D -1;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5983) 				break;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5984) 			}
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5985) 			total_read++;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5986) 		}
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5987) 		if (ret)
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5988) 			break;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5989) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5990) 		ret =3D -1;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5991) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5992) 		pr_info("     =
    read events:   %ld\n", total_read);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5993) 		pr_info("     =
    lost events:   %ld\n", total_lost);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5994) 		pr_info("     =
   total events:   %ld\n", total_lost + total_read);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5995) 		pr_info("  rec=
orded len bytes:   %ld\n", total_len);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5996) 		pr_info(" reco=
rded size bytes:   %ld\n", total_size);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5997) 		if (total_lost)
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5998) 			pr_info(" Wit=
h dropped events, record len and size may not match\n"
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  5999) 				" alloced an=
d written from above\n");
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6000) 		if (!total_los=
t) {
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6001) 			if (RB_WARN_O=
N(buffer, total_len !=3D total_alloc ||
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6002) 				       total=
_size !=3D total_written))
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6003) 				break;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6004) 		}
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6005) 		if (RB_WARN_ON=
(buffer, total_lost + total_read !=3D total_events))
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6006) 			break;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6007) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6008) 		ret =3D 0;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6009) 	}
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6010) 	if (!ret)
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6011) 		pr_info("Ring =
buffer PASSED!\n");
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6012) =

6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6013) 	ring_buffer_fre=
e(buffer);
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6014) 	return 0;
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6015) }
6c43e554a2a5c1f Steven Rostedt (Red Hat  2013-03-15  6016) =


:::::: The code at line 5897 was first introduced by commit
:::::: 62277de758b155dc04b78f195a1cb5208c37b2df ring-buffer: Fix return val=
ue check in test_ringbuffer()

:::::: TO: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5841853399546947343==--

