Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4486F27A476
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176269; cv=none; b=bpjCYazIflxo5OGNdBiiaAHRAWrieP4tvcqd62oaLQ9IQhgzdrqlsBSetYrOrD/NE5Zh3Dxx602WgA2IxvSlWCiRdwYu8+g05Ttko75yMew5xiJC5vWshBMqCWsEpR6mDPPpI37ozsGOgoJZhIyNUkhFQbchQJpzYXvrVABtkcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176269; c=relaxed/simple;
	bh=H7RICE0SV3lW8UQuLtEXBe9vTwb4SrbU+k/HbBDEBmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pdM9G0yHopPiMJlv4JMRdaBFp/mIY7cQB99gHRmrrNZb35uBaWx6n20mlZjgn48jPCN06AQOsqQ71ESwj5f/SK4Q+ZPaUUVJvBeI8eYpIDVDRiYTR9BcGVSCj/mF01noSfstliLxhovrBCOx6Q6Z47vEbRD0bim0CgAespENZvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWmAng9q; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWmAng9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781176267; x=1812712267;
  h=date:from:to:cc:subject:message-id;
  bh=H7RICE0SV3lW8UQuLtEXBe9vTwb4SrbU+k/HbBDEBmw=;
  b=fWmAng9qaOQqSXorkG2jBvmVfu3P1/S/CuEaFw8ncEF+bsF9dl9C6XgQ
   5Cjy9BtQaczSr7VSYYPmEKhfLofgGIk1WAVvwCqJ8elwaQvYl+/t7/WB7
   pKtUg8u1ogfzbrfx1d9A3oFcX+/lT677gMLx0FndaGgcovxIHKWqiovzK
   JF6RnePt6+d/dkQxtyzLmI05H00YC7XSuzFEWk6EoibYTvl0ZQf45PfWa
   b+wqTQhw6evSlePipps+RfkVxWPN+Z0B6hM3Ct7fKni+VpF5aAuOPl/UE
   xH+cC/kJoXpq5YTofmjTcJKJuKgkhyxdn4v5vnmA1FtPXCCT6Lx9gk6hX
   Q==;
X-CSE-ConnectionGUID: hAiSqp1/SUm/QiwF6YG+vA==
X-CSE-MsgGUID: UWjgr8gORLCs+foIdlhb4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81991042"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81991042"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 04:11:06 -0700
X-CSE-ConnectionGUID: aBf3/Kh/Q5WXu/h/v8w9MQ==
X-CSE-MsgGUID: 7meCNjEtScmDVTbtyK026A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 04:11:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXdJP-00000000MqE-12YZ;
	Thu, 11 Jun 2026 11:11:03 +0000
Date: Thu, 11 Jun 2026 19:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn:
 can 'dev_data' even be NULL?
Message-ID: <202606111933.69GGTKxr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 35c5097f737a164b3afe23d07698db95061f0db8 crypto: ti - Enable compile testing for dthev2
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: s390-randconfig-r072-20260611 (https://download.01.org/0day-ci/archive/20260611/202606111933.69GGTKxr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35c5097f737a ("crypto: ti - Enable compile testing for dthev2")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606111933.69GGTKxr-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can 'dev_data' even be NULL?

vim +/dev_data +44 drivers/crypto/ti/dthev2-common.c

52f641bc63a4665 T Pratham 2025-08-20  34  
52f641bc63a4665 T Pratham 2025-08-20  35  struct dthe_data *dthe_get_dev(struct dthe_tfm_ctx *ctx)
52f641bc63a4665 T Pratham 2025-08-20  36  {
52f641bc63a4665 T Pratham 2025-08-20  37  	struct dthe_data *dev_data;
52f641bc63a4665 T Pratham 2025-08-20  38  
52f641bc63a4665 T Pratham 2025-08-20  39  	if (ctx->dev_data)
52f641bc63a4665 T Pratham 2025-08-20  40  		return ctx->dev_data;
52f641bc63a4665 T Pratham 2025-08-20  41  
52f641bc63a4665 T Pratham 2025-08-20  42  	spin_lock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  43  	dev_data = list_first_entry(&dthe_dev_list.dev_list, struct dthe_data, list);
52f641bc63a4665 T Pratham 2025-08-20 @44  	if (dev_data)
52f641bc63a4665 T Pratham 2025-08-20  45  		list_move_tail(&dev_data->list, &dthe_dev_list.dev_list);
52f641bc63a4665 T Pratham 2025-08-20  46  	spin_unlock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  47  
52f641bc63a4665 T Pratham 2025-08-20  48  	return dev_data;
52f641bc63a4665 T Pratham 2025-08-20  49  }
52f641bc63a4665 T Pratham 2025-08-20  50  

:::::: The code at line 44 was first introduced by commit
:::::: 52f641bc63a46657b1d72d902fcee30ab1233c7b crypto: ti - Add driver for DTHE V2 AES Engine (ECB, CBC)

:::::: TO: T Pratham <t-pratham@ti.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
