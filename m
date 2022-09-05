Content-Type: multipart/mixed; boundary="===============8474510620697811663=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_events.c:2684:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 05 Sep 2022 11:11:55 +0800
Message-ID: <202209051126.vBWu0hte-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8474510620697811663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: kernel/tr=
ace/trace_events.c:2684:22: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e18e42e4b280c85b76967a9106a13ca61c16179
commit: 6cb206508b621a9a0a2c35b60540e399225c8243 tracing: Check pid filteri=
ng when creating events
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220831 (https://download.01.org/0day-ci/archi=
ve/20220905/202209051126.vBWu0hte-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6cb206508b621a9a0a2c35b60540e399225c8243
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6cb206508b621a9a0a2c35b60540e399225c8243
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   kernel/trace/trace_events.c: In function 'trace_create_new_event':
   kernel/trace/trace_events.c:2681:32: warning: variable 'no_pid_list' set=
 but not used [-Wunused-but-set-variable]
    2681 |         struct trace_pid_list *no_pid_list;
         |                                ^~~~~~~~~~~
>> kernel/trace/trace_events.c:2684:22: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2684 |         unsigned int first;
         |                      ^~~~~
     '__add_event_to_tracers': event 1
       |
       | 3419 | static void __add_event_to_tracers(struct trace_event_call =
*call)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to '__add_event_to_tracers'
       |
     '__add_event_to_tracers': event 2
       |
       |include/linux/list.h:631:14:
       |  631 |              !list_entry_is_head(pos, head, member);       =
             \
       |      |              ^
       |      |              |
       |      |              (2) following 'true' branch...
   kernel/trace/trace_events.c:3423:9: note: in expansion of macro 'list_fo=
r_each_entry'
       | 3423 |         list_for_each_entry(tr, &ftrace_trace_arrays, list)
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     '__add_event_to_tracers': events 3-4
       |
       | 3424 |                 __trace_add_new_event(call, tr);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |      |                 (4) calling '__trace_add_new_event' from '_=
_add_event_to_tracers'
       |
       +--> '__trace_add_new_event': events 5-6
              |
              | 2711 | __trace_add_new_event(struct trace_event_call *call,=
 struct trace_array *tr)
              |      | ^~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (5) entry to '__trace_add_new_event'
              |......
              | 2715 |         file =3D trace_create_new_event(call, tr);
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (6) calling 'trace_create_new_event' =
from '__trace_add_new_event'
              |
              +--> 'trace_create_new_event': events 7-8
                     |
                     | 2678 | trace_create_new_event(struct trace_event_cal=
l *call,
                     |      | ^~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (7) entry to 'trace_create_new_event'
                     |......
                     | 2684 |         unsigned int first;
                     |      |                      ~~~~~
                     |      |                      |
                     |      |                      (8) use of uninitialized=
 value '<unknown>' here
                     |

vim +2684 kernel/trace/trace_events.c

0c564a538aa934 Steven Rostedt (Red Hat  2015-03-24  2676) =

7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05  2677) static struct tra=
ce_event_file *
2425bcb9240f8c Steven Rostedt (Red Hat  2015-05-05  2678) trace_create_new_=
event(struct trace_event_call *call,
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2679) 		       struct t=
race_array *tr)
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2680) {
6cb206508b621a Steven Rostedt (VMware   2021-11-26 @2681) 	struct trace_pid=
_list *no_pid_list;
6cb206508b621a Steven Rostedt (VMware   2021-11-26  2682) 	struct trace_pid=
_list *pid_list;
7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05  2683) 	struct trace_eve=
nt_file *file;
6cb206508b621a Steven Rostedt (VMware   2021-11-26 @2684) 	unsigned int fir=
st;
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2685) =

da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2686) 	file =3D kmem_ca=
che_alloc(file_cachep, GFP_TRACE);
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2687) 	if (!file)
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2688) 		return NULL;
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2689) =

6cb206508b621a Steven Rostedt (VMware   2021-11-26  2690) 	pid_list =3D rcu=
_dereference_protected(tr->filtered_pids,
6cb206508b621a Steven Rostedt (VMware   2021-11-26  2691) 					     lockdep=
_is_held(&event_mutex));
6cb206508b621a Steven Rostedt (VMware   2021-11-26  2692) 	no_pid_list =3D =
rcu_dereference_protected(tr->filtered_no_pids,
6cb206508b621a Steven Rostedt (VMware   2021-11-26  2693) 					     lockdep=
_is_held(&event_mutex));
6cb206508b621a Steven Rostedt (VMware   2021-11-26  2694) =

6cb206508b621a Steven Rostedt (VMware   2021-11-26  2695) 	if (!trace_pid_l=
ist_first(pid_list, &first) ||
6cb206508b621a Steven Rostedt (VMware   2021-11-26  2696) 	    !trace_pid_l=
ist_first(pid_list, &first))
6cb206508b621a Steven Rostedt (VMware   2021-11-26  2697) 		file->flags |=
=3D EVENT_FILE_FL_PID_FILTER;
6cb206508b621a Steven Rostedt (VMware   2021-11-26  2698) =

da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2699) 	file->event_call=
 =3D call;
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2700) 	file->tr =3D tr;
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2701) 	atomic_set(&file=
->sm_ref, 0);
85f2b08268c014 Tom Zanussi              2013-10-24  2702  	atomic_set(&file=
->tm_ref, 0);
85f2b08268c014 Tom Zanussi              2013-10-24  2703  	INIT_LIST_HEAD(&=
file->triggers);
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2704) 	list_add(&file->=
list, &tr->events);
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2705) =

da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2706) 	return file;
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2707) }
da511bf33e47ea Steven Rostedt (Red Hat  2013-05-09  2708) =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8474510620697811663==--

