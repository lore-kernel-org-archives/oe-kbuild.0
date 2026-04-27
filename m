Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5443A351C31
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Apr 2026 03:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777258999; cv=none; b=aVnpIAfW4S2jmG73G2RqjrPKgcVZ/UgTP6nR6hf+0qAE1KdA1BGmGm+2wW84uzHT17yeTPIWiVptS0pjCi60IkjwDv1s6soC6QnUuqUSCqrSw9aAw9IYo6xb3XgtimDbPqHuOozoZgurgDZ6exYwZAyozoJJg2hAhJmarQkL844=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777258999; c=relaxed/simple;
	bh=IZIIesTuxhVmHcEhzZXJ1eRf6PDOjPknly4dETBtkNc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CiKmtziaNlRqBiEOAvLCre1Wzdgvv2ZfCPMoz6TcK4BhLqYpAJ1ti8explM/NaF9gKB/NtscavPsNcQEzvqo3OfgTM8h2F2JulbO8Zse5fnxtqAUAu268G6PrGmyHHPoicdYj7Dl3DJ7Riyy9I2e9qECXPK0ab3r65aYHU+fYj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8cspLva; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8cspLva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777258998; x=1808794998;
  h=date:from:to:cc:subject:message-id;
  bh=IZIIesTuxhVmHcEhzZXJ1eRf6PDOjPknly4dETBtkNc=;
  b=D8cspLvaYL6CcCJJuACEigQWM8Rx2k478DzXdjI5aKltDP5Gj2vDtyP3
   c1XdjF80NnCqEI+hAuUDwSo4dSanuYpbNF1jJvYmtS6HFaZbXsvE92McD
   SWwT9/jGPFiR6p7Jz3fOPNlRuces4egWoNpcrjC8QB/LQ1r3YQLovwsaN
   5vMD65JU8mgotqk4T1A7BW28XGO+ZHP/4sTS1x3m1UnvxLW5neLkEkLwP
   a8ndEM83cqGeP0Eziq4x9DyxG1fMdGaLOhuhLUY25TbgqWxpz+mQPQ2Vp
   6n6nTLKK6xmf6bdQ7L99ijx0xwiNk6KmU7amSvmk4ti5/h+QdAvC5Xiak
   Q==;
X-CSE-ConnectionGUID: MVWRsx8WSWyqh7gkZHvcmA==
X-CSE-MsgGUID: 7iJv4yTDREaLrJc8NRM3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78014704"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78014704"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 20:03:18 -0700
X-CSE-ConnectionGUID: Sv8E1vUoToelLFwf68lTKw==
X-CSE-MsgGUID: qK/uc7oDReiCgV6rL5rrEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237830537"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Apr 2026 20:03:16 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHCFd-000000008Qj-3z3Y;
	Mon, 27 Apr 2026 03:03:13 +0000
Date: Mon, 27 Apr 2026 11:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 90/90]
 drivers/ufs/core/ufshcd.c:2294 ufshcd_hba_capabilities() warn: missing error
 code? 'err'
Message-ID: <202604271024.4NqzRoy9-lkp@intel.com>
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
head:   60204d422ab64b04f22d60b06861bc9134aeab5e
commit: 996bbaea824f317c30977c4967f84b10feb3cf40 [90/90] FROMGIT: scsi: ufs: core: Introduce multi-circular queue capability
:::::: branch date: 2 days ago
:::::: commit date: 3 years, 1 month ago
config: arm64-randconfig-r073-20260426 (https://download.01.org/0day-ci/archive/20260427/202604271024.4NqzRoy9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604271024.4NqzRoy9-lkp@intel.com/

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
