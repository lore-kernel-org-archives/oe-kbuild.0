Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F9236B
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 00:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695688783; x=1727224783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32kqIZXP5IaPiABYZfbSCOqjcJ0MRs4gTY98o4pY1wg=;
  b=KdB8k5IXvLitx580yYjQjJX469P68fOX83RWWOixYZNMlNxeJro5WQEo
   j3lbV5WttD9BaCVwJDO7ILmpU697CufVVRB43tkGa3hZWiIvtBedEmOdg
   GtsHIFCeOK89tHj0Hr8lN3/6EvBQqZjwmL7Ph0AR1G8afxfIHr8OYx58V
   AGnFTtWyTkTlnE8SrpUlbt351o6I/v+rrF6JAEmiWEJqH5AjN99LZKL20
   Av8Co3H5F8GWjPk447c6MON9ZP9SPVYIj7tP3nrkpM2SBYoljm5LsXrJ/
   sPftmJKMH6iwnE0xQcErOUHgeGQ5aWtjQkubD1xFNgjxDt17UOYSfTxR0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412365160"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="412365160"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 17:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777913578"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="777913578"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2023 17:39:40 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkw70-0002CJ-1I;
	Tue, 26 Sep 2023 00:39:38 +0000
Date: Tue, 26 Sep 2023 08:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tnguy-next-queue:dev-queue 11/27]
 drivers/net/ethernet/intel/igb/igb_main.c:7895:6-11: ERROR: invalid
 reference to the index variable of the iterator on line 7890
Message-ID: <202309260836.V2TdCrdR-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

Hi Jinjie,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   c1735368c670faae047e41c815474d5b64837072
commit: 42d6bffca779f61b87817d12ef3f04a0bba3ad18 [11/27] ethernet/intel: Use list_for_each_entry() helper
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-102-20230926 (https://download.01.org/0day-ci/archive/20230926/202309260836.V2TdCrdR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309260836.V2TdCrdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309260836.V2TdCrdR-lkp@intel.com/

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
42d6bffca779f6 Jinjie Ruan      2023-08-21  7880  		list_for_each_entry(entry, &adapter->vf_macs.l, l) {
584af82154f56e Karen Sornek     2021-08-31  7881  			if (entry->vf == vf) {
584af82154f56e Karen Sornek     2021-08-31  7882  				entry->vf = -1;
584af82154f56e Karen Sornek     2021-08-31  7883  				entry->free = true;
584af82154f56e Karen Sornek     2021-08-31  7884  				igb_del_mac_filter(adapter, entry->vf_mac, vf);
584af82154f56e Karen Sornek     2021-08-31  7885  			}
584af82154f56e Karen Sornek     2021-08-31  7886  		}
584af82154f56e Karen Sornek     2021-08-31  7887  		break;
584af82154f56e Karen Sornek     2021-08-31  7888  	case E1000_VF_MAC_FILTER_ADD:
4827cc37796a02 Yury Kylulin     2017-03-07  7889  		/* try to find empty slot in the list */
42d6bffca779f6 Jinjie Ruan      2023-08-21 @7890  		list_for_each_entry(entry, &adapter->vf_macs.l, l) {
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
