Content-Type: multipart/mixed; boundary="===============4440774139900511379=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC net-next v2 01/16] mctp: Add MCTP base
Date: Tue, 13 Jul 2021 15:39:24 +0800
Message-ID: <202107131525.uOLYoUag-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4440774139900511379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210713062023.3286895-2-jk@codeconstruct.com.au>
References: <20210713062023.3286895-2-jk@codeconstruct.com.au>
TO: Jeremy Kerr <jk@codeconstruct.com.au>

Hi Jeremy,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on pcmoore-selinux/next]
[also build test WARNING on ipvs/master linus/master v5.14-rc1 next-2021071=
2]
[cannot apply to net-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jeremy-Kerr/Add-Management=
-Component-Transport-Protocol-support/20210713-142928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git=
 next
:::::: branch date: 69 minutes ago
:::::: commit date: 69 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':  226> #defi=
ne AF_MCTP		45	/* Management component
>> Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':  227> 				 =
* transport protocol
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':  228> 				 =
*/
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':  227< #defi=
ne AF_MAX		45	/* For now.. */
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version@'include/linux/socket.h':  230> #defi=
ne AF_MAX		46	/* For now.. */
>> Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':  280> #defi=
ne PF_MCTP		AF_MCTP

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4440774139900511379==--

