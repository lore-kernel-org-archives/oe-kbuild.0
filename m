Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083FA1D7E41
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245854; cv=none; b=KTW9ta5/zOD1Chhvgq/pHb5I2/eVhKFhkUk3biYH+mSPI5Pixg8cOBcg2n8WEd6Gz2rOkFaGWcDXZM4m4M8tiLurLXRYfwAobVdl18rvELAnt5hJ8/uC/yczuavWShFnmESC4K87hxwFxp1L7dC8a1t7Qx7JqYhvipsjgxN94ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245854; c=relaxed/simple;
	bh=jCxKdjJ8leT++P2/cJP135mKfyzasRzn/iTMJK9Feck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fwIRV5zLN9HS8QgFKz2GiNaZs8SYL+kZpjmSw8Lztw2nTYsbvFG1203EbIcI5p1AeQImODJHtqGz9IzegH8vt0TLNGU2ZCSrTuEpjHJ0pmN92dmROrKwf89tudN9tWnAnWRmCmb+3W0Bs/EdPJdupxdMIyliUzY8+T4S+IwGeDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDj0Wh5t; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDj0Wh5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736245851; x=1767781851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCxKdjJ8leT++P2/cJP135mKfyzasRzn/iTMJK9Feck=;
  b=DDj0Wh5tTDdh5T+fUrIOfo/WhXlks5QZXoVwaXREjPQdbvjb86Kibyps
   i5g8AOV7jeXY48iIr4z/dslq1VzTUgK981HerBJXAgqzTD10722mOczM3
   yM6+NptnShpZzVjk/mr8ay5gwfEUJ1EMsb6P3nDdN0o6VN+vYIZJhvrS0
   IB53CwPGr6lFMt0H7cvcLgc1OPYBeDwv2flT7i7EiKfN9JK45d4lDPxB9
   /DkwPzBKs0549XYm4owKYTzMbzSNBsJtDJmTWeA1962PcJ8OEpkdRv1Ac
   ZpX/FX1gmWW7cjbFckd58AO/+kVg69TZDWhjka71WbUJatj4vC4oVahGO
   Q==;
X-CSE-ConnectionGUID: P1lf3co4SJaDoDIULnWEqQ==
X-CSE-MsgGUID: C7j2kFzGQyewLYaWGuz7ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47413298"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="47413298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 02:30:50 -0800
X-CSE-ConnectionGUID: YHTUFcxIQkO0xAaiKaO2GQ==
X-CSE-MsgGUID: oLtFpgPmQzaRPcOC34QQNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="107785973"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jan 2025 02:30:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV6rG-000EY7-1l;
	Tue, 07 Jan 2025 10:30:46 +0000
Date: Tue, 7 Jan 2025 18:30:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 203/203]
 drivers/cxl/core/pci.c:381 __cxl_hdm_decode_init() warn: signedness bug
 returning '(-6)'
Message-ID: <202501071833.U0ecCRi2-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   fd2a406d90aed5daa59f286867063b9adba644cb
commit: 031217128990d7f0ab8c46db1afb3cf1e075fd29 [203/203] cxl/pci: Fix disabling memory if DVSEC CXL Range does not match a CFMWS window
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071833.U0ecCRi2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501071833.U0ecCRi2-lkp@intel.com/

smatch warnings:
drivers/cxl/core/pci.c:381 __cxl_hdm_decode_init() warn: signedness bug returning '(-6)'

vim +381 drivers/cxl/core/pci.c

34e37b4c432cd0 Dan Williams   2022-05-20  332  
a12562bb707760 Dan Williams   2022-05-18  333  static bool __cxl_hdm_decode_init(struct cxl_dev_state *cxlds,
fcfbc93cc33ec6 Dan Williams   2022-05-18  334  				  struct cxl_hdm *cxlhdm,
a12562bb707760 Dan Williams   2022-05-18  335  				  struct cxl_endpoint_dvsec_info *info)
a12562bb707760 Dan Williams   2022-05-18  336  {
fcfbc93cc33ec6 Dan Williams   2022-05-18  337  	void __iomem *hdm = cxlhdm->regs.hdm_decoder;
34e37b4c432cd0 Dan Williams   2022-05-20  338  	struct cxl_port *port = cxlhdm->port;
34e37b4c432cd0 Dan Williams   2022-05-20  339  	struct device *dev = cxlds->dev;
34e37b4c432cd0 Dan Williams   2022-05-20  340  	struct cxl_port *root;
34e37b4c432cd0 Dan Williams   2022-05-20  341  	int i, rc, allowed;
a12562bb707760 Dan Williams   2022-05-18  342  	u32 global_ctrl;
a12562bb707760 Dan Williams   2022-05-18  343  
fcfbc93cc33ec6 Dan Williams   2022-05-18  344  	global_ctrl = readl(hdm + CXL_HDM_DECODER_CTRL_OFFSET);
34e37b4c432cd0 Dan Williams   2022-05-20  345  
34e37b4c432cd0 Dan Williams   2022-05-20  346  	/*
34e37b4c432cd0 Dan Williams   2022-05-20  347  	 * If the HDM Decoder Capability is already enabled then assume
34e37b4c432cd0 Dan Williams   2022-05-20  348  	 * that some other agent like platform firmware set it up.
34e37b4c432cd0 Dan Williams   2022-05-20  349  	 */
34e37b4c432cd0 Dan Williams   2022-05-20  350  	if (global_ctrl & CXL_HDM_DECODER_ENABLE) {
34e37b4c432cd0 Dan Williams   2022-05-20  351  		rc = devm_cxl_enable_mem(&port->dev, cxlds);
34e37b4c432cd0 Dan Williams   2022-05-20  352  		if (rc)
34e37b4c432cd0 Dan Williams   2022-05-20  353  			return false;
34e37b4c432cd0 Dan Williams   2022-05-20  354  		return true;
34e37b4c432cd0 Dan Williams   2022-05-20  355  	}
34e37b4c432cd0 Dan Williams   2022-05-20  356  
34e37b4c432cd0 Dan Williams   2022-05-20  357  	root = to_cxl_port(port->dev.parent);
34e37b4c432cd0 Dan Williams   2022-05-20  358  	while (!is_cxl_root(root) && is_cxl_port(root->dev.parent))
34e37b4c432cd0 Dan Williams   2022-05-20  359  		root = to_cxl_port(root->dev.parent);
34e37b4c432cd0 Dan Williams   2022-05-20  360  	if (!is_cxl_root(root)) {
34e37b4c432cd0 Dan Williams   2022-05-20  361  		dev_err(dev, "Failed to acquire root port for HDM enable\n");
34e37b4c432cd0 Dan Williams   2022-05-20  362  		return false;
34e37b4c432cd0 Dan Williams   2022-05-20  363  	}
34e37b4c432cd0 Dan Williams   2022-05-20  364  
34e37b4c432cd0 Dan Williams   2022-05-20  365  	for (i = 0, allowed = 0; info->mem_enabled && i < info->ranges; i++) {
34e37b4c432cd0 Dan Williams   2022-05-20  366  		struct device *cxld_dev;
34e37b4c432cd0 Dan Williams   2022-05-20  367  
34e37b4c432cd0 Dan Williams   2022-05-20  368  		cxld_dev = device_find_child(&root->dev, &info->dvsec_range[i],
34e37b4c432cd0 Dan Williams   2022-05-20  369  					     dvsec_range_allowed);
34e37b4c432cd0 Dan Williams   2022-05-20  370  		if (!cxld_dev) {
34e37b4c432cd0 Dan Williams   2022-05-20  371  			dev_dbg(dev, "DVSEC Range%d denied by platform\n", i);
34e37b4c432cd0 Dan Williams   2022-05-20  372  			continue;
34e37b4c432cd0 Dan Williams   2022-05-20  373  		}
34e37b4c432cd0 Dan Williams   2022-05-20  374  		dev_dbg(dev, "DVSEC Range%d allowed by platform\n", i);
34e37b4c432cd0 Dan Williams   2022-05-20  375  		put_device(cxld_dev);
34e37b4c432cd0 Dan Williams   2022-05-20  376  		allowed++;
34e37b4c432cd0 Dan Williams   2022-05-20  377  	}
34e37b4c432cd0 Dan Williams   2022-05-20  378  
031217128990d7 Robert Richter 2024-02-16  379  	if (!allowed && info->mem_enabled) {
031217128990d7 Robert Richter 2024-02-16  380  		dev_err(dev, "Range register decodes outside platform defined CXL ranges.\n");
031217128990d7 Robert Richter 2024-02-16 @381  		return -ENXIO;
34e37b4c432cd0 Dan Williams   2022-05-20  382  	}
a12562bb707760 Dan Williams   2022-05-18  383  
a12562bb707760 Dan Williams   2022-05-18  384  	/*
a12562bb707760 Dan Williams   2022-05-18  385  	 * Per CXL 2.0 Section 8.1.3.8.3 and 8.1.3.8.4 DVSEC CXL Range 1 Base
a12562bb707760 Dan Williams   2022-05-18  386  	 * [High,Low] when HDM operation is enabled the range register values
a12562bb707760 Dan Williams   2022-05-18  387  	 * are ignored by the device, but the spec also recommends matching the
a12562bb707760 Dan Williams   2022-05-18  388  	 * DVSEC Range 1,2 to HDM Decoder Range 0,1. So, non-zero info->ranges
a12562bb707760 Dan Williams   2022-05-18  389  	 * are expected even though Linux does not require or maintain that
34e37b4c432cd0 Dan Williams   2022-05-20  390  	 * match. If at least one DVSEC range is enabled and allowed, skip HDM
34e37b4c432cd0 Dan Williams   2022-05-20  391  	 * Decoder Capability Enable.
a12562bb707760 Dan Williams   2022-05-18  392  	 */
34e37b4c432cd0 Dan Williams   2022-05-20  393  	if (info->mem_enabled)
fcfbc93cc33ec6 Dan Williams   2022-05-18  394  		return false;
a12562bb707760 Dan Williams   2022-05-18  395  
34e37b4c432cd0 Dan Williams   2022-05-20  396  	rc = devm_cxl_enable_hdm(&port->dev, cxlhdm);
34e37b4c432cd0 Dan Williams   2022-05-20  397  	if (rc)
34e37b4c432cd0 Dan Williams   2022-05-20  398  		return false;
34e37b4c432cd0 Dan Williams   2022-05-20  399  
34e37b4c432cd0 Dan Williams   2022-05-20  400  	rc = devm_cxl_enable_mem(&port->dev, cxlds);
34e37b4c432cd0 Dan Williams   2022-05-20  401  	if (rc)
34e37b4c432cd0 Dan Williams   2022-05-20  402  		return false;
a12562bb707760 Dan Williams   2022-05-18  403  
fcfbc93cc33ec6 Dan Williams   2022-05-18  404  	return true;
a12562bb707760 Dan Williams   2022-05-18  405  }
a12562bb707760 Dan Williams   2022-05-18  406  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
