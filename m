Content-Type: multipart/mixed; boundary="===============1999418266567282541=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [trace:ftrace/core 7/20] kernel/trace/ring_buffer.c:2802:26: warning: Either the condition 'nest>=5' is redundant or the array 'cpu_buffer->event_stamp[5]' is accessed at index 5, which is out of bounds. [arrayIndexOutOfBoundsCond]
Date: Sat, 27 Mar 2021 04:59:30 +0800
Message-ID: <202103270407.FAOnDfS3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1999418266567282541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
CC: Tom Zanussi <zanussi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git ftrace/core
head:   70193038a6ec9bbf10990a126432b0cbf56aa339
commit: a948c69d6fb1ba749a958a8a87d4eecdda28989d [7/20] ring-buffer: Add ve=
rifier for using ring_buffer_event_time_stamp()
:::::: branch date: 25 hours ago
:::::: commit date: 8 days ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/trace/ring_buffer.c:2802:26: warning: Either the condition 'nest>=
=3D5' is redundant or the array 'cpu_buffer->event_stamp[5]' is accessed at=
 index 5, which is out of bounds. [arrayIndexOutOfBoundsCond]
     cpu_buffer->event_stamp[nest] =3D info->ts;
                            ^
   kernel/trace/ring_buffer.c:2801:25: note: Assuming that condition 'nest>=
=3D5' is not redundant
    if (!WARN_ON_ONCE(nest >=3D MAX_NEST))
                           ^
   kernel/trace/ring_buffer.c:2802:26: note: Array index out of bounds
     cpu_buffer->event_stamp[nest] =3D info->ts;
                            ^

vim +2802 kernel/trace/ring_buffer.c

74e879373b377f Steven Rostedt (VMware   2020-06-30  2780) =

d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2781) /**
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2782)  * rb_update_even=
t - update event type and data
cfc585a401764f Steven Rostedt (VMware   2020-01-14  2783)  * @cpu_buffer: T=
he per cpu buffer of the @event
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2784)  * @event: the ev=
ent to update
cfc585a401764f Steven Rostedt (VMware   2020-01-14  2785)  * @info: The inf=
o to update the @event with (contains length and delta)
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2786)  *
cfc585a401764f Steven Rostedt (VMware   2020-01-14  2787)  * Update the typ=
e and data fields of the @event. The length
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2788)  * is the actual =
size that is written to the ring buffer,
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2789)  * and with this,=
 we can determine what to place into the
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2790)  * data field.
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2791)  */
b7dc42fd79390c Steven Rostedt (Red Hat  2015-09-03  2792) static void
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2793) rb_update_event(s=
truct ring_buffer_per_cpu *cpu_buffer,
a4543a2fa9ef31 Steven Rostedt (Red Hat  2015-05-29  2794) 		struct ring_buf=
fer_event *event,
9826b2733a4399 Steven Rostedt (Red Hat  2015-05-28  2795) 		struct rb_event=
_info *info)
9826b2733a4399 Steven Rostedt (Red Hat  2015-05-28  2796) {
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2797) 	unsigned length =
=3D info->length;
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2798) 	u64 delta =3D in=
fo->delta;
8672e4948d0c44 Steven Rostedt (VMware   2021-03-16  2799) 	unsigned int nes=
t =3D local_read(&cpu_buffer->committing) - 1;
8672e4948d0c44 Steven Rostedt (VMware   2021-03-16  2800) =

a948c69d6fb1ba Steven Rostedt (VMware   2021-03-16  2801) 	if (!WARN_ON_ONC=
E(nest >=3D MAX_NEST))
8672e4948d0c44 Steven Rostedt (VMware   2021-03-16 @2802) 		cpu_buffer->eve=
nt_stamp[nest] =3D info->ts;
a4543a2fa9ef31 Steven Rostedt (Red Hat  2015-05-29  2803) =

a4543a2fa9ef31 Steven Rostedt (Red Hat  2015-05-29  2804) 	/*
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2805) 	 * If we need to=
 add a timestamp, then we
6167c205ca9c21 Steven Rostedt (VMware   2018-05-16  2806) 	 * add it to the=
 start of the reserved space.
a4543a2fa9ef31 Steven Rostedt (Red Hat  2015-05-29  2807) 	 */
74e879373b377f Steven Rostedt (VMware   2020-06-30  2808) 	if (unlikely(inf=
o->add_timestamp))
74e879373b377f Steven Rostedt (VMware   2020-06-30  2809) 		rb_add_timestam=
p(cpu_buffer, &event, info, &delta, &length);
a4543a2fa9ef31 Steven Rostedt (Red Hat  2015-05-29  2810) =

d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2811) 	event->time_delt=
a =3D delta;
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2812) 	length -=3D RB_E=
VNT_HDR_SIZE;
adab66b71abfe2 Steven Rostedt (VMware   2020-12-14  2813) 	if (length > RB_=
MAX_SMALL_DATA || RB_FORCE_8BYTE_ALIGNMENT) {
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2814) 		event->type_len=
 =3D 0;
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2815) 		event->array[0]=
 =3D length;
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2816) 	} else
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2817) 		event->type_len=
 =3D DIV_ROUND_UP(length, RB_ALIGNMENT);
d90fd77402d3de Steven Rostedt (Red Hat  2015-05-29  2818) }
a4543a2fa9ef31 Steven Rostedt (Red Hat  2015-05-29  2819) =


:::::: The code at line 2802 was first introduced by commit
:::::: 8672e4948d0c44272cc05f8ff563dbf6b6c1289f ring-buffer: Add a event_st=
amp to cpu_buffer for each level of nesting

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1999418266567282541==--

