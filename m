Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3F22F74A
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777644031; cv=none; b=ZFcauyRJKLz2tzY5bJCyMJ7B/rFFn/sM+8o2r6RYWWqPwCqmotO07MrntOzG3n36hgipSUXs+st6kUcnVjFSDC+P2Dc3dIqzeCECU0g7Mm5blVUXzd8B+DPlyxprSsR78Tt0/r1LtzhescH7VnT9D2+nBIKnKR5px+23r2NUAbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777644031; c=relaxed/simple;
	bh=ffVeCDUYXgsIeYK7iFBL4EvAX8/SjsYkV9FJPRwC2v4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GFmy6gEBriYmREX7k2jtMN8QCE6MXSh3+eQF8ZovP4WcoVTviG2Y8B4oJjNPhgIQ1euCtigBnxO7DpSWtPi8frpHwRH87cQ7LsWQJlz0UvaG0SKm0QHeSceolZxri0gMAnMgTxMi2/pzB2dXBFjMSaoVeYfX7Rrt3Dk95Ue/G6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6nNNI1a; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6nNNI1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777644029; x=1809180029;
  h=date:from:to:cc:subject:message-id;
  bh=ffVeCDUYXgsIeYK7iFBL4EvAX8/SjsYkV9FJPRwC2v4=;
  b=J6nNNI1aSFU+c6Md1pOFupDF/vpFVpbPlw1qWszWVLByOL0Rq/XTtJCN
   ng8AAzfOvjxIG4CN1MNbSetCp1qXTLQ330aLrItLS5kxJVSANAmD/23ui
   LUvzsgfVilivyj8vV5xT+Tbbvy4uP5SpUdpwKHDMkPsyQqBtt3SnhVkeN
   0W8qaSnwlEnewBJWm6YCrWTENOrXWJUOHCiw5Z/0ZQuJGim8czeoyskZI
   r6/N1pVkSdztrKRXv9rmjTKyE4OaXemSu1Jznh3M/34B48WJXnEfwVQ2k
   oeOYpN4rfz+FC/kZYcjx3uSw78+6msI7pMFjU9tPz2NqixUriBMiVeodo
   w==;
X-CSE-ConnectionGUID: H3l5U5raRNqbrwV1VrWxJA==
X-CSE-MsgGUID: BsfNdbV3TWKfhsn6+rNmkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="89699542"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="89699542"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 07:00:29 -0700
X-CSE-ConnectionGUID: kC8dzwdYT0mjBrJyB1X/1g==
X-CSE-MsgGUID: hL/elZKyTiqiMT3V8dNA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="230276159"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 May 2026 07:00:27 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIoPo-000000000an-2iF1;
	Fri, 01 May 2026 14:00:24 +0000
Date: Fri, 01 May 2026 21:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 90/90]
 drivers/ufs/core/ufshcd.c:2294 ufshcd_hba_capabilities() warn: missing error
 code? 'err'
Message-ID: <202605012135.qpiuGqaa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   90993a7a9684f014a3d9f2b1b0deb516badc3ecc
commit: 996bbaea824f317c30977c4967f84b10feb3cf40 [90/90] FROMGIT: scsi: ufs: core: Introduce multi-circular queue capability
:::::: branch date: 11 hours ago
:::::: commit date: 3 years, 2 months ago
config: arm64-randconfig-r073-20260426 (https://download.01.org/0day-ci/archive/20260501/202605012135.qpiuGqaa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605012135.qpiuGqaa-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:2294 ufshcd_hba_capabilities() warn: missing error code? 'err'

Old smatch warnings:
drivers/ufs/core/ufshcd.c:5356 ufshcd_uic_cmd_compl() error: we previously assumed 'hba->active_uic_cmd' could be null (see line 5344)
drivers/ufs/core/ufshcd.c:8783 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 8763.

vim +/err +2294 drivers/ufs/core/ufshcd.c

68078d5cc1a59b drivers/scsi/ufs/ufshcd.c Dolev Raviv        2013-07-30  2266  
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2267  /**
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2268   * ufshcd_hba_capabilities - Read controller capabilities
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2269   * @hba: per adapter instance
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2270   *
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2271   * Return: 0 on success, negative on error.
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2272   */
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2273  static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2274  {
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2275  	int err;
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2276  
b873a27538dff5 drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  2277  	hba->capabilities = ufshcd_readl(hba, REG_CONTROLLER_CAPABILITIES);
6554400d6f66b9 drivers/ufs/core/ufshcd.c Yoshihiro Shimoda  2022-06-03  2278  	if (hba->quirks & UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS)
6554400d6f66b9 drivers/ufs/core/ufshcd.c Yoshihiro Shimoda  2022-06-03  2279  		hba->capabilities &= ~MASK_64_ADDRESSING_SUPPORT;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2280  
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2281  	/* nutrs and nutmrs are 0 based values */
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2282  	hba->nutrs = (hba->capabilities & MASK_TRANSFER_REQUESTS_SLOTS) + 1;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2283  	hba->nutmrs =
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2284  	((hba->capabilities & MASK_TASK_MANAGEMENT_REQUEST_SLOTS) >> 16) + 1;
945c3cca05d783 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  2285  	hba->reserved_slot = hba->nutrs - 1;
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2286  
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2287  	/* Read crypto capabilities */
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2288  	err = ufshcd_hba_init_crypto_capabilities(hba);
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2289  	if (err)
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2290  		dev_err(hba->dev, "crypto setup failed\n");
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2291  
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2292  	hba->mcq_sup = FIELD_GET(MASK_MCQ_SUPPORT, hba->capabilities);
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2293  	if (!hba->mcq_sup)
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13 @2294  		return err;
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2295  
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2296  	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2297  	hba->ext_iid_sup = FIELD_GET(MASK_EXT_IID_SUPPORT,
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2298  				     hba->mcq_capabilities);
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2299  
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2300  	return err;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2301  }
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2302  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
