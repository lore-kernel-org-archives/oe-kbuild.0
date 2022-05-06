Content-Type: multipart/mixed; boundary="===============9166282326419255888=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_tc_lib.c:853:29: warning: Uninitialized variable: fltr->src_vsi [uninitvar]
Date: Sat, 07 May 2022 07:57:44 +0800
Message-ID: <202205070748.dLsOS9IE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9166282326419255888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Michal Swiatkowski <michal.swiatkowski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Wojciech Drewek <wojciech.drewek@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b97bac0756a81cda5afd45417a99b5bccdcff67
commit: 7fde6d8b445f3af9caa5f3c2be384c2f797e21c5 ice: ndo_setup_tc implemen=
tation for PR
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
compiler: sparc-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7fde6d8b445f3af9caa5f3c2be384c2f797e21c5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/intel/ice/ice_tc_lib.c:853:29: warning: Uninitializ=
ed variable: fltr->src_vsi [uninitvar]
     ice_add_switch_fltr(fltr->src_vsi, fltr);
                               ^

vim +853 drivers/net/ethernet/intel/ice/ice_tc_lib.c

7fde6d8b445f3a Michal Swiatkowski 2021-08-06  839  =

7fde6d8b445f3a Michal Swiatkowski 2021-08-06  840  /**
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  841   * ice_replay_tc_fltrs -=
 replay TC filters
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  842   * @pf: pointer to PF st=
ruct
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  843   */
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  844  void ice_replay_tc_fltrs=
(struct ice_pf *pf)
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  845  {
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  846  	struct ice_tc_flower_fl=
tr *fltr;
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  847  	struct hlist_node *node;
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  848  =

7fde6d8b445f3a Michal Swiatkowski 2021-08-06  849  	hlist_for_each_entry_sa=
fe(fltr, node,
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  850  				  &pf->tc_flower_flt=
r_list,
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  851  				  tc_flower_node) {
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  852  		fltr->extack =3D NULL;
7fde6d8b445f3a Michal Swiatkowski 2021-08-06 @853  		ice_add_switch_fltr(fl=
tr->src_vsi, fltr);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9166282326419255888==--

