Content-Type: multipart/mixed; boundary="===============9185774004242511784=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_rss.c:199:6: sparse: void extern [addressable] [toplevel] hclge_comm_get_rss_indir_tbl( ... )
Date: Fri, 11 Mar 2022 23:55:55 +0800
Message-ID: <202203112351.77JbPTvt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9185774004242511784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jie Wang <wangjie125@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79b00034e9dcd2b065c1665c8b42f62b6b80a9be
commit: 6de06004286798ac4b4b10c8c74a6eb03c5035f2 net: hns3: create new set =
of common rss set APIs for PF and VF module
date:   9 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 weeks ago
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220=
311/202203112351.77JbPTvt-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6de06004286798ac4b4b10c8c74a6eb03c5035f2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6de06004286798ac4b4b10c8c74a6eb03c5035f2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash drivers/net/ethernet/hisilicon/hns3/ drivers/vdpa/=
mlx5/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_rss.c:199:6: =
sparse: sparse: symbol 'hclge_comm_get_rss_indir_tbl' redeclared with diffe=
rent type (incompatible argument 3 (different base types)):
>> drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_rss.c:199:6: =
sparse:    void extern [addressable] [toplevel] hclge_comm_get_rss_indir_tb=
l( ... )
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_rss.c: note: =
in included file:
   drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_rss.h:94:6: s=
parse: note: previously declared as:
>> drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_rss.h:94:6: s=
parse:    void extern [addressable] [toplevel] hclge_comm_get_rss_indir_tbl=
( ... )

vim +199 drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_rss.c

1bfd6682e9b5d4 Jie Wang 2022-01-05  198  =

1bfd6682e9b5d4 Jie Wang 2022-01-05 @199  void hclge_comm_get_rss_indir_tbl(=
struct hclge_comm_rss_cfg *rss_cfg,
1bfd6682e9b5d4 Jie Wang 2022-01-05  200  				  u32 *indir, u16 rss_ind_tbl_=
size)
1bfd6682e9b5d4 Jie Wang 2022-01-05  201  {
1bfd6682e9b5d4 Jie Wang 2022-01-05  202  	u16 i;
1bfd6682e9b5d4 Jie Wang 2022-01-05  203  =

1bfd6682e9b5d4 Jie Wang 2022-01-05  204  	if (!indir)
1bfd6682e9b5d4 Jie Wang 2022-01-05  205  		return;
1bfd6682e9b5d4 Jie Wang 2022-01-05  206  =

1bfd6682e9b5d4 Jie Wang 2022-01-05  207  	for (i =3D 0; i < rss_ind_tbl_siz=
e; i++)
1bfd6682e9b5d4 Jie Wang 2022-01-05  208  		indir[i] =3D rss_cfg->rss_indire=
ction_tbl[i];
1bfd6682e9b5d4 Jie Wang 2022-01-05  209  }
1bfd6682e9b5d4 Jie Wang 2022-01-05  210  =


:::::: The code at line 199 was first introduced by commit
:::::: 1bfd6682e9b5d42d07fa986709c9df88b18f9bc3 net: hns3: create new set o=
f common rss get APIs for PF and VF rss module

:::::: TO: Jie Wang <wangjie125@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9185774004242511784==--

