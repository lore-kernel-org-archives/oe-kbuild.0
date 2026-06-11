Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170983F39C5
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781200398; cv=none; b=WArk/FnjrigLvU1QC/KgC+l55CyFTg9nsdbb/bWu+DL6DjVZGu5MG0zd5ME1sQbDomO6GjKvbBr64e87YmLGBiMbinXqWHBCWSkKZeuKdco9OvIMglyZiCDx2H5ewTv3KROxsyDVCKhvCp2HdqTHy6tnUNwxLnbJ9EWDTvfxihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781200398; c=relaxed/simple;
	bh=7JzPxGXVFEOd3mfZ82bgaG/1NlJOKpMM5Bzw4q7uQzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G1pXNi19EI0rKp80xMY2prayjpZMF1i/2+5wI6aX8FSaJKJUxaMeEj6aqufz3BQ3PjBGshqHA3MzGY8MVc0MQeECXCso5052lj343l3I/blBYeJunja2CmUWwIz6XY48ibTNCQ2FJhQVWIk381Uh8LZXNh8XMiIEJTog9zWB2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqJqNQG6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqJqNQG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781200397; x=1812736397;
  h=date:from:to:cc:subject:message-id;
  bh=7JzPxGXVFEOd3mfZ82bgaG/1NlJOKpMM5Bzw4q7uQzY=;
  b=XqJqNQG6yUuZBJy0tETbRMea6LW0+SrLTnmPLih9FFjV9a1/BFeX695v
   hNFHv/n0yvqJf/DofslH3kS3P3HrJ2qI+7A6vM8LpdGvtyX7GaeJiNhsx
   N8u4Kdon/eQi+aBgCg+zewUddOHyf03LFMDuNy9vejH6nethIArqVLVW9
   tEH/PdUJtS6ZETO0p+S3sc6grFt+T2p9IFeDtbDYFZXyQ9qspsV7XHAfg
   9918vajaXO8G5Fkvxp//eDAUDtl5iGVj67mTt1x4JVcCSu+D4vFXAebgG
   PQVAnZ0zeACy0Nr7tF+h7xbkXptfJmhkmmbhqD7TElOZBOWEYwFkAk11a
   A==;
X-CSE-ConnectionGUID: S7U1JQn+TCuGMXu0MHDENQ==
X-CSE-MsgGUID: QmFCglX4QvqhtfRKHbssjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92589157"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92589157"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 10:53:17 -0700
X-CSE-ConnectionGUID: 9wgZVqb/Sfqlxbuxq0zrDg==
X-CSE-MsgGUID: ScqEHs3tTSi8HgrzG0LIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270584786"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jun 2026 10:53:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXjab-00000000Nbs-0xi9;
	Thu, 11 Jun 2026 17:53:13 +0000
Date: Fri, 12 Jun 2026 01:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tee/tee_core.c:735 tee_ioctl_object_invoke() warn:
 potential user controlled sizeof overflow '20 + (size_mul(32,
 (arg.num_params)))' '20 + 0-u32max'
Message-ID: <202606120103.SdH926p3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: d5b8b0fa1775d8b59c3fc9e4aa2baa715d08f3ee tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
date:   9 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260612/202606120103.SdH926p3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d5b8b0fa1775 ("tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606120103.SdH926p3-lkp@intel.com/

smatch warnings:
drivers/tee/tee_core.c:735 tee_ioctl_object_invoke() warn: potential user controlled sizeof overflow '20 + (size_mul(32, (arg.num_params)))' '20 + 0-u32max'

vim +735 drivers/tee/tee_core.c

967c9cca2cc5056 Jens Wiklander   2015-03-11  709  
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  710  static int tee_ioctl_object_invoke(struct tee_context *ctx,
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  711  				   struct tee_ioctl_buf_data __user *ubuf)
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  712  {
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  713  	int rc;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  714  	size_t n;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  715  	struct tee_ioctl_buf_data buf;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  716  	struct tee_ioctl_object_invoke_arg __user *uarg;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  717  	struct tee_ioctl_object_invoke_arg arg;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  718  	struct tee_ioctl_param __user *uparams = NULL;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  719  	struct tee_param *params = NULL;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  720  
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  721  	if (!ctx->teedev->desc->ops->object_invoke_func)
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  722  		return -EINVAL;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  723  
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  724  	if (copy_from_user(&buf, ubuf, sizeof(buf)))
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  725  		return -EFAULT;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  726  
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  727  	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  728  	    buf.buf_len < sizeof(struct tee_ioctl_object_invoke_arg))
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  729  		return -EINVAL;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  730  
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  731  	uarg = u64_to_user_ptr(buf.buf_ptr);
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  732  	if (copy_from_user(&arg, uarg, sizeof(arg)))
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  733  		return -EFAULT;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  734  
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11 @735  	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  736  		return -EINVAL;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  737  
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  738  	if (arg.num_params) {
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  739  		params = kcalloc(arg.num_params, sizeof(struct tee_param),
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  740  				 GFP_KERNEL);
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  741  		if (!params)
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  742  			return -ENOMEM;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  743  		uparams = uarg->params;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  744  		rc = params_from_user(ctx, params, arg.num_params, uparams);
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  745  		if (rc)
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  746  			goto out;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  747  	}
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  748  
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  749  	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  750  	if (rc)
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  751  		goto out;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  752  
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  753  	if (put_user(arg.ret, &uarg->ret)) {
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  754  		rc = -EFAULT;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  755  		goto out;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  756  	}
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  757  	rc = params_to_user(uparams, arg.num_params, params);
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  758  out:
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  759  	if (params) {
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  760  		/* Decrease ref count for all valid shared memory pointers */
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  761  		for (n = 0; n < arg.num_params; n++)
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  762  			if (tee_param_is_memref(params + n) &&
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  763  			    params[n].u.memref.shm)
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  764  				tee_shm_put(params[n].u.memref.shm);
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  765  		kfree(params);
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  766  	}
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  767  	return rc;
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  768  }
d5b8b0fa1775d8b Amirreza Zarrabi 2025-09-11  769  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
