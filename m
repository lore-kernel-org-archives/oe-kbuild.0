Content-Type: multipart/mixed; boundary="===============8787860626949512061=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 13/18] powerpc: Provide syscall wrapper
Date: Sun, 28 Aug 2022 05:27:21 +0800
Message-ID: <202208280548.OAnLXRKs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8787860626949512061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220819033806.162054-14-rmclure@linux.ibm.com>
References: <20220819033806.162054-14-rmclure@linux.ibm.com>
TO: Rohan McLure <rmclure@linux.ibm.com>
TO: linuxppc-dev(a)lists.ozlabs.org
CC: Rohan McLure <rmclure@linux.ibm.com>
CC: Andrew Donnellan <ajd@linux.ibm.com>

Hi Rohan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on tip/perf/core acme/perf/core linus/master v6.0-=
rc2 next-20220826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohan-McLure/powerpc=
-Syscall-wrapper-and-register-clearing/20220819-115151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/powerpc/include/asm/syscalls.h: asm/syscall_table_32.h is included =
more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8787860626949512061==--

