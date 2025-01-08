Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2434202C2D
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 21:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736373240; cv=none; b=mn39N7fV57DDXoS44/QfXWNCGFYUTVRJ69UEHvyXyfz6g01lS0IVSwe+NLVXnP8K2TW7o62dBxZ62JfHIi0kLASQDE4rQahg7Fl33FZW0cwZql2xSfWAJJo/bQJL5lPUqgdrZQem5Fxwqr5IaEk61k023F12CRMiQfyNkm60DUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736373240; c=relaxed/simple;
	bh=+F9MasceEoIxdDRJXWH7vFUrmojD07tDrTSpCLo7qYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ir/s2gADoxtmNMpl4xUK4CuuNUjfIicI9BCGju0Va90f3j+kU16uHY0ngFzzvnn6wUpxihlaVYK4eWDxBoxsdY5a1UPXGTpR2obkn3VV1ejK+Q3wejE/+rvKK+Wco50f3r++MB8T29kVqAxErwUWqjDKv3Hsze2u6tA6xBRzO6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxenpKTb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxenpKTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736373239; x=1767909239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+F9MasceEoIxdDRJXWH7vFUrmojD07tDrTSpCLo7qYg=;
  b=TxenpKTbR5DIG1tMVPPGFUA1RZXz8g60xzBLDc3zdBuQopVmLMoii7y5
   0+9qPD9XqugLxIoMOuN6+Pjf8iwMKET6y+n5Nrsqi/GxPbMgQAiiydXND
   +Qcon9ifVsMF89D8jNqv8wDqhgZj0i7v2F9VC7LmebUBlP4aFmNiHz57U
   I0f8oRGZsa+313VV4O4wcOC/zvbaxd5ZqRPkL1Lw3NLJI0q3PlS6hRMET
   yBGK8AvZE4D96QMmkd3fbcc6RbkYeJrQ+V0mzZ6iSOTjCS5bM4b7m1bkC
   sytVpw3MDuWsdvtx/E/uR3F/duZAzezAn1tVo0qZAlrAa6wj4IN+5hc40
   A==;
X-CSE-ConnectionGUID: AV63NMLPTYWb/bqVdC4KOg==
X-CSE-MsgGUID: w9Qxcj4uTY+UsWpAzGOnDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="24223549"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="24223549"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 13:53:58 -0800
X-CSE-ConnectionGUID: 0pxiJRyRRVON3+HYHtxyBQ==
X-CSE-MsgGUID: hUh//elTRYiragJaucWc3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108268931"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Jan 2025 13:53:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVdzu-000Giz-01;
	Wed, 08 Jan 2025 21:53:54 +0000
Date: Thu, 9 Jan 2025 05:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/6] powerpc/pseries: Add ibm,get-dynamic-sensor-state
 RTAS call support
Message-ID: <202501090552.UzEfb4QU-lkp@intel.com>
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
In-Reply-To: <20250104204652.388720-6-haren@linux.ibm.com>
References: <20250104204652.388720-6-haren@linux.ibm.com>
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
patch link:    https://lore.kernel.org/r/20250104204652.388720-6-haren%40linux.ibm.com
patch subject: [PATCH 5/6] powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r071-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090552.UzEfb4QU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501090552.UzEfb4QU-lkp@intel.com/

New smatch warnings:
arch/powerpc/platforms/pseries/papr-indices.c:496 papr_dynamic_sensor_ioc_get() warn: inconsistent returns 'global &rtas_ibm_get_dynamic_sensor_state_lock'.

Old smatch warnings:
arch/powerpc/platforms/pseries/papr-indices.c:438 papr_dynamic_indicator_ioc_set() warn: inconsistent returns 'global &rtas_ibm_set_dynamic_indicator_lock'.

vim +496 arch/powerpc/platforms/pseries/papr-indices.c

3f48afd07934e4 Haren Myneni 2025-01-04  440  
e44fb25ad9fa03 Haren Myneni 2025-01-04  441  /**
e44fb25ad9fa03 Haren Myneni 2025-01-04  442   * papr_dynamic_sensor_ioc_get - ibm,get-dynamic-sensor-state RTAS Call
e44fb25ad9fa03 Haren Myneni 2025-01-04  443   * PAPR 2.13 7.3.19
e44fb25ad9fa03 Haren Myneni 2025-01-04  444   *
e44fb25ad9fa03 Haren Myneni 2025-01-04  445   * @ubuf: Input parameters to RTAS call such as sensor token
e44fb25ad9fa03 Haren Myneni 2025-01-04  446   *        Copies the state in user space buffer.
e44fb25ad9fa03 Haren Myneni 2025-01-04  447   *
e44fb25ad9fa03 Haren Myneni 2025-01-04  448   *
e44fb25ad9fa03 Haren Myneni 2025-01-04  449   * Returns success or -errno.
e44fb25ad9fa03 Haren Myneni 2025-01-04  450   */
e44fb25ad9fa03 Haren Myneni 2025-01-04  451  
e44fb25ad9fa03 Haren Myneni 2025-01-04  452  static long papr_dynamic_sensor_ioc_get(struct papr_indices_io_block __user *ubuf)
e44fb25ad9fa03 Haren Myneni 2025-01-04  453  {
e44fb25ad9fa03 Haren Myneni 2025-01-04  454  	struct papr_indices_io_block kbuf;
e44fb25ad9fa03 Haren Myneni 2025-01-04  455  	struct rtas_work_area *work_area;
e44fb25ad9fa03 Haren Myneni 2025-01-04  456  	s32 fwrc, token, ret;
e44fb25ad9fa03 Haren Myneni 2025-01-04  457  	u32 rets;
e44fb25ad9fa03 Haren Myneni 2025-01-04  458  
e44fb25ad9fa03 Haren Myneni 2025-01-04  459  	token = rtas_function_token(RTAS_FN_IBM_GET_DYNAMIC_SENSOR_STATE);
e44fb25ad9fa03 Haren Myneni 2025-01-04  460  	if (token == RTAS_UNKNOWN_SERVICE)
e44fb25ad9fa03 Haren Myneni 2025-01-04  461  		return -ENOENT;
e44fb25ad9fa03 Haren Myneni 2025-01-04  462  
e44fb25ad9fa03 Haren Myneni 2025-01-04  463  	mutex_lock(&rtas_ibm_get_dynamic_sensor_state_lock);
e44fb25ad9fa03 Haren Myneni 2025-01-04  464  	work_area = papr_dynamic_indice_buf_from_user(ubuf, &kbuf);
e44fb25ad9fa03 Haren Myneni 2025-01-04  465  	if (IS_ERR(work_area))
e44fb25ad9fa03 Haren Myneni 2025-01-04  466  		return PTR_ERR(work_area);
e44fb25ad9fa03 Haren Myneni 2025-01-04  467  
e44fb25ad9fa03 Haren Myneni 2025-01-04  468  	do {
e44fb25ad9fa03 Haren Myneni 2025-01-04  469  		fwrc = rtas_call(token, 2, 2, &rets,
e44fb25ad9fa03 Haren Myneni 2025-01-04  470  				kbuf.dynamic_param.token,
e44fb25ad9fa03 Haren Myneni 2025-01-04  471  				rtas_work_area_phys(work_area));
e44fb25ad9fa03 Haren Myneni 2025-01-04  472  	} while (rtas_busy_delay(fwrc));
e44fb25ad9fa03 Haren Myneni 2025-01-04  473  
e44fb25ad9fa03 Haren Myneni 2025-01-04  474  	rtas_work_area_free(work_area);
e44fb25ad9fa03 Haren Myneni 2025-01-04  475  	mutex_unlock(&rtas_ibm_get_dynamic_sensor_state_lock);
e44fb25ad9fa03 Haren Myneni 2025-01-04  476  
e44fb25ad9fa03 Haren Myneni 2025-01-04  477  	switch (fwrc) {
e44fb25ad9fa03 Haren Myneni 2025-01-04  478  	case RTAS_IBM_DYNAMIC_INDICE_SUCCESS:
e44fb25ad9fa03 Haren Myneni 2025-01-04  479  		if (put_user(rets, &ubuf->dynamic_param.state))
e44fb25ad9fa03 Haren Myneni 2025-01-04  480  			ret = -EFAULT;
e44fb25ad9fa03 Haren Myneni 2025-01-04  481  		else
e44fb25ad9fa03 Haren Myneni 2025-01-04  482  			ret = 0;
e44fb25ad9fa03 Haren Myneni 2025-01-04  483  		break;
e44fb25ad9fa03 Haren Myneni 2025-01-04  484  	case RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR:	/* No such indicator */
e44fb25ad9fa03 Haren Myneni 2025-01-04  485  		ret = -EOPNOTSUPP;
e44fb25ad9fa03 Haren Myneni 2025-01-04  486  		break;
e44fb25ad9fa03 Haren Myneni 2025-01-04  487  	default:
e44fb25ad9fa03 Haren Myneni 2025-01-04  488  		pr_err("unexpected ibm,get-dynamic-sensor result %d\n",
e44fb25ad9fa03 Haren Myneni 2025-01-04  489  				fwrc);
e44fb25ad9fa03 Haren Myneni 2025-01-04  490  		fallthrough;
e44fb25ad9fa03 Haren Myneni 2025-01-04  491  	case RTAS_IBM_DYNAMIC_INDICE_HW_ERROR:	/* Hardware/platform error */
e44fb25ad9fa03 Haren Myneni 2025-01-04  492  		ret = -EIO;
e44fb25ad9fa03 Haren Myneni 2025-01-04  493  		break;
e44fb25ad9fa03 Haren Myneni 2025-01-04  494  	}
e44fb25ad9fa03 Haren Myneni 2025-01-04  495  
e44fb25ad9fa03 Haren Myneni 2025-01-04 @496  	return ret;
e44fb25ad9fa03 Haren Myneni 2025-01-04  497  }
e44fb25ad9fa03 Haren Myneni 2025-01-04  498  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
