Content-Type: multipart/mixed; boundary="===============2490813185804405306=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_eprobe.c:340:12: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 07 Aug 2022 09:16:43 +0800
Message-ID: <202208070930.Up78CdwE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2490813185804405306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: kernel/tr=
ace/trace_eprobe.c:340:12: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Tzvetomir Stoyanov (VMware)" <tz.stoyanov@gmail.com>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d1044fcb996e8de9b9ab392f4a767890e45202d
commit: 7491e2c442781a1860181adb5ab472a52075f393 tracing: Add a probe that =
attaches to trace events
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220807/202208070930.Up78CdwE-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7491e2c442781a1860181adb5ab472a52075f393
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7491e2c442781a1860181adb5ab472a52075f393
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
                     |  400 | {
                     |  401 |         if (call->flags & TRACE_EVENT_FL_DYNA=
MIC)
                     |      |            ~        =

                     |      |            |
                     |      |            (25) following 'false' branch...
                     |
                   'trace_event_try_get_ref': event 26
                     |
                     |cc1:
                     | (26): ...to here
                     |
              <------+
              |
            'find_and_get_event': events 27-28
              |
              |kernel/trace/trace_eprobe.c:775:22:
              |  775 |                 if (!trace_event_try_get_ref(tp_even=
t)) {
              |      |                    ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
              |      |                    | |
              |      |                    | (27) returning to 'find_and_get=
_event' from 'trace_event_try_get_ref'
              |      |                    (28) following 'true' branch...
              |
            'find_and_get_event': event 29
              |
              |cc1:
              | (29): ...to here
              |
       <------+
       |
     '__trace_eprobe_create': events 30-31
       |
       |  846 |         event_call =3D find_and_get_event(sys_name, sys_eve=
nt);
       |      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (30) returning to '__trace_eprobe_crea=
te' from 'find_and_get_event'
       |  847 |         ep =3D alloc_event_probe(group, event, event_call, =
argc - 2);
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |              |
       |      |              (31) calling 'alloc_event_probe' from '__trace=
_eprobe_create'
       |
       +--> 'alloc_event_probe': events 32-35
              |
              |  136 | static struct trace_eprobe *alloc_event_probe(const =
char *group,
              |      |                             ^~~~~~~~~~~~~~~~~
              |      |                             |
              |      |                             (32) entry to 'alloc_eve=
nt_probe'
              |......
              |  146 |         if (!event)
              |      |            ~                 =

              |      |            |
              |      |            (33) following 'false' branch (when 'even=
t' is non-NULL)...
              |......
              |  149 |         sys_name =3D event->class->system;
              |      |                    ~~~~~~~~~~~~
              |      |                         |
              |      |                         (34) ...to here
              |......
              |  152 |         ep =3D kzalloc(struct_size(ep, tp.args, narg=
s), GFP_KERNEL);
              |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
              |      |              |
              |      |              (35) calling 'kzalloc' from 'alloc_even=
t_probe'
              |
              +--> 'kzalloc': events 36-38
                     |
                     |include/linux/slab.h:719:21:
                     |  579 |         if (__builtin_constant_p(size)) {
                     |      |            ~         =

                     |      |            |
                     |      |            (37) following 'false' branch...
                     |......
                     |  596 |         return __kmalloc(size, flags);
                     |      |                ~~~~~~~~~~~~~~~~~~~~~~
                     |      |                |
                     |      |                (38) ...to here
                     |......
                     |  719 | static inline void *kzalloc(size_t size, gfp_=
t flags)
                     |      |                     ^~~~~~~
                     |      |                     |
                     |      |                     (36) entry to 'kzalloc'
                     |
              <------+
              |
            'alloc_event_probe': events 39-42
              |
              |kernel/trace/trace_eprobe.c:152:14:
              |  152 |         ep =3D kzalloc(struct_size(ep, tp.args, narg=
s), GFP_KERNEL);
              |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
              |      |              |
              |      |              (39) returning to 'alloc_event_probe' f=
rom 'kzalloc'
              |  153 |         if (!ep) {
              |      |            ~  =

              |      |            |
              |      |            (40) following 'true' branch (when 'ep' i=
s NULL)...
              |  154 |                 trace_event_put_ref(ep->event);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |
              |      |                 (41) ...to here
              |      |                 (42) dereference of NULL '0'
              |
   kernel/trace/trace_eprobe.c: In function 'fetch_store_strlen':
>> kernel/trace/trace_eprobe.c:340:12: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     340 |         u8 c;
         |            ^
     'eprobe_trigger_func': events 1-2
       |
       |  494 | static void eprobe_trigger_func(struct event_trigger_data *=
data,
       |      |             ^~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'eprobe_trigger_func'
       |......
       |  500 |         __eprobe_trace_func(edata, rec);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling '__eprobe_trace_func' from 'eprobe_trig=
ger_func'
       |
       +--> '__eprobe_trace_func': events 3-8
              |
              |  431 | __eprobe_trace_func(struct eprobe_data *edata, void =
*rec)
              |      | ^~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to '__eprobe_trace_func'
              |......
              |  438 |         if (WARN_ON_ONCE(call !=3D edata->file->even=
t_call))
              |      |            ~
              |      |            |
              |      |            (4) following 'false' branch...
              |......
              |  441 |         if (trace_trigger_soft_disabled(edata->file))
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            ||
              |      |            |(5) ...to here
              |      |            (6) following 'false' branch...
              |......
              |  444 |         fbuffer.trace_ctx =3D tracing_gen_ctx();
              |      |                             ~~~~~~~~~~~~~~~~~
              |      |                             |
              |      |                             (7) ...to here
              |......
              |  447 |         dsize =3D get_eprobe_size(&edata->ep->tp, re=
c);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |
              |      |                 (8) calling 'get_eprobe_size' from '=
__eprobe_trace_func'
              |
              +--> 'get_eprobe_size': events 9-14
                     |
                     |  292 | static int get_eprobe_size(struct trace_probe=
 *tp, void *rec)
                     |      |            ^~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'get_eprobe_size'
                     |......
                     |  297 |         for (i =3D 0; i < tp->nr_args; i++) {
                     |      |                     ~~~~~~~~~~~~~~~
                     |      |                       |
                     |      |                       (10) following 'true' b=
ranch...
                     |  298 |                 arg =3D tp->args + i;
                     |      |                       ~~
                     |      |                       |
                     |      |                       (11) ...to here
                     |  299 |                 if (unlikely(arg->dynamic)) {
                     |      |                    ~
                     |      |                    |
                     |      |                    (12) following 'true' bran=
ch...
                     |......
                     |  302 |                         val =3D get_event_fie=
ld(arg->code, rec);
                     |      |                               ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
                     |      |                               |
                     |      |                               (13) ...to here
                     |  303 |                         len =3D process_fetch=
_insn_bottom(arg->code + 1, val, NULL, NULL);
                     |      |                               ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                               |
                     |      |                               (14) calling 'p=
rocess_fetch_insn_bottom' from 'get_eprobe_size'
                     |
                     +--> 'process_fetch_insn_bottom': events 15-18
                            |
                            |kernel/trace/trace_probe_tmpl.h:72:1:
                            |   72 | process_fetch_insn_bottom(struct fetch=
_insn *code, unsigned long val,
                            |      | ^~~~~~~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (15) entry to 'process_fetch_insn_bott=
om'
                            |......
                            |   83 |                 if (code->op =3D=3D FE=
TCH_OP_DEREF) {
                            |      |                    ~
                            |      |                    |
                            |      |                    (16) following 'fal=
se' branch...
                            |......
                            |   87 |                 } else if (code->op =
=3D=3D FETCH_OP_UDEREF) {
                            |      |                           ~
                            |      |                           |
                            |      |                           (17) ...to h=
ere
                            |      |                           (18) followi=
ng 'false' branch...
                            |
                          'process_fetch_insn_bottom': event 19
                            |
                            |cc1:
                            | (19): ...to here
                            |
                          'process_fetch_insn_bottom': events 20-24
                            |
                            |  101 |         if (unlikely(!dest)) {
                            |      |            ^
                            |      |            |

vim +340 kernel/trace/trace_eprobe.c

7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  334) =

7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  335) /* Return the l=
ength of string -- including null terminal byte */
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  336) static nokprobe=
_inline int
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  337) fetch_store_str=
len(unsigned long addr)
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  338) {
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  339) 	int ret, len =
=3D 0;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19 @340) 	u8 c;
7491e2c442781a Tzvetomir Stoyanov (VMware  2021-08-19  341) =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2490813185804405306==--

