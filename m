Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD33769FF
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908180; cv=none; b=bXjDfhJlfkaBbWjtVwkw9JdP5jB/3yhsjcDch2ebnAFbcS/5V666ghC3iPTjt0JCIBAPZCWHnUBMz0IU+G8Jgi1JW/TtKptZsGB7aHUqONTW4j7kvw9EIwVugU2HF9CN9SpO7/R+2Ep7hUDiOnwLjCojK0sJlNb59D+iK8wEydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908180; c=relaxed/simple;
	bh=PFBuoYJ/6EiP3h2RK2X4JzwkNcMTHeXBX4e3ipbZ8UE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WdSlcINZDytlRQxG6BsY1JKtFe/VkxVI5cIzfLSymJ8Myi4IFXPOLDSimYLTKnr6hm76FpeU6wBX0RvAZOzEEGiQefe3wh8HuSCL+tPLxfazLvMf7D06wbKNWWcHmIrgXedXl5X5dCp2dlce2byB1MIUM4lXgFrilAdGEA4tgA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCyDOddn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCyDOddn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908178; x=1814444178;
  h=date:from:to:cc:subject:message-id;
  bh=PFBuoYJ/6EiP3h2RK2X4JzwkNcMTHeXBX4e3ipbZ8UE=;
  b=JCyDOddn9a5k6mG9ACFNZrxdLFGIQomHH0xxPsQziEquwzqh6CwbO4EV
   VuOTyV1au0ik/S2MiW432SATo6EtxkG4XeQJ3UC4eTyhO75bqPepMvKT6
   5Im/2APfzonQ3WqXDWCmpyHyCwC82/Sn4CGtKPbLXNTiLBFXJ6Mij/xL3
   dXVK9Pd78xDc5WNfJMyAbiCdcKvYU1R3eOqB4oVFZraQ4cPujfHpVct4U
   dq0PgWVdBlQvuf0kHkrome3Vgxa6Jig0E//UId5seSmiaRcdT6Mfnvvt3
   LbOWvBBS+O7FQx/UW+bNbPwIn0aMnKc7zlpebS0S0Zjuk5zyaSLppbHAg
   g==;
X-CSE-ConnectionGUID: oocsRRR0TNOKR9avJKQUpA==
X-CSE-MsgGUID: w+L+GxXbRPyrLdLY58jJfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="95141842"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="95141842"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:16:17 -0700
X-CSE-ConnectionGUID: OlKiK8BNQ3u7vtownK1jWQ==
X-CSE-MsgGUID: xiFNEvfLTouGHwWX8nnK5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="276856323"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 05:16:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wetqr-000000009G7-2qs2;
	Wed, 01 Jul 2026 12:15:44 +0000
Date: Wed, 01 Jul 2026 20:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 247/247]
 drivers/hid/hid-nintendo.c:314 joycon_request_calibration() warn: right
 shifting more than type allows 16 vs 16
Message-ID: <202607012043.xY5v2ab0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   4fddd1f27d67257cd7f6c443edaec03f0db3357f
commit: 0e93c0746ae205990bb9cfdc432484cad4a7d02c [247/247] FROMLIST: HID: nintendo: add nintendo switch controller driver
:::::: branch date: 20 hours ago
:::::: commit date: 6 years ago
config: x86_64-randconfig-161-20260701 (https://download.01.org/0day-ci/archive/20260701/202607012043.xY5v2ab0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607012043.xY5v2ab0-lkp@intel.com/

New smatch warnings:
drivers/hid/hid-nintendo.c:314 joycon_request_calibration() warn: right shifting more than type allows 16 vs 16

Old smatch warnings:
drivers/hid/hid-nintendo.c:315 joycon_request_calibration() warn: right shifting more than type allows 16 vs 24

vim +314 drivers/hid/hid-nintendo.c

0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  290  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  291  static const u16 DFLT_STICK_CAL_CEN = 2000;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  292  static const u16 DFLT_STICK_CAL_MAX = 3500;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  293  static const u16 DFLT_STICK_CAL_MIN = 500;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  294  static int joycon_request_calibration(struct joycon_ctlr *ctlr)
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  295  {
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  296  	struct joycon_subcmd_request *req;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  297  	u8 buffer[sizeof(*req) + 5] = { 0 };
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  298  	struct joycon_input_report *report;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  299  	struct joycon_stick_cal *cal_x;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  300  	struct joycon_stick_cal *cal_y;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  301  	s32 x_max_above;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  302  	s32 x_min_below;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  303  	s32 y_max_above;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  304  	s32 y_min_below;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  305  	u8 *data;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  306  	u8 *raw_cal;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  307  	int ret;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  308  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  309  	req = (struct joycon_subcmd_request *)buffer;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  310  	req->subcmd_id = JC_SUBCMD_SPI_FLASH_READ;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  311  	data = req->data;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  312  	data[0] = 0xFF & JC_CAL_DATA_START;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  313  	data[1] = 0xFF & (JC_CAL_DATA_START >> 8);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29 @314  	data[2] = 0xFF & (JC_CAL_DATA_START >> 16);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  315  	data[3] = 0xFF & (JC_CAL_DATA_START >> 24);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  316  	data[4] = JC_CAL_DATA_SIZE;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  317  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  318  	hid_dbg(ctlr->hdev, "requesting cal data\n");
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  319  	ret = joycon_send_subcmd(ctlr, req, 5);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  320  	if (ret) {
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  321  		hid_warn(ctlr->hdev,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  322  			 "Failed to read stick cal, using defaults; ret=%d\n",
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  323  			 ret);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  324  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  325  		ctlr->left_stick_cal_x.center = DFLT_STICK_CAL_CEN;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  326  		ctlr->left_stick_cal_x.max = DFLT_STICK_CAL_MAX;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  327  		ctlr->left_stick_cal_x.min = DFLT_STICK_CAL_MIN;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  328  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  329  		ctlr->left_stick_cal_y.center = DFLT_STICK_CAL_CEN;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  330  		ctlr->left_stick_cal_y.max = DFLT_STICK_CAL_MAX;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  331  		ctlr->left_stick_cal_y.min = DFLT_STICK_CAL_MIN;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  332  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  333  		ctlr->right_stick_cal_x.center = DFLT_STICK_CAL_CEN;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  334  		ctlr->right_stick_cal_x.max = DFLT_STICK_CAL_MAX;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  335  		ctlr->right_stick_cal_x.min = DFLT_STICK_CAL_MIN;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  336  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  337  		ctlr->right_stick_cal_y.center = DFLT_STICK_CAL_CEN;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  338  		ctlr->right_stick_cal_y.max = DFLT_STICK_CAL_MAX;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  339  		ctlr->right_stick_cal_y.min = DFLT_STICK_CAL_MIN;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  340  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  341  		return ret;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  342  	}
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  343  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  344  	report = (struct joycon_input_report *)ctlr->input_buf;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  345  	raw_cal = &report->reply.data[5];
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  346  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  347  	/* left stick calibration parsing */
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  348  	cal_x = &ctlr->left_stick_cal_x;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  349  	cal_y = &ctlr->left_stick_cal_y;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  350  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  351  	x_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  352  	y_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  353  	cal_x->center = hid_field_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  354  	cal_y->center = hid_field_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  355  	x_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  356  	y_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  357  	cal_x->max = cal_x->center + x_max_above;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  358  	cal_x->min = cal_x->center - x_min_below;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  359  	cal_y->max = cal_y->center + y_max_above;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  360  	cal_y->min = cal_y->center - y_min_below;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  361  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  362  	/* right stick calibration parsing */
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  363  	raw_cal += 9;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  364  	cal_x = &ctlr->right_stick_cal_x;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  365  	cal_y = &ctlr->right_stick_cal_y;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  366  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  367  	cal_x->center = hid_field_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  368  	cal_y->center = hid_field_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  369  	x_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  370  	y_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  371  	x_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  372  	y_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  373  	cal_x->max = cal_x->center + x_max_above;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  374  	cal_x->min = cal_x->center - x_min_below;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  375  	cal_y->max = cal_y->center + y_max_above;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  376  	cal_y->min = cal_y->center - y_min_below;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  377  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  378  	hid_dbg(ctlr->hdev, "calibration:\n"
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  379  			    "l_x_c=%d l_x_max=%d l_x_min=%d\n"
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  380  			    "l_y_c=%d l_y_max=%d l_y_min=%d\n"
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  381  			    "r_x_c=%d r_x_max=%d r_x_min=%d\n"
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  382  			    "r_y_c=%d r_y_max=%d r_y_min=%d\n",
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  383  			    ctlr->left_stick_cal_x.center,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  384  			    ctlr->left_stick_cal_x.max,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  385  			    ctlr->left_stick_cal_x.min,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  386  			    ctlr->left_stick_cal_y.center,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  387  			    ctlr->left_stick_cal_y.max,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  388  			    ctlr->left_stick_cal_y.min,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  389  			    ctlr->right_stick_cal_x.center,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  390  			    ctlr->right_stick_cal_x.max,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  391  			    ctlr->right_stick_cal_x.min,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  392  			    ctlr->right_stick_cal_y.center,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  393  			    ctlr->right_stick_cal_y.max,
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  394  			    ctlr->right_stick_cal_y.min);
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  395  
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  396  	return 0;
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  397  }
0e93c0746ae205 Daniel J. Ogorchock 2019-12-29  398  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
