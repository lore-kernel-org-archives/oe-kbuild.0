Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F99929CF0
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699538; cv=none; b=gK4QyQAac2YtAqWBlaskinEVShFMPCOCW+l20t3Fblet0A4jF3HEJIwd22FK6dhh/MMVEaD/wE+9FgG5vuuNQgbDAKFTqyYGkCIPdAMAtkXVmeUXzRVMYsvRw9bn/n7URMjt56fVubhNygIxRgtFyb1aVmHVu6GGweTrhc9lZHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699538; c=relaxed/simple;
	bh=JJEDhj2thJWFNDi30uVm1i+orL75okoEU+12EyfbAmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHOB8CulYcJ34EaO6fW1SdxqdjITwIL8DlFV8qHaXGmo++enaKt6xlBgeGJGQyrMqnNX82Zy71QL/X/kUtJkSEaXo8TopqgUy14ljcBnjh5wngcutgPRAyp+cahGCHJL6dZehyFIa+Nd/nkdUToKIfewJDFjC1b/yHcOHJc1Rh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaMFP8jg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaMFP8jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720699536; x=1752235536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JJEDhj2thJWFNDi30uVm1i+orL75okoEU+12EyfbAmY=;
  b=gaMFP8jg8A3viLn3H/ZJ6CJzq6AwTCRsJUrCadPTHt5SuFlh/djl6hMu
   f7wo7vKW6iuD2rSBC9LnvRqjpxsqcG5UvdOz8wwH1V0mDhXf05+SI3HiV
   MsiSlGg43Z8BLh8JCSSCeiHsgXzpp3N18heXVUkU+CwX83bkdUdUsztmM
   vk+9qcbKw9IQUd7SIQYKgPGIbwV29PM38JVN9fVaFxnMSQVdEqwcPfzNz
   mwPD4829qP1RYUEGlcFfysBhDxJkIZS+f4qStF4QCoGn/nQIfnk3FaWAO
   tzPKw7zXG0pS1nb8a1BA3SubwkEktP6fdZTZLco8UXshqi53k/HHqJOfU
   A==;
X-CSE-ConnectionGUID: +F4MivqTTYCisu+jbkHyQw==
X-CSE-MsgGUID: qMO1c0HVSL+Zg/H2ncJBXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18213450"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="18213450"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 05:04:24 -0700
X-CSE-ConnectionGUID: R33hXbS7QbSrvD0y8kQJTQ==
X-CSE-MsgGUID: A0MwkVidQ5iWmHaVdIgsaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48610092"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jul 2024 05:04:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRsX6-000ZF2-2t;
	Thu, 11 Jul 2024 12:04:20 +0000
Date: Thu, 11 Jul 2024 20:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 2/3] cxl: Calculate region bandwidth of targets with
 shared upstream link
Message-ID: <202407111927.7Q2PF9i0-lkp@intel.com>
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
In-Reply-To: <20240710222716.797267-3-dave.jiang@intel.com>
References: <20240710222716.797267-3-dave.jiang@intel.com>
TO: Dave Jiang <dave.jiang@intel.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.10-rc6]
[cannot apply to cxl/next linus/master cxl/pending v6.10-rc7 next-20240711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/cxl-Preserve-the-CDAT-access_coordinate-for-an-endpoint/20240711-092210
base:   v6.10-rc6
patch link:    https://lore.kernel.org/r/20240710222716.797267-3-dave.jiang%40intel.com
patch subject: [PATCH v7 2/3] cxl: Calculate region bandwidth of targets with shared upstream link
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-141-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111927.7Q2PF9i0-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407111927.7Q2PF9i0-lkp@intel.com/

smatch warnings:
drivers/cxl/core/cdat.c:785 cxl_switch_gather_bandwidth() error: uninitialized symbol 'is_root'.

vim +/is_root +785 drivers/cxl/core/cdat.c

dfbcea34995e70 Dave Jiang 2024-07-10  732  
dfbcea34995e70 Dave Jiang 2024-07-10  733  /*
dfbcea34995e70 Dave Jiang 2024-07-10  734   * cxl_switch_gather_bandwidth - collect all the bandwidth at switch level in an xarray
dfbcea34995e70 Dave Jiang 2024-07-10  735   * @cxlr: The region being operated on
dfbcea34995e70 Dave Jiang 2024-07-10  736   * @input_xa: xarray indexed by upstream device of a switch with data of 'struct
dfbcea34995e70 Dave Jiang 2024-07-10  737   *	      cxl_perf_ctx'
dfbcea34995e70 Dave Jiang 2024-07-10  738   * @gp_is_root: (output) bool of whether the grandparent is cxl root.
dfbcea34995e70 Dave Jiang 2024-07-10  739   *
dfbcea34995e70 Dave Jiang 2024-07-10  740   * Return: a xarray of resulting cxl_perf_ctx per parent switch or root port
dfbcea34995e70 Dave Jiang 2024-07-10  741   *         or ERR_PTR(-errno)
dfbcea34995e70 Dave Jiang 2024-07-10  742   *
dfbcea34995e70 Dave Jiang 2024-07-10  743   * Iterate through the xarray. Take the minimum of the downstream calculated
dfbcea34995e70 Dave Jiang 2024-07-10  744   * bandwidth, the upstream link bandwidth, and the SSLBIS of the upstream
dfbcea34995e70 Dave Jiang 2024-07-10  745   * switch if exists. Sum the resulting bandwidth under the switch upstream
dfbcea34995e70 Dave Jiang 2024-07-10  746   * device or a RP device. The function can be iterated over multiple switches
dfbcea34995e70 Dave Jiang 2024-07-10  747   * if the switches are present.
dfbcea34995e70 Dave Jiang 2024-07-10  748   */
dfbcea34995e70 Dave Jiang 2024-07-10  749  static struct xarray *cxl_switch_gather_bandwidth(struct cxl_region *cxlr,
dfbcea34995e70 Dave Jiang 2024-07-10  750  						  struct xarray *input_xa,
dfbcea34995e70 Dave Jiang 2024-07-10  751  						  bool *gp_is_root)
dfbcea34995e70 Dave Jiang 2024-07-10  752  {
dfbcea34995e70 Dave Jiang 2024-07-10  753  	struct xarray *res_xa __free(free_perf_xa) =
dfbcea34995e70 Dave Jiang 2024-07-10  754  		kzalloc(sizeof(*res_xa), GFP_KERNEL);
dfbcea34995e70 Dave Jiang 2024-07-10  755  	struct access_coordinate coords[ACCESS_COORDINATE_MAX];
dfbcea34995e70 Dave Jiang 2024-07-10  756  	struct cxl_perf_ctx *ctx, *us_ctx;
dfbcea34995e70 Dave Jiang 2024-07-10  757  	unsigned long index, us_index;
dfbcea34995e70 Dave Jiang 2024-07-10  758  	int dev_count = 0;
dfbcea34995e70 Dave Jiang 2024-07-10  759  	int gp_count = 0;
dfbcea34995e70 Dave Jiang 2024-07-10  760  	void *ptr;
dfbcea34995e70 Dave Jiang 2024-07-10  761  	int rc;
dfbcea34995e70 Dave Jiang 2024-07-10  762  
dfbcea34995e70 Dave Jiang 2024-07-10  763  	if (!res_xa)
dfbcea34995e70 Dave Jiang 2024-07-10  764  		return ERR_PTR(-ENOMEM);
dfbcea34995e70 Dave Jiang 2024-07-10  765  	xa_init(res_xa);
dfbcea34995e70 Dave Jiang 2024-07-10  766  
dfbcea34995e70 Dave Jiang 2024-07-10  767  	xa_for_each(input_xa, index, ctx) {
dfbcea34995e70 Dave Jiang 2024-07-10  768  		struct device *dev = (struct device *)index;
dfbcea34995e70 Dave Jiang 2024-07-10  769  		struct cxl_port *port = ctx->port;
dfbcea34995e70 Dave Jiang 2024-07-10  770  		struct cxl_port *parent_port = to_cxl_port(port->dev.parent);
dfbcea34995e70 Dave Jiang 2024-07-10  771  		struct cxl_port *gp_port = to_cxl_port(parent_port->dev.parent);
dfbcea34995e70 Dave Jiang 2024-07-10  772  		struct cxl_dport *dport = port->parent_dport;
dfbcea34995e70 Dave Jiang 2024-07-10  773  		bool is_root;
dfbcea34995e70 Dave Jiang 2024-07-10  774  
dfbcea34995e70 Dave Jiang 2024-07-10  775  		dev_count++;
dfbcea34995e70 Dave Jiang 2024-07-10  776  		if (is_cxl_root(gp_port)) {
dfbcea34995e70 Dave Jiang 2024-07-10  777  			is_root = true;
dfbcea34995e70 Dave Jiang 2024-07-10  778  			gp_count++;
dfbcea34995e70 Dave Jiang 2024-07-10  779  		}
dfbcea34995e70 Dave Jiang 2024-07-10  780  
dfbcea34995e70 Dave Jiang 2024-07-10  781  		/*
dfbcea34995e70 Dave Jiang 2024-07-10  782  		 * If the grandparent is cxl root, then index is the root port,
dfbcea34995e70 Dave Jiang 2024-07-10  783  		 * otherwise it's the parent switch upstream device.
dfbcea34995e70 Dave Jiang 2024-07-10  784  		 */
dfbcea34995e70 Dave Jiang 2024-07-10 @785  		if (is_root)
dfbcea34995e70 Dave Jiang 2024-07-10  786  			us_index = (unsigned long)port->parent_dport->dport_dev;
dfbcea34995e70 Dave Jiang 2024-07-10  787  		else
dfbcea34995e70 Dave Jiang 2024-07-10  788  			us_index = (unsigned long)parent_port->uport_dev;
dfbcea34995e70 Dave Jiang 2024-07-10  789  
dfbcea34995e70 Dave Jiang 2024-07-10  790  		us_ctx = xa_load(res_xa, us_index);
dfbcea34995e70 Dave Jiang 2024-07-10  791  		if (!us_ctx) {
dfbcea34995e70 Dave Jiang 2024-07-10  792  			struct cxl_perf_ctx *n __free(kfree) =
dfbcea34995e70 Dave Jiang 2024-07-10  793  				kzalloc(sizeof(*n), GFP_KERNEL);
dfbcea34995e70 Dave Jiang 2024-07-10  794  
dfbcea34995e70 Dave Jiang 2024-07-10  795  			if (!n)
dfbcea34995e70 Dave Jiang 2024-07-10  796  				return ERR_PTR(-ENOMEM);
dfbcea34995e70 Dave Jiang 2024-07-10  797  
dfbcea34995e70 Dave Jiang 2024-07-10  798  			ptr = xa_store(res_xa, us_index, n, GFP_KERNEL);
dfbcea34995e70 Dave Jiang 2024-07-10  799  			if (xa_is_err(ptr))
dfbcea34995e70 Dave Jiang 2024-07-10  800  				return ERR_PTR(xa_err(ptr));
dfbcea34995e70 Dave Jiang 2024-07-10  801  			us_ctx = no_free_ptr(n);
dfbcea34995e70 Dave Jiang 2024-07-10  802  			us_ctx->port = parent_port;
dfbcea34995e70 Dave Jiang 2024-07-10  803  		}
dfbcea34995e70 Dave Jiang 2024-07-10  804  
dfbcea34995e70 Dave Jiang 2024-07-10  805  		/*
dfbcea34995e70 Dave Jiang 2024-07-10  806  		 * If the device isn't an upstream PCIe port, there's something
dfbcea34995e70 Dave Jiang 2024-07-10  807  		 * wrong with the topology.
dfbcea34995e70 Dave Jiang 2024-07-10  808  		 */
dfbcea34995e70 Dave Jiang 2024-07-10  809  		if (!dev_is_pci(dev))
dfbcea34995e70 Dave Jiang 2024-07-10  810  			return ERR_PTR(-EINVAL);
dfbcea34995e70 Dave Jiang 2024-07-10  811  
dfbcea34995e70 Dave Jiang 2024-07-10  812  		/* Retrieve the upstream link bandwidth */
dfbcea34995e70 Dave Jiang 2024-07-10  813  		rc = cxl_pci_get_bandwidth(to_pci_dev(dev), coords);
dfbcea34995e70 Dave Jiang 2024-07-10  814  		if (rc)
dfbcea34995e70 Dave Jiang 2024-07-10  815  			return ERR_PTR(-ENXIO);
dfbcea34995e70 Dave Jiang 2024-07-10  816  
dfbcea34995e70 Dave Jiang 2024-07-10  817  		/*
dfbcea34995e70 Dave Jiang 2024-07-10  818  		 * Take the min of downstream bandwidth and the upstream link
dfbcea34995e70 Dave Jiang 2024-07-10  819  		 * bandwidth.
dfbcea34995e70 Dave Jiang 2024-07-10  820  		 */
dfbcea34995e70 Dave Jiang 2024-07-10  821  		cxl_coordinates_combine(coords, coords, ctx->coord);
dfbcea34995e70 Dave Jiang 2024-07-10  822  
dfbcea34995e70 Dave Jiang 2024-07-10  823  		/*
dfbcea34995e70 Dave Jiang 2024-07-10  824  		 * Take the min of the calculated bandwdith and the upstream
dfbcea34995e70 Dave Jiang 2024-07-10  825  		 * switch SSLBIS bandwidth if there's a parent switch
dfbcea34995e70 Dave Jiang 2024-07-10  826  		 */
dfbcea34995e70 Dave Jiang 2024-07-10  827  		if (!is_root)
dfbcea34995e70 Dave Jiang 2024-07-10  828  			cxl_coordinates_combine(coords, coords, dport->coord);
dfbcea34995e70 Dave Jiang 2024-07-10  829  
dfbcea34995e70 Dave Jiang 2024-07-10  830  		/*
dfbcea34995e70 Dave Jiang 2024-07-10  831  		 * Aggregate the calculated bandwidth common to an upstream
dfbcea34995e70 Dave Jiang 2024-07-10  832  		 * switch.
dfbcea34995e70 Dave Jiang 2024-07-10  833  		 */
dfbcea34995e70 Dave Jiang 2024-07-10  834  		cxl_bandwidth_add(us_ctx->coord, us_ctx->coord, coords);
dfbcea34995e70 Dave Jiang 2024-07-10  835  	}
dfbcea34995e70 Dave Jiang 2024-07-10  836  
dfbcea34995e70 Dave Jiang 2024-07-10  837  	/* Asymmetric topology detected. */
dfbcea34995e70 Dave Jiang 2024-07-10  838  	if (gp_count) {
dfbcea34995e70 Dave Jiang 2024-07-10  839  		if (gp_count != dev_count) {
dfbcea34995e70 Dave Jiang 2024-07-10  840  			dev_dbg(&cxlr->dev,
dfbcea34995e70 Dave Jiang 2024-07-10  841  				"Asymmetric hierachy detected, bandwidth not updated\n");
dfbcea34995e70 Dave Jiang 2024-07-10  842  			return ERR_PTR(-EOPNOTSUPP);
dfbcea34995e70 Dave Jiang 2024-07-10  843  		}
dfbcea34995e70 Dave Jiang 2024-07-10  844  		*gp_is_root = true;
dfbcea34995e70 Dave Jiang 2024-07-10  845  	}
dfbcea34995e70 Dave Jiang 2024-07-10  846  
dfbcea34995e70 Dave Jiang 2024-07-10  847  	return no_free_ptr(res_xa);
dfbcea34995e70 Dave Jiang 2024-07-10  848  }
dfbcea34995e70 Dave Jiang 2024-07-10  849  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
