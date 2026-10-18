Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5533A6EEE
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792346519; cv=none; b=KZWL0f6h8M/WkvPdCf55o89FldNk89sDQ2IM5AScTauXz4GZ86eDwYRnexfitpJbDbCIWiQ/UBBh7kJezb32n9mHyqEOJ7cvwnVOrXF+mpdRNha9Bh0tIndPhgRPZIr6et4ObZL60NbzQVXJOoDN010freKRaTTG0ehpN8pqfQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792346519; c=relaxed/simple;
	bh=EBU/8ZSsPugcXeSrm5a8bUyx8JtCmo+7RCrLuvh5nv8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n3olgQnF4p8DWAt9hycgv3mb7nqCcovz7W2FqRqrZcrbrzPHkrUtpIscdYZGUldGtcHrU3XZuWK6jdUxXq0WSHnfdnWTiB71uicUC5G9K8cQRQ+VPbOcBIiAcvrArVw7YvvlFe0GBNy9nmHJNrSfb4QUY6hKqTZ+sv26x88A7/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXH3e1M3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXH3e1M3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792346517; x=1823882517;
  h=date:from:to:cc:subject:message-id;
  bh=EBU/8ZSsPugcXeSrm5a8bUyx8JtCmo+7RCrLuvh5nv8=;
  b=CXH3e1M3lG6TewNozcYMV6HjnbpZjyze2nYtXEayu7J2BWF2YNyJcIT6
   jdA07XrlGhTFcQAVt6iTQaujTdWKrdIVdt+y5xcXq5a2GbmTm8RNKl5AS
   /dc/ngrp490Hh8GOI+R6/3TXLlX8GnwCMlDuJJOv7ukhP9dzFmnLXfEv8
   4wkQCVdY90vIsoWStdsQIeXYbfukoiRc5LPvqvB3xLk+gIxu1Yted6SQw
   ouhRia9ou8M7aJL7hOVw+4RS5Lm+PeGe1TEMm6W7PDQLQuJ417wtDcfKF
   MfvT3EhhMnbskZ5PT1KaWoD3bJfF9cWkjfiB2d2vAiVulOh+avi53W0C7
   w==;
X-CSE-ConnectionGUID: 2DdiXj61QAK0i9IAdZiFuA==
X-CSE-MsgGUID: +b7sFN56SYW5sKK+a57/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1039968"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1039968"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 11:01:55 -0700
X-CSE-ConnectionGUID: o3XWxBwoQ5+tSSUJWSM+pg==
X-CSE-MsgGUID: fMyGg7IDRxqYRNWsqFDCFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2368367"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2026 11:01:54 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIVCh-000000005CV-1WTC;
	Sun, 18 Oct 2026 18:01:51 +0000
Date: Sun, 18 Oct 2026 20:01:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hid:for-7.4/lenovo 21/21]
 drivers/hid/hid-lenovo-go-s.c:1528 cfg_setup() warn: can 'drvdata' even be
 NULL?
Message-ID: <202610181941.eX9T2La5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-input@vger.kernel.org
TO: "Derek J. Clark" <derekjohn.clark@gmail.com>
CC: Jiri Kosina <jikos@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/lenovo
head:   d3c157b4cdffd14604c2d8435e279761c511bac2
commit: d3c157b4cdffd14604c2d8435e279761c511bac2 [21/21] HID: hid-lenovo-go-s: Use devm_kzalloc for drvdata
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r2202-20261018 (https://download.01.org/0day-ci/archive/20261018/202610181941.eX9T2La5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610181941.eX9T2La5-lkp@intel.com/

smatch warnings:
drivers/hid/hid-lenovo-go-s.c:1528 cfg_setup() warn: can 'drvdata' even be NULL?

vim +/drvdata +1528 drivers/hid/hid-lenovo-go-s.c

be6d7dbb368ba8 Derek J. Clark   2026-03-10  1519  
a23f3497bf208c Derek J. Clark   2026-03-10  1520  static void cfg_setup(struct work_struct *work)
a23f3497bf208c Derek J. Clark   2026-03-10  1521  {
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1522  	struct delayed_work *dwork = container_of(work, struct delayed_work, work);
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1523  	struct gos_cfg_drvdata *drvdata = container_of(dwork, struct gos_cfg_drvdata,
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1524  						       gos_cfg_setup);
8f456881ba40a0 Derek J. Clark   2026-09-14  1525  	bool gp_registered, rgb_registered;
a23f3497bf208c Derek J. Clark   2026-03-10  1526  	int ret;
a23f3497bf208c Derek J. Clark   2026-03-10  1527  
d3c157b4cdffd1 Derek J. Clark   2026-09-14 @1528  	if (!drvdata)
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1529  		return;
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1530  
5153f1aa6cd529 Derek J. Clark   2026-03-10  1531  	/* MCU */
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1532  	ret = mcu_property_out(drvdata->hdev, GET_MCU_ID, FEATURE_NONE, NULL, 0);
5153f1aa6cd529 Derek J. Clark   2026-03-10  1533  	if (ret) {
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1534  		dev_err(&drvdata->hdev->dev, "Failed to retrieve MCU ID: %i\n",
5153f1aa6cd529 Derek J. Clark   2026-03-10  1535  			ret);
5153f1aa6cd529 Derek J. Clark   2026-03-10  1536  		return;
5153f1aa6cd529 Derek J. Clark   2026-03-10  1537  	}
5153f1aa6cd529 Derek J. Clark   2026-03-10  1538  
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1539  	ret = mcu_property_out(drvdata->hdev, GET_VERSION, FEATURE_NONE, NULL, 0);
a23f3497bf208c Derek J. Clark   2026-03-10  1540  	if (ret) {
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1541  		dev_err(&drvdata->hdev->dev, "Failed to retrieve MCU Version: %i\n", ret);
a23f3497bf208c Derek J. Clark   2026-03-10  1542  		return;
a23f3497bf208c Derek J. Clark   2026-03-10  1543  	}
34a05773e81505 Derek J. Clark   2026-03-10  1544  
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1545  	ret = mcu_property_out(drvdata->hdev, GET_PL_TEST, TEST_TP_MFR, NULL, 0);
34a05773e81505 Derek J. Clark   2026-03-10  1546  	if (ret) {
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1547  		dev_err(&drvdata->hdev->dev,
34a05773e81505 Derek J. Clark   2026-03-10  1548  			"Failed to retrieve Touchpad Manufacturer: %i\n", ret);
34a05773e81505 Derek J. Clark   2026-03-10  1549  		return;
34a05773e81505 Derek J. Clark   2026-03-10  1550  	}
34a05773e81505 Derek J. Clark   2026-03-10  1551  
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1552  	ret = mcu_property_out(drvdata->hdev, GET_PL_TEST, TEST_TP_VER, NULL, 0);
34a05773e81505 Derek J. Clark   2026-03-10  1553  	if (ret) {
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1554  		dev_err(&drvdata->hdev->dev,
34a05773e81505 Derek J. Clark   2026-03-10  1555  			"Failed to retrieve Touchpad Firmware Version: %i\n", ret);
34a05773e81505 Derek J. Clark   2026-03-10  1556  		return;
34a05773e81505 Derek J. Clark   2026-03-10  1557  	}
34a05773e81505 Derek J. Clark   2026-03-10  1558  
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1559  	ret = mcu_property_out(drvdata->hdev, GET_PL_TEST, TEST_IMU_MFR, NULL, 0);
34a05773e81505 Derek J. Clark   2026-03-10  1560  	if (ret) {
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1561  		dev_err(&drvdata->hdev->dev,
34a05773e81505 Derek J. Clark   2026-03-10  1562  			"Failed to retrieve IMU Manufacturer: %i\n", ret);
34a05773e81505 Derek J. Clark   2026-03-10  1563  		return;
34a05773e81505 Derek J. Clark   2026-03-10  1564  	}
3524900cc571bd Matthew Schwartz 2026-04-20  1565  
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1566  	ret = mcu_property_out(drvdata->hdev, GET_GAMEPAD_CFG, FEATURE_OS_MODE,
3524900cc571bd Matthew Schwartz 2026-04-20  1567  			       NULL, 0);
3524900cc571bd Matthew Schwartz 2026-04-20  1568  	if (ret) {
d3c157b4cdffd1 Derek J. Clark   2026-09-14  1569  		dev_err(&drvdata->hdev->dev,
3524900cc571bd Matthew Schwartz 2026-04-20  1570  			"Failed to retrieve OS Mode: %i\n", ret);
3524900cc571bd Matthew Schwartz 2026-04-20  1571  		return;
3524900cc571bd Matthew Schwartz 2026-04-20  1572  	}
e69b64d3d75eb1 Derek J. Clark   2026-09-14  1573  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
