Content-Type: multipart/mixed; boundary="===============1653092654484328488=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_probe.c:1061:30: warning: use of NULL 'event_name' where non-null expected [CWE-476]
Date: Sat, 06 Aug 2022 21:17:08 +0800
Message-ID: <202208062156.YfcFCvo2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1653092654484328488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: kernel/tr=
ace/trace_probe.c:1061:30: warning: use of NULL 'event_name' where non-null=
 expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masami Hiramatsu <mhiramat@kernel.org>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: 8e242060c6a4947e8ae7d29794af6a581db08841 tracing/probes: Reject eve=
nts which have the same name of existing one
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220806/202208062156.YfcFCvo2-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8e242060c6a4947e8ae7d29794af6a581db08841
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8e242060c6a4947e8ae7d29794af6a581db08841
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
       |  760 | int traceprobe_parse_probe_arg(struct trace_probe *tp, int =
i, const char *arg,
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'traceprobe_parse_probe_arg'
       |......
       |  770 |         if (body) {
       |      |            ~
       |      |            |
       |      |            (2) following 'true' branch (when 'body' is non-=
NULL)...
       |  771 |                 if (body - arg > MAX_ARG_NAME_LEN) {
       |      |                    ~~~~~~~~~~~
       |      |                    |     |
       |      |                    |     (3) ...to here
       |      |                    (4) following 'false' branch...
       |......
       |  774 |                 } else if (body =3D=3D arg) {
       |      |                           ~
       |      |                           |
       |      |                           (5) ...to here
       |      |                           (6) following 'false' branch (whe=
n 'arg !=3D body')...
       |......
       |  778 |                 parg->name =3D kmemdup_nul(arg, body - arg,=
 GFP_KERNEL);
       |      |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |      |                              |
       |      |                              (7) ...to here
       |......
       |  785 |         if (!parg->name)
       |      |            ~
       |      |            |
       |      |            (8) following 'false' branch...
       |......
       |  788 |         if (!is_good_name(parg->name)) {
       |      |            ~ ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            | |
       |      |            | (9) ...to here
       |      |            (10) following 'true' branch...
       |......
       |  792 |         if (traceprobe_conflict_field_name(parg->name, tp->=
args, i)) {
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       |      |             |                                            |
       |      |             |                                            (1=
1) ...to here
       |      |             (12) calling 'traceprobe_conflict_field_name' f=
rom 'traceprobe_parse_probe_arg'
       |
       +--> 'traceprobe_conflict_field_name': event 13
              |
              |  744 | static int traceprobe_conflict_field_name(const char=
 *name,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (13) entry to 'traceprobe_conflict_field_=
name'
              |
            'traceprobe_conflict_field_name': events 14-15
              |
              |  749 |         for (i =3D 0; i < ARRAY_SIZE(reserved_field_=
names); i++)
              |  750 |                 if (strcmp(reserved_field_names[i], =
name) =3D=3D 0)
              |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
              |      |                     |
              |      |                     (15) ...to here
              |
       <------+
       |
     'traceprobe_parse_probe_arg': events 16-19
       |
       |  792 |         if (traceprobe_conflict_field_name(parg->name, tp->=
args, i)) {
       |      |            ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       |      |            ||
       |      |            |(16) returning to 'traceprobe_parse_probe_arg' =
from 'traceprobe_conflict_field_name'
       |      |            (17) following 'false' branch...
       |......
       |  797 |         return traceprobe_parse_probe_arg_body(body, &tp->s=
ize, parg, flags,
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (18) ...to here
       |      |                (19) calling 'traceprobe_parse_probe_arg_bod=
y' from 'traceprobe_parse_probe_arg'
       |  798 |                                                body - arg);
       |      |                                                ~~~~~~~~~~~
       |
       +--> 'traceprobe_parse_probe_arg_body': events 20-21
              |
              |  546 | static int traceprobe_parse_probe_arg_body(const cha=
r *argv, ssize_t *size,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (20) entry to 'traceprobe_parse_probe_arg=
_body'
              |......
              |  549 |         struct fetch_insn *code, *scode, *tmp =3D NU=
LL;
              |      |                            ~~~~
              |      |                            |
              |      |                            (21) use of uninitialized=
 value '<unknown>' here
              |
   kernel/trace/trace_probe.c: In function 'traceprobe_update_arg':
   kernel/trace/trace_probe.c:820:14: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     820 |         long offset;
         |              ^~~~~~
     'traceprobe_update_arg': event 1
       |
       |  820 |         long offset;
       |      |              ^~~~~~
       |      |              |
       |      |              (1) use of uninitialized value '<unknown>' here
       |
   kernel/trace/trace_probe.c: In function 'find_trace_event_call':
>> kernel/trace/trace_probe.c:1061:30: warning: use of NULL 'event_name' wh=
ere non-null expected [CWE-476] [-Wanalyzer-null-argument]
    1061 |                 if (!name || strcmp(event_name, name))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
     'trace_probe_register_event_call': event 1
       |
       | 1069 | int trace_probe_register_event_call(struct trace_probe *tp)
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'trace_probe_register_event_call'
       |
     'trace_probe_register_event_call': event 2
       |
       |include/asm-generic/bug.h:122:12:
       |  122 |         if (unlikely(__ret_warn_on))                       =
             \
       |      |            ^
       |      |            |
       |      |            (2) following 'false' branch...
   include/linux/lockdep.h:310:17: note: in expansion of macro 'WARN_ON'
       |  310 |                 WARN_ON(debug_locks &&                     =
             \
       |      |                 ^~~~~~~
   kernel/trace/trace_probe.c:1074:9: note: in expansion of macro 'lockdep_=
assert_held'
       | 1074 |         lockdep_assert_held(&event_mutex);
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'trace_probe_register_event_call': event 3
       |
       |kernel/trace/trace_probe.h:284:18:
       |  284 |         return tp->event->call.class->system;
       |      |                ~~^~~~~~~
       |      |                  |
       |      |                  (3) ...to here
       |
     'trace_probe_register_event_call': event 4
       |
       |kernel/trace/trace_probe.c:1076:13:
       | 1076 |         if (find_trace_event_call(trace_probe_group_name(tp=
),
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |             |
       |      |             (4) calling 'trace_probe_name' from 'trace_prob=
e_register_event_call'
       | 1077 |                                   trace_probe_name(tp)))
       |      |                                   ~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'trace_probe_name': events 5-6
              |
              |kernel/trace/trace_probe.h:277:27:
              |  277 | static inline const char *trace_probe_name(struct tr=
ace_probe *tp)
              |      |                           ^~~~~~~~~~~~~~~~
              |      |                           |
              |      |                           (5) entry to 'trace_probe_=
name'
              |  278 | {
              |  279 |         return trace_event_name(&tp->event->call);
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (6) calling 'trace_event_name' from '=
trace_probe_name'
              |
              +--> 'trace_event_name': events 7-9
                     |
                     |include/linux/trace_events.h:437:1:
                     |  437 | trace_event_name(struct trace_event_call *cal=
l)
                     |      | ^~~~~~~~~~~~~~~~
                     |      | |
                     |      | (7) entry to 'trace_event_name'
                     |  438 | {
                     |  439 |         if (call->flags & TRACE_EVENT_FL_TRAC=
EPOINT)
                     |      |            ~
                     |      |            |
                     |      |            (8) following 'true' branch...
                     |  440 |                 return call->tp ? call->tp->n=
ame : NULL;
                     |      |                        ~~~~~~~~
                     |      |                            |
                     |      |                            (9) ...to here
                     |
                   'trace_event_name': event 10
                     |
                     |  440 |                 return call->tp ? call->tp->n=
ame : NULL;
                     |
                   'trace_event_name': event 11
                     |
                     |cc1:
                     | (11): ...to here
                     |
              <------+
              |
            'trace_probe_name': event 12
              |
              |kernel/trace/trace_probe.h:279:16:
              |  279 |         return trace_event_name(&tp->event->call);
              |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (12) returning to 'trace_probe_name' =
from 'trace_event_name'
              |
       <------+
       |
     'trace_probe_register_event_call': events 13-14
       |
       |kernel/trace/trace_probe.c:1076:13:
       | 1076 |         if (find_trace_event_call(trace_probe_group_name(tp=
),
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |             |
       |      |             (13) returning to 'trace_probe_register_event_c=
all' from 'trace_probe_name'
       |      |             (14) calling 'find_trace_event_call' from 'trac=
e_probe_register_event_call'

vim +/event_name +1061 kernel/trace/trace_probe.c

46e5376d404d14 Masami Hiramatsu 2019-06-01  1049  =

8e242060c6a494 Masami Hiramatsu 2021-08-19  1050  static struct trace_event=
_call *
8e242060c6a494 Masami Hiramatsu 2021-08-19  1051  find_trace_event_call(con=
st char *system, const char *event_name)
8e242060c6a494 Masami Hiramatsu 2021-08-19  1052  {
8e242060c6a494 Masami Hiramatsu 2021-08-19  1053  	struct trace_event_call =
*tp_event;
8e242060c6a494 Masami Hiramatsu 2021-08-19  1054  	const char *name;
8e242060c6a494 Masami Hiramatsu 2021-08-19  1055  =

8e242060c6a494 Masami Hiramatsu 2021-08-19  1056  	list_for_each_entry(tp_e=
vent, &ftrace_events, list) {
8e242060c6a494 Masami Hiramatsu 2021-08-19  1057  		if (!tp_event->class->s=
ystem ||
8e242060c6a494 Masami Hiramatsu 2021-08-19  1058  		    strcmp(system, tp_e=
vent->class->system))
8e242060c6a494 Masami Hiramatsu 2021-08-19  1059  			continue;
8e242060c6a494 Masami Hiramatsu 2021-08-19  1060  		name =3D trace_event_na=
me(tp_event);
8e242060c6a494 Masami Hiramatsu 2021-08-19 @1061  		if (!name || strcmp(eve=
nt_name, name))
8e242060c6a494 Masami Hiramatsu 2021-08-19  1062  			continue;
8e242060c6a494 Masami Hiramatsu 2021-08-19  1063  		return tp_event;
8e242060c6a494 Masami Hiramatsu 2021-08-19  1064  	}
8e242060c6a494 Masami Hiramatsu 2021-08-19  1065  =

8e242060c6a494 Masami Hiramatsu 2021-08-19  1066  	return NULL;
8e242060c6a494 Masami Hiramatsu 2021-08-19  1067  }
8e242060c6a494 Masami Hiramatsu 2021-08-19  1068  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1653092654484328488==--

