Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18980210E1
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jan 2024 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iw4U34Tz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705147309; x=1736683309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YdJyF7+T+hCdn/is7w14WEPUsf9gn0SQFqPDT1/l6hg=;
  b=iw4U34TztksfgGxvMPeFhNhRBuln2dJHixXRbvc8rmJelcQaVSfSP6Lj
   FTGyRNrOHxg/7p1rS4T/tFytFFGR7VhLBOtIoT40sMwZ+685DyiWEXzV9
   xKisPyU7f+t5BVPLT+Of39VIHPuUx8Rqca4ca9DY87vdO4vEramFDwL8A
   i2+eez48nlnsiFiOcrzEYjTAhdzBzXdPSNJ6Fvkxe4bB4U2XAdqQU6XTr
   1R5ubxoJ4YZ8aiDhcRDbkBEFddh0lTWKA185fzQdDB5yF9lcY9Xqa0noD
   jXaVWynzfOqfkLk+JN3bEHvxqpQ3UOeq3YMoja7awu36EW+U42iA5skdt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6128122"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6128122"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 04:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="17680952"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2024 04:01:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOchs-000ARU-1e;
	Sat, 13 Jan 2024 12:01:44 +0000
Date: Sat, 13 Jan 2024 20:00:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Elena Reshetova <elena.reshetova@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15605/15708]
 drivers/clocksource/mmio.c:187:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 189.
Message-ID: <202401131905.oRcC6z40-lkp@intel.com>
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
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: d4e16bf0941a00ae6aec566cfd1496d416139429 [15605/15708] clocksource: mmio: add user-mappable mmio clocksources
:::::: branch date: 10 days ago
:::::: commit date: 5 weeks ago
config: alpha-randconfig-r051-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131905.oRcC6z40-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401131905.oRcC6z40-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clocksource/mmio.c:187:5-24: WARNING: atomic_dec_and_test variation before object free at line 189.
--
>> drivers/clocksource/mmio.c:211:15-21: WARNING: Consider using vma_pages helper on vma

vim +187 drivers/clocksource/mmio.c

d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  180  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  181  static void mmio_ucs_vmclose(struct vm_area_struct *vma)
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  182  {
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  183  	struct clocksource_user_mapping *mapping;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  184  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  185  	mapping = vma->vm_private_data;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  186  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21 @187  	if (atomic_dec_and_test(&mapping->refs)) {
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  188  		spin_lock(&mapping->ucs->lock);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21 @189  		hash_del(&mapping->link);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  190  		spin_unlock(&mapping->ucs->lock);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  191  		kfree(mapping);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  192  	}
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  193  }
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  194  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  195  static const struct vm_operations_struct mmio_ucs_vmops = {
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  196  	.open = mmio_ucs_vmopen,
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  197  	.close = mmio_ucs_vmclose,
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  198  };
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  199  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  200  static int mmio_ucs_mmap(struct file *file, struct vm_area_struct *vma)
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  201  {
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  202  	unsigned long addr, upper_pfn, lower_pfn;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  203  	struct clocksource_user_mapping *mapping, *tmp;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  204  	struct clocksource_user_mmio *ucs;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  205  	unsigned int bits_upper;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  206  	unsigned long h_key;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  207  	pgprot_t prot;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  208  	size_t pages;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  209  	int err;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  210  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21 @211  	pages = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  212  	if (pages > 2)
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  213  		return -EINVAL;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  214  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  215  	vma->vm_private_data = NULL;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  216  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  217  	ucs = file->private_data;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  218  	upper_pfn = ucs->phys_upper >> PAGE_SHIFT;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  219  	lower_pfn = ucs->phys_lower >> PAGE_SHIFT;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  220  	bits_upper = fls(ucs->mmio.clksrc.mask) - ucs->bits_lower;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  221  	if (pages == 2 && (!bits_upper || upper_pfn == lower_pfn))
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  222  		return -EINVAL;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  223  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  224  	mapping = kmalloc(sizeof(*mapping), GFP_KERNEL);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  225  	if (!mapping)
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  226  		return -ENOSPC;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  227  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  228  	mapping->mm = vma->vm_mm;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  229  	mapping->ucs = ucs;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  230  	mapping->regs = (void *)vma->vm_start;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  231  	atomic_set(&mapping->refs, 1);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  232  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  233  	vma->vm_private_data = mapping;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  234  	vma->vm_ops = &mmio_ucs_vmops;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  235  	prot = pgprot_noncached(vma->vm_page_prot);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  236  	addr = vma->vm_start;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  237  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  238  	err = remap_pfn_range(vma, addr, lower_pfn, PAGE_SIZE, prot);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  239  	if (err < 0)
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  240  		goto fail;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  241  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  242  	if (pages > 1) {
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  243  		addr += PAGE_SIZE;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  244  		err = remap_pfn_range(vma, addr, upper_pfn, PAGE_SIZE, prot);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  245  		if (err < 0)
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  246  			goto fail;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  247  	}
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  248  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  249  	h_key = (unsigned long)vma->vm_mm / sizeof(*vma->vm_mm);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  250  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  251  	spin_lock(&ucs->lock);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  252  	hash_for_each_possible(ucs->mappings, tmp, link, h_key) {
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  253  		if (tmp->mm == vma->vm_mm) {
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  254  			spin_unlock(&ucs->lock);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  255  			err = -EBUSY;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  256  			goto fail;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  257  		}
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  258  	}
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  259  	hash_add(ucs->mappings, &mapping->link, h_key);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  260  	spin_unlock(&ucs->lock);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  261  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  262  	return 0;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  263  fail:
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  264  	kfree(mapping);
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  265  
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  266  	return err;
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  267  }
d4e16bf0941a00a Gilles Chanteperdrix 2016-07-21  268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
