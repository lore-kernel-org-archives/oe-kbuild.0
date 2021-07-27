Content-Type: multipart/mixed; boundary="===============4317489740833270692=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android-4.19 3/24] Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs from latest version at 'include/uapi/linux/prctl.h': 226> /* Tagged user address controls for arm64 */
Date: Tue, 27 Jul 2021 08:51:50 +0800
Message-ID: <202107270836.Nh1d1Dzi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4317489740833270692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   13daec4d7036419a94790ecd8ca478efdb7f14f1
commit: f077ee260964eb925a593dcf30553432b3243ac8 [3/24] BACKPORT: arm64: In=
troduce prctl() options to control the tagged user addresses ABI
:::::: branch date: 1 year, 10 months ago
:::::: commit date: 1 year, 10 months ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  223> #define PR_SET_=
VMA		0x53564d41
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  224> # define PR_SET=
_VMA_ANON_NAME		0
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  225> =

>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  226> /* Tagged user =
address controls for arm64 */
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  227> #define PR_SET_=
TAGGED_ADDR_CTRL		55
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  228> #define PR_GET_=
TAGGED_ADDR_CTRL		56
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  229> # define PR_TAG=
GED_ADDR_ENABLE		(1UL << 0)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version@'include/uapi/linux/prctl.h':  230> =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4317489740833270692==--

