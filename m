Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7474717CB
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Nov 2022 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669454181; x=1700990181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=te+qhi6R2VxUU4F2ZWg7qwPNJDzRd6dTOCic5JD4w0M=;
  b=QxCSeXiIoRpXljF/bfMDxma+UHw0PPiSfnUD1HECEgW13SjltKBB7Tuy
   MJ8RL1XVYmB9wE5umY/TgWoTZ1FhKYd/BC/xRd3gB+Kasf5wFz0I1Z3G/
   7JL0ktlnGZ/3sxkI3E9TdGO7TOvKamv44cOADm0/EpXpNW3DfJEiknh6W
   qMH974qZtF3nQPQ5U2KJEF1IZEpBo6m+jxD2Cu8JVTSk71PzyhNIYyAZX
   jyS7VZj8Ttol2PLkAKCeLHBbS1IvZiMJy/mflxOdQom5OyBNRzjlXyEEz
   0KovQOeI7T73KbCj630Af3VvfeBGA39GvMAwSZbP0nxSjo742OVX8mD+a
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="302157545"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="302157545"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 01:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="887888561"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="887888561"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Nov 2022 01:16:18 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyrIH-000697-3B;
	Sat, 26 Nov 2022 09:16:17 +0000
Date: Sat, 26 Nov 2022 17:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tnguy-next-queue:dev-queue 49/55]
 drivers/net/ethernet/intel/ice/ice_tc_lib.c:909:55: warning: use of
 uninitialized value 'dest_vsi' [CWE-457]
Message-ID: <202211261739.6hQ34MGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="iK/Pn5QB/kgGJ9wH"
Content-Disposition: inline


--iK/Pn5QB/kgGJ9wH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/intel/ice/ice_tc_lib.c:909:55: warning: use of uninitialized value 'dest_vsi' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Amritha Nambiar <amritha.nambiar@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Sridhar Samudrala <sridhar.samudrala@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   7dff4fe746d006c797aed3224835de168762d412
commit: 37fa1bed5d4287974dc2227676e99a81b12411fa [49/55] ice: Support drop action
:::::: branch date: 3 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-c002-20221124
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git/commit/?id=37fa1bed5d4287974dc2227676e99a81b12411fa
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch --no-tags tnguy-next-queue dev-queue
        git checkout 37fa1bed5d4287974dc2227676e99a81b12411fa
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/net/ethernet/intel/ice/ice_tc_lib.c: In function 'ice_add_tc_flower_adv_fltr':
>> drivers/net/ethernet/intel/ice/ice_tc_lib.c:909:55: warning: use of uninitialized value 'dest_vsi' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     909 |                 rule_info.sw_act.vsi_handle = dest_vsi->idx;
         |                                               ~~~~~~~~^~~~~
     'ice_replay_tc_fltrs': event 1
       |
       | 1972 | void ice_replay_tc_fltrs(struct ice_pf *pf)
       |      |      ^~~~~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to 'ice_replay_tc_fltrs'
       |
     'ice_replay_tc_fltrs': event 2
       |
       |include/linux/list.h:1071:18:
       | 1071 |              pos && ({ n = pos->member.next; 1; });                     \
   drivers/net/ethernet/intel/ice/ice_tc_lib.c:1977:9: note: in expansion of macro 'hlist_for_each_entry_safe'
       | 1977 |         hlist_for_each_entry_safe(fltr, node,
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'ice_replay_tc_fltrs': event 3
       |
       | 1977 |         hlist_for_each_entry_safe(fltr, node,
       |      |                                         ^~~~
       |      |                                         |
       |      |                                         (3) ...to here
   include/linux/list.h:1071:24: note: in definition of macro 'hlist_for_each_entry_safe'
       | 1071 |              pos && ({ n = pos->member.next; 1; });                     \
       |      |                        ^
       |
     'ice_replay_tc_fltrs': event 4
       |
       |drivers/net/ethernet/intel/ice/ice_tc_lib.c:1981:17:
       | 1981 |                 ice_add_switch_fltr(fltr->src_vsi, fltr);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (4) calling 'ice_add_switch_fltr' from 'ice_replay_tc_fltrs'
       |
       +--> 'ice_add_switch_fltr': events 5-10
              |
              | 1579 | ice_add_switch_fltr(struct ice_vsi *vsi, struct ice_tc_flower_fltr *fltr)
              |      | ^~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (5) entry to 'ice_add_switch_fltr'
              | 1580 | {
              | 1581 |         if (fltr->action.fltr_act == ICE_FWD_TO_QGRP)
              |      |            ~
              |      |            |
              |      |            (6) following 'false' branch...
              |......
              | 1584 |         if (ice_is_eswitch_mode_switchdev(vsi->back))
              |      |         ~~ ~
              |      |         |  |
              |      |         |  (8) following 'false' branch...
              |      |         (7) ...to here
              |......
              | 1587 |         return ice_add_tc_flower_adv_fltr(vsi, fltr);
              |      |         ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |      |
              |      |         |      (10) calling 'ice_add_tc_flower_adv_fltr' from 'ice_add_switch_fltr'
              |      |         (9) ...to here
              |
              +--> 'ice_add_tc_flower_adv_fltr': events 11-16
                     |
                     |  853 | ice_add_tc_flower_adv_fltr(struct ice_vsi *vsi,
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (11) entry to 'ice_add_tc_flower_adv_fltr'
                     |......
                     |  863 |         struct ice_vsi *dest_vsi;
                     |      |                         ~~~~~~~~
                     |      |                         |
                     |      |                         (12) region created on stack here
                     |......
                     |  871 |         if (ice_is_safe_mode(pf)) {
                     |      |            ~
                     |      |            |
                     |      |            (13) following 'false' branch...
                     |......
                     |  876 |         if (!flags || (flags & (ICE_TC_FLWR_FIELD_ENC_DEST_IPV4 |
                     |      |         ~~ ~
                     |      |         |  |
                     |      |         |  (15) following 'false' branch...
                     |      |         (14) ...to here
                     |......
                     |  886 |         if (ice_is_forward_action(tc_fltr->action.fltr_act)) {
                     |      |         ~~
                     |      |         |
                     |      |         (16) ...to here
                     |
                   'ice_add_tc_flower_adv_fltr': event 17
                     |
                     |drivers/net/ethernet/intel/ice/ice_tc_lib.h:216:9:
                     |  216 |         switch (fltr_act) {
                     |      |         ^~~~~~
                     |      |         |
                     |      |         (17) following 'default:' branch...
                     |
                   'ice_add_tc_flower_adv_fltr': event 18
                     |
                     |drivers/net/ethernet/intel/ice/ice_tc_lib.c:886:13:
                     |  886 |         if (ice_is_forward_action(tc_fltr->action.fltr_act)) {
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/dest_vsi +909 drivers/net/ethernet/intel/ice/ice_tc_lib.c

143b86f346c709 Amritha Nambiar 2022-10-21  843  
9fea749856d14c Kiran Patil     2021-10-15  844  /**
9fea749856d14c Kiran Patil     2021-10-15  845   * ice_add_tc_flower_adv_fltr - add appropriate filter rules
9fea749856d14c Kiran Patil     2021-10-15  846   * @vsi: Pointer to VSI
9fea749856d14c Kiran Patil     2021-10-15  847   * @tc_fltr: Pointer to TC flower filter structure
9fea749856d14c Kiran Patil     2021-10-15  848   *
9fea749856d14c Kiran Patil     2021-10-15  849   * based on filter parameters using Advance recipes supported
9fea749856d14c Kiran Patil     2021-10-15  850   * by OS package.
9fea749856d14c Kiran Patil     2021-10-15  851   */
9fea749856d14c Kiran Patil     2021-10-15  852  static int
9fea749856d14c Kiran Patil     2021-10-15  853  ice_add_tc_flower_adv_fltr(struct ice_vsi *vsi,
9fea749856d14c Kiran Patil     2021-10-15  854  			   struct ice_tc_flower_fltr *tc_fltr)
9fea749856d14c Kiran Patil     2021-10-15  855  {
9fea749856d14c Kiran Patil     2021-10-15  856  	struct ice_tc_flower_lyr_2_4_hdrs *headers = &tc_fltr->outer_headers;
9fea749856d14c Kiran Patil     2021-10-15  857  	struct ice_adv_rule_info rule_info = {0};
9fea749856d14c Kiran Patil     2021-10-15  858  	struct ice_rule_query_data rule_added;
9fea749856d14c Kiran Patil     2021-10-15  859  	struct ice_adv_lkup_elem *list;
9fea749856d14c Kiran Patil     2021-10-15  860  	struct ice_pf *pf = vsi->back;
9fea749856d14c Kiran Patil     2021-10-15  861  	struct ice_hw *hw = &pf->hw;
9fea749856d14c Kiran Patil     2021-10-15  862  	u32 flags = tc_fltr->flags;
37fa1bed5d4287 Amritha Nambiar 2022-11-08  863  	struct ice_vsi *dest_vsi;
9fea749856d14c Kiran Patil     2021-10-15  864  	struct device *dev;
9fea749856d14c Kiran Patil     2021-10-15  865  	u16 lkups_cnt = 0;
9fea749856d14c Kiran Patil     2021-10-15  866  	u16 l4_proto = 0;
9fea749856d14c Kiran Patil     2021-10-15  867  	int ret = 0;
9fea749856d14c Kiran Patil     2021-10-15  868  	u16 i = 0;
9fea749856d14c Kiran Patil     2021-10-15  869  
9fea749856d14c Kiran Patil     2021-10-15  870  	dev = ice_pf_to_dev(pf);
9fea749856d14c Kiran Patil     2021-10-15  871  	if (ice_is_safe_mode(pf)) {
9fea749856d14c Kiran Patil     2021-10-15  872  		NL_SET_ERR_MSG_MOD(tc_fltr->extack, "Unable to add filter because driver is in safe mode");
9fea749856d14c Kiran Patil     2021-10-15  873  		return -EOPNOTSUPP;
9fea749856d14c Kiran Patil     2021-10-15  874  	}
9fea749856d14c Kiran Patil     2021-10-15  875  
9fea749856d14c Kiran Patil     2021-10-15  876  	if (!flags || (flags & (ICE_TC_FLWR_FIELD_ENC_DEST_IPV4 |
9fea749856d14c Kiran Patil     2021-10-15  877  				ICE_TC_FLWR_FIELD_ENC_SRC_IPV4 |
9fea749856d14c Kiran Patil     2021-10-15  878  				ICE_TC_FLWR_FIELD_ENC_DEST_IPV6 |
9fea749856d14c Kiran Patil     2021-10-15  879  				ICE_TC_FLWR_FIELD_ENC_SRC_IPV6 |
9fea749856d14c Kiran Patil     2021-10-15  880  				ICE_TC_FLWR_FIELD_ENC_SRC_L4_PORT))) {
9fea749856d14c Kiran Patil     2021-10-15  881  		NL_SET_ERR_MSG_MOD(tc_fltr->extack, "Unsupported encap field(s)");
9fea749856d14c Kiran Patil     2021-10-15  882  		return -EOPNOTSUPP;
9fea749856d14c Kiran Patil     2021-10-15  883  	}
9fea749856d14c Kiran Patil     2021-10-15  884  
143b86f346c709 Amritha Nambiar 2022-10-21  885  	/* validate forwarding action VSI and queue */
37fa1bed5d4287 Amritha Nambiar 2022-11-08  886  	if (ice_is_forward_action(tc_fltr->action.fltr_act)) {
37fa1bed5d4287 Amritha Nambiar 2022-11-08  887  		dest_vsi = ice_tc_forward_action(vsi, tc_fltr);
37fa1bed5d4287 Amritha Nambiar 2022-11-08  888  		if (IS_ERR(dest_vsi))
37fa1bed5d4287 Amritha Nambiar 2022-11-08  889  			return PTR_ERR(dest_vsi);
37fa1bed5d4287 Amritha Nambiar 2022-11-08  890  	}
9fea749856d14c Kiran Patil     2021-10-15  891  
9fea749856d14c Kiran Patil     2021-10-15  892  	lkups_cnt = ice_tc_count_lkups(flags, headers, tc_fltr);
9fea749856d14c Kiran Patil     2021-10-15  893  	list = kcalloc(lkups_cnt, sizeof(*list), GFP_ATOMIC);
9fea749856d14c Kiran Patil     2021-10-15  894  	if (!list)
9fea749856d14c Kiran Patil     2021-10-15  895  		return -ENOMEM;
9fea749856d14c Kiran Patil     2021-10-15  896  
9fea749856d14c Kiran Patil     2021-10-15  897  	i = ice_tc_fill_rules(hw, flags, tc_fltr, list, &rule_info, &l4_proto);
9fea749856d14c Kiran Patil     2021-10-15  898  	if (i != lkups_cnt) {
9fea749856d14c Kiran Patil     2021-10-15  899  		ret = -EINVAL;
9fea749856d14c Kiran Patil     2021-10-15  900  		goto exit;
9fea749856d14c Kiran Patil     2021-10-15  901  	}
9fea749856d14c Kiran Patil     2021-10-15  902  
9fea749856d14c Kiran Patil     2021-10-15  903  	rule_info.sw_act.fltr_act = tc_fltr->action.fltr_act;
143b86f346c709 Amritha Nambiar 2022-10-21  904  	/* specify the cookie as filter_rule_id */
143b86f346c709 Amritha Nambiar 2022-10-21  905  	rule_info.fltr_rule_id = tc_fltr->cookie;
9fea749856d14c Kiran Patil     2021-10-15  906  
143b86f346c709 Amritha Nambiar 2022-10-21  907  	switch (tc_fltr->action.fltr_act) {
143b86f346c709 Amritha Nambiar 2022-10-21  908  	case ICE_FWD_TO_VSI:
37fa1bed5d4287 Amritha Nambiar 2022-11-08 @909  		rule_info.sw_act.vsi_handle = dest_vsi->idx;
143b86f346c709 Amritha Nambiar 2022-10-21  910  		rule_info.priority = ICE_SWITCH_FLTR_PRIO_VSI;
9fea749856d14c Kiran Patil     2021-10-15  911  		rule_info.sw_act.src = hw->pf_id;
9fea749856d14c Kiran Patil     2021-10-15  912  		rule_info.rx = true;
9fea749856d14c Kiran Patil     2021-10-15  913  		dev_dbg(dev, "add switch rule for TC:%u vsi_idx:%u, lkups_cnt:%u\n",
143b86f346c709 Amritha Nambiar 2022-10-21  914  			tc_fltr->action.fwd.tc.tc_class,
9fea749856d14c Kiran Patil     2021-10-15  915  			rule_info.sw_act.vsi_handle, lkups_cnt);
143b86f346c709 Amritha Nambiar 2022-10-21  916  		break;
143b86f346c709 Amritha Nambiar 2022-10-21  917  	case ICE_FWD_TO_Q:
143b86f346c709 Amritha Nambiar 2022-10-21  918  		/* HW queue number in global space */
143b86f346c709 Amritha Nambiar 2022-10-21  919  		rule_info.sw_act.fwd_id.q_id = tc_fltr->action.fwd.q.hw_queue;
37fa1bed5d4287 Amritha Nambiar 2022-11-08  920  		rule_info.sw_act.vsi_handle = dest_vsi->idx;
143b86f346c709 Amritha Nambiar 2022-10-21  921  		rule_info.priority = ICE_SWITCH_FLTR_PRIO_QUEUE;
143b86f346c709 Amritha Nambiar 2022-10-21  922  		rule_info.sw_act.src = hw->pf_id;
143b86f346c709 Amritha Nambiar 2022-10-21  923  		rule_info.rx = true;
143b86f346c709 Amritha Nambiar 2022-10-21  924  		dev_dbg(dev, "add switch rule action to forward to queue:%u (HW queue %u), lkups_cnt:%u\n",
143b86f346c709 Amritha Nambiar 2022-10-21  925  			tc_fltr->action.fwd.q.queue,
143b86f346c709 Amritha Nambiar 2022-10-21  926  			tc_fltr->action.fwd.q.hw_queue, lkups_cnt);
143b86f346c709 Amritha Nambiar 2022-10-21  927  		break;
37fa1bed5d4287 Amritha Nambiar 2022-11-08  928  	case ICE_DROP_PACKET:
37fa1bed5d4287 Amritha Nambiar 2022-11-08  929  		rule_info.sw_act.flag |= ICE_FLTR_RX;
37fa1bed5d4287 Amritha Nambiar 2022-11-08  930  		rule_info.sw_act.src = hw->pf_id;
37fa1bed5d4287 Amritha Nambiar 2022-11-08  931  		rule_info.rx = true;
143b86f346c709 Amritha Nambiar 2022-10-21  932  		rule_info.priority = ICE_SWITCH_FLTR_PRIO_VSI;
143b86f346c709 Amritha Nambiar 2022-10-21  933  		break;
37fa1bed5d4287 Amritha Nambiar 2022-11-08  934  	default:
37fa1bed5d4287 Amritha Nambiar 2022-11-08  935  		ret = -EOPNOTSUPP;
37fa1bed5d4287 Amritha Nambiar 2022-11-08  936  		goto exit;
9fea749856d14c Kiran Patil     2021-10-15  937  	}
9fea749856d14c Kiran Patil     2021-10-15  938  
9fea749856d14c Kiran Patil     2021-10-15  939  	ret = ice_add_adv_rule(hw, list, lkups_cnt, &rule_info, &rule_added);
9fea749856d14c Kiran Patil     2021-10-15  940  	if (ret == -EEXIST) {
9fea749856d14c Kiran Patil     2021-10-15  941  		NL_SET_ERR_MSG_MOD(tc_fltr->extack,
9fea749856d14c Kiran Patil     2021-10-15  942  				   "Unable to add filter because it already exist");
9fea749856d14c Kiran Patil     2021-10-15  943  		ret = -EINVAL;
9fea749856d14c Kiran Patil     2021-10-15  944  		goto exit;
9fea749856d14c Kiran Patil     2021-10-15  945  	} else if (ret) {
9fea749856d14c Kiran Patil     2021-10-15  946  		NL_SET_ERR_MSG_MOD(tc_fltr->extack,
9fea749856d14c Kiran Patil     2021-10-15  947  				   "Unable to add filter due to error");
9fea749856d14c Kiran Patil     2021-10-15  948  		goto exit;
9fea749856d14c Kiran Patil     2021-10-15  949  	}
9fea749856d14c Kiran Patil     2021-10-15  950  
9fea749856d14c Kiran Patil     2021-10-15  951  	/* store the output params, which are needed later for removing
9fea749856d14c Kiran Patil     2021-10-15  952  	 * advanced switch filter
9fea749856d14c Kiran Patil     2021-10-15  953  	 */
9fea749856d14c Kiran Patil     2021-10-15  954  	tc_fltr->rid = rule_added.rid;
9fea749856d14c Kiran Patil     2021-10-15  955  	tc_fltr->rule_id = rule_added.rule_id;
143b86f346c709 Amritha Nambiar 2022-10-21  956  	tc_fltr->dest_vsi_handle = rule_added.vsi_handle;
143b86f346c709 Amritha Nambiar 2022-10-21  957  	if (tc_fltr->action.fltr_act == ICE_FWD_TO_VSI ||
143b86f346c709 Amritha Nambiar 2022-10-21  958  	    tc_fltr->action.fltr_act == ICE_FWD_TO_Q) {
37fa1bed5d4287 Amritha Nambiar 2022-11-08  959  		tc_fltr->dest_vsi = dest_vsi;
9fea749856d14c Kiran Patil     2021-10-15  960  		/* keep track of advanced switch filter for
143b86f346c709 Amritha Nambiar 2022-10-21  961  		 * destination VSI
9fea749856d14c Kiran Patil     2021-10-15  962  		 */
37fa1bed5d4287 Amritha Nambiar 2022-11-08  963  		dest_vsi->num_chnl_fltr++;
9fea749856d14c Kiran Patil     2021-10-15  964  
9fea749856d14c Kiran Patil     2021-10-15  965  		/* keeps track of channel filters for PF VSI */
9fea749856d14c Kiran Patil     2021-10-15  966  		if (vsi->type == ICE_VSI_PF &&
9fea749856d14c Kiran Patil     2021-10-15  967  		    (flags & (ICE_TC_FLWR_FIELD_DST_MAC |
9fea749856d14c Kiran Patil     2021-10-15  968  			      ICE_TC_FLWR_FIELD_ENC_DST_MAC)))
9fea749856d14c Kiran Patil     2021-10-15  969  			pf->num_dmac_chnl_fltrs++;
9fea749856d14c Kiran Patil     2021-10-15  970  	}
143b86f346c709 Amritha Nambiar 2022-10-21  971  	switch (tc_fltr->action.fltr_act) {
143b86f346c709 Amritha Nambiar 2022-10-21  972  	case ICE_FWD_TO_VSI:
143b86f346c709 Amritha Nambiar 2022-10-21  973  		dev_dbg(dev, "added switch rule (lkups_cnt %u, flags 0x%x), action is forward to TC %u, rid %u, rule_id %u, vsi_idx %u\n",
9fea749856d14c Kiran Patil     2021-10-15  974  			lkups_cnt, flags,
143b86f346c709 Amritha Nambiar 2022-10-21  975  			tc_fltr->action.fwd.tc.tc_class, rule_added.rid,
9fea749856d14c Kiran Patil     2021-10-15  976  			rule_added.rule_id, rule_added.vsi_handle);
143b86f346c709 Amritha Nambiar 2022-10-21  977  		break;
143b86f346c709 Amritha Nambiar 2022-10-21  978  	case ICE_FWD_TO_Q:
143b86f346c709 Amritha Nambiar 2022-10-21  979  		dev_dbg(dev, "added switch rule (lkups_cnt %u, flags 0x%x), action is forward to queue: %u (HW queue %u)     , rid %u, rule_id %u\n",
143b86f346c709 Amritha Nambiar 2022-10-21  980  			lkups_cnt, flags, tc_fltr->action.fwd.q.queue,
143b86f346c709 Amritha Nambiar 2022-10-21  981  			tc_fltr->action.fwd.q.hw_queue, rule_added.rid,
143b86f346c709 Amritha Nambiar 2022-10-21  982  			rule_added.rule_id);
143b86f346c709 Amritha Nambiar 2022-10-21  983  		break;
37fa1bed5d4287 Amritha Nambiar 2022-11-08  984  	case ICE_DROP_PACKET:
37fa1bed5d4287 Amritha Nambiar 2022-11-08  985  		dev_dbg(dev, "added switch rule (lkups_cnt %u, flags 0x%x), action is drop, rid %u, rule_id %u\n",
37fa1bed5d4287 Amritha Nambiar 2022-11-08  986  			lkups_cnt, flags, rule_added.rid, rule_added.rule_id);
37fa1bed5d4287 Amritha Nambiar 2022-11-08  987  		break;
143b86f346c709 Amritha Nambiar 2022-10-21  988  	default:
143b86f346c709 Amritha Nambiar 2022-10-21  989  		break;
143b86f346c709 Amritha Nambiar 2022-10-21  990  	}
9fea749856d14c Kiran Patil     2021-10-15  991  exit:
9fea749856d14c Kiran Patil     2021-10-15  992  	kfree(list);
9fea749856d14c Kiran Patil     2021-10-15  993  	return ret;
9fea749856d14c Kiran Patil     2021-10-15  994  }
9fea749856d14c Kiran Patil     2021-10-15  995  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--iK/Pn5QB/kgGJ9wH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/arm 6.1.0-rc4 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="arm-linux-gnueabi-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_LZMA is not set
CONFIG_KERNEL_XZ=y
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_POSIX_MQUEUE=y
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_IRQ_MULTI_HANDLER=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_CONTEXT_TRACKING=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
CONFIG_USERMODE_DRIVER=y
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
# CONFIG_TICK_CPU_ACCOUNTING is not set
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
# CONFIG_FORCE_TASKS_RCU is not set
# CONFIG_FORCE_TASKS_RUDE_RCU is not set
# CONFIG_FORCE_TASKS_TRACE_RCU is not set
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_TASKS_TRACE_RCU_READ_MB=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_CGROUP_FAVOR_DYNMODS=y
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
# CONFIG_CGROUP_PIDS is not set
CONFIG_CGROUP_RDMA=y
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_DEVICE is not set
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
CONFIG_CGROUP_MISC=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_HAVE_UID16=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
# CONFIG_BUG is not set
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
CONFIG_IO_URING=y
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
# end of General setup

CONFIG_ARM=y
CONFIG_ARM_DMA_USE_IOMMU=y
CONFIG_ARM_DMA_IOMMU_ALIGNMENT=8
CONFIG_SYS_SUPPORTS_APM_EMULATION=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_ARM_PATCH_PHYS_VIRT=y
CONFIG_PHYS_OFFSET=0
CONFIG_PGTABLE_LEVELS=2

#
# System Type
#
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=14
# CONFIG_ARCH_MULTIPLATFORM is not set

#
# Platform selection
#

#
# CPU Core family selection
#
CONFIG_ARCH_MULTI_V6=y
# CONFIG_ARCH_MULTI_V7 is not set
CONFIG_ARCH_MULTI_V6_V7=y
# end of Platform selection

# CONFIG_ARCH_ASPEED is not set
CONFIG_ARCH_BCM=y

#
# IPROC architected SoCs
#

#
# KONA architected SoCs
#

#
# Other Architectures
#
CONFIG_ARCH_BCM2835=y

#
# BCMBCA sub platforms
#
# CONFIG_ARCH_CNS3XXX is not set
CONFIG_ARCH_MXC=y
CONFIG_MXC_AVIC=y

#
# ARM1136 platforms
#
CONFIG_SOC_IMX31=y
CONFIG_SOC_IMX35=y

#
# TI OMAP/AM/DM/DRA Family
#
# CONFIG_ARCH_OMAP2 is not set
# end of TI OMAP/AM/DM/DRA Family

# CONFIG_ARCH_OXNAS is not set
# CONFIG_ARCH_S3C64XX is not set
# CONFIG_ARCH_INTEGRATOR is not set
# CONFIG_ARCH_REALVIEW is not set
# CONFIG_ARCH_WM8750 is not set

#
# Processor Type
#
CONFIG_CPU_V6=y
CONFIG_CPU_V6K=y
CONFIG_CPU_THUMB_CAPABLE=y
CONFIG_CPU_32v6=y
CONFIG_CPU_32v6K=y
CONFIG_CPU_ABRT_EV6=y
CONFIG_CPU_PABRT_V6=y
CONFIG_CPU_CACHE_V6=y
CONFIG_CPU_CACHE_VIPT=y
CONFIG_CPU_COPY_V6=y
CONFIG_CPU_TLB_V6=y
CONFIG_CPU_HAS_ASID=y
CONFIG_CPU_CP15=y
CONFIG_CPU_CP15_MMU=y

#
# Processor Features
#
# CONFIG_ARM_THUMB is not set
CONFIG_CPU_LITTLE_ENDIAN=y
# CONFIG_CPU_BIG_ENDIAN is not set
# CONFIG_CPU_ICACHE_DISABLE is not set
# CONFIG_CPU_DCACHE_DISABLE is not set
# CONFIG_CPU_BPREDICT_DISABLE is not set
CONFIG_KUSER_HELPERS=y
CONFIG_MIGHT_HAVE_CACHE_L2X0=y
# CONFIG_CACHE_L2X0 is not set
CONFIG_ARM_L1_CACHE_SHIFT=5
CONFIG_ARM_DMA_MEM_BUFFERABLE=y
# CONFIG_DEBUG_ALIGN_RODATA is not set
# CONFIG_ARM_ERRATA_326103 is not set
CONFIG_ARM_ERRATA_411920=y
# CONFIG_ARM_ERRATA_364296 is not set
# end of System Type

#
# Bus support
#
# end of Bus support

#
# Kernel Features
#
CONFIG_IRQSTACKS=y
# CONFIG_VMSPLIT_3G is not set
# CONFIG_VMSPLIT_3G_OPT is not set
# CONFIG_VMSPLIT_2G is not set
CONFIG_VMSPLIT_1G=y
CONFIG_PAGE_OFFSET=0x40000000
CONFIG_KASAN_SHADOW_OFFSET=0x1f000000
CONFIG_ARCH_NR_GPIO=0
CONFIG_HZ_FIXED=0
# CONFIG_HZ_100 is not set
# CONFIG_HZ_200 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_500 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_AEABI=y
CONFIG_OABI_COMPAT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_HIGHMEM=y
CONFIG_HIGHPTE=y
# CONFIG_CPU_SW_DOMAIN_PAN is not set
CONFIG_ARCH_FORCE_MAX_ORDER=11
CONFIG_ALIGNMENT_TRAP=y
CONFIG_UACCESS_WITH_MEMCPY=y
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_CC_HAVE_STACKPROTECTOR_TLS=y
# end of Kernel Features

#
# Boot options
#
CONFIG_USE_OF=y
CONFIG_ATAGS=y
CONFIG_UNUSED_BOARD_FILES=y
CONFIG_DEPRECATED_PARAM_STRUCT=y
CONFIG_ZBOOT_ROM_TEXT=0x0
CONFIG_ZBOOT_ROM_BSS=0x0
CONFIG_ARM_APPENDED_DTB=y
# CONFIG_ARM_ATAG_DTB_COMPAT is not set
CONFIG_CMDLINE=""
# CONFIG_KEXEC is not set
# CONFIG_CRASH_DUMP is not set
# CONFIG_AUTO_ZRELADDR is not set
# end of Boot options

#
# CPU Power Management
#

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of CPU Power Management

#
# Floating point emulation
#

#
# At least one emulation must be selected
#
CONFIG_FPE_NWFPE=y
CONFIG_FPE_NWFPE_XP=y
CONFIG_FPE_FASTFPE=y
CONFIG_VFP=y
# end of Floating point emulation

#
# Power management options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_SUSPEND_SKIP_SYNC=y
# CONFIG_HIBERNATION is not set
CONFIG_PM_SLEEP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
# CONFIG_PM_WAKELOCKS_GC is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_APM_EMULATION=y
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_PM_GENERIC_DOMAINS_OF=y
CONFIG_CPU_PM=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARM_CPU_SUSPEND=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
# end of Power management options

CONFIG_AS_VFP_VMRS_FPINST=y

#
# General architecture-dependent options
#
CONFIG_JUMP_LABEL=y
CONFIG_STATIC_KEYS_SELFTEST=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_GENERIC_IDLE_POLL_SETUP=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_KEEPINITRD=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_ARCH_OPTIONAL_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_HAVE_ARCH_PFN_VALID=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
# CONFIG_MODULES is not set
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
CONFIG_BLK_INLINE_ENCRYPTION=y
# CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
# CONFIG_BINFMT_ELF_FDPIC is not set
CONFIG_ELFCORE=y
# CONFIG_BINFMT_SCRIPT is not set
CONFIG_ARCH_HAS_BINFMT_FLAT=y
# CONFIG_BINFMT_FLAT is not set
CONFIG_BINFMT_FLAT_ARGVP_ENVP_ON_STACK=y
# CONFIG_BINFMT_MISC is not set
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
# CONFIG_ZSWAP is not set
CONFIG_ZSMALLOC=y
# CONFIG_ZSMALLOC_STAT is not set

#
# SLAB allocator options
#
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
# CONFIG_BOUNCE is not set
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_HMM_MIRROR=y
CONFIG_GET_FREE_REGION=y
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_TEST=y
CONFIG_KMAP_LOCAL=y
CONFIG_KMAP_LOCAL_NON_LINEAR_PTE_ARRAY=y
# CONFIG_USERFAULTFD is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
# CONFIG_UNIX is not set
CONFIG_TLS=y
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
# CONFIG_XFRM_USER is not set
# CONFIG_XFRM_SUB_POLICY is not set
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_AH=y
CONFIG_XFRM_ESP=y
CONFIG_XFRM_IPCOMP=y
CONFIG_NET_KEY=y
CONFIG_NET_KEY_MIGRATE=y
CONFIG_XFRM_ESPINTCP=y
CONFIG_SMC=y
# CONFIG_SMC_DIAG is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
CONFIG_IP_ADVANCED_ROUTER=y
# CONFIG_IP_FIB_TRIE_STATS is not set
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
CONFIG_NET_IPGRE=y
CONFIG_SYN_COOKIES=y
# CONFIG_NET_IPVTI is not set
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=y
CONFIG_INET_ESP=y
# CONFIG_INET_ESP_OFFLOAD is not set
CONFIG_INET_ESPINTCP=y
CONFIG_INET_IPCOMP=y
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
CONFIG_INET_UDP_DIAG=y
CONFIG_INET_RAW_DIAG=y
CONFIG_INET_DIAG_DESTROY=y
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=y
# CONFIG_TCP_CONG_CUBIC is not set
# CONFIG_TCP_CONG_WESTWOOD is not set
CONFIG_TCP_CONG_HTCP=y
CONFIG_TCP_CONG_HSTCP=y
CONFIG_TCP_CONG_HYBLA=y
CONFIG_TCP_CONG_VEGAS=y
# CONFIG_TCP_CONG_NV is not set
# CONFIG_TCP_CONG_SCALABLE is not set
# CONFIG_TCP_CONG_LP is not set
CONFIG_TCP_CONG_VENO=y
# CONFIG_TCP_CONG_YEAH is not set
CONFIG_TCP_CONG_ILLINOIS=y
CONFIG_TCP_CONG_DCTCP=y
CONFIG_TCP_CONG_CDG=y
# CONFIG_TCP_CONG_BBR is not set
CONFIG_DEFAULT_BIC=y
# CONFIG_DEFAULT_HTCP is not set
# CONFIG_DEFAULT_HYBLA is not set
# CONFIG_DEFAULT_VEGAS is not set
# CONFIG_DEFAULT_VENO is not set
# CONFIG_DEFAULT_DCTCP is not set
# CONFIG_DEFAULT_CDG is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="bic"
# CONFIG_TCP_MD5SIG is not set
# CONFIG_IPV6 is not set
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
# CONFIG_NETFILTER is not set
CONFIG_BPFILTER=y
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=y

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
# CONFIG_IP_DCCP_CCID3 is not set
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
CONFIG_IP_DCCP_DEBUG=y
# end of DCCP Kernel Hacking

# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
CONFIG_TIPC=y
# CONFIG_TIPC_MEDIA_IB is not set
CONFIG_TIPC_MEDIA_UDP=y
# CONFIG_TIPC_CRYPTO is not set
CONFIG_TIPC_DIAG=y
# CONFIG_ATM is not set
CONFIG_L2TP=y
CONFIG_L2TP_DEBUGFS=y
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=y
# CONFIG_L2TP_ETH is not set
CONFIG_MRP=y
# CONFIG_BRIDGE is not set
CONFIG_NET_DSA=y
# CONFIG_NET_DSA_TAG_AR9331 is not set
CONFIG_NET_DSA_TAG_BRCM_COMMON=y
CONFIG_NET_DSA_TAG_BRCM=y
CONFIG_NET_DSA_TAG_BRCM_LEGACY=y
CONFIG_NET_DSA_TAG_BRCM_PREPEND=y
CONFIG_NET_DSA_TAG_HELLCREEK=y
CONFIG_NET_DSA_TAG_GSWIP=y
CONFIG_NET_DSA_TAG_DSA_COMMON=y
CONFIG_NET_DSA_TAG_DSA=y
CONFIG_NET_DSA_TAG_EDSA=y
CONFIG_NET_DSA_TAG_MTK=y
CONFIG_NET_DSA_TAG_KSZ=y
CONFIG_NET_DSA_TAG_OCELOT=y
CONFIG_NET_DSA_TAG_OCELOT_8021Q=y
CONFIG_NET_DSA_TAG_QCA=y
CONFIG_NET_DSA_TAG_RTL4_A=y
CONFIG_NET_DSA_TAG_RTL8_4=y
# CONFIG_NET_DSA_TAG_RZN1_A5PSW is not set
CONFIG_NET_DSA_TAG_LAN9303=y
# CONFIG_NET_DSA_TAG_SJA1105 is not set
CONFIG_NET_DSA_TAG_TRAILER=y
CONFIG_NET_DSA_TAG_XRS700X=y
CONFIG_VLAN_8021Q=y
# CONFIG_VLAN_8021Q_GVRP is not set
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=y
# CONFIG_LLC2 is not set
CONFIG_ATALK=y
CONFIG_DEV_APPLETALK=y
CONFIG_IPDDP=y
# CONFIG_IPDDP_ENCAP is not set
CONFIG_X25=y
CONFIG_LAPB=y
CONFIG_PHONET=y
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=y
CONFIG_BATMAN_ADV=y
CONFIG_BATMAN_ADV_BATMAN_V=y
# CONFIG_BATMAN_ADV_BLA is not set
# CONFIG_BATMAN_ADV_DAT is not set
# CONFIG_BATMAN_ADV_NC is not set
CONFIG_BATMAN_ADV_MCAST=y
# CONFIG_BATMAN_ADV_DEBUG is not set
CONFIG_OPENVSWITCH=y
CONFIG_OPENVSWITCH_GRE=y
CONFIG_OPENVSWITCH_GENEVE=y
CONFIG_VSOCKETS=y
# CONFIG_VSOCKETS_DIAG is not set
# CONFIG_VSOCKETS_LOOPBACK is not set
# CONFIG_VIRTIO_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
CONFIG_AX25=y
CONFIG_AX25_DAMA_SLAVE=y
# CONFIG_NETROM is not set
CONFIG_ROSE=y

#
# AX.25 network device drivers
#
# CONFIG_BPQETHER is not set
CONFIG_BAYCOM_SER_FDX=y
CONFIG_BAYCOM_SER_HDX=y
# CONFIG_BAYCOM_PAR is not set
CONFIG_BAYCOM_EPP=y
CONFIG_YAM=y
# end of AX.25 network device drivers

CONFIG_CAN=y
# CONFIG_CAN_RAW is not set
CONFIG_CAN_BCM=y
CONFIG_CAN_GW=y
CONFIG_CAN_J1939=y
# CONFIG_CAN_ISOTP is not set
CONFIG_BT=y
# CONFIG_BT_BREDR is not set
CONFIG_BT_LE=y
CONFIG_BT_LEDS=y
CONFIG_BT_MSFTEXT=y
CONFIG_BT_AOSPEXT=y
# CONFIG_BT_DEBUGFS is not set
CONFIG_BT_SELFTEST=y
# CONFIG_BT_SELFTEST_ECDH is not set
# CONFIG_BT_SELFTEST_SMP is not set

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=y
CONFIG_BT_RTL=y
CONFIG_BT_MTK=y
CONFIG_BT_HCIBTUSB=y
CONFIG_BT_HCIBTUSB_AUTOSUSPEND=y
# CONFIG_BT_HCIBTUSB_BCM is not set
CONFIG_BT_HCIBTUSB_MTK=y
CONFIG_BT_HCIBTUSB_RTL=y
CONFIG_BT_HCIBTSDIO=y
CONFIG_BT_HCIBCM203X=y
# CONFIG_BT_HCIBPA10X is not set
# CONFIG_BT_HCIBFUSB is not set
CONFIG_BT_HCIDTL1=y
CONFIG_BT_HCIBT3C=y
CONFIG_BT_HCIBLUECARD=y
# CONFIG_BT_HCIVHCI is not set
CONFIG_BT_MRVL=y
CONFIG_BT_MRVL_SDIO=y
CONFIG_BT_ATH3K=y
CONFIG_BT_MTKSDIO=y
CONFIG_BT_MTKUART=y
# CONFIG_BT_QCOMSMD is not set
CONFIG_BT_VIRTIO=y
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=y
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
CONFIG_AF_RXRPC_DEBUG=y
CONFIG_RXKAD=y
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
# CONFIG_WIRELESS is not set
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
CONFIG_NFC=y
# CONFIG_NFC_DIGITAL is not set
CONFIG_NFC_NCI=y
CONFIG_NFC_HCI=y
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
# CONFIG_NFC_VIRTUAL_NCI is not set
# CONFIG_NFC_FDP is not set
CONFIG_NFC_PN533=y
CONFIG_NFC_PN533_USB=y
# CONFIG_NFC_PN533_I2C is not set
# CONFIG_NFC_PN532_UART is not set
CONFIG_NFC_MRVL=y
CONFIG_NFC_MRVL_USB=y
CONFIG_NFC_MRVL_I2C=y
# CONFIG_NFC_ST_NCI_I2C is not set
CONFIG_NFC_NXP_NCI=y
CONFIG_NFC_NXP_NCI_I2C=y
CONFIG_NFC_S3FWRN5=y
CONFIG_NFC_S3FWRN5_I2C=y
CONFIG_NFC_S3FWRN82_UART=y
# end of Near Field Communication (NFC) devices

# CONFIG_PSAMPLE is not set
CONFIG_NET_IFE=y
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_PAGE_POOL_STATS=y
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_ARM_AMBA=y
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCI_DOMAINS_GENERIC=y
CONFIG_PCI_SYSCALL=y
CONFIG_PCIEPORTBUS=y
# CONFIG_PCIEAER is not set
# CONFIG_PCIEASPM is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_PTM=y
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
CONFIG_PCI_DEBUG=y
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=y
CONFIG_PCI_ATS=y
CONFIG_PCI_DOE=y
CONFIG_PCI_ECAM=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
# CONFIG_PCIE_BUS_DEFAULT is not set
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
CONFIG_PCIE_BUS_PEER2PEER=y
# CONFIG_VGA_ARB is not set
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#
# CONFIG_PCI_AARDVARK is not set
# CONFIG_PCIE_XILINX_NWL is not set
CONFIG_PCI_FTPCI100=y
# CONFIG_PCI_IXP4XX is not set
# CONFIG_PCI_TEGRA is not set
# CONFIG_PCI_RCAR_GEN2 is not set
# CONFIG_PCIE_RCAR_HOST is not set
CONFIG_PCI_HOST_COMMON=y
CONFIG_PCI_HOST_GENERIC=y
CONFIG_PCIE_XILINX=y
# CONFIG_PCIE_XILINX_CPM is not set
# CONFIG_PCI_XGENE is not set
CONFIG_PCI_V3_SEMI=y
# CONFIG_PCI_VERSATILE is not set
# CONFIG_PCIE_IPROC_PLATFORM is not set
# CONFIG_PCIE_IPROC_BCMA is not set
CONFIG_PCIE_ALTERA=y
# CONFIG_PCIE_ALTERA_MSI is not set
# CONFIG_PCI_HOST_THUNDER_PEM is not set
# CONFIG_PCI_HOST_THUNDER_ECAM is not set
# CONFIG_PCIE_ROCKCHIP_HOST is not set
# CONFIG_PCIE_MEDIATEK is not set
# CONFIG_PCIE_MEDIATEK_GEN3 is not set
CONFIG_PCIE_BRCMSTB=y
# CONFIG_PCI_LOONGSON is not set
# CONFIG_PCIE_MICROCHIP_HOST is not set
# CONFIG_PCIE_APPLE is not set
# CONFIG_PCIE_MT7621 is not set

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
CONFIG_PCIE_DW_PLAT=y
CONFIG_PCIE_DW_PLAT_HOST=y
# CONFIG_PCI_EXYNOS is not set
# CONFIG_PCI_IMX6 is not set
# CONFIG_PCIE_SPEAR13XX is not set
# CONFIG_PCI_KEYSTONE_HOST is not set
# CONFIG_PCI_LAYERSCAPE is not set
# CONFIG_PCI_HISI is not set
# CONFIG_PCIE_QCOM is not set
# CONFIG_PCIE_ARMADA_8K is not set
# CONFIG_PCIE_ARTPEC6_HOST is not set
# CONFIG_PCIE_ROCKCHIP_DW_HOST is not set
# CONFIG_PCIE_INTEL_GW is not set
# CONFIG_PCIE_KEEMBAY_HOST is not set
# CONFIG_PCIE_KIRIN is not set
# CONFIG_PCIE_HISI_STB is not set
CONFIG_PCI_MESON=y
# CONFIG_PCIE_TEGRA194_HOST is not set
# CONFIG_PCIE_VISCONTI_HOST is not set
# CONFIG_PCIE_UNIPHIER is not set
# CONFIG_PCIE_AL is not set
# CONFIG_PCIE_FU740 is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# CONFIG_PCIE_MOBIVEIL_PLAT is not set
# CONFIG_PCIE_LAYERSCAPE_GEN4 is not set
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
CONFIG_PCIE_CADENCE=y
CONFIG_PCIE_CADENCE_HOST=y
CONFIG_PCIE_CADENCE_PLAT=y
CONFIG_PCIE_CADENCE_PLAT_HOST=y
CONFIG_PCI_J721E=y
CONFIG_PCI_J721E_HOST=y
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

CONFIG_CXL_BUS=y
CONFIG_CXL_PCI=y
# CONFIG_CXL_MEM_RAW_COMMANDS is not set
CONFIG_CXL_MEM=y
CONFIG_CXL_PORT=y
CONFIG_CXL_SUSPEND=y
CONFIG_CXL_REGION=y
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set
# CONFIG_CARDBUS is not set

#
# PC-card bridges
#
CONFIG_YENTA=y
# CONFIG_YENTA_O2 is not set
# CONFIG_YENTA_RICOH is not set
CONFIG_YENTA_TI=y
# CONFIG_YENTA_TOSHIBA is not set
# CONFIG_PD6729 is not set
# CONFIG_I82092 is not set
# CONFIG_OMAP_CF is not set
CONFIG_PCCARD_NONSTATIC=y
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_TSI721=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
CONFIG_RAPIDIO_DEBUG=y
CONFIG_RAPIDIO_ENUM_BASIC=y
# CONFIG_RAPIDIO_CHMAN is not set
CONFIG_RAPIDIO_MPORT_CDEV=y

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=y
# CONFIG_RAPIDIO_CPS_GEN2 is not set
CONFIG_RAPIDIO_RXS_GEN3=y
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
# CONFIG_FW_LOADER_COMPRESS_XZ is not set
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
# CONFIG_FW_CACHE is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
CONFIG_DEBUG_DEVRES=y
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
CONFIG_BRCMSTB_GISB_ARB=y
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
# CONFIG_HISILICON_LPC is not set
CONFIG_IMX_WEIM=y
# CONFIG_INTEL_IXP4XX_EB is not set
# CONFIG_QCOM_EBI2 is not set
CONFIG_VEXPRESS_CONFIG=y
# CONFIG_FSL_MC_BUS is not set
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
CONFIG_MHI_BUS_PCI_GENERIC=y
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=y
# CONFIG_ARM_SCMI_POWER_CONTROL is not set
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_POWER_DOMAIN=y
# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_FW_CFG_SYSFS is not set
# CONFIG_BCM47XX_NVRAM is not set
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_COREBOOT_TABLE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=y
CONFIG_GNSS_MTK_SERIAL=y
CONFIG_GNSS_SIRF_SERIAL=y
CONFIG_GNSS_UBX_SERIAL=y
CONFIG_GNSS_USB=y
CONFIG_MTD=y

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_BCM63XX_PARTS is not set
# CONFIG_MTD_BRCM_U_BOOT is not set
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_OF_PARTS is not set
# CONFIG_MTD_PARSER_IMAGETAG is not set
CONFIG_MTD_AFS_PARTS=y
# CONFIG_MTD_PARSER_TRX is not set
# CONFIG_MTD_SHARPSL_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y
# CONFIG_INFTL is not set
CONFIG_RFD_FTL=y
CONFIG_SSFDC=y
CONFIG_SM_FTL=y
CONFIG_MTD_OOPS=y
# CONFIG_MTD_SWAP is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
CONFIG_MTD_CFI_LE_BYTE_SWAP=y
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_OTP=y
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
CONFIG_MTD_ABSENT=y
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_PHYSMAP_START=0x8000000
CONFIG_MTD_PHYSMAP_LEN=0
CONFIG_MTD_PHYSMAP_BANKWIDTH=2
# CONFIG_MTD_PHYSMAP_OF is not set
CONFIG_MTD_PHYSMAP_GPIO_ADDR=y
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_NETSC520 is not set
# CONFIG_MTD_TS5500 is not set
CONFIG_MTD_IMPA7=y
CONFIG_MTD_PCI=y
CONFIG_MTD_PCMCIA=y
CONFIG_MTD_PCMCIA_ANONYMOUS=y
CONFIG_MTD_INTEL_VR_NOR=y
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
CONFIG_MTD_SPEAR_SMI=y
# CONFIG_MTD_BCM47XXSFLASH is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=y

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=y
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
CONFIG_MTD_ONENAND_GENERIC=y
# CONFIG_MTD_ONENAND_OMAP2 is not set
# CONFIG_MTD_ONENAND_SAMSUNG is not set
CONFIG_MTD_ONENAND_OTP=y
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=y
CONFIG_MTD_NAND_DENALI_PCI=y
CONFIG_MTD_NAND_DENALI_DT=y
CONFIG_MTD_NAND_AMS_DELTA=y
# CONFIG_MTD_NAND_SHARPSL is not set
CONFIG_MTD_NAND_CAFE=y
# CONFIG_MTD_NAND_ATMEL is not set
# CONFIG_MTD_NAND_MARVELL is not set
# CONFIG_MTD_NAND_SLC_LPC32XX is not set
# CONFIG_MTD_NAND_MLC_LPC32XX is not set
CONFIG_MTD_NAND_BRCMNAND=y
CONFIG_MTD_NAND_BRCMNAND_BCM63XX=y
CONFIG_MTD_NAND_BRCMNAND_BCMBCA=y
# CONFIG_MTD_NAND_BRCMNAND_BRCMSTB is not set
CONFIG_MTD_NAND_BRCMNAND_IPROC=y
# CONFIG_MTD_NAND_OXNAS is not set
# CONFIG_MTD_NAND_FSL_IFC is not set
# CONFIG_MTD_NAND_VF610_NFC is not set
CONFIG_MTD_NAND_MXC=y
# CONFIG_MTD_NAND_SH_FLCTL is not set
# CONFIG_MTD_NAND_DAVINCI is not set
# CONFIG_MTD_NAND_TXX9NDFMC is not set
# CONFIG_MTD_NAND_FSMC is not set
# CONFIG_MTD_NAND_SUNXI is not set
# CONFIG_MTD_NAND_HISI504 is not set
# CONFIG_MTD_NAND_QCOM is not set
CONFIG_MTD_NAND_MXIC=y
# CONFIG_MTD_NAND_TEGRA is not set
# CONFIG_MTD_NAND_STM32_FMC2 is not set
# CONFIG_MTD_NAND_MESON is not set
CONFIG_MTD_NAND_GPIO=y
CONFIG_MTD_NAND_PLATFORM=y
CONFIG_MTD_NAND_CADENCE=y
CONFIG_MTD_NAND_ARASAN=y
CONFIG_MTD_NAND_INTEL_LGM=y
# CONFIG_MTD_NAND_RENESAS is not set

#
# Misc
#
# CONFIG_MTD_NAND_NANDSIM is not set
# CONFIG_MTD_NAND_RICOH is not set
CONFIG_MTD_NAND_DISKONCHIP=y
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
CONFIG_MTD_NAND_ECC_SW_BCH=y
# CONFIG_MTD_NAND_ECC_MXIC is not set
# CONFIG_MTD_NAND_ECC_MEDIATEK is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
CONFIG_MTD_LPDDR2_NVM=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
CONFIG_MTD_UBI_GLUEBI=y
# CONFIG_MTD_UBI_BLOCK is not set
CONFIG_MTD_HYPERBUS=y
# CONFIG_HBMC_AM654 is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
CONFIG_CDROM=y
CONFIG_BLK_DEV_PCIESSD_MTIP32XX=y
CONFIG_ZRAM=y
# CONFIG_ZRAM_DEF_COMP_ZSTD is not set
CONFIG_ZRAM_DEF_COMP_LZ4=y
CONFIG_ZRAM_DEF_COMP="lz4"
CONFIG_ZRAM_WRITEBACK=y
CONFIG_ZRAM_MEMORY_TRACKING=y
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8

#
# DRBD disabled because PROC_FS or INET not selected
#
CONFIG_BLK_DEV_NBD=y
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_CDROM_PKTCDVD=y
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
CONFIG_BLK_DEV_UBLK=y

#
# NVME Support
#
CONFIG_NVME_COMMON=y
CONFIG_NVME_CORE=y
CONFIG_BLK_DEV_NVME=y
# CONFIG_NVME_MULTIPATH is not set
CONFIG_NVME_VERBOSE_ERRORS=y
CONFIG_NVME_HWMON=y
CONFIG_NVME_FABRICS=y
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
CONFIG_NVME_AUTH=y
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=y
CONFIG_NVME_TARGET_FC=y
CONFIG_NVME_TARGET_TCP=y
CONFIG_NVME_TARGET_AUTH=y
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_DUMMY_IRQ=y
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
CONFIG_ICS932S401=y
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_HP_ILO is not set
# CONFIG_QCOM_COINCELL is not set
# CONFIG_QCOM_FASTRPC is not set
# CONFIG_APDS9802ALS is not set
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
# CONFIG_PCH_PHUB is not set
CONFIG_SRAM=y
CONFIG_SRAM_EXEC=y
# CONFIG_DW_XDATA_PCIE is not set
CONFIG_PCI_ENDPOINT_TEST=y
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=y
CONFIG_HISI_HIKEY_USB=y
CONFIG_OPEN_DICE=y
CONFIG_VCPU_STALL_DETECTOR=y
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

CONFIG_CB710_CORE=y
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y
CONFIG_ECHO=y
# CONFIG_BCM_VK is not set
CONFIG_MISC_ALCOR_PCI=y
CONFIG_MISC_RTSX_PCI=y
CONFIG_MISC_RTSX_USB=y
CONFIG_HABANA_AI=y
CONFIG_UACCE=y
# CONFIG_PVPANIC is not set
CONFIG_GP_PCI1XXXX=y
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_ST=y
CONFIG_BLK_DEV_SR=y
CONFIG_CHR_DEV_SG=y
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=y
# CONFIG_SCSI_ENCLOSURE is not set
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
# CONFIG_SCSI_SAS_HOST_SMP is not set
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

# CONFIG_ATA is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=y
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=y
CONFIG_MD_RAID456=y
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=y
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=y
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=y
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=y
CONFIG_DM_PERSISTENT_DATA=y
# CONFIG_DM_UNSTRIPED is not set
# CONFIG_DM_CRYPT is not set
CONFIG_DM_SNAPSHOT=y
# CONFIG_DM_THIN_PROVISIONING is not set
# CONFIG_DM_CACHE is not set
CONFIG_DM_WRITECACHE=y
CONFIG_DM_ERA=y
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=y
# CONFIG_DM_LOG_USERSPACE is not set
CONFIG_DM_RAID=y
# CONFIG_DM_ZERO is not set
# CONFIG_DM_MULTIPATH is not set
CONFIG_DM_DELAY=y
CONFIG_DM_DUST=y
CONFIG_DM_INIT=y
CONFIG_DM_UEVENT=y
# CONFIG_DM_FLAKEY is not set
# CONFIG_DM_VERITY is not set
CONFIG_DM_SWITCH=y
CONFIG_DM_LOG_WRITES=y
# CONFIG_DM_INTEGRITY is not set
# CONFIG_TARGET_CORE is not set
CONFIG_FUSION=y
CONFIG_FUSION_SPI=y
# CONFIG_FUSION_SAS is not set
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_CTL=y
# CONFIG_FUSION_LOGGING is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
# CONFIG_FIREWIRE_OHCI is not set
CONFIG_FIREWIRE_SBP2=y
# CONFIG_FIREWIRE_NET is not set
CONFIG_FIREWIRE_NOSY=y
# end of IEEE 1394 (FireWire) support

CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_BONDING=y
CONFIG_DUMMY=y
CONFIG_WIREGUARD=y
CONFIG_WIREGUARD_DEBUG=y
CONFIG_EQUALIZER=y
# CONFIG_NET_FC is not set
CONFIG_NET_TEAM=y
CONFIG_NET_TEAM_MODE_BROADCAST=y
CONFIG_NET_TEAM_MODE_ROUNDROBIN=y
# CONFIG_NET_TEAM_MODE_RANDOM is not set
CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=y
CONFIG_NET_TEAM_MODE_LOADBALANCE=y
# CONFIG_MACVLAN is not set
CONFIG_IPVLAN=y
# CONFIG_IPVTAP is not set
# CONFIG_VXLAN is not set
CONFIG_GENEVE=y
# CONFIG_BAREUDP is not set
CONFIG_GTP=y
CONFIG_MACSEC=y
CONFIG_NETCONSOLE=y
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
# CONFIG_NTB_NETDEV is not set
# CONFIG_RIONET is not set
CONFIG_TUN=y
CONFIG_TUN_VNET_CROSS_LE=y
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=y
# CONFIG_NLMON is not set
CONFIG_MHI_NET=y
CONFIG_SUNGEM_PHY=y
CONFIG_ARCNET=y
CONFIG_ARCNET_1201=y
CONFIG_ARCNET_1051=y
CONFIG_ARCNET_RAW=y
# CONFIG_ARCNET_CAP is not set
CONFIG_ARCNET_COM90xx=y
CONFIG_ARCNET_COM90xxIO=y
CONFIG_ARCNET_RIM_I=y
# CONFIG_ARCNET_COM20020 is not set

#
# Distributed Switch Architecture drivers
#
CONFIG_B53=y
CONFIG_B53_MDIO_DRIVER=y
# CONFIG_B53_MMAP_DRIVER is not set
# CONFIG_B53_SRAB_DRIVER is not set
# CONFIG_B53_SERDES is not set
CONFIG_NET_DSA_BCM_SF2=y
CONFIG_NET_DSA_LOOP=y
# CONFIG_NET_DSA_LANTIQ_GSWIP is not set
CONFIG_NET_DSA_MT7530=y
CONFIG_NET_DSA_MV88E6060=y
CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON=y
CONFIG_NET_DSA_MICROCHIP_KSZ9477_I2C=y
CONFIG_NET_DSA_MICROCHIP_KSZ8863_SMI=y
CONFIG_NET_DSA_MV88E6XXX=y
# CONFIG_NET_DSA_MV88E6XXX_PTP is not set
CONFIG_NET_DSA_MSCC_FELIX=y
# CONFIG_NET_DSA_MSCC_SEVILLE is not set
# CONFIG_NET_DSA_AR9331 is not set
CONFIG_NET_DSA_QCA8K=y
CONFIG_NET_DSA_XRS700X=y
CONFIG_NET_DSA_XRS700X_I2C=y
CONFIG_NET_DSA_XRS700X_MDIO=y
CONFIG_NET_DSA_REALTEK=y
CONFIG_NET_DSA_REALTEK_MDIO=y
CONFIG_NET_DSA_REALTEK_SMI=y
CONFIG_NET_DSA_REALTEK_RTL8365MB=y
CONFIG_NET_DSA_REALTEK_RTL8366RB=y
CONFIG_NET_DSA_SMSC_LAN9303=y
# CONFIG_NET_DSA_SMSC_LAN9303_I2C is not set
CONFIG_NET_DSA_SMSC_LAN9303_MDIO=y
CONFIG_NET_DSA_VITESSE_VSC73XX=y
CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM=y
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_MDIO=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_PCMCIA_3C574 is not set
CONFIG_PCMCIA_3C589=y
CONFIG_VORTEX=y
CONFIG_TYPHOON=y
# CONFIG_NET_VENDOR_ACTIONS is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
# CONFIG_NET_VENDOR_AGERE is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
CONFIG_ALTERA_TSE=y
CONFIG_NET_VENDOR_AMAZON=y
CONFIG_ENA_ETHERNET=y
# CONFIG_NET_VENDOR_AMD is not set
# CONFIG_NET_XGENE is not set
# CONFIG_NET_XGENE_V2 is not set
# CONFIG_NET_VENDOR_AQUANTIA is not set
# CONFIG_NET_VENDOR_ARC is not set
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
CONFIG_ATL1E=y
# CONFIG_ATL1C is not set
CONFIG_ALX=y
# CONFIG_CX_ECAT is not set
# CONFIG_NET_VENDOR_BROADCOM is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
# CONFIG_NET_CALXEDA_XGMAC is not set
# CONFIG_NET_VENDOR_CAVIUM is not set
# CONFIG_NET_VENDOR_CHELSIO is not set
CONFIG_NET_VENDOR_CIRRUS=y
CONFIG_CS89x0=y
CONFIG_CS89x0_PLATFORM=y
# CONFIG_EP93XX_ETH is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
# CONFIG_NET_VENDOR_CORTINA is not set
CONFIG_NET_VENDOR_DAVICOM=y
CONFIG_DM9000=y
# CONFIG_DM9000_FORCE_SIMPLE_PHY_POLL is not set
CONFIG_DNET=y
# CONFIG_NET_VENDOR_DEC is not set
# CONFIG_NET_VENDOR_DLINK is not set
CONFIG_NET_VENDOR_EMULEX=y
CONFIG_BE2NET=y
# CONFIG_BE2NET_HWMON is not set
CONFIG_BE2NET_BE2=y
# CONFIG_BE2NET_BE3 is not set
# CONFIG_BE2NET_LANCER is not set
# CONFIG_BE2NET_SKYHAWK is not set
# CONFIG_NET_VENDOR_ENGLEDER is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_EZCHIP_NPS_MANAGEMENT_ENET=y
CONFIG_NET_VENDOR_FARADAY=y
# CONFIG_FTMAC100 is not set
CONFIG_FTGMAC100=y
CONFIG_NET_VENDOR_FREESCALE=y
CONFIG_FEC=y
# CONFIG_FSL_FMAN is not set
CONFIG_FSL_PQ_MDIO=y
CONFIG_FSL_XGMAC_MDIO=y
CONFIG_GIANFAR=y
CONFIG_FSL_DPAA2_SWITCH=y
# CONFIG_FSL_ENETC is not set
# CONFIG_FSL_ENETC_VF is not set
CONFIG_FSL_ENETC_IERB=y
CONFIG_FSL_ENETC_MDIO=y
# CONFIG_NET_VENDOR_FUJITSU is not set
# CONFIG_NET_VENDOR_FUNGIBLE is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
# CONFIG_NET_VENDOR_HISILICON is not set
# CONFIG_NET_VENDOR_HUAWEI is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
CONFIG_IGBVF=y
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
CONFIG_IXGBEVF=y
# CONFIG_I40E is not set
CONFIG_IAVF=y
CONFIG_I40EVF=y
CONFIG_ICE=y
CONFIG_ICE_SWITCHDEV=y
CONFIG_FM10K=y
# CONFIG_IGC is not set
# CONFIG_NET_VENDOR_WANGXUN is not set
# CONFIG_JME is not set
# CONFIG_KORINA is not set
# CONFIG_NET_VENDOR_LITEX is not set
# CONFIG_NET_VENDOR_MARVELL is not set
# CONFIG_NET_VENDOR_MEDIATEK is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
CONFIG_MLX4_CORE=y
CONFIG_MLX4_DEBUG=y
CONFIG_MLX4_CORE_GEN2=y
CONFIG_MLX5_CORE=y
CONFIG_MLX5_FPGA=y
CONFIG_MLX5_CORE_EN=y
# CONFIG_MLX5_EN_RXNFC is not set
# CONFIG_MLX5_MPFS is not set
CONFIG_MLX5_ESWITCH=y
CONFIG_MLX5_CORE_EN_DCB=y
CONFIG_MLX5_CORE_IPOIB=y
# CONFIG_MLX5_EN_MACSEC is not set
CONFIG_MLX5_EN_TLS=y
# CONFIG_MLX5_SW_STEERING is not set
# CONFIG_MLX5_SF is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
# CONFIG_MLXBF_GIGE is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_MSCC_OCELOT_SWITCH_LIB=y
CONFIG_MSCC_OCELOT_SWITCH=y
# CONFIG_NET_VENDOR_MICROSOFT is not set
# CONFIG_NET_VENDOR_MYRI is not set
# CONFIG_NET_VENDOR_NI is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
# CONFIG_NET_VENDOR_NETERION is not set
# CONFIG_NET_VENDOR_NETRONOME is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
# CONFIG_LPC_ENET is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_PCH_GBE is not set
CONFIG_ETHOC=y
# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_NET_VENDOR_QLOGIC=y
CONFIG_QLA3XXX=y
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
CONFIG_QED=y
# CONFIG_QED_SRIOV is not set
CONFIG_QEDE=y
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
CONFIG_QCA7000=y
CONFIG_QCA7000_UART=y
CONFIG_QCOM_EMAC=y
CONFIG_RMNET=y
CONFIG_NET_VENDOR_RDC=y
CONFIG_R6040=y
CONFIG_NET_VENDOR_REALTEK=y
CONFIG_8139CP=y
CONFIG_8139TOO=y
# CONFIG_8139TOO_PIO is not set
# CONFIG_8139TOO_TUNE_TWISTER is not set
CONFIG_8139TOO_8129=y
# CONFIG_8139_OLD_RX_RESET is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
# CONFIG_SH_ETH is not set
# CONFIG_RAVB is not set
# CONFIG_RENESAS_ETHER_SWITCH is not set
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_NET_VENDOR_SAMSUNG is not set
# CONFIG_NET_VENDOR_SEEQ is not set
CONFIG_NET_VENDOR_SILAN=y
CONFIG_SC92031=y
CONFIG_NET_VENDOR_SIS=y
CONFIG_SIS900=y
CONFIG_SIS190=y
CONFIG_NET_VENDOR_SOLARFLARE=y
CONFIG_SFC=y
# CONFIG_SFC_MTD is not set
CONFIG_SFC_MCDI_MON=y
# CONFIG_SFC_SRIOV is not set
CONFIG_SFC_MCDI_LOGGING=y
# CONFIG_SFC_FALCON is not set
CONFIG_SFC_SIENA=y
CONFIG_SFC_SIENA_MTD=y
CONFIG_SFC_SIENA_MCDI_MON=y
CONFIG_SFC_SIENA_SRIOV=y
# CONFIG_SFC_SIENA_MCDI_LOGGING is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_SOCIONEXT is not set
CONFIG_NET_VENDOR_STMICRO=y
CONFIG_STMMAC_ETH=y
CONFIG_STMMAC_SELFTESTS=y
# CONFIG_STMMAC_PLATFORM is not set
# CONFIG_DWMAC_LOONGSON is not set
# CONFIG_STMMAC_PCI is not set
CONFIG_NET_VENDOR_SUN=y
CONFIG_HAPPYMEAL=y
CONFIG_SUNGEM=y
CONFIG_CASSINI=y
CONFIG_NIU=y
CONFIG_NET_VENDOR_SUNPLUS=y
# CONFIG_SP7021_EMAC is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
CONFIG_DWC_XLGMAC=y
CONFIG_DWC_XLGMAC_PCI=y
# CONFIG_NET_VENDOR_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_DAVINCI_EMAC is not set
# CONFIG_TI_DAVINCI_MDIO is not set
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TI_CPSW is not set
# CONFIG_TI_CPSW_SWITCHDEV is not set
# CONFIG_TI_CPTS is not set
CONFIG_TLAN=y
# CONFIG_NET_VENDOR_VERTEXCOM is not set
CONFIG_NET_VENDOR_VIA=y
CONFIG_VIA_RHINE=y
# CONFIG_VIA_RHINE_MMIO is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
CONFIG_XILINX_EMACLITE=y
# CONFIG_XILINX_AXI_EMAC is not set
CONFIG_XILINX_LL_TEMAC=y
# CONFIG_NET_VENDOR_XIRCOM is not set
CONFIG_FDDI=y
CONFIG_DEFXX=y
CONFIG_SKFP=y
CONFIG_HIPPI=y
CONFIG_ROADRUNNER=y
CONFIG_ROADRUNNER_LARGE_RINGS=y
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y
CONFIG_SFP=y

#
# MII PHY device drivers
#
CONFIG_AMD_PHY=y
# CONFIG_MESON_GXL_PHY is not set
CONFIG_ADIN_PHY=y
# CONFIG_ADIN1100_PHY is not set
CONFIG_AQUANTIA_PHY=y
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM63XX_PHY is not set
CONFIG_BCM7XXX_PHY=y
CONFIG_BCM84881_PHY=y
CONFIG_BCM87XX_PHY=y
CONFIG_BCM_NET_PHYLIB=y
# CONFIG_CICADA_PHY is not set
CONFIG_CORTINA_PHY=y
CONFIG_DAVICOM_PHY=y
CONFIG_ICPLUS_PHY=y
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
CONFIG_LSI_ET1011C_PHY=y
CONFIG_MARVELL_PHY=y
CONFIG_MARVELL_10G_PHY=y
CONFIG_MARVELL_88X2222_PHY=y
# CONFIG_MAXLINEAR_GPHY is not set
CONFIG_MEDIATEK_GE_PHY=y
CONFIG_MICREL_PHY=y
CONFIG_MICROCHIP_PHY=y
CONFIG_MICROCHIP_T1_PHY=y
CONFIG_MICROSEMI_PHY=y
CONFIG_MOTORCOMM_PHY=y
CONFIG_NATIONAL_PHY=y
CONFIG_NXP_C45_TJA11XX_PHY=y
# CONFIG_NXP_TJA11XX_PHY is not set
CONFIG_AT803X_PHY=y
CONFIG_QSEMI_PHY=y
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
CONFIG_SMSC_PHY=y
CONFIG_STE10XP=y
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
CONFIG_DP83TC811_PHY=y
CONFIG_DP83848_PHY=y
# CONFIG_DP83867_PHY is not set
CONFIG_DP83869_PHY=y
CONFIG_DP83TD510_PHY=y
CONFIG_VITESSE_PHY=y
# CONFIG_XILINX_GMII2RGMII is not set
CONFIG_PSE_CONTROLLER=y
CONFIG_PSE_REGULATOR=y
CONFIG_CAN_DEV=y
CONFIG_CAN_VCAN=y
CONFIG_CAN_VXCAN=y
# CONFIG_CAN_NETLINK is not set
CONFIG_CAN_DEBUG_DEVICES=y
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_OF_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_SUN4I is not set
# CONFIG_MDIO_XGENE is not set
# CONFIG_MDIO_ASPEED is not set
CONFIG_MDIO_BITBANG=y
# CONFIG_MDIO_BCM_IPROC is not set
CONFIG_MDIO_BCM_UNIMAC=y
# CONFIG_MDIO_GPIO is not set
# CONFIG_MDIO_HISI_FEMAC is not set
CONFIG_MDIO_I2C=y
CONFIG_MDIO_MVUSB=y
CONFIG_MDIO_MSCC_MIIM=y
# CONFIG_MDIO_MOXART is not set
# CONFIG_MDIO_OCTEON is not set
# CONFIG_MDIO_IPQ4019 is not set
CONFIG_MDIO_IPQ8064=y

#
# MDIO Multiplexers
#
CONFIG_MDIO_BUS_MUX=y
# CONFIG_MDIO_BUS_MUX_MESON_G12A is not set
# CONFIG_MDIO_BUS_MUX_BCM6368 is not set
# CONFIG_MDIO_BUS_MUX_BCM_IPROC is not set
CONFIG_MDIO_BUS_MUX_GPIO=y
# CONFIG_MDIO_BUS_MUX_MULTIPLEXER is not set
# CONFIG_MDIO_BUS_MUX_MMIOREG is not set

#
# PCS device drivers
#
CONFIG_PCS_XPCS=y
CONFIG_PCS_LYNX=y
# CONFIG_PCS_RZN1_MIIC is not set
CONFIG_PCS_ALTERA_TSE=y
# end of PCS device drivers

CONFIG_PLIP=y
# CONFIG_PPP is not set
# CONFIG_USB_NET_DRIVERS is not set
# CONFIG_WLAN is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_USB4_NET is not set
CONFIG_NETDEVSIM=y
CONFIG_NET_FAILOVER=y
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
CONFIG_MISDN=y
CONFIG_MISDN_DSP=y
# CONFIG_MISDN_L1OIP is not set

#
# mISDN hardware drivers
#
CONFIG_MISDN_HFCPCI=y
CONFIG_MISDN_HFCMULTI=y
CONFIG_MISDN_HFCUSB=y
# CONFIG_MISDN_AVMFRITZ is not set
# CONFIG_MISDN_SPEEDFAX is not set
# CONFIG_MISDN_INFINEON is not set
# CONFIG_MISDN_W6692 is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y
CONFIG_INPUT_APMPOWER=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=y
# CONFIG_KEYBOARD_ADP5520 is not set
CONFIG_KEYBOARD_ADP5588=y
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_ATKBD is not set
CONFIG_KEYBOARD_QT1050=y
CONFIG_KEYBOARD_QT1070=y
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_CLPS711X is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
CONFIG_KEYBOARD_LKKBD=y
# CONFIG_KEYBOARD_EP93XX is not set
# CONFIG_KEYBOARD_GPIO is not set
CONFIG_KEYBOARD_GPIO_POLLED=y
CONFIG_KEYBOARD_TCA6416=y
CONFIG_KEYBOARD_TCA8418=y
CONFIG_KEYBOARD_MATRIX=y
# CONFIG_KEYBOARD_LM8323 is not set
CONFIG_KEYBOARD_LM8333=y
# CONFIG_KEYBOARD_MAX7359 is not set
CONFIG_KEYBOARD_MCS=y
CONFIG_KEYBOARD_MPR121=y
CONFIG_KEYBOARD_SNVS_PWRKEY=y
CONFIG_KEYBOARD_IMX=y
CONFIG_KEYBOARD_NEWTON=y
# CONFIG_KEYBOARD_OPENCORES is not set
CONFIG_KEYBOARD_PINEPHONE=y
# CONFIG_KEYBOARD_PMIC8XXX is not set
CONFIG_KEYBOARD_SAMSUNG=y
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
CONFIG_KEYBOARD_STOWAWAY=y
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
CONFIG_KEYBOARD_SUNKBD=y
# CONFIG_KEYBOARD_SH_KEYSC is not set
CONFIG_KEYBOARD_IQS62X=y
CONFIG_KEYBOARD_OMAP4=y
CONFIG_KEYBOARD_TC3589X=y
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
CONFIG_KEYBOARD_XTKBD=y
# CONFIG_KEYBOARD_CAP11XX is not set
CONFIG_KEYBOARD_BCM=y
# CONFIG_KEYBOARD_MT6779 is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
CONFIG_KEYBOARD_CYPRESS_SF=y
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
# CONFIG_MOUSE_SERIAL is not set
CONFIG_MOUSE_APPLETOUCH=y
CONFIG_MOUSE_BCM5974=y
CONFIG_MOUSE_CYAPA=y
CONFIG_MOUSE_ELAN_I2C=y
# CONFIG_MOUSE_ELAN_I2C_I2C is not set
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_MOUSE_GPIO is not set
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
CONFIG_JOYSTICK_A3D=y
CONFIG_JOYSTICK_ADC=y
# CONFIG_JOYSTICK_ADI is not set
# CONFIG_JOYSTICK_COBRA is not set
# CONFIG_JOYSTICK_GF2K is not set
CONFIG_JOYSTICK_GRIP=y
# CONFIG_JOYSTICK_GRIP_MP is not set
CONFIG_JOYSTICK_GUILLEMOT=y
CONFIG_JOYSTICK_INTERACT=y
# CONFIG_JOYSTICK_SIDEWINDER is not set
# CONFIG_JOYSTICK_TMDC is not set
# CONFIG_JOYSTICK_IFORCE is not set
# CONFIG_JOYSTICK_WARRIOR is not set
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
CONFIG_JOYSTICK_SPACEBALL=y
CONFIG_JOYSTICK_STINGER=y
CONFIG_JOYSTICK_TWIDJOY=y
CONFIG_JOYSTICK_ZHENHUA=y
# CONFIG_JOYSTICK_DB9 is not set
# CONFIG_JOYSTICK_GAMECON is not set
CONFIG_JOYSTICK_TURBOGRAFX=y
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=y
# CONFIG_JOYSTICK_XPAD is not set
CONFIG_JOYSTICK_WALKERA0701=y
CONFIG_JOYSTICK_PXRC=y
# CONFIG_JOYSTICK_QWIIC is not set
CONFIG_JOYSTICK_FSIA6B=y
# CONFIG_JOYSTICK_SENSEHAT is not set
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_AD7879 is not set
CONFIG_TOUCHSCREEN_ADC=y
CONFIG_TOUCHSCREEN_AR1021_I2C=y
CONFIG_TOUCHSCREEN_ATMEL_MXT=y
# CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=y
CONFIG_TOUCHSCREEN_CY8CTMA140=y
CONFIG_TOUCHSCREEN_CY8CTMG110=y
CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP_I2C=y
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
CONFIG_TOUCHSCREEN_EETI=y
CONFIG_TOUCHSCREEN_EGALAX=y
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
# CONFIG_TOUCHSCREEN_EXC3000 is not set
CONFIG_TOUCHSCREEN_FUJITSU=y
CONFIG_TOUCHSCREEN_GOODIX=y
CONFIG_TOUCHSCREEN_HIDEEP=y
# CONFIG_TOUCHSCREEN_HYCON_HY46XX is not set
CONFIG_TOUCHSCREEN_ILI210X=y
# CONFIG_TOUCHSCREEN_ILITEK is not set
# CONFIG_TOUCHSCREEN_IPROC is not set
# CONFIG_TOUCHSCREEN_S6SY761 is not set
# CONFIG_TOUCHSCREEN_GUNZE is not set
CONFIG_TOUCHSCREEN_EKTF2127=y
CONFIG_TOUCHSCREEN_ELAN=y
# CONFIG_TOUCHSCREEN_ELO is not set
CONFIG_TOUCHSCREEN_WACOM_W8001=y
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
# CONFIG_TOUCHSCREEN_MAX11801 is not set
# CONFIG_TOUCHSCREEN_MCS5000 is not set
CONFIG_TOUCHSCREEN_MMS114=y
CONFIG_TOUCHSCREEN_MELFAS_MIP4=y
CONFIG_TOUCHSCREEN_MSG2638=y
CONFIG_TOUCHSCREEN_MTOUCH=y
# CONFIG_TOUCHSCREEN_IMAGIS is not set
CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
# CONFIG_TOUCHSCREEN_INEXIO is not set
CONFIG_TOUCHSCREEN_MK712=y
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
# CONFIG_TOUCHSCREEN_RASPBERRYPI_FW is not set
# CONFIG_TOUCHSCREEN_MIGOR is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
CONFIG_TOUCHSCREEN_PIXCIR=y
CONFIG_TOUCHSCREEN_WDT87XX_I2C=y
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
# CONFIG_TOUCHSCREEN_MC13783 is not set
CONFIG_TOUCHSCREEN_USB_EGALAX=y
# CONFIG_TOUCHSCREEN_USB_PANJIT is not set
CONFIG_TOUCHSCREEN_USB_3M=y
CONFIG_TOUCHSCREEN_USB_ITM=y
# CONFIG_TOUCHSCREEN_USB_ETURBO is not set
CONFIG_TOUCHSCREEN_USB_GUNZE=y
CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
# CONFIG_TOUCHSCREEN_USB_IRTOUCH is not set
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
# CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH is not set
CONFIG_TOUCHSCREEN_USB_GOTOP=y
CONFIG_TOUCHSCREEN_USB_JASTEC=y
# CONFIG_TOUCHSCREEN_USB_ELO is not set
# CONFIG_TOUCHSCREEN_USB_E2I is not set
# CONFIG_TOUCHSCREEN_USB_ZYTRONIC is not set
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
# CONFIG_TOUCHSCREEN_USB_NEXIO is not set
# CONFIG_TOUCHSCREEN_USB_EASYTOUCH is not set
CONFIG_TOUCHSCREEN_TOUCHIT213=y
# CONFIG_TOUCHSCREEN_TS4800 is not set
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
CONFIG_TOUCHSCREEN_TSC2004=y
# CONFIG_TOUCHSCREEN_TSC2007 is not set
CONFIG_TOUCHSCREEN_RM_TS=y
CONFIG_TOUCHSCREEN_SILEAD=y
CONFIG_TOUCHSCREEN_SIS_I2C=y
CONFIG_TOUCHSCREEN_ST1232=y
CONFIG_TOUCHSCREEN_STMFTS=y
# CONFIG_TOUCHSCREEN_SUN4I is not set
CONFIG_TOUCHSCREEN_SX8654=y
CONFIG_TOUCHSCREEN_TPS6507X=y
CONFIG_TOUCHSCREEN_ZET6223=y
# CONFIG_TOUCHSCREEN_ZFORCE is not set
CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
CONFIG_TOUCHSCREEN_ROHM_BU21023=y
CONFIG_TOUCHSCREEN_IQS5XX=y
CONFIG_TOUCHSCREEN_ZINITIX=y
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
# CONFIG_RMI4_I2C is not set
# CONFIG_RMI4_SMB is not set
# CONFIG_RMI4_F03 is not set
CONFIG_RMI4_2D_SENSOR=y
# CONFIG_RMI4_F11 is not set
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F54=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
# CONFIG_SERIO_PARKBD is not set
CONFIG_SERIO_AMBAKMI=y
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_SERIO_APBPS2 is not set
# CONFIG_SERIO_OLPC_APSP is not set
# CONFIG_SERIO_SUN4I_PS2 is not set
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
# CONFIG_GAMEPORT_L4 is not set
CONFIG_GAMEPORT_EMU10K1=y
CONFIG_GAMEPORT_FM801=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
# CONFIG_TTY is not set
CONFIG_SERIAL_DEV_BUS=y
CONFIG_PRINTER=y
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_IPMB=y
CONFIG_IPMI_WATCHDOG=y
# CONFIG_IPMI_POWEROFF is not set
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_ATMEL=y
CONFIG_HW_RANDOM_BA431=y
CONFIG_HW_RANDOM_BCM2835=y
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=y
CONFIG_HW_RANDOM_OMAP3_ROM=y
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_MXC_RNGA=y
CONFIG_HW_RANDOM_IMX_RNGC=y
CONFIG_HW_RANDOM_NOMADIK=y
CONFIG_HW_RANDOM_STM32=y
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y
CONFIG_HW_RANDOM_NPCM=y
CONFIG_HW_RANDOM_KEYSTONE=y
# CONFIG_HW_RANDOM_CCTRNG is not set
# CONFIG_HW_RANDOM_XIPHERA is not set
CONFIG_APPLICOM=y

#
# PCMCIA character devices
#
CONFIG_CARDMAN_4000=y
CONFIG_CARDMAN_4040=y
CONFIG_SCR24X=y
# end of PCMCIA character devices

CONFIG_DEVMEM=y
CONFIG_DEVPORT=y
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_SYNQUACER is not set
CONFIG_TCG_TIS_I2C_CR50=y
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=y
CONFIG_TCG_ATMEL=y
CONFIG_TCG_VTPM_PROXY=y
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
CONFIG_XILLYBUS_CLASS=y
# CONFIG_XILLYBUS is not set
CONFIG_XILLYUSB=y
CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_DEMUX_PINCTRL is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=y
CONFIG_I2C_ALI1535=y
CONFIG_I2C_ALI1563=y
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
CONFIG_I2C_AMD8111=y
# CONFIG_I2C_HIX5HD2 is not set
CONFIG_I2C_I801=y
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
CONFIG_I2C_NVIDIA_GPU=y
# CONFIG_I2C_SIS5595 is not set
CONFIG_I2C_SIS630=y
CONFIG_I2C_SIS96X=y
CONFIG_I2C_VIA=y
CONFIG_I2C_VIAPRO=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AT91 is not set
# CONFIG_I2C_AXXIA is not set
CONFIG_I2C_BCM2835=y
# CONFIG_I2C_BCM_IPROC is not set
# CONFIG_I2C_BCM_KONA is not set
# CONFIG_I2C_BRCMSTB is not set
# CONFIG_I2C_CADENCE is not set
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DAVINCI is not set
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
CONFIG_I2C_DESIGNWARE_PCI=y
# CONFIG_I2C_DIGICOLOR is not set
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_EXYNOS5 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_HIGHLANDER is not set
# CONFIG_I2C_HISI is not set
# CONFIG_I2C_IMG is not set
CONFIG_I2C_IMX=y
CONFIG_I2C_IMX_LPI2C=y
# CONFIG_I2C_IOP3XX is not set
# CONFIG_I2C_JZ4780 is not set
# CONFIG_I2C_LPC2K is not set
# CONFIG_I2C_MESON is not set
# CONFIG_I2C_MICROCHIP_CORE is not set
# CONFIG_I2C_MT65XX is not set
# CONFIG_I2C_MT7621 is not set
# CONFIG_I2C_MV64XXX is not set
# CONFIG_I2C_MXS is not set
# CONFIG_I2C_NOMADIK is not set
# CONFIG_I2C_NPCM is not set
CONFIG_I2C_OCORES=y
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PNX is not set
# CONFIG_I2C_PXA is not set
# CONFIG_I2C_QCOM_CCI is not set
# CONFIG_I2C_QUP is not set
# CONFIG_I2C_RIIC is not set
CONFIG_I2C_RK3X=y
# CONFIG_I2C_RZV2M is not set
# CONFIG_I2C_S3C2410 is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_SPRD is not set
# CONFIG_I2C_ST is not set
# CONFIG_I2C_STM32F4 is not set
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_TEGRA is not set
# CONFIG_I2C_TEGRA_BPMP is not set
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
# CONFIG_I2C_WMT is not set
CONFIG_I2C_XILINX=y
# CONFIG_I2C_XLP9XX is not set
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
# CONFIG_I2C_DLN2 is not set
CONFIG_I2C_CP2615=y
# CONFIG_I2C_PARPORT is not set
CONFIG_I2C_PCI1XXXX=y
CONFIG_I2C_ROBOTFUZZ_OSIF=y
CONFIG_I2C_TINY_USB=y
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
CONFIG_DW_I3C_MASTER=y
CONFIG_SVC_I3C_MASTER=y
CONFIG_MIPI_I3C_HCI=y
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#
# CONFIG_OMAP_SSI is not set

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_PARPORT=y
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
CONFIG_PTP_1588_CLOCK_DTE=y
CONFIG_PTP_1588_CLOCK_QORIQ=y
CONFIG_DP83640_PHY=y
CONFIG_PTP_1588_CLOCK_INES=y
# CONFIG_PTP_1588_CLOCK_PCH is not set
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
CONFIG_PTP_1588_CLOCK_IDTCM=y
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_AS3722=y
# CONFIG_PINCTRL_AT91PIO4 is not set
# CONFIG_PINCTRL_BM1880 is not set
CONFIG_PINCTRL_CY8C95X0=y
# CONFIG_PINCTRL_DA850_PUPD is not set
# CONFIG_PINCTRL_EQUILIBRIUM is not set
# CONFIG_PINCTRL_INGENIC is not set
# CONFIG_PINCTRL_LPC18XX is not set
# CONFIG_PINCTRL_MCP23S08 is not set
CONFIG_PINCTRL_MICROCHIP_SGPIO=y
CONFIG_PINCTRL_OCELOT=y
# CONFIG_PINCTRL_PISTACHIO is not set
CONFIG_PINCTRL_RK805=y
# CONFIG_PINCTRL_ROCKCHIP is not set
# CONFIG_PINCTRL_SINGLE is not set
CONFIG_PINCTRL_STMFX=y
# CONFIG_PINCTRL_SX150X is not set
# CONFIG_PINCTRL_OWL is not set
# CONFIG_PINCTRL_ASPEED_G4 is not set
# CONFIG_PINCTRL_ASPEED_G5 is not set
# CONFIG_PINCTRL_ASPEED_G6 is not set
# CONFIG_PINCTRL_BCM281XX is not set
CONFIG_PINCTRL_BCM2835=y
# CONFIG_PINCTRL_BCM4908 is not set
# CONFIG_PINCTRL_BCM6318 is not set
# CONFIG_PINCTRL_BCM6328 is not set
# CONFIG_PINCTRL_BCM6358 is not set
# CONFIG_PINCTRL_BCM6362 is not set
# CONFIG_PINCTRL_BCM6368 is not set
# CONFIG_PINCTRL_BCM63268 is not set
# CONFIG_PINCTRL_IPROC_GPIO is not set
# CONFIG_PINCTRL_CYGNUS_MUX is not set
# CONFIG_PINCTRL_NS is not set
# CONFIG_PINCTRL_NSP_GPIO is not set
# CONFIG_PINCTRL_NS2_MUX is not set
# CONFIG_PINCTRL_NSP_MUX is not set
# CONFIG_PINCTRL_AS370 is not set
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
# CONFIG_PINCTRL_LOCHNAGAR is not set
CONFIG_PINCTRL_IMX=y
CONFIG_PINCTRL_IMX35=y
# CONFIG_PINCTRL_IMX8ULP is not set
# CONFIG_PINCTRL_IMXRT1050 is not set
# CONFIG_PINCTRL_IMX93 is not set
# CONFIG_PINCTRL_IMXRT1170 is not set

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
# CONFIG_EINT_MTK is not set
# CONFIG_PINCTRL_MT2701 is not set
# CONFIG_PINCTRL_MT7623 is not set
# CONFIG_PINCTRL_MT7629 is not set
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT6765 is not set
# CONFIG_PINCTRL_MT6779 is not set
# CONFIG_PINCTRL_MT6795 is not set
# CONFIG_PINCTRL_MT6797 is not set
# CONFIG_PINCTRL_MT7622 is not set
# CONFIG_PINCTRL_MT7986 is not set
# CONFIG_PINCTRL_MT8167 is not set
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT8183 is not set
# CONFIG_PINCTRL_MT8186 is not set
# CONFIG_PINCTRL_MT8188 is not set
# CONFIG_PINCTRL_MT8192 is not set
# CONFIG_PINCTRL_MT8195 is not set
# CONFIG_PINCTRL_MT8365 is not set
# CONFIG_PINCTRL_MT8516 is not set
# CONFIG_PINCTRL_MT6397 is not set
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MESON=y
CONFIG_PINCTRL_MESON8=y
CONFIG_PINCTRL_MESON8B=y
CONFIG_PINCTRL_MESON8_PMX=y
# CONFIG_PINCTRL_WPCM450 is not set
# CONFIG_PINCTRL_NPCM7XX is not set
# CONFIG_PINCTRL_PXA25X is not set
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_MSM is not set
# CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
# CONFIG_PINCTRL_RENESAS is not set
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
# CONFIG_PINCTRL_PFC_R8A7794 is not set
# CONFIG_PINCTRL_PFC_R8A77990 is not set
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
# CONFIG_PINCTRL_PFC_R8A77950 is not set
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
# CONFIG_PINCTRL_PFC_R8A7793 is not set
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A77965 is not set
# CONFIG_PINCTRL_PFC_R8A77960 is not set
# CONFIG_PINCTRL_PFC_R8A77961 is not set
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
# CONFIG_PINCTRL_PFC_R8A7792 is not set
# CONFIG_PINCTRL_PFC_R8A77980 is not set
# CONFIG_PINCTRL_PFC_R8A77970 is not set
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
# CONFIG_PINCTRL_PFC_R8A7740 is not set
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
# CONFIG_PINCTRL_RZA1 is not set
# CONFIG_PINCTRL_RZA2 is not set
# CONFIG_PINCTRL_RZG2L is not set
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A7745 is not set
# CONFIG_PINCTRL_PFC_R8A7742 is not set
# CONFIG_PINCTRL_PFC_R8A7743 is not set
# CONFIG_PINCTRL_PFC_R8A7744 is not set
# CONFIG_PINCTRL_PFC_R8A774C0 is not set
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
# CONFIG_PINCTRL_RZN1 is not set
# CONFIG_PINCTRL_RZV2M is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
# CONFIG_PINCTRL_PFC_SH7264 is not set
# CONFIG_PINCTRL_PFC_SH7269 is not set
# CONFIG_PINCTRL_PFC_SH7720 is not set
# CONFIG_PINCTRL_PFC_SH7722 is not set
# CONFIG_PINCTRL_PFC_SH7734 is not set
# CONFIG_PINCTRL_PFC_SH7757 is not set
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
# CONFIG_PINCTRL_PFC_SH73A0 is not set
# CONFIG_PINCTRL_PFC_SH7723 is not set
# CONFIG_PINCTRL_PFC_SH7724 is not set
# CONFIG_PINCTRL_PFC_SHX3 is not set
# end of Renesas pinctrl drivers

# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C24XX is not set
# CONFIG_PINCTRL_S3C64XX is not set
# CONFIG_PINCTRL_SPRD_SC9860 is not set
# CONFIG_PINCTRL_STARFIVE_JH7100 is not set
# CONFIG_PINCTRL_STM32F429 is not set
# CONFIG_PINCTRL_STM32F469 is not set
# CONFIG_PINCTRL_STM32F746 is not set
# CONFIG_PINCTRL_STM32F769 is not set
# CONFIG_PINCTRL_STM32H743 is not set
# CONFIG_PINCTRL_STM32MP135 is not set
# CONFIG_PINCTRL_STM32MP157 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
CONFIG_PINCTRL_UNIPHIER_LD4=y
CONFIG_PINCTRL_UNIPHIER_PRO4=y
CONFIG_PINCTRL_UNIPHIER_SLD8=y
CONFIG_PINCTRL_UNIPHIER_PRO5=y
CONFIG_PINCTRL_UNIPHIER_PXS2=y
CONFIG_PINCTRL_UNIPHIER_LD6B=y
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
# CONFIG_PINCTRL_UNIPHIER_LD20 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS3 is not set
# CONFIG_PINCTRL_UNIPHIER_NX1 is not set
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
# CONFIG_GPIO_CDEV is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
# CONFIG_GPIO_ASPEED_SGPIO is not set
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_RASPBERRYPI_EXP is not set
# CONFIG_GPIO_BCM_KONA is not set
# CONFIG_GPIO_BCM_XGS_IPROC is not set
# CONFIG_GPIO_BRCMSTB is not set
# CONFIG_GPIO_CADENCE is not set
# CONFIG_GPIO_CLPS711X is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EIC_SPRD is not set
# CONFIG_GPIO_EM is not set
# CONFIG_GPIO_FTGPIO010 is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HISI is not set
CONFIG_GPIO_HLWD=y
# CONFIG_GPIO_IOP is not set
CONFIG_GPIO_LOGICVC=y
# CONFIG_GPIO_LPC18XX is not set
# CONFIG_GPIO_LPC32XX is not set
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_MT7621 is not set
# CONFIG_GPIO_MXC is not set
# CONFIG_GPIO_MXS is not set
# CONFIG_GPIO_OMAP is not set
CONFIG_GPIO_PL061=y
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
# CONFIG_GPIO_PXA is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_RDA is not set
# CONFIG_GPIO_ROCKCHIP is not set
# CONFIG_GPIO_SAMA5D2_PIOBU is not set
# CONFIG_GPIO_SIFIVE is not set
CONFIG_GPIO_SIOX=y
# CONFIG_GPIO_SNPS_CREG is not set
# CONFIG_GPIO_SPRD is not set
# CONFIG_GPIO_STP_XWAY is not set
# CONFIG_GPIO_SYSCON is not set
# CONFIG_GPIO_TEGRA is not set
# CONFIG_GPIO_TEGRA186 is not set
# CONFIG_GPIO_TS4800 is not set
# CONFIG_GPIO_UNIPHIER is not set
CONFIG_GPIO_VF610=y
# CONFIG_GPIO_VISCONTI is not set
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_WCD934X=y
# CONFIG_GPIO_XGENE_SB is not set
CONFIG_GPIO_XILINX=y
# CONFIG_GPIO_XLP is not set
CONFIG_GPIO_ZEVIO=y
# CONFIG_GPIO_AMD_FCH is not set
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_GW_PLD=y
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_BD9571MWV=y
CONFIG_GPIO_DLN2=y
CONFIG_HTC_EGPIO=y
# CONFIG_GPIO_JANZ_TTL is not set
# CONFIG_GPIO_LP3943 is not set
CONFIG_GPIO_LP873X=y
# CONFIG_GPIO_MAX77650 is not set
CONFIG_GPIO_RC5T583=y
# CONFIG_GPIO_SL28CPLD is not set
CONFIG_GPIO_TC3589X=y
CONFIG_GPIO_TPS65218=y
# CONFIG_GPIO_TPS6586X is not set
CONFIG_GPIO_TPS65912=y
CONFIG_GPIO_TQMX86=y
CONFIG_GPIO_WM8350=y
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=y
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
CONFIG_GPIO_PCI_IDIO_16=y
CONFIG_GPIO_PCIE_IDIO_24=y
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=y
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_MXC is not set
CONFIG_W1_MASTER_DS1WM=y
CONFIG_W1_MASTER_GPIO=y
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
# CONFIG_W1_SLAVE_DS2423 is not set
# CONFIG_W1_SLAVE_DS2805 is not set
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
# CONFIG_POWER_SUPPLY_HWMON is not set
# CONFIG_PDA_POWER is not set
CONFIG_APM_POWER=y
# CONFIG_GENERIC_ADC_BATTERY is not set
CONFIG_IP5XXX_POWER=y
# CONFIG_MAX8925_POWER is not set
CONFIG_WM8350_POWER=y
CONFIG_TEST_POWER=y
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_CW2015=y
# CONFIG_BATTERY_DS2760 is not set
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_LEGO_EV3 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
CONFIG_BATTERY_BQ27XXX_HDQ=y
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_PCF50633=y
CONFIG_CHARGER_ISP1704=y
# CONFIG_CHARGER_MAX8903 is not set
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=y
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_DETECTOR_MAX14656=y
CONFIG_CHARGER_MAX77650=y
# CONFIG_CHARGER_MAX77693 is not set
CONFIG_CHARGER_MAX77976=y
# CONFIG_CHARGER_QCOM_SMBB is not set
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_RK817=y
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65090=y
# CONFIG_CHARGER_TPS65217 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_SC2731 is not set
# CONFIG_FUEL_GAUGE_SC27XX is not set
CONFIG_CHARGER_UCS1002=y
# CONFIG_CHARGER_BD99954 is not set
CONFIG_BATTERY_UG3105=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_AD7414=y
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=y
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=y
CONFIG_SENSORS_ADT7462=y
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
CONFIG_SENSORS_AHT10=y
CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=y
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_ASC7621=y
CONFIG_SENSORS_AXI_FAN_CONTROL=y
# CONFIG_SENSORS_ASB100 is not set
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=y
# CONFIG_SENSORS_BT1_PVT is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
CONFIG_SENSORS_CORSAIR_PSU=y
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_I5K_AMB is not set
# CONFIG_SENSORS_SPARX5 is not set
# CONFIG_SENSORS_F71805F is not set
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_GSC=y
CONFIG_SENSORS_MC13783_ADC=y
# CONFIG_SENSORS_FSCHMD is not set
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=y
CONFIG_SENSORS_HIH6130=y
# CONFIG_SENSORS_IBMAEM is not set
# CONFIG_SENSORS_IBMPEX is not set
CONFIG_SENSORS_IIO_HWMON=y
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_JC42=y
# CONFIG_SENSORS_POWR1220 is not set
# CONFIG_SENSORS_LAN966X is not set
CONFIG_SENSORS_LINEAGE=y
# CONFIG_SENSORS_LOCHNAGAR is not set
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
CONFIG_SENSORS_LTC2990=y
CONFIG_SENSORS_LTC2992=y
CONFIG_SENSORS_LTC4151=y
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=y
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=y
# CONFIG_SENSORS_MAX1619 is not set
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31730=y
CONFIG_SENSORS_MAX31760=y
CONFIG_SENSORS_MAX6620=y
CONFIG_SENSORS_MAX6621=y
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6650=y
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=y
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_MLXREG_FAN is not set
CONFIG_SENSORS_TC654=y
CONFIG_SENSORS_TPS23861=y
CONFIG_SENSORS_MENF21BMC_HWMON=y
CONFIG_SENSORS_MR75203=y
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM73 is not set
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
CONFIG_SENSORS_LM87=y
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=y
# CONFIG_SENSORS_LM95241 is not set
# CONFIG_SENSORS_LM95245 is not set
# CONFIG_SENSORS_PC87360 is not set
# CONFIG_SENSORS_PC87427 is not set
CONFIG_SENSORS_NTC_THERMISTOR=y
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775_CORE=y
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT6775_I2C=y
# CONFIG_SENSORS_NCT7802 is not set
CONFIG_SENSORS_NCT7904=y
CONFIG_SENSORS_NPCM7XX=y
# CONFIG_SENSORS_NSA320 is not set
CONFIG_SENSORS_NZXT_KRAKEN2=y
CONFIG_SENSORS_NZXT_SMART2=y
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_PMBUS=y
CONFIG_SENSORS_PMBUS=y
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=y
CONFIG_SENSORS_BEL_PFE=y
CONFIG_SENSORS_BPA_RS600=y
CONFIG_SENSORS_DELTA_AHE50DC_FAN=y
CONFIG_SENSORS_FSP_3Y=y
# CONFIG_SENSORS_IBM_CFFPS is not set
CONFIG_SENSORS_DPS920AB=y
CONFIG_SENSORS_INSPUR_IPSPS=y
CONFIG_SENSORS_IR35221=y
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
CONFIG_SENSORS_IRPS5401=y
CONFIG_SENSORS_ISL68137=y
# CONFIG_SENSORS_LM25066 is not set
# CONFIG_SENSORS_LT7182S is not set
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX15301=y
CONFIG_SENSORS_MAX16064=y
# CONFIG_SENSORS_MAX16601 is not set
CONFIG_SENSORS_MAX20730=y
CONFIG_SENSORS_MAX20751=y
CONFIG_SENSORS_MAX31785=y
CONFIG_SENSORS_MAX34440=y
# CONFIG_SENSORS_MAX8688 is not set
CONFIG_SENSORS_MP2888=y
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
CONFIG_SENSORS_PIM4328=y
# CONFIG_SENSORS_PLI1209BC is not set
CONFIG_SENSORS_PM6764TR=y
CONFIG_SENSORS_PXE1610=y
CONFIG_SENSORS_Q54SJ108A2=y
CONFIG_SENSORS_STPDDC60=y
CONFIG_SENSORS_TPS40422=y
CONFIG_SENSORS_TPS53679=y
CONFIG_SENSORS_TPS546D24=y
CONFIG_SENSORS_UCD9000=y
# CONFIG_SENSORS_UCD9200 is not set
CONFIG_SENSORS_XDPE152=y
CONFIG_SENSORS_XDPE122=y
CONFIG_SENSORS_XDPE122_REGULATOR=y
CONFIG_SENSORS_ZL6100=y
# CONFIG_SENSORS_PWM_FAN is not set
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
# CONFIG_SENSORS_SL28CPLD is not set
# CONFIG_SENSORS_SBTSI is not set
CONFIG_SENSORS_SBRMI=y
CONFIG_SENSORS_SHT15=y
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHT4x=y
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=y
# CONFIG_SENSORS_SY7636A is not set
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=y
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M1=y
CONFIG_SENSORS_SMSC47M192=y
# CONFIG_SENSORS_SMSC47B397 is not set
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
# CONFIG_SENSORS_SCH5636 is not set
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=y
CONFIG_SENSORS_ADC128D818=y
CONFIG_SENSORS_ADS7828=y
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
# CONFIG_SENSORS_INA2XX is not set
# CONFIG_SENSORS_INA238 is not set
CONFIG_SENSORS_INA3221=y
# CONFIG_SENSORS_TC74 is not set
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=y
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=y
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
# CONFIG_SENSORS_TMP464 is not set
CONFIG_SENSORS_TMP513=y
CONFIG_SENSORS_VEXPRESS=y
CONFIG_SENSORS_VIA686A=y
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_VT8231=y
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=y
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=y
# CONFIG_SENSORS_W83627EHF is not set
# CONFIG_SENSORS_WM8350 is not set
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_DA9052_WATCHDOG is not set
# CONFIG_DA9055_WATCHDOG is not set
# CONFIG_DA9063_WATCHDOG is not set
# CONFIG_DA9062_WATCHDOG is not set
CONFIG_GPIO_WATCHDOG=y
# CONFIG_GPIO_WATCHDOG_ARCH_INITCALL is not set
# CONFIG_MENF21BMC_WATCHDOG is not set
CONFIG_WM8350_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
# CONFIG_RAVE_SP_WATCHDOG is not set
CONFIG_MLX_WDT=y
# CONFIG_SL28CPLD_WATCHDOG is not set
CONFIG_ARM_SP805_WATCHDOG=y
# CONFIG_ARMADA_37XX_WATCHDOG is not set
# CONFIG_ASM9260_WATCHDOG is not set
# CONFIG_AT91RM9200_WATCHDOG is not set
# CONFIG_AT91SAM9X_WATCHDOG is not set
# CONFIG_SAMA5D4_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=y
# CONFIG_977_WATCHDOG is not set
# CONFIG_FTWDT010_WATCHDOG is not set
# CONFIG_S3C2410_WATCHDOG is not set
CONFIG_DW_WATCHDOG=y
# CONFIG_EP93XX_WATCHDOG is not set
# CONFIG_OMAP_WATCHDOG is not set
# CONFIG_PNX4008_WATCHDOG is not set
# CONFIG_DAVINCI_WATCHDOG is not set
# CONFIG_K3_RTI_WATCHDOG is not set
# CONFIG_ORION_WATCHDOG is not set
# CONFIG_RN5T618_WATCHDOG is not set
# CONFIG_SUNXI_WATCHDOG is not set
# CONFIG_NPCM7XX_WATCHDOG is not set
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
# CONFIG_TS4800_WATCHDOG is not set
# CONFIG_TS72XX_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=y
# CONFIG_MAX77620_WATCHDOG is not set
CONFIG_IMX2_WDT=y
# CONFIG_IMX7ULP_WDT is not set
# CONFIG_RETU_WATCHDOG is not set
# CONFIG_MOXART_WDT is not set
# CONFIG_ST_LPC_WATCHDOG is not set
# CONFIG_TEGRA_WATCHDOG is not set
# CONFIG_QCOM_WDT is not set
# CONFIG_MESON_GXBB_WATCHDOG is not set
# CONFIG_MESON_WATCHDOG is not set
# CONFIG_MEDIATEK_WATCHDOG is not set
# CONFIG_DIGICOLOR_WATCHDOG is not set
# CONFIG_LPC18XX_WATCHDOG is not set
# CONFIG_RENESAS_WDT is not set
# CONFIG_RENESAS_RZAWDT is not set
# CONFIG_RENESAS_RZN1WDT is not set
# CONFIG_RENESAS_RZG2LWDT is not set
# CONFIG_ASPEED_WATCHDOG is not set
CONFIG_STPMIC1_WATCHDOG=y
# CONFIG_UNIPHIER_WATCHDOG is not set
# CONFIG_RTD119X_WATCHDOG is not set
# CONFIG_REALTEK_OTTO_WDT is not set
# CONFIG_SPRD_WATCHDOG is not set
# CONFIG_VISCONTI_WATCHDOG is not set
# CONFIG_MSC313E_WATCHDOG is not set
# CONFIG_APPLE_WATCHDOG is not set
# CONFIG_SUNPLUS_WATCHDOG is not set
# CONFIG_ALIM7101_WDT is not set
# CONFIG_SC520_WDT is not set
CONFIG_I6300ESB_WDT=y
# CONFIG_RDC321X_WDT is not set
# CONFIG_ATH79_WDT is not set
# CONFIG_BCM47XX_WDT is not set
CONFIG_BCM2835_WDT=y
# CONFIG_BCM_KONA_WDT is not set
# CONFIG_BCM7038_WDT is not set
# CONFIG_IMGPDC_WDT is not set
# CONFIG_MPC5200_WDT is not set
CONFIG_MEN_A21_WDT=y
# CONFIG_UML_WATCHDOG is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=y
CONFIG_WDTPCI=y

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
CONFIG_SSB_PCMCIAHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_MIPS is not set
CONFIG_BCMA_SFLASH=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_ACT8945A is not set
# CONFIG_MFD_SUN4I_GPADC is not set
CONFIG_MFD_AS3711=y
CONFIG_MFD_AS3722=y
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_AT91_USART is not set
CONFIG_MFD_ATMEL_FLEXCOM=y
CONFIG_MFD_ATMEL_HLCDC=y
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_MFD_ASIC3 is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=y
# CONFIG_MFD_ENE_KB3930 is not set
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_MFD_HI6421_PMIC=y
# CONFIG_MFD_HI655X_PMIC is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
# CONFIG_INTEL_SOC_PMIC is not set
CONFIG_MFD_IQS62X=y
CONFIG_MFD_JANZ_CMODIO=y
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77620 is not set
CONFIG_MFD_MAX77650=y
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77714=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_NTXEC=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
CONFIG_PCF50633_GPIO=y
CONFIG_MFD_PM8XXX=y
CONFIG_MFD_SY7636A=y
CONFIG_MFD_RDC321X=y
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
CONFIG_MFD_RK808=y
# CONFIG_MFD_RN5T618 is not set
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SIMPLE_MFD_I2C=y
# CONFIG_MFD_SL28CPLD is not set
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=y
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
CONFIG_TPS65010=y
CONFIG_TPS6507X=y
# CONFIG_MFD_TPS65086 is not set
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TPS65217=y
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TI_LP87565 is not set
CONFIG_MFD_TPS65218=y
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TC3589X=y
# CONFIG_MFD_T7L66XB is not set
# CONFIG_MFD_TC6387XB is not set
# CONFIG_MFD_TC6393XB is not set
CONFIG_MFD_TQMX86=y
CONFIG_MFD_VX855=y
CONFIG_MFD_LOCHNAGAR=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
# CONFIG_MFD_CS47L24 is not set
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
# CONFIG_MFD_STW481X is not set
CONFIG_MFD_ROHM_BD718XX=y
# CONFIG_MFD_ROHM_BD71828 is not set
# CONFIG_MFD_ROHM_BD957XMUF is not set
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=y
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_KHADAS_MCU is not set
# CONFIG_MFD_ACER_A500_EC is not set
CONFIG_MFD_QCOM_PM8008=y
CONFIG_MFD_VEXPRESS_SYSREG=y
CONFIG_RAVE_SP_CORE=y
CONFIG_MFD_RSMU_I2C=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
# CONFIG_REGULATOR_88PG86X is not set
# CONFIG_REGULATOR_88PM800 is not set
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_AD5398 is not set
# CONFIG_REGULATOR_ANATOP is not set
CONFIG_REGULATOR_AAT2870=y
CONFIG_REGULATOR_AS3711=y
# CONFIG_REGULATOR_AS3722 is not set
CONFIG_REGULATOR_BCM590XX=y
CONFIG_REGULATOR_BD718XX=y
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_DA9121=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_FAN53880 is not set
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_HI6421=y
CONFIG_REGULATOR_HI6421V530=y
# CONFIG_REGULATOR_ISL9305 is not set
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LM363X=y
CONFIG_REGULATOR_LOCHNAGAR=y
CONFIG_REGULATOR_LP3971=y
# CONFIG_REGULATOR_LP3972 is not set
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP873X=y
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LP8788=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX1586=y
# CONFIG_REGULATOR_MAX77620 is not set
CONFIG_REGULATOR_MAX77650=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8893=y
CONFIG_REGULATOR_MAX8907=y
# CONFIG_REGULATOR_MAX8925 is not set
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX20086=y
CONFIG_REGULATOR_MAX77686=y
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=y
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=y
CONFIG_REGULATOR_MCP16502=y
# CONFIG_REGULATOR_MP5416 is not set
CONFIG_REGULATOR_MP8859=y
# CONFIG_REGULATOR_MP886X is not set
CONFIG_REGULATOR_MPQ7920=y
CONFIG_REGULATOR_MT6311=y
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCF50633=y
CONFIG_REGULATOR_PF8X00=y
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_PWM=y
# CONFIG_REGULATOR_QCOM_RPMH is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RK808=y
CONFIG_REGULATOR_ROHM=y
# CONFIG_REGULATOR_RT4801 is not set
CONFIG_REGULATOR_RT5190A=y
# CONFIG_REGULATOR_RT5759 is not set
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6245=y
# CONFIG_REGULATOR_RTQ2134 is not set
# CONFIG_REGULATOR_RTMV20 is not set
# CONFIG_REGULATOR_RTQ6752 is not set
# CONFIG_REGULATOR_S2MPA01 is not set
# CONFIG_REGULATOR_S2MPS11 is not set
# CONFIG_REGULATOR_S5M8767 is not set
# CONFIG_REGULATOR_SC2731 is not set
# CONFIG_REGULATOR_SKY81452 is not set
CONFIG_REGULATOR_SLG51000=y
# CONFIG_REGULATOR_STM32_BOOSTER is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STM32_PWR is not set
CONFIG_REGULATOR_STPMIC1=y
# CONFIG_REGULATOR_TI_ABB is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
CONFIG_REGULATOR_SY7636A=y
CONFIG_REGULATOR_SY8106A=y
CONFIG_REGULATOR_SY8824X=y
# CONFIG_REGULATOR_SY8827N is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS6286X is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65090 is not set
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS65218=y
# CONFIG_REGULATOR_TPS6586X is not set
# CONFIG_REGULATOR_TPS65912 is not set
# CONFIG_REGULATOR_TPS68470 is not set
# CONFIG_REGULATOR_UNIPHIER is not set
CONFIG_REGULATOR_VCTRL=y
CONFIG_REGULATOR_VEXPRESS=y
CONFIG_REGULATOR_WM8350=y
# CONFIG_REGULATOR_WM8994 is not set
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
# CONFIG_RC_MAP is not set
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=y
CONFIG_IR_JVC_DECODER=y
CONFIG_IR_MCE_KBD_DECODER=y
CONFIG_IR_NEC_DECODER=y
# CONFIG_IR_RC5_DECODER is not set
# CONFIG_IR_RC6_DECODER is not set
CONFIG_IR_RCMM_DECODER=y
CONFIG_IR_SANYO_DECODER=y
CONFIG_IR_SHARP_DECODER=y
CONFIG_IR_SONY_DECODER=y
CONFIG_IR_XMP_DECODER=y
CONFIG_RC_DEVICES=y
# CONFIG_IR_ENE is not set
# CONFIG_IR_FINTEK is not set
# CONFIG_IR_GPIO_CIR is not set
# CONFIG_IR_HIX5HD2 is not set
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
CONFIG_IR_IMON=y
CONFIG_IR_IMON_RAW=y
# CONFIG_IR_ITE_CIR is not set
CONFIG_IR_MCEUSB=y
# CONFIG_IR_MESON is not set
# CONFIG_IR_MESON_TX is not set
# CONFIG_IR_MTK is not set
# CONFIG_IR_NUVOTON is not set
# CONFIG_IR_REDRAT3 is not set
# CONFIG_IR_RX51 is not set
# CONFIG_IR_SERIAL is not set
CONFIG_IR_STREAMZAP=y
# CONFIG_IR_SUNXI is not set
# CONFIG_IR_TOY is not set
CONFIG_IR_TTUSBIR=y
# CONFIG_IR_WINBOND_CIR is not set
CONFIG_RC_ATI_REMOTE=y
# CONFIG_RC_LOOPBACK is not set
# CONFIG_RC_ST is not set
CONFIG_RC_XBOX_DVD=y
# CONFIG_IR_IMG is not set
CONFIG_CEC_CORE=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
# CONFIG_CEC_MESON_AO is not set
# CONFIG_CEC_MESON_G12A_AO is not set
# CONFIG_CEC_GPIO is not set
# CONFIG_CEC_SAMSUNG_S5P is not set
# CONFIG_CEC_STI is not set
# CONFIG_CEC_STM32 is not set
# CONFIG_CEC_TEGRA is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
CONFIG_V4L2_FLASH_LED_CLASS=y
CONFIG_V4L2_FWNODE=y
CONFIG_V4L2_ASYNC=y
# end of Video4Linux options

#
# Media controller options
#
# end of Media controller options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
CONFIG_MEDIA_PCI_SUPPORT=y
# CONFIG_RADIO_ADAPTERS is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_SDR_PLATFORM_DRIVERS=y
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_VIDEO_MUX is not set

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#
CONFIG_VIDEO_ASPEED=y

#
# Atmel media platform drivers
#
# CONFIG_VIDEO_ATMEL_ISC is not set
# CONFIG_VIDEO_ATMEL_XISC is not set
# CONFIG_VIDEO_ATMEL_ISI is not set
# CONFIG_VIDEO_MICROCHIP_CSI2DC is not set

#
# Cadence media platform drivers
#
CONFIG_VIDEO_CADENCE_CSI2RX=y
CONFIG_VIDEO_CADENCE_CSI2TX=y

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#
# CONFIG_VIDEO_PXA27x is not set

#
# Marvell media platform drivers
#
# CONFIG_VIDEO_CAFE_CCIC is not set
# CONFIG_VIDEO_MMP_CAMERA is not set

#
# Mediatek media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#
CONFIG_VIDEO_IMX_MIPI_CSIS=y

#
# Qualcomm media platform drivers
#
# CONFIG_VIDEO_QCOM_CAMSS is not set

#
# Renesas media platform drivers
#
# CONFIG_VIDEO_RENESAS_CEU is not set
# CONFIG_VIDEO_RCAR_ISP is not set
# CONFIG_VIDEO_SH_VOU is not set
# CONFIG_VIDEO_RCAR_CSI2 is not set
# CONFIG_VIDEO_RCAR_VIN is not set
# CONFIG_VIDEO_RCAR_DRIF is not set

#
# Rockchip media platform drivers
#
CONFIG_VIDEO_ROCKCHIP_ISP1=y

#
# Samsung media platform drivers
#
# CONFIG_VIDEO_SAMSUNG_EXYNOS4_IS is not set
# CONFIG_VIDEO_S3C_CAMIF is not set

#
# STMicroelectronics media platform drivers
#
# CONFIG_VIDEO_STM32_DCMI is not set

#
# Sunxi media platform drivers
#
# CONFIG_VIDEO_SUN4I_CSI is not set
# CONFIG_VIDEO_SUN6I_CSI is not set
# CONFIG_VIDEO_SUN8I_A83T_MIPI_CSI2 is not set

#
# Texas Instruments drivers
#
# CONFIG_VIDEO_TI_CAL is not set
# CONFIG_VIDEO_AM437X_VPFE is not set
# CONFIG_VIDEO_DAVINCI_VPIF_DISPLAY is not set
# CONFIG_VIDEO_DAVINCI_VPIF_CAPTURE is not set
# CONFIG_VIDEO_DAVINCI_VPBE_DISPLAY is not set
# CONFIG_VIDEO_OMAP2_VOUT is not set
# CONFIG_VIDEO_OMAP3 is not set

#
# Verisilicon media platform drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#
CONFIG_VIDEO_XILINX=y
CONFIG_VIDEO_XILINX_CSI2RXSS=y
# CONFIG_VIDEO_XILINX_TPG is not set
CONFIG_VIDEO_XILINX_VTC=y
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_VIDEOBUF2_VMALLOC=y
# end of Media drivers

#
# Media ancillary drivers
#

#
# IR I2C driver auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_VIDEO_IR_I2C=y

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_CS3308=y
CONFIG_VIDEO_CS5345=y
# CONFIG_VIDEO_CS53L32A is not set
# CONFIG_VIDEO_MSP3400 is not set
CONFIG_VIDEO_SONY_BTF_MPX=y
CONFIG_VIDEO_TDA7432=y
CONFIG_VIDEO_TDA9840=y
# CONFIG_VIDEO_TEA6415C is not set
# CONFIG_VIDEO_TEA6420 is not set
CONFIG_VIDEO_TLV320AIC23B=y
# CONFIG_VIDEO_TVAUDIO is not set
CONFIG_VIDEO_UDA1342=y
# CONFIG_VIDEO_VP27SMPX is not set
CONFIG_VIDEO_WM8739=y
# CONFIG_VIDEO_WM8775 is not set
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=y
# end of RDS decoders

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
CONFIG_VIDEO_ADV7183=y
CONFIG_VIDEO_ADV748X=y
CONFIG_VIDEO_ADV7604=y
CONFIG_VIDEO_ADV7604_CEC=y
# CONFIG_VIDEO_ADV7842 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
CONFIG_VIDEO_BT866=y
CONFIG_VIDEO_ISL7998X=y
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_MAX9286 is not set
# CONFIG_VIDEO_ML86V7667 is not set
CONFIG_VIDEO_SAA7110=y
CONFIG_VIDEO_SAA711X=y
CONFIG_VIDEO_TC358743=y
# CONFIG_VIDEO_TC358743_CEC is not set
CONFIG_VIDEO_TVP514X=y
# CONFIG_VIDEO_TVP5150 is not set
CONFIG_VIDEO_TVP7002=y
CONFIG_VIDEO_TW2804=y
CONFIG_VIDEO_TW9903=y
CONFIG_VIDEO_TW9906=y
CONFIG_VIDEO_TW9910=y
CONFIG_VIDEO_VPX3220=y

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=y
CONFIG_VIDEO_CX25840=y
# end of Video decoders

#
# Video encoders
#
# CONFIG_VIDEO_AD9389B is not set
# CONFIG_VIDEO_ADV7170 is not set
CONFIG_VIDEO_ADV7175=y
CONFIG_VIDEO_ADV7343=y
CONFIG_VIDEO_ADV7393=y
# CONFIG_VIDEO_ADV7511 is not set
CONFIG_VIDEO_AK881X=y
# CONFIG_VIDEO_SAA7127 is not set
CONFIG_VIDEO_SAA7185=y
CONFIG_VIDEO_THS8200=y
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=y
CONFIG_VIDEO_UPD64083=y
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# CONFIG_SDR_MAX2175 is not set
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_I2C=y
CONFIG_VIDEO_M52790=y
# CONFIG_VIDEO_ST_MIPID02 is not set
CONFIG_VIDEO_THS7303=y
# end of Miscellaneous helper chips

CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_E4000=y
CONFIG_MEDIA_TUNER_FC0011=y
CONFIG_MEDIA_TUNER_FC0012=y
# CONFIG_MEDIA_TUNER_FC0013 is not set
CONFIG_MEDIA_TUNER_FC2580=y
# CONFIG_MEDIA_TUNER_IT913X is not set
CONFIG_MEDIA_TUNER_M88RS6000T=y
CONFIG_MEDIA_TUNER_MAX2165=y
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MT2060=y
CONFIG_MEDIA_TUNER_MT2063=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_MT2266=y
CONFIG_MEDIA_TUNER_MXL301RF=y
# CONFIG_MEDIA_TUNER_MXL5005S is not set
CONFIG_MEDIA_TUNER_MXL5007T=y
CONFIG_MEDIA_TUNER_QM1D1B0004=y
# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
# CONFIG_MEDIA_TUNER_QT1010 is not set
# CONFIG_MEDIA_TUNER_R820T is not set
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_SIMPLE=y
# CONFIG_MEDIA_TUNER_TDA18212 is not set
CONFIG_MEDIA_TUNER_TDA18218=y
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_TUA9001=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y
# end of Customize TV tuners
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
# CONFIG_TEGRA_HOST1X is not set
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DEBUG_MM is not set
CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS=y
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_AUX_BUS=y
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=y
CONFIG_DRM_BUDDY=y
CONFIG_DRM_VRAM_HELPER=y
CONFIG_DRM_TTM_HELPER=y
CONFIG_DRM_GEM_DMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=y
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
CONFIG_DRM_HDLCD=y
# CONFIG_DRM_HDLCD_SHOW_UNDERRUN is not set
# CONFIG_DRM_MALI_DISPLAY is not set
# CONFIG_DRM_KOMEDA is not set
# end of ARM devices

# CONFIG_DRM_RADEON is not set
CONFIG_DRM_AMDGPU=y
# CONFIG_DRM_AMDGPU_SI is not set
CONFIG_DRM_AMDGPU_CIK=y
CONFIG_DRM_AMDGPU_USERPTR=y

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_AMD_ACP is not set
# end of ACP (Audio CoProcessor) Configuration

#
# Display Engine Configuration
#
# CONFIG_DRM_AMD_DC is not set
# end of Display Engine Configuration

# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_KMB_DISPLAY is not set
CONFIG_DRM_VGEM=y
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_EXYNOS is not set
CONFIG_DRM_UDL=y
CONFIG_DRM_AST=y
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_ARMADA=y
# CONFIG_DRM_ATMEL_HLCDC is not set
# CONFIG_DRM_RCAR_DU is not set
CONFIG_DRM_RCAR_DW_HDMI=y
CONFIG_DRM_RCAR_USE_LVDS=y
# CONFIG_DRM_RCAR_MIPI_DSI is not set
# CONFIG_DRM_SHMOBILE is not set
# CONFIG_DRM_SUN4I is not set
# CONFIG_DRM_TILCDC is not set
# CONFIG_DRM_QXL is not set
# CONFIG_DRM_VIRTIO_GPU is not set
# CONFIG_DRM_MSM is not set
CONFIG_DRM_FSL_DCU=y
# CONFIG_DRM_TEGRA is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_ARM_VERSATILE=y
# CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596 is not set
CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0=y
CONFIG_DRM_PANEL_BOE_HIMAX8279D=y
CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=y
CONFIG_DRM_PANEL_DSI_CM=y
# CONFIG_DRM_PANEL_LVDS is not set
CONFIG_DRM_PANEL_SIMPLE=y
# CONFIG_DRM_PANEL_EDP is not set
CONFIG_DRM_PANEL_EBBG_FT8719=y
# CONFIG_DRM_PANEL_ELIDA_KD35T133 is not set
CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=y
CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=y
# CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
CONFIG_DRM_PANEL_JDI_R63452=y
# CONFIG_DRM_PANEL_KHADAS_TS050 is not set
# CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04 is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829=y
CONFIG_DRM_PANEL_NOVATEK_NT35510=y
CONFIG_DRM_PANEL_NOVATEK_NT35560=y
CONFIG_DRM_PANEL_NOVATEK_NT35950=y
CONFIG_DRM_PANEL_NOVATEK_NT36672A=y
CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=y
# CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO is not set
# CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=y
CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=y
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_RAYDIUM_RM67191 is not set
CONFIG_DRM_PANEL_RAYDIUM_RM68200=y
CONFIG_DRM_PANEL_RONBO_RB070D30=y
CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y
# CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=y
CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=y
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
CONFIG_DRM_PANEL_SAMSUNG_SOFEF00=y
CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=y
CONFIG_DRM_PANEL_SHARP_LS037V7DW01=y
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=y
# CONFIG_DRM_PANEL_SHARP_LS060T1SX01 is not set
CONFIG_DRM_PANEL_SITRONIX_ST7701=y
CONFIG_DRM_PANEL_SITRONIX_ST7703=y
CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521=y
# CONFIG_DRM_PANEL_TDO_TL070WSH30 is not set
CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=y
CONFIG_DRM_PANEL_VISIONOX_RM69299=y
# CONFIG_DRM_PANEL_XINPENG_XPP055C272 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_CDNS_DSI=y
CONFIG_DRM_CHIPONE_ICN6211=y
# CONFIG_DRM_CHRONTEL_CH7033 is not set
# CONFIG_DRM_CROS_EC_ANX7688 is not set
CONFIG_DRM_DISPLAY_CONNECTOR=y
# CONFIG_DRM_FSL_LDB is not set
CONFIG_DRM_ITE_IT6505=y
CONFIG_DRM_LONTIUM_LT8912B=y
# CONFIG_DRM_LONTIUM_LT9211 is not set
CONFIG_DRM_LONTIUM_LT9611=y
CONFIG_DRM_LONTIUM_LT9611UXC=y
CONFIG_DRM_ITE_IT66121=y
# CONFIG_DRM_LVDS_CODEC is not set
CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=y
CONFIG_DRM_NWL_MIPI_DSI=y
CONFIG_DRM_NXP_PTN3460=y
CONFIG_DRM_PARADE_PS8622=y
# CONFIG_DRM_PARADE_PS8640 is not set
CONFIG_DRM_SIL_SII8620=y
CONFIG_DRM_SII902X=y
# CONFIG_DRM_SII9234 is not set
# CONFIG_DRM_SIMPLE_BRIDGE is not set
CONFIG_DRM_THINE_THC63LVD1024=y
CONFIG_DRM_TOSHIBA_TC358762=y
# CONFIG_DRM_TOSHIBA_TC358764 is not set
# CONFIG_DRM_TOSHIBA_TC358767 is not set
CONFIG_DRM_TOSHIBA_TC358768=y
CONFIG_DRM_TOSHIBA_TC358775=y
CONFIG_DRM_TI_DLPC3433=y
CONFIG_DRM_TI_TFP410=y
CONFIG_DRM_TI_SN65DSI83=y
CONFIG_DRM_TI_SN65DSI86=y
# CONFIG_DRM_TI_TPD12S015 is not set
CONFIG_DRM_ANALOGIX_ANX6345=y
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
# CONFIG_DRM_ANALOGIX_ANX7625 is not set
CONFIG_DRM_I2C_ADV7511=y
# CONFIG_DRM_I2C_ADV7511_CEC is not set
# CONFIG_DRM_CDNS_MHDP8546 is not set
CONFIG_DRM_IMX8QM_LDB=y
CONFIG_DRM_IMX8QXP_LDB=y
CONFIG_DRM_IMX8QXP_PIXEL_COMBINER=y
CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI=y
CONFIG_DRM_DW_HDMI=y
# CONFIG_DRM_DW_HDMI_CEC is not set
# end of Display Interface Bridges

# CONFIG_DRM_V3D is not set
# CONFIG_DRM_ETNAVIV is not set
# CONFIG_DRM_HISI_HIBMC is not set
CONFIG_DRM_LOGICVC=y
CONFIG_DRM_MXS=y
CONFIG_DRM_MXSFB=y
# CONFIG_DRM_IMX_LCDIF is not set
# CONFIG_DRM_MESON is not set
CONFIG_DRM_ARCPGU=y
CONFIG_DRM_BOCHS=y
# CONFIG_DRM_CIRRUS_QEMU is not set
CONFIG_DRM_GM12U320=y
CONFIG_DRM_SIMPLEDRM=y
CONFIG_DRM_PL111=y
CONFIG_DRM_LIMA=y
CONFIG_DRM_PANFROST=y
# CONFIG_DRM_ASPEED_GFX is not set
CONFIG_DRM_TIDSS=y
CONFIG_DRM_GUD=y
CONFIG_DRM_SSD130X=y
CONFIG_DRM_SSD130X_I2C=y
# CONFIG_DRM_SPRD is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
CONFIG_FB_BOTH_ENDIAN=y
# CONFIG_FB_BIG_ENDIAN is not set
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
CONFIG_FB_PM2=y
# CONFIG_FB_PM2_FIFO_DISCONNECT is not set
CONFIG_FB_ARMCLCD=y
# CONFIG_FB_CLPS711X is not set
# CONFIG_FB_IMX is not set
CONFIG_FB_CYBER2000=y
# CONFIG_FB_CYBER2000_DDC is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_CONTROL is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_GBE is not set
# CONFIG_FB_PVR2 is not set
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
# CONFIG_FB_ATMEL is not set
CONFIG_FB_NVIDIA=y
CONFIG_FB_NVIDIA_I2C=y
CONFIG_FB_NVIDIA_DEBUG=y
# CONFIG_FB_NVIDIA_BACKLIGHT is not set
CONFIG_FB_RIVA=y
CONFIG_FB_RIVA_I2C=y
# CONFIG_FB_RIVA_DEBUG is not set
CONFIG_FB_RIVA_BACKLIGHT=y
CONFIG_FB_I740=y
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
CONFIG_FB_SAVAGE=y
# CONFIG_FB_SAVAGE_I2C is not set
CONFIG_FB_SAVAGE_ACCEL=y
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
CONFIG_FB_KYRO=y
# CONFIG_FB_3DFX is not set
CONFIG_FB_VOODOO1=y
CONFIG_FB_VT8623=y
# CONFIG_FB_TRIDENT is not set
CONFIG_FB_ARK=y
CONFIG_FB_PM3=y
CONFIG_FB_CARMINE=y
CONFIG_FB_CARMINE_DRAM_EVAL=y
# CONFIG_CARMINE_DRAM_CUSTOM is not set
# CONFIG_FB_WM8505 is not set
# CONFIG_FB_PXA168 is not set
# CONFIG_FB_W100 is not set
# CONFIG_FB_SH_MOBILE_LCDC is not set
# CONFIG_FB_TMIO is not set
# CONFIG_FB_S3C is not set
# CONFIG_FB_SMSCUFX is not set
CONFIG_FB_UDL=y
CONFIG_FB_IBM_GXT4500=y
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_DA8XX is not set
CONFIG_FB_VIRTUAL=y
# CONFIG_FB_METRONOME is not set
CONFIG_FB_MB862XX=y
CONFIG_FB_MB862XX_PCI_GDC=y
# CONFIG_FB_MB862XX_I2C is not set
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_SSD1307 is not set
CONFIG_FB_SM712=y
# CONFIG_FB_OMAP is not set
CONFIG_FB_OMAP_LCD_H3=y
# CONFIG_FB_OMAP2 is not set
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_OMAP1 is not set
CONFIG_BACKLIGHT_PWM=y
# CONFIG_BACKLIGHT_MAX8925 is not set
CONFIG_BACKLIGHT_QCOM_WLED=y
# CONFIG_BACKLIGHT_ADP5520 is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_PCF50633=y
# CONFIG_BACKLIGHT_AAT2870 is not set
CONFIG_BACKLIGHT_LM3630A=y
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=y
CONFIG_BACKLIGHT_LP8788=y
CONFIG_BACKLIGHT_SKY81452=y
# CONFIG_BACKLIGHT_TPS65217 is not set
CONFIG_BACKLIGHT_AS3711=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_RAVE_SP=y
# CONFIG_BACKLIGHT_LED is not set
# end of Backlight & LCD device support

CONFIG_VGASTATE=y
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
# CONFIG_LOGO is not set
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACCUTOUCH=y
CONFIG_HID_ACRUX=y
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=y
CONFIG_HID_APPLEIR=y
CONFIG_HID_ASUS=y
CONFIG_HID_AUREAL=y
# CONFIG_HID_BELKIN is not set
CONFIG_HID_BETOP_FF=y
CONFIG_HID_BIGBEN_FF=y
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
# CONFIG_HID_CORSAIR is not set
CONFIG_HID_COUGAR=y
CONFIG_HID_MACALLY=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CREATIVE_SB0540=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELAN=y
# CONFIG_HID_ELECOM is not set
CONFIG_HID_ELO=y
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=y
# CONFIG_HID_GFRM is not set
CONFIG_HID_GLORIOUS=y
CONFIG_HID_HOLTEK=y
# CONFIG_HOLTEK_FF is not set
CONFIG_HID_VIVALDI_COMMON=y
CONFIG_HID_VIVALDI=y
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=y
# CONFIG_HID_KYE is not set
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=y
CONFIG_HID_VIEWSONIC=y
CONFIG_HID_VRC2=y
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=y
# CONFIG_HID_ITE is not set
CONFIG_HID_JABRA=y
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
# CONFIG_HID_LENOVO is not set
CONFIG_HID_LETSKETCH=y
# CONFIG_HID_LOGITECH is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
CONFIG_HID_MAYFLASH=y
CONFIG_HID_MEGAWORLD_FF=y
CONFIG_HID_REDRAGON=y
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
CONFIG_HID_NINTENDO=y
CONFIG_NINTENDO_FF=y
CONFIG_HID_NTI=y
CONFIG_HID_NTRIG=y
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
# CONFIG_HID_PICOLCD_FB is not set
CONFIG_HID_PICOLCD_BACKLIGHT=y
# CONFIG_HID_PICOLCD_LEDS is not set
CONFIG_HID_PICOLCD_CIR=y
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PXRC=y
CONFIG_HID_RAZER=y
CONFIG_HID_PRIMAX=y
CONFIG_HID_RETRODE=y
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=y
CONFIG_HID_SAMSUNG=y
CONFIG_HID_SEMITEK=y
CONFIG_HID_SIGMAMICRO=y
# CONFIG_HID_SONY is not set
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEAM=y
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=y
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
CONFIG_HID_SMARTJOYPLUS=y
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=y
# CONFIG_HID_TOPSEED is not set
CONFIG_HID_TOPRE=y
# CONFIG_HID_THINGM is not set
CONFIG_HID_THRUSTMASTER=y
CONFIG_THRUSTMASTER_FF=y
CONFIG_HID_UDRAW_PS3=y
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
# CONFIG_HID_ZEROPLUS is not set
CONFIG_HID_ZYDACRON=y
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=y
CONFIG_HID_ALPS=y
CONFIG_HID_MCP2221=y
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
CONFIG_HID_PID=y
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_OF is not set
CONFIG_I2C_HID_OF_ELAN=y
CONFIG_I2C_HID_OF_GOODIX=y
# end of I2C HID support

CONFIG_I2C_HID_CORE=y

#
# Intel ISH HID support
#
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
# CONFIG_USB_ULPI_BUS is not set
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
CONFIG_USB_OTG=y
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_OTG_FSM=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
# CONFIG_USB_XHCI_HCD is not set
# CONFIG_USB_BRCMSTB is not set
# CONFIG_USB_EHCI_HCD is not set
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
# CONFIG_USB_ISP1362_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
CONFIG_USB_OHCI_HCD=y
# CONFIG_USB_OHCI_HCD_SPEAR is not set
# CONFIG_USB_OHCI_HCD_STI is not set
# CONFIG_USB_OHCI_HCD_S3C2410 is not set
CONFIG_USB_OHCI_HCD_LPC32XX=y
# CONFIG_USB_OHCI_HCD_AT91 is not set
# CONFIG_USB_OHCI_HCD_OMAP3 is not set
# CONFIG_USB_OHCI_HCD_DAVINCI is not set
# CONFIG_USB_OHCI_HCD_SSB is not set
# CONFIG_USB_OHCI_SH is not set
# CONFIG_USB_OHCI_EXYNOS is not set
# CONFIG_USB_CNS3XXX_OHCI is not set
CONFIG_USB_OHCI_HCD_PLATFORM=y
# CONFIG_USB_SL811_HCD is not set
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_HCD_BCMA=y
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y
CONFIG_USBIP_CORE=y
# CONFIG_USBIP_VHCI_HCD is not set
CONFIG_USBIP_HOST=y
# CONFIG_USBIP_DEBUG is not set
CONFIG_USB_CDNS_SUPPORT=y
# CONFIG_USB_CDNS3 is not set
# CONFIG_USB_MTU3 is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#
# CONFIG_USB_MUSB_TUSB6010 is not set
# CONFIG_USB_MUSB_DSPS is not set
# CONFIG_USB_MUSB_UX500 is not set

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_HOST=y

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_OMAP=y
CONFIG_USB_DWC3_EXYNOS=y
CONFIG_USB_DWC3_KEYSTONE=y
CONFIG_USB_DWC3_MESON_G12A=y
CONFIG_USB_DWC3_OF_SIMPLE=y
CONFIG_USB_DWC3_ST=y
CONFIG_USB_DWC3_QCOM=y
CONFIG_USB_DWC3_IMX8MP=y
CONFIG_USB_DWC3_AM62=y
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
# CONFIG_USB_DWC2_DEBUG is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#
CONFIG_USB_USS720=y

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=y
# CONFIG_USB_ADUTUX is not set
CONFIG_USB_SEVSEG=y
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
CONFIG_USB_CYPRESS_CY7C63=y
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=y
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_QCOM_EUD is not set
CONFIG_APPLE_MFI_FASTCHARGE=y
# CONFIG_USB_SISUSBVGA is not set
CONFIG_USB_LD=y
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=y
CONFIG_USB_TEST=y
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
# CONFIG_USB_EZUSB_FX2 is not set
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
CONFIG_USB_CHAOSKEY=y
# CONFIG_BRCM_USB_PINMAP is not set
CONFIG_USB_ONBOARD_HUB=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_ISP1301_OMAP is not set
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_TAHVO_USB=y
CONFIG_TAHVO_USB_HOST_BY_DEFAULT=y
CONFIG_USB_ISP1301=y
# CONFIG_USB_MXS_PHY is not set
# CONFIG_USB_TEGRA_PHY is not set
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# CONFIG_JZ4770_PHY is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
# CONFIG_TYPEC_UCSI is not set
CONFIG_TYPEC_TPS6598X=y
CONFIG_TYPEC_ANX7411=y
# CONFIG_TYPEC_RT1719 is not set
CONFIG_TYPEC_HD3SS3220=y
CONFIG_TYPEC_STUSB160X=y
# CONFIG_TYPEC_QCOM_PMIC is not set
CONFIG_TYPEC_WUSB3801=y

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
CONFIG_TYPEC_MUX_PI3USB30532=y
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=y
CONFIG_TYPEC_NVIDIA_ALTMODE=y
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
# CONFIG_PWRSEQ_EMMC is not set
CONFIG_PWRSEQ_SD8787=y
CONFIG_PWRSEQ_SIMPLE=y
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
# CONFIG_MMC_TEST is not set
CONFIG_MMC_CRYPTO=y

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_ARMMMCI=y
CONFIG_MMC_STM32_SDMMC=y
CONFIG_MMC_SDHCI=y
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=y
CONFIG_MMC_RICOH_MMC=y
# CONFIG_MMC_SDHCI_PLTFM is not set
# CONFIG_MMC_SDHCI_S3C is not set
# CONFIG_MMC_SDHCI_SPEAR is not set
# CONFIG_MMC_MESON_GX is not set
# CONFIG_MMC_MESON_MX_SDHC is not set
# CONFIG_MMC_MESON_MX_SDIO is not set
# CONFIG_MMC_MOXART is not set
# CONFIG_MMC_OMAP_HS is not set
CONFIG_MMC_ALCOR=y
# CONFIG_MMC_MXC is not set
CONFIG_MMC_TIFM_SD=y
# CONFIG_MMC_MVSDIO is not set
# CONFIG_MMC_DAVINCI is not set
# CONFIG_MMC_S3C is not set
# CONFIG_MMC_SDRICOH_CS is not set
# CONFIG_MMC_TMIO is not set
# CONFIG_MMC_SDHI is not set
# CONFIG_MMC_UNIPHIER is not set
# CONFIG_MMC_CB710 is not set
CONFIG_MMC_VIA_SDMMC=y
# CONFIG_MMC_DW is not set
# CONFIG_MMC_SH_MMCIF is not set
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_REALTEK_PCI=y
CONFIG_MMC_REALTEK_USB=y
CONFIG_MMC_CQHCI=y
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_BCM2835=y
CONFIG_MMC_MTK=y
# CONFIG_MMC_OWL is not set
# CONFIG_MMC_LITEX is not set
CONFIG_SCSI_UFSHCD=y
# CONFIG_SCSI_UFS_BSG is not set
CONFIG_SCSI_UFS_CRYPTO=y
CONFIG_SCSI_UFS_HPB=y
# CONFIG_SCSI_UFS_HWMON is not set
# CONFIG_SCSI_UFSHCD_PCI is not set
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
# CONFIG_SCSI_UFS_TI_J721E is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_AN30259A=y
# CONFIG_LEDS_ARIEL is not set
CONFIG_LEDS_AW2013=y
# CONFIG_LEDS_BCM6328 is not set
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
# CONFIG_LEDS_S3C24XX is not set
# CONFIG_LEDS_COBALT_QUBE is not set
# CONFIG_LEDS_COBALT_RAQ is not set
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
CONFIG_LEDS_LP5523=y
# CONFIG_LEDS_LP5562 is not set
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8788=y
CONFIG_LEDS_LP8860=y
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_WM8350 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_REGULATOR is not set
CONFIG_LEDS_BD2802=y
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_ADP5520=y
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_NS2=y
CONFIG_LEDS_NETXBIG=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX77650=y
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_OT200 is not set
# CONFIG_LEDS_MENF21BMC is not set
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
# CONFIG_LEDS_SYSCON is not set
CONFIG_LEDS_PM8058=y
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y
# CONFIG_LEDS_TI_LMU_COMMON is not set
CONFIG_LEDS_TPS6105X=y
# CONFIG_LEDS_IP30 is not set
# CONFIG_LEDS_BCM63138 is not set
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AAT1290=y
# CONFIG_LEDS_AS3645A is not set
# CONFIG_LEDS_KTD2692 is not set
# CONFIG_LEDS_LM3601X is not set
# CONFIG_LEDS_MAX77693 is not set
CONFIG_LEDS_RT4505=y
CONFIG_LEDS_RT8515=y
# CONFIG_LEDS_SGM3140 is not set

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
CONFIG_LEDS_TRIGGER_CPU=y
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=y
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=y
CONFIG_LEDS_TRIGGER_PATTERN=y
# CONFIG_LEDS_TRIGGER_AUDIO is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=y
CONFIG_INFINIBAND_USER_MAD=y
# CONFIG_INFINIBAND_USER_ACCESS is not set
# CONFIG_INFINIBAND_ADDR_TRANS is not set
CONFIG_MLX4_INFINIBAND=y
# CONFIG_MLX5_INFINIBAND is not set
CONFIG_INFINIBAND_MTHCA=y
# CONFIG_INFINIBAND_MTHCA_DEBUG is not set
# CONFIG_INFINIBAND_OCRDMA is not set
CONFIG_INFINIBAND_IPOIB=y
# CONFIG_INFINIBAND_IPOIB_CM is not set
# CONFIG_INFINIBAND_IPOIB_DEBUG is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
# CONFIG_EDAC_LEGACY_SYSFS is not set
CONFIG_EDAC_DEBUG=y
# CONFIG_EDAC_AL_MC is not set
# CONFIG_EDAC_SYNOPSYS is not set
# CONFIG_EDAC_XGENE is not set
CONFIG_RTC_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
CONFIG_DMABUF_MOVE_NOTIFY=y
# CONFIG_DMABUF_DEBUG is not set
CONFIG_DMABUF_SELFTESTS=y
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=y
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_AEC is not set
CONFIG_UIO_SERCOS3=y
# CONFIG_UIO_PCI_GENERIC is not set
CONFIG_UIO_NETX=y
CONFIG_UIO_PRUSS=y
CONFIG_UIO_MF624=y
CONFIG_VFIO=y
CONFIG_VFIO_IOMMU_TYPE1=y
CONFIG_VFIO_VIRQFD=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_PCI_CORE=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=y
# CONFIG_MLX5_VFIO_PCI is not set
CONFIG_VFIO_PLATFORM=y
CONFIG_VFIO_AMBA=y
CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET=y
# CONFIG_VFIO_PLATFORM_AMDXGBE_RESET is not set
# CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET is not set
CONFIG_VFIO_MDEV=y
CONFIG_IRQ_BYPASS_MANAGER=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
# CONFIG_VIRTIO_PCI_LEGACY is not set
CONFIG_VIRTIO_VDPA=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VDPA=y
# CONFIG_VDPA_SIM is not set
CONFIG_VDPA_USER=y
# CONFIG_IFCVF is not set
CONFIG_MLX5_VDPA=y
CONFIG_MLX5_VDPA_NET=y
CONFIG_VP_VDPA=y
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_RING=y
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_GREYBUS_ES2=y
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=y
CONFIG_COMEDI_TEST=y
# CONFIG_COMEDI_PARPORT is not set
# CONFIG_COMEDI_SSV_DNP is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_PCMCIA_DRIVERS=y
CONFIG_COMEDI_CB_DAS16_CS=y
CONFIG_COMEDI_DAS08_CS=y
# CONFIG_COMEDI_NI_DAQ_700_CS is not set
# CONFIG_COMEDI_NI_DAQ_DIO24_CS is not set
CONFIG_COMEDI_NI_LABPC_CS=y
CONFIG_COMEDI_NI_MIO_CS=y
CONFIG_COMEDI_QUATECH_DAQP_CS=y
# CONFIG_COMEDI_USB_DRIVERS is not set
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_DAS08=y
CONFIG_COMEDI_NI_LABPC=y
CONFIG_COMEDI_NI_TIO=y
CONFIG_COMEDI_NI_ROUTING=y
CONFIG_COMEDI_TESTS=y
# CONFIG_COMEDI_TESTS_EXAMPLE is not set
# CONFIG_COMEDI_TESTS_NI_ROUTES is not set
CONFIG_STAGING=y
CONFIG_RTS5208=y
# CONFIG_OCTEON_ETHERNET is not set

#
# IIO staging drivers
#

#
# Accelerometers
#
# end of Accelerometers

#
# Analog to digital converters
#
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
# CONFIG_ADT7316 is not set
# end of Analog digital bi-direction converters

#
# Direct Digital Synthesis
#
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
CONFIG_ADE7854=y
# CONFIG_ADE7854_I2C is not set
# end of Active energy metering IC

#
# Resolver to digital converters
#
# end of Resolver to digital converters
# end of IIO staging drivers

CONFIG_FB_SM750=y
CONFIG_STAGING_MEDIA=y
# CONFIG_VIDEO_IMX_MEDIA is not set
# CONFIG_VIDEO_MAX96712 is not set
# CONFIG_VIDEO_MESON_VDEC is not set
# CONFIG_VIDEO_OMAP4 is not set
# CONFIG_VIDEO_ROCKCHIP_VDEC is not set
# CONFIG_VIDEO_SUNXI is not set
# CONFIG_STAGING_MEDIA_DEPRECATED is not set
# CONFIG_STAGING_BOARD is not set
CONFIG_MOST_COMPONENTS=y
CONFIG_MOST_NET=y
CONFIG_MOST_VIDEO=y
CONFIG_MOST_DIM2=y
CONFIG_MOST_I2C=y
CONFIG_GREYBUS_BOOTROM=y
# CONFIG_GREYBUS_HID is not set
CONFIG_GREYBUS_LIGHT=y
CONFIG_GREYBUS_LOG=y
# CONFIG_GREYBUS_LOOPBACK is not set
CONFIG_GREYBUS_POWER=y
CONFIG_GREYBUS_RAW=y
# CONFIG_GREYBUS_VIBRATOR is not set
CONFIG_GREYBUS_BRIDGED_PHY=y
# CONFIG_GREYBUS_GPIO is not set
CONFIG_GREYBUS_I2C=y
CONFIG_GREYBUS_PWM=y
CONFIG_GREYBUS_SDIO=y
CONFIG_GREYBUS_USB=y
# CONFIG_GREYBUS_ARCHE is not set
CONFIG_BCM_VIDEOCORE=y
# CONFIG_BCM2835_VCHIQ is not set
# CONFIG_VIDEO_BCM2835 is not set
# CONFIG_XIL_AXIS_FIFO is not set
CONFIG_FIELDBUS_DEV=y
CONFIG_HMS_ANYBUSS_BUS=y
# CONFIG_ARCX_ANYBUS_CONTROLLER is not set
CONFIG_HMS_PROFINET=y
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
# CONFIG_GOLDFISH is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
# CONFIG_MLXREG_HOTPLUG is not set
CONFIG_MLXREG_IO=y
CONFIG_MLXREG_LC=y
CONFIG_NVSW_SN2201=y
# CONFIG_OLPC_XO175 is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Clock driver for ARM Reference designs
#
CONFIG_CLK_ICST=y
CONFIG_CLK_SP810=y
CONFIG_CLK_VEXPRESS_OSC=y
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
# CONFIG_COMMON_CLK_APPLE_NCO is not set
# CONFIG_COMMON_CLK_MAX77686 is not set
CONFIG_COMMON_CLK_MAX9485=y
CONFIG_COMMON_CLK_RK808=y
# CONFIG_COMMON_CLK_HI655X is not set
# CONFIG_COMMON_CLK_SCMI is not set
# CONFIG_COMMON_CLK_SCPI is not set
# CONFIG_COMMON_CLK_SI5341 is not set
CONFIG_COMMON_CLK_SI5351=y
# CONFIG_COMMON_CLK_SI514 is not set
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_SI570=y
# CONFIG_COMMON_CLK_BM1880 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_TPS68470 is not set
CONFIG_COMMON_CLK_CDCE925=y
CONFIG_COMMON_CLK_CS2000_CP=y
# CONFIG_COMMON_CLK_EN7523 is not set
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
# CONFIG_COMMON_CLK_FSL_SAI is not set
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_LAN966X is not set
# CONFIG_COMMON_CLK_ASPEED is not set
# CONFIG_COMMON_CLK_S2MPS11 is not set
# CONFIG_COMMON_CLK_AXI_CLKGEN is not set
# CONFIG_CLK_QORIQ is not set
# CONFIG_CLK_LS1028A_PLLDIG is not set
# CONFIG_COMMON_CLK_XGENE is not set
CONFIG_COMMON_CLK_LOCHNAGAR=y
CONFIG_COMMON_CLK_PWM=y
# CONFIG_COMMON_CLK_OXNAS is not set
CONFIG_COMMON_CLK_RS9_PCIE=y
# CONFIG_COMMON_CLK_VC5 is not set
CONFIG_COMMON_CLK_VC7=y
# CONFIG_COMMON_CLK_MMP2_AUDIO is not set
# CONFIG_COMMON_CLK_BD718XX is not set
CONFIG_COMMON_CLK_FIXED_MMIO=y
# CONFIG_CLK_ACTIONS is not set
# CONFIG_CLK_BAIKAL_T1 is not set
CONFIG_CLK_BCM2711_DVP=y
CONFIG_CLK_BCM2835=y
# CONFIG_CLK_BCM_63XX is not set
# CONFIG_CLK_BCM_63XX_GATE is not set
# CONFIG_CLK_BCM_KONA is not set
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
# CONFIG_CLK_RASPBERRYPI is not set
# CONFIG_COMMON_CLK_HI3516CV300 is not set
# CONFIG_COMMON_CLK_HI3519 is not set
# CONFIG_COMMON_CLK_HI3559A is not set
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3670 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
# CONFIG_RESET_HISI is not set
# CONFIG_COMMON_CLK_BOSTON is not set
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX31=y
CONFIG_CLK_IMX35=y
CONFIG_CLK_IMX8MM=y
# CONFIG_CLK_IMX8MN is not set
# CONFIG_CLK_IMX8MP is not set
CONFIG_CLK_IMX8MQ=y
CONFIG_CLK_IMX8ULP=y
# CONFIG_CLK_IMX93 is not set

#
# Ingenic SoCs drivers
#
# CONFIG_INGENIC_CGU_JZ4740 is not set
# CONFIG_INGENIC_CGU_JZ4725B is not set
# CONFIG_INGENIC_CGU_JZ4760 is not set
# CONFIG_INGENIC_CGU_JZ4770 is not set
# CONFIG_INGENIC_CGU_JZ4780 is not set
# CONFIG_INGENIC_CGU_X1000 is not set
# CONFIG_INGENIC_CGU_X1830 is not set
# CONFIG_INGENIC_TCU_CLK is not set
# end of Ingenic SoCs drivers

# CONFIG_COMMON_CLK_KEYSTONE is not set
# CONFIG_TI_SYSCON_CLK is not set

#
# Clock driver for MediaTek SoC
#
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
# CONFIG_COMMON_CLK_MT6779 is not set
# CONFIG_COMMON_CLK_MT6795 is not set
# CONFIG_COMMON_CLK_MT6797 is not set
# CONFIG_COMMON_CLK_MT7622 is not set
# CONFIG_COMMON_CLK_MT7629 is not set
# CONFIG_COMMON_CLK_MT7986 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8167 is not set
# CONFIG_COMMON_CLK_MT8173 is not set
# CONFIG_COMMON_CLK_MT8183 is not set
# CONFIG_COMMON_CLK_MT8186 is not set
# CONFIG_COMMON_CLK_MT8192 is not set
# CONFIG_COMMON_CLK_MT8195 is not set
# CONFIG_COMMON_CLK_MT8365 is not set
# CONFIG_COMMON_CLK_MT8516 is not set
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
CONFIG_COMMON_CLK_MESON_REGMAP=y
CONFIG_COMMON_CLK_MESON_MPLL=y
CONFIG_COMMON_CLK_MESON_PLL=y
CONFIG_COMMON_CLK_MESON8B=y
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_MPLL is not set
# CONFIG_MCHP_CLK_MPFS is not set
# CONFIG_COMMON_CLK_PISTACHIO is not set
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_CLK_MT7621 is not set
# CONFIG_CLK_RENESAS is not set
# CONFIG_COMMON_CLK_SAMSUNG is not set
# CONFIG_S3C2410_COMMON_CLK is not set
# CONFIG_S3C2412_COMMON_CLK is not set
# CONFIG_S3C2443_COMMON_CLK is not set
# CONFIG_CLK_SIFIVE is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
# CONFIG_SPRD_COMMON_CLK is not set
# CONFIG_CLK_STARFIVE_JH7100 is not set
CONFIG_CLK_SUNXI=y
CONFIG_CLK_SUNXI_CLOCKS=y
CONFIG_CLK_SUNXI_PRCM_SUN6I=y
CONFIG_CLK_SUNXI_PRCM_SUN8I=y
CONFIG_CLK_SUNXI_PRCM_SUN9I=y
# CONFIG_SUNXI_CCU is not set
# CONFIG_COMMON_CLK_TI_ADPLL is not set
# CONFIG_CLK_UNIPHIER is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
# CONFIG_CLK_LGM_CGU is not set
# CONFIG_XILINX_VCU is not set
CONFIG_COMMON_CLK_XLNX_CLKWZRD=y
# CONFIG_COMMON_CLK_ZYNQMP is not set
CONFIG_HWSPINLOCK=y
# CONFIG_HWSPINLOCK_OMAP is not set
# CONFIG_HWSPINLOCK_QCOM is not set
# CONFIG_HWSPINLOCK_SPRD is not set
# CONFIG_HWSPINLOCK_STM32 is not set
# CONFIG_HWSPINLOCK_SUN6I is not set
# CONFIG_HSEM_U8500 is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
CONFIG_BCM2835_TIMER=y
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DAVINCI_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_OMAP_DM_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_IXP4XX_TIMER is not set
# CONFIG_ROCKCHIP_TIMER is not set
# CONFIG_ARMADA_370_XP_TIMER is not set
# CONFIG_MESON6_TIMER is not set
# CONFIG_ORION_TIMER is not set
# CONFIG_OWL_TIMER is not set
# CONFIG_RDA_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_TEGRA_TIMER is not set
# CONFIG_TEGRA186_TIMER is not set
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_CADENCE_TTC_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_NOMADIK_MTU is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_KEYSTONE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_LPC32XX is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_TI_32K is not set
# CONFIG_CLKSRC_STM32 is not set
# CONFIG_CLKSRC_STM32_LP is not set
# CONFIG_CLKSRC_MPS2 is not set
# CONFIG_ARC_TIMERS is not set
# CONFIG_ARM_GLOBAL_TIMER is not set
CONFIG_ARM_TIMER_SP804=y
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_PIT is not set
# CONFIG_ATMEL_ST is not set
# CONFIG_ATMEL_TCB_CLKSRC is not set
# CONFIG_CLKSRC_EXYNOS_MCT is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
# CONFIG_OXNAS_RPS_TIMER is not set
# CONFIG_MTK_TIMER is not set
# CONFIG_SPRD_TIMER is not set
# CONFIG_CLKSRC_JCORE_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_QCOM is not set
# CONFIG_CLKSRC_VERSATILE is not set
# CONFIG_CLKSRC_PXA is not set
CONFIG_CLKSRC_IMX_GPT=y
# CONFIG_CLKSRC_IMX_TPM is not set
# CONFIG_TIMER_IMX_SYS_CTR is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_GXP_TIMER is not set
# CONFIG_MILBEAUT_TIMER is not set
# CONFIG_MSC313E_TIMER is not set
# CONFIG_INGENIC_TIMER is not set
# CONFIG_INGENIC_SYSOST is not set
# CONFIG_INGENIC_OST is not set
CONFIG_MICROCHIP_PIT64B=y
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
CONFIG_IOMMU_IO_PGTABLE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST=y
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_OF_IOMMU=y
# CONFIG_MSM_IOMMU is not set
# CONFIG_OMAP_IOMMU is not set
# CONFIG_ROCKCHIP_IOMMU is not set
# CONFIG_SUN50I_IOMMU is not set
# CONFIG_EXYNOS_IOMMU is not set
CONFIG_ARM_SMMU=y
# CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS is not set
CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y
# CONFIG_S390_CCW_IOMMU is not set
# CONFIG_S390_AP_IOMMU is not set
# CONFIG_MTK_IOMMU is not set
# CONFIG_MTK_IOMMU_V1 is not set
# CONFIG_SPRD_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CHAR=y
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_GX_PM_DOMAINS is not set
# CONFIG_MESON_EE_PM_DOMAINS is not set
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_PMGR_PWRSTATE is not set
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
# CONFIG_ASPEED_LPC_SNOOP is not set
# CONFIG_ASPEED_UART_ROUTING is not set
# CONFIG_ASPEED_P2A_CTRL is not set
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
CONFIG_BCM2835_POWER=y
# CONFIG_SOC_BCM63XX is not set
# CONFIG_SOC_BRCMSTB is not set
# CONFIG_BCM_PMB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_QUICC_ENGINE=y
CONFIG_DPAA2_CONSOLE=y
# CONFIG_FSL_RCPM is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
CONFIG_IMX_GPCV2_PM_DOMAINS=y
# CONFIG_SOC_IMX8M is not set
CONFIG_SOC_IMX9=y
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
# CONFIG_MTK_DEVAPC is not set
# CONFIG_MTK_INFRACFG is not set
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set
# CONFIG_MTK_SCPSYS_PM_DOMAINS is not set
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_COMMAND_DB is not set
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_GSBI is not set
# CONFIG_QCOM_LLCC is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SMEM is not set
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
# CONFIG_QCOM_APR is not set
# CONFIG_QCOM_ICC_BWMON is not set
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
# CONFIG_ROCKCHIP_IODOMAIN is not set
# CONFIG_ROCKCHIP_PM_DOMAINS is not set
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
CONFIG_ARM_IMX_BUS_DEVFREQ=y
# CONFIG_ARM_TEGRA_DEVFREQ is not set
# CONFIG_ARM_MEDIATEK_CCI_DEVFREQ is not set
# CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ is not set
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
# CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU is not set
# CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77693=y
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_PTN5150=y
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_EXTCON_USBC_TUSB320 is not set
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
# CONFIG_ADXL345_I2C is not set
# CONFIG_ADXL355_I2C is not set
CONFIG_ADXL367=y
CONFIG_ADXL367_I2C=y
CONFIG_ADXL372=y
CONFIG_ADXL372_I2C=y
# CONFIG_BMA180 is not set
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_DA280=y
CONFIG_DA311=y
# CONFIG_DMARD06 is not set
# CONFIG_DMARD09 is not set
CONFIG_DMARD10=y
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
CONFIG_HID_SENSOR_ACCEL_3D=y
CONFIG_KXSD9=y
# CONFIG_KXSD9_I2C is not set
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
CONFIG_MSA311=y
CONFIG_MXC4005=y
CONFIG_MXC6255=y
# CONFIG_STK8312 is not set
CONFIG_STK8BA50=y
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7091R5=y
CONFIG_AD7291=y
# CONFIG_AD7606_IFACE_PARALLEL is not set
# CONFIG_AD799X is not set
CONFIG_ADI_AXI_ADC=y
# CONFIG_ASPEED_ADC is not set
# CONFIG_AT91_ADC is not set
# CONFIG_AT91_SAMA5D2_ADC is not set
# CONFIG_BCM_IPROC_ADC is not set
# CONFIG_BERLIN2_ADC is not set
CONFIG_CC10001_ADC=y
CONFIG_DLN2_ADC=y
# CONFIG_ENVELOPE_DETECTOR is not set
# CONFIG_EXYNOS_ADC is not set
CONFIG_HX711=y
CONFIG_INA2XX_ADC=y
# CONFIG_INGENIC_ADC is not set
CONFIG_IMX7D_ADC=y
CONFIG_IMX8QXP_ADC=y
# CONFIG_LP8788_ADC is not set
# CONFIG_LPC18XX_ADC is not set
# CONFIG_LPC32XX_ADC is not set
# CONFIG_LTC2471 is not set
CONFIG_LTC2485=y
# CONFIG_LTC2497 is not set
CONFIG_MAX1363=y
CONFIG_MAX9611=y
CONFIG_MCP3422=y
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
# CONFIG_MESON_SARADC is not set
CONFIG_NAU7802=y
# CONFIG_NPCM_ADC is not set
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_PM8XXX_XOADC=y
# CONFIG_RCAR_GYRO_ADC is not set
# CONFIG_ROCKCHIP_SARADC is not set
CONFIG_RICHTEK_RTQ6056=y
# CONFIG_RZG2L_ADC is not set
# CONFIG_SC27XX_ADC is not set
# CONFIG_SPEAR_ADC is not set
CONFIG_SD_ADC_MODULATOR=y
# CONFIG_STM32_ADC_CORE is not set
# CONFIG_STM32_DFSDM_CORE is not set
# CONFIG_STM32_DFSDM_ADC is not set
CONFIG_TI_ADC081C=y
CONFIG_TI_ADS1015=y
# CONFIG_VF610_ADC is not set
CONFIG_VIPERBOARD_ADC=y
# CONFIG_XILINX_XADC is not set
# CONFIG_XILINX_AMS is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=y
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=y
CONFIG_BME680=y
CONFIG_BME680_I2C=y
CONFIG_CCS811=y
CONFIG_IAQCORE=y
CONFIG_PMS7003=y
CONFIG_SCD30_CORE=y
# CONFIG_SCD30_I2C is not set
CONFIG_SCD30_SERIAL=y
CONFIG_SCD4X=y
CONFIG_SENSIRION_SGP30=y
CONFIG_SENSIRION_SGP40=y
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
CONFIG_SPS30_SERIAL=y
CONFIG_SENSEAIR_SUNRISE_CO2=y
CONFIG_VZ89X=y
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=y
CONFIG_HID_SENSOR_IIO_TRIGGER=y
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD5064=y
CONFIG_AD5380=y
CONFIG_AD5446=y
# CONFIG_AD5593R is not set
# CONFIG_AD5696_I2C is not set
CONFIG_DPOT_DAC=y
# CONFIG_DS4424 is not set
# CONFIG_LPC18XX_DAC is not set
CONFIG_M62332=y
CONFIG_MAX517=y
CONFIG_MAX5821=y
CONFIG_MCP4725=y
# CONFIG_STM32_DAC is not set
# CONFIG_TI_DAC5571 is not set
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
# CONFIG_FXAS21002C is not set
# CONFIG_HID_SENSOR_GYRO_3D is not set
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
CONFIG_IIO_ST_GYRO_3AXIS=y
# CONFIG_IIO_ST_GYRO_I2C_3AXIS is not set
CONFIG_ITG3200=y
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=y
CONFIG_MAX30100=y
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=y
CONFIG_DHT11=y
CONFIG_HDC100X=y
# CONFIG_HDC2010 is not set
CONFIG_HID_SENSOR_HUMIDITY=y
CONFIG_HTS221=y
CONFIG_HTS221_I2C=y
CONFIG_HTU21=y
CONFIG_SI7005=y
# CONFIG_SI7020 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
CONFIG_BOSCH_BNO055=y
CONFIG_BOSCH_BNO055_SERIAL=y
CONFIG_BOSCH_BNO055_I2C=y
# CONFIG_FXOS8700_I2C is not set
# CONFIG_KMX61 is not set
# CONFIG_INV_ICM42600_I2C is not set
# CONFIG_INV_MPU6050_I2C is not set
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ADJD_S311=y
CONFIG_ADUX1020=y
# CONFIG_AL3010 is not set
CONFIG_AL3320A=y
CONFIG_APDS9300=y
CONFIG_APDS9960=y
CONFIG_AS73211=y
CONFIG_BH1750=y
CONFIG_BH1780=y
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
CONFIG_CM3323=y
# CONFIG_CM3605 is not set
# CONFIG_CM36651 is not set
CONFIG_GP2AP002=y
# CONFIG_GP2AP020A00F is not set
# CONFIG_IQS621_ALS is not set
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=y
CONFIG_ISL29125=y
CONFIG_HID_SENSOR_ALS=y
CONFIG_HID_SENSOR_PROX=y
CONFIG_JSA1212=y
CONFIG_RPR0521=y
# CONFIG_LTR501 is not set
# CONFIG_LTRF216A is not set
# CONFIG_LV0104CS is not set
# CONFIG_MAX44000 is not set
CONFIG_MAX44009=y
CONFIG_NOA1305=y
CONFIG_OPT3001=y
CONFIG_PA12203001=y
CONFIG_SI1133=y
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=y
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=y
CONFIG_TSL2591=y
CONFIG_TSL2772=y
CONFIG_TSL4531=y
CONFIG_US5182D=y
# CONFIG_VCNL4000 is not set
# CONFIG_VCNL4035 is not set
CONFIG_VEML6030=y
CONFIG_VEML6070=y
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=y
# CONFIG_AK8975 is not set
# CONFIG_AK09911 is not set
# CONFIG_BMC150_MAGN_I2C is not set
CONFIG_MAG3110=y
CONFIG_HID_SENSOR_MAGNETOMETER_3D=y
CONFIG_MMC35240=y
# CONFIG_IIO_ST_MAGN_3AXIS is not set
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_YAMAHA_YAS530 is not set
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=y
CONFIG_HID_SENSOR_DEVICE_ROTATION=y
# end of Inclinometer sensors

#
# Triggers - standalone
#
CONFIG_IIO_INTERRUPT_TRIGGER=y
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=y
# CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE is not set
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
CONFIG_AD5272=y
CONFIG_DS1803=y
# CONFIG_MAX5432 is not set
CONFIG_MCP4018=y
CONFIG_MCP4531=y
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=y
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
CONFIG_BMP280=y
CONFIG_BMP280_I2C=y
CONFIG_DLHL60D=y
CONFIG_DPS310=y
CONFIG_HID_SENSOR_PRESS=y
# CONFIG_HP03 is not set
CONFIG_ICP10100=y
# CONFIG_MPL115_I2C is not set
CONFIG_MPL3115=y
CONFIG_MS5611=y
# CONFIG_MS5611_I2C is not set
CONFIG_MS5637=y
CONFIG_IIO_ST_PRESS=y
# CONFIG_IIO_ST_PRESS_I2C is not set
CONFIG_T5403=y
# CONFIG_HP206C is not set
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=y
CONFIG_LIDAR_LITE_V2=y
# CONFIG_MB1232 is not set
# CONFIG_PING is not set
# CONFIG_RFD77402 is not set
CONFIG_SRF04=y
CONFIG_SX_COMMON=y
CONFIG_SX9310=y
CONFIG_SX9324=y
# CONFIG_SX9360 is not set
CONFIG_SX9500=y
CONFIG_SRF08=y
CONFIG_VCNL3020=y
CONFIG_VL53L0X_I2C=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=y
CONFIG_HID_SENSOR_TEMP=y
CONFIG_MLX90614=y
CONFIG_MLX90632=y
CONFIG_TMP006=y
# CONFIG_TMP007 is not set
CONFIG_TMP117=y
CONFIG_TSYS01=y
CONFIG_TSYS02D=y
# end of Temperature sensors

CONFIG_NTB=y
CONFIG_NTB_MSI=y
# CONFIG_NTB_IDT is not set
CONFIG_NTB_SWITCHTEC=y
# CONFIG_NTB_PINGPONG is not set
CONFIG_NTB_TOOL=y
CONFIG_NTB_PERF=y
# CONFIG_NTB_MSI_TEST is not set
CONFIG_NTB_TRANSPORT=y
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_ATMEL is not set
CONFIG_PWM_ATMEL_HLCDC_PWM=y
CONFIG_PWM_ATMEL_TCB=y
# CONFIG_PWM_BCM_IPROC is not set
# CONFIG_PWM_BCM_KONA is not set
CONFIG_PWM_BCM2835=y
# CONFIG_PWM_BERLIN is not set
# CONFIG_PWM_BRCMSTB is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_CLPS711X is not set
CONFIG_PWM_DWC=y
# CONFIG_PWM_EP93XX is not set
CONFIG_PWM_FSL_FTM=y
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_IMG is not set
CONFIG_PWM_IMX1=y
# CONFIG_PWM_IMX27 is not set
CONFIG_PWM_IMX_TPM=y
# CONFIG_PWM_INTEL_LGM is not set
CONFIG_PWM_IQS620A=y
# CONFIG_PWM_JZ4740 is not set
# CONFIG_PWM_KEEMBAY is not set
CONFIG_PWM_LP3943=y
# CONFIG_PWM_LPC18XX_SCT is not set
# CONFIG_PWM_LPC32XX is not set
# CONFIG_PWM_LPSS_PCI is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_MESON is not set
# CONFIG_PWM_MTK_DISP is not set
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_MXS is not set
CONFIG_PWM_NTXEC=y
# CONFIG_PWM_OMAP_DMTIMER is not set
CONFIG_PWM_PCA9685=y
# CONFIG_PWM_PXA is not set
# CONFIG_PWM_RASPBERRYPI_POE is not set
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
# CONFIG_PWM_ROCKCHIP is not set
# CONFIG_PWM_SAMSUNG is not set
# CONFIG_PWM_SIFIVE is not set
# CONFIG_PWM_SL28CPLD is not set
# CONFIG_PWM_SPEAR is not set
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STI is not set
# CONFIG_PWM_STM32 is not set
# CONFIG_PWM_STM32_LP is not set
# CONFIG_PWM_SUN4I is not set
# CONFIG_PWM_SUNPLUS is not set
# CONFIG_PWM_TEGRA is not set
# CONFIG_PWM_TIECAP is not set
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_VISCONTI is not set
# CONFIG_PWM_VT8500 is not set
CONFIG_PWM_XILINX=y

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
CONFIG_BRCMSTB_L2_IRQ=y
# CONFIG_JCORE_AIC is not set
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_SL28CPLD_INTC is not set
# CONFIG_TS4800_IRQ is not set
CONFIG_XILINX_INTC=y
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_MESON_IRQ_GPIO is not set
# CONFIG_IMX_IRQSTEER is not set
CONFIG_IMX_INTMUX=y
CONFIG_IMX_MU_MSI=y
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
# CONFIG_MCHP_EIC is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
CONFIG_BOARD_TPCI200=y
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_A10SR is not set
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_K210 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_QCOM_AOSS is not set
# CONFIG_RESET_QCOM_PDC is not set
# CONFIG_RESET_RASPBERRYPI is not set
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
# CONFIG_RESET_SCMI is not set
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_STARFIVE_JH7100 is not set
# CONFIG_RESET_SUNPLUS is not set
# CONFIG_RESET_SUNXI is not set
# CONFIG_RESET_TI_SCI is not set
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_TI_TPS380X=y
# CONFIG_RESET_TN48M_CPLD is not set
# CONFIG_RESET_UNIPHIER is not set
# CONFIG_RESET_UNIPHIER_GLUE is not set
# CONFIG_RESET_ZYNQ is not set
# CONFIG_COMMON_RESET_HI3660 is not set
# CONFIG_COMMON_RESET_HI6220 is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
# CONFIG_PHY_PISTACHIO_USB is not set
# CONFIG_PHY_XGENE is not set
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=y
# CONFIG_PHY_SUN4I_USB is not set
# CONFIG_PHY_SUN6I_MIPI_DPHY is not set
# CONFIG_PHY_SUN9I_USB is not set
# CONFIG_PHY_SUN50I_USB3 is not set
# CONFIG_PHY_MESON8_HDMI_TX is not set
# CONFIG_PHY_MESON8B_USB2 is not set
# CONFIG_PHY_MESON_GXL_USB2 is not set
# CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG is not set
# CONFIG_PHY_MESON_G12A_USB2 is not set
# CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
# CONFIG_PHY_MESON_AXG_PCIE is not set
# CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
# CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
# CONFIG_PHY_CYGNUS_PCIE is not set
# CONFIG_PHY_BCM_SR_USB is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_BCM_NS_USB2 is not set
# CONFIG_PHY_BCM_NS_USB3 is not set
# CONFIG_PHY_NS2_PCIE is not set
# CONFIG_PHY_NS2_USB_DRD is not set
# CONFIG_PHY_BRCM_SATA is not set
# CONFIG_PHY_BRCM_USB is not set
# CONFIG_PHY_BCM_SR_PCIE is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_CADENCE_TORRENT=y
CONFIG_PHY_CADENCE_DPHY=y
# CONFIG_PHY_CADENCE_DPHY_RX is not set
CONFIG_PHY_CADENCE_SIERRA=y
CONFIG_PHY_CADENCE_SALVO=y
# CONFIG_PHY_FSL_IMX8MQ_USB is not set
# CONFIG_PHY_MIXEL_LVDS_PHY is not set
# CONFIG_PHY_MIXEL_MIPI_DPHY is not set
# CONFIG_PHY_FSL_IMX8M_PCIE is not set
# CONFIG_PHY_FSL_LYNX_28G is not set
# CONFIG_PHY_HI6220_USB is not set
# CONFIG_PHY_HI3660_USB is not set
# CONFIG_PHY_HI3670_USB is not set
# CONFIG_PHY_HI3670_PCIE is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_INGENIC_USB is not set
# CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
# CONFIG_PHY_LANTIQ_RCU_USB2 is not set
# CONFIG_ARMADA375_USBCLUSTER_PHY is not set
# CONFIG_PHY_BERLIN_SATA is not set
# CONFIG_PHY_BERLIN_USB is not set
CONFIG_PHY_MVEBU_A3700_UTMI=y
# CONFIG_PHY_MVEBU_A38X_COMPHY is not set
# CONFIG_PHY_MVEBU_CP110_UTMI is not set
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_PXA_USB is not set
# CONFIG_PHY_MMP3_USB is not set
# CONFIG_PHY_MMP3_HSIC is not set
# CONFIG_PHY_MTK_PCIE is not set
# CONFIG_PHY_MTK_TPHY is not set
# CONFIG_PHY_MTK_UFS is not set
# CONFIG_PHY_MTK_XSPHY is not set
# CONFIG_PHY_MTK_HDMI is not set
# CONFIG_PHY_MTK_MIPI_DSI is not set
# CONFIG_PHY_MTK_DP is not set
# CONFIG_PHY_SPARX5_SERDES is not set
CONFIG_PHY_LAN966X_SERDES=y
CONFIG_PHY_CPCAP_USB=y
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
# CONFIG_PHY_OCELOT_SERDES is not set
CONFIG_PHY_ATH79_USB=y
# CONFIG_PHY_QCOM_EDP is not set
# CONFIG_PHY_QCOM_IPQ4019_USB is not set
# CONFIG_PHY_QCOM_PCIE2 is not set
# CONFIG_PHY_QCOM_QMP is not set
# CONFIG_PHY_QCOM_QUSB2 is not set
# CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
# CONFIG_PHY_QCOM_USB_HS_28NM is not set
# CONFIG_PHY_QCOM_USB_SS is not set
# CONFIG_PHY_QCOM_IPQ806X_USB is not set
# CONFIG_PHY_MT7621_PCI is not set
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
# CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
# CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
# CONFIG_PHY_ROCKCHIP_TYPEC is not set
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_EXYNOS_PCIE is not set
# CONFIG_PHY_SAMSUNG_UFS is not set
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_S5PV210_USB2 is not set
CONFIG_PHY_EXYNOS5_USBDRD=y
# CONFIG_PHY_UNIPHIER_USB2 is not set
# CONFIG_PHY_UNIPHIER_USB3 is not set
# CONFIG_PHY_UNIPHIER_PCIE is not set
# CONFIG_PHY_UNIPHIER_AHCI is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
# CONFIG_PHY_STM32_USBPHYC is not set
# CONFIG_PHY_SUNPLUS_USB is not set
# CONFIG_PHY_TEGRA194_P2U is not set
# CONFIG_PHY_DA8XX_USB is not set
# CONFIG_PHY_DM816X_USB is not set
# CONFIG_PHY_AM654_SERDES is not set
# CONFIG_PHY_J721E_WIZ is not set
# CONFIG_OMAP_CONTROL_PHY is not set
# CONFIG_TI_PIPE3 is not set
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_COMBO is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# CONFIG_PHY_INTEL_THUNDERBAY_EMMC is not set
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
CONFIG_ARM_CCN=y
# CONFIG_ARM_CMN is not set
# CONFIG_ARM_PMU is not set
CONFIG_FSL_IMX8_DDR_PMU=y
# CONFIG_ARM_DMC620_PMU is not set
# CONFIG_ALIBABA_UNCORE_DRW_PMU is not set
# CONFIG_HNS3_PMU is not set
# end of Performance monitor support

CONFIG_RAS=y
CONFIG_USB4=y
CONFIG_USB4_DEBUGFS_WRITE=y
# CONFIG_USB4_DEBUGFS_MARGINING is not set
# CONFIG_USB4_DMA_TEST is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
# CONFIG_ANDROID_BINDERFS is not set
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_APPLE_EFUSES is not set
# CONFIG_NVMEM_BCM_OCOTP is not set
# CONFIG_NVMEM_BRCM_NVRAM is not set
# CONFIG_NVMEM_IMX_IIM is not set
CONFIG_NVMEM_IMX_OCOTP=y
# CONFIG_NVMEM_JZ4780_EFUSE is not set
# CONFIG_NVMEM_LAN9662_OTPC is not set
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
# CONFIG_NVMEM_LPC18XX_OTP is not set
# CONFIG_NVMEM_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_MICROCHIP_OTPC is not set
# CONFIG_NVMEM_MTK_EFUSE is not set
# CONFIG_NVMEM_MXS_OCOTP is not set
# CONFIG_NVMEM_NINTENDO_OTP is not set
# CONFIG_NVMEM_QCOM_QFPROM is not set
CONFIG_NVMEM_RAVE_SP_EEPROM=y
# CONFIG_NVMEM_RMEM is not set
# CONFIG_NVMEM_ROCKCHIP_EFUSE is not set
# CONFIG_NVMEM_ROCKCHIP_OTP is not set
# CONFIG_NVMEM_SC27XX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_NVMEM_SPRD_EFUSE is not set
# CONFIG_NVMEM_STM32_ROMEM is not set
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
CONFIG_NVMEM_U_BOOT_ENV=y
# CONFIG_NVMEM_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=y
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=y
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=y
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_GTH is not set
# CONFIG_INTEL_TH_STH is not set
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=y
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_FSI is not set
# CONFIG_TEE is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
# CONFIG_104_QUAD_8 is not set
# CONFIG_INTERRUPT_CNT is not set
# CONFIG_STM32_TIMER_CNT is not set
# CONFIG_STM32_LPTIMER_CNT is not set
# CONFIG_TI_EQEP is not set
CONFIG_FTM_QUADDEC=y
CONFIG_MICROCHIP_TCB_CAPTURE=y
CONFIG_INTEL_QEP=y
# CONFIG_TI_ECAP_CAPTURE is not set
CONFIG_MOST=y
# CONFIG_MOST_USB_HDM is not set
CONFIG_MOST_CDEV=y
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
# CONFIG_EXT4_USE_FOR_EXT2 is not set
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
CONFIG_REISERFS_CHECK=y
# CONFIG_REISERFS_FS_XATTR is not set
CONFIG_JFS_FS=y
CONFIG_JFS_POSIX_ACL=y
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
CONFIG_OCFS2_FS=y
CONFIG_OCFS2_FS_O2CB=y
# CONFIG_OCFS2_FS_STATS is not set
# CONFIG_OCFS2_DEBUG_MASKLOG is not set
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=y
CONFIG_BTRFS_FS_POSIX_ACL=y
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
CONFIG_BTRFS_FS_RUN_SANITY_TESTS=y
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
# CONFIG_F2FS_STAT_FS is not set
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
# CONFIG_F2FS_IOSTAT is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
# CONFIG_FILE_LOCKING is not set
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_ENCRYPTION_INLINE_CRYPT is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=y
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
# CONFIG_TMPFS is not set
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=y
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
# CONFIG_CIFS_XATTR is not set
# CONFIG_CIFS_DEBUG is not set
CONFIG_CIFS_DFS_UPCALL=y
CONFIG_CIFS_SWN_UPCALL=y
# CONFIG_CIFS_FSCACHE is not set
CONFIG_SMBFS_COMMON=y
CONFIG_CODA_FS=y
# CONFIG_AFS_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
# CONFIG_NLS_CODEPAGE_855 is not set
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=y
# CONFIG_DLM is not set
CONFIG_UNICODE=y
CONFIG_UNICODE_NORMALIZATION_SELFTEST=y
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_TRUSTED_KEYS is not set
# CONFIG_ENCRYPTED_KEYS is not set
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_KEY_NOTIFICATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITYFS=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=y
CONFIG_ASYNC_MEMCPY=y
CONFIG_ASYNC_XOR=y
CONFIG_ASYNC_PQ=y
CONFIG_ASYNC_RAID6_RECOV=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
# CONFIG_CRYPTO_FIPS is not set
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ANUBIS=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_KHAZAD=y
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=y
# CONFIG_CRYPTO_XTS is not set
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
# CONFIG_CRYPTO_WP512 is not set
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
# CONFIG_CRYPTO_CRCT10DIF is not set
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
# CONFIG_CRYPTO_LZ4HC is not set
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
CONFIG_CRYPTO_USER_API_RNG_CAVP=y
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (arm)
#
CONFIG_CRYPTO_POLY1305_ARM=y
CONFIG_CRYPTO_BLAKE2S_ARM=y
CONFIG_CRYPTO_SHA1_ARM=y
# CONFIG_CRYPTO_SHA256_ARM is not set
CONFIG_CRYPTO_SHA512_ARM=y
CONFIG_CRYPTO_AES_ARM=y
CONFIG_CRYPTO_CHACHA20_NEON=y
# end of Accelerated Cryptographic Algorithms for CPU (arm)

CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_ALLWINNER is not set
# CONFIG_CRYPTO_DEV_SL3516 is not set
CONFIG_CRYPTO_DEV_HIFN_795X=y
# CONFIG_CRYPTO_DEV_HIFN_795X_RNG is not set
CONFIG_CRYPTO_DEV_FSL_CAAM_COMMON=y
CONFIG_CRYPTO_DEV_FSL_CAAM=y
CONFIG_CRYPTO_DEV_FSL_CAAM_DEBUG=y
# CONFIG_CRYPTO_DEV_FSL_CAAM_JR is not set
CONFIG_CRYPTO_DEV_SAHARA=y
# CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AES is not set
# CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA is not set
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
CONFIG_CRYPTO_DEV_MXS_DCP=y
CONFIG_CRYPTO_DEV_QAT=y
CONFIG_CRYPTO_DEV_QAT_DH895xCC=y
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
CONFIG_CRYPTO_DEV_QAT_C62X=y
CONFIG_CRYPTO_DEV_QAT_4XXX=y
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=y
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
# CONFIG_CRYPTO_DEV_QCE is not set
# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_AES is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_SHA3 is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
CONFIG_CRYPTO_DEV_SAFEXCEL=y
# CONFIG_CRYPTO_DEV_ARTPEC6 is not set
# CONFIG_CRYPTO_DEV_CCREE is not set
# CONFIG_CRYPTO_DEV_HISI_SEC is not set
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=y
# CONFIG_CRYPTO_DEV_SA2UL is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4 is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_ECC is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU is not set
# CONFIG_CRYPTO_DEV_ASPEED is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
# CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=9
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC64_ROCKSOFT is not set
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=y
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
CONFIG_XZ_DEC_POWERPC=y
# CONFIG_XZ_DEC_IA64 is not set
# CONFIG_XZ_DEC_ARM is not set
# CONFIG_XZ_DEC_ARMTHUMB is not set
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
CONFIG_ARCH_HAS_TEARDOWN_DMA_OPS=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_API_DEBUG_SG=y
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_POOL=y
CONFIG_MEMREGION=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_REF_TRACKER=y
CONFIG_SBITMAP=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# end of Library routines

CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED=y
CONFIG_PLDMFW=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
CONFIG_DEBUG_INFO_DWARF5=y
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
# CONFIG_DEBUG_INFO_BTF is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_KGDB=y
# CONFIG_KGDB_TESTS is not set
# CONFIG_KGDB_KDB is not set
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
# CONFIG_UBSAN_BOUNDS is not set
# CONFIG_UBSAN_SHIFT is not set
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_UNREACHABLE is not set
CONFIG_UBSAN_BOOL=y
# CONFIG_UBSAN_ENUM is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
CONFIG_NET_NS_REFCNT_TRACKER=y
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_DEBUG_SLAB is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_DEBUG_WX=y
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
CONFIG_DEBUG_OBJECTS_FREE=y
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
CONFIG_SHRINKER_DEBUG=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
# CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
CONFIG_DEBUG_VM_RB=y
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_DEBUG_KMAP_LOCAL=y
CONFIG_DEBUG_HIGHMEM=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
CONFIG_KASAN_OUTLINE=y
# CONFIG_KASAN_INLINE is not set
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_SCF_TORTURE_TEST=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# arm Debugging
#
CONFIG_ARM_PTDUMP_CORE=y
CONFIG_ARM_PTDUMP_DEBUGFS=y
CONFIG_UNWINDER_FRAME_POINTER=y
# CONFIG_UNWINDER_ARM is not set
CONFIG_BACKTRACE_VERBOSE=y
# CONFIG_DEBUG_USER is not set
# CONFIG_DEBUG_LL is not set
CONFIG_DEBUG_LL_INCLUDE="mach/debug-macro.S"
CONFIG_UNCOMPRESS_INCLUDE="debug/uncompress.h"
CONFIG_PID_IN_CONTEXTIDR=y
CONFIG_CORESIGHT=y
CONFIG_CORESIGHT_LINKS_AND_SINKS=y
# CONFIG_CORESIGHT_LINK_AND_SINK_TMC is not set
# CONFIG_CORESIGHT_SINK_TPIU is not set
CONFIG_CORESIGHT_SINK_ETBV10=y
CONFIG_CORESIGHT_SOURCE_ETM3X=y
CONFIG_CORESIGHT_STM=y
CONFIG_CORESIGHT_CPU_DEBUG=y
# CONFIG_CORESIGHT_CPU_DEBUG_DEFAULT_ON is not set
CONFIG_CORESIGHT_CTI=y
CONFIG_CORESIGHT_CTI_INTEGRATION_REGS=y
# end of arm Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=y
# CONFIG_TEST_MIN_HEAP is not set
CONFIG_TEST_DIV64=y
CONFIG_BACKTRACE_SELF_TEST=y
CONFIG_TEST_REF_TRACKER=y
# CONFIG_RBTREE_TEST is not set
CONFIG_REED_SOLOMON_TEST=y
CONFIG_INTERVAL_TREE_TEST=y
CONFIG_ATOMIC64_SELFTEST=y
CONFIG_ASYNC_RAID6_TEST=y
CONFIG_TEST_HEXDUMP=y
CONFIG_STRING_SELFTEST=y
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
CONFIG_TEST_SCANF=y
CONFIG_TEST_BITMAP=y
CONFIG_TEST_UUID=y
CONFIG_TEST_XARRAY=y
CONFIG_TEST_RHASHTABLE=y
# CONFIG_TEST_SIPHASH is not set
CONFIG_TEST_IDA=y
CONFIG_FIND_BIT_BENCHMARK=y
CONFIG_TEST_FIRMWARE=y
CONFIG_TEST_UDELAY=y
CONFIG_TEST_DYNAMIC_DEBUG=y
CONFIG_TEST_MEMCAT_P=y
CONFIG_TEST_MEMINIT=y
CONFIG_TEST_FREE_PAGES=y
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Kernel hacking

--iK/Pn5QB/kgGJ9wH--
