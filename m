Content-Type: multipart/mixed; boundary="===============0298852866894006406=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_eprobe.c:777:4: warning: Consecutive return, break, continue, goto or throw statements are unnecessary. [duplicateBreak]
Date: Thu, 24 Feb 2022 22:08:58 +0800
Message-ID: <202202242119.TGICeJoI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0298852866894006406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Tzvetomir Stoyanov (VMware)" <tz.stoyanov@gmail.com>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23d04328444a8fa0ca060c5e532220dac8e8bc26
commit: 7491e2c442781a1860181adb5ab472a52075f393 tracing: Add a probe that =
attaches to trace events
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/trace/trace_eprobe.c:777:4: warning: Consecutive return, break, c=
ontinue, goto or throw statements are unnecessary. [duplicateBreak]
      break;
      ^
   kernel/trace/trace_eprobe.c:780:3: warning: Consecutive return, break, c=
ontinue, goto or throw statements are unnecessary. [duplicateBreak]
     break;
     ^

vim +777 kernel/trace/trace_eprobe.c

7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  754) =

7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  755) static struct t=
race_event_call *
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  756) find_and_get_ev=
ent(const char *system, const char *event_name)
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  757) {
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  758) 	struct trace_e=
vent_call *tp_event;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  759) 	const char *na=
me;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  760) =

7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  761) 	list_for_each_=
entry(tp_event, &ftrace_events, list) {
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  762) 		/* Skip other=
 probes and ftrace events */
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  763) 		if (tp_event-=
>flags &
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  764) 		    (TRACE_EV=
ENT_FL_IGNORE_ENABLE |
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  765) 		     TRACE_EV=
ENT_FL_KPROBE |
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  766) 		     TRACE_EV=
ENT_FL_UPROBE |
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  767) 		     TRACE_EV=
ENT_FL_EPROBE))
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  768) 			continue;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  769) 		if (!tp_event=
->class->system ||
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  770) 		    strcmp(sy=
stem, tp_event->class->system))
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  771) 			continue;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  772) 		name =3D trac=
e_event_name(tp_event);
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  773) 		if (!name || =
strcmp(event_name, name))
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  774) 			continue;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  775) 		if (!trace_ev=
ent_try_get_ref(tp_event)) {
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  776) 			return NULL;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19 @777) 			break;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  778) 		}
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  779) 		return tp_eve=
nt;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  780) 		break;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  781) 	}
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  782) 	return NULL;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  783) }
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  784) =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0298852866894006406==--

