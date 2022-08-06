Content-Type: multipart/mixed; boundary="===============7999795412691105037=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RESEND v2 02/18] xfs: Increase XFS_DEFER_OPS_NR_INODES to 5
Date: Sat, 06 Aug 2022 22:39:22 +0800
Message-ID: <202208062229.vnaY4noA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7999795412691105037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220804194013.99237-3-allison.henderson@oracle.com>
References: <20220804194013.99237-3-allison.henderson@oracle.com>
TO: Allison Henderson <allison.henderson@oracle.com>
TO: linux-xfs(a)vger.kernel.org

Hi Allison,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on linus/master v5.19 next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allison-Henderson/Pa=
rent-Pointers/20220805-034225
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
806/202208062229.vnaY4noA-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_defer.c:846:24-25: WARNING opportunity for swap()

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7999795412691105037==--

