Content-Type: multipart/mixed; boundary="===============1061306807714037507=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android-4.19 7/36] Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs from latest version at 'include/uapi/linux/sched.h': 58>
Date: Tue, 27 Jul 2021 09:00:00 +0800
Message-ID: <202107270845.kNG6tvZc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1061306807714037507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   f503db11786d937ce9cabd31b08e7280ed0f4b5a
commit: e6056b2a5b47a7cc7950ffcef7962beea1da179d [7/36] UPSTREAM: sched/ucl=
amp: Extend sched_setattr() to support utilization clamping
:::::: branch date: 1 year, 6 months ago
:::::: commit date: 1 year, 6 months ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   13> #define CLONE_P=
IDFD	0x00001000	/* set if a pidfd should be placed in parent */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   54> #define SCHED_F=
LAG_KEEP_POLICY		0x08
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   55> #define SCHED_F=
LAG_KEEP_PARAMS		0x10
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   56> #define SCHED_F=
LAG_UTIL_CLAMP_MIN	0x20
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   57> #define SCHED_F=
LAG_UTIL_CLAMP_MAX	0x40
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   58> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   59> #define SCHED_F=
LAG_KEEP_ALL	(SCHED_FLAG_KEEP_POLICY | \
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   60> 				 SCHED_FLAG=
_KEEP_PARAMS)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   61> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   62> #define SCHED_F=
LAG_UTIL_CLAMP	(SCHED_FLAG_UTIL_CLAMP_MIN | \
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   63> 				 SCHED_FLAG=
_UTIL_CLAMP_MAX)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   56< 			 SCHED_FLAG_=
DL_OVERRUN)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version@'include/uapi/linux/sched.h':   67> 			 SCHED_FLAG_=
DL_OVERRUN		| \
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   68> 			 SCHED_FLAG_=
KEEP_ALL		| \
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   69> 			 SCHED_FLAG_=
UTIL_CLAMP)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1061306807714037507==--

