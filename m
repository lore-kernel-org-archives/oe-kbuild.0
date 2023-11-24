Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F751DDD9
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvKOv2q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700826447; x=1732362447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YWYgHP+QQbHD4M3ECkgTc1+Vy9KvRgkPaxEpSl7jypI=;
  b=dvKOv2q6TGHEyPndo5zjy8PEkgQPRX8WSKh6vtiPXzF4eCRzwwv6fGvH
   jYV1XZBy36oli6+85WXzZebbkoT3InpsIdLlzQd6D5ox6FUXf9xsPyA2R
   lIFkDpqGlPl8u9OkFQ1JbzcZ/sFtLtA2oa6rwhv+G1m/7o2WKTb5GicTQ
   UaEWZbESguiwA3vFGII7VGgZO6Ejb2s1YWDgi9By4QvMtrj5W/G3UgsFY
   hsQPug8pbO7tFHMIZ736vsr7G5zk4P5akRaxF2ldSiXuq3P6AVQBB822o
   FCQfrDR8uPOoikDh4Jt/XigpVbZhZLSGVWt5joI3jY0Bnj/E1Lo5bSeUS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395227069"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395227069"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:47:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771236029"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="771236029"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Nov 2023 03:47:25 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6UeZ-0002hw-0b;
	Fri, 24 Nov 2023 11:47:23 +0000
Date: Fri, 24 Nov 2023 19:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pinchartl:mtk/v6.7/thp7312/v7 4/4] drivers/media/i2c/thp7312.c:967
 thp7312_set_focus() error: uninitialized symbol 'new_state'.
Message-ID: <202311241349.sqcJU6Rv-lkp@intel.com>
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
TO: Paul Elder <paul.elder@ideasonboard.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.7/thp7312/v7
head:   362434bae3ce4547ea67e203cbbcb6211a619629
commit: 362434bae3ce4547ea67e203cbbcb6211a619629 [4/4] media: i2c: Add driver for THine THP7312
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: hexagon-randconfig-r081-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241349.sqcJU6Rv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241349.sqcJU6Rv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311241349.sqcJU6Rv-lkp@intel.com/

smatch warnings:
drivers/media/i2c/thp7312.c:967 thp7312_set_focus() error: uninitialized symbol 'new_state'.

vim +/new_state +967 drivers/media/i2c/thp7312.c

362434bae3ce45 Paul Elder 2023-06-20   907  
362434bae3ce45 Paul Elder 2023-06-20   908  static int thp7312_set_focus(struct thp7312_device *thp7312)
362434bae3ce45 Paul Elder 2023-06-20   909  {
362434bae3ce45 Paul Elder 2023-06-20   910  	enum thp7312_focus_state new_state;
362434bae3ce45 Paul Elder 2023-06-20   911  	bool continuous;
362434bae3ce45 Paul Elder 2023-06-20   912  	u8 af_control;
362434bae3ce45 Paul Elder 2023-06-20   913  	u8 af_setting;
362434bae3ce45 Paul Elder 2023-06-20   914  	int ret = 0;
362434bae3ce45 Paul Elder 2023-06-20   915  
362434bae3ce45 Paul Elder 2023-06-20   916  	/* Start by programming the manual focus position if it has changed. */
362434bae3ce45 Paul Elder 2023-06-20   917  	if (thp7312->focus_absolute->is_new) {
362434bae3ce45 Paul Elder 2023-06-20   918  		unsigned int value;
362434bae3ce45 Paul Elder 2023-06-20   919  
362434bae3ce45 Paul Elder 2023-06-20   920  		value = thp7312_focus_values[thp7312->focus_absolute->val];
362434bae3ce45 Paul Elder 2023-06-20   921  
362434bae3ce45 Paul Elder 2023-06-20   922  		ret = cci_write(thp7312->regmap,
362434bae3ce45 Paul Elder 2023-06-20   923  				THP7312_REG_MANUAL_FOCUS_POSITION, value, NULL);
362434bae3ce45 Paul Elder 2023-06-20   924  		if (ret)
362434bae3ce45 Paul Elder 2023-06-20   925  			return ret;
362434bae3ce45 Paul Elder 2023-06-20   926  	}
362434bae3ce45 Paul Elder 2023-06-20   927  
362434bae3ce45 Paul Elder 2023-06-20   928  	/* Calculate the new focus state. */
362434bae3ce45 Paul Elder 2023-06-20   929  	switch (thp7312->focus_state) {
362434bae3ce45 Paul Elder 2023-06-20   930  	case THP7312_FOCUS_STATE_MANUAL:
362434bae3ce45 Paul Elder 2023-06-20   931  	default:
362434bae3ce45 Paul Elder 2023-06-20   932  		if (thp7312->focus_auto->val)
362434bae3ce45 Paul Elder 2023-06-20   933  			new_state = THP7312_FOCUS_STATE_AUTO;
362434bae3ce45 Paul Elder 2023-06-20   934  		else if (thp7312->focus_start->is_new)
362434bae3ce45 Paul Elder 2023-06-20   935  			new_state = THP7312_FOCUS_STATE_ONESHOT;
362434bae3ce45 Paul Elder 2023-06-20   936  		break;
362434bae3ce45 Paul Elder 2023-06-20   937  
362434bae3ce45 Paul Elder 2023-06-20   938  	case THP7312_FOCUS_STATE_AUTO:
362434bae3ce45 Paul Elder 2023-06-20   939  		if (!thp7312->focus_auto->val)
362434bae3ce45 Paul Elder 2023-06-20   940  			new_state = THP7312_FOCUS_STATE_LOCKED;
362434bae3ce45 Paul Elder 2023-06-20   941  		break;
362434bae3ce45 Paul Elder 2023-06-20   942  
362434bae3ce45 Paul Elder 2023-06-20   943  	case THP7312_FOCUS_STATE_LOCKED:
362434bae3ce45 Paul Elder 2023-06-20   944  		if (thp7312->focus_auto->val)
362434bae3ce45 Paul Elder 2023-06-20   945  			new_state = THP7312_FOCUS_STATE_AUTO;
362434bae3ce45 Paul Elder 2023-06-20   946  		else if (thp7312->focus_start->is_new)
362434bae3ce45 Paul Elder 2023-06-20   947  			new_state = THP7312_FOCUS_STATE_ONESHOT;
362434bae3ce45 Paul Elder 2023-06-20   948  		else if (thp7312->focus_absolute->is_new)
362434bae3ce45 Paul Elder 2023-06-20   949  			new_state = THP7312_FOCUS_STATE_MANUAL;
362434bae3ce45 Paul Elder 2023-06-20   950  		break;
362434bae3ce45 Paul Elder 2023-06-20   951  
362434bae3ce45 Paul Elder 2023-06-20   952  	case THP7312_FOCUS_STATE_ONESHOT:
362434bae3ce45 Paul Elder 2023-06-20   953  		if (thp7312->focus_auto->val)
362434bae3ce45 Paul Elder 2023-06-20   954  			new_state = THP7312_FOCUS_STATE_AUTO;
362434bae3ce45 Paul Elder 2023-06-20   955  		else if (thp7312->focus_start->is_new)
362434bae3ce45 Paul Elder 2023-06-20   956  			new_state = THP7312_FOCUS_STATE_ONESHOT;
362434bae3ce45 Paul Elder 2023-06-20   957  		else if (thp7312->focus_absolute->is_new)
362434bae3ce45 Paul Elder 2023-06-20   958  			new_state = THP7312_FOCUS_STATE_MANUAL;
362434bae3ce45 Paul Elder 2023-06-20   959  		break;
362434bae3ce45 Paul Elder 2023-06-20   960  	}
362434bae3ce45 Paul Elder 2023-06-20   961  
362434bae3ce45 Paul Elder 2023-06-20   962  	/*
362434bae3ce45 Paul Elder 2023-06-20   963  	 * If neither the state nor the focus method has changed, and no new
362434bae3ce45 Paul Elder 2023-06-20   964  	 * one-shot focus is requested, there's nothing new to program to the
362434bae3ce45 Paul Elder 2023-06-20   965  	 * hardware.
362434bae3ce45 Paul Elder 2023-06-20   966  	 */
362434bae3ce45 Paul Elder 2023-06-20  @967  	if (thp7312->focus_state == new_state &&
362434bae3ce45 Paul Elder 2023-06-20   968  	    !thp7312->focus_method->is_new && !thp7312->focus_start->is_new)
362434bae3ce45 Paul Elder 2023-06-20   969  		return 0;
362434bae3ce45 Paul Elder 2023-06-20   970  
362434bae3ce45 Paul Elder 2023-06-20   971  	continuous = new_state == THP7312_FOCUS_STATE_MANUAL ||
362434bae3ce45 Paul Elder 2023-06-20   972  		     new_state == THP7312_FOCUS_STATE_ONESHOT;
362434bae3ce45 Paul Elder 2023-06-20   973  
362434bae3ce45 Paul Elder 2023-06-20   974  	switch (thp7312->focus_method->val) {
362434bae3ce45 Paul Elder 2023-06-20   975  	case THP7312_FOCUS_METHOD_CONTRAST:
362434bae3ce45 Paul Elder 2023-06-20   976  	default:
362434bae3ce45 Paul Elder 2023-06-20   977  		af_setting = continuous
362434bae3ce45 Paul Elder 2023-06-20   978  			   ? THP7312_REG_AF_SETTING_CONTINUOUS_CONTRAST
362434bae3ce45 Paul Elder 2023-06-20   979  			   : THP7312_REG_AF_SETTING_ONESHOT_CONTRAST;
362434bae3ce45 Paul Elder 2023-06-20   980  		break;
362434bae3ce45 Paul Elder 2023-06-20   981  	case THP7312_FOCUS_METHOD_PDAF:
362434bae3ce45 Paul Elder 2023-06-20   982  		af_setting = continuous
362434bae3ce45 Paul Elder 2023-06-20   983  			   ? THP7312_REG_AF_SETTING_CONTINUOUS_PDAF
362434bae3ce45 Paul Elder 2023-06-20   984  			   : THP7312_REG_AF_SETTING_ONESHOT_PDAF;
362434bae3ce45 Paul Elder 2023-06-20   985  		break;
362434bae3ce45 Paul Elder 2023-06-20   986  	case THP7312_FOCUS_METHOD_HYBRID:
362434bae3ce45 Paul Elder 2023-06-20   987  		af_setting = continuous
362434bae3ce45 Paul Elder 2023-06-20   988  			   ? THP7312_REG_AF_SETTING_CONTINUOUS_HYBRID
362434bae3ce45 Paul Elder 2023-06-20   989  			   : THP7312_REG_AF_SETTING_ONESHOT_HYBRID;
362434bae3ce45 Paul Elder 2023-06-20   990  		break;
362434bae3ce45 Paul Elder 2023-06-20   991  	}
362434bae3ce45 Paul Elder 2023-06-20   992  
362434bae3ce45 Paul Elder 2023-06-20   993  	switch (new_state) {
362434bae3ce45 Paul Elder 2023-06-20   994  	case THP7312_FOCUS_STATE_MANUAL:
362434bae3ce45 Paul Elder 2023-06-20   995  	default:
362434bae3ce45 Paul Elder 2023-06-20   996  		af_control = THP7312_REG_AF_CONTROL_MANUAL;
362434bae3ce45 Paul Elder 2023-06-20   997  		break;
362434bae3ce45 Paul Elder 2023-06-20   998  	case THP7312_FOCUS_STATE_AUTO:
362434bae3ce45 Paul Elder 2023-06-20   999  	case THP7312_FOCUS_STATE_ONESHOT:
362434bae3ce45 Paul Elder 2023-06-20  1000  		af_control = THP7312_REG_AF_CONTROL_AF;
362434bae3ce45 Paul Elder 2023-06-20  1001  		break;
362434bae3ce45 Paul Elder 2023-06-20  1002  	case THP7312_FOCUS_STATE_LOCKED:
362434bae3ce45 Paul Elder 2023-06-20  1003  		af_control = THP7312_REG_AF_CONTROL_LOCK;
362434bae3ce45 Paul Elder 2023-06-20  1004  		break;
362434bae3ce45 Paul Elder 2023-06-20  1005  	}
362434bae3ce45 Paul Elder 2023-06-20  1006  
362434bae3ce45 Paul Elder 2023-06-20  1007  	cci_write(thp7312->regmap, THP7312_REG_AF_SETTING, af_setting, &ret);
362434bae3ce45 Paul Elder 2023-06-20  1008  
362434bae3ce45 Paul Elder 2023-06-20  1009  	if (new_state == THP7312_FOCUS_STATE_MANUAL &&
362434bae3ce45 Paul Elder 2023-06-20  1010  	    (thp7312->focus_state == THP7312_FOCUS_STATE_AUTO ||
362434bae3ce45 Paul Elder 2023-06-20  1011  	     thp7312->focus_state == THP7312_FOCUS_STATE_ONESHOT)) {
362434bae3ce45 Paul Elder 2023-06-20  1012  		/* When switching to manual state, lock AF first. */
362434bae3ce45 Paul Elder 2023-06-20  1013  		cci_write(thp7312->regmap, THP7312_REG_AF_CONTROL,
362434bae3ce45 Paul Elder 2023-06-20  1014  			  THP7312_REG_AF_CONTROL_LOCK, &ret);
362434bae3ce45 Paul Elder 2023-06-20  1015  	}
362434bae3ce45 Paul Elder 2023-06-20  1016  
362434bae3ce45 Paul Elder 2023-06-20  1017  	cci_write(thp7312->regmap, THP7312_REG_AF_CONTROL, af_control, &ret);
362434bae3ce45 Paul Elder 2023-06-20  1018  
362434bae3ce45 Paul Elder 2023-06-20  1019  	if (ret)
362434bae3ce45 Paul Elder 2023-06-20  1020  		return ret;
362434bae3ce45 Paul Elder 2023-06-20  1021  
362434bae3ce45 Paul Elder 2023-06-20  1022  	thp7312->focus_state = new_state;
362434bae3ce45 Paul Elder 2023-06-20  1023  
362434bae3ce45 Paul Elder 2023-06-20  1024  	return 0;
362434bae3ce45 Paul Elder 2023-06-20  1025  }
362434bae3ce45 Paul Elder 2023-06-20  1026  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
