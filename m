Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E5264FBD
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274774; cv=none; b=lKR8c9ckGlDIBj9jK5I8eeIXdczKJ2k2xAmxVv0l8JxGthWyXiCytDwyoBP5Av9AnsanjEqkn6WTNDR6EmHN6CsZtibnTRs50Ta1mEeAgEIJdYDF0bI+yKM7wmGGUuD9bOeLQgtcz58Hh5bNtbR/GBh6fCH8K3e3L+k4fzAPJaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274774; c=relaxed/simple;
	bh=o6muOYag2Afd559dXe5BI6U1Gkl0vDVEn1zcm6AUaS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=beLdKPq5Koqx0cdd5KY0uoaIRhT0rlj67XKCe6CHx0NStf4Pq/TDX8Vf3mw/C8jM7amYVwGK2t4FiEAM5XFWzLPMh9ce8nTLDFoD2xtcEepMWWErq0o2H3Y4Nk5aDW+kCBbzGKizk3K9YKjH67n8Bl1KaCBk9XCMtFaP66sie1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kB7ysfAf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kB7ysfAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765274771; x=1796810771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6muOYag2Afd559dXe5BI6U1Gkl0vDVEn1zcm6AUaS4=;
  b=kB7ysfAf48X00TMjD5c3vGB1hW7QItYnjdCycr8ZGXe5czovCx/w5vJ4
   MHcfmA7Rxc2+uN6T4OQbe9QU/0kyGZtBybQSEJE1HTl1dXSmOrjwaVyOw
   TXITQEo+1G8Gs1LbEejdMYYsrBdw0dObbdz17feYxxiij9L6JW3KSc5H/
   b2EPF2QBXK2DeV8M04l+01FFs1n6ZcY8c1JBDU00cfEX7rlSxxuDUAaOq
   FBEokR76sqQX7vAGs9UBsfWIwKVaQyIUffJmrBggQ2lYnqnYHR+d3tXDL
   ufqRxhl3HOxkEm4/j683bzdG4xj1TuZPnadfs2Mw7vAAMqSTkvPaFHrBu
   w==;
X-CSE-ConnectionGUID: bsezqfuCQxKxJJLu4IqTaw==
X-CSE-MsgGUID: RQcvJoEoSKmeNQ6AAM9bQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78691812"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="78691812"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 02:05:28 -0800
X-CSE-ConnectionGUID: et5/tWfjRT+O/55g0tummA==
X-CSE-MsgGUID: 14VFpAT8QT6D1v2nEjKwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="196086057"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2025 02:05:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSuay-000000001dJ-3A37;
	Tue, 09 Dec 2025 10:05:24 +0000
Date: Tue, 9 Dec 2025 18:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13658/13721]
 drivers/clk/qcom/nsscc-ipq5424.c:1339:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512091802.WtXCOnXL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/nsscc-ipq5424.c:1339:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c75caf76ed86bbc15a72808f48f8df1608a0886c
commit: aa787fe758acf60add317f09727732b220be314c [13658/13721] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
:::::: branch date: 8 hours ago
:::::: commit date: 35 hours ago
config: parisc-randconfig-r113-20251208 (https://download.01.org/0day-ci/archive/20251209/202512091802.WtXCOnXL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091802.WtXCOnXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512091802.WtXCOnXL-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_probe':
>> (.text+0x490): undefined reference to `devm_backlight_device_register'

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/nsscc-ipq5424.c:1339:1: sparse: sparse: bad integer constant expression
>> drivers/clk/qcom/nsscc-ipq5424.c:1339:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/nsscc-ipq5424.c:1340:1: sparse: sparse: bad integer constant expression
>> drivers/clk/qcom/nsscc-ipq5424.c:1340:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1339 drivers/clk/qcom/nsscc-ipq5424.c

fd0b632efbbdf4 Luo Jie 2025-10-14  1338  
fd0b632efbbdf4 Luo Jie 2025-10-14 @1339  MODULE_DESCRIPTION("Qualcomm Technologies, Inc. NSSCC IPQ5424 Driver");
fd0b632efbbdf4 Luo Jie 2025-10-14 @1340  MODULE_LICENSE("GPL");

:::::: The code at line 1339 was first introduced by commit
:::::: fd0b632efbbdf427678a7a880abeb828bc4633fe clk: qcom: Add NSS clock controller driver for IPQ5424

:::::: TO: Luo Jie <quic_luoj@quicinc.com>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
