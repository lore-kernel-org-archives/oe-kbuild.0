Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426BA16C854
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725960633; cv=none; b=sfWsf9zAauxmBZz6ZsUaialsJbye9PLp7F5UeSoXRWAwfdvGHN+eGkHlN+G9uyKisOGBU33i/MFi5JuORwuIY+AOWG5aX8PCM6ulgfx5IgsT7uhV974yoa0mnj15i5aM/491Clmz0XUMF6+92Xc3eFt+YOa6gSRmQJNzE2jza9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725960633; c=relaxed/simple;
	bh=9b6OYwAXn/U0R3+ZiUnTUV2YgX3yPiRo6QuJahpOqEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4qVqHYbtR/cUz88+ZVR8b2I/GUWRStegNce1gTHOwpU3I9mrfIYxC1/lMMctw0FkVL9UVloF6ZGczyHCr0LeVU3Wg3aafF2JXMIDXY0geW97EsY9lN7B79sVoyX0L/mYNBNpgmFD63baXgT7OJkMadjjvbeFlKEzl95PIytutE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZXsMqwIB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXsMqwIB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso63474545e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725960629; x=1726565429; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0P84vcaXeOOjYnBH93C868eUbXfuC7ReApfXuRNXyjw=;
        b=ZXsMqwIBv1NoLpkVHahD6whTFaaL9urAs0mHPREyVhzidsZMkpRWmmLEDWDoRI8UKm
         sEN7lo7YlA/YaiPyMDc/XLucpgIs9/hsf+6fZjdCWzOlTTqrgilRf6R0YNfFXrvaYoBy
         0w0HZFreaJ4gkMbKQ1lM2XfiUz4DCiPpQ+Sctst5QKoN7EvQAMEdzQ96pueHH74aTnLQ
         Sd5qFha56535iEDkRciTnfdW87kLKBpZ2/sbpUH0DSDbjZQ0AT/uie9Ljh++GC9JLJZI
         hM3HGWTy++hX/AFxLGl+s78S5RSIlKNZO9ePGLZe/a/6n93t3F9Z4mJM9SLL+GwOuyoB
         ybTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960629; x=1726565429;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0P84vcaXeOOjYnBH93C868eUbXfuC7ReApfXuRNXyjw=;
        b=OFkicfyEX5c2eZ/qX2+ngA1RydzODrullR+pIX6DyePqXlqDfMXqp0HL5tVSvxR87w
         fjc8BAH5onVY/XmxDF9c0o21yhmETBfjUybCykthmBMZXm1GzEHmZdZx/zi4L5I6n+Lt
         EtOngVjwFNNJtMZZ/BeF2QC/bxPTbeDMKO1usCo2yYWEWtHL3eJWf/dC4G9en/mfg9By
         owLbzFi9EkLYWmVAPcEDuqGfWwZJHtbSY6zmZBPOW6FG66WVrhaNHIfeoA2Q9j7tOFUQ
         uRd5XbTieotd1fuFUn7CGXcvv2fqK5fnB/HmAfT1YbF0kY3TB2zPT8JAhRYBYoQiADGO
         QwDg==
X-Gm-Message-State: AOJu0Yygy/n4tbI/tsTaLMXZiSYyH/M0PJUfXo/lR8f1CGGUxRBuYxM+
	V5mzXSNEvRcJlIav80lPBlaLinXOw9Zy+7/xgWiTDLAa3wM0TJWFltT2CVBiEHwz+HEZqpFDozF
	s
X-Google-Smtp-Source: AGHT+IFArzEZXin2HHndXzCiE5Ui16xnD78OFZJC3CCd0ZoVsZFr85ZnjrVAcFyorVn+PY6L72HkDQ==
X-Received: by 2002:a05:600c:1d9f:b0:42c:b220:4769 with SMTP id 5b1f17b1804b1-42cb2204a93mr79589545e9.32.1725960628674;
        Tue, 10 Sep 2024 02:30:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb179f8e3sm95509145e9.43.2024.09.10.02.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 02:30:28 -0700 (PDT)
Date: Tue, 10 Sep 2024 12:30:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Jason Zeng <jason.zeng@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20910/30000] drivers/iommu/intel/iommu.c:5894
 intel_iommu_unmap() warn: variable dereferenced before check 'gather' (see
 line 5885)
Message-ID: <137bb348-bc29-4169-aef3-49886ff4c79a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   3e6d44ea60eb8609ba59273c12276e3236cd76b2
commit: 004c9426acfc9d9dcb19ec63f0f6aa2f754a06ee [20910/30000] iommu/vt-d: Avoid superfluous IOTLB tracking in lazy mode
config: x86_64-randconfig-161-20240906 (https://download.01.org/0day-ci/archive/20240909/202409091900.JffgO6qd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409091900.JffgO6qd-lkp@intel.com/

New smatch warnings:
drivers/iommu/intel/iommu.c:5894 intel_iommu_unmap() warn: variable dereferenced before check 'gather' (see line 5885)

Old smatch warnings:
drivers/iommu/intel/iommu.c:951 device_to_iommu() error: we previously assumed 'pdev' could be null (see line 924)
drivers/iommu/intel/iommu.c:2471 __domain_mapping() error: we previously assumed 'sg' could be null (see line 2462)

vim +/gather +5894 drivers/iommu/intel/iommu.c

5009065d38c954 drivers/iommu/intel-iommu.c Ohad Ben-Cohen  2011-11-10  5866  static size_t intel_iommu_unmap(struct iommu_domain *domain,
56f8af5e9d38f1 drivers/iommu/intel-iommu.c Will Deacon     2019-07-02  5867  				unsigned long iova, size_t size,
56f8af5e9d38f1 drivers/iommu/intel-iommu.c Will Deacon     2019-07-02  5868  				struct iommu_iotlb_gather *gather)
38717946425792 drivers/pci/intel-iommu.c   Kay, Allen M    2008-09-09  5869  {
00a77deb0f2f2c drivers/iommu/intel-iommu.c Joerg Roedel    2015-03-26  5870  	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
ea8ea460c9ace6 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  5871  	unsigned long start_pfn, last_pfn;
4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24  5872  	int level = 0;
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5873  
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5874  	/* Cope with horrid API which requires us to unmap more than the
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5875  	   size argument if it happens to be a large-page mapping. */
dc02e46e8d0234 drivers/iommu/intel-iommu.c Joerg Roedel    2015-08-13  5876  	BUG_ON(!pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level));
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5877  
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5878  	if (size < VTD_PAGE_SIZE << level_to_offset_bits(level))
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5879  		size = VTD_PAGE_SIZE << level_to_offset_bits(level);
4b99d3527041be drivers/pci/intel-iommu.c   Sheng Yang      2009-07-08  5880  
ea8ea460c9ace6 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  5881  	start_pfn = iova >> VTD_PAGE_SHIFT;
ea8ea460c9ace6 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  5882  	last_pfn = (iova + size - 1) >> VTD_PAGE_SHIFT;
ea8ea460c9ace6 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  5883  
4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24  5884  	gather->freelist = domain_unmap(dmar_domain, start_pfn,
                                                                                ^^^^^^^^^^^^^^^^
This code assumes gather is a valid pointer

4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24 @5885  					last_pfn, gather->freelist);
                                                                                                                          ^^^^^^^^^^^^^^^^

fe40f1e020d092 drivers/pci/intel-iommu.c   Weidong Han     2008-12-08  5886  
163cc52ccd2cc5 drivers/pci/intel-iommu.c   David Woodhouse 2009-06-28  5887  	if (dmar_domain->max_addr == iova + size)
163cc52ccd2cc5 drivers/pci/intel-iommu.c   David Woodhouse 2009-06-28  5888  		dmar_domain->max_addr = iova;
b146a1c9f7f1fe drivers/pci/intel-iommu.c   Joerg Roedel    2010-01-20  5889  
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16  5890  	/*
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16  5891  	 * We do not use page-selective IOTLB invalidation in flush queue,
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16  5892  	 * so there is no need to track page and sync iotlb.
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16  5893  	 */
004c9426acfc9d drivers/iommu/intel/iommu.c Jacob Pan       2023-02-16 @5894  	if (!(gather && gather->queued))
                                                                                      ^^^^^^
Checked too late

4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24  5895  		iommu_iotlb_gather_add_page(domain, gather, iova, size);
4a2e7b3a540ffb drivers/iommu/intel/iommu.c Tom Murphy      2020-11-24  5896  
5cf0a76fa2179d drivers/iommu/intel-iommu.c David Woodhouse 2014-03-19  5897  	return size;
38717946425792 drivers/pci/intel-iommu.c   Kay, Allen M    2008-09-09  5898  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

