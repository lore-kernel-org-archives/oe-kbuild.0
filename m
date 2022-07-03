Content-Type: multipart/mixed; boundary="===============2648434611104045731=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_probe.c:1061:30: warning: use of NULL 'event_name' where non-null expected [CWE-476]
Date: Sun, 03 Jul 2022 10:35:00 +0800
Message-ID: <202207031004.PznWEg1J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2648434611104045731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: kernel/tr=
ace/trace_probe.c:1061:30: warning: use of NULL 'event_name' where non-null=
 expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Masami Hiramatsu <mhiramat@kernel.org>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69cb6c6556ad89620547318439d6be8bb1629a5a
commit: 8e242060c6a4947e8ae7d29794af6a581db08841 tracing/probes: Reject eve=
nts which have the same name of existing one
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220702 (https://download.01.org/0day-ci/archi=
ve/20220703/202207031004.PznWEg1J-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
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
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
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
       |include/asm-generic/bug.h:121:29:
       |  121 |         int __ret_warn_on =3D !!(condition);               =
               \
       |      |                             ^~~~~~~~~~~~~
       |      |                             |
       |      |                             (2) following 'false' branch...
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
       +--> 'trace_probe_name': event 5
              |
              |kernel/trace/trace_probe.h:277:27:
              |  277 | static inline const char *trace_probe_name(struct tr=
ace_probe *tp)
              |      |                           ^~~~~~~~~~~~~~~~
              |      |                           |
              |      |                           (5) entry to 'trace_probe_=
name'
              |
            'trace_probe_name': events 6-7
              |
              |include/linux/trace_events.h:439:12:
              |  439 |         if (call->flags & TRACE_EVENT_FL_TRACEPOINT)
              |      |            ^
              |      |            |
              |      |            (6) following 'true' branch...
              |  440 |                 return call->tp ? call->tp->name : N=
ULL;
              |      |                        ~~~~~~~~
              |      |                            |
              |      |                            (7) ...to here
              |
            'trace_probe_name': event 8
              |
              |  440 |                 return call->tp ? call->tp->name : N=
ULL;
              |
            'trace_probe_name': event 9
              |
              |kernel/trace/trace_probe.h:279:16:
              |  279 |         return trace_event_name(&tp->event->call);
              |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (9) ...to here
              |
       <------+
       |
     'trace_probe_register_event_call': events 10-11
       |
       |kernel/trace/trace_probe.c:1076:13:
       | 1076 |         if (find_trace_event_call(trace_probe_group_name(tp=
),
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |             |
       |      |             (10) returning to 'trace_probe_register_event_c=
all' from 'trace_probe_name'
       |      |             (11) calling 'find_trace_event_call' from 'trac=
e_probe_register_event_call'
       | 1077 |                                   trace_probe_name(tp)))
       |      |                                   ~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'find_trace_event_call': event 12
              |
              | 1051 | find_trace_event_call(const char *system, const char=
 *event_name)
              |      | ^~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (12) entry to 'find_trace_event_call'
              |
            'find_trace_event_call': event 13
              |
              |include/linux/list.h:629:14:
              |  629 |              !list_entry_is_head(pos, head, member);=
                    \
              |      |              ^
              |      |              |
              |      |              (13) following 'true' branch...

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
--===============2648434611104045731==--

