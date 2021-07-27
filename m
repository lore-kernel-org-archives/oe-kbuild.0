Content-Type: multipart/mixed; boundary="===============5197973941676285341=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [patch 1/4] add basic task isolation prctl interface
Date: Tue, 27 Jul 2021 20:29:37 +0800
Message-ID: <202107272009.GpUiCi0h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5197973941676285341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210727104119.551607458@fuller.cnet>
References: <20210727104119.551607458@fuller.cnet>
TO: Marcelo Tosatti <mtosatti@redhat.com>
TO: linux-kernel(a)vger.kernel.org
CC: Nitesh Lal <nilal@redhat.com>
CC: Nicolas Saenz Julienne <nsaenzju@redhat.com>
CC: Frederic Weisbecker <frederic@kernel.org>
CC: Christoph Lameter <cl@linux-foundation.org>
CC: Juri Lelli <juri.lelli@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Alex Belits <abelits@marvell.com>
CC: Peter Xu <peterx@redhat.com>
CC: Marcelo Tosatti <mtosatti@redhat.com>

Hi Marcelo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.14-rc3]
[cannot apply to hnaz-linux-mm/master linux/master tip/sched/core tip/core/=
entry next-20210726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marcelo-Tosatti/prctl-task=
-isolation-interface-and-vmstat-sync/20210727-184330
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
ff1176468d368232b684f75e82563369208bc371
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  270> /* Task isolati=
on control */
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  271> #define PR_ISOL=
_SET			62
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  272> #define PR_ISOL=
_GET			63
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  273> #define PR_ISOL=
_ENTER			64
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  274> #define PR_ISOL=
_EXIT			65
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  275> # define PR_ISO=
L_MODE			1
   Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  276> =

>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  277> # define PR_ISO=
L_MODE_NONE		0
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/prctl.h' differs=
 from latest version at 'include/uapi/linux/prctl.h':  278> # define PR_ISO=
L_MODE_NORMAL		1

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5197973941676285341==--

