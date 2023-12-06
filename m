Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D330321
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 23:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkmjRKIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701906251; x=1733442251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IBdAeDAE0on1Fup/p5jnMekvjl5W8ESExPQ/+s+uRt4=;
  b=bkmjRKIeQ7U2UCLAz2R5mg7CY+nM/LMjcEaLZaoWJCBNca8ZNEemLl5W
   EnYhUJ2steU50+whR8wotdftM2Lgg9DNmVbJZRsGVW9natRHFsPjEsdG4
   8VWXDFi1g/DynfPjqHvptGcLhxQvTuQp3Ax96fPtte6MpPwKljoI1iMUP
   3mPXaMwQgS88VsM2P9E/uGeJBGUrUAt9LDcjKtN0FGuEgI5loSFUpTLdL
   1qh8TV8hyscI11bsS96GaeKoBKy7WX+yL/jwzj+OOMEBzXy/hFIrmLAd5
   u3fnLV/U6famdnyMsW661AK9etREBPF/nCLUCg2it5w7nKguHKh/Ow5TS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="374317699"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="374317699"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 15:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842017953"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="842017953"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 06 Dec 2023 15:44:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB1Yk-000Bb0-2p;
	Wed, 06 Dec 2023 23:44:06 +0000
Date: Thu, 7 Dec 2023 07:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/ice/ice_ethtool.c:3736:1-7: preceding
 lock on line 3711
Message-ID: <202312070747.mZm38AKG-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Dave Ertman <david.m.ertman@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: a6a0974aae4209d039ba81226ded5246eea14961 ice: Prevent set_channel from changing queues while RDMA active
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-102-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070747.mZm38AKG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070747.mZm38AKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312070747.mZm38AKG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_ethtool.c:3736:1-7: preceding lock on line 3711

vim +3736 drivers/net/ethernet/intel/ice/ice_ethtool.c

87324e747fde76 Henry Tieman         2019-11-08  3632  
87324e747fde76 Henry Tieman         2019-11-08  3633  /**
87324e747fde76 Henry Tieman         2019-11-08  3634   * ice_set_channels - set the number channels
87324e747fde76 Henry Tieman         2019-11-08  3635   * @dev: network interface device structure
87324e747fde76 Henry Tieman         2019-11-08  3636   * @ch: ethtool channel data structure
87324e747fde76 Henry Tieman         2019-11-08  3637   */
87324e747fde76 Henry Tieman         2019-11-08  3638  static int ice_set_channels(struct net_device *dev, struct ethtool_channels *ch)
87324e747fde76 Henry Tieman         2019-11-08  3639  {
87324e747fde76 Henry Tieman         2019-11-08  3640  	struct ice_netdev_priv *np = netdev_priv(dev);
87324e747fde76 Henry Tieman         2019-11-08  3641  	struct ice_vsi *vsi = np->vsi;
87324e747fde76 Henry Tieman         2019-11-08  3642  	struct ice_pf *pf = vsi->back;
87324e747fde76 Henry Tieman         2019-11-08  3643  	int new_rx = 0, new_tx = 0;
a6a0974aae4209 Dave Ertman          2023-01-24  3644  	bool locked = false;
87324e747fde76 Henry Tieman         2019-11-08  3645  	u32 curr_combined;
a6a0974aae4209 Dave Ertman          2023-01-24  3646  	int ret = 0;
87324e747fde76 Henry Tieman         2019-11-08  3647  
87324e747fde76 Henry Tieman         2019-11-08  3648  	/* do not support changing channels in Safe Mode */
87324e747fde76 Henry Tieman         2019-11-08  3649  	if (ice_is_safe_mode(pf)) {
87324e747fde76 Henry Tieman         2019-11-08  3650  		netdev_err(dev, "Changing channel in Safe Mode is not supported\n");
87324e747fde76 Henry Tieman         2019-11-08  3651  		return -EOPNOTSUPP;
87324e747fde76 Henry Tieman         2019-11-08  3652  	}
87324e747fde76 Henry Tieman         2019-11-08  3653  	/* do not support changing other_count */
148beb61203125 Henry Tieman         2020-05-11  3654  	if (ch->other_count != (test_bit(ICE_FLAG_FD_ENA, pf->flags) ? 1U : 0U))
87324e747fde76 Henry Tieman         2019-11-08  3655  		return -EINVAL;
87324e747fde76 Henry Tieman         2019-11-08  3656  
fbc7b27af0f9fb Kiran Patil          2021-10-15  3657  	if (ice_is_adq_active(pf)) {
fbc7b27af0f9fb Kiran Patil          2021-10-15  3658  		netdev_err(dev, "Cannot set channels with ADQ configured.\n");
fbc7b27af0f9fb Kiran Patil          2021-10-15  3659  		return -EOPNOTSUPP;
fbc7b27af0f9fb Kiran Patil          2021-10-15  3660  	}
fbc7b27af0f9fb Kiran Patil          2021-10-15  3661  
148beb61203125 Henry Tieman         2020-05-11  3662  	if (test_bit(ICE_FLAG_FD_ENA, pf->flags) && pf->hw.fdir_active_fltr) {
148beb61203125 Henry Tieman         2020-05-11  3663  		netdev_err(dev, "Cannot set channels when Flow Director filters are active\n");
148beb61203125 Henry Tieman         2020-05-11  3664  		return -EOPNOTSUPP;
148beb61203125 Henry Tieman         2020-05-11  3665  	}
148beb61203125 Henry Tieman         2020-05-11  3666  
87324e747fde76 Henry Tieman         2019-11-08  3667  	curr_combined = ice_get_combined_cnt(vsi);
87324e747fde76 Henry Tieman         2019-11-08  3668  
87324e747fde76 Henry Tieman         2019-11-08  3669  	/* these checks are for cases where user didn't specify a particular
87324e747fde76 Henry Tieman         2019-11-08  3670  	 * value on cmd line but we get non-zero value anyway via
87324e747fde76 Henry Tieman         2019-11-08  3671  	 * get_channels(); look at ethtool.c in ethtool repository (the user
87324e747fde76 Henry Tieman         2019-11-08  3672  	 * space part), particularly, do_schannels() routine
87324e747fde76 Henry Tieman         2019-11-08  3673  	 */
87324e747fde76 Henry Tieman         2019-11-08  3674  	if (ch->rx_count == vsi->num_rxq - curr_combined)
87324e747fde76 Henry Tieman         2019-11-08  3675  		ch->rx_count = 0;
87324e747fde76 Henry Tieman         2019-11-08  3676  	if (ch->tx_count == vsi->num_txq - curr_combined)
87324e747fde76 Henry Tieman         2019-11-08  3677  		ch->tx_count = 0;
87324e747fde76 Henry Tieman         2019-11-08  3678  	if (ch->combined_count == curr_combined)
87324e747fde76 Henry Tieman         2019-11-08  3679  		ch->combined_count = 0;
87324e747fde76 Henry Tieman         2019-11-08  3680  
87324e747fde76 Henry Tieman         2019-11-08  3681  	if (!(ch->combined_count || (ch->rx_count && ch->tx_count))) {
87324e747fde76 Henry Tieman         2019-11-08  3682  		netdev_err(dev, "Please specify at least 1 Rx and 1 Tx channel\n");
87324e747fde76 Henry Tieman         2019-11-08  3683  		return -EINVAL;
87324e747fde76 Henry Tieman         2019-11-08  3684  	}
87324e747fde76 Henry Tieman         2019-11-08  3685  
87324e747fde76 Henry Tieman         2019-11-08  3686  	new_rx = ch->combined_count + ch->rx_count;
87324e747fde76 Henry Tieman         2019-11-08  3687  	new_tx = ch->combined_count + ch->tx_count;
87324e747fde76 Henry Tieman         2019-11-08  3688  
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3689  	if (new_rx < vsi->tc_cfg.numtc) {
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3690  		netdev_err(dev, "Cannot set less Rx channels, than Traffic Classes you have (%u)\n",
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3691  			   vsi->tc_cfg.numtc);
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3692  		return -EINVAL;
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3693  	}
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3694  	if (new_tx < vsi->tc_cfg.numtc) {
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3695  		netdev_err(dev, "Cannot set less Tx channels, than Traffic Classes you have (%u)\n",
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3696  			   vsi->tc_cfg.numtc);
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3697  		return -EINVAL;
a632b2a4c920ce Anatolii Gerasymenko 2022-06-06  3698  	}
87324e747fde76 Henry Tieman         2019-11-08  3699  	if (new_rx > ice_get_max_rxq(pf)) {
87324e747fde76 Henry Tieman         2019-11-08  3700  		netdev_err(dev, "Maximum allowed Rx channels is %d\n",
87324e747fde76 Henry Tieman         2019-11-08  3701  			   ice_get_max_rxq(pf));
87324e747fde76 Henry Tieman         2019-11-08  3702  		return -EINVAL;
87324e747fde76 Henry Tieman         2019-11-08  3703  	}
87324e747fde76 Henry Tieman         2019-11-08  3704  	if (new_tx > ice_get_max_txq(pf)) {
87324e747fde76 Henry Tieman         2019-11-08  3705  		netdev_err(dev, "Maximum allowed Tx channels is %d\n",
87324e747fde76 Henry Tieman         2019-11-08  3706  			   ice_get_max_txq(pf));
87324e747fde76 Henry Tieman         2019-11-08  3707  		return -EINVAL;
87324e747fde76 Henry Tieman         2019-11-08  3708  	}
87324e747fde76 Henry Tieman         2019-11-08  3709  
a6a0974aae4209 Dave Ertman          2023-01-24  3710  	if (pf->adev) {
a6a0974aae4209 Dave Ertman          2023-01-24 @3711  		mutex_lock(&pf->adev_mutex);
a6a0974aae4209 Dave Ertman          2023-01-24  3712  		device_lock(&pf->adev->dev);
a6a0974aae4209 Dave Ertman          2023-01-24  3713  		locked = true;
a6a0974aae4209 Dave Ertman          2023-01-24  3714  		if (pf->adev->dev.driver) {
a6a0974aae4209 Dave Ertman          2023-01-24  3715  			netdev_err(dev, "Cannot change channels when RDMA is active\n");
a6a0974aae4209 Dave Ertman          2023-01-24  3716  			ret = -EBUSY;
a6a0974aae4209 Dave Ertman          2023-01-24  3717  			goto adev_unlock;
a6a0974aae4209 Dave Ertman          2023-01-24  3718  		}
a6a0974aae4209 Dave Ertman          2023-01-24  3719  	}
a6a0974aae4209 Dave Ertman          2023-01-24  3720  
a6a0974aae4209 Dave Ertman          2023-01-24  3721  	ice_vsi_recfg_qs(vsi, new_rx, new_tx, locked);
87324e747fde76 Henry Tieman         2019-11-08  3722  
a6a0974aae4209 Dave Ertman          2023-01-24  3723  	if (!netif_is_rxfh_configured(dev)) {
a6a0974aae4209 Dave Ertman          2023-01-24  3724  		ret = ice_vsi_set_dflt_rss_lut(vsi, new_rx);
a6a0974aae4209 Dave Ertman          2023-01-24  3725  		goto adev_unlock;
a6a0974aae4209 Dave Ertman          2023-01-24  3726  	}
87324e747fde76 Henry Tieman         2019-11-08  3727  
0393e46ac48a68 Henry Tieman         2020-12-03  3728  	/* Update rss_size due to change in Rx queues */
0393e46ac48a68 Henry Tieman         2020-12-03  3729  	vsi->rss_size = ice_get_valid_rss_size(&pf->hw, new_rx);
0393e46ac48a68 Henry Tieman         2020-12-03  3730  
a6a0974aae4209 Dave Ertman          2023-01-24  3731  adev_unlock:
a6a0974aae4209 Dave Ertman          2023-01-24  3732  	if (locked) {
a6a0974aae4209 Dave Ertman          2023-01-24  3733  		device_unlock(&pf->adev->dev);
a6a0974aae4209 Dave Ertman          2023-01-24  3734  		mutex_unlock(&pf->adev_mutex);
a6a0974aae4209 Dave Ertman          2023-01-24  3735  	}
a6a0974aae4209 Dave Ertman          2023-01-24 @3736  	return ret;
87324e747fde76 Henry Tieman         2019-11-08  3737  }
87324e747fde76 Henry Tieman         2019-11-08  3738  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
