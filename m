Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085F32147E8
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408320; cv=none; b=mY2ix9DuYZoBCmT5iwUO48RlalbaM5hwoO1qStmpO5wL7Byex7JwbMp5QnZmymm1vJBJ3SFsjziW4hxpQnbaBSKwS2BuTSBqOZtaOs1swtRt9yXyJh/vlaIeYrpmzGnappEtOIdei53V6uwKm8eurqLl04GN78S9PLpcO6v52P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408320; c=relaxed/simple;
	bh=R/9JapthRpqoHPqUXT2JyMzeSIS7hh40soMKCeKB8Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OLay18CqY/cMMwC2vUG3DL21iJCVo2uRJPuA0ECUDvTawRqQf1KNv2IRSVrBTe2xps1xfN2B/sOwYxhrmXjc3JgatO95+V9OegqxijdcV27JCJemuo5gqHuqzedwgfo9pHj+PeodvQzp51NrAs1qLt8EYdjrDNTy70T8jBXDxMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V10JbC14; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V10JbC14"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so6647935e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 08 Jan 2025 23:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736408316; x=1737013116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X93jbPO9s9V42go7vMKQgdNYSnFvxLbdUzVEdu/5BwA=;
        b=V10JbC14e6CkpwO+DSGM1Ny1YSnaKa9N7Y8t7QVQnP6ZcdvKvr8tGh9gLWJkgpJWwa
         vWsfAqXTjYJBzXexyMXJP4PyQfLXymCLVb3cBMakDamev5kSDgm0hAkdOwv7Zh8TZBEO
         M2jaIl25BGMKYiuk6Tpk5hOTdCWhcE46iXs7cYqBB9soVR8HPYe/vVnd9ikm14IZwjlD
         UxiHaHzmqm+sN/j23z2qLnvn08RajGwQBhWYUXcv+NN0gNrHDlEttrlw8e5AaTWCA/+L
         lH3HDliaj3zoMTVjLkhFn8ZWrCYNiXpv8W5WiBluq7SoWJfhYs022UniRqHEtZ92LsgN
         STig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408316; x=1737013116;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X93jbPO9s9V42go7vMKQgdNYSnFvxLbdUzVEdu/5BwA=;
        b=dQi0ByMcySZVZx9PheZS8uvCz3NaVnxeGj6uxP+Z5l3AnEbiyeuUQEu/5hiPvUvGbi
         t8Mb/fjmOr8sg1QHd8g/CncL2jnm+Zyd6GH58Y7SzhsHPNbnLFBTdI5QxOFQZ9hvEJio
         VMF72axgwcg5UGyV6Mi9MfdyzvMbnhTChrJIFP8Ou/XAikOHk3psU9iDZHh46VFnNFsQ
         Zc6Z/CCCqzQEXbaOfKeQzsK9MUSd9L4hqAjQy1xghtkcEFdXpekARABSha/t8k37g1IX
         BVZPEiUfJrYyfJayRcedcQ4OABLutuZ6daE8XgXLH/734s8LYVIyNKYvZbOi7V0BbjRK
         L1CA==
X-Gm-Message-State: AOJu0Yxv98KYrXs1lBZ9P9u2EH3EgPJ0MeHe/LC30+RIWghWQgp8ktao
	baAJ6F+j9KNyrY/tVf23kHZUXQy0NdUuSyL4G+0LBYXvfp9YoKzdVi2yhE/6oopdC81w78106xW
	K
X-Gm-Gg: ASbGnctZbNZibFVOyOa2IJlSgtVCJeErTPbBK64kaKy1uCszjTY8f7XjfJRRrRQ+2VH
	Olwmdky398KKhzQ1RdSexQw9Ktlg+9MqnlICixlDq6g2u/D2TTLBNFvj1ZHWHdxeEnLzrrff7Xi
	w6lUkIywefZqdxRJLLPREhc+QkQ862CQrubja9CUcVMpskR0c/1TOTmUKmSTO09FQ9AO08aVpsw
	pvOv27KfkQFyrPSJwimZ0IC+0Z7PWDvsQE+94mGXC1F56HrsYPE56nLHEI/Jw==
X-Google-Smtp-Source: AGHT+IFZVE7PKtub/8dmtCqgw9t04MhMon8Rmhxb6fK46usK/fl3/ujRm1Jma4kd7cHZ1WBV4iESeQ==
X-Received: by 2002:a05:6000:402a:b0:38a:418e:1171 with SMTP id ffacd0b85a97d-38a8733063dmr4221734f8f.37.1736408315506;
        Wed, 08 Jan 2025 23:38:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c76esm996791f8f.47.2025.01.08.23.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:38:35 -0800 (PST)
Date: Thu, 9 Jan 2025 10:38:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Haren Myneni <haren@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, msuchanek@suse.de,
	mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH 4/6] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS
 call support
Message-ID: <dbbe27ff-c9e8-4956-a63e-d2db2ec624a7@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104204652.388720-5-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-HCALLs/20250105-045010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250104204652.388720-5-haren%40linux.ibm.com
patch subject: [PATCH 4/6] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
config: powerpc64-randconfig-r071-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090337.xKCGrblc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501090337.xKCGrblc-lkp@intel.com/

smatch warnings:
arch/powerpc/platforms/pseries/papr-indices.c:438 papr_dynamic_indicator_ioc_set() warn: inconsistent returns 'global &rtas_ibm_set_dynamic_indicator_lock'.

vim +438 arch/powerpc/platforms/pseries/papr-indices.c

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

mutex_unlock(&rtas_ibm_set_dynamic_indicator_lock); before returning

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

