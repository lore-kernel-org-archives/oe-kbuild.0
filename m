Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C78635292
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EX/71OOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701951759; x=1733487759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKCcAYEHm94uqfEqfZQQmyxvEXrk7IjLOL4eomN3tlw=;
  b=EX/71OOSRJl2UTh7/vQ8DxgyiTMwY76QbgAL3REpyJakRJ+cF7hKZN6C
   en0FaibmraLR3Gtpk8wkpl/ij2lQDFFDmT8mh9v3DMAF7q3T8X0rizyqQ
   KIqdBpNVUoi1MX5tAUmLFtuqsBoKII+lTMphfMuEBWYOvSWQMfFys4wrj
   y5m1y2q5VrNXcceopdtsy6nd33kcTAZm/HYyku/0qQn9Cr8wfrsID8lMd
   AIwO8ujXPHLNFaGl+wH2X+wXrVHrep2z8uEHat65FTfkIYPnZz95VqH+r
   UNqSHrzyF+GKgrv1BiQiy0zpoZ0JBc4xnmfiaDnxapsUq/a0QKY4L1KyV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7530795"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7530795"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:22:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="945013872"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="945013872"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Dec 2023 04:22:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBDOk-000CDc-2P;
	Thu, 07 Dec 2023 12:22:34 +0000
Date: Thu, 7 Dec 2023 20:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/ice/ice_devlink.c:447:8-49: WARNING avoid
 newline at end of message in NL_SET_ERR_MSG_MOD
Message-ID: <202312072049.R5nMAfYw-lkp@intel.com>
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
TO: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 31c8db2c4fa799f5981451a6ce2b38320069d8ef ice: implement devlink reinit action
date:   10 months ago
:::::: branch date: 3 days ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-102-20231207 (https://download.01.org/0day-ci/archive/20231207/202312072049.R5nMAfYw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312072049.R5nMAfYw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312072049.R5nMAfYw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_devlink.c:447:8-49: WARNING avoid newline at end of message in NL_SET_ERR_MSG_MOD
   drivers/net/ethernet/intel/ice/ice_devlink.c:457:8-46: WARNING avoid newline at end of message in NL_SET_ERR_MSG_MOD
   drivers/net/ethernet/intel/ice/ice_devlink.c:452:8-44: WARNING avoid newline at end of message in NL_SET_ERR_MSG_MOD

vim +447 drivers/net/ethernet/intel/ice/ice_devlink.c

399e27dbbd9e94 Jacob Keller       2021-10-27  426  
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  427  /**
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  428   * ice_devlink_reload_down - prepare for reload
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  429   * @devlink: pointer to the devlink instance to reload
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  430   * @netns_change: if true, the network namespace is changing
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  431   * @action: the action to perform
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  432   * @limit: limits on what reload should do, such as not resetting
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  433   * @extack: netlink extended ACK structure
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  434   */
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  435  static int
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  436  ice_devlink_reload_down(struct devlink *devlink, bool netns_change,
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  437  			enum devlink_reload_action action,
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  438  			enum devlink_reload_limit limit,
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  439  			struct netlink_ext_ack *extack)
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  440  {
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  441  	struct ice_pf *pf = devlink_priv(devlink);
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  442  
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  443  	switch (action) {
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  444  	case DEVLINK_RELOAD_ACTION_DRIVER_REINIT:
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  445  		if (ice_is_eswitch_mode_switchdev(pf)) {
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  446  			NL_SET_ERR_MSG_MOD(extack,
31c8db2c4fa799 Michal Swiatkowski 2022-12-21 @447  					   "Go to legacy mode before doing reinit\n");
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  448  			return -EOPNOTSUPP;
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  449  		}
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  450  		if (ice_is_adq_active(pf)) {
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  451  			NL_SET_ERR_MSG_MOD(extack,
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  452  					   "Turn off ADQ before doing reinit\n");
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  453  			return -EOPNOTSUPP;
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  454  		}
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  455  		if (ice_has_vfs(pf)) {
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  456  			NL_SET_ERR_MSG_MOD(extack,
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  457  					   "Remove all VFs before doing reinit\n");
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  458  			return -EOPNOTSUPP;
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  459  		}
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  460  		ice_unload(pf);
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  461  		return 0;
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  462  	case DEVLINK_RELOAD_ACTION_FW_ACTIVATE:
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  463  		return ice_devlink_reload_empr_start(pf, extack);
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  464  	default:
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  465  		WARN_ON(1);
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  466  		return -EOPNOTSUPP;
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  467  	}
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  468  }
31c8db2c4fa799 Michal Swiatkowski 2022-12-21  469  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
