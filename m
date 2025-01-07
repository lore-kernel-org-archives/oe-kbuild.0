Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8012594B2
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736213556; cv=none; b=TrQlOWu33w32d4pLlCSbOz5ZACoP3R2DxIKZHTmr1l625ZOkSu/ziYWtSUBkii8OyTYSO3sBLLrzHEYRLD4g0SyEfM9M2S0o2puvwVhXXLuecuko1uKmD78+yF6hM2hCNZK8sUpGdAi0OQnFmY4eBjuhN1ieBqP/sSbaSk+6Dqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736213556; c=relaxed/simple;
	bh=6uZPpe/fm6kvmlgjgoA65cfe5rSnJMu9nutic4kcfBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DqmF6eO4d3hQK6vijQlcu6qHOAxuu0VOwsgY5K0mEinoRdyZOFRFhWUgg9Yu/6EsC/Zmu1a/z2p3tDoTt38TEej4cK2lAW+5egQWx+HbcF2f4LDTwdVAyrpypvNxgmOewLqKAtqCfeVkZQzHDIagZ+glWIcxaVQmVQb84w79SQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClJ7MVLf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClJ7MVLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736213553; x=1767749553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uZPpe/fm6kvmlgjgoA65cfe5rSnJMu9nutic4kcfBA=;
  b=ClJ7MVLfCrbxRIwqH7JaKC+Fcdf21KAtIMb9mUBVjKA4jEeali9PvLV7
   VmciHyXClWCwATnJnpFIr9lyAYLPmWaiwSGzSoctrbdtF3RRQCIB8twr6
   2sTNS8p8rsaOPAj+yk5fIyEBHARN5D1jHlo3I3hubGPrN+vWnNoNSlpPo
   DYTMe4X+NowA4z428yBB2Bl+b4PY4Bw41RBPo3rf172m5MGdyac0TlHkl
   hV0opk6Dyx5kAAN4ZIXJtWMApFXJ8+x91XoI0X6+/8D9vdIZlIUfZWm1T
   fneH7oFwojf57aFImMC0ani5afJmSHRuBdlhJOfu0+JkO8doYw6ArMs/V
   w==;
X-CSE-ConnectionGUID: vPqw9Xv2SNO0u4CaOEKzlA==
X-CSE-MsgGUID: +wW2OFsOSwOva+2z7M/oiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47734274"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="47734274"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:32:33 -0800
X-CSE-ConnectionGUID: Iup17qO5TfW+LHRYx+sd4w==
X-CSE-MsgGUID: ccvojNUSScCslLfVQp5qkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102477424"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2025 17:32:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUySK-000E6F-2p;
	Tue, 07 Jan 2025 01:32:28 +0000
Date: Tue, 7 Jan 2025 09:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 4/6] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS
 call support
Message-ID: <202501070900.m80uMe9o-lkp@intel.com>
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
[also build test WARNING on powerpc/fixes linus/master v6.13-rc6 next-20250106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-HCALLs/20250105-045010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250104204652.388720-5-haren%40linux.ibm.com
patch subject: [PATCH 4/6] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r061-20250107 (https://download.01.org/0day-ci/archive/20250107/202501070900.m80uMe9o-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501070900.m80uMe9o-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/papr-indices.c:410:2-8: preceding lock on line 407

vim +410 arch/powerpc/platforms/pseries/papr-indices.c

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
3f48afd07934e4 Haren Myneni 2025-01-04 @407  	mutex_lock(&rtas_ibm_set_dynamic_indicator_lock);
3f48afd07934e4 Haren Myneni 2025-01-04  408  	work_area = papr_dynamic_indice_buf_from_user(ubuf, &kbuf);
3f48afd07934e4 Haren Myneni 2025-01-04  409  	if (IS_ERR(work_area))
3f48afd07934e4 Haren Myneni 2025-01-04 @410  		return PTR_ERR(work_area);
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
3f48afd07934e4 Haren Myneni 2025-01-04  438  	return ret;
3f48afd07934e4 Haren Myneni 2025-01-04  439  }
3f48afd07934e4 Haren Myneni 2025-01-04  440  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
