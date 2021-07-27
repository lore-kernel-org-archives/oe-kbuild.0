Content-Type: multipart/mixed; boundary="===============8560377184103984659=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android-4.19 23/36] Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs from latest version at 'include/uapi/linux/sched.h': 5< #include <linux/types.h>
Date: Tue, 27 Jul 2021 09:07:29 +0800
Message-ID: <202107270915.VOfQDdMK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8560377184103984659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   f503db11786d937ce9cabd31b08e7280ed0f4b5a
commit: 71cb265a2bdc7767db5ab37b80d8910cc1fca772 [23/36] UPSTREAM: tools he=
aders UAPI: Sync sched.h with the kernel
:::::: branch date: 1 year, 6 months ago
:::::: commit date: 1 year, 6 months ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':    5< #include <linux=
/types.h>
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':    6< =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version@'include/uapi/linux/sched.h':   13> #define CLONE_P=
IDFD	0x00001000	/* set if a pidfd should be placed in parent */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   34< =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version@'include/uapi/linux/sched.h':   35< /*
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   36<  * Arguments fo=
r the clone3 syscall
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version@'include/uapi/linux/sched.h':   37<  */
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   38< struct clone_ar=
gs {
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   39< 	__aligned_u64 =
flags;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   40< 	__aligned_u64 =
pidfd;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   41< 	__aligned_u64 =
child_tid;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   42< 	__aligned_u64 =
parent_tid;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   43< 	__aligned_u64 =
exit_signal;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   44< 	__aligned_u64 =
stack;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   45< 	__aligned_u64 =
stack_size;
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   46< 	__aligned_u64 =
tls;
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version@'include/uapi/linux/sched.h':   47< };

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8560377184103984659==--

