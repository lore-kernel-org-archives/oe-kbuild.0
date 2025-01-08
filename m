Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882881FBEBE
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343262; cv=none; b=s3q7iCHTOPROmx04+0LMD6iXKGFCxrRqQNq/qN5oeX2OlWaFHFjdfkfeo+J4T7tFpiAGHoynrwOpec2NTeDxqc369DE27CSaQdv0y/f1SZCSkKcc9jl8fai7e3byuPhkCEN0Asfu50VpK9QdkGvKvKyYrC8ldJQOJlaLWbCW5Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343262; c=relaxed/simple;
	bh=zIr0qQMkf9/BW851c5dZjUAZpL51k3zsLQpR4Xd8Dyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gKKftkDsDreD3QfvjT38k4p0HqRxFIuzCMjvUA88qGvnOnycFDRXltQjmJDpbxM9116SCdNekVre2hvfWhx/RmVFjJPBAeDFYMHPWs9nRSYG4jiguDuhePR+DYvDlL7f489oH11SXnXA9lTrkcg9/fL2afW+QyF6ZZnb7FobW6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKxwZZYO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKxwZZYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736343261; x=1767879261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zIr0qQMkf9/BW851c5dZjUAZpL51k3zsLQpR4Xd8Dyk=;
  b=dKxwZZYOfe3htx4wpUNZYcLs15j036+cWmgq/QgI9FqBXmBmxTmsAtAJ
   lTEjlDioqlrYaIJWek03A3BvyI3BPCHHrKhvAk8j/8pLyvSStNpUXCEAw
   9j4Zc8XTa61DevgR5Bn8lSfMKmAYqLFW8jq4YGuftCHCQ/J1xTU0Jcqsf
   3LB4uqPiXZ6h2zrcgYevwmjV2urqLmfcXmkD7xNwG3nO8qVisBPap8dQD
   hlNFkpsXXXIdeD/WoZnSH0eBudpvL18OtfxaVXc9S1Bu1dm0hqvTT9Ixc
   C8IfdXQSPhW15iz4HrgP3D/LgPMRWruspm+JQWUGvzDmOL47IJ8/aqLpw
   g==;
X-CSE-ConnectionGUID: NFz7Gw0WSLGQ8kxpEa1RwA==
X-CSE-MsgGUID: rMQfuROzSxO6j8ehmQ7Fbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47559410"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47559410"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:34:20 -0800
X-CSE-ConnectionGUID: t13XHTG6TQKvZqL0aw+CSA==
X-CSE-MsgGUID: TiYhwcU4ShmJkrbz+KBoow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102967024"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2025 05:34:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVWCO-000G8f-0B;
	Wed, 08 Jan 2025 13:34:16 +0000
Date: Wed, 8 Jan 2025 21:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/bluetooth/hci_core.c:778 hci_get_dev_list() warn: impossible
 condition '(dev_num > (((1) << 18) * 2) / 8) => (0-u16max > 65536)'
Message-ID: <202501082150.zmBx10g6-lkp@intel.com>
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
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: efe8419ae78d65e83edc31aad74b605c12e7d60c vdso: Introduce vdso/page.h
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: hexagon-randconfig-r073-20250108 (https://download.01.org/0day-ci/archive/20250108/202501082150.zmBx10g6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501082150.zmBx10g6-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_core.c:778 hci_get_dev_list() warn: impossible condition '(dev_num > (((1) << 18) * 2) / 8) => (0-u16max > 65536)'

vim +778 net/bluetooth/hci_core.c

^1da177e4c3f41 Linus Torvalds         2005-04-16  766  
^1da177e4c3f41 Linus Torvalds         2005-04-16  767  int hci_get_dev_list(void __user *arg)
^1da177e4c3f41 Linus Torvalds         2005-04-16  768  {
8035ded466049c Luiz Augusto von Dentz 2011-11-01  769  	struct hci_dev *hdev;
^1da177e4c3f41 Linus Torvalds         2005-04-16  770  	struct hci_dev_list_req *dl;
^1da177e4c3f41 Linus Torvalds         2005-04-16  771  	struct hci_dev_req *dr;
8f7dfe171c576a Erick Archer           2024-05-18  772  	int n = 0, err;
^1da177e4c3f41 Linus Torvalds         2005-04-16  773  	__u16 dev_num;
^1da177e4c3f41 Linus Torvalds         2005-04-16  774  
^1da177e4c3f41 Linus Torvalds         2005-04-16  775  	if (get_user(dev_num, (__u16 __user *) arg))
^1da177e4c3f41 Linus Torvalds         2005-04-16  776  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds         2005-04-16  777  
^1da177e4c3f41 Linus Torvalds         2005-04-16 @778  	if (!dev_num || dev_num > (PAGE_SIZE * 2) / sizeof(*dr))
^1da177e4c3f41 Linus Torvalds         2005-04-16  779  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds         2005-04-16  780  
8f7dfe171c576a Erick Archer           2024-05-18  781  	dl = kzalloc(struct_size(dl, dev_req, dev_num), GFP_KERNEL);
70f23020e6d891 Andrei Emeltchenko     2010-12-01  782  	if (!dl)
^1da177e4c3f41 Linus Torvalds         2005-04-16  783  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds         2005-04-16  784  
8f7dfe171c576a Erick Archer           2024-05-18  785  	dl->dev_num = dev_num;
^1da177e4c3f41 Linus Torvalds         2005-04-16  786  	dr = dl->dev_req;
^1da177e4c3f41 Linus Torvalds         2005-04-16  787  
f20d09d5f7093e Gustavo Padovan        2011-12-22  788  	read_lock(&hci_dev_list_lock);
8035ded466049c Luiz Augusto von Dentz 2011-11-01  789  	list_for_each_entry(hdev, &hci_dev_list, list) {
2e84d8db91e459 Marcel Holtmann        2014-07-10  790  		unsigned long flags = hdev->flags;
c542a06c29acbf Johan Hedberg          2011-01-26  791  
2e84d8db91e459 Marcel Holtmann        2014-07-10  792  		/* When the auto-off is configured it means the transport
2e84d8db91e459 Marcel Holtmann        2014-07-10  793  		 * is running, but in that case still indicate that the
2e84d8db91e459 Marcel Holtmann        2014-07-10  794  		 * device is actually down.
2e84d8db91e459 Marcel Holtmann        2014-07-10  795  		 */
d7a5a11d7fa80b Marcel Holtmann        2015-03-13  796  		if (hci_dev_test_flag(hdev, HCI_AUTO_OFF))
2e84d8db91e459 Marcel Holtmann        2014-07-10  797  			flags &= ~BIT(HCI_UP);
c542a06c29acbf Johan Hedberg          2011-01-26  798  
c61e41121036aa Erick Archer           2024-05-18  799  		dr[n].dev_id  = hdev->id;
c61e41121036aa Erick Archer           2024-05-18  800  		dr[n].dev_opt = flags;
c542a06c29acbf Johan Hedberg          2011-01-26  801  
^1da177e4c3f41 Linus Torvalds         2005-04-16  802  		if (++n >= dev_num)
^1da177e4c3f41 Linus Torvalds         2005-04-16  803  			break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  804  	}
f20d09d5f7093e Gustavo Padovan        2011-12-22  805  	read_unlock(&hci_dev_list_lock);
^1da177e4c3f41 Linus Torvalds         2005-04-16  806  
^1da177e4c3f41 Linus Torvalds         2005-04-16  807  	dl->dev_num = n;
8f7dfe171c576a Erick Archer           2024-05-18  808  	err = copy_to_user(arg, dl, struct_size(dl, dev_req, n));
^1da177e4c3f41 Linus Torvalds         2005-04-16  809  	kfree(dl);
^1da177e4c3f41 Linus Torvalds         2005-04-16  810  
^1da177e4c3f41 Linus Torvalds         2005-04-16  811  	return err ? -EFAULT : 0;
^1da177e4c3f41 Linus Torvalds         2005-04-16  812  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  813  

:::::: The code at line 778 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
