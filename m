Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DE11C0DF1
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Mar 2024 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711889310; cv=none; b=EnJb0b0o3wJYhaMKYNZNFSQwzQV3+SXrzopgpMNdBugqyrFTI7MlFvqNlgYbEHBOav4paBWDqB4RSedHiGSCELeV4IRfg8PDOnlqPsZ6nVRY2Xv8jbwPbIB2Jp56CtAjV4UQBKSOLymULqA0BnIowL/mSaD8+H3aKtkOWXqzZgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711889310; c=relaxed/simple;
	bh=o7cDWPbbxYxyRO267ncs7NS7bYFynNP3lMKmhEwrphw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pbLAV+50hXfaM5eeCp6TMMAHVuejN5WhF0GLsse94tuwPLtEPMnFzKck1CcsNq0cEJgBQud1pSB/TQUPMIMZkRHroIksUi+vKltRVOhy4BNQYJ24zogWp3Tst6bglUEKVEntoBHiJjjIMn07y/lhSrnQGUTcyKySUHHlKPAOPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8JrNh2C; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8JrNh2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711889308; x=1743425308;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o7cDWPbbxYxyRO267ncs7NS7bYFynNP3lMKmhEwrphw=;
  b=R8JrNh2CG0pOYL8hDOmmCse4iuitRiQCGRooLDd4Au5mYO0qE3L75DfT
   gIk2sssxWl+RKM/FayaxcLjQDKQNyzOnCNAcDjOWVm1ZgBs2Tt0O7SIi8
   IizW8hul1acfqlHyDeNMgWeNbx0TafzUqTr5wIQV/l3E4KKVyCj5tspy9
   44TgGN1YWxF5VxibKU0C33D0wePA7bH2vJCFgsde9lcVncefd+kF//2dC
   V7pqBqEXWtrlO8kuN7kBVyF020OLSdtGHCUcax921kxsodyA4pKGeY1iC
   TNGahGeC8P3CkHVaoIfJojOrDZNGS8pZAEFyc0fsXD8zon5bCdFzN90Bn
   A==;
X-CSE-ConnectionGUID: p70PGfXtQdKlMRj/pWkfhQ==
X-CSE-MsgGUID: rrbodacYTNKm7LOmEkTJHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="24512813"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="24512813"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 05:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="22130540"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2024 05:48:26 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqubo-00016o-1E;
	Sun, 31 Mar 2024 12:48:24 +0000
Date: Sun, 31 Mar 2024 20:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1128/2532] drivers/pwm/core.c:1530 pwm_put()
 warn: variable dereferenced before check 'pwm' (see line 1528)
Message-ID: <202403312030.QYCgiAey-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: d60bc2995732489766cbe650fc367e036ff6a0e0 [1128/2532] pwm: Add a struct device to struct pwm_chip
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/archive/20240331/202403312030.QYCgiAey-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403312030.QYCgiAey-lkp@intel.com/

smatch warnings:
drivers/pwm/core.c:1530 pwm_put() warn: variable dereferenced before check 'pwm' (see line 1528)

vim +/pwm +1530 drivers/pwm/core.c

8138d2ddbcca2a Thierry Reding   2012-03-26  1521  
8138d2ddbcca2a Thierry Reding   2012-03-26  1522  /**
8138d2ddbcca2a Thierry Reding   2012-03-26  1523   * pwm_put() - release a PWM device
8138d2ddbcca2a Thierry Reding   2012-03-26  1524   * @pwm: PWM device
8138d2ddbcca2a Thierry Reding   2012-03-26  1525   */
8138d2ddbcca2a Thierry Reding   2012-03-26  1526  void pwm_put(struct pwm_device *pwm)
8138d2ddbcca2a Thierry Reding   2012-03-26  1527  {
d60bc299573248 Uwe Kleine-König 2024-03-17 @1528  	struct pwm_chip *chip = pwm->chip;
d60bc299573248 Uwe Kleine-König 2024-03-17  1529  
8138d2ddbcca2a Thierry Reding   2012-03-26 @1530  	if (!pwm)
8138d2ddbcca2a Thierry Reding   2012-03-26  1531  		return;
8138d2ddbcca2a Thierry Reding   2012-03-26  1532  
8138d2ddbcca2a Thierry Reding   2012-03-26  1533  	mutex_lock(&pwm_lock);
8138d2ddbcca2a Thierry Reding   2012-03-26  1534  
8138d2ddbcca2a Thierry Reding   2012-03-26  1535  	if (!test_and_clear_bit(PWMF_REQUESTED, &pwm->flags)) {
e50d3523ff4564 Sachin Kamat     2012-08-10  1536  		pr_warn("PWM device already freed\n");
8138d2ddbcca2a Thierry Reding   2012-03-26  1537  		goto out;
8138d2ddbcca2a Thierry Reding   2012-03-26  1538  	}
8138d2ddbcca2a Thierry Reding   2012-03-26  1539  
d60bc299573248 Uwe Kleine-König 2024-03-17  1540  	if (chip->ops->free)
8138d2ddbcca2a Thierry Reding   2012-03-26  1541  		pwm->chip->ops->free(pwm->chip, pwm);
8138d2ddbcca2a Thierry Reding   2012-03-26  1542  
8138d2ddbcca2a Thierry Reding   2012-03-26  1543  	pwm->label = NULL;
8138d2ddbcca2a Thierry Reding   2012-03-26  1544  
d60bc299573248 Uwe Kleine-König 2024-03-17  1545  	put_device(&chip->dev);
d60bc299573248 Uwe Kleine-König 2024-03-17  1546  
d60bc299573248 Uwe Kleine-König 2024-03-17  1547  	module_put(chip->owner);
8138d2ddbcca2a Thierry Reding   2012-03-26  1548  out:
8138d2ddbcca2a Thierry Reding   2012-03-26  1549  	mutex_unlock(&pwm_lock);
8138d2ddbcca2a Thierry Reding   2012-03-26  1550  }
8138d2ddbcca2a Thierry Reding   2012-03-26  1551  EXPORT_SYMBOL_GPL(pwm_put);
8138d2ddbcca2a Thierry Reding   2012-03-26  1552  

:::::: The code at line 1530 was first introduced by commit
:::::: 8138d2ddbcca2a100482dac390133f83c5a60f94 pwm: Add table-based lookup for static mappings

:::::: TO: Thierry Reding <thierry.reding@avionic-design.de>
:::::: CC: Thierry Reding <thierry.reding@avionic-design.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
