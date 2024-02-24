Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AB6749A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Feb 2024 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708759405; cv=none; b=Tf3mer+oXuX0VP0u3ny8MC8NNtQFUYNGEt890VUpt3aoelXW8ZfOkKIclc4mDUqYV2LNPMaZScliKdIUriOMNfddCDcaBjjA+EnLMekhLJC/XwijOEwdey93GEYNs+rnS9d2YkCPf4nf9PhJfxeU6iFjtd3t+h6Xdv+f5ejCbEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708759405; c=relaxed/simple;
	bh=qmIdeKmYsa5JcrdxqjHhLh87sMoRCEIeYvLPv5ruqS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TqwDV/tqLM5POeMJpkjcHGdCotprnSjtePeWkRexL4X5iXfXfI0WNBcb5X/uwVNM3jisoQS2r5ppdpGFboqNnptoxOx2PsdKLlAxSh4YgISs2SaC4RKWf+jWeQGGgBbhcVrI3sUS0FHMckle272ri16cU0tpOLx6eoAbmOwMxVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JndDhmnC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JndDhmnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708759403; x=1740295403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qmIdeKmYsa5JcrdxqjHhLh87sMoRCEIeYvLPv5ruqS8=;
  b=JndDhmnCwpzbheihK/MGgOf463yssqUh1t28RVVig8pmyBunGVJAQdzo
   xxJ0ew8ef2B4aFb4+3HyDIU9mRCoJ/fvjmhfOk63sSPAazb89G16bvjnH
   tmZbHPsVeDH3+blTVaUCnZdjhNErUlHkJCDSX+ABG4OjWBet0jTn6hvhn
   5LeHrWnYqVOp3WwqZG0I5cOZO/LuwLfYs9ovyC5jonYidiOs7o0OPKFOL
   BSzSfbMv4bHwNtSjGMfRJD3Q6cnkOVwdtNCpdvgjvpwCiJ9VHHQD2rbUq
   4hEXTwJgb7jUI83uJteiZLIsLjrH8/dyD1c2/bNPYdyyIJjvKr6oaXa5i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2978367"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="2978367"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 23:23:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="29324519"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2024 23:23:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdmNS-0008Ka-1c;
	Sat, 24 Feb 2024 07:23:18 +0000
Date: Sat, 24 Feb 2024 15:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6594/9575]
 drivers/net/ethernet/intel/i40e/i40e_main.c:14729 i40e_veb_release() error:
 uninitialized symbol 'vsi'.
Message-ID: <202402241530.mM9AG4Pq-lkp@intel.com>
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
TO: Ivan Vecera <ivecera@redhat.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Wojciech Drewek <wojciech.drewek@intel.com>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33e1d31873f87d119e5120b88cd350efa68ef276
commit: 08cdde310e2252ea9381a37c3faa2125a5a663a3 [6594/9575] i40e: Fix broken support for floating VEBs
:::::: branch date: 27 hours ago
:::::: commit date: 8 days ago
config: arm-randconfig-r081-20240223 (https://download.01.org/0day-ci/archive/20240224/202402241530.mM9AG4Pq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402241530.mM9AG4Pq-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_main.c:14729 i40e_veb_release() error: uninitialized symbol 'vsi'.

Old smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_main.c:5970 i40e_set_bw_limit() warn: error code type promoted to positive: 'speed'
drivers/net/ethernet/intel/i40e/i40e_main.c:13462 i40e_queue_pair_toggle_rings() warn: missing error code? 'ret'
drivers/net/ethernet/intel/i40e/i40e_main.c:14258 i40e_vsi_setup_vectors() warn: missing error code? 'ret'
drivers/net/ethernet/intel/i40e/i40e_main.c:15551 i40e_init_recovery_mode() warn: 'vsi->netdev' from register_netdev() not released on lines: 15551.

vim +/vsi +14729 drivers/net/ethernet/intel/i40e/i40e_main.c

41c445ff0f482b Jesse Brandeburg 2013-09-11  14696  
41c445ff0f482b Jesse Brandeburg 2013-09-11  14697  /**
41c445ff0f482b Jesse Brandeburg 2013-09-11  14698   * i40e_veb_release - Delete a VEB and free its resources
41c445ff0f482b Jesse Brandeburg 2013-09-11  14699   * @veb: the VEB being removed
41c445ff0f482b Jesse Brandeburg 2013-09-11  14700   **/
41c445ff0f482b Jesse Brandeburg 2013-09-11  14701  void i40e_veb_release(struct i40e_veb *veb)
41c445ff0f482b Jesse Brandeburg 2013-09-11  14702  {
b1f1b46f466a08 Ivan Vecera      2023-11-24  14703  	struct i40e_vsi *vsi, *vsi_it;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14704  	struct i40e_pf *pf;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14705  	int i, n = 0;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14706  
41c445ff0f482b Jesse Brandeburg 2013-09-11  14707  	pf = veb->pf;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14708  
41c445ff0f482b Jesse Brandeburg 2013-09-11  14709  	/* find the remaining VSI and check for extras */
b1f1b46f466a08 Ivan Vecera      2023-11-24  14710  	i40e_pf_for_each_vsi(pf, i, vsi_it)
b1f1b46f466a08 Ivan Vecera      2023-11-24  14711  		if (vsi_it->uplink_seid == veb->seid) {
08cdde310e2252 Ivan Vecera      2023-11-24  14712  			if (vsi_it->flags & I40E_VSI_FLAG_VEB_OWNER)
b1f1b46f466a08 Ivan Vecera      2023-11-24  14713  				vsi = vsi_it;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14714  			n++;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14715  		}
b1f1b46f466a08 Ivan Vecera      2023-11-24  14716  
08cdde310e2252 Ivan Vecera      2023-11-24  14717  	/* Floating VEB has to be empty and regular one must have
08cdde310e2252 Ivan Vecera      2023-11-24  14718  	 * single owner VSI.
08cdde310e2252 Ivan Vecera      2023-11-24  14719  	 */
08cdde310e2252 Ivan Vecera      2023-11-24  14720  	if ((veb->uplink_seid && n != 1) || (!veb->uplink_seid && n != 0)) {
41c445ff0f482b Jesse Brandeburg 2013-09-11  14721  		dev_info(&pf->pdev->dev,
41c445ff0f482b Jesse Brandeburg 2013-09-11  14722  			 "can't remove VEB %d with %d VSIs left\n",
41c445ff0f482b Jesse Brandeburg 2013-09-11  14723  			 veb->seid, n);
41c445ff0f482b Jesse Brandeburg 2013-09-11  14724  		return;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14725  	}
41c445ff0f482b Jesse Brandeburg 2013-09-11  14726  
08cdde310e2252 Ivan Vecera      2023-11-24  14727  	/* For regular VEB move the owner VSI to uplink VEB */
41c445ff0f482b Jesse Brandeburg 2013-09-11  14728  	if (veb->uplink_seid) {
08cdde310e2252 Ivan Vecera      2023-11-24 @14729  		vsi->flags &= ~I40E_VSI_FLAG_VEB_OWNER;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14730  		vsi->uplink_seid = veb->uplink_seid;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14731  		if (veb->uplink_seid == pf->mac_seid)
41c445ff0f482b Jesse Brandeburg 2013-09-11  14732  			vsi->veb_idx = I40E_NO_VEB;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14733  		else
41c445ff0f482b Jesse Brandeburg 2013-09-11  14734  			vsi->veb_idx = veb->veb_idx;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14735  	}
41c445ff0f482b Jesse Brandeburg 2013-09-11  14736  
41c445ff0f482b Jesse Brandeburg 2013-09-11  14737  	i40e_aq_delete_element(&pf->hw, veb->seid, NULL);
41c445ff0f482b Jesse Brandeburg 2013-09-11  14738  	i40e_veb_clear(veb);
41c445ff0f482b Jesse Brandeburg 2013-09-11  14739  }
41c445ff0f482b Jesse Brandeburg 2013-09-11  14740  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
