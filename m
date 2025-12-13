Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5062B3016F8
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765623943; cv=none; b=Eai6lK6Fz8WhPfIUOdojAG/k6d9+3sm/lYC5xrAMrVRsma2BXNG6rmgp3aXvjK2vPGzOpKs+gq8U7gNCMRCSme7WdvJbczM3OQ2LdY6CxTx4pVhNhbzpVI8i6WjhEmeYGApi9ocRxPVJB4GwucsQUhCnUAqbmDjT+i8QlkxRodo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765623943; c=relaxed/simple;
	bh=eIJlkmB/GRZzqWXY/TXR/frfHynJkJBeE5Cp5x0g4pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BC3uPW6u6dpQqMVE+XcZCiPhnv/Hnpb6Q1o6IWwlh9JkHEmrTCAgpenJp9G9ZmMVdg7QyF3GtQoiRZJ8qM7kl0WvDqa+ooWL6a7ZmJKgCN0SZDl6b7tFjyjuRb4W7ALIYqz5DUgsj3SSkrK2E9tS7BjBvTXOfAenA/Q4ueyepes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wEH8Bw1S; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wEH8Bw1S"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso15525835e9.3
        for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 03:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765623939; x=1766228739; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akrEjsebCHvdmAghGI3gbVT9gvRKLMOOrbNDoLAYklU=;
        b=wEH8Bw1SOCq4IB9+BdRAV+Uj4kiOL5VwCUec8Ku9/1LBTX+Rs01MZXZUj7rNOPoFvc
         YoFg0FSqAhByJu9geKSef69AzgBmhD90BvvKZfXBFo27i9+xuNG7fgY/yl27AeUJQSDG
         NQSKLWc+lbVpEJd4lo0gmgYNMGvdSbrYEMrqouGZV5n6O/uvbGoVpUh0oVsiQSlB2JWL
         V5qLcEr5fEaMiJFXCCDzFQpy9E95sBmmtzL4tCk/4HWAdkrhpEBhQ3ixP+U5Ryf+mZVs
         2s8q+OxBMa3kDbgWdpL+DhwYzJOdnUK4ERPG1PIL8QOI7Fu3PEX196HWrVEcccWh/quI
         x6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765623939; x=1766228739;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akrEjsebCHvdmAghGI3gbVT9gvRKLMOOrbNDoLAYklU=;
        b=DVCDKkerSdKD16X3Mn3lrO3MR7ao2VgOTuyDtaRlB+L1rX/1O3+NxLyJt/DBGCKsc0
         Jvs0RcvwqUN/TwRAIznQup8iGsMOKbAY9Tew1s4iEc0fwjAqdAghcq1k8vrOYk5HMTi1
         fXHTjsKbh3vIzEAQhus4uxdHKYjQiAvhhwRAE8/A1LBjvSAZUz/BYWhvsST8r5lKa/Pm
         w/pb31irP7VuEh/hCcrgOFi1txsZ4bcSyQzQGu7SEvLjaouuZB5lsON73oWUaCkkz6AZ
         LZYoo+gtVmT7wC5p3kMdwOQxdHOjWEDwNHdcvbw/+z8wz5o+MEAeP/5dkRpOxtIG6kSL
         I68Q==
X-Gm-Message-State: AOJu0Yw9DI26n2MngXTTi2m42YAc7V7d0NtjFUK12gOk9p6qp6auqwTh
	qeXGTrYXM3v4JE1nR3fdZ1D8tQo49ntXIjcof8kQ6/HV7TvOI1hMek07gP52V+x5kfZVrb1Lat4
	7p5xn
X-Gm-Gg: AY/fxX7IrOpxWmjl+/JQwRFh05iRPSYoNp+7EUhSfuvEKxo/moK5edJGn14wCM3A3Vw
	7XgBNNpxPzRZC3fupcSQ9rYmVKrJyeY4QLIQeP59RWcQ4Hr82Zfsa7Ayh0UMoD5VpF/ZBhVXHen
	mYFs4g4HlipYembS8rObxUpY59iGgMcm1ZPWkeLQiFuPPkDfiZa3sENPfmzRNlup4Bn+P1IQhBZ
	iQaL+prE8oq3Exhc2PDNW0/97JLa/tZqR3ljACMINcg8jO//e1wvlDyWrzMwcpBvytQMPBrpNR6
	UKxfgMtU3OP8khoMd140rEuCoXOCumXAXIqiAmjXgCIrgTrjJQBUwpolrPZPTh84GGSa1D5E3fu
	fTrflfucTD5XwczUIsstgeacjiFJLneNyJMWqmeZkO8Yd7mszaVt73sVzirYsspRQzMuedYjtkB
	8Sts32nrIZ9B88ooEJ
X-Google-Smtp-Source: AGHT+IE+pX8X2Ot532bTKW7TF2VDVMGDA06itUIEaUomojq7OnkTUqThaR9z92r+Z3ptlzWx+7Cing==
X-Received: by 2002:a05:600c:1c92:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-47a8f905306mr68638335e9.17.1765623939317;
        Sat, 13 Dec 2025 03:05:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43009dfe55asm4252942f8f.41.2025.12.13.03.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 03:05:38 -0800 (PST)
Date: Sat, 13 Dec 2025 14:05:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
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
Message-ID: <20251213110535.oqsMO3TOeDSDPRrgfs1K-qoBEhex1_cYx23tlcmJi2Q@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: d5b8b0fa1775d8b59c3fc9e4aa2baa715d08f3ee tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
config: csky-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130645.3njk1yxJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512130645.3njk1yxJ-lkp@intel.com/

New smatch warnings:
drivers/tee/tee_core.c:735 tee_ioctl_object_invoke() warn: potential user controlled sizeof overflow '20 + (size_mul(32, (arg.num_params)))' '20 + 0-u32max'

Old smatch warnings:
arch/csky/include/asm/uaccess.h:191 __get_user_fn() error: uninitialized symbol 'retval'.

vim +735 drivers/tee/tee_core.c

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

This isn't a runtime bug, because if arg.num_params is too high the
kcalloc() will fail.  But eventually we're going to create a KMSan thing
to make it a runtime warning when there is an integer overflow in a
size_t math.

Integer overflows are complicated because the integer overflow is
harmless.  It's just math.  If there is a bad effect, it always
happens later.  But we want to start considering it a bug in a limited
way just for sizes because that makes preventing bugs easier.

You could use:

	if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params)) != buf.buf_len)
		return -EINVAL;

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

