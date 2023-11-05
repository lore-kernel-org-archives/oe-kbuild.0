Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF68BEB
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2c2odbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699175825; x=1730711825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2cvpGIhSuICxXV21Hd7m/S3jLVoKx/9+yBBuHfoQXSo=;
  b=N2c2odbE+h9M5KFTxcV9wWtq9lRNKIQ1wZjy6ayT0Zhv9NuytjXKCcxG
   F9ScoY9tsZ1YkZ9n6cY3AJmpA+6kf/1AOXJGM6xDWws3cGlckfFgY2zLu
   5Kls9HrjAPGDBHZNZwXv3GIGWZiIeQXqPsdgpdwBHxW5Dm/WE5/tf2mA/
   o812jusDEfwp2F2y99KA5Orbee9uzkrP01NztF8bMDG02yrd4p8OZQqKX
   WaR3epQrhdIWOtUoWEHZZ7OVRVdo+jUT73wvrbrGZyXZTMNN4BxhK3UTB
   tPjSdta4c6+Ueb6/oBqwKsojOPIpLT2IZ8C468/efd4Yze/to4bkRUQx3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="388021262"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="388021262"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:17:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="879131799"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="879131799"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2023 01:17:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzZFd-0005Fa-0o;
	Sun, 05 Nov 2023 09:17:01 +0000
Date: Sun, 5 Nov 2023 17:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/cxl/core/port.c:331 cxl_root_decoder_visible() error: we
 previously assumed 'a' could be null (see line 327)
Message-ID: <202311051725.IRYFuC0N-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Gregory Price <gregory.price@memverge.com>

Hi Dan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: 45d235c56b2bc51749af9cc8fe6ace18aa8b81be cxl/region: Enable CONFIG_CXL_REGION to be toggled
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20231104 (https://download.01.org/0day-ci/archive/20231105/202311051725.IRYFuC0N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311051725.IRYFuC0N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311051725.IRYFuC0N-lkp@intel.com/

smatch warnings:
drivers/cxl/core/port.c:331 cxl_root_decoder_visible() error: we previously assumed 'a' could be null (see line 327)

vim +/a +331 drivers/cxl/core/port.c

6e099264185d05 Dan Williams 2023-02-10  315  
779dd20cfb56c5 Ben Widawsky 2021-06-08  316  static umode_t cxl_root_decoder_visible(struct kobject *kobj, struct attribute *a, int n)
779dd20cfb56c5 Ben Widawsky 2021-06-08  317  {
779dd20cfb56c5 Ben Widawsky 2021-06-08  318  	struct device *dev = kobj_to_dev(kobj);
779dd20cfb56c5 Ben Widawsky 2021-06-08  319  	struct cxl_root_decoder *cxlrd = to_cxl_root_decoder(dev);
779dd20cfb56c5 Ben Widawsky 2021-06-08  320  
779dd20cfb56c5 Ben Widawsky 2021-06-08  321  	if (a == CXL_REGION_ATTR(create_pmem_region) && !can_create_pmem(cxlrd))
779dd20cfb56c5 Ben Widawsky 2021-06-08  322  		return 0;
779dd20cfb56c5 Ben Widawsky 2021-06-08  323  
6e099264185d05 Dan Williams 2023-02-10  324  	if (a == CXL_REGION_ATTR(create_ram_region) && !can_create_ram(cxlrd))
6e099264185d05 Dan Williams 2023-02-10  325  		return 0;
6e099264185d05 Dan Williams 2023-02-10  326  
6e099264185d05 Dan Williams 2023-02-10 @327  	if (a == CXL_REGION_ATTR(delete_region) &&
6e099264185d05 Dan Williams 2023-02-10  328  	    !(can_create_pmem(cxlrd) || can_create_ram(cxlrd)))
779dd20cfb56c5 Ben Widawsky 2021-06-08  329  		return 0;
779dd20cfb56c5 Ben Widawsky 2021-06-08  330  
779dd20cfb56c5 Ben Widawsky 2021-06-08 @331  	return a->mode;
779dd20cfb56c5 Ben Widawsky 2021-06-08  332  }
779dd20cfb56c5 Ben Widawsky 2021-06-08  333  

:::::: The code at line 331 was first introduced by commit
:::::: 779dd20cfb56c510f89877cca45529fa9f8bc450 cxl/region: Add region creation support

:::::: TO: Ben Widawsky <bwidawsk@kernel.org>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
