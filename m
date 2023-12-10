Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193017F
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 02:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsxok/gX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702175718; x=1733711718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d7g4kIXQtOV9fFmne7HKih1FcNbDrfbILUWP7N6iPZg=;
  b=jsxok/gX6VUo3sLDzC7MsQKy1bwHRJQ0WL9fvonkPnyOwTgoHcil/a31
   6xwRPvw613An4+FEQR2u/BOOppXQdtalJpeylyj61cZ1qKao0026WReNr
   dj1p53Q0Rq1EdL++79cn0ZqUcfDukbSJ4P/R81uNe+olfY86LtgUCFsoG
   rOhawY7SfL40KjUu8QR3WWrIC0ZGsR1GjuwYB0+RQWKchvzkJ2qIRe3Aw
   03XSYL2CKCAOfQMcAqKwrVza3GdxDGzxasipg4pJIxD89PPD7TaSAKk5x
   O7ErvI+Y/H7T4eGoggAx8MXAQi5AhbxwDqe58E/QY/MEG1eKib/D0ZrfT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1604382"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1604382"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 18:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="895955409"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="895955409"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 09 Dec 2023 18:35:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC9ez-000GHx-3B;
	Sun, 10 Dec 2023 02:35:13 +0000
Date: Sun, 10 Dec 2023 10:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/kexec_file.c:320:1: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202312101050.6FqHvugR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21b73ffcc62ab772bc06e3e90bd87eff5e9e8ed4
commit: b7133757da4c4c17d625970f6da3d76af12a8867 crypto: s390 - do not depend on CRYPTO_HW for SIMD implementations
date:   1 year, 5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 5 months ago
config: s390-randconfig-r113-20231115 (https://download.01.org/0day-ci/archive/20231210/202312101050.6FqHvugR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101050.6FqHvugR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312101050.6FqHvugR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/kexec_file.c:320:1: sparse: sparse: Using plain integer as NULL pointer
>> kernel/kexec_file.c:320:1: sparse: sparse: Using plain integer as NULL pointer

vim +320 kernel/kexec_file.c

a43cac0d9dc207 Dave Young     2015-09-09  319  
a43cac0d9dc207 Dave Young     2015-09-09 @320  SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
a43cac0d9dc207 Dave Young     2015-09-09  321  		unsigned long, cmdline_len, const char __user *, cmdline_ptr,
a43cac0d9dc207 Dave Young     2015-09-09  322  		unsigned long, flags)
a43cac0d9dc207 Dave Young     2015-09-09  323  {
a43cac0d9dc207 Dave Young     2015-09-09  324  	int ret = 0, i;
a43cac0d9dc207 Dave Young     2015-09-09  325  	struct kimage **dest_image, *image;
a43cac0d9dc207 Dave Young     2015-09-09  326  
a43cac0d9dc207 Dave Young     2015-09-09  327  	/* We only trust the superuser with rebooting the system. */
a43cac0d9dc207 Dave Young     2015-09-09  328  	if (!capable(CAP_SYS_BOOT) || kexec_load_disabled)
a43cac0d9dc207 Dave Young     2015-09-09  329  		return -EPERM;
a43cac0d9dc207 Dave Young     2015-09-09  330  
a43cac0d9dc207 Dave Young     2015-09-09  331  	/* Make sure we have a legal set of flags */
a43cac0d9dc207 Dave Young     2015-09-09  332  	if (flags != (flags & KEXEC_FILE_FLAGS))
a43cac0d9dc207 Dave Young     2015-09-09  333  		return -EINVAL;
a43cac0d9dc207 Dave Young     2015-09-09  334  
a43cac0d9dc207 Dave Young     2015-09-09  335  	image = NULL;
a43cac0d9dc207 Dave Young     2015-09-09  336  
a43cac0d9dc207 Dave Young     2015-09-09  337  	if (!mutex_trylock(&kexec_mutex))
a43cac0d9dc207 Dave Young     2015-09-09  338  		return -EBUSY;
a43cac0d9dc207 Dave Young     2015-09-09  339  
a43cac0d9dc207 Dave Young     2015-09-09  340  	dest_image = &kexec_image;
9b492cf58077a0 Xunlei Pang    2016-05-23  341  	if (flags & KEXEC_FILE_ON_CRASH) {
a43cac0d9dc207 Dave Young     2015-09-09  342  		dest_image = &kexec_crash_image;
9b492cf58077a0 Xunlei Pang    2016-05-23  343  		if (kexec_crash_image)
9b492cf58077a0 Xunlei Pang    2016-05-23  344  			arch_kexec_unprotect_crashkres();
9b492cf58077a0 Xunlei Pang    2016-05-23  345  	}
a43cac0d9dc207 Dave Young     2015-09-09  346  
a43cac0d9dc207 Dave Young     2015-09-09  347  	if (flags & KEXEC_FILE_UNLOAD)
a43cac0d9dc207 Dave Young     2015-09-09  348  		goto exchange;
a43cac0d9dc207 Dave Young     2015-09-09  349  
a43cac0d9dc207 Dave Young     2015-09-09  350  	/*
a43cac0d9dc207 Dave Young     2015-09-09  351  	 * In case of crash, new kernel gets loaded in reserved region. It is
a43cac0d9dc207 Dave Young     2015-09-09  352  	 * same memory where old crash kernel might be loaded. Free any
a43cac0d9dc207 Dave Young     2015-09-09  353  	 * current crash dump kernel before we corrupt it.
a43cac0d9dc207 Dave Young     2015-09-09  354  	 */
a43cac0d9dc207 Dave Young     2015-09-09  355  	if (flags & KEXEC_FILE_ON_CRASH)
a43cac0d9dc207 Dave Young     2015-09-09  356  		kimage_free(xchg(&kexec_crash_image, NULL));
a43cac0d9dc207 Dave Young     2015-09-09  357  
a43cac0d9dc207 Dave Young     2015-09-09  358  	ret = kimage_file_alloc_init(&image, kernel_fd, initrd_fd, cmdline_ptr,
a43cac0d9dc207 Dave Young     2015-09-09  359  				     cmdline_len, flags);
a43cac0d9dc207 Dave Young     2015-09-09  360  	if (ret)
a43cac0d9dc207 Dave Young     2015-09-09  361  		goto out;
a43cac0d9dc207 Dave Young     2015-09-09  362  
a43cac0d9dc207 Dave Young     2015-09-09  363  	ret = machine_kexec_prepare(image);
a43cac0d9dc207 Dave Young     2015-09-09  364  	if (ret)
a43cac0d9dc207 Dave Young     2015-09-09  365  		goto out;
a43cac0d9dc207 Dave Young     2015-09-09  366  
1229384f5b856d Xunlei Pang    2017-07-12  367  	/*
1229384f5b856d Xunlei Pang    2017-07-12  368  	 * Some architecture(like S390) may touch the crash memory before
1229384f5b856d Xunlei Pang    2017-07-12  369  	 * machine_kexec_prepare(), we must copy vmcoreinfo data after it.
1229384f5b856d Xunlei Pang    2017-07-12  370  	 */
1229384f5b856d Xunlei Pang    2017-07-12  371  	ret = kimage_crash_copy_vmcoreinfo(image);
1229384f5b856d Xunlei Pang    2017-07-12  372  	if (ret)
1229384f5b856d Xunlei Pang    2017-07-12  373  		goto out;
1229384f5b856d Xunlei Pang    2017-07-12  374  
a43cac0d9dc207 Dave Young     2015-09-09  375  	ret = kexec_calculate_store_digests(image);
a43cac0d9dc207 Dave Young     2015-09-09  376  	if (ret)
a43cac0d9dc207 Dave Young     2015-09-09  377  		goto out;
a43cac0d9dc207 Dave Young     2015-09-09  378  
a43cac0d9dc207 Dave Young     2015-09-09  379  	for (i = 0; i < image->nr_segments; i++) {
a43cac0d9dc207 Dave Young     2015-09-09  380  		struct kexec_segment *ksegment;
a43cac0d9dc207 Dave Young     2015-09-09  381  
a43cac0d9dc207 Dave Young     2015-09-09  382  		ksegment = &image->segment[i];
a43cac0d9dc207 Dave Young     2015-09-09  383  		pr_debug("Loading segment %d: buf=0x%p bufsz=0x%zx mem=0x%lx memsz=0x%zx\n",
a43cac0d9dc207 Dave Young     2015-09-09  384  			 i, ksegment->buf, ksegment->bufsz, ksegment->mem,
a43cac0d9dc207 Dave Young     2015-09-09  385  			 ksegment->memsz);
a43cac0d9dc207 Dave Young     2015-09-09  386  
a43cac0d9dc207 Dave Young     2015-09-09  387  		ret = kimage_load_segment(image, &image->segment[i]);
a43cac0d9dc207 Dave Young     2015-09-09  388  		if (ret)
a43cac0d9dc207 Dave Young     2015-09-09  389  			goto out;
a43cac0d9dc207 Dave Young     2015-09-09  390  	}
a43cac0d9dc207 Dave Young     2015-09-09  391  
a43cac0d9dc207 Dave Young     2015-09-09  392  	kimage_terminate(image);
a43cac0d9dc207 Dave Young     2015-09-09  393  
de68e4daea9084 Pavel Tatashin 2019-12-04  394  	ret = machine_kexec_post_load(image);
de68e4daea9084 Pavel Tatashin 2019-12-04  395  	if (ret)
de68e4daea9084 Pavel Tatashin 2019-12-04  396  		goto out;
de68e4daea9084 Pavel Tatashin 2019-12-04  397  
a43cac0d9dc207 Dave Young     2015-09-09  398  	/*
a43cac0d9dc207 Dave Young     2015-09-09  399  	 * Free up any temporary buffers allocated which are not needed
a43cac0d9dc207 Dave Young     2015-09-09  400  	 * after image has been loaded
a43cac0d9dc207 Dave Young     2015-09-09  401  	 */
a43cac0d9dc207 Dave Young     2015-09-09  402  	kimage_file_post_load_cleanup(image);
a43cac0d9dc207 Dave Young     2015-09-09  403  exchange:
a43cac0d9dc207 Dave Young     2015-09-09  404  	image = xchg(dest_image, image);
a43cac0d9dc207 Dave Young     2015-09-09  405  out:
9b492cf58077a0 Xunlei Pang    2016-05-23  406  	if ((flags & KEXEC_FILE_ON_CRASH) && kexec_crash_image)
9b492cf58077a0 Xunlei Pang    2016-05-23  407  		arch_kexec_protect_crashkres();
9b492cf58077a0 Xunlei Pang    2016-05-23  408  
a43cac0d9dc207 Dave Young     2015-09-09  409  	mutex_unlock(&kexec_mutex);
a43cac0d9dc207 Dave Young     2015-09-09  410  	kimage_free(image);
a43cac0d9dc207 Dave Young     2015-09-09  411  	return ret;
a43cac0d9dc207 Dave Young     2015-09-09  412  }
a43cac0d9dc207 Dave Young     2015-09-09  413  

:::::: The code at line 320 was first introduced by commit
:::::: a43cac0d9dc2073ff2245a171429ddbe1accece7 kexec: split kexec_file syscall code to kexec_file.c

:::::: TO: Dave Young <dyoung@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
