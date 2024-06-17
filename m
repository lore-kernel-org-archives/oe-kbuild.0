Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C3813DDD4
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 14:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718633611; cv=none; b=tnU3c04lrBC+gFqNB9m2gaDQ72zsJPqUDrKXs1XIQ5hLI9u6KL9xSBjyFVdteasOBWjVqRvctWysQh/boiHh2enYWeVgyc2fim3Ep9s4urxtHz7CLOHkbturJw/3iD12hbm5vGPN52/7vu/d11HvV5faskpk7nGmZdVxklFJR5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718633611; c=relaxed/simple;
	bh=OAEJQjOKt6ZffNd2j5mnk3cRQHtaSIqZm1PkGW6xFEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cy4DQwLpgH96v9HvgfxTcW3aVUOOf2UpQtKpwSzOjX49PG7BiYozXh32y/UeOLJn71RIDTsYHFKmxNo/vphR4pMSU9ucRck448QVT0hMrKC1PAcSOxkL/qBtMoTurJy9v52rgMIUY6g68k8YyGNuQkANUiJfz3NCHegqm1leOy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4InLERe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4InLERe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso33545365e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718633607; x=1719238407; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+2jiT3XQoMJkJHMg5TyA11Us/KBxE/Mj+jL6EDQl+0=;
        b=g4InLERe4MvKYTlvkZRMEcQegDlncKHJdtILktoyCcvGyO9diaUHIDtrwGjDMuS/8v
         sCO4d/hEiKCNRKFJzXL+uN0ykHG28zju3cA/i+SoRtJylVgch7Mt2I5ZE3DGgJg6TWDW
         Do7K3O5Xd/Rv6NAUoracixoKIMb8+F0UiYy9Cvt6xXA+++Y1YFT+U8+AHfSyFBZJ4j8d
         GUzYqeUbmsgMty8XPWrfGWKiahBrYxAI+hBxB7M56ENXJj8N6Ajp3b0PUU8tql//uLBH
         kIqfBB26R/sdIT99Bhur46jEC5PIo7l3jEkitaHOAeZf34eWNaNvKE695AKP9JljmG1b
         ZxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633607; x=1719238407;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+2jiT3XQoMJkJHMg5TyA11Us/KBxE/Mj+jL6EDQl+0=;
        b=fdQJNoDIA426rEK8swPmnguEI5mDuagj+nd1nfBItpT0xyNlRNOB4yI50eXpLuDhzZ
         iux8fKKVr7yFwC3+DseQEBuoYi+ZvKjULxwC8bA5PfXBk4Q5KFaqljlKVxEqQEbM7tVo
         5gNxOULBLUPqwtEoa2pyGGpJ1pccrja27bvRLdcsPqFn0TUcAo80GLpTuk2Yq5YKYFVs
         stkEsg0QhmHcWmdb+Eei/jnik1wp9toeTo7/nLn5HLdyIHzqpuggcv0wBFr914LOzXDR
         ZJljrDsbc9PBT1Nf3TLJyrf/yVFmvpRuR5dF05dK+QuYpFyik5Ii0qNIi761URFYNdEu
         bU4w==
X-Gm-Message-State: AOJu0YxY8gccu8KaiBegDkoUXcw4gpD0XCyro642Fx5Al1DqX1x6EUUc
	5Cr0Ak+1++gC+cy+yT5GAigC1KYH1FgeDkVFqG45JE3cZPCSO9jHGOJ8fHYh45vCsQRa6Z2zMXP
	X
X-Google-Smtp-Source: AGHT+IGPIeFI147QY1+xbTFjyYG3mzvIbvrVtAibLY1gqJIT59qjqOVeUUcMQUqLv06nw8wMLK5hKQ==
X-Received: by 2002:a05:600c:4448:b0:421:7ee4:bbeb with SMTP id 5b1f17b1804b1-423047df7b9mr91768025e9.0.1718633607117;
        Mon, 17 Jun 2024 07:13:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9184sm193250525e9.13.2024.06.17.07.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:13:26 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:13:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-usp-shared-link 3/3] drivers/cxl/core/cdat.c:667
 cxl_endpoint_gather_coordinates() error: uninitialized symbol 'gp_is_root'.
Message-ID: <6c766b95-5219-44ca-8b54-c65ef6198250@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-usp-shared-link
head:   0747c64559121b9d16569c5b0801da3ab18f2144
commit: 0747c64559121b9d16569c5b0801da3ab18f2144 [3/3] cxl: Calculate region bandwidth of targets with shared upstream link
config: i386-randconfig-141-20240616 (https://download.01.org/0day-ci/archive/20240617/202406172334.NUywIZ5i-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406172334.NUywIZ5i-lkp@intel.com/

smatch warnings:
drivers/cxl/core/cdat.c:667 cxl_endpoint_gather_coordinates() error: uninitialized symbol 'gp_is_root'.

vim +/gp_is_root +667 drivers/cxl/core/cdat.c

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

This needs to be "bool gp_is_root = false;"

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

Unitialized.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

