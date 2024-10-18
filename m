Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31AB288BD
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 00:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729211398; cv=none; b=Y/v6ovch9SXNZBcSBJlJUgq79bAvMVhnF9MvDJto50QFQ0lloYADYRMbGUuuiT1kIw2A+uZxUe2ub9DS3Y4LwHAmICsLUuSouj0fnNazLHkO+NiHyIyZPTxZHUT8CaQBtBQPChYQXhursCqIBffP3Mat8TbDxo7kAkajzNj/jwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729211398; c=relaxed/simple;
	bh=U42AjCLPqolc4QGD1dwVJqEGotrDWlC8vw2UGY3I+Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VyVfG/eAtz0ECugRpO+NInZQ2BKjJdNfve3edhsqfMXmBpqVIy3DdNs6kX4Ak30XgnyE8VqfGcHsTAMDzv64BEfSZR6LscyWuYAWHCYgLHi2ejdk+s2KDugKGuduHWoOHbZO+m7NWghZIG8LTFctIl2Z/KgAWTIYvbnDvdxguQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ickpLjIA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ickpLjIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729211397; x=1760747397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U42AjCLPqolc4QGD1dwVJqEGotrDWlC8vw2UGY3I+Ms=;
  b=ickpLjIAfp/UrlQSPxgnV+pu3jTd2M8xbTY/5Nb3Pk+QWOFNqsHua3Wk
   PbQLbz0ZG2SgUP/kDRNAcOZfKinQZ4uW33l4qK8TabzgtqqXXZknIGRPB
   Zp8DWAJacdSD47VPPSr0fV28EeqEn059vlNSGJ//EKVdn3VwcEsBeEGD9
   y7mKmjMtM0J9mTtSoNVo9yLTPrDqpQkwWV/e6b1la/ir0GfdIHGFT5W59
   Mg/OuZxS6Pv7Q2bGOxquaJzl7j1vtNJlBOF7V9C5kADNpBa/7PUr/ww9d
   LQzxQ2IbL+/4FaRnguYqi3aEI7XV51D1EIixZU1Cbgsa6NL73lYoQSXeu
   Q==;
X-CSE-ConnectionGUID: iTcokBPTTkCROdp2VUSgUQ==
X-CSE-MsgGUID: yQ9ToMQCTkuDfpDUFWNY0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32656147"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="32656147"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 17:29:56 -0700
X-CSE-ConnectionGUID: jwsb4oWJTvibyl6TetXLoA==
X-CSE-MsgGUID: mVx8piRxQ3m2PuIJSfAslw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="82672560"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Oct 2024 17:29:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1asK-000N4T-2r;
	Fri, 18 Oct 2024 00:29:52 +0000
Date: Fri, 18 Oct 2024 08:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/s390/pci/pci_event.c:301:0-1: preceding lock on line 270
Message-ID: <202410180804.d4Yn6AWs-lkp@intel.com>
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
TO: Gerd Bayer <gbayer@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>
CC: Niklas Schnelle <schnelle@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6efbea77b390604a7be7364583e19cd2d6a1291b
commit: bcb5d6c769039c8358a2359e7c3ea5d97ce93108 s390/pci: introduce lock to synchronize state of zpci_dev's
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-r064-20241018 (https://download.01.org/0day-ci/archive/20241018/202410180804.d4Yn6AWs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410180804.d4Yn6AWs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/s390/pci/pci_event.c:301:0-1: preceding lock on line 270

vim +301 arch/s390/pci/pci_event.c

4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  257  
aa3b7c296732b4 Sebastian Ott   2013-12-12  258  static void __zpci_event_error(struct zpci_ccdf_err *ccdf)
d795ddad36cbc8 Sebastian Ott   2013-11-15  259  {
d795ddad36cbc8 Sebastian Ott   2013-11-15  260  	struct zpci_dev *zdev = get_zdev_by_fid(ccdf->fid);
9a99649f2a89fd Sebastian Ott   2016-01-29  261  	struct pci_dev *pdev = NULL;
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  262  	pci_ers_result_t ers_res;
d795ddad36cbc8 Sebastian Ott   2013-11-15  263  
6526a597a2e856 Niklas Schnelle 2021-09-15  264  	zpci_dbg(3, "err fid:%x, fh:%x, pec:%x\n",
6526a597a2e856 Niklas Schnelle 2021-09-15  265  		 ccdf->fid, ccdf->fh, ccdf->pec);
d795ddad36cbc8 Sebastian Ott   2013-11-15  266  	zpci_err("error CCDF:\n");
d795ddad36cbc8 Sebastian Ott   2013-11-15  267  	zpci_err_hex(ccdf, sizeof(*ccdf));
d795ddad36cbc8 Sebastian Ott   2013-11-15  268  
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  269  	if (zdev) {
bcb5d6c769039c Gerd Bayer      2023-11-10 @270  		mutex_lock(&zdev->state_lock);
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  271  		zpci_update_fh(zdev, ccdf->fh);
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  272  		if (zdev->zbus->bus)
44510d6fa0c00a Pierre Morel    2020-04-22  273  			pdev = pci_get_slot(zdev->zbus->bus, zdev->devfn);
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  274  	}
9a99649f2a89fd Sebastian Ott   2016-01-29  275  
d795ddad36cbc8 Sebastian Ott   2013-11-15  276  	pr_err("%s: Event 0x%x reports an error for PCI function 0x%x\n",
515f022e8b59ce Sebastian Ott   2015-07-28  277  	       pdev ? pci_name(pdev) : "n/a", ccdf->pec, ccdf->fid);
8ead7efb637935 Sebastian Ott   2016-01-22  278  
8ead7efb637935 Sebastian Ott   2016-01-22  279  	if (!pdev)
c122383d221dfa Niklas Schnelle 2021-09-20  280  		goto no_pdev;
8ead7efb637935 Sebastian Ott   2016-01-22  281  
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  282  	switch (ccdf->pec) {
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  283  	case 0x003a: /* Service Action or Error Recovery Successful */
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  284  		ers_res = zpci_event_attempt_error_recovery(pdev);
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  285  		if (ers_res != PCI_ERS_RESULT_RECOVERED)
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  286  			zpci_event_io_failure(pdev, pci_channel_io_perm_failure);
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  287  		break;
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  288  	default:
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  289  		/*
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  290  		 * Mark as frozen not permanently failed because the device
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  291  		 * could be subsequently recovered by the platform.
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  292  		 */
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  293  		zpci_event_io_failure(pdev, pci_channel_io_frozen);
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  294  		break;
4cdf2f4e24ff0d Niklas Schnelle 2021-07-07  295  	}
9a99649f2a89fd Sebastian Ott   2016-01-29  296  	pci_dev_put(pdev);
c122383d221dfa Niklas Schnelle 2021-09-20  297  no_pdev:
bcb5d6c769039c Gerd Bayer      2023-11-10  298  	if (zdev)
bcb5d6c769039c Gerd Bayer      2023-11-10  299  		mutex_unlock(&zdev->state_lock);
c122383d221dfa Niklas Schnelle 2021-09-20  300  	zpci_zdev_put(zdev);
d795ddad36cbc8 Sebastian Ott   2013-11-15 @301  }
d795ddad36cbc8 Sebastian Ott   2013-11-15  302  

:::::: The code at line 301 was first introduced by commit
:::::: d795ddad36cbc828176c898a5084549030539162 s390/pci: implement hotplug notifications

:::::: TO: Sebastian Ott <sebott@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
