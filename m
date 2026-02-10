Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC1A17BB21
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 07:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706890; cv=none; b=Lq7xOHN3qDliGZ2SzLWFsEdCGvgkwW9M/xSt6fUu4YxpwGD0jHotAIHjatFuZfU6lQQLu/qZ7CkrZnwg8IYkq9ZKdxF6qz5E9MFhKacQr8lqrG4OxZNymZ3eqZLenwX/BxbgZtU0Z6TO75EKYUQLUBsiIKi+q5TziodU67nE1gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706890; c=relaxed/simple;
	bh=sjwQY7r+H4aPbSxwE1LOaV2cyQbsOVjiaY3Da1GSmcU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SGyAOUOP1tWGxw4nuyToJLzxbAA7AEvDqVLhCIfAXB0c2D9aFSubMytTfCjOPO677jYKN4aOm3ZEmY8tsT2CDe8iTk9fSFCwLeTvptxTyB71az4LagIFSe8qg8w4fKpPkTuzHI8XQ7ikg5+y5N4gZvP7Yf/9gLqwrA1n1lzyfeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3/vzGuQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3/vzGuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770706889; x=1802242889;
  h=date:from:to:cc:subject:message-id;
  bh=sjwQY7r+H4aPbSxwE1LOaV2cyQbsOVjiaY3Da1GSmcU=;
  b=U3/vzGuQsz+lkqpL/Y2SpncX6JErGd/2TToktnEYHXI6L7eMrXDNrmDl
   gA5KUU/v3U/qTnivLwv1M9q768PKE1DsG8xsK4kqIxZf/7hczvIDSyMEa
   vlzhmuslVAI1VN2VKrBTDtOPxAmLx2FNMLSsaZm6n/h3bhqKJMlzUZjPy
   IDk506alHGEuxJKZJ2lMvedXICTlw+hzwec1i6P7NadHpsczlbqOEJNpD
   G3+dMM3SGEKKsQlg3dNs/K+JvfX3vNWOk1cg1ZWJWqcNuYOaTqELkZXHu
   sORH1VjA1+l+gSNguNUexPqu6WSTy1A/I9f5QKq0Ey6V/2Dz4ONQIsWCS
   g==;
X-CSE-ConnectionGUID: ptxSkfBZQIyPMfr909p+Uw==
X-CSE-MsgGUID: yQEhIqHWRdeZ/yL1sCbfug==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82557046"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82557046"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:01:28 -0800
X-CSE-ConnectionGUID: qrpo0LP5RROOIkyrCXqoTw==
X-CSE-MsgGUID: ZeP8QhkISFaN4Xe4FsCHBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="242443385"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Feb 2026 23:01:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vphkS-00000000ok2-112w;
	Tue, 10 Feb 2026 07:01:24 +0000
Date: Tue, 10 Feb 2026 15:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 301/334]
 drivers/platform/x86/toshiba_bluetooth.c:261 toshiba_bt_rfkill_probe() warn:
 'bt_dev->rfk' is an error pointer or valid
Message-ID: <202602101417.8r6ZtJHr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-acpi@vger.kernel.org
CC: linux-pm@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   8711f3ee7e5efcf1b795c80496b0fb68713e153a
commit: f70ea8e0b9b13e1e8f5a3f6a95280b36405770bc [301/334] platform/x86: toshiba_bluetooth: Convert ACPI driver to a platform one
:::::: branch date: 10 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-161-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101417.8r6ZtJHr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602101417.8r6ZtJHr-lkp@intel.com/

smatch warnings:
drivers/platform/x86/toshiba_bluetooth.c:261 toshiba_bt_rfkill_probe() warn: 'bt_dev->rfk' is an error pointer or valid

vim +261 drivers/platform/x86/toshiba_bluetooth.c

42b4e9ee3d1d3b Jes Sorensen      2009-12-16  230  
f70ea8e0b9b13e Rafael J. Wysocki 2026-02-09  231  static int toshiba_bt_rfkill_probe(struct platform_device *pdev)
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  232  {
f70ea8e0b9b13e Rafael J. Wysocki 2026-02-09  233  	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
84c0691e514539 Azael Avalos      2015-05-03  234  	struct toshiba_bluetooth_dev *bt_dev;
18b8696b66d790 Azael Avalos      2015-03-26  235  	int result;
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  236  
18b8696b66d790 Azael Avalos      2015-03-26  237  	result = toshiba_bluetooth_present(device->handle);
18b8696b66d790 Azael Avalos      2015-03-26  238  	if (result)
18b8696b66d790 Azael Avalos      2015-03-26  239  		return result;
18b8696b66d790 Azael Avalos      2015-03-26  240  
18b8696b66d790 Azael Avalos      2015-03-26  241  	pr_info("Toshiba ACPI Bluetooth device driver\n");
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  242  
84c0691e514539 Azael Avalos      2015-05-03  243  	bt_dev = kzalloc(sizeof(*bt_dev), GFP_KERNEL);
84c0691e514539 Azael Avalos      2015-05-03  244  	if (!bt_dev)
84c0691e514539 Azael Avalos      2015-05-03  245  		return -ENOMEM;
84c0691e514539 Azael Avalos      2015-05-03  246  	bt_dev->acpi_dev = device;
f70ea8e0b9b13e Rafael J. Wysocki 2026-02-09  247  
f70ea8e0b9b13e Rafael J. Wysocki 2026-02-09  248  	platform_set_drvdata(pdev, bt_dev);
84c0691e514539 Azael Avalos      2015-05-03  249  
84c0691e514539 Azael Avalos      2015-05-03  250  	result = toshiba_bluetooth_sync_status(bt_dev);
84c0691e514539 Azael Avalos      2015-05-03  251  	if (result) {
84c0691e514539 Azael Avalos      2015-05-03  252  		kfree(bt_dev);
84c0691e514539 Azael Avalos      2015-05-03  253  		return result;
84c0691e514539 Azael Avalos      2015-05-03  254  	}
84c0691e514539 Azael Avalos      2015-05-03  255  
7ee8cd3319d5e5 Azael Avalos      2015-05-03  256  	bt_dev->rfk = rfkill_alloc("Toshiba Bluetooth",
f70ea8e0b9b13e Rafael J. Wysocki 2026-02-09  257  				   &pdev->dev,
7ee8cd3319d5e5 Azael Avalos      2015-05-03  258  				   RFKILL_TYPE_BLUETOOTH,
7ee8cd3319d5e5 Azael Avalos      2015-05-03  259  				   &rfk_ops,
7ee8cd3319d5e5 Azael Avalos      2015-05-03  260  				   bt_dev);
7ee8cd3319d5e5 Azael Avalos      2015-05-03 @261  	if (!bt_dev->rfk) {
7ee8cd3319d5e5 Azael Avalos      2015-05-03  262  		pr_err("Unable to allocate rfkill device\n");
84c0691e514539 Azael Avalos      2015-05-03  263  		kfree(bt_dev);
7ee8cd3319d5e5 Azael Avalos      2015-05-03  264  		return -ENOMEM;
7ee8cd3319d5e5 Azael Avalos      2015-05-03  265  	}
7ee8cd3319d5e5 Azael Avalos      2015-05-03  266  
7ee8cd3319d5e5 Azael Avalos      2015-05-03  267  	rfkill_set_hw_state(bt_dev->rfk, !bt_dev->killswitch);
7ee8cd3319d5e5 Azael Avalos      2015-05-03  268  
7ee8cd3319d5e5 Azael Avalos      2015-05-03  269  	result = rfkill_register(bt_dev->rfk);
7ee8cd3319d5e5 Azael Avalos      2015-05-03  270  	if (result) {
7ee8cd3319d5e5 Azael Avalos      2015-05-03  271  		pr_err("Unable to register rfkill device\n");
7ee8cd3319d5e5 Azael Avalos      2015-05-03  272  		rfkill_destroy(bt_dev->rfk);
7ee8cd3319d5e5 Azael Avalos      2015-05-03  273  		kfree(bt_dev);
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  274  		return result;
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  275  	}
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  276  
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  277  	result = acpi_dev_install_notify_handler(device, ACPI_DEVICE_NOTIFY,
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  278  						 toshiba_bt_rfkill_notify, bt_dev);
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  279  	if (result) {
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  280  		pr_err("Unable to register ACPI notify handler\n");
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  281  		rfkill_unregister(bt_dev->rfk);
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  282  		rfkill_destroy(bt_dev->rfk);
acc7ae54532e0f Rafael J. Wysocki 2026-02-09  283  		kfree(bt_dev);
7ee8cd3319d5e5 Azael Avalos      2015-05-03  284  	}
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  285  
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  286  	return result;
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  287  }
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  288  

:::::: The code at line 261 was first introduced by commit
:::::: 7ee8cd3319d5e57b1b5e2b348f078af44e67a577 toshiba_bluetooth: Add RFKill handler functions

:::::: TO: Azael Avalos <coproscefalo@gmail.com>
:::::: CC: Darren Hart <dvhart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
