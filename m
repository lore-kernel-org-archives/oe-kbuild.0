Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98D331222
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jun 2026 23:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391947; cv=none; b=Kb+3M+a+/hwJVRetT+qxlADXmvtcbsZ01hOdnK28NuDt98mWvQO4I1nqNMQRiPy0MkwxtfwGkHS1CBiTDcdeiW1T0WaaJ3zwD5kHBEKxZP/3G1cXykfQgP2/CDcNLGyHj5UPordJsfMyhIZrVMmyyiXiD3hvYaqLp9bmNPNuyGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391947; c=relaxed/simple;
	bh=JXgAuqPm0L03ZD5bMxobKFYUJjpBPqn+6zj7AkO9v0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MfT5uR3dFZdTRx+eOq5sFjj9uAFU46IKR+uKgMW8cABCt3CVfynDwES+DWX8OghWJB+35xnPnrZ63cId1G+Lq6xbJMbkGetr6CdAa/2dqWK61kb6vjStoB3OJA5YRgguO6heU1OrSGILJD6rLVhknLAm3fV208LS1sUgO9qT3sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+k4sdiV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+k4sdiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781391946; x=1812927946;
  h=date:from:to:cc:subject:message-id;
  bh=JXgAuqPm0L03ZD5bMxobKFYUJjpBPqn+6zj7AkO9v0c=;
  b=e+k4sdiVY72sQDZjIYYQkI86e3Jq2UTTsgN3n5Y0aUUN1zNFvuo7DFKT
   rgFsx7lcwQ2jRlpXlDTp9hBplu7jE/8V+GK3B2iEpw0ssDOKAVIRHvyX5
   kh8aMh2LfPbJLHH7aEur4+dyubdw4DMdcx/TgW3iVNbPMko983vLV4awe
   qK5/fgJwtwKE5JkXIne+pfAf7hsdsMwDJWudlGTAbJunYd0x50jDQxQV9
   R0oE9/IPn2mFSzJlL9tC0XKbpqWJadwYbroUEs0nK8Nc1ZUkdAsRL4Mne
   naeOZQRySpiWXB/QBwraKU00oKlIusj6O22cjdgxrphFb7hAp80n4tcUF
   A==;
X-CSE-ConnectionGUID: VgKhZsOiS9iORQkVpEZTDA==
X-CSE-MsgGUID: XgY2n6WjRmuB4jd8umnquQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="92744141"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="92744141"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 16:05:45 -0700
X-CSE-ConnectionGUID: mPwvw5ufQIqnxwjwr6DlIQ==
X-CSE-MsgGUID: i4L+dKkOSQiHiuyVmmAE5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="246020077"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2026 16:05:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYXQ5-00000000QLm-2cN3;
	Sat, 13 Jun 2026 23:05:41 +0000
Date: Sun, 14 Jun 2026 07:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13470/13763]
 drivers/hid/hid-nintendo.c:2435 joycon_read_info() warn: '%pM' cannot be
 followed by 'U'
Message-ID: <202606140707.plCJDajt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 7cde5613006c1a1192efe3da3572d35a2fa5fbfe [13470/13763] HID: nintendo: Use %pM format specifier for MAC addresses
:::::: branch date: 29 hours ago
:::::: commit date: 35 hours ago
config: nios2-randconfig-r072-20260613 (https://download.01.org/0day-ci/archive/20260614/202606140707.plCJDajt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606140707.plCJDajt-lkp@intel.com/

smatch warnings:
drivers/hid/hid-nintendo.c:2435 joycon_read_info() warn: '%pM' cannot be followed by 'U'

vim +2435 drivers/hid/hid-nintendo.c

08ebba5c270350 Daniel J. Ogorchock 2021-09-11  2413  
294a828759d041 Daniel J. Ogorchock 2021-09-11  2414  static int joycon_read_info(struct joycon_ctlr *ctlr)
1425247383c562 Daniel J. Ogorchock 2021-09-11  2415  {
1425247383c562 Daniel J. Ogorchock 2021-09-11  2416  	int ret;
1425247383c562 Daniel J. Ogorchock 2021-09-11  2417  	int i;
1425247383c562 Daniel J. Ogorchock 2021-09-11  2418  	int j;
1425247383c562 Daniel J. Ogorchock 2021-09-11  2419  	struct joycon_subcmd_request req = { 0 };
1425247383c562 Daniel J. Ogorchock 2021-09-11  2420  	struct joycon_input_report *report;
1425247383c562 Daniel J. Ogorchock 2021-09-11  2421  
1425247383c562 Daniel J. Ogorchock 2021-09-11  2422  	req.subcmd_id = JC_SUBCMD_REQ_DEV_INFO;
b73bc6a51f0c00 Vicki Pfau          2025-10-06  2423  	ret = joycon_send_subcmd(ctlr, &req, 0, 2 * HZ);
1425247383c562 Daniel J. Ogorchock 2021-09-11  2424  	if (ret) {
1425247383c562 Daniel J. Ogorchock 2021-09-11  2425  		hid_err(ctlr->hdev, "Failed to get joycon info; ret=%d\n", ret);
1425247383c562 Daniel J. Ogorchock 2021-09-11  2426  		return ret;
1425247383c562 Daniel J. Ogorchock 2021-09-11  2427  	}
1425247383c562 Daniel J. Ogorchock 2021-09-11  2428  
1425247383c562 Daniel J. Ogorchock 2021-09-11  2429  	report = (struct joycon_input_report *)ctlr->input_buf;
1425247383c562 Daniel J. Ogorchock 2021-09-11  2430  
1425247383c562 Daniel J. Ogorchock 2021-09-11  2431  	for (i = 4, j = 0; j < 6; i++, j++)
4ff5b10840a88e Daniel J. Ogorchock 2021-09-11  2432  		ctlr->mac_addr[j] = report->subcmd_reply.data[i];
1425247383c562 Daniel J. Ogorchock 2021-09-11  2433  
7cde5613006c1a Andy Shevchenko     2026-06-03  2434  	ctlr->mac_addr_str = devm_kasprintf(&ctlr->hdev->dev, GFP_KERNEL, "%pMU",
7cde5613006c1a Andy Shevchenko     2026-06-03 @2435  					    ctlr->mac_addr);
1425247383c562 Daniel J. Ogorchock 2021-09-11  2436  	if (!ctlr->mac_addr_str)
1425247383c562 Daniel J. Ogorchock 2021-09-11  2437  		return -ENOMEM;
1425247383c562 Daniel J. Ogorchock 2021-09-11  2438  	hid_info(ctlr->hdev, "controller MAC = %s\n", ctlr->mac_addr_str);
1425247383c562 Daniel J. Ogorchock 2021-09-11  2439  
94f18bb1994591 Ryan McClelland     2023-12-04  2440  	/*
94f18bb1994591 Ryan McClelland     2023-12-04  2441  	 * Retrieve the type so we can distinguish the controller type
94f18bb1994591 Ryan McClelland     2023-12-04  2442  	 * Unfortantly the hdev->product can't always be used due to a ?bug?
94f18bb1994591 Ryan McClelland     2023-12-04  2443  	 * with the NSO Genesis controller. Over USB, it will report the
94f18bb1994591 Ryan McClelland     2023-12-04  2444  	 * PID as 0x201E, but over bluetooth it will report the PID as 0x2017
94f18bb1994591 Ryan McClelland     2023-12-04  2445  	 * which is the same as the NSO SNES controller. This is different from
94f18bb1994591 Ryan McClelland     2023-12-04  2446  	 * the rest of the controllers which will report the same PID over USB
94f18bb1994591 Ryan McClelland     2023-12-04  2447  	 * and bluetooth.
94f18bb1994591 Ryan McClelland     2023-12-04  2448  	 */
4ff5b10840a88e Daniel J. Ogorchock 2021-09-11  2449  	ctlr->ctlr_type = report->subcmd_reply.data[2];
94f18bb1994591 Ryan McClelland     2023-12-04  2450  	hid_dbg(ctlr->hdev, "controller type = 0x%02X\n", ctlr->ctlr_type);
294a828759d041 Daniel J. Ogorchock 2021-09-11  2451  
1425247383c562 Daniel J. Ogorchock 2021-09-11  2452  	return 0;
1425247383c562 Daniel J. Ogorchock 2021-09-11  2453  }
1425247383c562 Daniel J. Ogorchock 2021-09-11  2454  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
