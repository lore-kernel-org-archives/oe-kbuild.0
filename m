Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC737631
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Mar 2023 05:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679722498; x=1711258498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+tt40YqRrAEFpsQvQ2kStIohPccnzaAkadin0/rKm4=;
  b=PHfavoAmCwSGYyQlIPXhp3TGwroWveWCXYlGN9Top6LNCQG8TJ2dnj6R
   vluuL31UtrRiJNjztGzOfg/m4VZcnNqQ9d2FpsAgCPcTUAPYwjpYNOzYJ
   5f7eglLPNP2SbQwmSjEJNeycQoXcD3RXvNCK6RPiSNZdn3dSX33zITzU5
   0G79mDB8k9oVAQhocQHfUn4/tf9DWDEE3zu0K+h132UZDyYl89e9G/cEY
   5V3yiwUlMAltDcCzu+G0lW5sgtd5z2QRAzDwU2AHeLQ8CZnJr63Iunolx
   1YiSNAzT+mNYNBag/RZ8VBhAeRCEETTUu6kqVL8j8NItUaYscYgsbPuMj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="339962223"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="339962223"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 22:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="685426362"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="685426362"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Mar 2023 22:34:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfwYB-000Fz1-30;
	Sat, 25 Mar 2023 05:34:47 +0000
Date: Sat, 25 Mar 2023 13:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cxl:for-6.4/cxl-type-2 17/22] drivers/cxl/core/memdev.c:414
 cxl_acquire_endpoint() warn: inconsistent returns '&cxlmd->dev.mutex'.
Message-ID: <202303251356.rx03HcjE-lkp@intel.com>
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
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-cxl@vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.4/cxl-type-2
head:   0b80e8b55828313bcd08c4740646689e648de444
commit: 61f6d520258ef0a4e558e7d00442ae9297c6c107 [17/22] cxl/memdev: Indicate probe deferral
:::::: branch date: 5 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230325/202303251356.rx03HcjE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303251356.rx03HcjE-lkp@intel.com/

smatch warnings:
drivers/cxl/core/memdev.c:414 cxl_acquire_endpoint() warn: inconsistent returns '&cxlmd->dev.mutex'.

vim +414 drivers/cxl/core/memdev.c

3d135db510240f Ben Widawsky 2021-08-02  383  
61f6d520258ef0 Dan Williams 2023-03-22  384  /*
61f6d520258ef0 Dan Williams 2023-03-22  385   * Try to get a locked reference on a memdev's CXL port topology
61f6d520258ef0 Dan Williams 2023-03-22  386   * connection. Be careful to observe when cxl_mem_probe() has deposited
61f6d520258ef0 Dan Williams 2023-03-22  387   * a probe deferral awaiting the arrival of the CXL root driver
61f6d520258ef0 Dan Williams 2023-03-22  388   */
61f6d520258ef0 Dan Williams 2023-03-22  389  struct cxl_port *cxl_acquire_endpoint(struct cxl_memdev *cxlmd)
61f6d520258ef0 Dan Williams 2023-03-22  390  {
61f6d520258ef0 Dan Williams 2023-03-22  391  	struct cxl_port *endpoint;
61f6d520258ef0 Dan Williams 2023-03-22  392  	int rc = -ENXIO;
61f6d520258ef0 Dan Williams 2023-03-22  393  
61f6d520258ef0 Dan Williams 2023-03-22  394  	device_lock(&cxlmd->dev);
61f6d520258ef0 Dan Williams 2023-03-22  395  	endpoint = cxlmd->endpoint;
61f6d520258ef0 Dan Williams 2023-03-22  396  	if (!endpoint)
61f6d520258ef0 Dan Williams 2023-03-22  397  		goto err;
61f6d520258ef0 Dan Williams 2023-03-22  398  
61f6d520258ef0 Dan Williams 2023-03-22  399  	if (IS_ERR(endpoint)) {
61f6d520258ef0 Dan Williams 2023-03-22  400  		rc = PTR_ERR(endpoint);
61f6d520258ef0 Dan Williams 2023-03-22  401  		goto err;
61f6d520258ef0 Dan Williams 2023-03-22  402  	}
61f6d520258ef0 Dan Williams 2023-03-22  403  
61f6d520258ef0 Dan Williams 2023-03-22  404  	device_lock(&endpoint->dev);
61f6d520258ef0 Dan Williams 2023-03-22  405  	if (!endpoint->dev.driver)
61f6d520258ef0 Dan Williams 2023-03-22  406  		goto err_endpoint;
61f6d520258ef0 Dan Williams 2023-03-22  407  
61f6d520258ef0 Dan Williams 2023-03-22  408  	return endpoint;
61f6d520258ef0 Dan Williams 2023-03-22  409  
61f6d520258ef0 Dan Williams 2023-03-22  410  err_endpoint:
61f6d520258ef0 Dan Williams 2023-03-22  411  	device_unlock(&endpoint->dev);
61f6d520258ef0 Dan Williams 2023-03-22  412  err:
61f6d520258ef0 Dan Williams 2023-03-22  413  	device_unlock(&cxlmd->dev);
61f6d520258ef0 Dan Williams 2023-03-22 @414  	return ERR_PTR(rc);
61f6d520258ef0 Dan Williams 2023-03-22  415  }
61f6d520258ef0 Dan Williams 2023-03-22  416  EXPORT_SYMBOL_NS(cxl_acquire_endpoint, CXL);
61f6d520258ef0 Dan Williams 2023-03-22  417  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
