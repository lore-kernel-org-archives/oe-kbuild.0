Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F420FA
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 03:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/wFGGr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701054746; x=1732590746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f2pMsPMFUwuQdlGzdg6eZd9g0/HNzTclDgJrPpFHyA4=;
  b=j/wFGGr+IkxA9+XsTqKIj+jlq/t0i2rDHaEk9em9Su3GwuI/BS8pUaA3
   8Pllym5QGYfRCasWVptPAoq0ndO42alP6eZMTo40Yv41TfmEDQE8G4lzq
   aUw0Q9wS+v0b18lKi1YCr8+toCFGjJpOmD0f57231KHKgys9mNc0EbU83
   eOpwqR52G9sNRmBKNDnugb5M3rZXpYdZFSDKEvqfG/03i3fsiobO9JMfX
   EGzhILdQS+igcE7hzqK59WQuzlftZeWA7s/p6QvJR0gApIyx4BoYvlVcp
   KXysvCgk/LW3n4FSM/oH/20XpyJwGBezUzQ4PoCRAl7dwZ8NV3yptm8XZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5875331"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="5875331"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 19:12:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="771788859"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="771788859"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Nov 2023 19:12:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7S2l-0005mQ-17;
	Mon, 27 Nov 2023 03:12:19 +0000
Date: Mon, 27 Nov 2023 11:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 4/5] i40e: Fix broken support for floating VEBs
Message-ID: <202311270851.Ie6aegcS-lkp@intel.com>
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
In-Reply-To: <20231124150343.81520-5-ivecera@redhat.com>
References: <20231124150343.81520-5-ivecera@redhat.com>
TO: Ivan Vecera <ivecera@redhat.com>
TO: intel-wired-lan@lists.osuosl.org
CC: Jesse Brandeburg <jesse.brandeburg@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: "David S . Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: Jacob Keller <jacob.e.keller@intel.com>
CC: Wojciech Drewek <wojciech.drewek@intel.com>
CC: Simon Horman <horms@kernel.org>
CC: mschmidt@redhat.com
CC: netdev@vger.kernel.org

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/i40e-Use-existing-helper-to-find-flow-director-VSI/20231124-230616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20231124150343.81520-5-ivecera%40redhat.com
patch subject: [PATCH v5 4/5] i40e: Fix broken support for floating VEBs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20231127 (https://download.01.org/0day-ci/archive/20231127/202311270851.Ie6aegcS-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270851.Ie6aegcS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311270851.Ie6aegcS-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_main.c:14743 i40e_veb_release() error: potentially dereferencing uninitialized 'vsi'.

Old smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_main.c:5966 i40e_set_bw_limit() warn: error code type promoted to positive: 'speed'
drivers/net/ethernet/intel/i40e/i40e_main.c:13476 i40e_queue_pair_toggle_rings() warn: missing error code? 'ret'
drivers/net/ethernet/intel/i40e/i40e_main.c:14272 i40e_vsi_setup_vectors() warn: missing error code? 'ret'
drivers/net/ethernet/intel/i40e/i40e_main.c:15566 i40e_init_recovery_mode() warn: 'vsi->netdev' from register_netdev() not released on lines: 15566.

vim +/vsi +14743 drivers/net/ethernet/intel/i40e/i40e_main.c

41c445ff0f482bb Jesse Brandeburg 2013-09-11  14710  
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14711  /**
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14712   * i40e_veb_release - Delete a VEB and free its resources
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14713   * @veb: the VEB being removed
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14714   **/
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14715  void i40e_veb_release(struct i40e_veb *veb)
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14716  {
0aab77d67d37d09 Ivan Vecera      2023-11-24  14717  	struct i40e_vsi *vsi, *vsi_it;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14718  	struct i40e_pf *pf;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14719  	int i, n = 0;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14720  
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14721  	pf = veb->pf;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14722  
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14723  	/* find the remaining VSI and check for extras */
0aab77d67d37d09 Ivan Vecera      2023-11-24  14724  	i40e_pf_for_each_vsi(pf, i, vsi_it)
0aab77d67d37d09 Ivan Vecera      2023-11-24  14725  		if (vsi_it->uplink_seid == veb->seid) {
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14726  			if (vsi_it->flags & I40E_VSI_FLAG_VEB_OWNER)
0aab77d67d37d09 Ivan Vecera      2023-11-24  14727  				vsi = vsi_it;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14728  			n++;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14729  		}
0aab77d67d37d09 Ivan Vecera      2023-11-24  14730  
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14731  	/* Floating VEB has to be empty and regular one must have
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14732  	 * single owner VSI.
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14733  	 */
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14734  	if ((veb->uplink_seid && n != 1) || (!veb->uplink_seid && n != 0)) {
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14735  		dev_info(&pf->pdev->dev,
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14736  			 "can't remove VEB %d with %d VSIs left\n",
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14737  			 veb->seid, n);
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14738  		return;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14739  	}
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14740  
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14741  	/* For regular VEB move the owner VSI to uplink VEB */
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14742  	if (veb->uplink_seid) {
93a1bc91a1ccc5a Ivan Vecera      2023-11-24 @14743  		vsi->flags &= ~I40E_VSI_FLAG_VEB_OWNER;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14744  		vsi->uplink_seid = veb->uplink_seid;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14745  		if (veb->uplink_seid == pf->mac_seid)
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14746  			vsi->veb_idx = I40E_NO_VEB;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14747  		else
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14748  			vsi->veb_idx = veb->veb_idx;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14749  	}
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14750  
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14751  	i40e_aq_delete_element(&pf->hw, veb->seid, NULL);
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14752  	i40e_veb_clear(veb);
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14753  }
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14754  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
