Content-Type: multipart/mixed; boundary="===============1182315239802784801=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4374/4662] drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:826:18-48: WARNING: Use correct pointer type argument for sizeof
Date: Wed, 20 Apr 2022 06:08:51 +0800
Message-ID: <202204200641.UExpaKGA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1182315239802784801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jiri Pirko <jiri@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   634de1db0e9bbeb90d7b01020e59ec3dab4d38a1
commit: b217127e5e4ee0ecfce7c5f84cfe082238123bda [4374/4662] mlxsw: core_li=
necards: Add line card objects and implement provisioning
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
420/202204200641.UExpaKGA-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:826:18-48: WARNING:=
 Use correct pointer type argument for sizeof

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1182315239802784801==--

