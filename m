Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60E58BE5
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 02:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742092158; cv=none; b=W8ZoS1pS1ZeVoTet4KEO60cLdky6E8DsRhbDijRlHFoPHfhH2XjUWIs1x53A1EJvochbqnvKxNZ93ycDry0+O6Cn2o2ug19VHx2YXa/uajkrerzopPAuWz0Gw3puiULMUmJipiTCY747Lqin1xEjhW4e2bLWp2A+YQ96quebrqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742092158; c=relaxed/simple;
	bh=Eaq67a3pixutrI8AWKYarSPAmXeVkZiD/z6siK/H3V0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qZ7jraJYbvU1PFUwYkOanXNRhqUHIpBH4ET91b0Z3Vg9+4qMRGMA4POTKwUSe/6IT5zoxuC0OyNoTEigqQp8Kjcq9CRBM2CAgE0k0ILh6PytMdIX59iFU3AmIPRGk5ZVxTVqIU9YdSshgNFIzAjq5dAcdFxpOQPsENMBf7fIOEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1xxmggN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1xxmggN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742092156; x=1773628156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eaq67a3pixutrI8AWKYarSPAmXeVkZiD/z6siK/H3V0=;
  b=M1xxmggNVQB4TrUSlr/n61A6Z90uCiVTp7lBAoiNya+UcGUoyASn8o0d
   TN+A9r6AxTvNoET649wmi21XQYi+ygxt9u8/H7hlj05nuIS2eta7pU4AP
   Y1R+GE9yD6JBhLjOASdAAKNl+Uceeq4pKVK+I0D4OKzjQ1T3MDwZFy0wQ
   1gkRmKwyyV+ay/LoyLxNk7BY7MTsNC4D9HyzGlJIC06DBUyYaF7B2v59j
   Xl9c+ukaYq2spXSSilS0pYGcDqMWkMnOrkG8qfeaImj/pbJ5bsuOTzFB3
   XxlCLgvGrErr0ufJIiXxzdjfsIPaAxtd024zJKMUTsUGp+6zyB6mal91i
   A==;
X-CSE-ConnectionGUID: aQgleJWcRXeiTusFlvhMPQ==
X-CSE-MsgGUID: SiE9nvnbS+KiiaYOQlg1bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="68572946"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="68572946"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 19:29:15 -0700
X-CSE-ConnectionGUID: fbeAikifQ8ykUJ8yxm1jGg==
X-CSE-MsgGUID: Wt0I4gD7T1Gof25sBtIGlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="126484188"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Mar 2025 19:29:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttdkV-000Bmd-1W;
	Sun, 16 Mar 2025 02:29:11 +0000
Date: Sun, 16 Mar 2025 10:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cxl:next 5/20] drivers/cxl/core/cdat.c:656
 cxl_endpoint_gather_bandwidth() warn: passing positive error code '(-22)' to
 'PTR_ERR'
Message-ID: <202503161052.y7JD0WL5-lkp@intel.com>
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
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-cxl@vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Alejandro Lucero <alucerop@amd.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
head:   74d9c59658e4d3b06f163da0c5ed7647656705c1
commit: be5cbd0840275c68b3b7d0685d7acc26436c0d99 [5/20] cxl: Kill enum cxl_decoder_mode
:::::: branch date: 27 hours ago
:::::: commit date: 6 weeks ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250316/202503161052.y7JD0WL5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503161052.y7JD0WL5-lkp@intel.com/

smatch warnings:
drivers/cxl/core/cdat.c:656 cxl_endpoint_gather_bandwidth() warn: passing positive error code '(-22)' to 'PTR_ERR'

vim +656 drivers/cxl/core/cdat.c

a5ab0de0ebaa65e Dave Jiang   2024-09-03  609  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  610  /**
a5ab0de0ebaa65e Dave Jiang   2024-09-03  611   * cxl_endpoint_gather_bandwidth - collect all the endpoint bandwidth in an xarray
a5ab0de0ebaa65e Dave Jiang   2024-09-03  612   * @cxlr: CXL region for the bandwidth calculation
a5ab0de0ebaa65e Dave Jiang   2024-09-03  613   * @cxled: endpoint decoder to start on
a5ab0de0ebaa65e Dave Jiang   2024-09-03  614   * @usp_xa: (output) the xarray that collects all the bandwidth coordinates
a5ab0de0ebaa65e Dave Jiang   2024-09-03  615   *          indexed by the upstream device with data of 'struct cxl_perf_ctx'.
a5ab0de0ebaa65e Dave Jiang   2024-09-03  616   * @gp_is_root: (output) bool of whether the grandparent is cxl root.
a5ab0de0ebaa65e Dave Jiang   2024-09-03  617   *
a5ab0de0ebaa65e Dave Jiang   2024-09-03  618   * Return: 0 for success or -errno
a5ab0de0ebaa65e Dave Jiang   2024-09-03  619   *
a5ab0de0ebaa65e Dave Jiang   2024-09-03  620   * Collects aggregated endpoint bandwidth and store the bandwidth in
a5ab0de0ebaa65e Dave Jiang   2024-09-03  621   * an xarray indexed by the upstream device of the switch or the RP
a5ab0de0ebaa65e Dave Jiang   2024-09-03  622   * device. Each endpoint consists the minimum of the bandwidth from DSLBIS
a5ab0de0ebaa65e Dave Jiang   2024-09-03  623   * from the endpoint CDAT, the endpoint upstream link bandwidth, and the
a5ab0de0ebaa65e Dave Jiang   2024-09-03  624   * bandwidth from the SSLBIS of the switch CDAT for the switch upstream port to
a5ab0de0ebaa65e Dave Jiang   2024-09-03  625   * the downstream port that's associated with the endpoint. If the
a5ab0de0ebaa65e Dave Jiang   2024-09-03  626   * device is directly connected to a RP, then no SSLBIS is involved.
a5ab0de0ebaa65e Dave Jiang   2024-09-03  627   */
a5ab0de0ebaa65e Dave Jiang   2024-09-03  628  static int cxl_endpoint_gather_bandwidth(struct cxl_region *cxlr,
a5ab0de0ebaa65e Dave Jiang   2024-09-03  629  					 struct cxl_endpoint_decoder *cxled,
a5ab0de0ebaa65e Dave Jiang   2024-09-03  630  					 struct xarray *usp_xa,
a5ab0de0ebaa65e Dave Jiang   2024-09-03  631  					 bool *gp_is_root)
a5ab0de0ebaa65e Dave Jiang   2024-09-03  632  {
a5ab0de0ebaa65e Dave Jiang   2024-09-03  633  	struct cxl_port *endpoint = to_cxl_port(cxled->cxld.dev.parent);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  634  	struct cxl_port *parent_port = to_cxl_port(endpoint->dev.parent);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  635  	struct cxl_port *gp_port = to_cxl_port(parent_port->dev.parent);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  636  	struct access_coordinate pci_coord[ACCESS_COORDINATE_MAX];
a5ab0de0ebaa65e Dave Jiang   2024-09-03  637  	struct access_coordinate sw_coord[ACCESS_COORDINATE_MAX];
a5ab0de0ebaa65e Dave Jiang   2024-09-03  638  	struct access_coordinate ep_coord[ACCESS_COORDINATE_MAX];
a5ab0de0ebaa65e Dave Jiang   2024-09-03  639  	struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  640  	struct cxl_dev_state *cxlds = cxlmd->cxlds;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  641  	struct pci_dev *pdev = to_pci_dev(cxlds->dev);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  642  	struct cxl_perf_ctx *perf_ctx;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  643  	struct cxl_dpa_perf *perf;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  644  	unsigned long index;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  645  	void *ptr;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  646  	int rc;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  647  
cce3cd647721dc3 Li Zhijian   2024-10-22  648  	if (!dev_is_pci(cxlds->dev))
cce3cd647721dc3 Li Zhijian   2024-10-22  649  		return -ENODEV;
cce3cd647721dc3 Li Zhijian   2024-10-22  650  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  651  	if (cxlds->rcd)
a5ab0de0ebaa65e Dave Jiang   2024-09-03  652  		return -ENODEV;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  653  
be5cbd0840275c6 Dan Williams 2025-02-03  654  	perf = cxled_get_dpa_perf(cxled);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  655  	if (IS_ERR(perf))
a5ab0de0ebaa65e Dave Jiang   2024-09-03 @656  		return PTR_ERR(perf);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  657  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  658  	gp_port = to_cxl_port(parent_port->dev.parent);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  659  	*gp_is_root = is_cxl_root(gp_port);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  660  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  661  	/*
a5ab0de0ebaa65e Dave Jiang   2024-09-03  662  	 * If the grandparent is cxl root, then index is the root port,
a5ab0de0ebaa65e Dave Jiang   2024-09-03  663  	 * otherwise it's the parent switch upstream device.
a5ab0de0ebaa65e Dave Jiang   2024-09-03  664  	 */
a5ab0de0ebaa65e Dave Jiang   2024-09-03  665  	if (*gp_is_root)
a5ab0de0ebaa65e Dave Jiang   2024-09-03  666  		index = (unsigned long)endpoint->parent_dport->dport_dev;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  667  	else
a5ab0de0ebaa65e Dave Jiang   2024-09-03  668  		index = (unsigned long)parent_port->uport_dev;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  669  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  670  	perf_ctx = xa_load(usp_xa, index);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  671  	if (!perf_ctx) {
a5ab0de0ebaa65e Dave Jiang   2024-09-03  672  		struct cxl_perf_ctx *c __free(kfree) =
a5ab0de0ebaa65e Dave Jiang   2024-09-03  673  			kzalloc(sizeof(*perf_ctx), GFP_KERNEL);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  674  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  675  		if (!c)
a5ab0de0ebaa65e Dave Jiang   2024-09-03  676  			return -ENOMEM;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  677  		ptr = xa_store(usp_xa, index, c, GFP_KERNEL);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  678  		if (xa_is_err(ptr))
a5ab0de0ebaa65e Dave Jiang   2024-09-03  679  			return xa_err(ptr);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  680  		perf_ctx = no_free_ptr(c);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  681  		perf_ctx->port = parent_port;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  682  	}
a5ab0de0ebaa65e Dave Jiang   2024-09-03  683  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  684  	/* Direct upstream link from EP bandwidth */
a5ab0de0ebaa65e Dave Jiang   2024-09-03  685  	rc = cxl_pci_get_bandwidth(pdev, pci_coord);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  686  	if (rc < 0)
a5ab0de0ebaa65e Dave Jiang   2024-09-03  687  		return rc;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  688  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  689  	/*
a5ab0de0ebaa65e Dave Jiang   2024-09-03  690  	 * Min of upstream link bandwidth and Endpoint CDAT bandwidth from
a5ab0de0ebaa65e Dave Jiang   2024-09-03  691  	 * DSLBIS.
a5ab0de0ebaa65e Dave Jiang   2024-09-03  692  	 */
a5ab0de0ebaa65e Dave Jiang   2024-09-03  693  	cxl_coordinates_combine(ep_coord, pci_coord, perf->cdat_coord);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  694  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  695  	/*
a5ab0de0ebaa65e Dave Jiang   2024-09-03  696  	 * If grandparent port is root, then there's no switch involved and
a5ab0de0ebaa65e Dave Jiang   2024-09-03  697  	 * the endpoint is connected to a root port.
a5ab0de0ebaa65e Dave Jiang   2024-09-03  698  	 */
a5ab0de0ebaa65e Dave Jiang   2024-09-03  699  	if (!*gp_is_root) {
a5ab0de0ebaa65e Dave Jiang   2024-09-03  700  		/*
a5ab0de0ebaa65e Dave Jiang   2024-09-03  701  		 * Retrieve the switch SSLBIS for switch downstream port
a5ab0de0ebaa65e Dave Jiang   2024-09-03  702  		 * associated with the endpoint bandwidth.
a5ab0de0ebaa65e Dave Jiang   2024-09-03  703  		 */
a5ab0de0ebaa65e Dave Jiang   2024-09-03  704  		rc = cxl_port_get_switch_dport_bandwidth(endpoint, sw_coord);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  705  		if (rc)
a5ab0de0ebaa65e Dave Jiang   2024-09-03  706  			return rc;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  707  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  708  		/*
a5ab0de0ebaa65e Dave Jiang   2024-09-03  709  		 * Min of the earlier coordinates with the switch SSLBIS
a5ab0de0ebaa65e Dave Jiang   2024-09-03  710  		 * bandwidth
a5ab0de0ebaa65e Dave Jiang   2024-09-03  711  		 */
a5ab0de0ebaa65e Dave Jiang   2024-09-03  712  		cxl_coordinates_combine(ep_coord, ep_coord, sw_coord);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  713  	}
a5ab0de0ebaa65e Dave Jiang   2024-09-03  714  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  715  	/*
a5ab0de0ebaa65e Dave Jiang   2024-09-03  716  	 * Aggregate the computed bandwidth with the current aggregated bandwidth
a5ab0de0ebaa65e Dave Jiang   2024-09-03  717  	 * of the endpoints with the same switch upstream device or RP.
a5ab0de0ebaa65e Dave Jiang   2024-09-03  718  	 */
a5ab0de0ebaa65e Dave Jiang   2024-09-03  719  	cxl_bandwidth_add(perf_ctx->coord, perf_ctx->coord, ep_coord);
a5ab0de0ebaa65e Dave Jiang   2024-09-03  720  
a5ab0de0ebaa65e Dave Jiang   2024-09-03  721  	return 0;
a5ab0de0ebaa65e Dave Jiang   2024-09-03  722  }
a5ab0de0ebaa65e Dave Jiang   2024-09-03  723  

:::::: The code at line 656 was first introduced by commit
:::::: a5ab0de0ebaa65e0a75ec0761a2745c66a9d17dc cxl: Calculate region bandwidth of targets with shared upstream link

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
