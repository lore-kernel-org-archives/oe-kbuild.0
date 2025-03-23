Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674B433A6
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742753666; cv=none; b=IFxJcYltRsRqRw8BcH+PPcCugws5PxJro1dOu9Axzuy1ldMkueYcoVHBG1XjL8MGWCUttp5yCwh2kKMmh62F1AcdUwEKEuPLHgmX18nF7MbzWyehRuNMAKiiTSvf2k8oSnl97JWVfsB1uWEZ8NMCRt8jgYSbr2sSkTo2JNnhHns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742753666; c=relaxed/simple;
	bh=0KOixeHQG3PtdB7wfb0jbRnI+kyMCYDcg9PSIQAC/Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PsczH1/V8if7+KJmHzsKnN4PTw5kYOVJkgEfn56o7SKqFeEvUku3BP9idhGtInaPz5oMsxwoqkTkTvsJvqwUi/iZwwvrG1j6LYaSXuPxJlsyqctxabqv623NZbPRhvnUbkeJSpB08sp72PdJKXQaSf5wwTRvEnKtGla2qEIPLIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9jV9GoJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9jV9GoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742753664; x=1774289664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0KOixeHQG3PtdB7wfb0jbRnI+kyMCYDcg9PSIQAC/Ho=;
  b=H9jV9GoJkxsdSXuHO6FalUptcbhuSpCs2R2neotV828MCYT+fs8OVRLt
   dD2RsGbhVgSGAac8K3Yet5M9cAvFZ/X8sucNs1sGgFoT4yDta8+ACRVUb
   cEGiEq9fIj3YQNZfkUoCQ/v1/3TShqimo5ND+1WX8TIlDgQ6lSKZcOriA
   nC01ajPDtlO+dLwXN1wAi/IOq94CaZPUu+O4zXxjQNqs/1E1kQaX9nN+s
   dzje1V0Jmr/2d/HzCBnSD5Nx24PUsIR+YbbPApJOUvIDWlO0566chhAnn
   Emdte1a+Ag5w74JICncSH3ANsDJweyO/eqmfvzh0znAkdJaXyNfgooD/U
   Q==;
X-CSE-ConnectionGUID: SorjE3OVQZWM97iK7cIWew==
X-CSE-MsgGUID: ZOIVHciGQK2SGmgjaAWIcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="31555332"
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="31555332"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 11:14:24 -0700
X-CSE-ConnectionGUID: pTeD+JOkRiqPmQGbzHcLmA==
X-CSE-MsgGUID: VvDYsqA7QxmjoduceND3lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="123569131"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Mar 2025 11:14:23 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twPpx-0002tg-2C;
	Sun, 23 Mar 2025 18:14:18 +0000
Date: Mon, 24 Mar 2025 02:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cminyard-ipmi:remove-srcu 8/15]
 drivers/char/ipmi/ipmi_msghandler.c:768 ipmi_smi_watcher_register() warn:
 iterator used outside loop: 'intf'
Message-ID: <202503240244.LR7pOwyr-lkp@intel.com>
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
TO: Corey Minyard <corey@minyard.net>

tree:   https://github.com/cminyard/linux-ipmi remove-srcu
head:   952a7280d75bee86fb667526304477074b678a68
commit: ed7043aba7c5cb3017e4d2d7dd6e9c5f2dbb1df7 [8/15] ipmi:msghandler: Remove srcu for the ipmi_interfaces list
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250324/202503240244.LR7pOwyr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503240244.LR7pOwyr-lkp@intel.com/

smatch warnings:
drivers/char/ipmi/ipmi_msghandler.c:768 ipmi_smi_watcher_register() warn: iterator used outside loop: 'intf'

vim +/intf +768 drivers/char/ipmi/ipmi_msghandler.c

393d2cc354d150 Corey Minyard  2005-11-07  720  
^1da177e4c3f41 Linus Torvalds 2005-04-16  721  int ipmi_smi_watcher_register(struct ipmi_smi_watcher *watcher)
^1da177e4c3f41 Linus Torvalds 2005-04-16  722  {
a567b6230066e3 Corey Minyard  2018-04-05  723  	struct ipmi_smi *intf;
ed7043aba7c5cb Corey Minyard  2025-03-18  724  	unsigned int count = 0, i;
ed7043aba7c5cb Corey Minyard  2025-03-18  725  	int *interfaces = NULL;
ed7043aba7c5cb Corey Minyard  2025-03-18  726  	int rv = 0;
913a89f009d98c Corey Minyard  2018-12-20  727  
913a89f009d98c Corey Minyard  2018-12-20  728  	/*
913a89f009d98c Corey Minyard  2018-12-20  729  	 * Make sure the driver is actually initialized, this handles
913a89f009d98c Corey Minyard  2018-12-20  730  	 * problems with initialization order.
913a89f009d98c Corey Minyard  2018-12-20  731  	 */
913a89f009d98c Corey Minyard  2018-12-20  732  	rv = ipmi_init_msghandler();
913a89f009d98c Corey Minyard  2018-12-20  733  	if (rv)
913a89f009d98c Corey Minyard  2018-12-20  734  		return rv;
bca0324d09e413 Corey Minyard  2006-12-06  735  
b2c03941b50944 Corey Minyard  2006-12-06  736  	mutex_lock(&smi_watchers_mutex);
b2c03941b50944 Corey Minyard  2006-12-06  737  
b2c03941b50944 Corey Minyard  2006-12-06  738  	list_add(&watcher->link, &smi_watchers);
bca0324d09e413 Corey Minyard  2006-12-06  739  
ed7043aba7c5cb Corey Minyard  2025-03-18  740  	/*
ed7043aba7c5cb Corey Minyard  2025-03-18  741  	 * Build an array of ipmi interfaces and fill it in.  We can't
ed7043aba7c5cb Corey Minyard  2025-03-18  742  	 * call the callback with ipmi_interfaces_mutex held.
ed7043aba7c5cb Corey Minyard  2025-03-18  743  	 * smi_watchers_mutex will keep things in order for the user.
ed7043aba7c5cb Corey Minyard  2025-03-18  744  	 */
ed7043aba7c5cb Corey Minyard  2025-03-18  745  	mutex_lock(&ipmi_interfaces_mutex);
ed7043aba7c5cb Corey Minyard  2025-03-18  746  	list_for_each_entry(intf, &ipmi_interfaces, link)
ed7043aba7c5cb Corey Minyard  2025-03-18  747  		count++;
ed7043aba7c5cb Corey Minyard  2025-03-18  748  	if (count > 0) {
ed7043aba7c5cb Corey Minyard  2025-03-18  749  		interfaces = kmalloc_array(count, sizeof(*interfaces),
ed7043aba7c5cb Corey Minyard  2025-03-18  750  					   GFP_KERNEL);
ed7043aba7c5cb Corey Minyard  2025-03-18  751  		if (!interfaces)
ed7043aba7c5cb Corey Minyard  2025-03-18  752  			rv = -ENOMEM;
ed7043aba7c5cb Corey Minyard  2025-03-18  753  		count = 0;
ed7043aba7c5cb Corey Minyard  2025-03-18  754  	}
ed7043aba7c5cb Corey Minyard  2025-03-18  755  	if (interfaces) {
ed7043aba7c5cb Corey Minyard  2025-03-18  756  		list_for_each_entry(intf, &ipmi_interfaces, link) {
e86ee2d44b4405 Corey Minyard  2018-04-05  757  			int intf_num = READ_ONCE(intf->intf_num);
bca0324d09e413 Corey Minyard  2006-12-06  758  
e86ee2d44b4405 Corey Minyard  2018-04-05  759  			if (intf_num == -1)
e86ee2d44b4405 Corey Minyard  2018-04-05  760  				continue;
ed7043aba7c5cb Corey Minyard  2025-03-18  761  			interfaces[count++] = intf_num;
ed7043aba7c5cb Corey Minyard  2025-03-18  762  		}
ed7043aba7c5cb Corey Minyard  2025-03-18  763  	}
ed7043aba7c5cb Corey Minyard  2025-03-18  764  	mutex_unlock(&ipmi_interfaces_mutex);
ed7043aba7c5cb Corey Minyard  2025-03-18  765  
ed7043aba7c5cb Corey Minyard  2025-03-18  766  	if (interfaces) {
ed7043aba7c5cb Corey Minyard  2025-03-18  767  		for (i = 0; i < count; i++)
ed7043aba7c5cb Corey Minyard  2025-03-18 @768  			watcher->new_smi(interfaces[i], intf->si_dev);
ed7043aba7c5cb Corey Minyard  2025-03-18  769  		kfree(interfaces);
^1da177e4c3f41 Linus Torvalds 2005-04-16  770  	}
bca0324d09e413 Corey Minyard  2006-12-06  771  
b2c03941b50944 Corey Minyard  2006-12-06  772  	mutex_unlock(&smi_watchers_mutex);
bca0324d09e413 Corey Minyard  2006-12-06  773  
ed7043aba7c5cb Corey Minyard  2025-03-18  774  	return rv;
^1da177e4c3f41 Linus Torvalds 2005-04-16  775  }
c70d749986f6f1 Corey Minyard  2008-04-29  776  EXPORT_SYMBOL(ipmi_smi_watcher_register);
^1da177e4c3f41 Linus Torvalds 2005-04-16  777  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
