Content-Type: multipart/mixed; boundary="===============0247592229298546575=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/kernel/vtime.c:148:13: sparse: sparse: too long token expansion
Date: Fri, 01 Jul 2022 02:33:45 +0800
Message-ID: <202207010242.bHbSCpsB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0247592229298546575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/s390/kernel/vtime.c:148:13: sparse: sparse: too long token expansion"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ian Abbott <abbotti@mev.co.uk>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220624-1857=
49/Ian-Abbott/typecheck-h-Force-a-compilation-error-if-typecheck-type-x-fai=
ls/20220203-223926
head:   cd7ada76c22048d07d7b311abf1d181d6d6fe6e2
commit: cd7ada76c22048d07d7b311abf1d181d6d6fe6e2 typecheck.h: Force a compi=
lation error if typecheck(type,x) fails
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: s390-randconfig-s031-20220629 (https://download.01.org/0day-ci/arch=
ive/20220701/202207010242.bHbSCpsB-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/cd7ada76c22048d07d7=
b311abf1d181d6d6fe6e2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20220624-185749/Ian-Abbott/=
typecheck-h-Force-a-compilation-error-if-typecheck-type-x-fails/20220203-22=
3926
        git checkout cd7ada76c22048d07d7b311abf1d181d6d6fe6e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
390 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> arch/s390/kernel/vtime.c:148:13: sparse: sparse: too long token expansion

vim +148 arch/s390/kernel/vtime.c

b7394a5f4ce954 Martin Schwidefsky  2017-01-05  120  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  121  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  122   * Update process times=
 based on virtual cpu times stored by entry.S
^1da177e4c3f41 Linus Torvalds      2005-04-16  123   * to the lowcore field=
s user_timer, system_timer & steal_clock.
^1da177e4c3f41 Linus Torvalds      2005-04-16  124   */
8f2b468aadc81c Martin Schwidefsky  2016-12-20  125  static int do_account_v=
time(struct task_struct *tsk)
^1da177e4c3f41 Linus Torvalds      2005-04-16  126  {
152e9b8676c6e7 Martin Schwidefsky  2019-03-06  127  	u64 timer, clock, user=
, guest, system, hardirq, softirq;
^1da177e4c3f41 Linus Torvalds      2005-04-16  128  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  129  	timer =3D S390_lowcore=
.last_update_timer;
^1da177e4c3f41 Linus Torvalds      2005-04-16  130  	clock =3D S390_lowcore=
.last_update_clock;
1c7673476b8298 Heiko Carstens      2021-02-02  131  	/* Use STORE CLOCK by =
default, STORE CLOCK FAST if available. */
1c7673476b8298 Heiko Carstens      2021-02-02  132  	alternative_io("stpt %=
0\n .insn s,0xb2050000,%1\n",
1c7673476b8298 Heiko Carstens      2021-02-02  133  		       "stpt %0\n .in=
sn s,0xb27c0000,%1\n",
1c7673476b8298 Heiko Carstens      2021-02-02  134  		       25,
1c7673476b8298 Heiko Carstens      2021-02-02  135  		       ASM_OUTPUT2("=
=3DQ" (S390_lowcore.last_update_timer),
1c7673476b8298 Heiko Carstens      2021-02-02  136  				   "=3DQ" (S390_low=
core.last_update_clock)),
1c7673476b8298 Heiko Carstens      2021-02-02  137  		       ASM_NO_INPUT_C=
LOBBER("cc"));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  138  	clock =3D S390_lowcore=
.last_update_clock - clock;
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  139  	timer -=3D S390_lowcor=
e.last_update_timer;
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  140  =

b7394a5f4ce954 Martin Schwidefsky  2017-01-05  141  	if (hardirq_count())
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  142  		S390_lowcore.hardirq_=
timer +=3D timer;
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  143  	else
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  144  		S390_lowcore.system_t=
imer +=3D timer;
^1da177e4c3f41 Linus Torvalds      2005-04-16  145  =

72d38b19781de4 Martin Schwidefsky  2015-09-18  146  	/* Update MT utilizati=
on calculation */
f341b8dff9823a Martin Schwidefsky  2015-08-03  147  	if (smp_cpu_mtid &&
72d38b19781de4 Martin Schwidefsky  2015-09-18 @148  	    time_after64(jiffi=
es_64, this_cpu_read(mt_scaling_jiffies)))
72d38b19781de4 Martin Schwidefsky  2015-09-18  149  		update_mt_scaling();
10ad34bc76dfbc Martin Schwidefsky  2015-01-14  150  =

b7394a5f4ce954 Martin Schwidefsky  2017-01-05  151  	/* Calculate cputime d=
elta */
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  152  	user =3D update_tsk_ti=
mer(&tsk->thread.user_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  153  				READ_ONCE(S390_lowc=
ore.user_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  154  	guest =3D update_tsk_t=
imer(&tsk->thread.guest_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  155  				 READ_ONCE(S390_low=
core.guest_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  156  	system =3D update_tsk_=
timer(&tsk->thread.system_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  157  				  READ_ONCE(S390_lo=
wcore.system_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  158  	hardirq =3D update_tsk=
_timer(&tsk->thread.hardirq_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  159  				   READ_ONCE(S390_l=
owcore.hardirq_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  160  	softirq =3D update_tsk=
_timer(&tsk->thread.softirq_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  161  				   READ_ONCE(S390_l=
owcore.softirq_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  162  	S390_lowcore.steal_tim=
er +=3D
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  163  		clock - user - guest =
- system - hardirq - softirq;
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  164  =

b7394a5f4ce954 Martin Schwidefsky  2017-01-05  165  	/* Push account value =
*/
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  166  	if (user) {
23244a5c8003d4 Frederic Weisbecker 2017-01-31  167  		account_user_time(tsk=
, cputime_to_nsecs(user));
5613fda9a503cd Frederic Weisbecker 2017-01-31  168  		tsk->utimescaled +=3D=
 cputime_to_nsecs(scale_vtime(user));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  169  	}
10ad34bc76dfbc Martin Schwidefsky  2015-01-14  170  =

b7394a5f4ce954 Martin Schwidefsky  2017-01-05  171  	if (guest) {
fb8b049c988f1f Frederic Weisbecker 2017-01-31  172  		account_guest_time(ts=
k, cputime_to_nsecs(guest));
5613fda9a503cd Frederic Weisbecker 2017-01-31  173  		tsk->utimescaled +=3D=
 cputime_to_nsecs(scale_vtime(guest));
10ad34bc76dfbc Martin Schwidefsky  2015-01-14  174  	}
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  175  =

b7394a5f4ce954 Martin Schwidefsky  2017-01-05  176  	if (system)
b29e061bb7a8d2 Martin Schwidefsky  2017-05-12  177  		account_system_index_=
scaled(tsk, system, CPUTIME_SYSTEM);
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  178  	if (hardirq)
b29e061bb7a8d2 Martin Schwidefsky  2017-05-12  179  		account_system_index_=
scaled(tsk, hardirq, CPUTIME_IRQ);
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  180  	if (softirq)
b29e061bb7a8d2 Martin Schwidefsky  2017-05-12  181  		account_system_index_=
scaled(tsk, softirq, CPUTIME_SOFTIRQ);
^1da177e4c3f41 Linus Torvalds      2005-04-16  182  =

b7394a5f4ce954 Martin Schwidefsky  2017-01-05  183  	return virt_timer_forw=
ard(user + guest + system + hardirq + softirq);
^1da177e4c3f41 Linus Torvalds      2005-04-16  184  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  185  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0247592229298546575==--

