Content-Type: multipart/mixed; boundary="===============1470307203750055605=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [lee-linaro:google/android-3.18-queue 396/1294] drivers/net/ethernet/intel/i40e/i40e_main.c:6297:29: warning: Same expression in both branches of ternary operator. [duplicateExpressionTernary]
Date: Mon, 24 May 2021 19:12:40 +0800
Message-ID: <202105241935.UUrQsgZY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1470307203750055605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lee Jones <lee.jones@linaro.org>

tree:   https://git.linaro.org/people/lee.jones/linux.git google/android-3.=
18-queue
head:   bce49b06e2e709ee4068dbea44c6248b696de463
commit: 8214bf079208b146e63cd0a3ce0ed335a87ce7b3 [396/1294] scripts/dtc: Ex=
port YYLOC global declaration
:::::: branch date: 4 days ago
:::::: commit date: 3 months ago
compiler: microblaze-linux-gcc (GCC) 5.5.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

        ^
>> drivers/net/ethernet/intel/i40e/i40e_main.c:6297:29: warning: Same expre=
ssion in both branches of ternary operator. [duplicateExpressionTernary]
         ntohs(port), port ? i : i);
                               ^

vim +6297 drivers/net/ethernet/intel/i40e/i40e_main.c

41c445ff0f482b Jesse Brandeburg 2013-09-11  6265  =

a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6266  #ifdef CONFIG_I40E_VXLAN
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6267  /**
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6268   * i40e_sync_vxlan_filter=
s_subtask - Sync the VSI filter list with HW
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6269   * @pf: board private str=
ucture
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6270   **/
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6271  static void i40e_sync_vxl=
an_filters_subtask(struct i40e_pf *pf)
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6272  {
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6273  	struct i40e_hw *hw =3D &=
pf->hw;
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6274  	i40e_status ret;
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6275  	u8 filter_index;
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6276  	__be16 port;
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6277  	int i;
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6278  =

a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6279  	if (!(pf->flags & I40E_F=
LAG_VXLAN_FILTER_SYNC))
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6280  		return;
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6281  =

a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6282  	pf->flags &=3D ~I40E_FLA=
G_VXLAN_FILTER_SYNC;
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6283  =

a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6284  	for (i =3D 0; i < I40E_M=
AX_PF_UDP_OFFLOAD_PORTS; i++) {
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6285  		if (pf->pending_vxlan_b=
itmap & (1 << i)) {
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6286  			pf->pending_vxlan_bitm=
ap &=3D ~(1 << i);
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6287  			port =3D pf->vxlan_por=
ts[i];
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6288  			ret =3D port ?
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6289  			      i40e_aq_add_udp_=
tunnel(hw, ntohs(port),
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6290  						     I40E_AQC_TUNNE=
L_TYPE_VXLAN,
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6291  						     &filter_index,=
 NULL)
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6292  			      : i40e_aq_del_ud=
p_tunnel(hw, i, NULL);
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6293  =

a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6294  			if (ret) {
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6295  				dev_info(&pf->pdev->d=
ev, "Failed to execute AQ command for %s port %d with index %d\n",
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6296  					 port ? "adding" : "=
deleting",
a1c9a9d9984d9a Jeff Kirsher     2013-12-28 @6297  					 ntohs(port), port ?=
 i : i);
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6298  =

a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6299  				pf->vxlan_ports[i] =
=3D 0;
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6300  			} else {
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6301  				dev_info(&pf->pdev->d=
ev, "%s port %d with AQ command with index %d\n",
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6302  					 port ? "Added" : "D=
eleted",
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6303  					 ntohs(port), port ?=
 i : filter_index);
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6304  			}
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6305  		}
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6306  	}
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6307  }
a1c9a9d9984d9a Jeff Kirsher     2013-12-28  6308  =


:::::: The code at line 6297 was first introduced by commit
:::::: a1c9a9d9984d9acf276089525b43a6528feab29b i40e: Implementation of VXL=
AN ndo's

:::::: TO: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1470307203750055605==--

