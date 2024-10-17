Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1D1DA5A
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 01:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729128295; cv=none; b=TdJMAiTZ+ITSyqrGAOLYXtQQGz8nCjZ471xb6WX4FfAgyedMYx6u9JdVzzlHGFeVVJ1gobS9a4zkTOycXUZQk23WWOhWL130Mq/Gd+szQ/3SDuAo3Nuh9DNJhAiKc7JK9HXkwAky+ep/O/sTYQErT+b6uvz5CgB6HBwsi6EMyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729128295; c=relaxed/simple;
	bh=4AiLXYPijbMirKw03tgY9DxvyBxLZPyw57R16/zhNpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=orCB6ctMQrdlfBXcaK0fxYgFhaiwbqGOS1kduwyX5QMAFoRNo8UbbBAPxI1uAnn1ZkwQ0Hkz/Nj8vNke66MlqP5ZjoLZdBp9VOOZ1o1ueAdU9n06Z3DqNhceoG0A3mIU2Bl5/5Dl5xJq/i2N8gwEvOpVhiYgE+oWlZzB0aeDRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtSkaWP8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtSkaWP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729128293; x=1760664293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4AiLXYPijbMirKw03tgY9DxvyBxLZPyw57R16/zhNpo=;
  b=MtSkaWP8RQJ2zyCXWFOXyYAxQl+WNUVDGxNt2mT47lPWwauDHg9JKOzm
   xqxY7vj3Fdl1diNiiACqN23tbErW3j4PJUwh4b07YqHJNfhBsKZ/rhWk9
   9ZrAaUuM4Y+NHLmYuwZrviKIQ5YKWqIk3Dv2uLwCVV//2gBWVQXmg0ntY
   A6wPjEwFvHWKpcT+wjOh8kpHz122Aep+FATGMmv/zbzNtxmm0VeRgsOtr
   xawC5HSFnLFfOOkj85yJl7jQ0qyfc3WzeroNU0jYT906jkVe1GMoLelZ1
   22adZS6w032UlVynqAi2dkiXOcK7jOizWLj/Wj8pKZGZC+NCf2B81ZtBC
   w==;
X-CSE-ConnectionGUID: b/plRv+YTpGr2h2pewPBFg==
X-CSE-MsgGUID: AookEu5STEe9chpMbQPeig==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28042247"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="28042247"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 18:24:52 -0700
X-CSE-ConnectionGUID: Dgx8xdWkQfOmrtLlRYD7HQ==
X-CSE-MsgGUID: i9omFbDXQ0Sg9FR3+HoQAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="82353559"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2024 18:24:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1FFw-000Lal-27;
	Thu, 17 Oct 2024 01:24:48 +0000
Date: Thu, 17 Oct 2024 09:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:3026:3-24: opportunity for
 str_enabled_disabled(ioc -> high_iops_queues)
Message-ID: <202410170920.EQOPoCZq-lkp@intel.com>
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
TO: Suganath Prabu S <suganath-prabu.subramani@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c964ced7726294d40913f2127c3f185a92cb4a41
commit: 18fd3d8cf903404b2c7cd31a083be4db2e6a2a76 scsi: mpt3sas: Add flag high_iops_queues
date:   5 years ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 years ago
config: i386-randconfig-051-20241016 (https://download.01.org/0day-ci/archive/20241017/202410170920.EQOPoCZq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410170920.EQOPoCZq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/mpt3sas/mpt3sas_base.c:3026:3-24: opportunity for str_enabled_disabled(ioc -> high_iops_queues)

vim +3026 drivers/scsi/mpt3sas/mpt3sas_base.c

f92363d1235949 Sreekanth Reddy          2012-11-30  2956  
f92363d1235949 Sreekanth Reddy          2012-11-30  2957  /**
f92363d1235949 Sreekanth Reddy          2012-11-30  2958   * _base_enable_msix - enables msix, failback to io_apic
f92363d1235949 Sreekanth Reddy          2012-11-30  2959   * @ioc: per adapter object
f92363d1235949 Sreekanth Reddy          2012-11-30  2960   *
f92363d1235949 Sreekanth Reddy          2012-11-30  2961   */
f92363d1235949 Sreekanth Reddy          2012-11-30  2962  static int
f92363d1235949 Sreekanth Reddy          2012-11-30  2963  _base_enable_msix(struct MPT3SAS_ADAPTER *ioc)
f92363d1235949 Sreekanth Reddy          2012-11-30  2964  {
f92363d1235949 Sreekanth Reddy          2012-11-30  2965  	int r;
bb3506612346c2 Suganath Prabu Subramani 2016-10-26  2966  	int i, local_max_msix_vectors;
f92363d1235949 Sreekanth Reddy          2012-11-30  2967  	u8 try_msix = 0;
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2968  	unsigned int irq_flags = PCI_IRQ_MSIX;
f92363d1235949 Sreekanth Reddy          2012-11-30  2969  
f92363d1235949 Sreekanth Reddy          2012-11-30  2970  	if (msix_disable == -1 || msix_disable == 0)
f92363d1235949 Sreekanth Reddy          2012-11-30  2971  		try_msix = 1;
f92363d1235949 Sreekanth Reddy          2012-11-30  2972  
f92363d1235949 Sreekanth Reddy          2012-11-30  2973  	if (!try_msix)
f92363d1235949 Sreekanth Reddy          2012-11-30  2974  		goto try_ioapic;
f92363d1235949 Sreekanth Reddy          2012-11-30  2975  
f92363d1235949 Sreekanth Reddy          2012-11-30  2976  	if (_base_check_enable_msix(ioc) != 0)
f92363d1235949 Sreekanth Reddy          2012-11-30  2977  		goto try_ioapic;
f92363d1235949 Sreekanth Reddy          2012-11-30  2978  
18fd3d8cf90340 Suganath Prabu S         2019-05-31  2979  	ioc_info(ioc, "MSI-X vectors supported: %d\n", ioc->msix_vector_count);
18fd3d8cf90340 Suganath Prabu S         2019-05-31  2980  	pr_info("\t no of cores: %d, max_msix_vectors: %d\n",
18fd3d8cf90340 Suganath Prabu S         2019-05-31  2981  		ioc->cpu_count, max_msix_vectors);
f92363d1235949 Sreekanth Reddy          2012-11-30  2982  
18fd3d8cf90340 Suganath Prabu S         2019-05-31  2983  	_base_check_and_enable_high_iops_queues(ioc, ioc->msix_vector_count);
18fd3d8cf90340 Suganath Prabu S         2019-05-31  2984  	ioc->reply_queue_count =
18fd3d8cf90340 Suganath Prabu S         2019-05-31  2985  		min_t(int, ioc->cpu_count + ioc->high_iops_queues,
18fd3d8cf90340 Suganath Prabu S         2019-05-31  2986  		ioc->msix_vector_count);
9c5000606d2a0d Sreekanth Reddy          2013-08-14  2987  
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  2988  	if (!ioc->rdpq_array_enable && max_msix_vectors == -1)
06f5f976a6ee0f Sreekanth Reddy          2017-10-10  2989  		local_max_msix_vectors = (reset_devices) ? 1 : 8;
bb3506612346c2 Suganath Prabu Subramani 2016-10-26  2990  	else
bb3506612346c2 Suganath Prabu Subramani 2016-10-26  2991  		local_max_msix_vectors = max_msix_vectors;
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  2992  
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2993  	if (local_max_msix_vectors > 0)
bb3506612346c2 Suganath Prabu Subramani 2016-10-26  2994  		ioc->reply_queue_count = min_t(int, local_max_msix_vectors,
9c5000606d2a0d Sreekanth Reddy          2013-08-14  2995  			ioc->reply_queue_count);
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2996  	else if (local_max_msix_vectors == 0)
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  2997  		goto try_ioapic;
9c5000606d2a0d Sreekanth Reddy          2013-08-14  2998  
64038301baed7d Suganath Prabu Subramani 2016-02-08  2999  	if (ioc->msix_vector_count < ioc->cpu_count)
64038301baed7d Suganath Prabu Subramani 2016-02-08  3000  		smp_affinity_enable = 0;
64038301baed7d Suganath Prabu Subramani 2016-02-08  3001  
1d55abc0e98a0b Hannes Reinecke          2017-02-22  3002  	if (smp_affinity_enable)
1d55abc0e98a0b Hannes Reinecke          2017-02-22  3003  		irq_flags |= PCI_IRQ_AFFINITY;
f92363d1235949 Sreekanth Reddy          2012-11-30  3004  
1d55abc0e98a0b Hannes Reinecke          2017-02-22  3005  	r = pci_alloc_irq_vectors(ioc->pdev, 1, ioc->reply_queue_count,
1d55abc0e98a0b Hannes Reinecke          2017-02-22  3006  				  irq_flags);
1d55abc0e98a0b Hannes Reinecke          2017-02-22  3007  	if (r < 0) {
919d8a3f3fef99 Joe Perches              2018-09-17  3008  		dfailprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  3009  			    ioc_info(ioc, "pci_alloc_irq_vectors failed (r=%d) !!!\n",
919d8a3f3fef99 Joe Perches              2018-09-17  3010  				     r));
f92363d1235949 Sreekanth Reddy          2012-11-30  3011  		goto try_ioapic;
f92363d1235949 Sreekanth Reddy          2012-11-30  3012  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  3013  
f92363d1235949 Sreekanth Reddy          2012-11-30  3014  	ioc->msix_enable = 1;
1d55abc0e98a0b Hannes Reinecke          2017-02-22  3015  	ioc->reply_queue_count = r;
1d55abc0e98a0b Hannes Reinecke          2017-02-22  3016  	for (i = 0; i < ioc->reply_queue_count; i++) {
1d55abc0e98a0b Hannes Reinecke          2017-02-22  3017  		r = _base_request_irq(ioc, i);
f92363d1235949 Sreekanth Reddy          2012-11-30  3018  		if (r) {
f92363d1235949 Sreekanth Reddy          2012-11-30  3019  			_base_free_irq(ioc);
f92363d1235949 Sreekanth Reddy          2012-11-30  3020  			_base_disable_msix(ioc);
f92363d1235949 Sreekanth Reddy          2012-11-30  3021  			goto try_ioapic;
f92363d1235949 Sreekanth Reddy          2012-11-30  3022  		}
f92363d1235949 Sreekanth Reddy          2012-11-30  3023  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  3024  
18fd3d8cf90340 Suganath Prabu S         2019-05-31  3025  	ioc_info(ioc, "High IOPs queues : %s\n",
18fd3d8cf90340 Suganath Prabu S         2019-05-31 @3026  			ioc->high_iops_queues ? "enabled" : "disabled");
18fd3d8cf90340 Suganath Prabu S         2019-05-31  3027  
f92363d1235949 Sreekanth Reddy          2012-11-30  3028  	return 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  3029  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
