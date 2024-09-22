Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071156F2EB
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727038214; cv=none; b=L6+C5sAlUkhf+Bl0m6GayhSyu9tRit9Dui4QRZDzx5mDH7hAQDp5TMadUaJcjt+hdi3q0afGK3wUM3AWQ0UOkq0bDqQMEYBtUZ1JVWR5QdG9XgGi8goCr4OEPJGTU/EPOQj3OZk+Df2NkzI9eCEpaB6bhZBZIghzJUwhRQdOVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727038214; c=relaxed/simple;
	bh=jCu9T4cCXbj93xsuyjzKFp5OdzExGxgvOB3p2LownKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgGVU5i6NCrLVKIQF6420cOdENfI7oEV/EGFrxQyW3WcZkZwQafxthKjcBUPvEE2AEO/5MJ/Z39tTLPgB2pIUM/aAoFFz1yJSarqUevaiKaS7QzXCgppmL6p0dducu/FJnCCqAwAhF/CMOdrgs0jhfWkxIzIcWk2NRyzBYLr+hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpfXP3WG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpfXP3WG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727038213; x=1758574213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCu9T4cCXbj93xsuyjzKFp5OdzExGxgvOB3p2LownKg=;
  b=UpfXP3WG9u31+v0ehg/qHNprqPQou9fCz2ZS0c5Oitt+9vPtFvYeqyTK
   SAmTSy2WGgvrDVteeuyIrnMAbmWz+mMQ0ji6+24tnPOoxH2DwGsyRRjS8
   Li1XnvexHsM00ZwvAHHeHme78vcnZyJEFV5J4PeqImVEaJAHYzriTdHB8
   1SCGAVj1HUkbu8peoc/DjxxArd47J3yaeuvOjwINJyWlrs4Dyavie1HrJ
   KdDeJInHv28KEGdZ7MtmAsaKoiI/PtluLMJL5Mb7dj0I+xJ8XJopwNDyh
   Kl2H4dy5+Sz7CHQZnLiK4myVVzESjwnG0eCsU2vr46Stx80/0PECO3pkr
   g==;
X-CSE-ConnectionGUID: NQRxlBYZQYGnl+taX2mnmg==
X-CSE-MsgGUID: iqE9Uqf9TAmOVmYQx6ZQ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25855671"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25855671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 13:50:12 -0700
X-CSE-ConnectionGUID: 8wElKsDZQN+cL1D6kkMZzQ==
X-CSE-MsgGUID: PBppidTdT7aIOlEvLRGDEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70868637"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Sep 2024 13:50:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssTWx-000Geo-2Q;
	Sun, 22 Sep 2024 20:50:07 +0000
Date: Mon, 23 Sep 2024 04:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:4.19/android_s 10802/30000]
 drivers/hid/hid-nintendo.c:314 joycon_request_calibration() warn: right
 shifting more than type allows 16 vs 16
Message-ID: <202409230456.21YcUefv-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 8b094ebb4fc40c3381be4c495eea161add5d105b [10802/30000] FROMLIST: HID: nintendo: add nintendo switch controller driver
:::::: branch date: 3 weeks ago
:::::: commit date: 4 years, 7 months ago
config: i386-randconfig-141-20240913 (https://download.01.org/0day-ci/archive/20240923/202409230456.21YcUefv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230456.21YcUefv-lkp@intel.com/

New smatch warnings:
drivers/hid/hid-nintendo.c:314 joycon_request_calibration() warn: right shifting more than type allows 16 vs 16

Old smatch warnings:
drivers/hid/hid-nintendo.c:315 joycon_request_calibration() warn: right shifting more than type allows 16 vs 24

vim +314 drivers/hid/hid-nintendo.c

8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  290  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  291  static const u16 DFLT_STICK_CAL_CEN = 2000;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  292  static const u16 DFLT_STICK_CAL_MAX = 3500;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  293  static const u16 DFLT_STICK_CAL_MIN = 500;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  294  static int joycon_request_calibration(struct joycon_ctlr *ctlr)
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  295  {
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  296  	struct joycon_subcmd_request *req;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  297  	u8 buffer[sizeof(*req) + 5] = { 0 };
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  298  	struct joycon_input_report *report;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  299  	struct joycon_stick_cal *cal_x;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  300  	struct joycon_stick_cal *cal_y;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  301  	s32 x_max_above;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  302  	s32 x_min_below;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  303  	s32 y_max_above;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  304  	s32 y_min_below;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  305  	u8 *data;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  306  	u8 *raw_cal;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  307  	int ret;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  308  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  309  	req = (struct joycon_subcmd_request *)buffer;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  310  	req->subcmd_id = JC_SUBCMD_SPI_FLASH_READ;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  311  	data = req->data;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  312  	data[0] = 0xFF & JC_CAL_DATA_START;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  313  	data[1] = 0xFF & (JC_CAL_DATA_START >> 8);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29 @314  	data[2] = 0xFF & (JC_CAL_DATA_START >> 16);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  315  	data[3] = 0xFF & (JC_CAL_DATA_START >> 24);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  316  	data[4] = JC_CAL_DATA_SIZE;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  317  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  318  	hid_dbg(ctlr->hdev, "requesting cal data\n");
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  319  	ret = joycon_send_subcmd(ctlr, req, 5);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  320  	if (ret) {
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  321  		hid_warn(ctlr->hdev,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  322  			 "Failed to read stick cal, using defaults; ret=%d\n",
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  323  			 ret);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  324  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  325  		ctlr->left_stick_cal_x.center = DFLT_STICK_CAL_CEN;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  326  		ctlr->left_stick_cal_x.max = DFLT_STICK_CAL_MAX;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  327  		ctlr->left_stick_cal_x.min = DFLT_STICK_CAL_MIN;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  328  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  329  		ctlr->left_stick_cal_y.center = DFLT_STICK_CAL_CEN;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  330  		ctlr->left_stick_cal_y.max = DFLT_STICK_CAL_MAX;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  331  		ctlr->left_stick_cal_y.min = DFLT_STICK_CAL_MIN;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  332  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  333  		ctlr->right_stick_cal_x.center = DFLT_STICK_CAL_CEN;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  334  		ctlr->right_stick_cal_x.max = DFLT_STICK_CAL_MAX;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  335  		ctlr->right_stick_cal_x.min = DFLT_STICK_CAL_MIN;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  336  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  337  		ctlr->right_stick_cal_y.center = DFLT_STICK_CAL_CEN;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  338  		ctlr->right_stick_cal_y.max = DFLT_STICK_CAL_MAX;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  339  		ctlr->right_stick_cal_y.min = DFLT_STICK_CAL_MIN;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  340  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  341  		return ret;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  342  	}
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  343  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  344  	report = (struct joycon_input_report *)ctlr->input_buf;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  345  	raw_cal = &report->reply.data[5];
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  346  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  347  	/* left stick calibration parsing */
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  348  	cal_x = &ctlr->left_stick_cal_x;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  349  	cal_y = &ctlr->left_stick_cal_y;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  350  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  351  	x_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  352  	y_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  353  	cal_x->center = hid_field_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  354  	cal_y->center = hid_field_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  355  	x_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  356  	y_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  357  	cal_x->max = cal_x->center + x_max_above;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  358  	cal_x->min = cal_x->center - x_min_below;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  359  	cal_y->max = cal_y->center + y_max_above;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  360  	cal_y->min = cal_y->center - y_min_below;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  361  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  362  	/* right stick calibration parsing */
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  363  	raw_cal += 9;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  364  	cal_x = &ctlr->right_stick_cal_x;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  365  	cal_y = &ctlr->right_stick_cal_y;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  366  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  367  	cal_x->center = hid_field_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  368  	cal_y->center = hid_field_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  369  	x_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  370  	y_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  371  	x_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  372  	y_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  373  	cal_x->max = cal_x->center + x_max_above;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  374  	cal_x->min = cal_x->center - x_min_below;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  375  	cal_y->max = cal_y->center + y_max_above;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  376  	cal_y->min = cal_y->center - y_min_below;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  377  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  378  	hid_dbg(ctlr->hdev, "calibration:\n"
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  379  			    "l_x_c=%d l_x_max=%d l_x_min=%d\n"
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  380  			    "l_y_c=%d l_y_max=%d l_y_min=%d\n"
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  381  			    "r_x_c=%d r_x_max=%d r_x_min=%d\n"
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  382  			    "r_y_c=%d r_y_max=%d r_y_min=%d\n",
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  383  			    ctlr->left_stick_cal_x.center,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  384  			    ctlr->left_stick_cal_x.max,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  385  			    ctlr->left_stick_cal_x.min,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  386  			    ctlr->left_stick_cal_y.center,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  387  			    ctlr->left_stick_cal_y.max,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  388  			    ctlr->left_stick_cal_y.min,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  389  			    ctlr->right_stick_cal_x.center,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  390  			    ctlr->right_stick_cal_x.max,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  391  			    ctlr->right_stick_cal_x.min,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  392  			    ctlr->right_stick_cal_y.center,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  393  			    ctlr->right_stick_cal_y.max,
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  394  			    ctlr->right_stick_cal_y.min);
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  395  
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  396  	return 0;
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  397  }
8b094ebb4fc40c Daniel J. Ogorchock 2019-12-29  398  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
