Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D43374758
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 17:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148148; cv=none; b=K+9LaSZIZOGs/Go0Tw89fz1pNx1sxvKep5ZQCauN0fv4CZf3ywypornsj4M/mV+MjZ2Uh8QTUxY4og1jlds846O6Mt80R0VDLEOCRlJtwTE4PGw78RMUiS0NRM6/aoYCi/7Jc5O+vRz4OmP0CS4OIsjN+uYMxClRPwrLyQRvTEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148148; c=relaxed/simple;
	bh=nQOoXj/EbUlC9RWseXuOmW8opEhCCnDdHHNIcrlD3Vw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h4kEwTKseqK7RQqw+YqvlctBglZ0niMGdFjaNGUu6hB3Rnjqo5NcHycatH7tWF1gWhe/2wm1MBeJXjEb2CYSTIgKHYeUOMrSHWA61G4duPfzEz9dOYobCe3TXDbVHf3jdpYOtijeBhhCYqb5/bQ4ArxTW4njff9mlS2EuKuaGMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcXsDKXP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcXsDKXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789148144; x=1820684144;
  h=date:from:to:cc:subject:message-id;
  bh=nQOoXj/EbUlC9RWseXuOmW8opEhCCnDdHHNIcrlD3Vw=;
  b=EcXsDKXP9YwIAZgYYmMKnZRJHJJn87HbegZqsZb6lSJlUOYd1wxLu01T
   TZxRrZPKr2nvG5aqAWCTim4ldoBgavuOehWhrnJiImgtIcDvsWWa7fbi4
   BXRCTtgqqzDkhTgHj+DLNNFEnOBp6IrOxRmZW+4x25Qp1c2TNoHSzb5Pp
   rqBqsj5QgleJpPWM3e+vJY9ZfMcckbFchWAiqNdfXmuC6XurOjIPnfWUr
   eSPKeOcU1dFrhNnQrMYI8YqypRHE+BaBzIj+gSGogg2T26cWyv4FBS5M0
   yAJ4h8Iuqft/7KeOCTNFXDl7wftnHmL6XZyUAwBW9czmJuAONuRMBBbu1
   A==;
X-CSE-ConnectionGUID: ljtcKt+KTriKHRc3+LM6yA==
X-CSE-MsgGUID: gTU85oOuRHy6QZ4nZO9Alg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="88755163"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="88755163"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 10:35:39 -0700
X-CSE-ConnectionGUID: rJkse6rtQbmm6swbqdmFNg==
X-CSE-MsgGUID: rrXdyGwTTB+S9czJgiVfXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268303791"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2026 10:35:38 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x559z-000000000qT-1MGn;
	Fri, 11 Sep 2026 17:35:35 +0000
Date: Fri, 11 Sep 2026 19:35:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/qce/core.c:294 qce_runtime_suspend() warn:
 'qce->bus' from clk_prepare_enable() not released on lines: 291.
Message-ID: <202609111916.QWJzYQm7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Udit Tiwari <udit.tiwari@oss.qualcomm.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: 6f5569203bb6fff31234736a16bfe34bbbd1818b crypto: qce - Add runtime PM and interconnect bandwidth scaling support
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: parisc-randconfig-r072-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111916.QWJzYQm7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6f5569203bb6 ("crypto: qce - Add runtime PM and interconnect bandwidth scaling support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609111916.QWJzYQm7-lkp@intel.com/

smatch warnings:
drivers/crypto/qce/core.c:294 qce_runtime_suspend() warn: 'qce->bus' from clk_prepare_enable() not released on lines: 291.
drivers/crypto/qce/core.c:294 qce_runtime_suspend() warn: 'qce->core' from clk_prepare_enable() not released on lines: 291.
drivers/crypto/qce/core.c:294 qce_runtime_suspend() warn: 'qce->iface' from clk_prepare_enable() not released on lines: 291.

vim +294 drivers/crypto/qce/core.c

ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  276  
6f5569203bb6ff Udit Tiwari       2026-07-29  277  static int qce_runtime_suspend(struct device *dev)
6f5569203bb6ff Udit Tiwari       2026-07-29  278  {
6f5569203bb6ff Udit Tiwari       2026-07-29  279  	struct qce_device *qce = dev_get_drvdata(dev);
6f5569203bb6ff Udit Tiwari       2026-07-29  280  	int ret;
6f5569203bb6ff Udit Tiwari       2026-07-29  281  
6f5569203bb6ff Udit Tiwari       2026-07-29  282  	clk_disable_unprepare(qce->core);
6f5569203bb6ff Udit Tiwari       2026-07-29  283  	clk_disable_unprepare(qce->iface);
6f5569203bb6ff Udit Tiwari       2026-07-29  284  	clk_disable_unprepare(qce->bus);
6f5569203bb6ff Udit Tiwari       2026-07-29  285  
6f5569203bb6ff Udit Tiwari       2026-07-29  286  	ret = icc_set_bw(qce->mem_path, 0, 0);
6f5569203bb6ff Udit Tiwari       2026-07-29  287  	if (ret) {
6f5569203bb6ff Udit Tiwari       2026-07-29  288  		clk_prepare_enable(qce->bus);
6f5569203bb6ff Udit Tiwari       2026-07-29  289  		clk_prepare_enable(qce->iface);
6f5569203bb6ff Udit Tiwari       2026-07-29  290  		clk_prepare_enable(qce->core);
6f5569203bb6ff Udit Tiwari       2026-07-29  291  		return ret;
6f5569203bb6ff Udit Tiwari       2026-07-29  292  	}
6f5569203bb6ff Udit Tiwari       2026-07-29  293  
6f5569203bb6ff Udit Tiwari       2026-07-29 @294  	return 0;
6f5569203bb6ff Udit Tiwari       2026-07-29  295  }
6f5569203bb6ff Udit Tiwari       2026-07-29  296  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
