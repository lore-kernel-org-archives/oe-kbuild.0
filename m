Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501296;
	b=wMAWycI5rXShdlMLFit246+lA6um3c6i+OX02P42Uh+pK4EgBnaP030yo0sEswLAtoDp
	 bnnTChCuEttRJmf5fMLX+fgyUSaWX1D6GRznU4uq+FMd3Rcf26ERnM72QBb1KqBOiMW0i
	 BKBWbgsBniMOXkl/WgV6acxLIyEuxaGA3ViMZin873oVk8errhAdSgGvanpwPIqFJfIvM
	 9Jomnce6vqhtx4veEwrxNCWwIEb8UyUaV8bb17k1IwFuAF6G0MPR0iLtoEwSQ82FTui5E
	 NaAfw3LwdCwU8qbycQz1rUQaEMRi1QQYvOP0PfEjquteQ+LoiW5tSLDigdgpCUjbNDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501296;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IjZYoClHtJ7mGOibKG9I4VRm8t7MHySlxp9SRO+OBpE=;
	b=o7ubxpoJJiLUnatsnzFSeVUEIsIY8X66GJi/BfK+3Gxn5uT3QaB8XfKkUNJyMcVlsJMc
	 w68WuVmrftLvF4GrFz1f9MbxR77AzowA5/yQJwibpn6EWdryWqqquvuVEv+6sS/TVC+UP
	 0dfSmyn13RJ62P9A2Df9kVUxLSD00hBkewyN3eorhoBcg/UT3sq+HoY8MYEue9JuihMTa
	 pRvAfeBt4f89h91gcDX0oPmzFh+jVEdDAWRmyv/taZvHdnRvQYA7T7UcFRmAn18OAQN86
	 8iO92O8bHm4t+Qu+3OW+MAe1Q7tp5hcGkeipe3lCzgY8pvmeMoMyvmfRbEEPc7DmjmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ta+sgQNS;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3684360A260F
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 16:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3684360A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ta+sgQNS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794501296; x=1826037296;
  h=date:from:to:cc:subject:message-id;
  bh=oCKfFDiOuQ7vlHEz0A4ISoa3rF4ZxtVktC9IhlK/x7w=;
  b=Ta+sgQNSNt7YGEm91r3GHWbeElnCrR6chTTkyyMF1gC+4q88hvA2eRAI
   Pgz6aKEkPMMspRBM8sFF/Mb7lqcMIwTK4dQ0CUPZ5RZbCL4AhsWJLvpJs
   TXf13GTOVUhMWYmUexrAmWJMG/onKWr6sQaSA8yEb6lTeKGdYJhzhqdtF
   EBYdrIjSigThKRk8d+lkdUFxok43DLcRzQIDfdNwkKkmTamR2GE9iuuhA
   Dp522bjb+4BvDwluTPqjb3wZ30K6GsJLWLXk8n2XE+lXB0TjUL0zmUDyW
   FfEzG+ackWR4af+II+Z1wunj8F6WGRd78e5KnjY8VTCaw4m8ZknhkydPW
   w==;
X-CSE-ConnectionGUID: 5EzASbVARTubqiWwZ54atQ==
X-CSE-MsgGUID: 3JFbXUN3RZOGQhFJ7JzDSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3316901"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3316901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:34:56 -0800
X-CSE-ConnectionGUID: n+61t7zyTH2kMyf0oNBdUA==
X-CSE-MsgGUID: w9o++B3CRly4E3lcyBIc5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8559565"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 12 Nov 2026 08:34:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRXlE-000000000v1-1fDo;
	Thu, 12 Nov 2026 16:34:52 +0000
Date: Thu, 12 Nov 2026 17:33:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thermal:thermal/sensor-aggregation 33/34]
 drivers/thermal/testing/thermal_aggregation_test.c:268
 aggregation_registration_failure_test() warn: passing zero to 'PTR_ERR'
Message-ID: <202611121720.ftygM0CU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/sensor-aggregation
head:   6f29b91e3c168a28dd44a3e59e29b030a0974f7e
commit: f9f49656cae08c1b61f553fe67982ccb6b0de63c [33/34] thermal: testing: Add KUnit coverage for zone aggregation
:::::: branch date: 27 hours ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121720.ftygM0CU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611121720.ftygM0CU-lkp@intel.com/

New smatch warnings:
drivers/thermal/testing/thermal_aggregation_test.c:268 aggregation_registration_failure_test() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/thermal/testing/thermal_aggregation_test.c:273 aggregation_registration_failure_test() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +268 drivers/thermal/testing/thermal_aggregation_test.c

f9f49656cae08c Daniel Lezcano 2026-11-10  259  
f9f49656cae08c Daniel Lezcano 2026-11-10  260  static void aggregation_registration_failure_test(struct kunit *test)
f9f49656cae08c Daniel Lezcano 2026-11-10  261  {
f9f49656cae08c Daniel Lezcano 2026-11-10  262  	struct aggregation_fixture *fixture = test->priv;
f9f49656cae08c Daniel Lezcano 2026-11-10  263  	struct thermal_zone_device_ops ops = { .set_trips = aggregation_set_trips };
f9f49656cae08c Daniel Lezcano 2026-11-10  264  	struct thermal_zone_device *tz;
f9f49656cae08c Daniel Lezcano 2026-11-10  265  
f9f49656cae08c Daniel Lezcano 2026-11-10  266  	tz = thermal_zone_device_register_with_trips("kunit-rejected", NULL, 0, NULL,
f9f49656cae08c Daniel Lezcano 2026-11-10  267  						     &ops, &fixture->params, 0, 0);
f9f49656cae08c Daniel Lezcano 2026-11-10 @268  	KUNIT_EXPECT_EQ(test, PTR_ERR(tz), -EINVAL);
f9f49656cae08c Daniel Lezcano 2026-11-10  269  	fixture->entries[0].coefficient = 1000;
f9f49656cae08c Daniel Lezcano 2026-11-10  270  	tz = thermal_zone_device_register_with_trips("kunit-partial", NULL, 0, NULL,
f9f49656cae08c Daniel Lezcano 2026-11-10  271  						     &aggregation_destination_ops,
f9f49656cae08c Daniel Lezcano 2026-11-10  272  						     &fixture->params, 0, 0);
f9f49656cae08c Daniel Lezcano 2026-11-10  273  	KUNIT_EXPECT_EQ(test, PTR_ERR(tz), -EINVAL);
f9f49656cae08c Daniel Lezcano 2026-11-10  274  	KUNIT_EXPECT_EQ(test, fixture->entries[1].coefficient, 0);
f9f49656cae08c Daniel Lezcano 2026-11-10  275  }
f9f49656cae08c Daniel Lezcano 2026-11-10  276  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
