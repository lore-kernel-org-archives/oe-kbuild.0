Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220502836F
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 03:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482890; cv=none; b=vBZrUhyI/x5D0AAkDL2VfBGDFgg2JXrZsqmjGGtjKH+qjI8rAL7j+v+12Y8kD4sdsMmgRzs+wnpruRmV6j8qRytQISbILdf5LjmtxDYzW374PXlius/C2x0YF4jrdBfKlarzz35fRCXEaSt8AHsQEH0VYCAbCUBoXHtwjZ2dxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482890; c=relaxed/simple;
	bh=Js3eGj5EExkRPY6F2W4I/UPL9FMWIM0T6xF0IloLTQ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q2d0Xiyl+kD4qwpsaJwqDFrJTcxD21FXSRxpbYlilO1YVmq749lAdSzPHj8OSkiBaAIdhfbavkvfKK2P1W+oDSM5N73T2Q0YPOhCtK7lUV9uIPw6vdsv8XbOY3/spq5MvMArzP8KNIyCZ8dEpYXvBZO2CPRMzib4+HR7V8j8Wlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dio1rhq5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dio1rhq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769482890; x=1801018890;
  h=date:from:to:cc:subject:message-id;
  bh=Js3eGj5EExkRPY6F2W4I/UPL9FMWIM0T6xF0IloLTQ8=;
  b=dio1rhq5fjslu4f/7DzvDis4sqTcjxcdWAb3yHFC0OydGiiwRWYYs+W4
   YLPhmT3Ky32FZkE6N24kZzgqBOu3IRyux0LXNxJ0tmxuvuWEJtipHWIa0
   oHZuRZzj2ZvmcNxgrWj9+wppnxclKobzFCW941nOYOzqn3qKd7lMvrzoe
   lC158L++c27XtcS2Rxu9drBq09X6uAEONlYepecatDM00wUPZVwWSL31X
   Go8OHk3ze1cy8BdBqkXQtSl16MLB9Brt+/7jedYqIoZF54EpxtFS0TNGi
   qgbMvGGCRRiWDTit7XTH+ajvVtVX5/jpX7OSfTZF551wcojD3NpzgrWU7
   A==;
X-CSE-ConnectionGUID: EXk7DylwQ/e99y2xKLlDGg==
X-CSE-MsgGUID: gilg2mNmRA6I8tXo/qtUaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70573655"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70573655"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 19:01:29 -0800
X-CSE-ConnectionGUID: IJdNTVhNR1KZolthfZcgyg==
X-CSE-MsgGUID: vRbYQNsKRKmNXi16x/Ig6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207080308"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jan 2026 19:01:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkZKW-00000000Xve-1jOY;
	Tue, 27 Jan 2026 03:01:24 +0000
Date: Tue, 27 Jan 2026 11:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.10 1/1]
 drivers/hid/hid-nintendo.c:314 joycon_request_calibration() warn: right
 shifting more than type allows 16 vs 16
Message-ID: <202601271035.okfgf3T1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   8b96c137bec0cc9c414f85dc958b9a5785a0790f
commit: 0e93c0746ae205990bb9cfdc432484cad4a7d02c [1/1] FROMLIST: HID: nintendo: add nintendo switch controller driver
:::::: branch date: 6 hours ago
:::::: commit date: 6 years ago
config: i386-randconfig-141-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271035.okfgf3T1-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601271035.okfgf3T1-lkp@intel.com/

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
