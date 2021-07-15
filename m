Content-Type: multipart/mixed; boundary="===============6115291416719429186=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android12-5.10 46/54] Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs from latest version at 'include/uapi/linux/prctl.h': 237< # define PR_MTE_TCF_SHIFT 1
Date: Thu, 15 Jul 2021 19:30:42 +0800
Message-ID: <202107151939.61UqKqCT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6115291416719429186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   870488eb0745645feff5bddfd44fe538660b9cf8
commit: 6c08feaa27c2b8d87f07ea937dbd50ae181c9282 [46/54] FROMLIST: arm64: m=
te: change ASYNC and SYNC TCF settings into bitfields
:::::: branch date: 7 hours ago
:::::: commit date: 8 hours ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  237< # define PR_MTE=
_TCF_SHIFT		1
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  238< # define PR_MTE=
_TCF_NONE		(0UL << PR_MTE_TCF_SHIFT)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  239< # define PR_MTE=
_TCF_SYNC		(1UL << PR_MTE_TCF_SHIFT)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  240< # define PR_MTE=
_TCF_ASYNC		(2UL << PR_MTE_TCF_SHIFT)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  241< # define PR_MTE=
_TCF_MASK		(3UL << PR_MTE_TCF_SHIFT)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  237> # define PR_MTE=
_TCF_NONE		0
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  238> # define PR_MTE=
_TCF_SYNC		(1UL << 1)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  239> # define PR_MTE=
_TCF_ASYNC		(1UL << 2)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  240> # define PR_MTE=
_TCF_MASK		(PR_MTE_TCF_SYNC | PR_MTE_TCF_ASYNC)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  244> /* Unused; kept=
 only for source compatibility */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  245> # define PR_MTE=
_TCF_SHIFT		1
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  250> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  251> #define PR_SET_=
VMA		0x53564d41
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  252> # define PR_SET=
_VMA_ANON_NAME		0
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  253> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  254> /* Set/get enab=
led arm64 pointer authentication keys */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  255> #define PR_PAC_=
SET_ENABLED_KEYS		60
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  256> #define PR_PAC_=
GET_ENABLED_KEYS		61

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6115291416719429186==--

