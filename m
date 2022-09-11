Content-Type: multipart/mixed; boundary="===============6242863333350191311=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_sriov.c:39:14: warning: Uninitialized variables: vf.rcu, vf.refcnt, vf.pf, vf.cfg_lock, vf.vf_id, vf.lan_vsi_idx, vf.ctrl_vsi_idx, vf.fdir, vf.first_vector_idx, vf.vf_sw_id, vf.vf_ver, vf.driver_caps, vf.dev_lan_addr, vf...
Date: Sun, 11 Sep 2022 19:50:28 +0800
Message-ID: <202209111903.7ZskMAaJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6242863333350191311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/ethernet/intel/ice/ice_sriov.c:39:14: warning: Uninitialized variables: =
vf.rcu, vf.refcnt, vf.pf, vf.cfg_lock, vf.vf_id, vf.lan_vsi_idx, vf.ctrl_vs=
i_idx, vf.fdir, vf.first_vector_idx, vf.vf_sw_id, vf.vf_ver, vf.driver_caps=
, vf.dev_lan_addr, vf.hw_lan_addr, vf.legacy_last_added_umac, vf.port_vlan_=
info, vf.vlan_v2_caps, vf.pf_set_mac, vf.trusted, vf.spoofchk, vf.link_forc=
ed, vf.link_up, vf.lan_vsi_num, vf.min_tx_rate, vf.max_tx_rate, vf.vf_caps,=
 vf.num_req_qs, vf.num_mac, vf.num_vf_qs, vf.mdd_rx_events, vf.mdd_tx_event=
s, vf.repr, vf.virtchnl_ops, vf.vf_ops, vf.devlink_port [uninitvar]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jacob Keller <jacob.e.keller@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b96fbd602d35739b5cdb49baa02048f2c41fdab1
commit: bf93bf791cec8aee0c3b9811097813726c1c01be ice: introduce ice_virtchn=
l.c and ice_virtchnl.h
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout bf93bf791cec8aee0c3b9811097813726c1c01be
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/intel/ice/ice_sriov.c:39:14: warning: Uninitialized=
 variables: vf.rcu, vf.refcnt, vf.pf, vf.cfg_lock, vf.vf_id, vf.lan_vsi_idx=
, vf.ctrl_vsi_idx, vf.fdir, vf.first_vector_idx, vf.vf_sw_id, vf.vf_ver, vf=
.driver_caps, vf.dev_lan_addr, vf.hw_lan_addr, vf.legacy_last_added_umac, v=
f.port_vlan_info, vf.vlan_v2_caps, vf.pf_set_mac, vf.trusted, vf.spoofchk, =
vf.link_forced, vf.link_up, vf.lan_vsi_num, vf.min_tx_rate, vf.max_tx_rate,=
 vf.vf_caps, vf.num_req_qs, vf.num_mac, vf.num_vf_qs, vf.mdd_rx_events, vf.=
mdd_tx_events, vf.repr, vf.virtchnl_ops, vf.vf_ops, vf.devlink_port [uninit=
var]
     ice_put_vf(vf);
                ^
>> drivers/net/ethernet/intel/ice/ice_sriov.c:641:7: warning: Uninitialized=
 variable: vf->vf_ops [uninitvar]
     vf->vf_ops->clear_reset_trigger(vf);
         ^
>> drivers/net/ethernet/intel/ice/ice_sriov.c:1097:45: warning: Uninitializ=
ed variable: vf->vf_id [uninitvar]
     reg_idx =3D (hw->func_caps.vf_base_id + vf->vf_id) / 32;
                                               ^
   drivers/net/ethernet/intel/ice/ice_sriov.c:1089:61: note: Assuming condi=
tion is false
    if (!test_and_clear_bit(ICE_VFLR_EVENT_PENDING, pf->state) ||
                                                               ^
   drivers/net/ethernet/intel/ice/ice_sriov.c:1097:45: note: Uninitialized =
variable: vf->vf_id
     reg_idx =3D (hw->func_caps.vf_base_id + vf->vf_id) / 32;
                                               ^
>> drivers/net/ethernet/intel/ice/ice_sriov.c:1130:24: warning: Uninitializ=
ed variables: vf.entry, vf.rcu, vf.refcnt, vf.pf, vf.cfg_lock, vf.vf_id, vf=
.lan_vsi_idx, vf.ctrl_vsi_idx, vf.fdir, vf.first_vector_idx, vf.vf_sw_id, v=
f.vf_ver, vf.driver_caps, vf.dev_lan_addr, vf.hw_lan_addr, vf.legacy_last_a=
dded_umac, vf.port_vlan_info, vf.vlan_v2_caps, vf.pf_set_mac, vf.trusted, v=
f.spoofchk, vf.link_forced, vf.link_up, vf.lan_vsi_num, vf.min_tx_rate, vf.=
max_tx_rate, vf.vf_caps, vf.num_req_qs, vf.num_mac, vf.num_vf_qs, vf.mdd_rx=
_events, vf.mdd_tx_events, vf.repr, vf.virtchnl_ops, vf.vf_ops, vf.devlink_=
port [uninitvar]
     vsi =3D ice_get_vf_vsi(vf);
                          ^
   drivers/net/ethernet/intel/ice/ice_sriov.c:1317:33: warning: Uninitializ=
ed variable: list_itr->fltr_info [uninitvar]
     u8 *existing_mac =3D &list_itr->fltr_info.l_data.mac.mac_addr[0];
                                   ^

vim +39 drivers/net/ethernet/intel/ice/ice_sriov.c

ddf30f7ff840d4 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Anirudh Ven=
kataramanan 2018-09-19  16  =

3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  17  /**
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  18   * ice_free_vf_entries - Free all VF entries fr=
om the hash table
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  19   * @pf: pointer to the PF structure
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  20   *
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  21   * Iterate over the VF hash table, removing and=
 releasing all VF entries.
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  22   * Called during VF teardown or as cleanup duri=
ng failed VF initialization.
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  23   */
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  24  static void ice_free_vf_entries(struct ice_pf *=
pf)
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  25  {
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  26  	struct ice_vfs *vfs =3D &pf->vfs;
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  27  	struct hlist_node *tmp;
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  28  	struct ice_vf *vf;
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  29  	unsigned int bkt;
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  30  =

3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  31  	/* Remove all VFs from the hash table and rele=
ase their main
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  32  	 * reference. Once all references to the VF ar=
e dropped, ice_put_vf()
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  33  	 * will call ice_release_vf which will remove =
the VF memory.
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  34  	 */
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  35  	lockdep_assert_held(&vfs->table_lock);
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  36  =

3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  37  	hash_for_each_safe(vfs->table, bkt, tmp, vf, e=
ntry) {
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  38  		hash_del_rcu(&vf->entry);
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16 @39  		ice_put_vf(vf);
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  40  	}
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  41  }
3d5985a185e6ab drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Jacob Kelle=
r           2022-02-16  42  =


:::::: The code at line 39 was first introduced by commit
:::::: 3d5985a185e6abfc0b38ed187819016a79eca864 ice: convert VF storage to =
hash table with krefs and RCU

:::::: TO: Jacob Keller <jacob.e.keller@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6242863333350191311==--

