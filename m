Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8B51428E
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Feb 2024 02:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708568854; cv=none; b=eYG52dcu7eH3Q6WnTzsaRY0Jy1HfWC8hErUHmXsfgj/Ibqt7oelMRaBL1PMj5Zl/t+Tag8RPs/GYh+H7/TgopR4jrvLUTzHl8RdtEagLO1eLHuEOVkx7pgyfWFfIwCsVBNZ+tTFPKW0MrlCYcDSKq1rH4VWXzRFMx/IhDC1pnAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708568854; c=relaxed/simple;
	bh=S0yXyrrJ2vXbMEnR9liCsuUPpi8J0T3f64g5Wzmcy1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N6IVF4lNa3XgOCc8ElF8bMb2tFhtxaOVLTWIlN9OB/mGnkPhdTinWoGM/WPnUNZ/AbxkXeRio33PsSSc0vHxab/wWkEcyFRyutuR93Uknvje0e6ktuBWRfHCG5qC9e2TiKEKdMK4ALcWSf2hM1PcoWOi4luO442c6ODgbFYg0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hf7k8G2i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hf7k8G2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708568853; x=1740104853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S0yXyrrJ2vXbMEnR9liCsuUPpi8J0T3f64g5Wzmcy1k=;
  b=hf7k8G2iz5Z82RR8lduD/C72vlC9RvEcO8d1OcjYwW83lpWTZbJewFrN
   DDwWp0bKNOm6t3bOT6VRADf6T+4MIeAq1wp2bL/4Iu7M2492xWWvHND/P
   i2Q/lkHuo/kGnRo62l7kDwmbnFb/N86C8gQOA8YT09RSTssqTC3q8WqGS
   YWuN3D0UERsBtriiNLxubeIuE4jX+1EL0Ql0wTU5HuzJH7yLmg/WP7LBu
   /PChKN4GKgFcU8tcb57s2mUHj+oWwuVYwfi1HfpKND7cU8ng1qt59N/hU
   2svH9uILd1aSoQm8u+syryn2kux53gMxy7DvyriY10hjH60H8xFnED6DQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13391423"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="13391423"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 18:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="36142275"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Feb 2024 18:27:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcyo2-0005ts-20;
	Thu, 22 Feb 2024 02:27:27 +0000
Date: Thu, 22 Feb 2024 10:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [s390:features 91/98] arch/s390/pci/pci_event.c:301:0-1: preceding
 lock on line 270
Message-ID: <202402221004.f8BQSQ8i-lkp@intel.com>
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
CC: linux-s390@vger.kernel.org
TO: Gerd Bayer <gbayer@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>
CC: Niklas Schnelle <schnelle@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
head:   4a5993287467d2d0401503256dc9d2690c7f2020
commit: bcb5d6c769039c8358a2359e7c3ea5d97ce93108 [91/98] s390/pci: introduce lock to synchronize state of zpci_dev's
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: s390-randconfig-r064-20240221 (https://download.01.org/0day-ci/archive/20240222/202402221004.f8BQSQ8i-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402221004.f8BQSQ8i-lkp@intel.com/

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
