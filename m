Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36991991DC
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630263; cv=none; b=n+NTmsnh6g4A7IHvttthRaMucosbmUtHPqVhf1ebuusmXiUx3s8HDGg6ixnWt8fyoHu0evuL1Xejl7Ke/+7rY78J0giUvTqSuHRQ95tGHYP9SC9vV40UQWG6Ji53zT85x3gX+fFs61VX90uGzvrGdm9lS7Lg+H0Q790Ks8A1S4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630263; c=relaxed/simple;
	bh=nTqt9vymJDy69V4Ht4+FIrmB56YYMVJopZUp1ygKwGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b8TZ/dq86vWlf5AqgBeIrqpkXdUBOZnN08YsWkpKq0sbksy44TkrztTaZG3Rj/UBTJelW/C/YBLLsJggnAiyHGgJb4G07M09ydca1rX2L2V8RH4zSzDgEB2yYoVUguoikFLdqBA47uQGbKv0CU4XHRpYIm53QDoKKrMfzdPYKU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bT77EdO1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bT77EdO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718630260; x=1750166260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nTqt9vymJDy69V4Ht4+FIrmB56YYMVJopZUp1ygKwGA=;
  b=bT77EdO1uXXfcVerEPy6MvQBYeZBgKr1oV25CCk3M0m6dFLJ6zFutCNa
   ZOMiUO/TTu8NfphK1irKoQmX/x3MZUbS/gkEJ4x7nJuJHbHslvu2anQAv
   74SiwpLvQ15rVF9odTFiuSt1rHOeCIFIwdttVxdcPOlD9HYQEu7j4+Knf
   e6A8uSWOlN6xllijYPR1AHHcZCG4bsr9hgsSuQceh1pF/n8HWR+qQsQDg
   +jD7KkG+8lLXRe4XECu3bCBqDkDvjA3iMiYeBL2Zvp1+sNGuPL195vvYy
   vfn1JCohZjgzXrc5AZ6mAzJ/6bO36DSAigaqrHsnncSn0ShXi0Ic5Mncu
   A==;
X-CSE-ConnectionGUID: /5JJI7uJTs+euQxL1ZTFPQ==
X-CSE-MsgGUID: EvmxFLmCT+6lxNEnpd28OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26572608"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26572608"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 06:12:49 -0700
X-CSE-ConnectionGUID: JlnNTjDAQimCWM59x6zy6Q==
X-CSE-MsgGUID: KBmNMhArQMOwjpvkmyyBVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41040513"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jun 2024 06:12:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJCAA-0004JJ-10;
	Mon, 17 Jun 2024 13:12:46 +0000
Date: Mon, 17 Jun 2024 21:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djiang:cxl-usp-shared-link 3/3] drivers/cxl/core/cdat.c:667
 cxl_endpoint_gather_coordinates() error: uninitialized symbol 'gp_is_root'.
Message-ID: <202406172334.NUywIZ5i-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-usp-shared-link
head:   0747c64559121b9d16569c5b0801da3ab18f2144
commit: 0747c64559121b9d16569c5b0801da3ab18f2144 [3/3] cxl: Calculate region bandwidth of targets with shared upstream link
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20240616 (https://download.01.org/0day-ci/archive/20240617/202406172334.NUywIZ5i-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406172334.NUywIZ5i-lkp@intel.com/

smatch warnings:
drivers/cxl/core/cdat.c:667 cxl_endpoint_gather_coordinates() error: uninitialized symbol 'gp_is_root'.

vim +/gp_is_root +667 drivers/cxl/core/cdat.c

0747c64559121b Dave Jiang 2024-06-11  598  
0747c64559121b Dave Jiang 2024-06-11  599  static int cxl_endpoint_gather_coordinates(struct cxl_region *cxlr,
0747c64559121b Dave Jiang 2024-06-11  600  					   struct cxl_endpoint_decoder *cxled,
0747c64559121b Dave Jiang 2024-06-11  601  					   struct xarray *usp_xa)
0747c64559121b Dave Jiang 2024-06-11  602  {
0747c64559121b Dave Jiang 2024-06-11  603  	struct cxl_port *endpoint = to_cxl_port(cxled->cxld.dev.parent);
0747c64559121b Dave Jiang 2024-06-11  604  	struct access_coordinate pci_coord[ACCESS_COORDINATE_MAX];
0747c64559121b Dave Jiang 2024-06-11  605  	struct access_coordinate sw_coord[ACCESS_COORDINATE_MAX];
0747c64559121b Dave Jiang 2024-06-11  606  	struct access_coordinate ep_coord[ACCESS_COORDINATE_MAX];
0747c64559121b Dave Jiang 2024-06-11  607  	struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
0747c64559121b Dave Jiang 2024-06-11  608  	struct cxl_dev_state *cxlds = cxlmd->cxlds;
0747c64559121b Dave Jiang 2024-06-11  609  	struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
0747c64559121b Dave Jiang 2024-06-11  610  	struct pci_dev *pdev = to_pci_dev(cxlds->dev);
0747c64559121b Dave Jiang 2024-06-11  611  	struct cxl_port *parent_port, *gp_port;
0747c64559121b Dave Jiang 2024-06-11  612  	struct cxl_perf_ctx *perf_ctx;
0747c64559121b Dave Jiang 2024-06-11  613  	struct cxl_dpa_perf *perf;
0747c64559121b Dave Jiang 2024-06-11  614  	bool gp_is_root;
0747c64559121b Dave Jiang 2024-06-11  615  	unsigned long index;
0747c64559121b Dave Jiang 2024-06-11  616  	void *ptr;
0747c64559121b Dave Jiang 2024-06-11  617  	int rc;
0747c64559121b Dave Jiang 2024-06-11  618  
0747c64559121b Dave Jiang 2024-06-11  619  	if (cxlds->rcd)
0747c64559121b Dave Jiang 2024-06-11  620  		return -ENODEV;
0747c64559121b Dave Jiang 2024-06-11  621  
0747c64559121b Dave Jiang 2024-06-11  622  	parent_port = to_cxl_port(endpoint->dev.parent);
0747c64559121b Dave Jiang 2024-06-11  623  	gp_port = to_cxl_port(parent_port->dev.parent);
0747c64559121b Dave Jiang 2024-06-11  624  	if (is_cxl_root(gp_port))
0747c64559121b Dave Jiang 2024-06-11  625  		gp_is_root = true;
0747c64559121b Dave Jiang 2024-06-11  626  
0747c64559121b Dave Jiang 2024-06-11  627  	perf = cxl_memdev_get_dpa_perf(mds, cxlr->mode);
0747c64559121b Dave Jiang 2024-06-11  628  	if (IS_ERR(perf))
0747c64559121b Dave Jiang 2024-06-11  629  		return PTR_ERR(perf);
0747c64559121b Dave Jiang 2024-06-11  630  
0747c64559121b Dave Jiang 2024-06-11  631  	if (!dpa_perf_contains(perf, cxled->dpa_res))
0747c64559121b Dave Jiang 2024-06-11  632  		return -EINVAL;
0747c64559121b Dave Jiang 2024-06-11  633  
0747c64559121b Dave Jiang 2024-06-11  634  	/*
0747c64559121b Dave Jiang 2024-06-11  635  	 * The index for the xarray is the upstream port device of the upstream
0747c64559121b Dave Jiang 2024-06-11  636  	 * CXL switch.
0747c64559121b Dave Jiang 2024-06-11  637  	 */
0747c64559121b Dave Jiang 2024-06-11  638  	index = (unsigned long)parent_port->uport_dev;
0747c64559121b Dave Jiang 2024-06-11  639  	perf_ctx = xa_load(usp_xa, index);
0747c64559121b Dave Jiang 2024-06-11  640  	if (!perf_ctx) {
0747c64559121b Dave Jiang 2024-06-11  641  		struct cxl_perf_ctx *c __free(kfree) =
0747c64559121b Dave Jiang 2024-06-11  642  			kzalloc(sizeof(*perf_ctx), GFP_KERNEL);
0747c64559121b Dave Jiang 2024-06-11  643  
0747c64559121b Dave Jiang 2024-06-11  644  		if (!c)
0747c64559121b Dave Jiang 2024-06-11  645  			return -ENOMEM;
0747c64559121b Dave Jiang 2024-06-11  646  		ptr = xa_store(usp_xa, index, c, GFP_KERNEL);
0747c64559121b Dave Jiang 2024-06-11  647  		if (xa_is_err(ptr))
0747c64559121b Dave Jiang 2024-06-11  648  			return xa_err(ptr);
0747c64559121b Dave Jiang 2024-06-11  649  		perf_ctx = no_free_ptr(c);
0747c64559121b Dave Jiang 2024-06-11  650  	}
0747c64559121b Dave Jiang 2024-06-11  651  
0747c64559121b Dave Jiang 2024-06-11  652  	/* Direct upstream link from EP bandwidth */
0747c64559121b Dave Jiang 2024-06-11  653  	rc = cxl_pci_get_bandwidth(pdev, pci_coord);
0747c64559121b Dave Jiang 2024-06-11  654  	if (rc < 0)
0747c64559121b Dave Jiang 2024-06-11  655  		return rc;
0747c64559121b Dave Jiang 2024-06-11  656  
0747c64559121b Dave Jiang 2024-06-11  657  	/*
0747c64559121b Dave Jiang 2024-06-11  658  	 * Min of upstream link bandwidth and Endpoint CDAT bandwidth from
0747c64559121b Dave Jiang 2024-06-11  659  	 * DSLBIS.
0747c64559121b Dave Jiang 2024-06-11  660  	 */
0747c64559121b Dave Jiang 2024-06-11  661  	cxl_coordinates_combine(ep_coord, pci_coord, perf->cdat_coord);
0747c64559121b Dave Jiang 2024-06-11  662  
0747c64559121b Dave Jiang 2024-06-11  663  	/*
0747c64559121b Dave Jiang 2024-06-11  664  	 * If grandparent port is root, then there's no switch involved and
0747c64559121b Dave Jiang 2024-06-11  665  	 * the endpoint is connected to a root port.
0747c64559121b Dave Jiang 2024-06-11  666  	 */
0747c64559121b Dave Jiang 2024-06-11 @667  	if (!gp_is_root) {
0747c64559121b Dave Jiang 2024-06-11  668  		/*
0747c64559121b Dave Jiang 2024-06-11  669  		 * Retrieve the switch SSLBIS for switch downstream port
0747c64559121b Dave Jiang 2024-06-11  670  		 * associated with the endpoint bandwidth.
0747c64559121b Dave Jiang 2024-06-11  671  		 */
0747c64559121b Dave Jiang 2024-06-11  672  		rc = cxl_port_get_switch_dport_bandwidth(endpoint, sw_coord);
0747c64559121b Dave Jiang 2024-06-11  673  		if (rc)
0747c64559121b Dave Jiang 2024-06-11  674  			return rc;
0747c64559121b Dave Jiang 2024-06-11  675  
0747c64559121b Dave Jiang 2024-06-11  676  		/*
0747c64559121b Dave Jiang 2024-06-11  677  		 * Min of the earlier coordinates with the switch SSLBIS
0747c64559121b Dave Jiang 2024-06-11  678  		 * bandwidth
0747c64559121b Dave Jiang 2024-06-11  679  		 */
0747c64559121b Dave Jiang 2024-06-11  680  		cxl_coordinates_combine(ep_coord, ep_coord, sw_coord);
0747c64559121b Dave Jiang 2024-06-11  681  	}
0747c64559121b Dave Jiang 2024-06-11  682  
0747c64559121b Dave Jiang 2024-06-11  683  	/*
0747c64559121b Dave Jiang 2024-06-11  684  	 * Aggregate the computed bandwidth with the current aggregated bandwidth
0747c64559121b Dave Jiang 2024-06-11  685  	 * of the endpoints with the same switch upstream port.
0747c64559121b Dave Jiang 2024-06-11  686  	 */
0747c64559121b Dave Jiang 2024-06-11  687  	cxl_bandwidth_add(perf_ctx->coord, perf_ctx->coord, ep_coord);
0747c64559121b Dave Jiang 2024-06-11  688  	perf_ctx->port = parent_port;
0747c64559121b Dave Jiang 2024-06-11  689  	perf_ctx->dport = parent_port->parent_dport;
0747c64559121b Dave Jiang 2024-06-11  690  
0747c64559121b Dave Jiang 2024-06-11  691  	/* Count the active RPs */
0747c64559121b Dave Jiang 2024-06-11  692  	if (gp_is_root)
0747c64559121b Dave Jiang 2024-06-11  693  		perf_ctx->active_rps++;
0747c64559121b Dave Jiang 2024-06-11  694  
0747c64559121b Dave Jiang 2024-06-11  695  	return 0;
0747c64559121b Dave Jiang 2024-06-11  696  }
0747c64559121b Dave Jiang 2024-06-11  697  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
