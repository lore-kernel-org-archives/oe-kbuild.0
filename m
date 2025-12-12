Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3022D2D2387
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765579360; cv=none; b=Qj6qrEfZJuFfTq3iOoRYSRlCgFeHZmy9bi+4v5h3Vtdvklz4XlBSmCoAVtFLiSTRLMLXzRYP/MFpxTCviEWXXIONWAIsJXduhm+e7PaLNXpbSD7JwIsKnMXJrN2w5Eh+PEAUqB+GurSmB1GO1G5RTpBGdw+1Oa0H+tj1lQil3sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765579360; c=relaxed/simple;
	bh=5AFxR/N00p5UExzM9U2DY3IO9hLxS32oxbP8GVUIBGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYBsV5ILXWbN82gXUbbWOSr1D+QCm9PPGSl0jn5uTdHt2eHtMQPwUJrhq9UnG/CwKYZpobG22eLZpiQTEGFQYE0IphmNo28BXMoIT+folEAjCmqApfJbebxjLVeXTWgQs4pxnF3dA8Ecbr8n8YoQ1pe/JpeKY8bVOUrvyrzSwyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9bETPgD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9bETPgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765579358; x=1797115358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5AFxR/N00p5UExzM9U2DY3IO9hLxS32oxbP8GVUIBGQ=;
  b=e9bETPgDxSRiXZ/6v16tlkkd55AblWAQtGCCvJqa4+kedD9jlZacY9qJ
   jrdae9uhlj3gtS4Vx/LKLd5rJLYmT8BqiAi9PixWLbOc4LR9UBgHD5ktD
   4YV9JAN8hG4q6TTBWBFC8PICdnNiQNK2JrTPjOgGiGkPV1SZ0Kqo3bmVY
   1CKhEF1HcjxKCKParOwQrXz/7GXOmcO4D0XnbPaLLwCPak7R8EheTA9/R
   m2JhOSmbsDWMl3xBWiZQ2EQ6f+Dv1ZAUpmPG/jnmaSxwWp0rsXI9QfL7I
   pqw1568VnIotffXNOuWiJINEvGkiHl0u6PnhabDn4VSEEBUG6ByBDFjiJ
   A==;
X-CSE-ConnectionGUID: 5w/jIJACQhaUhVc2h0MkBA==
X-CSE-MsgGUID: 5l9R7/tJTYiDdFzLW7LNcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67626951"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67626951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:42:36 -0800
X-CSE-ConnectionGUID: 52d13qVjRJCdLC6WER/jlA==
X-CSE-MsgGUID: NVaCRMlYTcOVMrrJUdNmSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197260104"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 14:42:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBqK-000000006iP-1jzX;
	Fri, 12 Dec 2025 22:42:32 +0000
Date: Sat, 13 Dec 2025 06:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tee/tee_core.c:735 tee_ioctl_object_invoke() warn: potential
 user controlled sizeof overflow '20 + (size_mul(32, (arg.num_params)))' '20
 + 0-u32max'
Message-ID: <202512130645.3njk1yxJ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: d5b8b0fa1775d8b59c3fc9e4aa2baa715d08f3ee tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: csky-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130645.3njk1yxJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130645.3njk1yxJ-lkp@intel.com/

New smatch warnings:
drivers/tee/tee_core.c:735 tee_ioctl_object_invoke() warn: potential user controlled sizeof overflow '20 + (size_mul(32, (arg.num_params)))' '20 + 0-u32max'

Old smatch warnings:
arch/csky/include/asm/uaccess.h:191 __get_user_fn() error: uninitialized symbol 'retval'.

vim +735 drivers/tee/tee_core.c

967c9cca2cc505 Jens Wiklander   2015-03-11  709  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  710  static int tee_ioctl_object_invoke(struct tee_context *ctx,
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  711  				   struct tee_ioctl_buf_data __user *ubuf)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  712  {
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  713  	int rc;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  714  	size_t n;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  715  	struct tee_ioctl_buf_data buf;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  716  	struct tee_ioctl_object_invoke_arg __user *uarg;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  717  	struct tee_ioctl_object_invoke_arg arg;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  718  	struct tee_ioctl_param __user *uparams = NULL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  719  	struct tee_param *params = NULL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  720  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  721  	if (!ctx->teedev->desc->ops->object_invoke_func)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  722  		return -EINVAL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  723  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  724  	if (copy_from_user(&buf, ubuf, sizeof(buf)))
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  725  		return -EFAULT;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  726  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  727  	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  728  	    buf.buf_len < sizeof(struct tee_ioctl_object_invoke_arg))
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  729  		return -EINVAL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  730  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  731  	uarg = u64_to_user_ptr(buf.buf_ptr);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  732  	if (copy_from_user(&arg, uarg, sizeof(arg)))
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  733  		return -EFAULT;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  734  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11 @735  	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  736  		return -EINVAL;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  737  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  738  	if (arg.num_params) {
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  739  		params = kcalloc(arg.num_params, sizeof(struct tee_param),
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  740  				 GFP_KERNEL);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  741  		if (!params)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  742  			return -ENOMEM;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  743  		uparams = uarg->params;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  744  		rc = params_from_user(ctx, params, arg.num_params, uparams);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  745  		if (rc)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  746  			goto out;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  747  	}
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  748  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  749  	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  750  	if (rc)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  751  		goto out;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  752  
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  753  	if (put_user(arg.ret, &uarg->ret)) {
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  754  		rc = -EFAULT;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  755  		goto out;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  756  	}
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  757  	rc = params_to_user(uparams, arg.num_params, params);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  758  out:
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  759  	if (params) {
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  760  		/* Decrease ref count for all valid shared memory pointers */
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  761  		for (n = 0; n < arg.num_params; n++)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  762  			if (tee_param_is_memref(params + n) &&
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  763  			    params[n].u.memref.shm)
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  764  				tee_shm_put(params[n].u.memref.shm);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  765  		kfree(params);
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  766  	}
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  767  	return rc;
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  768  }
d5b8b0fa1775d8 Amirreza Zarrabi 2025-09-11  769  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
