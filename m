Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67430FC1F
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jul 2024 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722027490; cv=none; b=ox4C4mPILKW1LTv4OHMGcecZ1EdYEb7YxvNeKp9EwJmqjwOjG50eOr2bl7eKpNKqAXck5ICLU/50yoh3CvGdZ1B5P6SlMnv2qRq/JZMEtd2+PXSjkaUKWd72+lyvA0hJjcogOlIpvUP6BSrnmjeW/erludCG4Gyi3kWXXcEZM50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722027490; c=relaxed/simple;
	bh=eCmjaAixZg4TR/CfkLD3Ap8+DYIw3TXtFu+em3v6NNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=acuHymPDsYWrMi+sutmu20MliT6DrbykQFRtymeAukdWeR9EiCXD0wLeNgCs/NPrP/WB0uZ8um9xD2OYN7nlhl6bt6AcAnjvpaCbSdPU6QWGkmOHel3mdAVL/GdGkiBpux3pzUeLvvKmyaKY7/gW4sThVtTx+yZhsHuhjTcppik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dvjcc6gJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dvjcc6gJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722027489; x=1753563489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eCmjaAixZg4TR/CfkLD3Ap8+DYIw3TXtFu+em3v6NNk=;
  b=Dvjcc6gJ0wx5g8FprLLeZsiMBihx+7Uidtr/hn1yzFXpeej1EdQ7SFRp
   TCpH6KyNwuo1+BMY66EdDu9WM1DDxdeCbLzY/7IDNW8M5tpidnwlq6xd2
   kNpYSFKnff72HVUoUrjxnjE9++/mgXkboZCj+alNWp0x7Eh+yiRaPS4Sz
   a0JpZNUxtxuy/K7o89Q7+qS4hZBe/Q/7zsdhEpL/IntkzoBjExJwF8bAf
   zkgkrPads4qH9pAZxW8MLW/ONTGvPjmgC06vPa+UVfEHwwQGfDKFWnBxU
   PLqu7tK2ZS1raDBm6oefMQ+QJns5kHQjZcY+lC/gmwFvRtWiq/TVGVmuj
   Q==;
X-CSE-ConnectionGUID: GHl00Q0dRNudwxghWncoUg==
X-CSE-MsgGUID: lraW0cC2SOaD/BvdKEuH7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="12737629"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="12737629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 13:58:08 -0700
X-CSE-ConnectionGUID: sn1Dy7adQciVciWJk3S8AA==
X-CSE-MsgGUID: 9jUX4m1pTeS+ExcnRVAxXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="53377974"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Jul 2024 13:58:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXS0p-000pOm-38;
	Fri, 26 Jul 2024 20:58:03 +0000
Date: Sat, 27 Jul 2024 04:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-5.4 4/10] drivers/usb/cdns3/core.c:251
 cdsn3_hw_role_state_machine() error: uninitialized symbol 'role'.
Message-ID: <202407270415.fEG8fBb7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   24f95d0e9b1707db180c68181603937d90783fd9
commit: 1a36f8033bac1979c6bb6c2166a6c143f2113f97 [4/10] BACKPORT: usb: cdns3: make signed 1 bit bitfields unsigned
:::::: branch date: 6 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240727 (https://download.01.org/0day-ci/archive/20240727/202407270415.fEG8fBb7-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407270415.fEG8fBb7-lkp@intel.com/

smatch warnings:
drivers/usb/cdns3/core.c:251 cdsn3_hw_role_state_machine() error: uninitialized symbol 'role'.

vim +/role +251 drivers/usb/cdns3/core.c

7733f6c32e36ff Pawel Laszczak 2019-08-26  194  
7733f6c32e36ff Pawel Laszczak 2019-08-26  195  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  196   * cdsn3_hw_role_state_machine  - role switch state machine based on hw events.
7733f6c32e36ff Pawel Laszczak 2019-08-26  197   * @cdns: Pointer to controller structure.
7733f6c32e36ff Pawel Laszczak 2019-08-26  198   *
7733f6c32e36ff Pawel Laszczak 2019-08-26  199   * Returns next role to be entered based on hw events.
7733f6c32e36ff Pawel Laszczak 2019-08-26  200   */
7733f6c32e36ff Pawel Laszczak 2019-08-26  201  static enum usb_role cdsn3_hw_role_state_machine(struct cdns3 *cdns)
7733f6c32e36ff Pawel Laszczak 2019-08-26  202  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  203  	enum usb_role role;
7733f6c32e36ff Pawel Laszczak 2019-08-26  204  	int id, vbus;
7733f6c32e36ff Pawel Laszczak 2019-08-26  205  
7733f6c32e36ff Pawel Laszczak 2019-08-26  206  	if (cdns->dr_mode != USB_DR_MODE_OTG)
7733f6c32e36ff Pawel Laszczak 2019-08-26  207  		goto not_otg;
7733f6c32e36ff Pawel Laszczak 2019-08-26  208  
7733f6c32e36ff Pawel Laszczak 2019-08-26  209  	id = cdns3_get_id(cdns);
7733f6c32e36ff Pawel Laszczak 2019-08-26  210  	vbus = cdns3_get_vbus(cdns);
7733f6c32e36ff Pawel Laszczak 2019-08-26  211  
7733f6c32e36ff Pawel Laszczak 2019-08-26  212  	/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  213  	 * Role change state machine
7733f6c32e36ff Pawel Laszczak 2019-08-26  214  	 * Inputs: ID, VBUS
7733f6c32e36ff Pawel Laszczak 2019-08-26  215  	 * Previous state: cdns->role
7733f6c32e36ff Pawel Laszczak 2019-08-26  216  	 * Next state: role
7733f6c32e36ff Pawel Laszczak 2019-08-26  217  	 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  218  	role = cdns->role;
7733f6c32e36ff Pawel Laszczak 2019-08-26  219  
7733f6c32e36ff Pawel Laszczak 2019-08-26  220  	switch (role) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  221  	case USB_ROLE_NONE:
7733f6c32e36ff Pawel Laszczak 2019-08-26  222  		/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  223  		 * Driver treats USB_ROLE_NONE synonymous to IDLE state from
7733f6c32e36ff Pawel Laszczak 2019-08-26  224  		 * controller specification.
7733f6c32e36ff Pawel Laszczak 2019-08-26  225  		 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  226  		if (!id)
7733f6c32e36ff Pawel Laszczak 2019-08-26  227  			role = USB_ROLE_HOST;
7733f6c32e36ff Pawel Laszczak 2019-08-26  228  		else if (vbus)
7733f6c32e36ff Pawel Laszczak 2019-08-26  229  			role = USB_ROLE_DEVICE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  230  		break;
7733f6c32e36ff Pawel Laszczak 2019-08-26  231  	case USB_ROLE_HOST: /* from HOST, we can only change to NONE */
7733f6c32e36ff Pawel Laszczak 2019-08-26  232  		if (id)
7733f6c32e36ff Pawel Laszczak 2019-08-26  233  			role = USB_ROLE_NONE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  234  		break;
7733f6c32e36ff Pawel Laszczak 2019-08-26  235  	case USB_ROLE_DEVICE: /* from GADGET, we can only change to NONE*/
7733f6c32e36ff Pawel Laszczak 2019-08-26  236  		if (!vbus)
7733f6c32e36ff Pawel Laszczak 2019-08-26  237  			role = USB_ROLE_NONE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  238  		break;
7733f6c32e36ff Pawel Laszczak 2019-08-26  239  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  240  
7733f6c32e36ff Pawel Laszczak 2019-08-26  241  	dev_dbg(cdns->dev, "role %d -> %d\n", cdns->role, role);
7733f6c32e36ff Pawel Laszczak 2019-08-26  242  
7733f6c32e36ff Pawel Laszczak 2019-08-26  243  	return role;
7733f6c32e36ff Pawel Laszczak 2019-08-26  244  
7733f6c32e36ff Pawel Laszczak 2019-08-26  245  not_otg:
7733f6c32e36ff Pawel Laszczak 2019-08-26  246  	if (cdns3_is_host(cdns))
7733f6c32e36ff Pawel Laszczak 2019-08-26  247  		role = USB_ROLE_HOST;
7733f6c32e36ff Pawel Laszczak 2019-08-26  248  	if (cdns3_is_device(cdns))
7733f6c32e36ff Pawel Laszczak 2019-08-26  249  		role = USB_ROLE_DEVICE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  250  
7733f6c32e36ff Pawel Laszczak 2019-08-26 @251  	return role;
7733f6c32e36ff Pawel Laszczak 2019-08-26  252  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  253  

:::::: The code at line 251 was first introduced by commit
:::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence USB3 DRD Driver

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
