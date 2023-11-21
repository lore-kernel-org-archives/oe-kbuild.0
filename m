Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A32208A
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuMXYRaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700595435; x=1732131435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7jG9pohRp2awDACTzok/E0ORB1vDFR7sF4U7scIhhaQ=;
  b=QuMXYRaCvSA7Zh6YIszc/ReWhLLxKjc6PWZnMGPilpjfLlb1Y5yUY62P
   BF1Aw5Qt4NG1JxZbCTumCCOAFlcIauxYfLVQKjoybITzJ90al/0CnRgq2
   3QlvNnM2+KPr0wcwWNuhunSWHYYTUL11lzLdP8g1EejKQslj80Xr1MRcO
   sTf5Gcmy7JiqXh/f4pSql17eOJOPvPd7MWcLFQpU3cHFMhZjNLN56GVzU
   jq0BUt5Qu2FhYgG63XbgNpHocFGEY/8ETnPIz4XUO8fUgTW+YWZq6Ioi5
   UltnAplO1R0cHGUpIn3C3HwMn7TAaCgitQ05UGX1ipRe6+bw0EZmw9xqU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5108913"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="5108913"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 11:37:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760206761"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="760206761"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 11:37:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5WYY-0008C1-0b;
	Tue, 21 Nov 2023 19:37:10 +0000
Date: Wed, 22 Nov 2023 03:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwtracing/intel_th/core.c:812: warning: Function parameter
 or member 'ndevres' not described in 'intel_th_alloc'
Message-ID: <202311220224.smGIP2Re-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: db73a059de00eed721f13051c0d6ff3e7de90fe8 intel_th: Rework resource passing between glue layers and core
date:   4 years, 7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 years, 7 months ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231122/202311220224.smGIP2Re-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220224.smGIP2Re-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311220224.smGIP2Re-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/core.c:812: warning: Function parameter or member 'drvdata' not described in 'intel_th_alloc'
>> drivers/hwtracing/intel_th/core.c:812: warning: Function parameter or member 'ndevres' not described in 'intel_th_alloc'


vim +812 drivers/hwtracing/intel_th/core.c

39f4034693b7c7b Alexander Shishkin 2015-09-22  802  
39f4034693b7c7b Alexander Shishkin 2015-09-22  803  /**
39f4034693b7c7b Alexander Shishkin 2015-09-22  804   * intel_th_alloc() - allocate a new Intel TH device and its subdevices
39f4034693b7c7b Alexander Shishkin 2015-09-22  805   * @dev:	parent device
db73a059de00eed Alexander Shishkin 2019-05-03  806   * @devres:	resources indexed by th_mmio_idx
39f4034693b7c7b Alexander Shishkin 2015-09-22  807   * @irq:	irq number
39f4034693b7c7b Alexander Shishkin 2015-09-22  808   */
39f4034693b7c7b Alexander Shishkin 2015-09-22  809  struct intel_th *
3321371b5d64847 Alexander Shishkin 2017-08-18  810  intel_th_alloc(struct device *dev, struct intel_th_drvdata *drvdata,
3321371b5d64847 Alexander Shishkin 2017-08-18  811  	       struct resource *devres, unsigned int ndevres, int irq)
39f4034693b7c7b Alexander Shishkin 2015-09-22 @812  {
39f4034693b7c7b Alexander Shishkin 2015-09-22  813  	struct intel_th *th;
661b0df8489a35d Alexander Shishkin 2017-08-23  814  	int err, r;
661b0df8489a35d Alexander Shishkin 2017-08-23  815  
db73a059de00eed Alexander Shishkin 2019-05-03  816  	if (ndevres < TH_MMIO_END)
db73a059de00eed Alexander Shishkin 2019-05-03  817  		return ERR_PTR(-EINVAL);
39f4034693b7c7b Alexander Shishkin 2015-09-22  818  
39f4034693b7c7b Alexander Shishkin 2015-09-22  819  	th = kzalloc(sizeof(*th), GFP_KERNEL);
39f4034693b7c7b Alexander Shishkin 2015-09-22  820  	if (!th)
39f4034693b7c7b Alexander Shishkin 2015-09-22  821  		return ERR_PTR(-ENOMEM);
39f4034693b7c7b Alexander Shishkin 2015-09-22  822  
39f4034693b7c7b Alexander Shishkin 2015-09-22  823  	th->id = ida_simple_get(&intel_th_ida, 0, 0, GFP_KERNEL);
39f4034693b7c7b Alexander Shishkin 2015-09-22  824  	if (th->id < 0) {
39f4034693b7c7b Alexander Shishkin 2015-09-22  825  		err = th->id;
39f4034693b7c7b Alexander Shishkin 2015-09-22  826  		goto err_alloc;
39f4034693b7c7b Alexander Shishkin 2015-09-22  827  	}
39f4034693b7c7b Alexander Shishkin 2015-09-22  828  
39f4034693b7c7b Alexander Shishkin 2015-09-22  829  	th->major = __register_chrdev(0, 0, TH_POSSIBLE_OUTPUTS,
39f4034693b7c7b Alexander Shishkin 2015-09-22  830  				      "intel_th/output", &intel_th_output_fops);
39f4034693b7c7b Alexander Shishkin 2015-09-22  831  	if (th->major < 0) {
39f4034693b7c7b Alexander Shishkin 2015-09-22  832  		err = th->major;
39f4034693b7c7b Alexander Shishkin 2015-09-22  833  		goto err_ida;
39f4034693b7c7b Alexander Shishkin 2015-09-22  834  	}
39f4034693b7c7b Alexander Shishkin 2015-09-22  835  	th->dev = dev;
3321371b5d64847 Alexander Shishkin 2017-08-18  836  	th->drvdata = drvdata;
39f4034693b7c7b Alexander Shishkin 2015-09-22  837  
db73a059de00eed Alexander Shishkin 2019-05-03  838  	for (r = 0; r < ndevres; r++)
db73a059de00eed Alexander Shishkin 2019-05-03  839  		th->resource[r] = devres[r];
a753bfcfdb1f31d Alexander Shishkin 2017-08-10  840  	th->num_resources = ndevres;
a753bfcfdb1f31d Alexander Shishkin 2017-08-10  841  	th->irq = irq;
a753bfcfdb1f31d Alexander Shishkin 2017-08-10  842  
d7b1787161b78a5 Alexander Shishkin 2016-02-15  843  	dev_set_drvdata(dev, th);
d7b1787161b78a5 Alexander Shishkin 2016-02-15  844  
142dfeb20209607 Alexander Shishkin 2016-06-22  845  	pm_runtime_no_callbacks(dev);
142dfeb20209607 Alexander Shishkin 2016-06-22  846  	pm_runtime_put(dev);
142dfeb20209607 Alexander Shishkin 2016-06-22  847  	pm_runtime_allow(dev);
142dfeb20209607 Alexander Shishkin 2016-06-22  848  
a753bfcfdb1f31d Alexander Shishkin 2017-08-10  849  	err = intel_th_populate(th);
a753bfcfdb1f31d Alexander Shishkin 2017-08-10  850  	if (err) {
a753bfcfdb1f31d Alexander Shishkin 2017-08-10  851  		/* free the subdevices and undo everything */
a753bfcfdb1f31d Alexander Shishkin 2017-08-10  852  		intel_th_free(th);
a753bfcfdb1f31d Alexander Shishkin 2017-08-10  853  		return ERR_PTR(err);
a753bfcfdb1f31d Alexander Shishkin 2017-08-10  854  	}
39f4034693b7c7b Alexander Shishkin 2015-09-22  855  
39f4034693b7c7b Alexander Shishkin 2015-09-22  856  	return th;
39f4034693b7c7b Alexander Shishkin 2015-09-22  857  
39f4034693b7c7b Alexander Shishkin 2015-09-22  858  err_ida:
39f4034693b7c7b Alexander Shishkin 2015-09-22  859  	ida_simple_remove(&intel_th_ida, th->id);
39f4034693b7c7b Alexander Shishkin 2015-09-22  860  
39f4034693b7c7b Alexander Shishkin 2015-09-22  861  err_alloc:
39f4034693b7c7b Alexander Shishkin 2015-09-22  862  	kfree(th);
39f4034693b7c7b Alexander Shishkin 2015-09-22  863  
39f4034693b7c7b Alexander Shishkin 2015-09-22  864  	return ERR_PTR(err);
39f4034693b7c7b Alexander Shishkin 2015-09-22  865  }
39f4034693b7c7b Alexander Shishkin 2015-09-22  866  EXPORT_SYMBOL_GPL(intel_th_alloc);
39f4034693b7c7b Alexander Shishkin 2015-09-22  867  

:::::: The code at line 812 was first introduced by commit
:::::: 39f4034693b7c7bd1fe4cb58c93259d600f55561 intel_th: Add driver infrastructure for Intel(R) Trace Hub devices

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
