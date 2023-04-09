Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1AF1FDE
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Apr 2023 22:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681080232; x=1712616232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mw8Dmj5S4FqwDvU6bYthoxy8YBhxmyNPpaWPukRnpqs=;
  b=IaVm+5RPu7q/nV6iE/8TWZDG6q10xX6DDaFV3FfIsjFk3sw1NNvH13xe
   78cv97XjMmidf58trpl2kK4CHKwLu5OJ1om2gRYC3pWaL7QuZGPm32amf
   Jz4slcKADe4FeQOX/gZQYg6QIZwqnU5NijYerf184di+PoNp+ZjxbVStw
   s5fh6Pp8mawxyLi3J2AqpBGtuKQgVyFc/jp4xaQuLLiNmeLU/rvGRaGLa
   AcBacEdZHqLgGeoICFK/D7agy09hgg05dQgQRPfAJXalTE8YuZm4fe5fE
   GMhbzevtChVe/G+W1kc4R1+Iupokrf08GAf6ca25xtFDaoXbdjG2BJsd7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="345035586"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="345035586"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 15:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="831747769"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="831747769"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2023 15:43:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pldlG-000UpV-03;
	Sun, 09 Apr 2023 22:43:50 +0000
Date: Mon, 10 Apr 2023 06:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djiang:cxl-qtg 9/23] drivers/cxl/core/acpi.c:39
 cxl_acpi_get_rootdev_handle() error: potentially dereferencing uninitialized
 'root_dev'.
Message-ID: <202304100611.Q5ElN5qo-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   5c305908f705279678135d3adf13cf2165c0609c
commit: 72592f1b33e6c7cd0dd849edc337634f6ea9ea85 [9/23] cxl: Add helper function to retrieve ACPI handle of CXL root device
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230410/202304100611.Q5ElN5qo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304100611.Q5ElN5qo-lkp@intel.com/

smatch warnings:
drivers/cxl/core/acpi.c:39 cxl_acpi_get_rootdev_handle() error: potentially dereferencing uninitialized 'root_dev'.

vim +/root_dev +39 drivers/cxl/core/acpi.c

e1ecd523e2a7a7 Dave Jiang 2022-12-13  12  
e1ecd523e2a7a7 Dave Jiang 2022-12-13  13  const guid_t acpi_cxl_qtg_id_guid =
e1ecd523e2a7a7 Dave Jiang 2022-12-13  14  	GUID_INIT(0xF365F9A6, 0xA7DE, 0x4071,
e1ecd523e2a7a7 Dave Jiang 2022-12-13  15  		  0xA6, 0x6A, 0xB4, 0x0C, 0x0B, 0x4F, 0x8E, 0x52);
e1ecd523e2a7a7 Dave Jiang 2022-12-13  16  
72592f1b33e6c7 Dave Jiang 2023-01-10  17  /**
72592f1b33e6c7 Dave Jiang 2023-01-10  18   * cxl_acpi_get_rootdev_handle - get the ACPI handle of the CXL root device
72592f1b33e6c7 Dave Jiang 2023-01-10  19   * @dev: 'struct device' to start searching from. Should be from cxl_port->dev.
72592f1b33e6c7 Dave Jiang 2023-01-10  20   *
72592f1b33e6c7 Dave Jiang 2023-01-10  21   * Return: acpi_handle on success, errptr of errno on error.
72592f1b33e6c7 Dave Jiang 2023-01-10  22   *
72592f1b33e6c7 Dave Jiang 2023-01-10  23   * Looks for the ACPI0017 device and return the ACPI handle
72592f1b33e6c7 Dave Jiang 2023-01-10  24   **/
72592f1b33e6c7 Dave Jiang 2023-01-10  25  acpi_handle cxl_acpi_get_rootdev_handle(struct device *dev)
72592f1b33e6c7 Dave Jiang 2023-01-10  26  {
72592f1b33e6c7 Dave Jiang 2023-01-10  27  	struct device *itr = dev;
72592f1b33e6c7 Dave Jiang 2023-01-10  28  	struct device *root_dev;
72592f1b33e6c7 Dave Jiang 2023-01-10  29  	acpi_handle handle;
72592f1b33e6c7 Dave Jiang 2023-01-10  30  
72592f1b33e6c7 Dave Jiang 2023-01-10  31  	if (!dev)
72592f1b33e6c7 Dave Jiang 2023-01-10  32  		return ERR_PTR(-EINVAL);
72592f1b33e6c7 Dave Jiang 2023-01-10  33  
72592f1b33e6c7 Dave Jiang 2023-01-10  34  	while (itr->parent) {
72592f1b33e6c7 Dave Jiang 2023-01-10  35  		root_dev = itr;
72592f1b33e6c7 Dave Jiang 2023-01-10  36  		itr = itr->parent;
72592f1b33e6c7 Dave Jiang 2023-01-10  37  	}
72592f1b33e6c7 Dave Jiang 2023-01-10  38  
72592f1b33e6c7 Dave Jiang 2023-01-10 @39  	if (!dev_is_platform(root_dev))
72592f1b33e6c7 Dave Jiang 2023-01-10  40  		return ERR_PTR(-ENODEV);
72592f1b33e6c7 Dave Jiang 2023-01-10  41  
72592f1b33e6c7 Dave Jiang 2023-01-10  42  	handle = ACPI_HANDLE(root_dev);
72592f1b33e6c7 Dave Jiang 2023-01-10  43  	if (!handle)
72592f1b33e6c7 Dave Jiang 2023-01-10  44  		return ERR_PTR(-ENODEV);
72592f1b33e6c7 Dave Jiang 2023-01-10  45  
72592f1b33e6c7 Dave Jiang 2023-01-10  46  	return handle;
72592f1b33e6c7 Dave Jiang 2023-01-10  47  }
72592f1b33e6c7 Dave Jiang 2023-01-10  48  EXPORT_SYMBOL_NS_GPL(cxl_acpi_get_rootdev_handle, CXL);
72592f1b33e6c7 Dave Jiang 2023-01-10  49  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
