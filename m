Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B0722611
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736365606; cv=none; b=EOw0OelNRl1SV42FfcBkHomWdE5LbLRr2IfMv1SjOkJ8lEqeGBgbuPc5SdLzG1DLKzuzt0EWSL/ZAeAstms8rWN2v7wb47Ll13Mp1F5Hi5D1a5TuO0ppQ5bD+rn25Y/znY/WVa7AbZbVDbgBk6AXDgkVJQzFDxxVIs97p3W5ecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736365606; c=relaxed/simple;
	bh=kVpzhoOsFc56xlC+RT6reP70CwEMHQ6j0V8qJbfg4vM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MSrRjbKUjUCnDLclLM+6Er4AV0fhRleLZrIyxhRRN6qm6mhrOvMm2GYIkRD/WmIWx8s1T1Nnitbn85C2KEjgPa52gjAyrMyaLQyTGf4cQ95GeK7CrzD1vi1k4rRjm1ZMHs3SDCa6MtXau8XXXzwLadzDLI8KZ8+VRyBXR7S7SKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTvdVBcL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTvdVBcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736365605; x=1767901605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kVpzhoOsFc56xlC+RT6reP70CwEMHQ6j0V8qJbfg4vM=;
  b=QTvdVBcL6hdJQocPv84cv3IgOt5+38iK7s584R2QL0/9ypsQnN+OPpV9
   qPiKmRd0CPExEy1JF+KWgyrCj3TiZju6UYurRm4f0o0xS9zzi1cRzenIL
   KEk+NtVnz3sGTIlntFE4qf2I2qSEFvztdyg0EF7I24CW32CW+ifJKKNrQ
   kyT07jrvovKdQ6yjq1aA431zOQBGpjW9BSDIRtX3Im+EWPBfU8fnKKQSb
   471idQBZfqtuYrVE6/s5dDY1hm1m+y8ZXFQvfIbOPwJl4cv4IGyntT0Xy
   EMjPTB33jBiWe5e8r7Qe27lxphDBg4tZ80lh/xhLd4WYVrl2Br2m76zbA
   A==;
X-CSE-ConnectionGUID: rz1KCR7LRO2tjNv8NP7gHw==
X-CSE-MsgGUID: fqMpyzYIRMq46xDjYzIHfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47106240"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="47106240"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 11:46:44 -0800
X-CSE-ConnectionGUID: r2e6fkHZROOtQxPvjF9Zmw==
X-CSE-MsgGUID: eze4i1lcQAqmr2VtV2M8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="103258201"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Jan 2025 11:46:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVc0m-000Gd9-2u;
	Wed, 08 Jan 2025 19:46:40 +0000
Date: Thu, 9 Jan 2025 03:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/6] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS
 call support
Message-ID: <202501090337.xKCGrblc-lkp@intel.com>
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
In-Reply-To: <20250104204652.388720-5-haren@linux.ibm.com>
References: <20250104204652.388720-5-haren@linux.ibm.com>
TO: Haren Myneni <haren@linux.ibm.com>
TO: linuxppc-dev@lists.ozlabs.org
CC: maddy@linux.ibm.com
CC: mpe@ellerman.id.au
CC: npiggin@gmail.com
CC: msuchanek@suse.de
CC: mahesh@linux.ibm.com
CC: tyreld@linux.ibm.com
CC: hbabu@us.ibm.com
CC: haren@linux.ibm.com

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.13-rc6 next-20250108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-HCALLs/20250105-045010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250104204652.388720-5-haren%40linux.ibm.com
patch subject: [PATCH 4/6] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r071-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090337.xKCGrblc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501090337.xKCGrblc-lkp@intel.com/

smatch warnings:
arch/powerpc/platforms/pseries/papr-indices.c:438 papr_dynamic_indicator_ioc_set() warn: inconsistent returns 'global &rtas_ibm_set_dynamic_indicator_lock'.

vim +438 arch/powerpc/platforms/pseries/papr-indices.c

3f48afd07934e4 Haren Myneni 2025-01-04  387  
3f48afd07934e4 Haren Myneni 2025-01-04  388  /**
3f48afd07934e4 Haren Myneni 2025-01-04  389   * papr_dynamic_indicator_ioc_set - ibm,set-dynamic-indicator RTAS Call
3f48afd07934e4 Haren Myneni 2025-01-04  390   * PAPR 2.13 7.3.18
3f48afd07934e4 Haren Myneni 2025-01-04  391   *
3f48afd07934e4 Haren Myneni 2025-01-04  392   * @ubuf: Input parameters to RTAS call such as indicator token and
3f48afd07934e4 Haren Myneni 2025-01-04  393   *        new state.
3f48afd07934e4 Haren Myneni 2025-01-04  394   *
3f48afd07934e4 Haren Myneni 2025-01-04  395   * Returns success or -errno.
3f48afd07934e4 Haren Myneni 2025-01-04  396   */
3f48afd07934e4 Haren Myneni 2025-01-04  397  static long papr_dynamic_indicator_ioc_set(struct papr_indices_io_block __user *ubuf)
3f48afd07934e4 Haren Myneni 2025-01-04  398  {
3f48afd07934e4 Haren Myneni 2025-01-04  399  	struct papr_indices_io_block kbuf;
3f48afd07934e4 Haren Myneni 2025-01-04  400  	struct rtas_work_area *work_area;
3f48afd07934e4 Haren Myneni 2025-01-04  401  	s32 fwrc, token, ret;
3f48afd07934e4 Haren Myneni 2025-01-04  402  
3f48afd07934e4 Haren Myneni 2025-01-04  403  	token = rtas_function_token(RTAS_FN_IBM_SET_DYNAMIC_INDICATOR);
3f48afd07934e4 Haren Myneni 2025-01-04  404  	if (token == RTAS_UNKNOWN_SERVICE)
3f48afd07934e4 Haren Myneni 2025-01-04  405  		return -ENOENT;
3f48afd07934e4 Haren Myneni 2025-01-04  406  
3f48afd07934e4 Haren Myneni 2025-01-04  407  	mutex_lock(&rtas_ibm_set_dynamic_indicator_lock);
3f48afd07934e4 Haren Myneni 2025-01-04  408  	work_area = papr_dynamic_indice_buf_from_user(ubuf, &kbuf);
3f48afd07934e4 Haren Myneni 2025-01-04  409  	if (IS_ERR(work_area))
3f48afd07934e4 Haren Myneni 2025-01-04  410  		return PTR_ERR(work_area);
3f48afd07934e4 Haren Myneni 2025-01-04  411  
3f48afd07934e4 Haren Myneni 2025-01-04  412  	do {
3f48afd07934e4 Haren Myneni 2025-01-04  413  		fwrc = rtas_call(token, 3, 1, NULL,
3f48afd07934e4 Haren Myneni 2025-01-04  414  				kbuf.dynamic_param.token,
3f48afd07934e4 Haren Myneni 2025-01-04  415  				kbuf.dynamic_param.state,
3f48afd07934e4 Haren Myneni 2025-01-04  416  				rtas_work_area_phys(work_area));
3f48afd07934e4 Haren Myneni 2025-01-04  417  	} while (rtas_busy_delay(fwrc));
3f48afd07934e4 Haren Myneni 2025-01-04  418  
3f48afd07934e4 Haren Myneni 2025-01-04  419  	rtas_work_area_free(work_area);
3f48afd07934e4 Haren Myneni 2025-01-04  420  	mutex_unlock(&rtas_ibm_set_dynamic_indicator_lock);
3f48afd07934e4 Haren Myneni 2025-01-04  421  
3f48afd07934e4 Haren Myneni 2025-01-04  422  	switch (fwrc) {
3f48afd07934e4 Haren Myneni 2025-01-04  423  	case RTAS_IBM_DYNAMIC_INDICE_SUCCESS:
3f48afd07934e4 Haren Myneni 2025-01-04  424  		ret = 0;
3f48afd07934e4 Haren Myneni 2025-01-04  425  		break;
3f48afd07934e4 Haren Myneni 2025-01-04  426  	case RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR:	/* No such indicator */
3f48afd07934e4 Haren Myneni 2025-01-04  427  		ret = -EOPNOTSUPP;
3f48afd07934e4 Haren Myneni 2025-01-04  428  		break;
3f48afd07934e4 Haren Myneni 2025-01-04  429  	default:
3f48afd07934e4 Haren Myneni 2025-01-04  430  		pr_err("unexpected ibm,set-dynamic-indicator result %d\n",
3f48afd07934e4 Haren Myneni 2025-01-04  431  			fwrc);
3f48afd07934e4 Haren Myneni 2025-01-04  432  		fallthrough;
3f48afd07934e4 Haren Myneni 2025-01-04  433  	case RTAS_IBM_DYNAMIC_INDICE_HW_ERROR:	/* Hardware/platform error */
3f48afd07934e4 Haren Myneni 2025-01-04  434  		ret = -EIO;
3f48afd07934e4 Haren Myneni 2025-01-04  435  		break;
3f48afd07934e4 Haren Myneni 2025-01-04  436  	}
3f48afd07934e4 Haren Myneni 2025-01-04  437  
3f48afd07934e4 Haren Myneni 2025-01-04 @438  	return ret;
3f48afd07934e4 Haren Myneni 2025-01-04  439  }
3f48afd07934e4 Haren Myneni 2025-01-04  440  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
