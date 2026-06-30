Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07DC382F35
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jun 2026 05:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782796199; cv=none; b=hFeQy1/m9J74qwKNgPiu4Ve/61rXCJmb65vfIzaS6W7mstKs8vggqRL3YztDPcmriK4KBbAABidOriuqx91bDJJOfZGNRBYnhouYgImgoG2Yh0gDMcub3bvCxYL6/mF2YGRyj7U98IH5GQng/mH+cR1FSbYOPjSTqg6nn6T2cgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782796199; c=relaxed/simple;
	bh=n4mWfLwDqSzCDFdlLDSTD5kUu10O3QQeGUm+preXy2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tt1sqRGXcENq2rhjDX2w540/UNh8APmaAhKuJqcV1eV7tBzho93F1Mji6ZEw1Whjnuz+MD8uZhkdWvNI5RxSfk7Fu3Clxri+mXCC5gwYyBUJp4uO3Ctxt0ff9zPkjgBLOu8pYxeQBkauDzrdHrXDncfCENdtiCxjqtQ/EPw+i94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2mhF7Fn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2mhF7Fn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782796198; x=1814332198;
  h=date:from:to:cc:subject:message-id;
  bh=n4mWfLwDqSzCDFdlLDSTD5kUu10O3QQeGUm+preXy2E=;
  b=G2mhF7FnhsLbIEq2FwTKf7UbzI40lgnHRlCfq3e+OcVqvom0nBqW3sRI
   c18VoeaHv9dIpoVLmFwMSHw6kiUjqd9IYFuUe7JSwhzGIMrK24n7+ZCV8
   TG0GTRjUXHL+L374WcLE+b87sH1GIonc9tSNTbUDF1j2gsyEbLMWPrG/x
   8CPu4/qKdocgfdyg0SbUS310MJbBYLrViw8kED0/j2iTJIU4BEQeyexNw
   ZwNTSoX90iCMr/OntGuoaKwEVhbMFr3L1esxJ32M7/CLPl3eGdyE/QTrh
   Q6kWnZ9yGoXvXq7WaS2YMpGfY7eurbbhW9UEA4LD5Ii0kr+s3n/zD8eDm
   w==;
X-CSE-ConnectionGUID: NHCYfAuSTVyV/fcxnYozhw==
X-CSE-MsgGUID: MQmCwFVBQQyeDgjpg8s/Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83586264"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83586264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 22:09:58 -0700
X-CSE-ConnectionGUID: XU5Mo6xtRzuBbpNF8naT8g==
X-CSE-MsgGUID: EbbjvHpESXSr4rZtJihxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="290278572"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Jun 2026 22:09:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weQjI-0000000081n-0tid;
	Tue, 30 Jun 2026 05:09:52 +0000
Date: Tue, 30 Jun 2026 13:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/xen/gntalloc.c:321 gntalloc_ioctl_alloc() warn:
 potential user controlled sizeof overflow '4 * op.count' '4 * 0-u32max'
Message-ID: <202606301225.dXgAUmvi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler-assisted type-based slab cache partitioning
date:   7 weeks ago
:::::: branch date: 34 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-r072-20260629 (https://download.01.org/0day-ci/archive/20260630/202606301225.dXgAUmvi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606301225.dXgAUmvi-lkp@intel.com/

smatch warnings:
drivers/xen/gntalloc.c:321 gntalloc_ioctl_alloc() warn: potential user controlled sizeof overflow '4 * op.count' '4 * 0-u32max'

vim +321 drivers/xen/gntalloc.c

dd3140588d9551 Daniel De Graaf 2011-02-07  268  
dd3140588d9551 Daniel De Graaf 2011-02-07  269  static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
dd3140588d9551 Daniel De Graaf 2011-02-07  270  		struct ioctl_gntalloc_alloc_gref __user *arg)
dd3140588d9551 Daniel De Graaf 2011-02-07  271  {
dd3140588d9551 Daniel De Graaf 2011-02-07  272  	int rc = 0;
dd3140588d9551 Daniel De Graaf 2011-02-07  273  	struct ioctl_gntalloc_alloc_gref op;
dd3140588d9551 Daniel De Graaf 2011-02-07  274  	uint32_t *gref_ids;
dd3140588d9551 Daniel De Graaf 2011-02-07  275  
dd3140588d9551 Daniel De Graaf 2011-02-07  276  	pr_debug("%s: priv %p\n", __func__, priv);
dd3140588d9551 Daniel De Graaf 2011-02-07  277  
dd3140588d9551 Daniel De Graaf 2011-02-07  278  	if (copy_from_user(&op, arg, sizeof(op))) {
dd3140588d9551 Daniel De Graaf 2011-02-07  279  		rc = -EFAULT;
dd3140588d9551 Daniel De Graaf 2011-02-07  280  		goto out;
dd3140588d9551 Daniel De Graaf 2011-02-07  281  	}
dd3140588d9551 Daniel De Graaf 2011-02-07  282  
0ee931c4e31a5e Michal Hocko    2017-09-13  283  	gref_ids = kcalloc(op.count, sizeof(gref_ids[0]), GFP_KERNEL);
dd3140588d9551 Daniel De Graaf 2011-02-07  284  	if (!gref_ids) {
dd3140588d9551 Daniel De Graaf 2011-02-07  285  		rc = -ENOMEM;
dd3140588d9551 Daniel De Graaf 2011-02-07  286  		goto out;
dd3140588d9551 Daniel De Graaf 2011-02-07  287  	}
dd3140588d9551 Daniel De Graaf 2011-02-07  288  
8ca19a8937ad91 Daniel De Graaf 2011-10-27  289  	mutex_lock(&gref_mutex);
dd3140588d9551 Daniel De Graaf 2011-02-07  290  	/* Clean up pages that were at zero (local) users but were still mapped
dd3140588d9551 Daniel De Graaf 2011-02-07  291  	 * by remote domains. Since those pages count towards the limit that we
dd3140588d9551 Daniel De Graaf 2011-02-07  292  	 * are about to enforce, removing them here is a good idea.
dd3140588d9551 Daniel De Graaf 2011-02-07  293  	 */
dd3140588d9551 Daniel De Graaf 2011-02-07  294  	do_cleanup();
dd3140588d9551 Daniel De Graaf 2011-02-07  295  	if (gref_size + op.count > limit) {
8ca19a8937ad91 Daniel De Graaf 2011-10-27  296  		mutex_unlock(&gref_mutex);
dd3140588d9551 Daniel De Graaf 2011-02-07  297  		rc = -ENOSPC;
dd3140588d9551 Daniel De Graaf 2011-02-07  298  		goto out_free;
dd3140588d9551 Daniel De Graaf 2011-02-07  299  	}
dd3140588d9551 Daniel De Graaf 2011-02-07  300  	gref_size += op.count;
dd3140588d9551 Daniel De Graaf 2011-02-07  301  	op.index = priv->index;
dd3140588d9551 Daniel De Graaf 2011-02-07  302  	priv->index += op.count * PAGE_SIZE;
8ca19a8937ad91 Daniel De Graaf 2011-10-27  303  	mutex_unlock(&gref_mutex);
dd3140588d9551 Daniel De Graaf 2011-02-07  304  
dd3140588d9551 Daniel De Graaf 2011-02-07  305  	rc = add_grefs(&op, gref_ids, priv);
dd3140588d9551 Daniel De Graaf 2011-02-07  306  	if (rc < 0)
dd3140588d9551 Daniel De Graaf 2011-02-07  307  		goto out_free;
dd3140588d9551 Daniel De Graaf 2011-02-07  308  
dd3140588d9551 Daniel De Graaf 2011-02-07  309  	/* Once we finish add_grefs, it is unsafe to touch the new reference,
dd3140588d9551 Daniel De Graaf 2011-02-07  310  	 * since it is possible for a concurrent ioctl to remove it (by guessing
dd3140588d9551 Daniel De Graaf 2011-02-07  311  	 * its index). If the userspace application doesn't provide valid memory
dd3140588d9551 Daniel De Graaf 2011-02-07  312  	 * to write the IDs to, then it will need to close the file in order to
dd3140588d9551 Daniel De Graaf 2011-02-07  313  	 * release - which it will do by segfaulting when it tries to access the
dd3140588d9551 Daniel De Graaf 2011-02-07  314  	 * IDs to close them.
dd3140588d9551 Daniel De Graaf 2011-02-07  315  	 */
dd3140588d9551 Daniel De Graaf 2011-02-07  316  	if (copy_to_user(arg, &op, sizeof(op))) {
dd3140588d9551 Daniel De Graaf 2011-02-07  317  		rc = -EFAULT;
dd3140588d9551 Daniel De Graaf 2011-02-07  318  		goto out_free;
dd3140588d9551 Daniel De Graaf 2011-02-07  319  	}
bf5802238dc181 Kees Cook       2024-02-06  320  	if (copy_to_user(arg->gref_ids_flex, gref_ids,
dd3140588d9551 Daniel De Graaf 2011-02-07 @321  			sizeof(gref_ids[0]) * op.count)) {
dd3140588d9551 Daniel De Graaf 2011-02-07  322  		rc = -EFAULT;
dd3140588d9551 Daniel De Graaf 2011-02-07  323  		goto out_free;
dd3140588d9551 Daniel De Graaf 2011-02-07  324  	}
dd3140588d9551 Daniel De Graaf 2011-02-07  325  
dd3140588d9551 Daniel De Graaf 2011-02-07  326  out_free:
dd3140588d9551 Daniel De Graaf 2011-02-07  327  	kfree(gref_ids);
dd3140588d9551 Daniel De Graaf 2011-02-07  328  out:
dd3140588d9551 Daniel De Graaf 2011-02-07  329  	return rc;
dd3140588d9551 Daniel De Graaf 2011-02-07  330  }
dd3140588d9551 Daniel De Graaf 2011-02-07  331  

:::::: The code at line 321 was first introduced by commit
:::::: dd3140588d9551235ebc2a0dacdca098e7677573 xen-gntalloc: Userspace grant allocation driver

:::::: TO: Daniel De Graaf <dgdegra@tycho.nsa.gov>
:::::: CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
