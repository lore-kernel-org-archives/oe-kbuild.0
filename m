Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E25B11C80
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Dec 2023 05:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h89B3hXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703049859; x=1734585859;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wWQyUfifuKdk5wYe+x02WWVG5295TiaGLMs0dIjm4Qc=;
  b=h89B3hXXxe30vhPgV0ENmsXvwlvx56zEqx+UXHNvYMExTivxLatClpse
   zcs/IpL/D0Y80bPabjA2CWWg4mAkpPX+nd8smaK8obmhwb9cQN4NET3kO
   a7s/Iq8VWt2MQ6z6jCk/R0W7QnnLaF4EE6o9OJwBwjoYmCdYYrHmt31iD
   Db2ot0CoQXdNSFgxOPBtXGissmWmRQ8y11p2XB5SdP1NWPYSEWIir5IAl
   pC/Mepc03EXFlR4Oxk3Y0aOK9aro+lvsMmFJVy+lfiWXE4gWqXnOIn4dw
   GRDUVRtNOuq3fNCqC/4ZEscQImTN+oehx48ZhpqOerDgo7is2paRUM9/8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9142176"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="9142176"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 21:24:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769463602"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="769463602"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Dec 2023 21:24:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFp42-0006Qv-3D;
	Wed, 20 Dec 2023 05:24:15 +0000
Date: Wed, 20 Dec 2023 13:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ieee1394-linux1394:topic/detect-legacy-layout-of-configuration-rom
 8/9] drivers/firewire/core-device.c:348 show_text_leaf() error:
 uninitialized symbol 'ret'.
Message-ID: <202312201345.cejDvwhZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux1394-devel@lists.sourceforge.net
TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git topic/detect-legacy-layout-of-configuration-rom
head:   f79f570526152ab440914a792696d1bc039d50bd
commit: 4a70f38f54d1c0ae523656e30d805cec27bfd1ae [8/9] firewire: core: detect model name for legacy layout of configuration ROM
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r071-20231220 (https://download.01.org/0day-ci/archive/20231220/202312201345.cejDvwhZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312201345.cejDvwhZ-lkp@intel.com/

smatch warnings:
drivers/firewire/core-device.c:348 show_text_leaf() error: uninitialized symbol 'ret'.

vim +/ret +348 drivers/firewire/core-device.c

7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  309  
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  310  #define IMMEDIATE_ATTR(name, key)				\
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  311  	{ __ATTR(name, S_IRUGO, show_immediate, NULL), key }
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  312  
53dca51175cc2f drivers/firewire/fw-device.c   Stefan Richter    2008-12-14  313  static ssize_t show_text_leaf(struct device *dev,
53dca51175cc2f drivers/firewire/fw-device.c   Stefan Richter    2008-12-14  314  			      struct device_attribute *dattr, char *buf)
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  315  {
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  316  	struct config_rom_attribute *attr =
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  317  		container_of(dattr, struct config_rom_attribute, attr);
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  318  	const u32 *directories[] = {NULL, NULL};
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  319  	size_t bufsize;
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  320  	char dummy_buf[2];
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  321  	int i, ret;
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  322  
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  323  	down_read(&fw_device_rwsem);
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  324  
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  325  	if (is_fw_unit(dev)) {
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  326  		directories[0] = fw_unit(dev)->directory;
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  327  	} else {
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  328  		const u32 *root_directory = fw_device(dev)->config_rom + ROOT_DIR_OFFSET;
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  329  
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  330  		directories[0] = root_directory;
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  331  
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  332  		// Legacy layout of configuration ROM described in Annex 1 of 'Configuration ROM
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  333  		// for AV/C Devices 1.0 (December 12, 2000, 1394 Trading Association, TA Document
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  334  		// 1999027)'.
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  335  		directories[1] = search_directory(root_directory, CSR_VENDOR);
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  336  	}
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  337  
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  338  	if (buf) {
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  339  		bufsize = PAGE_SIZE - 1;
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  340  	} else {
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  341  		buf = dummy_buf;
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  342  		bufsize = 1;
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  343  	}
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  344  
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  345  	for (i = 0; i < ARRAY_SIZE(directories) && directories[i]; ++i)
4a70f38f54d1c0 drivers/firewire/core-device.c Takashi Sakamoto  2023-12-17  346  		ret = fw_csr_string(directories[i], attr->key, buf, bufsize);
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  347  
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24 @348  	if (ret >= 0) {
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  349  		/* Strip trailing whitespace and add newline. */
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  350  		while (ret > 0 && isspace(buf[ret - 1]))
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  351  			ret--;
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  352  		strcpy(buf + ret, "\n");
1f8fef7b3388b5 drivers/firewire/core-device.c Clemens Ladisch   2009-12-24  353  		ret++;
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  354  	}
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  355  
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  356  	up_read(&fw_device_rwsem);
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  357  
c9755e14a01987 drivers/firewire/fw-device.c   Stefan Richter    2008-03-24  358  	return ret;
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  359  }
7feb9cce2d07be drivers/firewire/fw-device.c   Kristian Høgsberg 2007-03-21  360  

:::::: The code at line 348 was first introduced by commit
:::::: 1f8fef7b3388b5a976e80839679b5bae581a1091 firewire: add fw_csr_string() helper function

:::::: TO: Clemens Ladisch <clemens@ladisch.de>
:::::: CC: Stefan Richter <stefanr@s5r6.in-berlin.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
