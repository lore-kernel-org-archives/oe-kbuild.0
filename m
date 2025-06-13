Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6F2E173D
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816762; cv=none; b=Uh181g+EKrVFPL9EH5EC4WAypjLNsyQX78YtCpFZU8sE3ucLOGHcvxywcPl/iYLPiZ/GQzFIKNsQFx7fMBPxsq1TcO9XqF6jz0TbOR7gOmNNd26OVr6rGM8ojBBVF1WvJBRU1J6BCzgWWGBWP3+sggeuMTmIU+JFDGBH9hd6NLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816762; c=relaxed/simple;
	bh=rS42U3o+ic/Ykj8iNGU7UCi5BS53bLHXCWDDQZnZ9Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PaTI/2taEAyqYrdf/Y/fC10L4pD3k1m1eMlOs6Ltdsigp4HDmmKsJAiqBc21swVIaldbqQtysVAsW01sQcIcwijPIthVB49RkWmgqXANLjYpnBLR7BQLD/rZz9sNBgfAQH4arUqGjYFDMeeXOso9xmPxtNHHamMh06kA3PFlXAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIWned7F; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIWned7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749816760; x=1781352760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rS42U3o+ic/Ykj8iNGU7UCi5BS53bLHXCWDDQZnZ9Qs=;
  b=mIWned7FBzXbEjsmd+oVAjbJDyseKorGPs/FrNC+VUETw/BuDHktMrLm
   Dn6D55wlR8ovahJAGg0aV8LJ8tjOyVKqtrzad9S+2oejwntt5UBJE4lOQ
   tsW++SrrrrwIhRKdCxgvvWRUSB5uHhetLLFR/NVTe7NFhA5zWzXJjSAfc
   88HTqQZO4t4xSOn+OgHbPcdHoINXnUdz/Fi5m78eXaXf5c4WNgdfFXBvl
   zy73nbo6hNcDvI7PfR6BERdvl4yrxkrGkfHnYR/dLXNRrqvDpABSayFyB
   zBYKwgi37Tqf1CjQ1nCKWoq29k19+SkZ+PcPfYCfEHDWfGNhF03aUCOWE
   w==;
X-CSE-ConnectionGUID: vfPr4N3ZT0qGy2a0nl3XdQ==
X-CSE-MsgGUID: 6a7BmZlnTMOAnN+4P4n23A==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63383148"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="63383148"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:12:32 -0700
X-CSE-ConnectionGUID: EvBZa7/tSIOoUsWIFTjrWg==
X-CSE-MsgGUID: +ejljKRLTUi+/5D3iI4n5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148184529"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2025 05:12:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ3Gm-000CZs-2t;
	Fri, 13 Jun 2025 12:12:28 +0000
Date: Fri, 13 Jun 2025 20:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5] char: misc: add test cases
Message-ID: <202506132058.thWZHlrb-lkp@intel.com>
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
In-Reply-To: <20250612-misc-dynrange-v5-1-6f35048f7273@igalia.com>
References: <20250612-misc-dynrange-v5-1-6f35048f7273@igalia.com>
TO: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

Hi Thadeu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Thadeu-Lima-de-Souza-Cascardo/char-misc-add-test-cases/20250613-013440
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250612-misc-dynrange-v5-1-6f35048f7273%40igalia.com
patch subject: [PATCH v5] char: misc: add test cases
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: powerpc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132058.thWZHlrb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506132058.thWZHlrb-lkp@intel.com/

smatch warnings:
drivers/misc/misc_minor_kunit.c:192 miscdev_test_can_open() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +192 drivers/misc/misc_minor_kunit.c

127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  177  
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  178  static void __init miscdev_test_can_open(struct kunit *test, struct miscdevice *misc)
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  179  {
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  180  	int ret;
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  181  	struct file *filp;
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  182  	char *devname;
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  183  
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  184  	devname = kasprintf(GFP_KERNEL, "/dev/%s", misc->name);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  185  	ret = init_mknod(devname, S_IFCHR | 0600,
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  186  			 new_encode_dev(MKDEV(MISC_MAJOR, misc->minor)));
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  187  	if (ret != 0)
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  188  		KUNIT_FAIL(test, "failed to create node\n");
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  189  
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  190  	filp = filp_open(devname, O_RDONLY, 0);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  191  	if (IS_ERR_OR_NULL(filp))
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12 @192  		KUNIT_FAIL(test, "failed to open misc device: %ld\n", PTR_ERR(filp));
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  193  	else
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  194  		fput(filp);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  195  
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  196  	init_unlink(devname);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  197  	kfree(devname);
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  198  }
127b049d35f107 Thadeu Lima de Souza Cascardo 2025-06-12  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
