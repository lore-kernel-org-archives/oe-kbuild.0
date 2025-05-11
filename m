Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55EF9476
	for <oe-kbuild@lists.linux.dev>; Sun, 11 May 2025 01:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746925664; cv=none; b=hml9emSeDh8+hsYDuG8y59IaO3UmfoE7RIzMmNDXhw6UlR5tYOyfxVs2eXUGluodeZ0R1WfXymlx0jEhVknCxVcj3wigIwEX5g7/jPosVNkEE8X2OdAE46jdo+S1J0nXmCIhhYeivqmoPojj1PJOVyQChVLDf3NoWrx7BlVv3PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746925664; c=relaxed/simple;
	bh=4Ody9BGDLabkL6tUTCAn5aNe/GhwzuO+P8kaH13V4E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kHApYl1eAECofDJfqcJLpunVQrfEIlWFnAs56hb6lR+h0b0Kyd2d0KkYKPAPfaOvQaZ3hT9EiDcmmhjSE64y6EQOPbnIxjvUw0VivJrKpkmZ9rod07UN4eEjRudZhQeqb8XGX2VZx+kilAKm1uoSplGcQJyC3x3HdQwqW3aAhl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqHM8zVT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqHM8zVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746925663; x=1778461663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Ody9BGDLabkL6tUTCAn5aNe/GhwzuO+P8kaH13V4E8=;
  b=JqHM8zVTPrRBG6EinoB505ykJQr8QYBG6FNrdg9oeTgPu5Et/uHYiR3p
   sfv7bsZ2nEr+o1qHRBttnxPvw1SNR4xP//csfFl5Yo33XeFxjEQrcqa+c
   ES4m2SEgLJnDKI+tYAuLyI14k1Gv/YoScpVRUhSXaltyoiGw2g4Bz/J6/
   5fMv0/uISvrwJHCmit7WPYuvGd4RM6fbBd4/LT8N67XMYNnApX82MB2Ad
   8TSrfi+r5fyjXHLhG3ReOebjQ1GVTNkKntss8fOt1S6V5cMtQzieB6OvS
   wnXiJvs0c00t2kasaPeWOlHXGwGd5lShav8sgwrpiMzz4LUhB0jP/S9wJ
   w==;
X-CSE-ConnectionGUID: lmpzqVj/SdiWOGamhtuvsA==
X-CSE-MsgGUID: amigr26FRQuhgTkScyVevg==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="47982810"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="47982810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 18:07:42 -0700
X-CSE-ConnectionGUID: AFFXzVCGTh6BKJwhUmge7A==
X-CSE-MsgGUID: aijd41BuRzqHoU2yhdbY1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="167942075"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 May 2025 18:07:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDvAI-000DVj-1b;
	Sun, 11 May 2025 01:07:38 +0000
Date: Sun, 11 May 2025 09:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agraf-2.6:kexec-cma 1/2] kernel/kexec_core.c:801
 kimage_load_normal_segment() error: uninitialized symbol 'result'.
Message-ID: <202505111109.zkW7PHWQ-lkp@intel.com>
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
CC: kvm-ppc@vger.kernel.org
TO: Alexander Graf <graf@amazon.com>

tree:   https://github.com/agraf/linux-2.6.git kexec-cma
head:   752619bbe38c535612b1a9e5b47ea7d962c63449
commit: 1e91ce490239e53ac0b4ad9aea3ebed48d1edf51 [1/2] kexec: Use CMA
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250511/202505111109.zkW7PHWQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505111109.zkW7PHWQ-lkp@intel.com/

smatch warnings:
kernel/kexec_core.c:801 kimage_load_normal_segment() error: uninitialized symbol 'result'.

vim +/result +801 kernel/kexec_core.c

2965faa5e03d1e Dave Young            2015-09-09  733  
2965faa5e03d1e Dave Young            2015-09-09  734  static int kimage_load_normal_segment(struct kimage *image,
2965faa5e03d1e Dave Young            2015-09-09  735  					 struct kexec_segment *segment)
2965faa5e03d1e Dave Young            2015-09-09  736  {
2965faa5e03d1e Dave Young            2015-09-09  737  	unsigned long maddr;
2965faa5e03d1e Dave Young            2015-09-09  738  	size_t ubytes, mbytes;
2965faa5e03d1e Dave Young            2015-09-09  739  	int result;
2965faa5e03d1e Dave Young            2015-09-09  740  	unsigned char __user *buf = NULL;
2965faa5e03d1e Dave Young            2015-09-09  741  	unsigned char *kbuf = NULL;
1e91ce490239e5 Alexander Graf        2025-05-09  742  	bool dest_intact = false;
2965faa5e03d1e Dave Young            2015-09-09  743  
2965faa5e03d1e Dave Young            2015-09-09  744  	if (image->file_mode)
2965faa5e03d1e Dave Young            2015-09-09  745  		kbuf = segment->kbuf;
2965faa5e03d1e Dave Young            2015-09-09  746  	else
2965faa5e03d1e Dave Young            2015-09-09  747  		buf = segment->buf;
2965faa5e03d1e Dave Young            2015-09-09  748  	ubytes = segment->bufsz;
2965faa5e03d1e Dave Young            2015-09-09  749  	mbytes = segment->memsz;
2965faa5e03d1e Dave Young            2015-09-09  750  	maddr = segment->mem;
2965faa5e03d1e Dave Young            2015-09-09  751  
2965faa5e03d1e Dave Young            2015-09-09  752  	while (mbytes) {
2965faa5e03d1e Dave Young            2015-09-09  753  		struct page *page;
2965faa5e03d1e Dave Young            2015-09-09  754  		char *ptr;
2965faa5e03d1e Dave Young            2015-09-09  755  		size_t uchunk, mchunk;
2965faa5e03d1e Dave Young            2015-09-09  756  
2965faa5e03d1e Dave Young            2015-09-09  757  		page = kimage_alloc_page(image, GFP_HIGHUSER, maddr);
2965faa5e03d1e Dave Young            2015-09-09  758  		if (!page) {
2965faa5e03d1e Dave Young            2015-09-09  759  			result  = -ENOMEM;
2965faa5e03d1e Dave Young            2015-09-09  760  			goto out;
2965faa5e03d1e Dave Young            2015-09-09  761  		}
1e91ce490239e5 Alexander Graf        2025-05-09  762  
1e91ce490239e5 Alexander Graf        2025-05-09  763  		/* Add page to copy list if it's not already in place */
1e91ce490239e5 Alexander Graf        2025-05-09  764  		if (page_to_boot_pfn(page) << PAGE_SHIFT != maddr) {
1e91ce490239e5 Alexander Graf        2025-05-09  765  			if (!dest_intact) {
1e91ce490239e5 Alexander Graf        2025-05-09  766  				result = kimage_set_destination(image, maddr);
1e91ce490239e5 Alexander Graf        2025-05-09  767  				if (result < 0)
1e91ce490239e5 Alexander Graf        2025-05-09  768  					goto out;
1e91ce490239e5 Alexander Graf        2025-05-09  769  				dest_intact = true;
1e91ce490239e5 Alexander Graf        2025-05-09  770  			}
1e91ce490239e5 Alexander Graf        2025-05-09  771  
43546d8669d62d Russell King          2016-08-02  772  			result = kimage_add_page(image, page_to_boot_pfn(page)
2965faa5e03d1e Dave Young            2015-09-09  773  									<< PAGE_SHIFT);
2965faa5e03d1e Dave Young            2015-09-09  774  			if (result < 0)
2965faa5e03d1e Dave Young            2015-09-09  775  				goto out;
1e91ce490239e5 Alexander Graf        2025-05-09  776  		} else {
1e91ce490239e5 Alexander Graf        2025-05-09  777  			dest_intact = false;
1e91ce490239e5 Alexander Graf        2025-05-09  778  		}
2965faa5e03d1e Dave Young            2015-09-09  779  
948084f0f6959f Fabio M. De Francesco 2022-08-21  780  		ptr = kmap_local_page(page);
2965faa5e03d1e Dave Young            2015-09-09  781  		/* Start with a clear page */
2965faa5e03d1e Dave Young            2015-09-09  782  		clear_page(ptr);
2965faa5e03d1e Dave Young            2015-09-09  783  		ptr += maddr & ~PAGE_MASK;
2965faa5e03d1e Dave Young            2015-09-09  784  		mchunk = min_t(size_t, mbytes,
2965faa5e03d1e Dave Young            2015-09-09  785  				PAGE_SIZE - (maddr & ~PAGE_MASK));
2965faa5e03d1e Dave Young            2015-09-09  786  		uchunk = min(ubytes, mchunk);
2965faa5e03d1e Dave Young            2015-09-09  787  
4bb7be96fc8871 yang.zhang            2024-02-22  788  		if (uchunk) {
2965faa5e03d1e Dave Young            2015-09-09  789  			/* For file based kexec, source pages are in kernel memory */
2965faa5e03d1e Dave Young            2015-09-09  790  			if (image->file_mode)
2965faa5e03d1e Dave Young            2015-09-09  791  				memcpy(ptr, kbuf, uchunk);
2965faa5e03d1e Dave Young            2015-09-09  792  			else
2965faa5e03d1e Dave Young            2015-09-09  793  				result = copy_from_user(ptr, buf, uchunk);
4bb7be96fc8871 yang.zhang            2024-02-22  794  			ubytes -= uchunk;
4bb7be96fc8871 yang.zhang            2024-02-22  795  			if (image->file_mode)
4bb7be96fc8871 yang.zhang            2024-02-22  796  				kbuf += uchunk;
4bb7be96fc8871 yang.zhang            2024-02-22  797  			else
4bb7be96fc8871 yang.zhang            2024-02-22  798  				buf += uchunk;
4bb7be96fc8871 yang.zhang            2024-02-22  799  		}
948084f0f6959f Fabio M. De Francesco 2022-08-21  800  		kunmap_local(ptr);
2965faa5e03d1e Dave Young            2015-09-09 @801  		if (result) {
2965faa5e03d1e Dave Young            2015-09-09  802  			result = -EFAULT;
2965faa5e03d1e Dave Young            2015-09-09  803  			goto out;
2965faa5e03d1e Dave Young            2015-09-09  804  		}
2965faa5e03d1e Dave Young            2015-09-09  805  		maddr  += mchunk;
2965faa5e03d1e Dave Young            2015-09-09  806  		mbytes -= mchunk;
a8311f647e4196 Jarrett Farnitano     2018-06-14  807  
a8311f647e4196 Jarrett Farnitano     2018-06-14  808  		cond_resched();
2965faa5e03d1e Dave Young            2015-09-09  809  	}
2965faa5e03d1e Dave Young            2015-09-09  810  out:
2965faa5e03d1e Dave Young            2015-09-09  811  	return result;
2965faa5e03d1e Dave Young            2015-09-09  812  }
2965faa5e03d1e Dave Young            2015-09-09  813  

:::::: The code at line 801 was first introduced by commit
:::::: 2965faa5e03d1e71e9ff9aa143fff39e0a77543a kexec: split kexec_load syscall from kexec core code

:::::: TO: Dave Young <dyoung@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
