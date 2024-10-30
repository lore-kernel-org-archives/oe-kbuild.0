Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EBE218317
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730308649; cv=none; b=P3ASYJS19HreMXpd+Zp2UBm2K1zmXCN9rUSQDu1IRmyiV86GDraHQie2EVdOFPRm321Z7W60UY3VlESNlVymygmukmSItbnchMEJNFGgtOR0Dby2NJ6axKftr2b6HdZ7gF7+PrgxS62Ze+6PAaZgvJTJANUXyO9YFq6nMoBDkAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730308649; c=relaxed/simple;
	bh=28w6doXzhJCTS30ooIOyz5J45KCQTf1vwqjQ9/oqcYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mlIEiXtumoUDHZWfNvftlT2pO1X8bF2LQurnNOPcHenzQ00Ng0iPHYKqKRMfIe1GJ4NP43ZhbpOH/e/XkhCi7yMiLYp5/G5F+rgeXPN4xE0Gkb0XfuT+qaNRe9WXqeYTS94F8S8h8LruW3yfLsW4l5eZYa1mNEHWMO6xNh6uh3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLoHSQbZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLoHSQbZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730308647; x=1761844647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=28w6doXzhJCTS30ooIOyz5J45KCQTf1vwqjQ9/oqcYU=;
  b=KLoHSQbZIIR1uzU6OAAV6LBxoERAN4CwD9OosJb3/AW92y/a+4GT1Gdr
   GKAz7vPZW8n8ZaEpuocEENqh4ErySWAj4UUT7ZfmP++e4oDKs0FVqbtkn
   t5+nknXXf1MBrB9NOGsA8qih577766BJySuk5wgLdXynuiuqyLUELrFP2
   yItVC/yYL8jf29hyyL3de/T+tM9ftdn9yHd3nowwfFlOM+jlYYno8/XJ0
   ltQk01qa+RSRcyZf6uERoMrpU03ra+uCjbAIdGx5kqGm5lpBuKWrlyw8a
   5dsB/OcimzL8cwwF8UmSyWVo0ivdCV65X01Vr0K0I556j3Z9ITBYdm7PS
   A==;
X-CSE-ConnectionGUID: QA9XncraRye2/zSXNlEgjw==
X-CSE-MsgGUID: Xv8HA2e8SoCwEIiElP30wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="33819110"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="33819110"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:17:26 -0700
X-CSE-ConnectionGUID: uOJXcSXlSbqBYhwcLS1Z5Q==
X-CSE-MsgGUID: uYadUxePR6y7QV4HI+xQjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="86988511"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2024 10:17:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6CJu-000f7k-2c;
	Wed, 30 Oct 2024 17:17:22 +0000
Date: Thu, 31 Oct 2024 01:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c:678:6-11: ERROR:
 invalid reference to the index variable of the iterator on line 665
Message-ID: <202410310150.GAApd4GK-lkp@intel.com>
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
TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Jacob Keller <jacob.e.keller@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Simon Horman <horms@kernel.org>

Hi Jinjie,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1e939a21eb111a6d6067b38e8e04b8809b64c4e
commit: c1fec890458ad101ddbbc52cdd29f7bba6aa2b10 ethernet/intel: Use list_for_each_entry() helper
date:   1 year, 1 month ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 1 month ago
config: xtensa-randconfig-r054-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310150.GAApd4GK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410310150.GAApd4GK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c:678:6-11: ERROR: invalid reference to the index variable of the iterator on line 665
   drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c:678:16-21: ERROR: invalid reference to the index variable of the iterator on line 665

vim +678 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c

4c7f35f679f592 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Alexander Duyck 2015-11-02  637  
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  638  static int ixgbe_set_vf_macvlan(struct ixgbe_adapter *adapter,
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  639  				int vf, int index, unsigned char *mac_addr)
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  640  {
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  641  	struct vf_macvlans *entry;
0e1ff3061cb529 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Tony Nguyen     2017-07-19  642  	int retval = 0;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  643  
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  644  	if (index <= 1) {
c1fec890458ad1 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Jinjie Ruan     2023-09-19  645  		list_for_each_entry(entry, &adapter->vf_mvs.l, l) {
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  646  			if (entry->vf == vf) {
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  647  				entry->vf = -1;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  648  				entry->free = true;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  649  				entry->is_macvlan = false;
5d7daa35b9eb14 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Jacob Keller    2014-03-29  650  				ixgbe_del_mac_filter(adapter,
5d7daa35b9eb14 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Jacob Keller    2014-03-29  651  						     entry->vf_macvlan, vf);
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  652  			}
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  653  		}
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  654  	}
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  655  
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  656  	/*
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  657  	 * If index was zero then we were asked to clear the uc list
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  658  	 * for the VF.  We're done.
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  659  	 */
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  660  	if (!index)
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  661  		return 0;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  662  
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  663  	entry = NULL;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  664  
c1fec890458ad1 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Jinjie Ruan     2023-09-19 @665  	list_for_each_entry(entry, &adapter->vf_mvs.l, l) {
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  666  		if (entry->free)
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  667  			break;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  668  	}
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  669  
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  670  	/*
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  671  	 * If we traversed the entire list and didn't find a free entry
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  672  	 * then we're out of space on the RAR table.  Also entry may
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  673  	 * be NULL because the original memory allocation for the list
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  674  	 * failed, which is not fatal but does mean we can't support
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  675  	 * VF requests for MACVLAN because we couldn't allocate
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  676  	 * memory for the list management required.
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  677  	 */
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13 @678  	if (!entry || !entry->free)
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  679  		return -ENOSPC;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  680  
0e1ff3061cb529 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Tony Nguyen     2017-07-19  681  	retval = ixgbe_add_mac_filter(adapter, mac_addr, vf);
0e1ff3061cb529 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Tony Nguyen     2017-07-19  682  	if (retval < 0)
0e1ff3061cb529 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Tony Nguyen     2017-07-19  683  		return retval;
0e1ff3061cb529 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c Tony Nguyen     2017-07-19  684  
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  685  	entry->free = false;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  686  	entry->is_macvlan = true;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  687  	entry->vf = vf;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  688  	memcpy(entry->vf_macvlan, mac_addr, ETH_ALEN);
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  689  
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  690  	return 0;
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  691  }
a1cbb15c13971b drivers/net/ixgbe/ixgbe_sriov.c                Greg Rose       2011-05-13  692  

:::::: The code at line 678 was first introduced by commit
:::::: a1cbb15c13971bd5d41626e9e5ced9f9de132c47 ixgbe: Add macvlan support for VF

:::::: TO: Greg Rose <gregory.v.rose@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
