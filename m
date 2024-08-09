Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A50197A9E
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Aug 2024 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723216519; cv=none; b=AxuJKgWqIGDADe7uzyGh3kygsBBe0v3mLOaFJBdFLKA1aa/et+wT/MfmPnwNsm2EAY0W40whVsJhjUhTCc7dquR8A9Xb1spIGm8Pahz/so66eOXoRIDIpahgkDU4AG8+Unw+avBXsV3wOQeAbsxoayiVl3W+3xQtFR4ACXIqXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723216519; c=relaxed/simple;
	bh=ShISA1erZ+fhVCvAsSLthMOZoVwShowhaccSoK+bqXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jaKTFOTUF1kafzHnNplanzcl8MMFoCmXYOXdN5JEdm8W96a3XIendtpB/NoLfwW8eXM+UuXdCsHU3e56UbXIBWnra9yV/zqtaUrCnhsGHt03iorUC6SjMkbkVYBSMIxF+yhrlziRxTYN6B9XK3EvXrA7TDsu9vK3SH/5/2DyxI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQP8egnf; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQP8egnf"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso2873475a12.1
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Aug 2024 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723216515; x=1723821315; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySxk5eCmQTCnl1+AkEENjNFyqR4K/lD8pDDHA1lkMkU=;
        b=wQP8egnfzaZiK6JlqFpK/XVPSSOs6GjwcQ0pgyOIQGBvUMpencA+9Pv4rL5M4XUoP4
         jyw6LEG5xXk/Eo6TCvvaDG4HLY8MJ6znCxy55JKZo/JFUfUKu6qUMtmEDdpxVr4f1+H1
         MTywfrj4V5QmUfWdKUOE9eJId0cg1XdkyJcvZ8goMDWtkQbDLhGdiTcL03b8tTRAZq+P
         /9wlG69bh2OO9bmAdPB/3KbIsewIZGVl2m9luH3Lw6RNXTeV05yiBk1SYpQ51JOvvqDA
         FXXx4WSjTL2oCzXi84ZZF1mQ6Bo7i0dw2YpwRKtvqHNdxNSsBA3U8meKcF4a3rBxpIQ/
         XRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723216515; x=1723821315;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySxk5eCmQTCnl1+AkEENjNFyqR4K/lD8pDDHA1lkMkU=;
        b=q9kvg0JLFCsDsvsZDCj8Zux4Zf6+c+v2SvHyuScJ0U/aUvqMSygHoZKsBY9JtE5RID
         ojHDq+LMzzDeEwjCvvMNz2M43nFk2tqigGE68lPmLSuA2uvieNi3cyMVIzeVq4iZqyO4
         b89mf5HM/27rsaX+Mz4v43e2HWrRmjIu39KmS95f1pyEi6bK6GD2XWGoRzFjZJNY9ZBB
         hdXpK/HI7eJz4T2cfGkBZLm23WJfS6GHPpR4CYaWSSAl0wJU0L8XeMVLNkbg2RdyF1/j
         ugvjCszCIXP6+5MtgZr/d0gPjY7B8MiLzxwLdePwd3Y7traeCYEwR5blj6jM4hFu588P
         z+1g==
X-Gm-Message-State: AOJu0YwY7JmZwUY/lHTyPxrbdGiTfPMB4l6zpViM+O7itfZkGnu6Nb/x
	gWrWmPAGzr8RV8TbYqms0kmsqIfU/AQ38E0ZhQtoYkf8rsnJGMkJrlBP7so/8aChu1flZIme/cM
	1
X-Google-Smtp-Source: AGHT+IGdSETRWUQs/sypfmn2/60dyzGYBP88Vsslylnhovs5Xao4utpPKWR9lqbWhGga8aTruxsOrQ==
X-Received: by 2002:a17:906:bc1c:b0:a77:c199:9d01 with SMTP id a640c23a62f3a-a80aa58fe9cmr156894566b.22.1723216515443;
        Fri, 09 Aug 2024 08:15:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c12a79sm849287866b.60.2024.08.09.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:15:15 -0700 (PDT)
Date: Fri, 9 Aug 2024 18:15:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-v4-2024-08-07 7/26] drivers/cxl/core/hdm.c:697
 cxl_dpa_alloc() error: uninitialized symbol 'avail'.
Message-ID: <5c9a8a5f-a278-4aea-ab52-7cdb55fd66e5@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-08-07
head:   9e6891fa14e880557d502a78bae03e40402b41c6
commit: 21a8fe4d9a34b24c7c62c1e732c12413d4d82d3e [7/26] cxl/port: Add dynamic capacity size support to endpoint decoders
config: x86_64-randconfig-161-20240809 (https://download.01.org/0day-ci/archive/20240809/202408091133.THHacHrO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408091133.THHacHrO-lkp@intel.com/

smatch warnings:
drivers/cxl/core/hdm.c:697 cxl_dpa_alloc() error: uninitialized symbol 'avail'.

vim +/avail +697 drivers/cxl/core/hdm.c

cf880423b6a059 Dan Williams  2022-05-23  589  int cxl_dpa_alloc(struct cxl_endpoint_decoder *cxled, unsigned long long size)
cf880423b6a059 Dan Williams  2022-05-23  590  {
cf880423b6a059 Dan Williams  2022-05-23  591  	resource_size_t free_ram_start, free_pmem_start;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  592  	struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
cf880423b6a059 Dan Williams  2022-05-23  593  	struct cxl_port *port = cxled_to_port(cxled);
cf880423b6a059 Dan Williams  2022-05-23  594  	struct cxl_dev_state *cxlds = cxlmd->cxlds;
cf880423b6a059 Dan Williams  2022-05-23  595  	struct device *dev = &cxled->cxld.dev;
cf880423b6a059 Dan Williams  2022-05-23  596  	resource_size_t start, avail, skip;
cf880423b6a059 Dan Williams  2022-05-23  597  	struct resource *p, *last;
cf880423b6a059 Dan Williams  2022-05-23  598  	int rc;
cf880423b6a059 Dan Williams  2022-05-23  599  
cf880423b6a059 Dan Williams  2022-05-23  600  	down_write(&cxl_dpa_rwsem);
b9686e8c8e39d4 Dan Williams  2022-06-04  601  	if (cxled->cxld.region) {
b9686e8c8e39d4 Dan Williams  2022-06-04  602  		dev_dbg(dev, "decoder attached to %s\n",
b9686e8c8e39d4 Dan Williams  2022-06-04  603  			dev_name(&cxled->cxld.region->dev));
b9686e8c8e39d4 Dan Williams  2022-06-04  604  		rc = -EBUSY;
b9686e8c8e39d4 Dan Williams  2022-06-04  605  		goto out;
b9686e8c8e39d4 Dan Williams  2022-06-04  606  	}
b9686e8c8e39d4 Dan Williams  2022-06-04  607  
cf880423b6a059 Dan Williams  2022-05-23  608  	if (cxled->cxld.flags & CXL_DECODER_F_ENABLE) {
cf880423b6a059 Dan Williams  2022-05-23  609  		dev_dbg(dev, "decoder enabled\n");
cf880423b6a059 Dan Williams  2022-05-23  610  		rc = -EBUSY;
cf880423b6a059 Dan Williams  2022-05-23  611  		goto out;
cf880423b6a059 Dan Williams  2022-05-23  612  	}
cf880423b6a059 Dan Williams  2022-05-23  613  
cf880423b6a059 Dan Williams  2022-05-23  614  	for (p = cxlds->ram_res.child, last = NULL; p; p = p->sibling)
cf880423b6a059 Dan Williams  2022-05-23  615  		last = p;
cf880423b6a059 Dan Williams  2022-05-23  616  	if (last)
cf880423b6a059 Dan Williams  2022-05-23  617  		free_ram_start = last->end + 1;
cf880423b6a059 Dan Williams  2022-05-23  618  	else
cf880423b6a059 Dan Williams  2022-05-23  619  		free_ram_start = cxlds->ram_res.start;
cf880423b6a059 Dan Williams  2022-05-23  620  
cf880423b6a059 Dan Williams  2022-05-23  621  	for (p = cxlds->pmem_res.child, last = NULL; p; p = p->sibling)
cf880423b6a059 Dan Williams  2022-05-23  622  		last = p;
cf880423b6a059 Dan Williams  2022-05-23  623  	if (last)
cf880423b6a059 Dan Williams  2022-05-23  624  		free_pmem_start = last->end + 1;
cf880423b6a059 Dan Williams  2022-05-23  625  	else
cf880423b6a059 Dan Williams  2022-05-23  626  		free_pmem_start = cxlds->pmem_res.start;
cf880423b6a059 Dan Williams  2022-05-23  627  
cf880423b6a059 Dan Williams  2022-05-23  628  	if (cxled->mode == CXL_DECODER_RAM) {
cf880423b6a059 Dan Williams  2022-05-23  629  		start = free_ram_start;
cf880423b6a059 Dan Williams  2022-05-23  630  		avail = cxlds->ram_res.end - start + 1;
cf880423b6a059 Dan Williams  2022-05-23  631  		skip = 0;
cf880423b6a059 Dan Williams  2022-05-23  632  	} else if (cxled->mode == CXL_DECODER_PMEM) {
cf880423b6a059 Dan Williams  2022-05-23  633  		resource_size_t skip_start, skip_end;
cf880423b6a059 Dan Williams  2022-05-23  634  
cf880423b6a059 Dan Williams  2022-05-23  635  		start = free_pmem_start;
cf880423b6a059 Dan Williams  2022-05-23  636  		avail = cxlds->pmem_res.end - start + 1;
cf880423b6a059 Dan Williams  2022-05-23  637  		skip_start = free_ram_start;
1cd8a2537eb077 Dan Williams  2022-08-05  638  
1cd8a2537eb077 Dan Williams  2022-08-05  639  		/*
1cd8a2537eb077 Dan Williams  2022-08-05  640  		 * If some pmem is already allocated, then that allocation
1cd8a2537eb077 Dan Williams  2022-08-05  641  		 * already handled the skip.
1cd8a2537eb077 Dan Williams  2022-08-05  642  		 */
1cd8a2537eb077 Dan Williams  2022-08-05  643  		if (cxlds->pmem_res.child &&
1cd8a2537eb077 Dan Williams  2022-08-05  644  		    skip_start == cxlds->pmem_res.child->start)
1cd8a2537eb077 Dan Williams  2022-08-05  645  			skip_end = skip_start - 1;
1cd8a2537eb077 Dan Williams  2022-08-05  646  		else
cf880423b6a059 Dan Williams  2022-05-23  647  			skip_end = start - 1;
cf880423b6a059 Dan Williams  2022-05-23  648  		skip = skip_end - skip_start + 1;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  649  	} else if (cxl_decoder_mode_is_dc(cxled->mode)) {
21a8fe4d9a34b2 Navneet Singh 2023-07-05  650  		int dc_index = dc_mode_to_region_index(cxled->mode);
21a8fe4d9a34b2 Navneet Singh 2023-07-05  651  
21a8fe4d9a34b2 Navneet Singh 2023-07-05  652  		for (p = cxlds->dc_res[dc_index].child, last = NULL; p; p = p->sibling)
21a8fe4d9a34b2 Navneet Singh 2023-07-05  653  			last = p;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  654  
21a8fe4d9a34b2 Navneet Singh 2023-07-05  655  		if (last) {
21a8fe4d9a34b2 Navneet Singh 2023-07-05  656  			/*
21a8fe4d9a34b2 Navneet Singh 2023-07-05  657  			 * Some DC in this DC partition is already allocated,
21a8fe4d9a34b2 Navneet Singh 2023-07-05  658  			 * that allocation already handled the skip.
21a8fe4d9a34b2 Navneet Singh 2023-07-05  659  			 */
21a8fe4d9a34b2 Navneet Singh 2023-07-05  660  			start = last->end + 1;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  661  			skip = 0;

avail not set on this path

21a8fe4d9a34b2 Navneet Singh 2023-07-05  662  		} else {
21a8fe4d9a34b2 Navneet Singh 2023-07-05  663  			/* Calculate skip */
21a8fe4d9a34b2 Navneet Singh 2023-07-05  664  			resource_size_t skip_start, skip_end;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  665  
21a8fe4d9a34b2 Navneet Singh 2023-07-05  666  			start = cxlds->dc_res[dc_index].start;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  667  
21a8fe4d9a34b2 Navneet Singh 2023-07-05  668  			avail = cxlds->dc_res[dc_index].end - start + 1;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  669  			if ((resource_size(&cxlds->pmem_res) == 0) || !cxlds->pmem_res.child)
21a8fe4d9a34b2 Navneet Singh 2023-07-05  670  				skip_start = free_ram_start;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  671  			else
21a8fe4d9a34b2 Navneet Singh 2023-07-05  672  				skip_start = free_pmem_start;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  673  			/*
21a8fe4d9a34b2 Navneet Singh 2023-07-05  674  			 * If any dc region is already mapped, then that allocation
21a8fe4d9a34b2 Navneet Singh 2023-07-05  675  			 * already handled the RAM and PMEM skip.  Check for DC region
21a8fe4d9a34b2 Navneet Singh 2023-07-05  676  			 * skip.
21a8fe4d9a34b2 Navneet Singh 2023-07-05  677  			 */
21a8fe4d9a34b2 Navneet Singh 2023-07-05  678  			for (int i = dc_index - 1; i >= 0 ; i--) {
21a8fe4d9a34b2 Navneet Singh 2023-07-05  679  				if (cxlds->dc_res[i].child) {
21a8fe4d9a34b2 Navneet Singh 2023-07-05  680  					skip_start = cxlds->dc_res[i].child->end + 1;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  681  					break;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  682  				}
21a8fe4d9a34b2 Navneet Singh 2023-07-05  683  			}
21a8fe4d9a34b2 Navneet Singh 2023-07-05  684  
21a8fe4d9a34b2 Navneet Singh 2023-07-05  685  			skip_end = start - 1;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  686  			skip = skip_end - skip_start + 1;
21a8fe4d9a34b2 Navneet Singh 2023-07-05  687  		}
cf880423b6a059 Dan Williams  2022-05-23  688  	} else {
cf880423b6a059 Dan Williams  2022-05-23  689  		dev_dbg(dev, "mode not set\n");
cf880423b6a059 Dan Williams  2022-05-23  690  		rc = -EINVAL;
cf880423b6a059 Dan Williams  2022-05-23  691  		goto out;
cf880423b6a059 Dan Williams  2022-05-23  692  	}
cf880423b6a059 Dan Williams  2022-05-23  693  
21a8fe4d9a34b2 Navneet Singh 2023-07-05  694  	dev_dbg(dev, "DPA Allocation start: %pa len: %#llx Skip: %pa\n",
21a8fe4d9a34b2 Navneet Singh 2023-07-05  695  		&start, size, &skip);
21a8fe4d9a34b2 Navneet Singh 2023-07-05  696  
cf880423b6a059 Dan Williams  2022-05-23 @697  	if (size > avail) {
                                                           ^^^^^

cf880423b6a059 Dan Williams  2022-05-23  698  		dev_dbg(dev, "%pa exceeds available %s capacity: %pa\n", &size,
6ef37af6f46512 Ira Weiny     2023-08-28  699  			cxl_decoder_mode_name(cxled->mode), &avail);
cf880423b6a059 Dan Williams  2022-05-23  700  		rc = -ENOSPC;
cf880423b6a059 Dan Williams  2022-05-23  701  		goto out;
cf880423b6a059 Dan Williams  2022-05-23  702  	}
cf880423b6a059 Dan Williams  2022-05-23  703  
cf880423b6a059 Dan Williams  2022-05-23  704  	rc = __cxl_dpa_reserve(cxled, start, size, skip);
cf880423b6a059 Dan Williams  2022-05-23  705  out:
cf880423b6a059 Dan Williams  2022-05-23  706  	up_write(&cxl_dpa_rwsem);
cf880423b6a059 Dan Williams  2022-05-23  707  
cf880423b6a059 Dan Williams  2022-05-23  708  	if (rc)
cf880423b6a059 Dan Williams  2022-05-23  709  		return rc;
cf880423b6a059 Dan Williams  2022-05-23  710  
cf880423b6a059 Dan Williams  2022-05-23  711  	return devm_add_action_or_reset(&port->dev, cxl_dpa_release, cxled);
cf880423b6a059 Dan Williams  2022-05-23  712  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

