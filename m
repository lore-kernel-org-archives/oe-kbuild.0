Content-Type: multipart/mixed; boundary="===============0476929779174742773=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:combined_queue 33/79] drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:819:18-48: WARNING: Use correct pointer type argument for sizeof
Date: Mon, 14 Mar 2022 05:13:33 +0800
Message-ID: <202203140550.Jh4DuTyQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0476929779174742773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Pirko <jiri@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   a0b1c3a5cea0369e9eeb4307b520ced5440f7b13
commit: 4d458d15b45f6a4fa8d89e0319d4bc3352bd33a0 [33/79] mlxsw: core_lineca=
rds: Add line card objects and implement provisioning
:::::: branch date: 3 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
314/202203140550.Jh4DuTyQ-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:819:18-48: WARNING:=
 Use correct pointer type argument for sizeof

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0476929779174742773==--

