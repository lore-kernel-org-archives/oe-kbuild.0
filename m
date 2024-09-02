Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3FC19C56C
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292392; cv=none; b=QQX3BRN/qpKY+HGvCQG2YWFsijKDTCdTtnsKLIFn/+Z4+PLV4ZAB0U8UDF5X5T0VulMrlhDCORjS7g2wtezBs+Um638KNK4wae0j//bmoLa7Ane507rpCiZhgwE//4d2+Uldyyq4Ay/O0Tle9Mkzkn1GmRyoQaHUxenZCjD8/3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292392; c=relaxed/simple;
	bh=0jvcgP+WEBcDRzQV0caiToLfGbK2D5mAC7RosrT4CS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lFoYzRXvrkw91PHyT/LL//uVWZ76HJsIRxnIS/25VW5L8dPE0ijnr525s6raYA3PegAG8KqHZPPVhA8kYCWkGIvyg7brP9l+QuwJ/SfJEVnKlhWpGnnBSAQ5hTah2Hezj4AfT7BDW86fiuDVFekqzhny1fx+ggnv9Mjcbe5ovoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AznuCRAZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AznuCRAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725292390; x=1756828390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0jvcgP+WEBcDRzQV0caiToLfGbK2D5mAC7RosrT4CS8=;
  b=AznuCRAZqOc4wdGzAOzjniw1Z0ZUMcNPsfcr0MkTGV+sWjDRI2lcVRM5
   C9JPP+CRbY98W2dWQ+p6I13JuI6Z6blEtsDMmgjQWrmkJznGkI9colE4r
   d83ZSDO5BLSStehcCI/TadrErkiuuuP5fOzmP9Psi/OaNOP2hxm/ooh8i
   9tkge5DuVD6z0vGDAcktk3iOBrZteLZhBKeP4lPEpGbRendt3jegzvjIo
   Eja0ufPMvkUP+8+4esPuM8tK6C7geCMScOSVc1hfzw1IglSA9UQzXkuUa
   EjHoBm5Orc2VxWvI1gl2dq5emEwL/lMsY6LUPlfCfWSInH8xXSfEX20u4
   g==;
X-CSE-ConnectionGUID: 4S8sIzg9RmWSdbpnq7cmsg==
X-CSE-MsgGUID: 9suKV+nNTp2qSROppXKXIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34448030"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="34448030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 08:53:09 -0700
X-CSE-ConnectionGUID: Y6fOXn61QN+qHRyGrvijXw==
X-CSE-MsgGUID: X4zoDO3mSrOFo1VRF2GCfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="65148186"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 08:53:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl9MY-0005gI-0l;
	Mon, 02 Sep 2024 15:53:06 +0000
Date: Mon, 2 Sep 2024 23:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 5/6] phy: rockchip-pcie: Change to use
 devm_clk_get_enabled() helper
Message-ID: <202409022325.aTgukdmg-lkp@intel.com>
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
In-Reply-To: <20240901183221.240361-6-linux.amoon@gmail.com>
References: <20240901183221.240361-6-linux.amoon@gmail.com>
TO: Anand Moon <linux.amoon@gmail.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Anand Moon <linux.amoon@gmail.com>
CC: linux-phy@lists.infradead.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus rockchip/for-next mani-mhi/mhi-next linus/master v6.11-rc6 next-20240902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/PCI-rockchip-Simplify-reset-control-handling-by-using-reset_control_bulk-function/20240902-033256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240901183221.240361-6-linux.amoon%40gmail.com
patch subject: [PATCH v5 5/6] phy: rockchip-pcie: Change to use devm_clk_get_enabled() helper
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: nios2-randconfig-r072-20240902 (https://download.01.org/0day-ci/archive/20240902/202409022325.aTgukdmg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409022325.aTgukdmg-lkp@intel.com/

smatch warnings:
drivers/phy/rockchip/phy-rockchip-pcie.c:278 rockchip_pcie_phy_init() warn: missing error code 'err'

vim +/err +278 drivers/phy/rockchip/phy-rockchip-pcie.c

fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  268  
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  269  static int rockchip_pcie_phy_init(struct phy *phy)
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  270  {
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  271  	struct phy_pcie_instance *inst = phy_get_drvdata(phy);
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  272  	struct rockchip_pcie_phy *rk_phy = to_pcie_phy(inst);
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  273  	int err = 0;
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  274  
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  275  	mutex_lock(&rk_phy->pcie_mutex);
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  276  
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  277  	if (rk_phy->init_cnt++)
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19 @278  		goto err_out;
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  279  
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  280  	err = reset_control_assert(rk_phy->phy_rst);
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  281  	if (err) {
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  282  		dev_err(&phy->dev, "assert phy_rst err %d\n", err);
977b7135d301ade drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-09-02  283  		goto err_out;
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  284  	}
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  285  
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  286  	mutex_unlock(&rk_phy->pcie_mutex);
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  287  	return 0;
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  288  
977b7135d301ade drivers/phy/rockchip/phy-rockchip-pcie.c Anand Moon 2024-09-02  289  err_out:
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  290  	rk_phy->init_cnt--;
90a7612d070d5ca drivers/phy/rockchip/phy-rockchip-pcie.c Shawn Lin  2017-07-19  291  	mutex_unlock(&rk_phy->pcie_mutex);
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  292  	return err;
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  293  }
fcffee3d54fcadc drivers/phy/phy-rockchip-pcie.c          Shawn Lin  2016-09-01  294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
