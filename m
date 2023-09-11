Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96678FBE6
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 15:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694446341; x=1725982341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3VmjQzORTt6XkwsqlOiYEWAq/JFXM5gYTAv/Mby7DI=;
  b=ZwXM4Z87P5uAVtq1kIKJ0ndUPG4NkLe5I901de4D0KPHGLwdrRxEaZxw
   0hrxmeBhUImAZqOP8FCLj97li+oEdcKPGAkTHMA+s1uOr0TAA9rBGjFZp
   9Ofjt6LdiHxfk0e4gGzYnsxHi7ugnEnT3kShYNAwwFr0JNSsLfA+ES/Nq
   tdqN613w7unl8dwlPIVDSF9K/SBHRg6+V7F2XHq68xFOWWrvjCab/S8ev
   qR9t2Q8eY3SOYb3yz4LggzXoDHqPyabcDHdeIoCrjk/YHqnXhJWGCl2tT
   LIsvFdyYxV8UALkpQslqXP9zLyu3YgrH8sGHkM62tY+1tEHfRcn3mM66q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375463278"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="375463278"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 08:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="693133956"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="693133956"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Sep 2023 08:32:19 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfitc-0006Ow-2Q;
	Mon, 11 Sep 2023 15:32:16 +0000
Date: Mon, 11 Sep 2023 23:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/huawei/hinic/hinic_port.c:459
 hinic_set_vlan_fliter() warn: variable dereferenced before check 'hwdev'
 (see line 453)
Message-ID: <202309112354.pikZCmyk-lkp@intel.com>
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
TO: Cai Huoqing <cai.huoqing@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 2acf960e3be6177f437baade6d1883ebe4c641b2 net: hinic: Add support for configuration of rx-vlan-filter by ethtool
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20230911 (https://download.01.org/0day-ci/archive/20230911/202309112354.pikZCmyk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309112354.pikZCmyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309112354.pikZCmyk-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/huawei/hinic/hinic_port.c:459 hinic_set_vlan_fliter() warn: variable dereferenced before check 'hwdev' (see line 453)

vim +/hwdev +459 drivers/net/ethernet/huawei/hinic/hinic_port.c

aebd17b7685499 Xue Chaojing 2019-06-29  449  
2acf960e3be617 Cai Huoqing  2022-11-03  450  int hinic_set_vlan_fliter(struct hinic_dev *nic_dev, u32 en)
2acf960e3be617 Cai Huoqing  2022-11-03  451  {
2acf960e3be617 Cai Huoqing  2022-11-03  452  	struct hinic_hwdev *hwdev = nic_dev->hwdev;
2acf960e3be617 Cai Huoqing  2022-11-03 @453  	struct hinic_hwif *hwif = hwdev->hwif;
2acf960e3be617 Cai Huoqing  2022-11-03  454  	struct pci_dev *pdev = hwif->pdev;
2acf960e3be617 Cai Huoqing  2022-11-03  455  	struct hinic_vlan_filter vlan_filter;
2acf960e3be617 Cai Huoqing  2022-11-03  456  	u16 out_size = sizeof(vlan_filter);
2acf960e3be617 Cai Huoqing  2022-11-03  457  	int err;
2acf960e3be617 Cai Huoqing  2022-11-03  458  
2acf960e3be617 Cai Huoqing  2022-11-03 @459  	if (!hwdev)
2acf960e3be617 Cai Huoqing  2022-11-03  460  		return -EINVAL;
2acf960e3be617 Cai Huoqing  2022-11-03  461  
2acf960e3be617 Cai Huoqing  2022-11-03  462  	vlan_filter.func_idx = HINIC_HWIF_FUNC_IDX(hwif);
2acf960e3be617 Cai Huoqing  2022-11-03  463  	vlan_filter.enable = en;
2acf960e3be617 Cai Huoqing  2022-11-03  464  
2acf960e3be617 Cai Huoqing  2022-11-03  465  	err = hinic_port_msg_cmd(hwdev, HINIC_PORT_CMD_SET_VLAN_FILTER,
2acf960e3be617 Cai Huoqing  2022-11-03  466  				 &vlan_filter, sizeof(vlan_filter),
2acf960e3be617 Cai Huoqing  2022-11-03  467  				 &vlan_filter, &out_size);
2acf960e3be617 Cai Huoqing  2022-11-03  468  	if (vlan_filter.status == HINIC_MGMT_CMD_UNSUPPORTED) {
2acf960e3be617 Cai Huoqing  2022-11-03  469  		err = HINIC_MGMT_CMD_UNSUPPORTED;
2acf960e3be617 Cai Huoqing  2022-11-03  470  	} else if ((err == HINIC_MBOX_VF_CMD_ERROR) &&
2acf960e3be617 Cai Huoqing  2022-11-03  471  			   HINIC_IS_VF(hwif)) {
2acf960e3be617 Cai Huoqing  2022-11-03  472  		err = HINIC_MGMT_CMD_UNSUPPORTED;
2acf960e3be617 Cai Huoqing  2022-11-03  473  	} else if (err || !out_size || vlan_filter.status) {
2acf960e3be617 Cai Huoqing  2022-11-03  474  		dev_err(&pdev->dev,
2acf960e3be617 Cai Huoqing  2022-11-03  475  			"Failed to set vlan fliter, err: %d, status: 0x%x, out size: 0x%x\n",
2acf960e3be617 Cai Huoqing  2022-11-03  476  			err, vlan_filter.status, out_size);
2acf960e3be617 Cai Huoqing  2022-11-03  477  		err = -EINVAL;
2acf960e3be617 Cai Huoqing  2022-11-03  478  	}
2acf960e3be617 Cai Huoqing  2022-11-03  479  
2acf960e3be617 Cai Huoqing  2022-11-03  480  	return err;
2acf960e3be617 Cai Huoqing  2022-11-03  481  }
2acf960e3be617 Cai Huoqing  2022-11-03  482  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
