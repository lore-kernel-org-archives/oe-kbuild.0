Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD28E20E3
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Oct 2023 06:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9MzgKvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697350964; x=1728886964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YhW5VYjqotpPJ7yTsJVV+GMyIzPH6yaLfvRAlsmJ/gs=;
  b=I9MzgKvIddpebs3fd14Zpiqtm9JIkEMlCX4dJvANYjWyElBqK0iEv0hl
   pfkc71qPOQO3nOYw8kSFF7ClbjqKCfbLqFp3tiecHjWXGoIcTOZJBUtuR
   wsaSHQcVYlnLvbUsnzWYlaiqTEdGVmePTFZ88ZUOsk1aAzzG0i5RTbvOS
   18G74jRHiwFxA78mLNDNxjDBMgKB5QQf33vY3Jz6NItylYp6wK12kHW1j
   wgvhqwT12AIsG/LOIGLgpoIz6gCsXJg/bvDSprWliJpW8WqeX9rji4L73
   GiQP6Xi3P/GaYSFamF/DujNOlJpMzYT/fv2awtlH9RHAdFraqV9cbcMf+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389229054"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389229054"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 23:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899077404"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="899077404"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2023 23:20:43 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qruWK-00077Z-1X;
	Sun, 15 Oct 2023 06:22:36 +0000
Date: Sun, 15 Oct 2023 14:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4288/12130]
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:3757:1-7: preceding lock on
 line 3705
Message-ID: <202310151435.UqSjMUJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Joshua Hay <joshua.a.hay@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Alan Brady <alan.brady@intel.com>
CC: Madhu Chittim <madhu.chittim@intel.com>
CC: Phani Burra <phani.r.burra@intel.com>
CC: Sridhar Samudrala <sridhar.samudrala@intel.com>
CC: Willem de Bruijn <willemb@google.com>
CC: Pavan Kumar Linga <pavan.kumar.linga@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3b18f7200f45d66f7141136c25554ac1e82009b
commit: a251eee62133774cf35ff829041377e721ef9c8c [4288/12130] idpf: add SRIOV support and other ndo_ops
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-103-20231015 (https://download.01.org/0day-ci/archive/20231015/202310151435.UqSjMUJ9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151435.UqSjMUJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310151435.UqSjMUJ9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:3757:1-7: preceding lock on line 3705

vim +3757 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3614  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3615  /**
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3616   * idpf_add_del_mac_filters - Add/del mac filters
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3617   * @vport: Virtual port data structure
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3618   * @np: Netdev private structure
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3619   * @add: Add or delete flag
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3620   * @async: Don't wait for return message
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3621   *
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3622   * Returns 0 on success, error on failure.
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3623   **/
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3624  int idpf_add_del_mac_filters(struct idpf_vport *vport,
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3625  			     struct idpf_netdev_priv *np,
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3626  			     bool add, bool async)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3627  {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3628  	struct virtchnl2_mac_addr_list *ma_list = NULL;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3629  	struct idpf_adapter *adapter = np->adapter;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3630  	struct idpf_vport_config *vport_config;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3631  	enum idpf_vport_config_flags mac_flag;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3632  	struct pci_dev *pdev = adapter->pdev;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3633  	enum idpf_vport_vc_state vc, vc_err;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3634  	struct virtchnl2_mac_addr *mac_addr;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3635  	struct idpf_mac_filter *f, *tmp;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3636  	u32 num_msgs, total_filters = 0;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3637  	int i = 0, k, err = 0;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3638  	u32 vop;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3639  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3640  	vport_config = adapter->vport_config[np->vport_idx];
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3641  	spin_lock_bh(&vport_config->mac_filter_list_lock);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3642  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3643  	/* Find the number of newly added filters */
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3644  	list_for_each_entry(f, &vport_config->user_config.mac_filter_list,
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3645  			    list) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3646  		if (add && f->add)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3647  			total_filters++;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3648  		else if (!add && f->remove)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3649  			total_filters++;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3650  	}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3651  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3652  	if (!total_filters) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3653  		spin_unlock_bh(&vport_config->mac_filter_list_lock);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3654  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3655  		return 0;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3656  	}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3657  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3658  	/* Fill all the new filters into virtchannel message */
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3659  	mac_addr = kcalloc(total_filters, sizeof(struct virtchnl2_mac_addr),
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3660  			   GFP_ATOMIC);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3661  	if (!mac_addr) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3662  		err = -ENOMEM;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3663  		spin_unlock_bh(&vport_config->mac_filter_list_lock);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3664  		goto error;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3665  	}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3666  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3667  	list_for_each_entry_safe(f, tmp, &vport_config->user_config.mac_filter_list,
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3668  				 list) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3669  		if (add && f->add) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3670  			ether_addr_copy(mac_addr[i].addr, f->macaddr);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3671  			i++;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3672  			f->add = false;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3673  			if (i == total_filters)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3674  				break;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3675  		}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3676  		if (!add && f->remove) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3677  			ether_addr_copy(mac_addr[i].addr, f->macaddr);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3678  			i++;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3679  			f->remove = false;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3680  			if (i == total_filters)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3681  				break;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3682  		}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3683  	}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3684  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3685  	spin_unlock_bh(&vport_config->mac_filter_list_lock);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3686  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3687  	if (add) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3688  		vop = VIRTCHNL2_OP_ADD_MAC_ADDR;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3689  		vc = IDPF_VC_ADD_MAC_ADDR;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3690  		vc_err = IDPF_VC_ADD_MAC_ADDR_ERR;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3691  		mac_flag = IDPF_VPORT_ADD_MAC_REQ;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3692  	} else {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3693  		vop = VIRTCHNL2_OP_DEL_MAC_ADDR;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3694  		vc = IDPF_VC_DEL_MAC_ADDR;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3695  		vc_err = IDPF_VC_DEL_MAC_ADDR_ERR;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3696  		mac_flag = IDPF_VPORT_DEL_MAC_REQ;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3697  	}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3698  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3699  	/* Chunk up the filters into multiple messages to avoid
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3700  	 * sending a control queue message buffer that is too large
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3701  	 */
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3702  	num_msgs = DIV_ROUND_UP(total_filters, IDPF_NUM_FILTERS_PER_MSG);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3703  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3704  	if (!async)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07 @3705  		mutex_lock(&vport->vc_buf_lock);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3706  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3707  	for (i = 0, k = 0; i < num_msgs; i++) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3708  		u32 entries_size, buf_size, num_entries;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3709  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3710  		num_entries = min_t(u32, total_filters,
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3711  				    IDPF_NUM_FILTERS_PER_MSG);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3712  		entries_size = sizeof(struct virtchnl2_mac_addr) * num_entries;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3713  		buf_size = struct_size(ma_list, mac_addr_list, num_entries);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3714  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3715  		if (!ma_list || num_entries != IDPF_NUM_FILTERS_PER_MSG) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3716  			kfree(ma_list);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3717  			ma_list = kzalloc(buf_size, GFP_ATOMIC);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3718  			if (!ma_list) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3719  				err = -ENOMEM;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3720  				goto list_prep_error;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3721  			}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3722  		} else {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3723  			memset(ma_list, 0, buf_size);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3724  		}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3725  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3726  		ma_list->vport_id = cpu_to_le32(np->vport_id);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3727  		ma_list->num_mac_addr = cpu_to_le16(num_entries);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3728  		memcpy(ma_list->mac_addr_list, &mac_addr[k], entries_size);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3729  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3730  		if (async)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3731  			set_bit(mac_flag, vport_config->flags);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3732  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3733  		err = idpf_send_mb_msg(adapter, vop, buf_size, (u8 *)ma_list);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3734  		if (err)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3735  			goto mbx_error;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3736  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3737  		if (!async) {
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3738  			err = idpf_wait_for_event(adapter, vport, vc, vc_err);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3739  			if (err)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3740  				goto mbx_error;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3741  		}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3742  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3743  		k += num_entries;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3744  		total_filters -= num_entries;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3745  	}
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3746  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3747  mbx_error:
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3748  	if (!async)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3749  		mutex_unlock(&vport->vc_buf_lock);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3750  	kfree(ma_list);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3751  list_prep_error:
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3752  	kfree(mac_addr);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3753  error:
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3754  	if (err)
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3755  		dev_err(&pdev->dev, "Failed to add or del mac filters %d", err);
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3756  
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07 @3757  	return err;
ce1b75d0635ce6 Pavan Kumar Linga 2023-08-07  3758  }
a251eee6213377 Joshua Hay        2023-08-07  3759  

:::::: The code at line 3757 was first introduced by commit
:::::: ce1b75d0635ce6daf7c1c3c75ea2f0da61e065b0 idpf: add ptypes and MAC filter support

:::::: TO: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
