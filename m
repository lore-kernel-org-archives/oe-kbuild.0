Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1FC168D4
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/x5gW33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701078245; x=1732614245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLqcuw+rdy0JwJ6x1wrPr3m8AQNQjnBpB9DuzHyKqdk=;
  b=L/x5gW33cTJOSk9ZNDHPOqM1N9+allQ0dkN1DxpAyzUwvWT77aJ2nLqQ
   gyPyP7ZrTgfeUzgshhGxOzqriTmpHicfUxgjk+SkBVIW36w6kvWc7BMUm
   5oRkt92dPfWWNi0HHh1I2Uni6tZ7KOy6HWCCs6iRXmtWdVTdTBGReLttN
   Sxon2s+eYK8vR62DSVhEn4MhdhR2wXXC9Ct9CmBx85kb6gz0o3uWB4Phq
   jficv20zH6ZxSwIJsjY3z5FOAURN9sBykyZRHFDG65n++pSkPb+4bj91N
   KSPwrhUM540IZUVzTZl2QyqwGgvz8xJM89dl1aaNEoI7y8iYtkd0oOQu7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="459160448"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="459160448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 01:44:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="16236673"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2023 01:44:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Y9o-00067R-2X;
	Mon, 27 Nov 2023 09:44:00 +0000
Date: Mon, 27 Nov 2023 17:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/090-spi-hid 15/21]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:1173 dockchannel_hid_probe()
 warn: passing zero to 'PTR_ERR'
Message-ID: <202311271546.ImsRFnlZ-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   16871bb3228eaf55cbdb1dfb81c1cecec4ee0d52
commit: af53f3ff74f442fae36262bda9be6a94ad52925e [15/21] hid: Add Apple DockChannel HID transport driver
:::::: branch date: 8 days ago
:::::: commit date: 10 weeks ago
config: parisc-randconfig-r071-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271546.ImsRFnlZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311271546.ImsRFnlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311271546.ImsRFnlZ-lkp@intel.com/

smatch warnings:
drivers/hid/dockchannel-hid/dockchannel-hid.c:1173 dockchannel_hid_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1173 drivers/hid/dockchannel-hid/dockchannel-hid.c

af53f3ff74f442 Hector Martin 2022-07-08  1093  
af53f3ff74f442 Hector Martin 2022-07-08  1094  static int dockchannel_hid_probe(struct platform_device *pdev)
af53f3ff74f442 Hector Martin 2022-07-08  1095  {
af53f3ff74f442 Hector Martin 2022-07-08  1096  	struct device *dev = &pdev->dev;
af53f3ff74f442 Hector Martin 2022-07-08  1097  	struct dockchannel_hid *dchid;
af53f3ff74f442 Hector Martin 2022-07-08  1098  	struct device_node *child, *helper;
af53f3ff74f442 Hector Martin 2022-07-08  1099  	struct platform_device *helper_pdev;
af53f3ff74f442 Hector Martin 2022-07-08  1100  	struct property *prop;
af53f3ff74f442 Hector Martin 2022-07-08  1101  	int ret;
af53f3ff74f442 Hector Martin 2022-07-08  1102  
af53f3ff74f442 Hector Martin 2022-07-08  1103  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
af53f3ff74f442 Hector Martin 2022-07-08  1104  	if (ret)
af53f3ff74f442 Hector Martin 2022-07-08  1105  		return ret;
af53f3ff74f442 Hector Martin 2022-07-08  1106  
af53f3ff74f442 Hector Martin 2022-07-08  1107  	dchid = devm_kzalloc(dev, sizeof(*dchid), GFP_KERNEL);
af53f3ff74f442 Hector Martin 2022-07-08  1108  	if (!dchid) {
af53f3ff74f442 Hector Martin 2022-07-08  1109  		return -ENOMEM;
af53f3ff74f442 Hector Martin 2022-07-08  1110  	}
af53f3ff74f442 Hector Martin 2022-07-08  1111  
af53f3ff74f442 Hector Martin 2022-07-08  1112  	dchid->dev = dev;
af53f3ff74f442 Hector Martin 2022-07-08  1113  
af53f3ff74f442 Hector Martin 2022-07-08  1114  	/*
af53f3ff74f442 Hector Martin 2022-07-08  1115  	 * First make sure all the GPIOs are available, in cased we need to defer.
af53f3ff74f442 Hector Martin 2022-07-08  1116  	 * This is necessary because MTP will request them by name later, and by then
af53f3ff74f442 Hector Martin 2022-07-08  1117  	 * it's too late to defer the probe.
af53f3ff74f442 Hector Martin 2022-07-08  1118  	 */
af53f3ff74f442 Hector Martin 2022-07-08  1119  
af53f3ff74f442 Hector Martin 2022-07-08  1120  	for_each_child_of_node(dev->of_node, child) {
af53f3ff74f442 Hector Martin 2022-07-08  1121  		for_each_property_of_node(child, prop) {
af53f3ff74f442 Hector Martin 2022-07-08  1122  			size_t len = strlen(prop->name);
af53f3ff74f442 Hector Martin 2022-07-08  1123  			struct gpio_desc *gpio;
af53f3ff74f442 Hector Martin 2022-07-08  1124  
af53f3ff74f442 Hector Martin 2022-07-08  1125  			if (len < 12 || strncmp("apple,", prop->name, 6) ||
af53f3ff74f442 Hector Martin 2022-07-08  1126  			    strcmp("-gpios", prop->name + len - 6))
af53f3ff74f442 Hector Martin 2022-07-08  1127  				continue;
af53f3ff74f442 Hector Martin 2022-07-08  1128  
af53f3ff74f442 Hector Martin 2022-07-08  1129  			gpio = fwnode_gpiod_get_index(&child->fwnode, prop->name, 0, GPIOD_ASIS,
af53f3ff74f442 Hector Martin 2022-07-08  1130  						      prop->name);
af53f3ff74f442 Hector Martin 2022-07-08  1131  			if (IS_ERR_OR_NULL(gpio)) {
af53f3ff74f442 Hector Martin 2022-07-08  1132  				if (PTR_ERR(gpio) == -EPROBE_DEFER) {
af53f3ff74f442 Hector Martin 2022-07-08  1133  					of_node_put(child);
af53f3ff74f442 Hector Martin 2022-07-08  1134  					return -EPROBE_DEFER;
af53f3ff74f442 Hector Martin 2022-07-08  1135  				}
af53f3ff74f442 Hector Martin 2022-07-08  1136  			} else {
af53f3ff74f442 Hector Martin 2022-07-08  1137  				gpiod_put(gpio);
af53f3ff74f442 Hector Martin 2022-07-08  1138  			}
af53f3ff74f442 Hector Martin 2022-07-08  1139  		}
af53f3ff74f442 Hector Martin 2022-07-08  1140  	}
af53f3ff74f442 Hector Martin 2022-07-08  1141  
af53f3ff74f442 Hector Martin 2022-07-08  1142  	/*
af53f3ff74f442 Hector Martin 2022-07-08  1143  	 * Make sure we also have the MTP coprocessor available, and
af53f3ff74f442 Hector Martin 2022-07-08  1144  	 * defer probe if the helper hasn't probed yet.
af53f3ff74f442 Hector Martin 2022-07-08  1145  	 */
af53f3ff74f442 Hector Martin 2022-07-08  1146  	helper = of_parse_phandle(dev->of_node, "apple,helper-cpu", 0);
af53f3ff74f442 Hector Martin 2022-07-08  1147  	if (!helper) {
af53f3ff74f442 Hector Martin 2022-07-08  1148  		dev_err(dev, "Missing apple,helper-cpu property");
af53f3ff74f442 Hector Martin 2022-07-08  1149  		return -EINVAL;
af53f3ff74f442 Hector Martin 2022-07-08  1150  	}
af53f3ff74f442 Hector Martin 2022-07-08  1151  
af53f3ff74f442 Hector Martin 2022-07-08  1152  	helper_pdev = of_find_device_by_node(helper);
af53f3ff74f442 Hector Martin 2022-07-08  1153  	of_node_put(helper);
af53f3ff74f442 Hector Martin 2022-07-08  1154  	if (!helper_pdev) {
af53f3ff74f442 Hector Martin 2022-07-08  1155  		dev_err(dev, "Failed to find helper device");
af53f3ff74f442 Hector Martin 2022-07-08  1156  		return -EINVAL;
af53f3ff74f442 Hector Martin 2022-07-08  1157  	}
af53f3ff74f442 Hector Martin 2022-07-08  1158  
af53f3ff74f442 Hector Martin 2022-07-08  1159  	dchid->helper_link = device_link_add(dev, &helper_pdev->dev,
af53f3ff74f442 Hector Martin 2022-07-08  1160  					     DL_FLAG_AUTOREMOVE_CONSUMER);
af53f3ff74f442 Hector Martin 2022-07-08  1161  	put_device(&helper_pdev->dev);
af53f3ff74f442 Hector Martin 2022-07-08  1162  	if (!dchid->helper_link) {
af53f3ff74f442 Hector Martin 2022-07-08  1163  		dev_err(dev, "Failed to link to helper device");
af53f3ff74f442 Hector Martin 2022-07-08  1164  		return -EINVAL;
af53f3ff74f442 Hector Martin 2022-07-08  1165  	}
af53f3ff74f442 Hector Martin 2022-07-08  1166  
af53f3ff74f442 Hector Martin 2022-07-08  1167  	if (dchid->helper_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
af53f3ff74f442 Hector Martin 2022-07-08  1168  		return -EPROBE_DEFER;
af53f3ff74f442 Hector Martin 2022-07-08  1169  
af53f3ff74f442 Hector Martin 2022-07-08  1170  	/* Now it is safe to begin initializing */
af53f3ff74f442 Hector Martin 2022-07-08  1171  	dchid->dc = dockchannel_init(pdev);
af53f3ff74f442 Hector Martin 2022-07-08  1172  	if (IS_ERR_OR_NULL(dchid->dc)) {
af53f3ff74f442 Hector Martin 2022-07-08 @1173  		return PTR_ERR(dchid->dc);
af53f3ff74f442 Hector Martin 2022-07-08  1174  	}
af53f3ff74f442 Hector Martin 2022-07-08  1175  	dchid->new_iface_wq = alloc_workqueue("dchid-new", WQ_MEM_RECLAIM, 0);
af53f3ff74f442 Hector Martin 2022-07-08  1176  	if (!dchid->new_iface_wq)
af53f3ff74f442 Hector Martin 2022-07-08  1177  		return -ENOMEM;
af53f3ff74f442 Hector Martin 2022-07-08  1178  
af53f3ff74f442 Hector Martin 2022-07-08  1179  	dchid->comm = dchid_get_interface(dchid, IFACE_COMM, "comm");
af53f3ff74f442 Hector Martin 2022-07-08  1180  	if (!dchid->comm) {
af53f3ff74f442 Hector Martin 2022-07-08  1181  		dev_err(dchid->dev, "Failed to initialize comm interface");
af53f3ff74f442 Hector Martin 2022-07-08  1182  		return -EIO;
af53f3ff74f442 Hector Martin 2022-07-08  1183  	}
af53f3ff74f442 Hector Martin 2022-07-08  1184  
af53f3ff74f442 Hector Martin 2022-07-08  1185  	dev_info(dchid->dev, "Initialized, awaiting packets\n");
af53f3ff74f442 Hector Martin 2022-07-08  1186  	dockchannel_await(dchid->dc, dchid_handle_packet, dchid, sizeof(struct dchid_hdr));
af53f3ff74f442 Hector Martin 2022-07-08  1187  
af53f3ff74f442 Hector Martin 2022-07-08  1188  	return 0;
af53f3ff74f442 Hector Martin 2022-07-08  1189  }
af53f3ff74f442 Hector Martin 2022-07-08  1190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
