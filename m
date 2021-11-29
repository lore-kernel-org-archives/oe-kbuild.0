Content-Type: multipart/mixed; boundary="===============5242589446124961309=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [leon-rdma:rdma-next 3/30] drivers/infiniband/hw/mlx5/mr.c:284:60-70: ERROR: function remove_cache_mr_locked called on line 536 inside lock on line 531 but uses GFP_KERNEL
Date: Tue, 30 Nov 2021 06:24:48 +0800
Message-ID: <202111300656.j30HoPRc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5242589446124961309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Aharon Landau <aharonl@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git=
 rdma-next
head:   10e4a930e72e9e35f67b47c025dcac31d3a09b38
commit: bf3dc01c2c551326778642f6f663637b8cde461c [3/30] RDMA/mlx5: Replace =
the MR cache with an Mkey cache
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: csky-randconfig-c024-20211128 (https://download.01.org/0day-ci/arch=
ive/20211130/202111300656.j30HoPRc-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/mlx5/mr.c:284:60-70: ERROR: function remove_cache_=
mr_locked called on line 536 inside lock on line 531 but uses GFP_KERNEL
   drivers/infiniband/hw/mlx5/mr.c:284:60-70: ERROR: function remove_cache_=
mr_locked called on line 319 inside lock on line 312 but uses GFP_KERNEL

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5242589446124961309==--

