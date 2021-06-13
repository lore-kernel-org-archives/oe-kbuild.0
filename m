Content-Type: multipart/mixed; boundary="===============0756342432333457444=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:tmp.tmp2 331/364] Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/socket.h' differs from latest version at 'include/linux/socket.h': 6> #include <linux/time64.h>
Date: Mon, 14 Jun 2021 04:00:07 +0800
Message-ID: <202106140405.ubrP6m2u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0756342432333457444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.tmp2
head:   adcceb5eb7aee38e4a9c15bdf599655f0e1b1324
commit: e2bad99921b8b8c3b207c648e777be607a21b0f9 [331/364] sched/headers, u=
io: Simplify <linux/uio.h> dependencies
:::::: branch date: 65 minutes ago
:::::: commit date: 73 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':    5> #incl=
ude <linux/socket_types.h>
>> Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':    6> #incl=
ude <linux/time64.h>
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   11< #incl=
ude <uapi/linux/socket.h>
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   26< typed=
ef __kernel_sa_family_t	sa_family_t;
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   27< =

   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   28< /*
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   29<  *	10=
03.1g requires sa_family_t and that sa_data is char.
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   30<  */
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   31< =

   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   32< struc=
t sockaddr {
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   33< 	sa_f=
amily_t	sa_family;	/* address family, AF_xxx	*/
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   34< 	char=
		sa_data[14];	/* 14 bytes of protocol address	*/
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   35< };
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   36< =

   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   37< struc=
t linger {
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   38< 	int	=
	l_onoff;	/* Linger active		*/
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   39< 	int	=
	l_linger;	/* How long to linger for	*/
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':   40< };
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version@'include/linux/socket.h':   41< =

>> Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':  370< struc=
t timespec64;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0756342432333457444==--

