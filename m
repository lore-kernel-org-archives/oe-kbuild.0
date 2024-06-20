Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD52110F
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 02:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718850133; cv=none; b=RVVqEuL3dS96IR7+WL/hpTPbUsEpAtLtVWZwc0K/tbHmnqn38L1+ZNZXB2P5Th7XbF2fbsFBm0Qrtahg0x/V6+TzZfWdNejdSPoVaAOFMkEMmV5suONn5fc6tllluwei4eh0cUAEusjQ219XOSiQ4PH53dul4qo+PjPmy+HQXPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718850133; c=relaxed/simple;
	bh=NwT2Ox+Q22QIi2MPf3UKHzv9vpkifNX5z6UqBenZojo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QL4jtrhTwMMy24x6fgX8bdq4zcS5lGpeEbqxWhq7QdUlh6qLqSVeoSeeuw4SnPwAjSS1eDt+5SqQUO8t/MhotPRcPw6UgZbpJwUa9KZJuZJD8GSRg9gQoQwOBlJggPfrLmko84iqB4XXMo5QA7mFLZSfav8EUYS+VQ5HZYjBUHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzxqLlBA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzxqLlBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718850131; x=1750386131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NwT2Ox+Q22QIi2MPf3UKHzv9vpkifNX5z6UqBenZojo=;
  b=JzxqLlBAudzTM45YDOYjScA4v6g65t3DyNB0316NJ8A7NdmbnKa9bdTg
   EeKoRJzYybn9oo46/QJxZsl68/aKtjoBImaYVfjpT560nvJzxsmu8HxMS
   4f9UUuAXqsUHb3Qe5x0cR7lKC7cCNpSMkRR+woQE0mu1CRKzsUXpjBtwr
   LTLMMNnCIO/3B5uPZB5MhXls1PziZ2MNs9EGl2jcg9OdXylhsKi2oBZiH
   cWWd5T/lAo/vb5KoE7lfdd9eMlTO/rOGTyK2ZhyeNWVrlzt++TvfUxBBz
   Pah3DSHy7xrMG6Ghchxj5skMtuc/lXeCeirMInXyZ9ubEIywftJEl/97z
   Q==;
X-CSE-ConnectionGUID: +WWrTaIAQBqdUhur3greHw==
X-CSE-MsgGUID: I8Qx2aUqQYqIF89qffYWzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="16037599"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="16037599"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 19:22:10 -0700
X-CSE-ConnectionGUID: TK+GBHvkQuWll7twfH4E5A==
X-CSE-MsgGUID: qL/XxQ+LTFSskVEbrzZ45w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42192109"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jun 2024 19:22:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK7R8-0007Df-2H;
	Thu, 20 Jun 2024 02:22:06 +0000
Date: Thu, 20 Jun 2024 10:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6398/7105] drivers/gpu/drm/xe/xe_oa.c:384
 xe_oa_stream_open_ioctl() error: we previously assumed 'oa->xe' could be
 null (see line 383)
Message-ID: <202406201042.bFrB7KXl-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: b6fd51c6211910b1db072a3fa2a17ba85cb3dd51 [6398/7105] drm/xe/oa/uapi: Define and parse OA stream properties
:::::: branch date: 11 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201042.bFrB7KXl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406201042.bFrB7KXl-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_oa.c:384 xe_oa_stream_open_ioctl() error: we previously assumed 'oa->xe' could be null (see line 383)

Old smatch warnings:
drivers/gpu/drm/xe/xe_oa.c:657 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 656)
drivers/gpu/drm/xe/xe_oa.c:756 xe_oa_remove_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 755)

vim +384 drivers/gpu/drm/xe/xe_oa.c

b6fd51c6211910b Ashutosh Dixit 2024-06-17  363  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  364  /**
b6fd51c6211910b Ashutosh Dixit 2024-06-17  365   * xe_oa_stream_open_ioctl - Opens an OA stream
b6fd51c6211910b Ashutosh Dixit 2024-06-17  366   * @dev: @drm_device
b6fd51c6211910b Ashutosh Dixit 2024-06-17  367   * @data: pointer to struct @drm_xe_oa_config
b6fd51c6211910b Ashutosh Dixit 2024-06-17  368   * @file: @drm_file
b6fd51c6211910b Ashutosh Dixit 2024-06-17  369   *
b6fd51c6211910b Ashutosh Dixit 2024-06-17  370   * The functions opens an OA stream. An OA stream, opened with specified
b6fd51c6211910b Ashutosh Dixit 2024-06-17  371   * properties, enables perf counter samples to be collected, either
b6fd51c6211910b Ashutosh Dixit 2024-06-17  372   * periodically (time based sampling), or on request (using perf queries)
b6fd51c6211910b Ashutosh Dixit 2024-06-17  373   */
b6fd51c6211910b Ashutosh Dixit 2024-06-17  374  int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
b6fd51c6211910b Ashutosh Dixit 2024-06-17  375  {
b6fd51c6211910b Ashutosh Dixit 2024-06-17  376  	struct xe_oa *oa = &to_xe_device(dev)->oa;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  377  	struct xe_file *xef = to_xe_file(file);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  378  	struct xe_oa_open_param param = {};
b6fd51c6211910b Ashutosh Dixit 2024-06-17  379  	const struct xe_oa_format *f;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  380  	bool privileged_op = true;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  381  	int ret;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  382  
b6fd51c6211910b Ashutosh Dixit 2024-06-17 @383  	if (!oa->xe) {
b6fd51c6211910b Ashutosh Dixit 2024-06-17 @384  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
b6fd51c6211910b Ashutosh Dixit 2024-06-17  385  		return -ENODEV;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  386  	}
b6fd51c6211910b Ashutosh Dixit 2024-06-17  387  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  388  	ret = xe_oa_user_extensions(oa, data, 0, &param);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  389  	if (ret)
b6fd51c6211910b Ashutosh Dixit 2024-06-17  390  		return ret;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  391  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  392  	if (param.exec_queue_id > 0) {
b6fd51c6211910b Ashutosh Dixit 2024-06-17  393  		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  394  		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
b6fd51c6211910b Ashutosh Dixit 2024-06-17  395  			return -ENOENT;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  396  	}
b6fd51c6211910b Ashutosh Dixit 2024-06-17  397  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  398  	/*
b6fd51c6211910b Ashutosh Dixit 2024-06-17  399  	 * Query based sampling (using MI_REPORT_PERF_COUNT) with OAR/OAC,
b6fd51c6211910b Ashutosh Dixit 2024-06-17  400  	 * without global stream access, can be an unprivileged operation
b6fd51c6211910b Ashutosh Dixit 2024-06-17  401  	 */
b6fd51c6211910b Ashutosh Dixit 2024-06-17  402  	if (param.exec_q && !param.sample)
b6fd51c6211910b Ashutosh Dixit 2024-06-17  403  		privileged_op = false;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  404  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  405  	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
b6fd51c6211910b Ashutosh Dixit 2024-06-17  406  		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
b6fd51c6211910b Ashutosh Dixit 2024-06-17  407  		ret = -EACCES;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  408  		goto err_exec_q;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  409  	}
b6fd51c6211910b Ashutosh Dixit 2024-06-17  410  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  411  	if (!param.exec_q && !param.sample) {
b6fd51c6211910b Ashutosh Dixit 2024-06-17  412  		drm_dbg(&oa->xe->drm, "Only OA report sampling supported\n");
b6fd51c6211910b Ashutosh Dixit 2024-06-17  413  		ret = -EINVAL;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  414  		goto err_exec_q;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  415  	}
b6fd51c6211910b Ashutosh Dixit 2024-06-17  416  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  417  	ret = xe_oa_assign_hwe(oa, &param);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  418  	if (ret)
b6fd51c6211910b Ashutosh Dixit 2024-06-17  419  		goto err_exec_q;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  420  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  421  	f = &oa->oa_formats[param.oa_format];
b6fd51c6211910b Ashutosh Dixit 2024-06-17  422  	if (!param.oa_format || !f->size ||
b6fd51c6211910b Ashutosh Dixit 2024-06-17  423  	    !engine_supports_oa_format(param.hwe, f->type)) {
b6fd51c6211910b Ashutosh Dixit 2024-06-17  424  		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
b6fd51c6211910b Ashutosh Dixit 2024-06-17  425  			param.oa_format, f->type, f->size, param.hwe->class);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  426  		ret = -EINVAL;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  427  		goto err_exec_q;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  428  	}
b6fd51c6211910b Ashutosh Dixit 2024-06-17  429  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  430  	if (param.period_exponent > 0) {
b6fd51c6211910b Ashutosh Dixit 2024-06-17  431  		u64 oa_period, oa_freq_hz;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  432  
b6fd51c6211910b Ashutosh Dixit 2024-06-17  433  		/* Requesting samples from OAG buffer is a privileged operation */
b6fd51c6211910b Ashutosh Dixit 2024-06-17  434  		if (!param.sample) {
b6fd51c6211910b Ashutosh Dixit 2024-06-17  435  			drm_dbg(&oa->xe->drm, "OA_EXPONENT specified without SAMPLE_OA\n");
b6fd51c6211910b Ashutosh Dixit 2024-06-17  436  			ret = -EINVAL;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  437  			goto err_exec_q;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  438  		}
b6fd51c6211910b Ashutosh Dixit 2024-06-17  439  		oa_period = oa_exponent_to_ns(param.hwe->gt, param.period_exponent);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  440  		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  441  		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  442  	}
b6fd51c6211910b Ashutosh Dixit 2024-06-17  443  err_exec_q:
b6fd51c6211910b Ashutosh Dixit 2024-06-17  444  	if (ret < 0 && param.exec_q)
b6fd51c6211910b Ashutosh Dixit 2024-06-17  445  		xe_exec_queue_put(param.exec_q);
b6fd51c6211910b Ashutosh Dixit 2024-06-17  446  	return ret;
b6fd51c6211910b Ashutosh Dixit 2024-06-17  447  }
b6fd51c6211910b Ashutosh Dixit 2024-06-17  448  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
