Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB061386D5
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Apr 2024 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713563917; cv=none; b=akP3twAWITwwTNrydTmhk0vFt6oDssPEx/4BsuTuSqBPUvYUou66CR1LuyT51j6AXD1P3EK+yhFoCvtZYE4J6h8snbzU/qlurlP1tytXKDKq9ChXIg5QVN7HzWDbdRbu+DQQcDUV1C7x72P7TF1xON2naaJiIKvAWXw0Hid1Njg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713563917; c=relaxed/simple;
	bh=1ZpngrbAu7aH18LUJCkdul8TOhFRQt3vewhhk/dAleo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=liXk0J5mhNduNpEK8cfxmhEUHpPtRuevK4LBRS2ZSR7jTnibcXww+Ckf0jgv9u7xDX4clTj7TOqWqpeewmLPiM5sAauYpYhmKqaXlheVTyc1Sfi3Dq9mcB8WdXmHIfJ1tQuxJxkZo8F3zfjxoTfXhvShBSdwC4y8sCaRlCPjgKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHXK3Mrv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHXK3Mrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713563916; x=1745099916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZpngrbAu7aH18LUJCkdul8TOhFRQt3vewhhk/dAleo=;
  b=nHXK3MrvlAnWAhin2DRxayL1sQBs1DiFfGs8Irn0BvFEBOefUqoCwFNo
   7B9Urbyejg7/ayZR5CZkxwwDEF3cOOwwFje9IOgGnf+RbLJSO/Qy11+Mw
   63UmCQgP24VkOfnZ1dgweaqyD28YCS3vl8ZVWpHmA1Hz6HFrclvg61lmm
   +4yOk5rjA1sPSgGs4WcXjO88wI7Sq/omJW2IzuJ3vEKgY/V+Pk3m5hf8l
   9rUFHOlTF00eaASD5nm9BYsMsqXDLHG952815187H2yTkeS1nIpybB6ib
   WAvMc5QPp7MiibEpCifonMRFPjFHvUZlO5Gr68innew21DALkrvXG94t9
   A==;
X-CSE-ConnectionGUID: w5D45oFIRfipChTU/Yi0Nw==
X-CSE-MsgGUID: YVZlr0FsQjuiIiTnhF4H4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12977283"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="12977283"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 14:58:35 -0700
X-CSE-ConnectionGUID: NOfbh4/ZRd+xO58cc447DA==
X-CSE-MsgGUID: 5Mc27GPZRAyR3SwUGtqGEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="46744812"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Apr 2024 14:58:33 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxwFa-000AUo-28;
	Fri, 19 Apr 2024 21:58:30 +0000
Date: Sat, 20 Apr 2024 05:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [crng-random:vmgenid-of 3/3] drivers/virt/vmgenid.c:123
 vmgenid_add_of() warn: platform_get_irq() does not return zero
Message-ID: <202404200545.JllWEoPv-lkp@intel.com>
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
CC: zx2c4@kernel.org
TO: Sudan Landge <sudanl@amazon.com>
CC: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: Alexander Graf <graf@amazon.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git vmgenid-of
head:   c1fa2e76c9238c014249d5ccbff366db2642de09
commit: ad0cf87856421036825ba264456005cd79e510b8 [3/3] virt: vmgenid: add support for devicetree bindings
:::::: branch date: 8 hours ago
:::::: commit date: 27 hours ago
config: mips-randconfig-r071-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200545.JllWEoPv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404200545.JllWEoPv-lkp@intel.com/

smatch warnings:
drivers/virt/vmgenid.c:123 vmgenid_add_of() warn: platform_get_irq() does not return zero

vim +123 drivers/virt/vmgenid.c

ad0cf878564210 Sudan Landge       2024-04-17  109  
ad0cf878564210 Sudan Landge       2024-04-17  110  static int vmgenid_add_of(struct platform_device *pdev,
ad0cf878564210 Sudan Landge       2024-04-17  111  			  struct vmgenid_state *state)
ad0cf878564210 Sudan Landge       2024-04-17  112  {
ad0cf878564210 Sudan Landge       2024-04-17  113  	void *virt_addr;
ad0cf878564210 Sudan Landge       2024-04-17  114  	int ret;
ad0cf878564210 Sudan Landge       2024-04-17  115  
ad0cf878564210 Sudan Landge       2024-04-17  116  	virt_addr = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
ad0cf878564210 Sudan Landge       2024-04-17  117  	if (IS_ERR(virt_addr))
ad0cf878564210 Sudan Landge       2024-04-17  118  		return PTR_ERR(virt_addr);
ad0cf878564210 Sudan Landge       2024-04-17  119  
ad0cf878564210 Sudan Landge       2024-04-17  120  	setup_vmgenid_state(state, virt_addr);
ad0cf878564210 Sudan Landge       2024-04-17  121  
ad0cf878564210 Sudan Landge       2024-04-17  122  	ret = platform_get_irq(pdev, 0);
ad0cf878564210 Sudan Landge       2024-04-17 @123  	if (ret)
ad0cf878564210 Sudan Landge       2024-04-17  124  		return ret;
ad0cf878564210 Sudan Landge       2024-04-17  125  
ad0cf878564210 Sudan Landge       2024-04-17  126  	ret = devm_request_irq(&pdev->dev, ret, vmgenid_of_irq_handler,
ad0cf878564210 Sudan Landge       2024-04-17  127  			       IRQF_SHARED, "vmgenid", &pdev->dev);
ad0cf878564210 Sudan Landge       2024-04-17  128  	if (ret)
ad0cf878564210 Sudan Landge       2024-04-17  129  		return ret;
ad0cf878564210 Sudan Landge       2024-04-17  130  
ad0cf878564210 Sudan Landge       2024-04-17  131  	pdev->dev.driver_data = state;
ad0cf878564210 Sudan Landge       2024-04-17  132  	return 0;
ad0cf878564210 Sudan Landge       2024-04-17  133  }
af6b54e2b5baa5 Jason A. Donenfeld 2022-02-23  134  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
