Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0B12033E
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Oct 2023 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcAQchuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697720528; x=1729256528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0MAv+2r5y8sc7IN+3x33/6HjN4QFsiq9vgua5ZT8HU=;
  b=ZcAQchuUStB6WMVF8BeKmlAbt1X6IMXmD9DpNWYEpy5P4yvJlnQ1DaIu
   Dp0L3aUzLeMcle8+6asb8MIPHNIF3FeUYRlQ+vRdxuZFrf6hO223yGeHn
   h4FTsXevVNplN61Ek7+OvMHzYxoRykIyenWApCkuqe1eJglWBGiaxEyW+
   5XDACsbG0+O0523c9Ee8aBHq/QWn7bwwNgHZA1HoVo1hTthTqbUCa1CNn
   6SlpBSgGkjva6W/5xkM7shiiFJXO1DkT12Pead7B6NFEDduGCTsKzfWuT
   77lYlP8ZChfG8Q9Svto7HYPmnfWyktQdfX4FxR5I3drwFKDd2OoxzEyEg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="371306129"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="371306129"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 06:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1088350663"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="1088350663"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2023 06:01:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtSeC-00027f-1x;
	Thu, 19 Oct 2023 13:01:08 +0000
Date: Thu, 19 Oct 2023 21:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:data-lifetime 4/17] include/linux/rw_hint.h:18:1:
 sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
Message-ID: <202310192024.QmhbPkFh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux data-lifetime
head:   86a23b31ddccc5e3112104254ece3fb68787eb3b
commit: 1dce268f682a380dcd4680f575f4a76c57b138c2 [4/17] fs: Move enum rw_hint into a new header file
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-061-20231019 (https://download.01.org/0day-ci/archive/20231019/202310192024.QmhbPkFh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192024.QmhbPkFh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310192024.QmhbPkFh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/i2c/cs3308.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ak881x.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/dw9807-vcm.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/adv7175.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/dw9768.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/adv7343.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/dw9719.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/bt856.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/adv7393.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/bt866.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/imx208.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/adp1653.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/hi847.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/imx214.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/video-i2c.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ds90ub913.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ds90ub953.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ds90ub960.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/max9271.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/m52790.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/imx319.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/imx296.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/imx290.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/imx258.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ml86v7667.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/imx415.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/imx412.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov01a10.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/imx274.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/mt9v111.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/mt9t112.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov13858.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/msp3400-driver.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov02a10.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/adv7604.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/mt9v011.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/msp3400-kthreads.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/mt9m111.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov13b10.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/isl7998x.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov2659.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov2640.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov08x40.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/max9286.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov2685.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov2680.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov4689.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/rdacm20.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov5647.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov5648.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/rdacm21.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov8858.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/sony-btf-mpx.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov5695.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov9640.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/tda9840.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov5693.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/tea6415c.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/tda7432.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov5675.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov6650.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/saa7185.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov7670.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/saa6588.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/s5k6a3.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov9734.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/tlv320aic23b.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov8865.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/rj54n1cb0c.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov8856.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ths7303.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/saa7127.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/st-mipid02.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ov5640.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/tvp514x.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/tvaudio.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/tc358746.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/uda1342.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/tw2804.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/vp27smpx.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/wm8739.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/tvp5150.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/vpx3220.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/adv748x/adv748x-hdmi.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/adv748x/adv748x-afe.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/adv748x/adv748x-csi2.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/adv748x/adv748x-core.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ccs/ccs-quirk.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ccs/ccs-data.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ccs/ccs-reg-access.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/ccs/ccs-core.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/cx25840/cx25840-audio.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/cx25840/cx25840-firmware.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/cx25840/cx25840-vbi.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/cx25840/cx25840-ir.c: note: in included file (through include/linux/fs.h, include/linux/huge_mm.h, include/linux/mm.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"
--
   drivers/media/i2c/cx25840/cx25840-core.c: note: in included file (through include/linux/fs.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
>> include/linux/rw_hint.h:18:1: sparse: sparse: static assertion failed: "sizeof(enum rw_hint) == 1"

vim +18 include/linux/rw_hint.h

1dce268f682a38 Bart Van Assche 2023-10-16  17  
1dce268f682a38 Bart Van Assche 2023-10-16 @18  static_assert(sizeof(enum rw_hint) == 1);
1dce268f682a38 Bart Van Assche 2023-10-16  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
