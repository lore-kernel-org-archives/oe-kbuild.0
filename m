Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C023D6B
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Dec 2024 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473244; cv=none; b=qTQYZ3ysRK9BIACcSkHMX3U920w8k6MmoqHdw8I4FBoBM1LOphqXEsaC+3p9njes1fhB3Lh2Dy9Q3klLbFf1s0qIrlcXZVdB2xlOG55RUtnrsH7gCYLMzD1W5/OF/TQ0Y+bYwN+khkFZBb2w7YwmQHKGyVWpjs1Bw13b7qoe3yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473244; c=relaxed/simple;
	bh=LhZVLD5eSxAj4SpsZ5o/9ToQCr3P5hvyQkRf7Y8q3dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLzfbL5TV70od1IDlz7qJnbxHdyRK8SdUp+iFDrcp4I0/ZAEo0S+zarFd2/cWoRLOCQiZCBqjn4Aromr7XoxWmqvpTZ0hVdmjhnNtXWH5O0MjnxiE4G5XVVM5lwym0BAOhbQSAKQUjytz89KQeJs1K06j7B/4JrM7HWfATuJIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkhy1zhy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkhy1zhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733473242; x=1765009242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LhZVLD5eSxAj4SpsZ5o/9ToQCr3P5hvyQkRf7Y8q3dQ=;
  b=kkhy1zhy0/PPAgceHIIF5Nx20uoy3OHayhyolrNRbRiDwY4+HElGtqq3
   UVV7hmkJxpWi4mupgd0B3bNjJxI2Ww3473YePXsDypAklQA9yKOrSayCI
   a+qyqsVenXdVcUhgiY8H7Ubdz0t0b1s4Kar22sT7HGNE5i+TqZT+6R7Ga
   S8eJ4nEpKxGrXMdaqBhejFZ3vkflFKGIUUXO1OLHg6ARi5QSN9+jsqUgz
   QXK+JtL58mA8VJrXtWZXgf14fHpygpKRl935ryfHmqphgj9j+P5o2jMKT
   ZiE1+ElCWbH8ReAr3zxfMjs9MoZrmw5gFwy+TKoZ6EQN544Lx/Mulj8OR
   g==;
X-CSE-ConnectionGUID: VmbcVNxhRVOmBhob0S/LdA==
X-CSE-MsgGUID: WF3Hlek0SSaqgZ8MpR1yjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45217586"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45217586"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 00:20:42 -0800
X-CSE-ConnectionGUID: FbMWakTATJOx0hF2V/6ZbA==
X-CSE-MsgGUID: oWLOwRw2Qyu1I1+rAH656A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="131759947"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2024 00:20:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJTZm-0000qd-11;
	Fri, 06 Dec 2024 08:20:38 +0000
Date: Fri, 6 Dec 2024 16:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/s390/pci/pci_event.c:406:16-20: ERROR: reference preceded by
 free on line 344
Message-ID: <202412061649.trmks8z7-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Niklas Schnelle <schnelle@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>
CC: Gerd Bayer <gbayer@linux.ibm.com>
CC: Matthew Rosato <mjrosato@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f52214c61a5b99a54168145378e91b40d10c90
commit: 48796104c864cf4dafa80bd8c2ce88f9c92a65ea s390/pci: Fix leak of struct zpci_dev when zpci_add_device() fails
date:   8 days ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 days ago
config: s390-randconfig-r054-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061649.trmks8z7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412061649.trmks8z7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/s390/pci/pci_event.c:406:16-20: ERROR: reference preceded by free on line 344
   arch/s390/pci/pci_event.c:406:16-20: ERROR: reference preceded by free on line 361

vim +406 arch/s390/pci/pci_event.c

dee60c0dbc837dd Niklas Schnelle 2020-09-16  324  
aa3b7c296732b43 Sebastian Ott   2013-12-12  325  static void __zpci_event_availability(struct zpci_ccdf_avail *ccdf)
cbc0dd1f856b52b Jan Glauber     2012-11-29  326  {
cbc0dd1f856b52b Jan Glauber     2012-11-29  327  	struct zpci_dev *zdev = get_zdev_by_fid(ccdf->fid);
c122383d221dfa2 Niklas Schnelle 2021-09-20  328  	bool existing_zdev = !!zdev;
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  329  	enum zpci_state state;
cbc0dd1f856b52b Jan Glauber     2012-11-29  330  
6526a597a2e856d Niklas Schnelle 2021-09-15  331  	zpci_dbg(3, "avl fid:%x, fh:%x, pec:%x\n",
6526a597a2e856d Niklas Schnelle 2021-09-15  332  		 ccdf->fid, ccdf->fh, ccdf->pec);
bcb5d6c769039c8 Gerd Bayer      2023-11-10  333  
bcb5d6c769039c8 Gerd Bayer      2023-11-10  334  	if (existing_zdev)
bcb5d6c769039c8 Gerd Bayer      2023-11-10  335  		mutex_lock(&zdev->state_lock);
bcb5d6c769039c8 Gerd Bayer      2023-11-10  336  
cbc0dd1f856b52b Jan Glauber     2012-11-29  337  	switch (ccdf->pec) {
7fc611ff3ff1a0b Sebastian Ott   2015-06-16  338  	case 0x0301: /* Reserved|Standby -> Configured */
7fc611ff3ff1a0b Sebastian Ott   2015-06-16  339  		if (!zdev) {
14c87ba8123abe6 Niklas Schnelle 2021-02-12  340  			zdev = zpci_create_device(ccdf->fid, ccdf->fh, ZPCI_FN_STATE_CONFIGURED);
14c87ba8123abe6 Niklas Schnelle 2021-02-12  341  			if (IS_ERR(zdev))
7fc611ff3ff1a0b Sebastian Ott   2015-06-16  342  				break;
48796104c864cf4 Niklas Schnelle 2024-11-25  343  			if (zpci_add_device(zdev)) {
48796104c864cf4 Niklas Schnelle 2024-11-25 @344  				kfree(zdev);
48796104c864cf4 Niklas Schnelle 2024-11-25  345  				break;
48796104c864cf4 Niklas Schnelle 2024-11-25  346  			}
14c87ba8123abe6 Niklas Schnelle 2021-02-12  347  		} else {
b76fee1bc56c31a Niklas Schnelle 2020-08-04  348  			/* the configuration request may be stale */
b76fee1bc56c31a Niklas Schnelle 2020-08-04  349  			if (zdev->state != ZPCI_FN_STATE_STANDBY)
b76fee1bc56c31a Niklas Schnelle 2020-08-04  350  				break;
f606b3ef47c9f87 Pierre Morel    2020-03-25  351  			zdev->state = ZPCI_FN_STATE_CONFIGURED;
14c87ba8123abe6 Niklas Schnelle 2021-02-12  352  		}
a7f82c364124505 Niklas Schnelle 2021-04-09  353  		zpci_scan_configured_device(zdev, ccdf->fh);
cbc0dd1f856b52b Jan Glauber     2012-11-29  354  		break;
d795ddad36cbc82 Sebastian Ott   2013-11-15  355  	case 0x0302: /* Reserved -> Standby */
0467cdde8c4320b Niklas Schnelle 2024-09-26  356  		if (!zdev) {
0467cdde8c4320b Niklas Schnelle 2024-09-26  357  			zdev = zpci_create_device(ccdf->fid, ccdf->fh, ZPCI_FN_STATE_STANDBY);
0467cdde8c4320b Niklas Schnelle 2024-09-26  358  			if (IS_ERR(zdev))
0467cdde8c4320b Niklas Schnelle 2024-09-26  359  				break;
48796104c864cf4 Niklas Schnelle 2024-11-25  360  			if (zpci_add_device(zdev)) {
48796104c864cf4 Niklas Schnelle 2024-11-25  361  				kfree(zdev);
48796104c864cf4 Niklas Schnelle 2024-11-25  362  				break;
48796104c864cf4 Niklas Schnelle 2024-11-25  363  			}
0467cdde8c4320b Niklas Schnelle 2024-09-26  364  		} else {
4fe204977096e90 Niklas Schnelle 2021-07-07  365  			zpci_update_fh(zdev, ccdf->fh);
0467cdde8c4320b Niklas Schnelle 2024-09-26  366  		}
f606b3ef47c9f87 Pierre Morel    2020-03-25  367  		break;
d795ddad36cbc82 Sebastian Ott   2013-11-15  368  	case 0x0303: /* Deconfiguration requested */
2631f6b6f22ca61 Niklas Schnelle 2020-11-03  369  		if (zdev) {
d0c8fd21006777b Gerd Bayer      2023-12-05  370  			/* The event may have been queued before we configured
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  371  			 * the device.
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  372  			 */
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  373  			if (zdev->state != ZPCI_FN_STATE_CONFIGURED)
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  374  				break;
4fe204977096e90 Niklas Schnelle 2021-07-07  375  			zpci_update_fh(zdev, ccdf->fh);
2631f6b6f22ca61 Niklas Schnelle 2020-11-03  376  			zpci_deconfigure_device(zdev);
2631f6b6f22ca61 Niklas Schnelle 2020-11-03  377  		}
d795ddad36cbc82 Sebastian Ott   2013-11-15  378  		break;
623bd44d3f277b7 Sebastian Ott   2017-05-09  379  	case 0x0304: /* Configured -> Standby|Reserved */
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  380  		if (zdev) {
d0c8fd21006777b Gerd Bayer      2023-12-05  381  			/* The event may have been queued before we configured
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  382  			 * the device.:
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  383  			 */
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  384  			if (zdev->state == ZPCI_FN_STATE_CONFIGURED)
dee60c0dbc837dd Niklas Schnelle 2020-09-16  385  				zpci_event_hard_deconfigured(zdev, ccdf->fh);
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  386  			/* The 0x0304 event may immediately reserve the device */
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  387  			if (!clp_get_state(zdev->fid, &state) &&
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  388  			    state == ZPCI_FN_STATE_RESERVED) {
a46044a92add6a4 Niklas Schnelle 2021-09-22  389  				zpci_device_reserved(zdev);
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  390  			}
0d9cf5d8c5d0bfa Niklas Schnelle 2021-04-09  391  		}
d795ddad36cbc82 Sebastian Ott   2013-11-15  392  		break;
d795ddad36cbc82 Sebastian Ott   2013-11-15  393  	case 0x0306: /* 0x308 or 0x302 for multiple devices */
809fcfaf9238052 Niklas Schnelle 2020-08-21  394  		zpci_remove_reserved_devices();
0467cdde8c4320b Niklas Schnelle 2024-09-26  395  		zpci_scan_devices();
d795ddad36cbc82 Sebastian Ott   2013-11-15  396  		break;
d795ddad36cbc82 Sebastian Ott   2013-11-15  397  	case 0x0308: /* Standby -> Reserved */
704268925d32a04 Sebastian Ott   2013-12-12  398  		if (!zdev)
704268925d32a04 Sebastian Ott   2013-12-12  399  			break;
a46044a92add6a4 Niklas Schnelle 2021-09-22  400  		zpci_device_reserved(zdev);
d795ddad36cbc82 Sebastian Ott   2013-11-15  401  		break;
d795ddad36cbc82 Sebastian Ott   2013-11-15  402  	default:
d795ddad36cbc82 Sebastian Ott   2013-11-15  403  		break;
cbc0dd1f856b52b Jan Glauber     2012-11-29  404  	}
bcb5d6c769039c8 Gerd Bayer      2023-11-10  405  	if (existing_zdev) {
bcb5d6c769039c8 Gerd Bayer      2023-11-10 @406  		mutex_unlock(&zdev->state_lock);
c122383d221dfa2 Niklas Schnelle 2021-09-20  407  		zpci_zdev_put(zdev);
cbc0dd1f856b52b Jan Glauber     2012-11-29  408  	}
bcb5d6c769039c8 Gerd Bayer      2023-11-10  409  }
aa3b7c296732b43 Sebastian Ott   2013-12-12  410  

:::::: The code at line 406 was first introduced by commit
:::::: bcb5d6c769039c8358a2359e7c3ea5d97ce93108 s390/pci: introduce lock to synchronize state of zpci_dev's

:::::: TO: Gerd Bayer <gbayer@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
