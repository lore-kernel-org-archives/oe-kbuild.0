Content-Type: multipart/mixed; boundary="===============2665264047475991640=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] typecheck.h: Force a compilation error if typecheck(type, x) fails
Date: Fri, 04 Feb 2022 09:29:33 +0800
Message-ID: <202202040415.Srmlcnyq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2665264047475991640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220203143557.218112-1-abbotti@mev.co.uk>
References: <20220203143557.218112-1-abbotti@mev.co.uk>
TO: Ian Abbott <abbotti@mev.co.uk>
TO: linux-kernel(a)vger.kernel.org
CC: Ian Abbott <abbotti@mev.co.uk>

Hi Ian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.17-rc2 next-20220203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ian-Abbott/typecheck-h-For=
ce-a-compilation-error-if-typecheck-type-x-fails/20220203-223926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
2c271fe77d52a0555161926c232cd5bc07178b39
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: s390-randconfig-s032-20220131 (https://download.01.org/0day-ci/arch=
ive/20220204/202202040415.Srmlcnyq-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/358f0e8d7cf26c3747b40e1a5=
baf67e3ed00ac4a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ian-Abbott/typecheck-h-Force-a-com=
pilation-error-if-typecheck-type-x-fails/20220203-223926
        git checkout 358f0e8d7cf26c3747b40e1a5baf67e3ed00ac4a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
390 SHELL=3D/bin/bash arch/s390/kernel/

If you fix the issue, kindly add following tag as appropriate
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


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2665264047475991640==--

