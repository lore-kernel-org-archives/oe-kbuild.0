Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F95C14285
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Aug 2024 03:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723175112; cv=none; b=GzBtSCK1+niOUUOOC3O8hiFbq7mTecIlD8Rnq5la6iQi7XRT3BuiAMEFOa+4Lc5sauS2jFSKrTTkheQYI5FiqSvsm9I6VV5XBs52gq7PWabs3d17KQCy1gTrxiGN78BYmMxNJ721820kgOyOU+b+vC96JTdvbFZTnUZVas2mq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723175112; c=relaxed/simple;
	bh=3a9s3PGK32x83TlpAghHMkoLmFKl6Yuvqf70UD9xMzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IcOuv1U3bASaHvpDE8DTMbPtPK2k1leiq9qmumhqmN5w/hOyMMlyPdU+7wzvXXfCtfsAHuVKWDUFClHbhJp5QGUAcWgUyGzZKLu3E32IpzY0Blqk+Khryjw4tXP+RN4IKNjycr8T2AIlPMnbrhu7H/GREQtGxkHvejErCUto9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tbr10Pjo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tbr10Pjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723175110; x=1754711110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3a9s3PGK32x83TlpAghHMkoLmFKl6Yuvqf70UD9xMzU=;
  b=Tbr10Pjo1RqwryNILARVCedaWC9fmVc+hW7AZG7phsm6vwfd/D0YRAVy
   INCSvXc35qr8Vw5NJ1/8GjN6cwAYz3zZz44ql5QGjNDRCYL2XXangIsMp
   yMciu8p1hnBUDY1+rb9m6xq5K7p8D0QSHUcM4fiDMuBQlxQgfF6wBQw6k
   pVp5WIS+Zv+10zC7HlnH1du8d19YC3SMfa2gnq6H433AX33Y3QNczaNyh
   6vZjL+kM0x4C/brMdGFP2SAy/rURbGfzlAjxjTuK8jx6G+9hGzIpBZsaf
   mr+NbY/jmbeSXvTlH6XwtzpA1ktRcoeh+Zkd3oP5A87slqGYwINvA4Pei
   w==;
X-CSE-ConnectionGUID: o/lYe4/fTpecQ9cG10nSYg==
X-CSE-MsgGUID: OfLqKO00Q2eg7LVCa5l0kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31962689"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="31962689"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 20:45:09 -0700
X-CSE-ConnectionGUID: lf+IG3TrSLy6mk2nlumd4A==
X-CSE-MsgGUID: U09wT5KBQ5KBQeC6RnCOag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="62279244"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Aug 2024 20:45:08 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scGYr-0006nq-31;
	Fri, 09 Aug 2024 03:45:05 +0000
Date: Fri, 9 Aug 2024 11:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [weiny2:dcd-v4-2024-08-07 7/26] drivers/cxl/core/hdm.c:697
 cxl_dpa_alloc() error: uninitialized symbol 'avail'.
Message-ID: <202408091133.THHacHrO-lkp@intel.com>
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
TO: Navneet Singh <navneet.singh@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-08-07
head:   9e6891fa14e880557d502a78bae03e40402b41c6
commit: 21a8fe4d9a34b24c7c62c1e732c12413d4d82d3e [7/26] cxl/port: Add dynamic capacity size support to endpoint decoders
:::::: branch date: 30 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20240809 (https://download.01.org/0day-ci/archive/20240809/202408091133.THHacHrO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408091133.THHacHrO-lkp@intel.com/

smatch warnings:
drivers/cxl/core/hdm.c:697 cxl_dpa_alloc() error: uninitialized symbol 'avail'.

vim +/avail +697 drivers/cxl/core/hdm.c

cf880423b6a059 Dan Williams  2022-05-23  588  
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
cf880423b6a059 Dan Williams  2022-05-23  713  

:::::: The code at line 697 was first introduced by commit
:::::: cf880423b6a0599499c1f83542cab0b75daa29ba cxl/hdm: Add support for allocating DPA to an endpoint decoder

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
