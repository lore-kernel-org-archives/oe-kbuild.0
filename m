Content-Type: multipart/mixed; boundary="===============3188366343186235308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/pid_list.c:134:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 08 Aug 2022 05:09:21 +0800
Message-ID: <202208080514.7nLnMIGj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3188366343186235308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: kernel/tr=
ace/pid_list.c:134:22: warning: use of uninitialized value '<unknown>' [CWE=
-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: 8d6e90983ade25ec7925211ac31d9ccaf64b7edf tracing: Create a sparse b=
itmask for pid filtering
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220808/202208080514.7nLnMIGj-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8d6e90983ade25ec7925211ac31d9ccaf64b7edf
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8d6e90983ade25ec7925211ac31d9ccaf64b7edf
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   kernel/trace/pid_list.c: In function 'trace_pid_list_is_set':
>> kernel/trace/pid_list.c:134:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     134 |         unsigned int upper1;
         |                      ^~~~~~
     'trace_pid_list_is_set': event 1
       |
       |  134 |         unsigned int upper1;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   kernel/trace/pid_list.c:135:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     135 |         unsigned int upper2;
         |                      ^~~~~~
     'trace_pid_list_is_set': event 1
       |
       |  135 |         unsigned int upper2;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   kernel/trace/pid_list.c:136:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     136 |         unsigned int lower;
         |                      ^~~~~
     'trace_pid_list_is_set': event 1
       |
       |  136 |         unsigned int lower;
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   kernel/trace/pid_list.c: In function 'trace_pid_list_set':
   kernel/trace/pid_list.c:173:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     173 |         unsigned int upper1;
         |                      ^~~~~~
     'trace_pid_list_set': event 1
       |
       |  173 |         unsigned int upper1;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   kernel/trace/pid_list.c:174:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     174 |         unsigned int upper2;
         |                      ^~~~~~
     'trace_pid_list_set': event 1
       |
       |  174 |         unsigned int upper2;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   kernel/trace/pid_list.c:175:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     175 |         unsigned int lower;
         |                      ^~~~~
     'trace_pid_list_set': event 1
       |
       |  175 |         unsigned int lower;
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   kernel/trace/pid_list.c: In function 'trace_pid_list_clear':
   kernel/trace/pid_list.c:226:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     226 |         unsigned int upper1;
         |                      ^~~~~~
     'trace_pid_list_clear': event 1
       |
       |  226 |         unsigned int upper1;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   kernel/trace/pid_list.c:227:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     227 |         unsigned int upper2;
         |                      ^~~~~~
     'trace_pid_list_clear': event 1
       |
       |  227 |         unsigned int upper2;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   kernel/trace/pid_list.c:228:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     228 |         unsigned int lower;
         |                      ^~~~~
     'trace_pid_list_clear': event 1
       |
       |  228 |         unsigned int lower;
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   kernel/trace/pid_list.c: In function 'trace_pid_list_next':
   kernel/trace/pid_list.c:279:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     279 |         unsigned int upper1;
         |                      ^~~~~~
     'trace_pid_list_next': event 1
       |
       |  279 |         unsigned int upper1;
       |      |                      ^~~~~~
       |      |                      |

vim +134 kernel/trace/pid_list.c

8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  117) =

6954e415264eeb Steven Rostedt (VMware  2021-09-23  118) /**
6954e415264eeb Steven Rostedt (VMware  2021-09-23  119)  * trace_pid_list_i=
s_set - test if the pid is set in the list
6954e415264eeb Steven Rostedt (VMware  2021-09-23  120)  * @pid_list: The p=
id list to test
6954e415264eeb Steven Rostedt (VMware  2021-09-23  121)  * @pid: The pid to=
 to see if set in the list.
6954e415264eeb Steven Rostedt (VMware  2021-09-23  122)  *
6954e415264eeb Steven Rostedt (VMware  2021-09-23  123)  * Tests if @pid is=
 is set in the @pid_list. This is usually called
6954e415264eeb Steven Rostedt (VMware  2021-09-23  124)  * from the schedul=
er when a task is scheduled. Its pid is checked
6954e415264eeb Steven Rostedt (VMware  2021-09-23  125)  * if it should be =
traced or not.
6954e415264eeb Steven Rostedt (VMware  2021-09-23  126)  *
6954e415264eeb Steven Rostedt (VMware  2021-09-23  127)  * Return true if t=
he pid is in the list, false otherwise.
6954e415264eeb Steven Rostedt (VMware  2021-09-23  128)  */
6954e415264eeb Steven Rostedt (VMware  2021-09-23  129) bool trace_pid_list=
_is_set(struct trace_pid_list *pid_list, unsigned int pid)
6954e415264eeb Steven Rostedt (VMware  2021-09-23  130) {
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  131) 	union upper_chunk =
*upper_chunk;
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  132) 	union lower_chunk =
*lower_chunk;
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  133) 	unsigned long flag=
s;
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23 @134) 	unsigned int upper=
1;
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  135) 	unsigned int upper=
2;
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  136) 	unsigned int lower;
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  137) 	bool ret =3D false;
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  138) =

8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  139) 	if (!pid_list)
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  140) 		return false;
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  141) =

8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  142) 	if (pid_split(pid,=
 &upper1, &upper2, &lower) < 0)
6954e415264eeb Steven Rostedt (VMware  2021-09-23  143) 		return false;
6954e415264eeb Steven Rostedt (VMware  2021-09-23  144) =

8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  145) 	raw_spin_lock_irqs=
ave(&pid_list->lock, flags);
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  146) 	upper_chunk =3D pi=
d_list->upper[upper1];
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  147) 	if (upper_chunk) {
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  148) 		lower_chunk =3D u=
pper_chunk->data[upper2];
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  149) 		if (lower_chunk)
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  150) 			ret =3D test_bit=
(lower, lower_chunk->data);
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  151) 	}
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  152) 	raw_spin_unlock_ir=
qrestore(&pid_list->lock, flags);
8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  153) =

8d6e90983ade25 Steven Rostedt (VMware  2021-09-23  154) 	return ret;
6954e415264eeb Steven Rostedt (VMware  2021-09-23  155) }
6954e415264eeb Steven Rostedt (VMware  2021-09-23  156) =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3188366343186235308==--

