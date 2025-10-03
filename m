Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC13022D4DD
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759475552; cv=none; b=IvQgNEsnfq18x/pbSPqEx/9uuXbUrzcHT6m/yEG3PT1aer4HZPvudlv4j6VOEfsoYlVmdvEKBQwfa7hRXpq04/Ppe4KA49hSK9imXQFhX8q/BvlEvpv3g5DdztgHYvoQODkJL0uZqozMuFn5Fs/w/k171UBK0Ok/bWJJcAe1M+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759475552; c=relaxed/simple;
	bh=Nq58GdFtDEem6SwB02ei2XodBchMAS+1KYqwjUtuop8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jhJkPm1KJEODSndV9+5gAUjbK9Xi7zJ3GJcNAF+k3KxJEkXVDD0PUa326jgs+oUK1xkMhrCJoI3JwG1wjNvrCVJGPNlBEXad7iCSAjlpsOxPlNYZAgOO3CUAiCvPXIS3fUkZpVua+Tdps+R/9HGdBTAQPK4ewy43dwbDlKIPdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BX9vHnY+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BX9vHnY+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso12158575e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 03 Oct 2025 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759475548; x=1760080348; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSCnRN0TVsnn4XlDJr4lnfc/qA7GkQZiLOPCKbOYP1k=;
        b=BX9vHnY+4QMUgGt70ctkq6vgA/Q4IB7o8y5xdEklQISKUbxmn5l7PYHF9yShsp/MTd
         GZcE577B0vjDNXJa+6r6PRZgwZtE9MQkAHTgjdrFJDNNSytVow2uVRSU0n6UuNAy1BXZ
         3QBLMysGDfnKYXb5ECaNDp6Usc1q5Aqes+SmrNiRPgIfNHpQwDT04zyCMpWlCMC7mJQn
         N9SnUtvkLBwM1HYL2KIOI3KY4qFopBFvqxoGkx4TSG0ebKCqwRLPlilRCqG7gc9i/qL4
         KjS9NJqGFlDTfcpTe0ILVp5zB6v9fQwaqGyT9iGMiymNVfIeo2jaYckpf1PcOEZwwZtc
         S/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759475548; x=1760080348;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSCnRN0TVsnn4XlDJr4lnfc/qA7GkQZiLOPCKbOYP1k=;
        b=OhBiCPrMjUAZfnhoGGUz4fCOQioeTktKr3N2cqWuFaq4Wb/L/mZAaTAdFc9nosVKef
         OZh18eJpyKJ0kAH79FU3P4ldy7cFhS3A9NT9Y7cdZk6moGmwn0UzKY/Q6hnugRiOAIva
         Xj4d+zy5/6gtKy+CGmdXwz6Z9bZc89Mgdx90p90nXjRBGKbAWJCvHwQqLHTm6NU0KjT3
         gYPTPjsL7Q7PoF7+Ny9w0rgjPJrYHv1ejNP82/YndESdWaHZtgA/t3tLA+2xguR9DNVL
         aTbbD27ZtcJJz69q/r97BBDsJICa3w3DAYMIUdZRcxOAgryUoiK1vIU8bHhXa4kifSOd
         iwtg==
X-Gm-Message-State: AOJu0Yzad9HCUdyaXNwwxhQwhb+si9ivrLgjYq5pT2pGdMcptTZUbi/c
	/vVvVfQTGXr76IR/fgVtfwnioobhmEsyF2rCfh0YSJV043lmH/HNGGDYRkUkawP1dCKHxlAoTWl
	R/LIY
X-Gm-Gg: ASbGncu/nBknlGvPrr4v5Q+FLrO7ThpLu4ICC8aEIBnKRginfaeYAleSH6AKl2u6dvR
	UtMAX3HLMCTfprP8l5J9db+SF0Rql9dddyeY2K37FxivBIJaWqTEUGO5bD23g1oKfJW9vI2DKWE
	+sGR5GUBSoYYki/Kdv86rI3YK0gEXqjCwe6EgiQwGcwur/SNoLjF6rVw8t9LilLQzMtlFEIO+7l
	W5yY2pOrlntwhVKd7CYixEan6US2iSnbSyFAPiXIjEDu2+2Izt2ODpwG7HOjyTWfX1Wak2SaYaq
	+t4x7+e/f0um8reyIl0xZ3B1oLbhSwFFhK7OvgPJewpDVSWuk9dkI7WRHQDIvlPztwNkeAoiMuJ
	Scvl2uD9t8sNZHxywYJlYal90VU+OqGrgxq94+9WESwZxTUJArlyHhiQQ
X-Google-Smtp-Source: AGHT+IHU3kEXVjVcMp2Z6n09i/cBQpyGZp0+4YW+HtwmwbTottMW99DNAkvGnxZ+U3vyWesHy5H/KA==
X-Received: by 2002:a05:600c:4689:b0:46e:440f:144b with SMTP id 5b1f17b1804b1-46e7110a1e8mr12499225e9.14.1759475548231;
        Fri, 03 Oct 2025 00:12:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e72359e2bsm17971515e9.13.2025.10.03.00.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 00:12:27 -0700 (PDT)
Date: Fri, 3 Oct 2025 10:12:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu-fwspec 1/14] drivers/iommu/iommu.c:471
 iommu_do_probe_device() error: uninitialized symbol 'ret'.
Message-ID: <202510030445.Io6xezuL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251003071223.LQhIIeiAG_EuYFLFPzUh0qHuXbIOlLjFYVdL1LL1t6w@z>

tree:   https://github.com/jgunthorpe/linux iommu-fwspec
head:   670b33a8cfd32984040c12e995134b9cb4cdf0a5
commit: cca42a9b5325b96bfd3d74e24628511f537afbe9 [1/14] iommu: Add a probe_device_fwspec() op
config: x86_64-randconfig-161-20251002 (https://download.01.org/0day-ci/archive/20251003/202510030445.Io6xezuL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510030445.Io6xezuL-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommu.c:471 iommu_do_probe_device() error: uninitialized symbol 'ret'.

vim +/ret +471 drivers/iommu/iommu.c

cca42a9b5325b9 Jason Gunthorpe 2025-10-01  411  static int iommu_do_probe_device(struct device *dev)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  412  {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  413  	struct iommu_device *iommu;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  414  	int ret;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  415  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  416  	lockdep_assert_held(&iommu_probe_device_lock);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  417  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  418  	if (dev->iommu->fwspec) {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  419  		struct iommu_device *fwspec_iommu;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  420  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  421  		fwspec_iommu =
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  422  			iommu_from_fwnode(dev->iommu->fwspec->iommu_fwnode);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  423  		if (!fwspec_iommu)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  424  			return -ENODEV;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  425  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  426  		if (fwspec_iommu->ops->probe_device_fwspec) {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  427  			ret = fwspec_iommu->ops->probe_device_fwspec(
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  428  				fwspec_iommu, dev);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  429  			if (ret)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  430  				return ret;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  431  			iommu = fwspec_iommu;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  432  		} else {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  433  			iommu = fwspec_iommu->ops->probe_device(dev);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  434  			if (IS_ERR(iommu))
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  435  				return PTR_ERR(iommu);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  436  			if (WARN_ON(iommu != fwspec_iommu)) {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  437  				ret = -EINVAL;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  438  				goto err_release;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  439  			}

ret not set on this implied else path.

cca42a9b5325b9 Jason Gunthorpe 2025-10-01  440  		}
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  441  	} else {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  442  		/*
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  443  		 * At this point, relevant devices either now have a fwspec
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  444  		 * which will match ops registered with a non-NULL fwnode, or we
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  445  		 * can reasonably assume that only one of Intel, AMD, s390, PAMU
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  446  		 * or legacy SMMUv2 can be present, and that any of their
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  447  		 * registered instances has suitable ops for probing, and thus
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  448  		 * cheekily co-opt the same mechanism.
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  449  		 */
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  450  		iommu = iommu_from_fwnode(NULL);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  451  		if (!iommu)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  452  			return -ENODEV;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  453  		/* Non fwspec drivers must identify their instance internally */
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  454  		if (WARN_ON(!iommu->ops->probe_device))
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  455  			return -EINVAL;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  456  		iommu = iommu->ops->probe_device(dev);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  457  		if (IS_ERR(iommu))
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  458  			return PTR_ERR(iommu);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  459  	}

ret not set in the else patch.

cca42a9b5325b9 Jason Gunthorpe 2025-10-01  460  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  461  	if (!try_module_get(iommu->ops->owner)) {
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  462  		ret = -EINVAL;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  463  		goto err_release;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  464  	}
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  465  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  466  	dev->iommu->iommu_dev = iommu;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  467  
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  468  err_release:
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  469  	if (iommu->ops->release_device)
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  470  		iommu->ops->release_device(dev);
cca42a9b5325b9 Jason Gunthorpe 2025-10-01 @471  	return ret;
cca42a9b5325b9 Jason Gunthorpe 2025-10-01  472  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

