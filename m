Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7897EE
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Apr 2023 06:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682230805; x=1713766805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wTltK+/hY3ye7wbO9aCDQY++JveTC3IZ1vHRAl22Gco=;
  b=L6a2yfXqZ0oKGYfhKznl2sY4h03vY2m8rPipp6j1XJ/dqAxtkMa0zsj7
   /yMEnO4mSJG8JiuVQLmCs+tzh0zycPPKVC0VDW+s16laj7Rn2QNu7tgxk
   adLbWJLryMfFgl97cYGFT0IHlhsXhCXvHv8AEuYiHBafERr+qoD5U9bVB
   oidP+UW84J0+MhTXFudDRYYeDF7uISeMz7JfZCRJoIAU9CjGkeirfSIDg
   puVqigi/uO5y3x9m46kmzHqjsoOLAnbeGNSGvRGPGwMwPALncG8pq3ePV
   0VBCrNC1YTsCiCKyLP9YX6F+/JEj+f+wlOEvLa8MlznIYNITAWCA+pzKC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="325851149"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="325851149"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 23:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="762018690"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="762018690"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2023 23:20:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqT4s-000hkY-2v;
	Sun, 23 Apr 2023 06:20:02 +0000
Date: Sun, 23 Apr 2023 14:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH v4 4/4] fpga: add initial KUnit test suites
Message-ID: <202304231455.FXiQya7T-lkp@intel.com>
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
In-Reply-To: <20230417122308.131453-5-marpagan@redhat.com>
References: <20230417122308.131453-5-marpagan@redhat.com>
TO: Marco Pagani <marpagan@redhat.com>

Hi Marco,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a8f57ae2eb07ab39a6f0ccad60c760743051026]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/fpga-add-fake-FPGA-manager/20230417-203029
base:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
patch link:    https://lore.kernel.org/r/20230417122308.131453-5-marpagan%40redhat.com
patch subject: [RFC PATCH v4 4/4] fpga: add initial KUnit test suites
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: nios2-randconfig-m031-20230420 (https://download.01.org/0day-ci/archive/20230423/202304231455.FXiQya7T-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304231455.FXiQya7T-lkp@intel.com/

smatch warnings:
drivers/fpga/tests/fake-fpga-mgr.c:231 fake_fpga_mgr_register() warn: possible memory leak of 'mgr_ctx'
drivers/fpga/tests/fake-fpga-bridge.c:131 fake_fpga_bridge_register() warn: possible memory leak of 'bridge_ctx'
drivers/fpga/tests/fake-fpga-region.c:94 fake_fpga_region_register() warn: possible memory leak of 'region_ctx'
drivers/fpga/tests/fake-fpga-region.c:187 fake_region_get_bridges() error: uninitialized symbol 'ret'.
drivers/fpga/tests/fpga-test.c:245 fpga_bridge_test_get_put_list() error: 'bridge_1_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:308 fpga_test_init() error: 'base_ctx->mgr_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:309 fpga_test_init() error: 'base_ctx->bridge_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:408 fpga_test_partial_rcfg() error: 'sub_bridge_0_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:419 fpga_test_partial_rcfg() error: 'sub_bridge_1_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:432 fpga_test_partial_rcfg() error: 'sub_region_0_ctx' dereferencing possible ERR_PTR()
drivers/fpga/tests/fpga-test.c:443 fpga_test_partial_rcfg() error: 'sub_region_1_ctx' dereferencing possible ERR_PTR()

vim +/mgr_ctx +231 drivers/fpga/tests/fake-fpga-mgr.c

0417c4b16b6924 Marco Pagani 2023-04-17  180  
0417c4b16b6924 Marco Pagani 2023-04-17  181  /**
0417c4b16b6924 Marco Pagani 2023-04-17  182   * fake_fpga_mgr_register() - register a fake FPGA manager.
0417c4b16b6924 Marco Pagani 2023-04-17  183   * @mgr_ctx: fake FPGA manager context data structure.
0417c4b16b6924 Marco Pagani 2023-04-17  184   * @test: KUnit test context object.
0417c4b16b6924 Marco Pagani 2023-04-17  185   *
0417c4b16b6924 Marco Pagani 2023-04-17  186   * Return: pointer to a new fake FPGA manager on success, an ERR_PTR()
0417c4b16b6924 Marco Pagani 2023-04-17  187   * encoded error code on failure.
0417c4b16b6924 Marco Pagani 2023-04-17  188   */
0417c4b16b6924 Marco Pagani 2023-04-17  189  struct fake_fpga_mgr *
0417c4b16b6924 Marco Pagani 2023-04-17  190  fake_fpga_mgr_register(struct kunit *test, struct device *parent)
0417c4b16b6924 Marco Pagani 2023-04-17  191  {
0417c4b16b6924 Marco Pagani 2023-04-17  192  	struct fake_fpga_mgr *mgr_ctx;
0417c4b16b6924 Marco Pagani 2023-04-17  193  	struct fake_mgr_data pdata;
0417c4b16b6924 Marco Pagani 2023-04-17  194  	int ret;
0417c4b16b6924 Marco Pagani 2023-04-17  195  
0417c4b16b6924 Marco Pagani 2023-04-17  196  	mgr_ctx = kzalloc(sizeof(*mgr_ctx), GFP_KERNEL);
0417c4b16b6924 Marco Pagani 2023-04-17  197  	if (!mgr_ctx) {
0417c4b16b6924 Marco Pagani 2023-04-17  198  		ret = -ENOMEM;
0417c4b16b6924 Marco Pagani 2023-04-17  199  		goto err_mem;
0417c4b16b6924 Marco Pagani 2023-04-17  200  	}
0417c4b16b6924 Marco Pagani 2023-04-17  201  
0417c4b16b6924 Marco Pagani 2023-04-17  202  	mgr_ctx->pdev = platform_device_alloc(FAKE_FPGA_MGR_DEV_NAME,
0417c4b16b6924 Marco Pagani 2023-04-17  203  					      PLATFORM_DEVID_AUTO);
0417c4b16b6924 Marco Pagani 2023-04-17  204  	if (!mgr_ctx->pdev) {
0417c4b16b6924 Marco Pagani 2023-04-17  205  		pr_err("Fake FPGA manager device allocation failed\n");
0417c4b16b6924 Marco Pagani 2023-04-17  206  		ret = -ENOMEM;
0417c4b16b6924 Marco Pagani 2023-04-17  207  		goto err_mem;
0417c4b16b6924 Marco Pagani 2023-04-17  208  	}
0417c4b16b6924 Marco Pagani 2023-04-17  209  
0417c4b16b6924 Marco Pagani 2023-04-17  210  	pdata.test = test;
0417c4b16b6924 Marco Pagani 2023-04-17  211  	platform_device_add_data(mgr_ctx->pdev, &pdata, sizeof(pdata));
0417c4b16b6924 Marco Pagani 2023-04-17  212  
0417c4b16b6924 Marco Pagani 2023-04-17  213  	mgr_ctx->pdev->dev.parent = parent;
0417c4b16b6924 Marco Pagani 2023-04-17  214  	ret = platform_device_add(mgr_ctx->pdev);
0417c4b16b6924 Marco Pagani 2023-04-17  215  	if (ret) {
0417c4b16b6924 Marco Pagani 2023-04-17  216  		pr_err("Fake FPGA manager device add failed\n");
0417c4b16b6924 Marco Pagani 2023-04-17  217  		goto err_pdev;
0417c4b16b6924 Marco Pagani 2023-04-17  218  	}
0417c4b16b6924 Marco Pagani 2023-04-17  219  
0417c4b16b6924 Marco Pagani 2023-04-17  220  	mgr_ctx->mgr = platform_get_drvdata(mgr_ctx->pdev);
0417c4b16b6924 Marco Pagani 2023-04-17  221  
0417c4b16b6924 Marco Pagani 2023-04-17  222  	if (test)
0417c4b16b6924 Marco Pagani 2023-04-17  223  		kunit_info(test, "Fake FPGA manager registered\n");
0417c4b16b6924 Marco Pagani 2023-04-17  224  
0417c4b16b6924 Marco Pagani 2023-04-17  225  	return mgr_ctx;
0417c4b16b6924 Marco Pagani 2023-04-17  226  
0417c4b16b6924 Marco Pagani 2023-04-17  227  err_pdev:
0417c4b16b6924 Marco Pagani 2023-04-17  228  	platform_device_put(mgr_ctx->pdev);
0417c4b16b6924 Marco Pagani 2023-04-17  229  	kfree(mgr_ctx);
0417c4b16b6924 Marco Pagani 2023-04-17  230  err_mem:
0417c4b16b6924 Marco Pagani 2023-04-17 @231  	return ERR_PTR(ret);
0417c4b16b6924 Marco Pagani 2023-04-17  232  }
0417c4b16b6924 Marco Pagani 2023-04-17  233  EXPORT_SYMBOL_GPL(fake_fpga_mgr_register);
0417c4b16b6924 Marco Pagani 2023-04-17  234  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
