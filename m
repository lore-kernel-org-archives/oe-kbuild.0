Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3A51FC0FC
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Jul 2025 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752448837; cv=none; b=pLKCaxynWHqdsMmmqoO+u4suNYh7DLUfSWt2h8joVDvzRlOdn/Q8UvrGGJdX7SardofQT7/XiOH+0gqU16v7k3EIlnxkq0HZLxbHFUA17/paLybDOfkWJIwmiDL/wZ42RaXsEHMqiT6Q5brxtw74ZuNAZDIuL0vJwIB2Jzaeies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752448837; c=relaxed/simple;
	bh=+lIDkuGwrGOjxhIUP+njVR69/R8bUyIFGanzpwxwovY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G1CrpD9MYQRB2b1LJpaPLDkG+aJGeKUh1ajtdgDkujVpDuK/t1yGO/UN18lfYPMKsnv/UUuFdacf8DEE4tgQlJ6jqVbivrzn5/yX7a7mmfZHWow7MA72MbajvgmZDA3Xq8Fvd8k98E+Ee7UeBU3PEaBguSW6sJK8A6yKSdEjtIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfrCA44K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfrCA44K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752448835; x=1783984835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lIDkuGwrGOjxhIUP+njVR69/R8bUyIFGanzpwxwovY=;
  b=UfrCA44KhpLmOq+/Yt73Zec7UBmHpXf3S+c1F/UweFlQcrIUC8kKlkNL
   vqgsxv6VMXK+O1ZUSBSz69vefrVpnGNj/lWS+jR2vsk4NZnSZo7b6/edu
   6rmDg5/Q1F7+YikbmhKNJK1X07gejf7BbN5hq7dh3hdwu10Np3pTWu8pM
   C4TRhs5am3lWjzlJ5ZVaZFstYCW4zchQXN8TBLu6aHRlTBMtOpZzDF4bg
   BH3rFstQzDs/QMMFkXjx+BivmbX5UzrFatsH8rJqHltW1ADbc2Tp+D3zA
   AG2BkWmX1QmrRHNqXVU7goxGWDn+ILAX2bxrQ4Zzprq5rkbUESX7RHK4v
   Q==;
X-CSE-ConnectionGUID: WmzCr4UCTq+G+AgOu6U/Ag==
X-CSE-MsgGUID: Bd5fHfFrQQCSa9Hi2dciAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72088586"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="72088586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 16:20:33 -0700
X-CSE-ConnectionGUID: E3xHE/YyRdytIhQBKKqMyw==
X-CSE-MsgGUID: rsrMeOPZRbKqP33kcHJhdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161342605"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jul 2025 16:20:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub5zh-0008LD-1o;
	Sun, 13 Jul 2025 23:20:29 +0000
Date: Mon, 14 Jul 2025 07:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 1/2] media: mt9m114: Allow set_selection while
 streaming
Message-ID: <202507140702.0iwcjn1a-lkp@intel.com>
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
In-Reply-To: <20250710151340.496218-2-mathis.foerst@mt.com>
References: <20250710151340.496218-2-mathis.foerst@mt.com>
TO: Mathis Foerst <mathis.foerst@mt.com>
TO: linux-kernel@vger.kernel.org
CC: Mathis Foerst <mathis.foerst@mt.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: manuel.traut@mt.com
CC: mathis.foerst@zuehlke.com

Hi Mathis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a8598c7de1bcd94461ca54c972efa9b4ea501fb9]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathis-Foerst/media-mt9m114-Allow-set_selection-while-streaming/20250710-231657
base:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
patch link:    https://lore.kernel.org/r/20250710151340.496218-2-mathis.foerst%40mt.com
patch subject: [PATCH v7 1/2] media: mt9m114: Allow set_selection while streaming
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250713 (https://download.01.org/0day-ci/archive/20250714/202507140702.0iwcjn1a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507140702.0iwcjn1a-lkp@intel.com/

smatch warnings:
drivers/media/i2c/mt9m114.c:1334 mt9m114_pa_set_selection() warn: curly braces intended?
drivers/media/i2c/mt9m114.c:1339 mt9m114_pa_set_selection() warn: inconsistent indenting

vim +1334 drivers/media/i2c/mt9m114.c

24d756e914fc34 Laurent Pinchart 2023-09-20  1282  
24d756e914fc34 Laurent Pinchart 2023-09-20  1283  static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
24d756e914fc34 Laurent Pinchart 2023-09-20  1284  				    struct v4l2_subdev_state *state,
24d756e914fc34 Laurent Pinchart 2023-09-20  1285  				    struct v4l2_subdev_selection *sel)
24d756e914fc34 Laurent Pinchart 2023-09-20  1286  {
24d756e914fc34 Laurent Pinchart 2023-09-20  1287  	struct mt9m114 *sensor = pa_to_mt9m114(sd);
24d756e914fc34 Laurent Pinchart 2023-09-20  1288  	struct v4l2_mbus_framefmt *format;
24d756e914fc34 Laurent Pinchart 2023-09-20  1289  	struct v4l2_rect *crop;
979c26f67a0dab Mathis Foerst    2025-07-10  1290  	int ret = 0;
24d756e914fc34 Laurent Pinchart 2023-09-20  1291  
24d756e914fc34 Laurent Pinchart 2023-09-20  1292  	if (sel->target != V4L2_SEL_TGT_CROP)
24d756e914fc34 Laurent Pinchart 2023-09-20  1293  		return -EINVAL;
24d756e914fc34 Laurent Pinchart 2023-09-20  1294  
bc0e8d91feec72 Sakari Ailus     2023-10-13  1295  	crop = v4l2_subdev_state_get_crop(state, sel->pad);
bc0e8d91feec72 Sakari Ailus     2023-10-13  1296  	format = v4l2_subdev_state_get_format(state, sel->pad);
24d756e914fc34 Laurent Pinchart 2023-09-20  1297  
24d756e914fc34 Laurent Pinchart 2023-09-20  1298  	/*
24d756e914fc34 Laurent Pinchart 2023-09-20  1299  	 * Clamp the crop rectangle. The vertical coordinates must be even, and
24d756e914fc34 Laurent Pinchart 2023-09-20  1300  	 * the horizontal coordinates must be a multiple of 4.
24d756e914fc34 Laurent Pinchart 2023-09-20  1301  	 *
24d756e914fc34 Laurent Pinchart 2023-09-20  1302  	 * FIXME: The horizontal coordinates must be a multiple of 8 when
24d756e914fc34 Laurent Pinchart 2023-09-20  1303  	 * binning, but binning is configured after setting the selection, so
24d756e914fc34 Laurent Pinchart 2023-09-20  1304  	 * we can't know tell here if it will be used.
24d756e914fc34 Laurent Pinchart 2023-09-20  1305  	 */
979c26f67a0dab Mathis Foerst    2025-07-10  1306  	sel->r.left = ALIGN(sel->r.left, 4);
979c26f67a0dab Mathis Foerst    2025-07-10  1307  	sel->r.top = ALIGN(sel->r.top, 2);
979c26f67a0dab Mathis Foerst    2025-07-10  1308  	sel->r.width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
24d756e914fc34 Laurent Pinchart 2023-09-20  1309  			       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
979c26f67a0dab Mathis Foerst    2025-07-10  1310  			       MT9M114_PIXEL_ARRAY_WIDTH - sel->r.left);
979c26f67a0dab Mathis Foerst    2025-07-10  1311  	sel->r.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
24d756e914fc34 Laurent Pinchart 2023-09-20  1312  				MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
979c26f67a0dab Mathis Foerst    2025-07-10  1313  				MT9M114_PIXEL_ARRAY_HEIGHT - sel->r.top);
979c26f67a0dab Mathis Foerst    2025-07-10  1314  
979c26f67a0dab Mathis Foerst    2025-07-10  1315  	/* Changing the selection size is not allowed in streaming state */
979c26f67a0dab Mathis Foerst    2025-07-10  1316  	if (sensor->streaming &&
979c26f67a0dab Mathis Foerst    2025-07-10  1317  	    (sel->r.height != crop->height || sel->r.width != crop->width))
979c26f67a0dab Mathis Foerst    2025-07-10  1318  		return -EBUSY;
24d756e914fc34 Laurent Pinchart 2023-09-20  1319  
979c26f67a0dab Mathis Foerst    2025-07-10  1320  	*crop = sel->r;
24d756e914fc34 Laurent Pinchart 2023-09-20  1321  
24d756e914fc34 Laurent Pinchart 2023-09-20  1322  	/* Reset the format. */
24d756e914fc34 Laurent Pinchart 2023-09-20  1323  	format->width = crop->width;
24d756e914fc34 Laurent Pinchart 2023-09-20  1324  	format->height = crop->height;
24d756e914fc34 Laurent Pinchart 2023-09-20  1325  
979c26f67a0dab Mathis Foerst    2025-07-10  1326  	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
979c26f67a0dab Mathis Foerst    2025-07-10  1327  		return ret;
979c26f67a0dab Mathis Foerst    2025-07-10  1328  
24d756e914fc34 Laurent Pinchart 2023-09-20  1329  	mt9m114_pa_ctrl_update_blanking(sensor, format);
24d756e914fc34 Laurent Pinchart 2023-09-20  1330  
979c26f67a0dab Mathis Foerst    2025-07-10  1331  	/* Apply values immediately if streaming */
979c26f67a0dab Mathis Foerst    2025-07-10  1332  	if (sensor->streaming)
979c26f67a0dab Mathis Foerst    2025-07-10  1333  		ret = mt9m114_configure_pa(sensor, state);
979c26f67a0dab Mathis Foerst    2025-07-10 @1334  		if (ret)
979c26f67a0dab Mathis Foerst    2025-07-10  1335  			return ret;
979c26f67a0dab Mathis Foerst    2025-07-10  1336  		/* Changing the cropping config requires a CONFIG_CHANGE */
979c26f67a0dab Mathis Foerst    2025-07-10  1337  		ret = mt9m114_set_state(sensor,
979c26f67a0dab Mathis Foerst    2025-07-10  1338  					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
979c26f67a0dab Mathis Foerst    2025-07-10 @1339  	return ret;
24d756e914fc34 Laurent Pinchart 2023-09-20  1340  }
24d756e914fc34 Laurent Pinchart 2023-09-20  1341  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
