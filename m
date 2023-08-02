Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6FD52F
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Aug 2023 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690995029; x=1722531029;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NW57atyaV9W9CYVo73k4N3LOQjnPIT/mZP3hAJ6Ff9s=;
  b=JwJ+psuzIVxTeopug8IJfTqdm7YHvvIFeRA8g1Aj75Ag2zl4imbcLnaD
   rKVeUoecQn8gQnPZ0kXfSOB5Yr0MEKga0vqt/wSmH2zw4JmTSpbir4Atm
   rJXRhL9XOPnTowSZBRsJ+Ty5XjPc3Upicn6svpCVbYpE3Mbr2b5TZctxe
   guc8N0ON+sWgk30rodBu/P60hGSPB7Tr+GBRCv1jr+0f/SgWnLHboH0Lp
   Wqwd68+mpgW6RVLZ2M2gouUrx71HGljnR9jMD3ZeqKw6H1aefVY/7A7bp
   zHgWO4lmXXcFs2RfP+Ejw+V7ZnycWdqUNmWVp1HFQWL08JwSnj7q+MiCk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="433480811"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="433480811"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 09:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="1059904152"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="1059904152"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2023 09:50:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRF3J-0001LO-0H;
	Wed, 02 Aug 2023 16:50:25 +0000
Date: Thu, 3 Aug 2023 00:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 5/7] nvmem: core: Rework layouts to become platform
 devices
Message-ID: <202308030002.DnSFOrMB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230801182132.1058707-6-miquel.raynal@bootlin.com>
References: <20230801182132.1058707-6-miquel.raynal@bootlin.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Robert Marko <robert.marko@sartura.hr>
CC: Luka Perkov <luka.perkov@sartura.hr>
CC: Michael Walle <michael@walle.cc>
CC: linux-kernel@vger.kernel.org
CC: Randy Dunlap <rdunlap@infradead.org>
CC: "Chen-Yu Tsai" <wenst@chromium.org>
CC: Daniel Golle <daniel@makrotopia.org>
CC: "Rafał Miłecki" <rafal@milecki.pl>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/nvmem-core-Create-all-cells-before-adding-the-nvmem-device/20230802-022331
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230801182132.1058707-6-miquel.raynal%40bootlin.com
patch subject: [PATCH v7 5/7] nvmem: core: Rework layouts to become platform devices
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-m001-20230730 (https://download.01.org/0day-ci/archive/20230803/202308030002.DnSFOrMB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030002.DnSFOrMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308030002.DnSFOrMB-lkp@intel.com/

New smatch warnings:
drivers/nvmem/core.c:1003 nvmem_register() warn: 'layout_np' is an error pointer or valid
drivers/nvmem/core.c:2130 nvmem_try_loading_layout_driver() warn: 'layout_np' is an error pointer or valid

Old smatch warnings:
drivers/nvmem/core.c:761 nvmem_add_cells_from_fixed_layout() warn: 'layout_np' is an error pointer or valid
drivers/nvmem/core.c:802 nvmem_layout_get() warn: 'layout_np' is an error pointer or valid

vim +/layout_np +1003 drivers/nvmem/core.c

eace75cfdcf7d9 Srinivas Kandagatla   2015-07-27   964  
bd1244561fa2a4 Gaosheng Cui          2022-09-16   965  	if (nvmem->nkeepout) {
bd1244561fa2a4 Gaosheng Cui          2022-09-16   966  		rval = nvmem_validate_keepouts(nvmem);
bd1244561fa2a4 Gaosheng Cui          2022-09-16   967  		if (rval)
ab3428cfd9aa2f Russell King (Oracle  2023-01-27   968) 			goto err_put_device;
bd1244561fa2a4 Gaosheng Cui          2022-09-16   969  	}
bd1244561fa2a4 Gaosheng Cui          2022-09-16   970  
b6c217ab9be689 Andrew Lunn           2016-02-26   971  	if (config->compat) {
ae0c2d725512f3 Srinivas Kandagatla   2019-04-16   972  		rval = nvmem_sysfs_setup_compat(nvmem, config);
b6c217ab9be689 Andrew Lunn           2016-02-26   973  		if (rval)
ab3428cfd9aa2f Russell King (Oracle  2023-01-27   974) 			goto err_put_device;
eace75cfdcf7d9 Srinivas Kandagatla   2015-07-27   975  	}
eace75cfdcf7d9 Srinivas Kandagatla   2015-07-27   976  
fa72d847d68d78 Bartosz Golaszewski   2018-09-21   977  	if (config->cells) {
fa72d847d68d78 Bartosz Golaszewski   2018-09-21   978  		rval = nvmem_add_cells(nvmem, config->cells, config->ncells);
fa72d847d68d78 Bartosz Golaszewski   2018-09-21   979  		if (rval)
db3546d58b5a0f Michael Walle         2023-01-27   980  			goto err_remove_cells;
fa72d847d68d78 Bartosz Golaszewski   2018-09-21   981  	}
eace75cfdcf7d9 Srinivas Kandagatla   2015-07-27   982  
b985f4cba6dbb3 Bartosz Golaszewski   2018-09-21   983  	rval = nvmem_add_cells_from_table(nvmem);
b985f4cba6dbb3 Bartosz Golaszewski   2018-09-21   984  	if (rval)
b985f4cba6dbb3 Bartosz Golaszewski   2018-09-21   985  		goto err_remove_cells;
b985f4cba6dbb3 Bartosz Golaszewski   2018-09-21   986  
27f699e578b1a7 Rafał Miłecki         2023-06-11   987  	rval = nvmem_add_cells_from_legacy_of(nvmem);
e888d445ac33a5 Bartosz Golaszewski   2018-09-21   988  	if (rval)
e888d445ac33a5 Bartosz Golaszewski   2018-09-21   989  		goto err_remove_cells;
e888d445ac33a5 Bartosz Golaszewski   2018-09-21   990  
571c19069d5f4b Miquel Raynal         2023-08-01   991  	rval = nvmem_add_cells_from_fixed_layout(nvmem);
ab3428cfd9aa2f Russell King (Oracle  2023-01-27   992) 	if (rval)
ab3428cfd9aa2f Russell King (Oracle  2023-01-27   993) 		goto err_remove_cells;
ab3428cfd9aa2f Russell King (Oracle  2023-01-27   994) 
571c19069d5f4b Miquel Raynal         2023-08-01   995  	dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
571c19069d5f4b Miquel Raynal         2023-08-01   996  
571c19069d5f4b Miquel Raynal         2023-08-01   997  	rval = device_add(&nvmem->dev);
266570f496b90d Michael Walle         2023-04-04   998  	if (rval)
266570f496b90d Michael Walle         2023-04-04   999  		goto err_remove_cells;
266570f496b90d Michael Walle         2023-04-04  1000  
00d059fd6702f0 Miquel Raynal         2023-08-01  1001  	/* Populate layouts as devices */
00d059fd6702f0 Miquel Raynal         2023-08-01  1002  	layout_np = of_nvmem_layout_get_container(nvmem);
00d059fd6702f0 Miquel Raynal         2023-08-01 @1003  	if (layout_np) {
00d059fd6702f0 Miquel Raynal         2023-08-01  1004  		rval = of_platform_populate(nvmem->dev.of_node, NULL, NULL, NULL);
00d059fd6702f0 Miquel Raynal         2023-08-01  1005  		if (rval)
00d059fd6702f0 Miquel Raynal         2023-08-01  1006  			goto err_remove_cells;
00d059fd6702f0 Miquel Raynal         2023-08-01  1007  		of_node_put(layout_np);
00d059fd6702f0 Miquel Raynal         2023-08-01  1008  	}
00d059fd6702f0 Miquel Raynal         2023-08-01  1009  
25c9b5d3aa24a0 Miquel Raynal         2023-08-01  1010  	mutex_lock(&nvmem_devices_mutex);
25c9b5d3aa24a0 Miquel Raynal         2023-08-01  1011  	list_add_tail(&nvmem->node, &nvmem_devices_list);
25c9b5d3aa24a0 Miquel Raynal         2023-08-01  1012  	mutex_unlock(&nvmem_devices_mutex);
25c9b5d3aa24a0 Miquel Raynal         2023-08-01  1013  
f4853e1c321edb Bartosz Golaszewski   2019-02-15  1014  	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
bee1138bea15a6 Bartosz Golaszewski   2018-09-21  1015  
eace75cfdcf7d9 Srinivas Kandagatla   2015-07-27  1016  	return nvmem;
3360acdf839170 Johan Hovold          2017-06-09  1017  
b985f4cba6dbb3 Bartosz Golaszewski   2018-09-21  1018  err_remove_cells:
b985f4cba6dbb3 Bartosz Golaszewski   2018-09-21  1019  	nvmem_device_remove_all_cells(nvmem);
fa72d847d68d78 Bartosz Golaszewski   2018-09-21  1020  	if (config->compat)
ae0c2d725512f3 Srinivas Kandagatla   2019-04-16  1021  		nvmem_sysfs_remove_compat(nvmem, config);
3360acdf839170 Johan Hovold          2017-06-09  1022  err_put_device:
3360acdf839170 Johan Hovold          2017-06-09  1023  	put_device(&nvmem->dev);
3360acdf839170 Johan Hovold          2017-06-09  1024  
b6c217ab9be689 Andrew Lunn           2016-02-26  1025  	return ERR_PTR(rval);
eace75cfdcf7d9 Srinivas Kandagatla   2015-07-27  1026  }
eace75cfdcf7d9 Srinivas Kandagatla   2015-07-27  1027  EXPORT_SYMBOL_GPL(nvmem_register);
eace75cfdcf7d9 Srinivas Kandagatla   2015-07-27  1028  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
