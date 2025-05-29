Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E1CA5A
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 00:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748479933; cv=none; b=ZhWSluSYnuShdmD6KgG/LohR9YK+qegB6sFZ0foDxw5Gy5zzOBSpMiJ2w/9XS6t25oHGiDoXRvbjc4LAkkAfpConQrI0TXHfmSph+WC3nPboICwe3TgzWvZG2SxxqpJMJHyaRIRLoFajJ9wozS2AhLjts6F8UrFjnbVvrz/hkoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748479933; c=relaxed/simple;
	bh=c4mFmuc5p1F6zGh/Wn0LTQymbj/Jxlquxw3l+RG+qII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLpKzXrG7v7tK1WuVEhUklGLQgbcS8IGgA3xqgq3/tUYjG8DptY836sucO+TrqLOxohB6lXby6zcJDyhIwGzl2lmI90xdqqDZKFmA98XgHWy7IdbbqXPhuxPayAl5pTtlT4Jm+Eng9JN5+AXyig2lKXQIDzgZdYnTSIEfVE+ivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFN6rehC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFN6rehC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748479932; x=1780015932;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=c4mFmuc5p1F6zGh/Wn0LTQymbj/Jxlquxw3l+RG+qII=;
  b=hFN6rehC8Whk9tbM939gmrIwaZkFVdktnhYymd7Fp4HtG3t//z0wEcAY
   9C7ZsLTihjczemph8Ph1rMqwxFv7s0yrH0Wxv8xZ50aluCSepylklU3W2
   LMJx9K/WZIbYZ21N4bBOFW6SkZwlOcgBiAUrvnJocm6iP++vlhN3M/liP
   Pnrt5BWCdeTs5sMNSO1ZqdmuqP+lYFkTY0uxRaOAqiOyNrPHmtFcv2Beu
   jq2SNyzrA3wH8LyP2//xbuVzPO5kiWg+kDXHqCxCexWPwI6YrKe73uBfZ
   HE3LwahNSY0prjINp/dEB4MGuKOJNpjU14V+LqY+ySsir77iSsIU++s3L
   A==;
X-CSE-ConnectionGUID: 2k6fcux+TrmTxlZ7/fAFNw==
X-CSE-MsgGUID: B8xxLwB1QCKNyLME80CGYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61162135"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="61162135"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 17:52:11 -0700
X-CSE-ConnectionGUID: oS5HSrSgSAKmkhpPCRpoXw==
X-CSE-MsgGUID: B1UmKalKSVCtjPkmqIM8ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="144388801"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 17:52:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKRV9-000WC4-16;
	Thu, 29 May 2025 00:52:07 +0000
Date: Thu, 29 May 2025 08:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 04/12] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
Message-ID: <202505291057.N4etaYkM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-4-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-4-024e3221b0b9@oss.qualcomm.com>
TO: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
TO: Jens Wiklander <jens.wiklander@linaro.org>
TO: Sumit Garg <sumit.garg@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
TO: Apurupa Pattapu <quic_apurupa@quicinc.com>
TO: Kees Cook <kees@kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian König" <christian.koenig@amd.com>
CC: Harshal Dev <quic_hdev@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: op-tee@lists.trustedfirmware.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linaro-mm-sig@lists.linaro.org
CC: linux-doc@vger.kernel.org
CC: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3be1a7a31fbda82f3604b6c31e4f390110de1b46]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250527-151020
base:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
patch link:    https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-4-024e3221b0b9%40oss.qualcomm.com
patch subject: [PATCH v5 04/12] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250528 (https://download.01.org/0day-ci/archive/20250529/202505291057.N4etaYkM-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505291057.N4etaYkM-lkp@intel.com/

smatch warnings:
drivers/tee/tee_core.c:663 tee_ioctl_object_invoke() warn: potential user controlled sizeof overflow '20 + (size_mul(32, (arg.num_params)))' '20 + 0-u32max'

vim +663 drivers/tee/tee_core.c

967c9cca2cc505 Jens Wiklander   2015-03-11  637  
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  638  static int tee_ioctl_object_invoke(struct tee_context *ctx,
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  639  				   struct tee_ioctl_buf_data __user *ubuf)
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  640  {
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  641  	int rc;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  642  	size_t n;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  643  	struct tee_ioctl_buf_data buf;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  644  	struct tee_ioctl_object_invoke_arg __user *uarg;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  645  	struct tee_ioctl_object_invoke_arg arg;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  646  	struct tee_ioctl_param __user *uparams = NULL;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  647  	struct tee_param *params = NULL;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  648  
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  649  	if (!ctx->teedev->desc->ops->object_invoke_func)
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  650  		return -EINVAL;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  651  
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  652  	if (copy_from_user(&buf, ubuf, sizeof(buf)))
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  653  		return -EFAULT;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  654  
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  655  	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  656  	    buf.buf_len < sizeof(struct tee_ioctl_object_invoke_arg))
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  657  		return -EINVAL;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  658  
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  659  	uarg = u64_to_user_ptr(buf.buf_ptr);
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  660  	if (copy_from_user(&arg, uarg, sizeof(arg)))
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  661  		return -EFAULT;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  662  
09b9872cb1e288 Amirreza Zarrabi 2025-05-26 @663  	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  664  		return -EINVAL;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  665  
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  666  	if (arg.num_params) {
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  667  		params = kcalloc(arg.num_params, sizeof(struct tee_param),
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  668  				 GFP_KERNEL);
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  669  		if (!params)
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  670  			return -ENOMEM;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  671  		uparams = uarg->params;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  672  		rc = params_from_user(ctx, params, arg.num_params, uparams);
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  673  		if (rc)
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  674  			goto out;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  675  	}
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  676  
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  677  	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  678  	if (rc)
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  679  		goto out;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  680  
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  681  	if (put_user(arg.ret, &uarg->ret)) {
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  682  		rc = -EFAULT;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  683  		goto out;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  684  	}
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  685  	rc = params_to_user(uparams, arg.num_params, params);
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  686  out:
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  687  	if (params) {
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  688  		/* Decrease ref count for all valid shared memory pointers */
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  689  		for (n = 0; n < arg.num_params; n++)
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  690  			if (tee_param_is_memref(params + n) &&
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  691  			    params[n].u.memref.shm)
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  692  				tee_shm_put(params[n].u.memref.shm);
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  693  		kfree(params);
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  694  	}
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  695  	return rc;
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  696  }
09b9872cb1e288 Amirreza Zarrabi 2025-05-26  697  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
