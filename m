Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3F48BE5
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732743166; cv=none; b=pNLQBUmecq4aStJtgfZa4MURgaI0mf/EeEQCpL+2WLtya6OZkGelONyjb4K5uQ5DXf34llAeAlcAjBwBt19f5htv4rUDnfirYxPJMaopGHCuIRkTvxv88WcTCc29mx/hlvR/1ZcKpZcCEomKvyJ3Ah3Kv5PAYqzc8Ojb2z5VIfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732743166; c=relaxed/simple;
	bh=Ck1qIcy3HemHlTAsuyuErXjbqghTo4B9mN8REUPsn6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syx/eZQewgPtlZM+V7modfPrx+htoP6DjSil3eVZxjpPYFqPrBCCvQZNzSosTpkOfOy/9rxcO5+VHDlSRjPygjY+e7QYcp2XvZX2T4gmzx/mW9QjxPkWcQNsu7nDv51Nv+vI4UG/+/oF5NXH29+nhmNILhVGmpIKbzxwpDc50YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IV1FAjWm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IV1FAjWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732743165; x=1764279165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ck1qIcy3HemHlTAsuyuErXjbqghTo4B9mN8REUPsn6s=;
  b=IV1FAjWmyidULmxkdtvrQulzrxhQI5nwqW41gslD+b+rbZSBrQQgdaDl
   ef2RO8+3ritNatRAYtUBhpsN8rq3ug4C68Y6LAbzZUKgeF4utTLN/WDBd
   x/wr4og0FSY4eru3KiGpay068vy1Ty+Ri1dQJ6O+n46k2M4ws+pv7wDLW
   vGNNMwfh2Mxo1DxZgCjDUSRh2DMqpyNuq8lUIi3zFACwI2H/ZonuoJxdq
   kR2xq4XA82v1R9i2m9VSU8zq3zmsMiOFUkqPpq8iZBKO9rkEhNCAli4Hb
   ihDjCIpoZdejND73eDcdDT3l4vDrWjyU2+8riORUl+sqEXkFmEgLBk1EH
   Q==;
X-CSE-ConnectionGUID: TneAX2S1RnehiusvNyISNg==
X-CSE-MsgGUID: J9wjZL8ZSFqxLohDsZz2lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33118042"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="33118042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 13:32:44 -0800
X-CSE-ConnectionGUID: 8wUNQDCHT/W9j46kp6iIUg==
X-CSE-MsgGUID: 4SJ+0fRiRPyCBZxflBw2rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92143597"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Nov 2024 13:32:43 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGPeL-0008NV-0C;
	Wed, 27 Nov 2024 21:32:41 +0000
Date: Thu, 28 Nov 2024 05:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c:678:6-11: ERROR:
 invalid reference to the index variable of the iterator on line 665
Message-ID: <202411280532.SH1xDFLD-lkp@intel.com>
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
head:   91dbbe6c9ffe5eded9a3e75d773ff92da8d2bc57
commit: c1fec890458ad101ddbbc52cdd29f7bba6aa2b10 ethernet/intel: Use list_for_each_entry() helper
date:   1 year, 2 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 2 months ago
config: riscv-randconfig-r051-20241122 (https://download.01.org/0day-ci/archive/20241128/202411280532.SH1xDFLD-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411280532.SH1xDFLD-lkp@intel.com/

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
