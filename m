Content-Type: multipart/mixed; boundary="===============3945165327369919465=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC v5 08/21] dept: Apply Dept to seqlock
Date: Thu, 17 Mar 2022 07:14:08 +0800
Message-ID: <202203170758.2sBLlrrf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3945165327369919465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1647397593-16747-9-git-send-email-byungchul.park@lge.com>
References: <1647397593-16747-9-git-send-email-byungchul.park@lge.com>
TO: Byungchul Park <byungchul.park@lge.com>

Hi Byungchul,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.17-rc8]
[cannot apply to tip/locking/core tip/sched/core hnaz-mm/master next-202203=
16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Byungchul-Park/DEPT-Depend=
ency-Tracker/20220316-102853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
2c271fe77d52a0555161926c232cd5bc07178b39
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-m001-20220314 (https://download.01.org/0day-ci/ar=
chive/20220317/202203170758.2sBLlrrf-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/kvm/x86.c:2129 update_pvclock_gtod() warn: statement has no effect=
 31

Old smatch warnings:
arch/x86/kvm/x86.c:2845 kvm_end_pvclock_update() warn: statement has no eff=
ect 31
arch/x86/kvm/x86.c:5066 kvm_arch_tsc_set_attr() warn: check for integer ove=
rflow 'offset'
arch/x86/kvm/x86.c:5107 kvm_vcpu_ioctl_device_attr() error: uninitialized s=
ymbol 'r'.

vim +2129 arch/x86/kvm/x86.c

16e8d74d2da992 Marcelo Tosatti 2012-11-27  2101  =

16e8d74d2da992 Marcelo Tosatti 2012-11-27  2102  static void update_pvclock=
_gtod(struct timekeeper *tk)
16e8d74d2da992 Marcelo Tosatti 2012-11-27  2103  {
16e8d74d2da992 Marcelo Tosatti 2012-11-27  2104  	struct pvclock_gtod_data =
*vdata =3D &pvclock_gtod_data;
16e8d74d2da992 Marcelo Tosatti 2012-11-27  2105  =

16e8d74d2da992 Marcelo Tosatti 2012-11-27  2106  	write_seqcount_begin(&vda=
ta->seq);
16e8d74d2da992 Marcelo Tosatti 2012-11-27  2107  =

16e8d74d2da992 Marcelo Tosatti 2012-11-27  2108  	/* copy pvclock gtod data=
 */
b95a8a27c300d1 Thomas Gleixner 2020-02-07  2109  	vdata->clock.vclock_mode	=
=3D tk->tkr_mono.clock->vdso_clock_mode;
876e78818def29 Peter Zijlstra  2015-03-19  2110  	vdata->clock.cycle_last		=
=3D tk->tkr_mono.cycle_last;
876e78818def29 Peter Zijlstra  2015-03-19  2111  	vdata->clock.mask		=3D tk=
->tkr_mono.mask;
876e78818def29 Peter Zijlstra  2015-03-19  2112  	vdata->clock.mult		=3D tk=
->tkr_mono.mult;
876e78818def29 Peter Zijlstra  2015-03-19  2113  	vdata->clock.shift		=3D t=
k->tkr_mono.shift;
917f9475c0a8ab Paolo Bonzini   2020-01-22  2114  	vdata->clock.base_cycles	=
=3D tk->tkr_mono.xtime_nsec;
917f9475c0a8ab Paolo Bonzini   2020-01-22  2115  	vdata->clock.offset		=3D =
tk->tkr_mono.base;
16e8d74d2da992 Marcelo Tosatti 2012-11-27  2116  =

b95a8a27c300d1 Thomas Gleixner 2020-02-07  2117  	vdata->raw_clock.vclock_m=
ode	=3D tk->tkr_raw.clock->vdso_clock_mode;
53fafdbb8b21fa Marcelo Tosatti 2019-10-28  2118  	vdata->raw_clock.cycle_la=
st	=3D tk->tkr_raw.cycle_last;
53fafdbb8b21fa Marcelo Tosatti 2019-10-28  2119  	vdata->raw_clock.mask		=
=3D tk->tkr_raw.mask;
53fafdbb8b21fa Marcelo Tosatti 2019-10-28  2120  	vdata->raw_clock.mult		=
=3D tk->tkr_raw.mult;
53fafdbb8b21fa Marcelo Tosatti 2019-10-28  2121  	vdata->raw_clock.shift		=
=3D tk->tkr_raw.shift;
917f9475c0a8ab Paolo Bonzini   2020-01-22  2122  	vdata->raw_clock.base_cyc=
les	=3D tk->tkr_raw.xtime_nsec;
917f9475c0a8ab Paolo Bonzini   2020-01-22  2123  	vdata->raw_clock.offset		=
=3D tk->tkr_raw.base;
16e8d74d2da992 Marcelo Tosatti 2012-11-27  2124  =

55dd00a73a5182 Marcelo Tosatti 2017-01-24  2125  	vdata->wall_time_sec     =
       =3D tk->xtime_sec;
55dd00a73a5182 Marcelo Tosatti 2017-01-24  2126  =

917f9475c0a8ab Paolo Bonzini   2020-01-22  2127  	vdata->offs_boot		=3D tk-=
>offs_boot;
53fafdbb8b21fa Marcelo Tosatti 2019-10-28  2128  =

16e8d74d2da992 Marcelo Tosatti 2012-11-27 @2129  	write_seqcount_end(&vdata=
->seq);
16e8d74d2da992 Marcelo Tosatti 2012-11-27  2130  }
8171cd68806bd2 Paolo Bonzini   2020-01-22  2131  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3945165327369919465==--

