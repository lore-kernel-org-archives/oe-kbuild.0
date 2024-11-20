Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A61E515
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732126225; cv=none; b=jAAA0RD0wSya5uag04yz7HPsYRt/OnFVjKKTtud+Mqvu7mUFzKTtjkoY9+W1GomoG6VqZdqVXcwh3JzZzvGjpeXA092SYJoBiZo+Z8xugG98JBk+vji8PGFGdDVws2tWBFbsAwtI2sggKQttAiyJoRgxZYh8z5kOF/Vk1HbPZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732126225; c=relaxed/simple;
	bh=dEsj6thiMw0XSi7PEOYZJUfYrW6GyopBTt4bCZ/7jls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IljsWrFkKL02V5GJkmJSEfxhArwv+71zw+a03HF0dVLL8qSMsr6/LvkdA2spH2+Uk9CUeGymfmtyfVkPBC3RQBhR4+Zz6juCEXwlqw0FDYud28V6UPtS2v0/Uz3rbt/6c6m5aahxKdV67KDruOm6c+9u6o0fVsj37Bwy1ctxsBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfeq8a/w; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfeq8a/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732126224; x=1763662224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dEsj6thiMw0XSi7PEOYZJUfYrW6GyopBTt4bCZ/7jls=;
  b=bfeq8a/wBbqu15vol4UYjT7h/C/91nCeEPjkTHlreYlGhQAlJkkuvaRl
   7H9HAwt8Ilkt/98SHPeru4Yl0s0s+I7sKkdnnODcygO+zGTd7jSDwrDIn
   8HyZ/aks2Cj0Xph62r6JNdSJeXN8LDpxW+F2/hEG6TvdLg9FP4PRFBtZ1
   YbBmqa8WGP+pe0jq/I6745xlADzUZ8ggpe5Y534W1I0skvrMimFVYwyBd
   RX8tPH5cZ50sGBwXcnYbqT7qFCeIFUjAbsNUV86nrxZDj5u7Ts/8D14ap
   /6Louyx1yD6FKRDxeA8hfAQiFcqN+/iHYgwualGQduWrK5vg9uU+7BIIP
   A==;
X-CSE-ConnectionGUID: tVFhFfA4SmSCAEVjfw0uuw==
X-CSE-MsgGUID: eF5wCsJ0RbWy/f+klyTACw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43587450"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="43587450"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 10:10:22 -0800
X-CSE-ConnectionGUID: FyNULjmVQxq+cH1rQpcBpg==
X-CSE-MsgGUID: 5gGddjEPQayYmPZ2FnzQ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95061036"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2024 10:10:21 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDp9e-00014z-1v;
	Wed, 20 Nov 2024 18:10:18 +0000
Date: Thu, 21 Nov 2024 02:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/qlogic/qede/qede_filter.c:860
 qede_vlan_rx_kill_vid() warn: iterator used outside loop: 'vlan'
Message-ID: <202411210214.lYxVEhqK-lkp@intel.com>
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
TO: Wei Yang <richard.weiyang@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bf9aa14fc523d2763fc9a10672a709224e8fcaf4
commit: 2932fb0a927d30690b8cb70c71d511fd9054bb61 list: leverage list_is_head() for list_entry_is_head()
date:   9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20241120 (https://download.01.org/0day-ci/archive/20241121/202411210214.lYxVEhqK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411210214.lYxVEhqK-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/qlogic/qede/qede_filter.c:860 qede_vlan_rx_kill_vid() warn: iterator used outside loop: 'vlan'

vim +/vlan +860 drivers/net/ethernet/qlogic/qede/qede_filter.c

aed284c7f0d9d3 Mintz, Yuval     2017-01-01  828  
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  829  int qede_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid)
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  830  {
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  831  	struct qede_dev *edev = netdev_priv(dev);
795e3d2ea68e48 Harshvardhan Jha 2021-07-25  832  	struct qede_vlan *vlan;
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  833  	int rc = 0;
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  834  
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  835  	DP_VERBOSE(edev, NETIF_MSG_IFDOWN, "Removing vlan 0x%04x\n", vid);
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  836  
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  837  	/* Find whether entry exists */
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  838  	__qede_lock(edev);
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  839  	list_for_each_entry(vlan, &edev->vlan_list, list)
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  840  		if (vlan->vid == vid)
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  841  			break;
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  842  
795e3d2ea68e48 Harshvardhan Jha 2021-07-25  843  	if (list_entry_is_head(vlan, &edev->vlan_list, list)) {
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  844  		DP_VERBOSE(edev, (NETIF_MSG_IFUP | NETIF_MSG_IFDOWN),
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  845  			   "Vlan isn't configured\n");
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  846  		goto out;
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  847  	}
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  848  
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  849  	if (edev->state != QEDE_STATE_OPEN) {
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  850  		/* As interface is already down, we don't have a VPORT
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  851  		 * instance to remove vlan filter. So just update vlan list
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  852  		 */
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  853  		DP_VERBOSE(edev, NETIF_MSG_IFDOWN,
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  854  			   "Interface is down, removing VLAN from list only\n");
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  855  		qede_del_vlan_from_list(edev, vlan);
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  856  		goto out;
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  857  	}
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  858  
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  859  	/* Remove vlan */
aed284c7f0d9d3 Mintz, Yuval     2017-01-01 @860  	if (vlan->configured) {
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  861  		rc = qede_set_ucast_rx_vlan(edev, QED_FILTER_XCAST_TYPE_DEL,
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  862  					    vid);
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  863  		if (rc) {
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  864  			DP_ERR(edev, "Failed to remove VLAN %d\n", vid);
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  865  			goto out;
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  866  		}
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  867  	}
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  868  
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  869  	qede_del_vlan_from_list(edev, vlan);
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  870  
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  871  	/* We have removed a VLAN - try to see if we can
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  872  	 * configure non-configured VLAN from the list.
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  873  	 */
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  874  	rc = qede_configure_vlan_filters(edev);
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  875  
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  876  out:
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  877  	__qede_unlock(edev);
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  878  	return rc;
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  879  }
aed284c7f0d9d3 Mintz, Yuval     2017-01-01  880  

:::::: The code at line 860 was first introduced by commit
:::::: aed284c7f0d9d33ce34fadade605b33e8683b7ed qede: Split filtering logic to its own file

:::::: TO: Mintz, Yuval <Yuval.Mintz@cavium.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
