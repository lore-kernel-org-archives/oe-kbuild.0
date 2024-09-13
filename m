Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C201C2BF
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Sep 2024 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726249454; cv=none; b=a7mVd/CccjyxS+KjY+x/Q3muTjhA+1iiCPKbZamNaTvNxAn2x/cOlLPoN0fSwGkjwmfJHdP9/SmMpVkt3GxIlssLeaZONaLPChdlnNYBH9Z25VNulj/v18mWTemiodDButJB/iQ46wPZ9afPXsKkg6sXHSrukFhnMH2heaWMNJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726249454; c=relaxed/simple;
	bh=9OkpczMMLTKfRQv0tVkvc5bm5ECh2iboDMdrI2IEolg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lx/cNo5h/YmfEVklRYIpkV5R6Vs+oBNGef+jzT5NgXMjtQcoqZDtq+SUQw532jVZcuZPgV4X2eNkrIAwMQplPCkqyCQfR19KCB7DVI987NbDEoLxP8RGvMfh90r1RClL0Ml+DqoDz7tvl7GwokNEofq+A48loYMGzlCyV1QBrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIXiQ78a; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIXiQ78a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726249453; x=1757785453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9OkpczMMLTKfRQv0tVkvc5bm5ECh2iboDMdrI2IEolg=;
  b=iIXiQ78azIFYC0yCZ8u4dESGYcNrPj/pZv9ru1fbcEYSx5E9+UTp9JtE
   viU+tp0wz1nITpQ3Puj3J+1l+eUAJe0Fmz0q8S1+JiH/nWA+jLWALenAt
   aLst0HYMgwJyEErfV9Pi35P5rUtktb1owrU1p4L78MalbJqbjNXCSvvQy
   KpGYkOYGXPjsiCY0OYIvs8xRFFemlfkAWj/BeCMa0iGM47Mds35eCX+EE
   wI2AULl7mGTS7VXUzrIaFpTHao0DMZHl0fhbjkU+EhIy4CvivFQHXtDpE
   VCid97Satww7L0k4fTTp3cx5c+5dKYTSjUJfluwfrsBnrNbHnIVstqWPT
   w==;
X-CSE-ConnectionGUID: Nq4NwoZRTaONt9w+iy7eWA==
X-CSE-MsgGUID: /UauDOydSBK8tz+dm7U/Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28074336"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="28074336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 10:44:12 -0700
X-CSE-ConnectionGUID: lL9Ay6MCTLmvwzPDuaLEAQ==
X-CSE-MsgGUID: ehwy5vKYT5OJaaTHqDX+GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="73144675"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Sep 2024 10:44:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spAL2-0006la-0b;
	Fri, 13 Sep 2024 17:44:08 +0000
Date: Sat, 14 Sep 2024 01:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/igb/igb_main.c:7895:6-11: ERROR: invalid
 reference to the index variable of the iterator on line 7890
Message-ID: <202409140131.Y6Qnoc6t-lkp@intel.com>
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
head:   196145c606d0f816fd3926483cb1ff87e09c2c0b
commit: c1fec890458ad101ddbbc52cdd29f7bba6aa2b10 ethernet/intel: Use list_for_each_entry() helper
date:   12 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 12 months ago
config: microblaze-randconfig-r052-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140131.Y6Qnoc6t-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409140131.Y6Qnoc6t-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/igb/igb_main.c:7895:6-11: ERROR: invalid reference to the index variable of the iterator on line 7890
   drivers/net/ethernet/intel/igb/igb_main.c:7895:15-20: ERROR: invalid reference to the index variable of the iterator on line 7890

vim +7895 drivers/net/ethernet/intel/igb/igb_main.c

83c21335c87622 Yury Kylulin     2017-03-07  7854  
b476deab8f412b Colin Ian King   2017-04-27  7855  static int igb_set_vf_mac_filter(struct igb_adapter *adapter, const int vf,
4827cc37796a02 Yury Kylulin     2017-03-07  7856  				 const u32 info, const u8 *addr)
4827cc37796a02 Yury Kylulin     2017-03-07  7857  {
4827cc37796a02 Yury Kylulin     2017-03-07  7858  	struct pci_dev *pdev = adapter->pdev;
4827cc37796a02 Yury Kylulin     2017-03-07  7859  	struct vf_data_storage *vf_data = &adapter->vf_data[vf];
4827cc37796a02 Yury Kylulin     2017-03-07  7860  	struct vf_mac_filter *entry = NULL;
4827cc37796a02 Yury Kylulin     2017-03-07  7861  	int ret = 0;
4827cc37796a02 Yury Kylulin     2017-03-07  7862  
1b8b062a99dc76 Corinna Vinschen 2018-01-17  7863  	if ((vf_data->flags & IGB_VF_FLAG_PF_SET_MAC) &&
1b8b062a99dc76 Corinna Vinschen 2018-01-17  7864  	    !vf_data->trusted) {
4827cc37796a02 Yury Kylulin     2017-03-07  7865  		dev_warn(&pdev->dev,
4827cc37796a02 Yury Kylulin     2017-03-07  7866  			 "VF %d requested MAC filter but is administratively denied\n",
4827cc37796a02 Yury Kylulin     2017-03-07  7867  			  vf);
4827cc37796a02 Yury Kylulin     2017-03-07  7868  		return -EINVAL;
4827cc37796a02 Yury Kylulin     2017-03-07  7869  	}
4827cc37796a02 Yury Kylulin     2017-03-07  7870  	if (!is_valid_ether_addr(addr)) {
4827cc37796a02 Yury Kylulin     2017-03-07  7871  		dev_warn(&pdev->dev,
4827cc37796a02 Yury Kylulin     2017-03-07  7872  			 "VF %d attempted to set invalid MAC filter\n",
4827cc37796a02 Yury Kylulin     2017-03-07  7873  			  vf);
4827cc37796a02 Yury Kylulin     2017-03-07  7874  		return -EINVAL;
4827cc37796a02 Yury Kylulin     2017-03-07  7875  	}
4827cc37796a02 Yury Kylulin     2017-03-07  7876  
584af82154f56e Karen Sornek     2021-08-31  7877  	switch (info) {
584af82154f56e Karen Sornek     2021-08-31  7878  	case E1000_VF_MAC_FILTER_CLR:
584af82154f56e Karen Sornek     2021-08-31  7879  		/* remove all unicast MAC filters related to the current VF */
c1fec890458ad1 Jinjie Ruan      2023-09-19  7880  		list_for_each_entry(entry, &adapter->vf_macs.l, l) {
584af82154f56e Karen Sornek     2021-08-31  7881  			if (entry->vf == vf) {
584af82154f56e Karen Sornek     2021-08-31  7882  				entry->vf = -1;
584af82154f56e Karen Sornek     2021-08-31  7883  				entry->free = true;
584af82154f56e Karen Sornek     2021-08-31  7884  				igb_del_mac_filter(adapter, entry->vf_mac, vf);
584af82154f56e Karen Sornek     2021-08-31  7885  			}
584af82154f56e Karen Sornek     2021-08-31  7886  		}
584af82154f56e Karen Sornek     2021-08-31  7887  		break;
584af82154f56e Karen Sornek     2021-08-31  7888  	case E1000_VF_MAC_FILTER_ADD:
4827cc37796a02 Yury Kylulin     2017-03-07  7889  		/* try to find empty slot in the list */
c1fec890458ad1 Jinjie Ruan      2023-09-19 @7890  		list_for_each_entry(entry, &adapter->vf_macs.l, l) {
4827cc37796a02 Yury Kylulin     2017-03-07  7891  			if (entry->free)
4827cc37796a02 Yury Kylulin     2017-03-07  7892  				break;
4827cc37796a02 Yury Kylulin     2017-03-07  7893  		}
4827cc37796a02 Yury Kylulin     2017-03-07  7894  
4827cc37796a02 Yury Kylulin     2017-03-07 @7895  		if (entry && entry->free) {
4827cc37796a02 Yury Kylulin     2017-03-07  7896  			entry->free = false;
4827cc37796a02 Yury Kylulin     2017-03-07  7897  			entry->vf = vf;
4827cc37796a02 Yury Kylulin     2017-03-07  7898  			ether_addr_copy(entry->vf_mac, addr);
4827cc37796a02 Yury Kylulin     2017-03-07  7899  
4827cc37796a02 Yury Kylulin     2017-03-07  7900  			ret = igb_add_mac_filter(adapter, addr, vf);
4827cc37796a02 Yury Kylulin     2017-03-07  7901  			ret = min_t(int, ret, 0);
4827cc37796a02 Yury Kylulin     2017-03-07  7902  		} else {
4827cc37796a02 Yury Kylulin     2017-03-07  7903  			ret = -ENOSPC;
4827cc37796a02 Yury Kylulin     2017-03-07  7904  		}
4827cc37796a02 Yury Kylulin     2017-03-07  7905  
4827cc37796a02 Yury Kylulin     2017-03-07  7906  		if (ret == -ENOSPC)
4827cc37796a02 Yury Kylulin     2017-03-07  7907  			dev_warn(&pdev->dev,
4827cc37796a02 Yury Kylulin     2017-03-07  7908  				 "VF %d has requested MAC filter but there is no space for it\n",
4827cc37796a02 Yury Kylulin     2017-03-07  7909  				 vf);
4827cc37796a02 Yury Kylulin     2017-03-07  7910  		break;
4827cc37796a02 Yury Kylulin     2017-03-07  7911  	default:
4827cc37796a02 Yury Kylulin     2017-03-07  7912  		ret = -EINVAL;
4827cc37796a02 Yury Kylulin     2017-03-07  7913  		break;
4827cc37796a02 Yury Kylulin     2017-03-07  7914  	}
4827cc37796a02 Yury Kylulin     2017-03-07  7915  
4827cc37796a02 Yury Kylulin     2017-03-07  7916  	return ret;
4827cc37796a02 Yury Kylulin     2017-03-07  7917  }
4827cc37796a02 Yury Kylulin     2017-03-07  7918  

:::::: The code at line 7895 was first introduced by commit
:::::: 4827cc37796a02ece7097e01dad8e08f537ac815 igb/igbvf: Add VF MAC filter request capabilities

:::::: TO: Yury Kylulin <yury.kylulin@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
