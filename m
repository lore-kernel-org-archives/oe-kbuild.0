Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00D636A034
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768334325; cv=none; b=bsIkf/vdHZdl5chWVaNmZEVwDylup4VQpcHL/XV1TNIcwhtr376LYmAWdgTBDg6gQWL63nCLMMWMpFMNDCxuUHCNpVToTzIHeZrlToabHkj3U1aqEH+96LUvOCIQoH3CDfYL0NbSs/q/0EIUv9YRcGbFWUEzP0HJh95VQm6vBjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768334325; c=relaxed/simple;
	bh=BU1XurOwEcgv+fwpG1nj8urxAQv3KTr2stWHEaliwfM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Llb9VtgXd4uL7wBIl5JyIuBYavgRYcWl6K+ins3zFukI1LFaV0QZBd4eEqiCvoze0gVPjcy9P6wEbTqpqT2yaHSuqs/aHv50QLN5BIDMB1ltefJOvg/jc2urz5PBqSfmEf0xXp12BhHzf1wq7m0OAdibrgL0e/DGjcZjHTZOpec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JA9zWSfI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JA9zWSfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768334323; x=1799870323;
  h=date:from:to:cc:subject:message-id;
  bh=BU1XurOwEcgv+fwpG1nj8urxAQv3KTr2stWHEaliwfM=;
  b=JA9zWSfI/YzB6vvAURuL8EQlvM/7dhjv+mv/56Vx4p9TBPPqamzrBsA9
   cRGOXIva1qKz6Y860ky2iytj10qMmdEDkvdAh4YVU8Lgj0aGxqw1w0eTK
   Qa9X81ASkq2vjsuRIOW4XK5Ge2WM2h7nKvLbntSkliC+yEyWqc1+8qMGA
   2ifnm7pCLSrg/g1gnUbhvJrfM+VnYFJG6tCbi6B7d6d22EPOU7WqlGAVa
   xwVsMXPA4dVU7wF0udnk6a3I6JUhhCkqOXHKnj+oKLioGwIleCjALsXSM
   cr8uYI0J5c+AyN8BAHZLFp9/V6vylFtZE8sd2UNjXOSvZ/VB3Rrb9OPZX
   Q==;
X-CSE-ConnectionGUID: xvmRoOzLTZKmejaLxcY9Dw==
X-CSE-MsgGUID: qwjQRzGrQlOFOb7T8jUexw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95103715"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95103715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:58:42 -0800
X-CSE-ConnectionGUID: +hC+KSIcRgKhtX8SXrD8kQ==
X-CSE-MsgGUID: 5srWpndMSx6dO5ZwQN2DPg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 11:58:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfkXH-00000000FJH-0jSo;
	Tue, 13 Jan 2026 19:58:39 +0000
Date: Wed, 14 Jan 2026 03:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:timers/vdso 12/14]
 drivers/iio/magnetometer/yamaha-yas530.c:1099 yas537_get_calibration_data()
 warn: ' - 256' 4294967040 can't fit into 32767 'c->Cx'
Message-ID: <202601140300.QidOVeEu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Ian Rogers <irogers@google.com>
CC: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   576d8a7a985dde4f51a4561dddc0d8734494d3de
commit: e04a494143bab7ea804fe1ebe286701ee8288e4a [12/14] vdso: Switch get/put_unaligned() from packed struct to memcpy()
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: parisc-randconfig-r071-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140300.QidOVeEu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601140300.QidOVeEu-lkp@intel.com/

smatch warnings:
drivers/iio/magnetometer/yamaha-yas530.c:1099 yas537_get_calibration_data() warn: ' - 256' 4294967040 can't fit into 32767 'c->Cx'
drivers/iio/magnetometer/yamaha-yas530.c:1100 yas537_get_calibration_data() warn: ' - 256' 4294967040 can't fit into 32767 'c->Cy1'
drivers/iio/magnetometer/yamaha-yas530.c:1102 yas537_get_calibration_data() warn: ' - 64' 4294967232 can't fit into 127 'c->a2'
drivers/iio/magnetometer/yamaha-yas530.c:1103 yas537_get_calibration_data() warn: ' - 64' 4294967232 can't fit into 127 'c->a3'
drivers/iio/magnetometer/yamaha-yas530.c:1105 yas537_get_calibration_data() warn: ' - 112' 4294967184 can't fit into 32767 'c->a5'
drivers/iio/magnetometer/yamaha-yas530.c:1106 yas537_get_calibration_data() warn: ' - 64' 4294967232 can't fit into 127 'c->a6'
drivers/iio/magnetometer/yamaha-yas530.c:1108 yas537_get_calibration_data() warn: ' - 64' 4294967232 can't fit into 127 'c->a8'
drivers/iio/magnetometer/yamaha-yas530.c:1109 yas537_get_calibration_data() warn: ' - 112' 4294967184 can't fit into 32767 'c->a9'

vim +1099 drivers/iio/magnetometer/yamaha-yas530.c

de8860b1ed4701 Linus Walleij 2020-12-24   923  
65f79b50103067 Jakob Hauser  2022-08-13   924  static int yas537_get_calibration_data(struct yas5xx *yas5xx)
65f79b50103067 Jakob Hauser  2022-08-13   925  {
65f79b50103067 Jakob Hauser  2022-08-13   926  	struct yas5xx_calibration *c = &yas5xx->calibration;
65f79b50103067 Jakob Hauser  2022-08-13   927  	u8 data[17];
65f79b50103067 Jakob Hauser  2022-08-13   928  	u32 val1, val2, val3, val4;
65f79b50103067 Jakob Hauser  2022-08-13   929  	int i, ret;
65f79b50103067 Jakob Hauser  2022-08-13   930  
65f79b50103067 Jakob Hauser  2022-08-13   931  	/* Writing SRST register */
65f79b50103067 Jakob Hauser  2022-08-13   932  	ret = regmap_write(yas5xx->map, YAS537_SRST, BIT(1));
65f79b50103067 Jakob Hauser  2022-08-13   933  	if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   934  		return ret;
65f79b50103067 Jakob Hauser  2022-08-13   935  
65f79b50103067 Jakob Hauser  2022-08-13   936  	/* Calibration readout, YAS537 needs one readout only */
65f79b50103067 Jakob Hauser  2022-08-13   937  	ret = regmap_bulk_read(yas5xx->map, YAS537_CAL, data, sizeof(data));
65f79b50103067 Jakob Hauser  2022-08-13   938  	if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   939  		return ret;
65f79b50103067 Jakob Hauser  2022-08-13   940  	dev_dbg(yas5xx->dev, "calibration data: %17ph\n", data);
65f79b50103067 Jakob Hauser  2022-08-13   941  
65f79b50103067 Jakob Hauser  2022-08-13   942  	/* Sanity check, is this all zeroes? */
65f79b50103067 Jakob Hauser  2022-08-13   943  	if (!memchr_inv(data, 0x00, 16) && !FIELD_GET(GENMASK(5, 0), data[16]))
65f79b50103067 Jakob Hauser  2022-08-13   944  		dev_warn(yas5xx->dev, "calibration is blank!\n");
65f79b50103067 Jakob Hauser  2022-08-13   945  
65f79b50103067 Jakob Hauser  2022-08-13   946  	/* Contribute calibration data to the input pool for kernel entropy */
65f79b50103067 Jakob Hauser  2022-08-13   947  	add_device_randomness(data, sizeof(data));
65f79b50103067 Jakob Hauser  2022-08-13   948  
65f79b50103067 Jakob Hauser  2022-08-13   949  	/* Extract version information */
65f79b50103067 Jakob Hauser  2022-08-13   950  	yas5xx->version = FIELD_GET(GENMASK(7, 6), data[16]);
65f79b50103067 Jakob Hauser  2022-08-13   951  
65f79b50103067 Jakob Hauser  2022-08-13   952  	/* There are two versions of YAS537 behaving differently */
65f79b50103067 Jakob Hauser  2022-08-13   953  	switch (yas5xx->version) {
65f79b50103067 Jakob Hauser  2022-08-13   954  	case YAS537_VERSION_0:
65f79b50103067 Jakob Hauser  2022-08-13   955  		/*
65f79b50103067 Jakob Hauser  2022-08-13   956  		 * The first version simply writes data back into registers:
65f79b50103067 Jakob Hauser  2022-08-13   957  		 *
65f79b50103067 Jakob Hauser  2022-08-13   958  		 * data[0]  YAS537_MTC		0x93
65f79b50103067 Jakob Hauser  2022-08-13   959  		 * data[1]			0x94
65f79b50103067 Jakob Hauser  2022-08-13   960  		 * data[2]			0x95
65f79b50103067 Jakob Hauser  2022-08-13   961  		 * data[3]			0x96
65f79b50103067 Jakob Hauser  2022-08-13   962  		 * data[4]			0x97
65f79b50103067 Jakob Hauser  2022-08-13   963  		 * data[5]			0x98
65f79b50103067 Jakob Hauser  2022-08-13   964  		 * data[6]			0x99
65f79b50103067 Jakob Hauser  2022-08-13   965  		 * data[7]			0x9a
65f79b50103067 Jakob Hauser  2022-08-13   966  		 * data[8]			0x9b
65f79b50103067 Jakob Hauser  2022-08-13   967  		 * data[9]			0x9c
65f79b50103067 Jakob Hauser  2022-08-13   968  		 * data[10]			0x9d
65f79b50103067 Jakob Hauser  2022-08-13   969  		 * data[11] YAS537_OC		0x9e
65f79b50103067 Jakob Hauser  2022-08-13   970  		 *
65f79b50103067 Jakob Hauser  2022-08-13   971  		 * data[12] YAS537_OFFSET_X	0x84
65f79b50103067 Jakob Hauser  2022-08-13   972  		 * data[13] YAS537_OFFSET_Y1	0x85
65f79b50103067 Jakob Hauser  2022-08-13   973  		 * data[14] YAS537_OFFSET_Y2	0x86
65f79b50103067 Jakob Hauser  2022-08-13   974  		 *
65f79b50103067 Jakob Hauser  2022-08-13   975  		 * data[15] YAS537_HCK		0x88
65f79b50103067 Jakob Hauser  2022-08-13   976  		 * data[16] YAS537_LCK		0x89
65f79b50103067 Jakob Hauser  2022-08-13   977  		 */
65f79b50103067 Jakob Hauser  2022-08-13   978  		for (i = 0; i < 12; i++) {
65f79b50103067 Jakob Hauser  2022-08-13   979  			ret = regmap_write(yas5xx->map, YAS537_MTC + i,
65f79b50103067 Jakob Hauser  2022-08-13   980  					   data[i]);
65f79b50103067 Jakob Hauser  2022-08-13   981  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   982  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13   983  		}
65f79b50103067 Jakob Hauser  2022-08-13   984  		for (i = 0; i < 3; i++) {
65f79b50103067 Jakob Hauser  2022-08-13   985  			ret = regmap_write(yas5xx->map, YAS537_OFFSET_X + i,
65f79b50103067 Jakob Hauser  2022-08-13   986  					   data[i + 12]);
65f79b50103067 Jakob Hauser  2022-08-13   987  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   988  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13   989  			yas5xx->hard_offsets[i] = data[i + 12];
65f79b50103067 Jakob Hauser  2022-08-13   990  		}
65f79b50103067 Jakob Hauser  2022-08-13   991  		for (i = 0; i < 2; i++) {
65f79b50103067 Jakob Hauser  2022-08-13   992  			ret = regmap_write(yas5xx->map, YAS537_HCK + i,
65f79b50103067 Jakob Hauser  2022-08-13   993  					   data[i + 15]);
65f79b50103067 Jakob Hauser  2022-08-13   994  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   995  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13   996  		}
65f79b50103067 Jakob Hauser  2022-08-13   997  		break;
65f79b50103067 Jakob Hauser  2022-08-13   998  	case YAS537_VERSION_1:
65f79b50103067 Jakob Hauser  2022-08-13   999  		/*
65f79b50103067 Jakob Hauser  2022-08-13  1000  		 * The second version writes some data into registers but also
65f79b50103067 Jakob Hauser  2022-08-13  1001  		 * extracts calibration coefficients.
65f79b50103067 Jakob Hauser  2022-08-13  1002  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1003  		 * Registers being written:
65f79b50103067 Jakob Hauser  2022-08-13  1004  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1005  		 * data[0]  YAS537_MTC			0x93
65f79b50103067 Jakob Hauser  2022-08-13  1006  		 * data[1]  YAS537_MTC+1		0x94
65f79b50103067 Jakob Hauser  2022-08-13  1007  		 * data[2]  YAS537_MTC+2		0x95
65f79b50103067 Jakob Hauser  2022-08-13  1008  		 * data[3]  YAS537_MTC+3 (partially)	0x96
65f79b50103067 Jakob Hauser  2022-08-13  1009  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1010  		 * data[12] YAS537_OFFSET_X		0x84
65f79b50103067 Jakob Hauser  2022-08-13  1011  		 * data[13] YAS537_OFFSET_Y1		0x85
65f79b50103067 Jakob Hauser  2022-08-13  1012  		 * data[14] YAS537_OFFSET_Y2		0x86
65f79b50103067 Jakob Hauser  2022-08-13  1013  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1014  		 * data[15] YAS537_HCK (partially)	0x88
65f79b50103067 Jakob Hauser  2022-08-13  1015  		 *          YAS537_LCK (partially)	0x89
65f79b50103067 Jakob Hauser  2022-08-13  1016  		 * data[16] YAS537_OC  (partially)	0x9e
65f79b50103067 Jakob Hauser  2022-08-13  1017  		 */
65f79b50103067 Jakob Hauser  2022-08-13  1018  		for (i = 0; i < 3; i++) {
65f79b50103067 Jakob Hauser  2022-08-13  1019  			ret = regmap_write(yas5xx->map, YAS537_MTC + i,
65f79b50103067 Jakob Hauser  2022-08-13  1020  					   data[i]);
65f79b50103067 Jakob Hauser  2022-08-13  1021  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1022  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1023  		}
65f79b50103067 Jakob Hauser  2022-08-13  1024  		for (i = 0; i < 3; i++) {
65f79b50103067 Jakob Hauser  2022-08-13  1025  			ret = regmap_write(yas5xx->map, YAS537_OFFSET_X + i,
65f79b50103067 Jakob Hauser  2022-08-13  1026  					   data[i + 12]);
65f79b50103067 Jakob Hauser  2022-08-13  1027  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1028  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1029  			yas5xx->hard_offsets[i] = data[i + 12];
65f79b50103067 Jakob Hauser  2022-08-13  1030  		}
65f79b50103067 Jakob Hauser  2022-08-13  1031  		/*
65f79b50103067 Jakob Hauser  2022-08-13  1032  		 * Visualization of partially taken data:
65f79b50103067 Jakob Hauser  2022-08-13  1033  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1034  		 * data[3]       n 7 6 5 4 3 2 1 0
65f79b50103067 Jakob Hauser  2022-08-13  1035  		 * YAS537_MTC+3    x x x 1 0 0 0 0
65f79b50103067 Jakob Hauser  2022-08-13  1036  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1037  		 * data[15]      n 7 6 5 4 3 2 1 0
65f79b50103067 Jakob Hauser  2022-08-13  1038  		 * YAS537_HCK      x x x x 0
65f79b50103067 Jakob Hauser  2022-08-13  1039  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1040  		 * data[15]      n 7 6 5 4 3 2 1 0
65f79b50103067 Jakob Hauser  2022-08-13  1041  		 * YAS537_LCK              x x x x 0
65f79b50103067 Jakob Hauser  2022-08-13  1042  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1043  		 * data[16]      n 7 6 5 4 3 2 1 0
65f79b50103067 Jakob Hauser  2022-08-13  1044  		 * YAS537_OC           x x x x x x
65f79b50103067 Jakob Hauser  2022-08-13  1045  		 */
65f79b50103067 Jakob Hauser  2022-08-13  1046  		ret = regmap_write(yas5xx->map, YAS537_MTC + 3,
65f79b50103067 Jakob Hauser  2022-08-13  1047  				   FIELD_PREP(YAS537_MTC3_MASK_PREP,
65f79b50103067 Jakob Hauser  2022-08-13  1048  				   FIELD_GET(YAS537_MTC3_MASK_GET, data[3])) |
65f79b50103067 Jakob Hauser  2022-08-13  1049  				   YAS537_MTC3_ADD_BIT);
65f79b50103067 Jakob Hauser  2022-08-13  1050  		if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1051  			return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1052  		ret = regmap_write(yas5xx->map, YAS537_HCK,
65f79b50103067 Jakob Hauser  2022-08-13  1053  				   FIELD_PREP(YAS537_HCK_MASK_PREP,
65f79b50103067 Jakob Hauser  2022-08-13  1054  				   FIELD_GET(YAS537_HCK_MASK_GET, data[15])));
65f79b50103067 Jakob Hauser  2022-08-13  1055  		if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1056  			return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1057  		ret = regmap_write(yas5xx->map, YAS537_LCK,
65f79b50103067 Jakob Hauser  2022-08-13  1058  				   FIELD_PREP(YAS537_LCK_MASK_PREP,
65f79b50103067 Jakob Hauser  2022-08-13  1059  				   FIELD_GET(YAS537_LCK_MASK_GET, data[15])));
65f79b50103067 Jakob Hauser  2022-08-13  1060  		if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1061  			return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1062  		ret = regmap_write(yas5xx->map, YAS537_OC,
65f79b50103067 Jakob Hauser  2022-08-13  1063  				   FIELD_GET(YAS537_OC_MASK_GET, data[16]));
65f79b50103067 Jakob Hauser  2022-08-13  1064  		if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1065  			return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1066  		/*
65f79b50103067 Jakob Hauser  2022-08-13  1067  		 * For data extraction, build some blocks. Four 32-bit blocks
65f79b50103067 Jakob Hauser  2022-08-13  1068  		 * look appropriate.
65f79b50103067 Jakob Hauser  2022-08-13  1069  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1070  		 *            n    7  6  5  4  3  2  1  0
65f79b50103067 Jakob Hauser  2022-08-13  1071  		 *  data[0]   0 [ Cx Cx Cx Cx Cx Cx Cx Cx ] bits 31 .. 24
65f79b50103067 Jakob Hauser  2022-08-13  1072  		 *  data[1]   1 [ Cx C1 C1 C1 C1 C1 C1 C1 ] bits 23 .. 16
65f79b50103067 Jakob Hauser  2022-08-13  1073  		 *  data[2]   2 [ C1 C1 C2 C2 C2 C2 C2 C2 ] bits 15 .. 8
65f79b50103067 Jakob Hauser  2022-08-13  1074  		 *  data[3]   3 [ C2 C2 C2                ] bits  7 .. 0
65f79b50103067 Jakob Hauser  2022-08-13  1075  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1076  		 *            n    7  6  5  4  3  2  1  0
65f79b50103067 Jakob Hauser  2022-08-13  1077  		 *  data[3]   0 [          a2 a2 a2 a2 a2 ] bits 31 .. 24
65f79b50103067 Jakob Hauser  2022-08-13  1078  		 *  data[4]   1 [ a2 a2 a3 a3 a3 a3 a3 a3 ] bits 23 .. 16
65f79b50103067 Jakob Hauser  2022-08-13  1079  		 *  data[5]   2 [ a3 a4 a4 a4 a4 a4 a4 a4 ] bits 15 .. 8
65f79b50103067 Jakob Hauser  2022-08-13  1080  		 *  data[6]   3 [ a4                      ] bits  7 .. 0
65f79b50103067 Jakob Hauser  2022-08-13  1081  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1082  		 *            n    7  6  5  4  3  2  1  0
65f79b50103067 Jakob Hauser  2022-08-13  1083  		 *  data[6]   0 [    a5 a5 a5 a5 a5 a5 a5 ] bits 31 .. 24
65f79b50103067 Jakob Hauser  2022-08-13  1084  		 *  data[7]   1 [ a5 a5 a6 a6 a6 a6 a6 a6 ] bits 23 .. 16
65f79b50103067 Jakob Hauser  2022-08-13  1085  		 *  data[8]   2 [ a6 a7 a7 a7 a7 a7 a7 a7 ] bits 15 .. 8
65f79b50103067 Jakob Hauser  2022-08-13  1086  		 *  data[9]   3 [ a7                      ] bits  7 .. 0
65f79b50103067 Jakob Hauser  2022-08-13  1087  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1088  		 *            n    7  6  5  4  3  2  1  0
65f79b50103067 Jakob Hauser  2022-08-13  1089  		 *  data[9]   0 [    a8 a8 a8 a8 a8 a8 a8 ] bits 31 .. 24
65f79b50103067 Jakob Hauser  2022-08-13  1090  		 *  data[10]  1 [ a9 a9 a9 a9 a9 a9 a9 a9 ] bits 23 .. 16
65f79b50103067 Jakob Hauser  2022-08-13  1091  		 *  data[11]  2 [ a9  k  k  k  k  k  k  k ] bits 15 .. 8
65f79b50103067 Jakob Hauser  2022-08-13  1092  		 *  data[12]  3 [                         ] bits  7 .. 0
65f79b50103067 Jakob Hauser  2022-08-13  1093  		 */
65f79b50103067 Jakob Hauser  2022-08-13  1094  		val1 = get_unaligned_be32(&data[0]);
65f79b50103067 Jakob Hauser  2022-08-13  1095  		val2 = get_unaligned_be32(&data[3]);
65f79b50103067 Jakob Hauser  2022-08-13  1096  		val3 = get_unaligned_be32(&data[6]);
65f79b50103067 Jakob Hauser  2022-08-13  1097  		val4 = get_unaligned_be32(&data[9]);
65f79b50103067 Jakob Hauser  2022-08-13  1098  		/* Extract calibration coefficients and modify */
65f79b50103067 Jakob Hauser  2022-08-13 @1099  		c->Cx  = FIELD_GET(GENMASK(31, 23), val1) - 256;
65f79b50103067 Jakob Hauser  2022-08-13 @1100  		c->Cy1 = FIELD_GET(GENMASK(22, 14), val1) - 256;
65f79b50103067 Jakob Hauser  2022-08-13  1101  		c->Cy2 = FIELD_GET(GENMASK(13,  5), val1) - 256;
65f79b50103067 Jakob Hauser  2022-08-13 @1102  		c->a2  = FIELD_GET(GENMASK(28, 22), val2) -  64;
65f79b50103067 Jakob Hauser  2022-08-13 @1103  		c->a3  = FIELD_GET(GENMASK(21, 15), val2) -  64;
65f79b50103067 Jakob Hauser  2022-08-13  1104  		c->a4  = FIELD_GET(GENMASK(14,  7), val2) - 128;
65f79b50103067 Jakob Hauser  2022-08-13 @1105  		c->a5  = FIELD_GET(GENMASK(30, 22), val3) - 112;
65f79b50103067 Jakob Hauser  2022-08-13 @1106  		c->a6  = FIELD_GET(GENMASK(21, 15), val3) -  64;
65f79b50103067 Jakob Hauser  2022-08-13  1107  		c->a7  = FIELD_GET(GENMASK(14,  7), val3) - 128;
65f79b50103067 Jakob Hauser  2022-08-13 @1108  		c->a8  = FIELD_GET(GENMASK(30, 24), val4) -  64;
65f79b50103067 Jakob Hauser  2022-08-13 @1109  		c->a9  = FIELD_GET(GENMASK(23, 15), val4) - 112;
65f79b50103067 Jakob Hauser  2022-08-13  1110  		c->k   = FIELD_GET(GENMASK(14,  8), val4);
65f79b50103067 Jakob Hauser  2022-08-13  1111  		break;
65f79b50103067 Jakob Hauser  2022-08-13  1112  	default:
65f79b50103067 Jakob Hauser  2022-08-13  1113  		dev_err(yas5xx->dev, "unknown version of YAS537\n");
65f79b50103067 Jakob Hauser  2022-08-13  1114  		return -EINVAL;
65f79b50103067 Jakob Hauser  2022-08-13  1115  	}
65f79b50103067 Jakob Hauser  2022-08-13  1116  
65f79b50103067 Jakob Hauser  2022-08-13  1117  	return 0;
65f79b50103067 Jakob Hauser  2022-08-13  1118  }
65f79b50103067 Jakob Hauser  2022-08-13  1119  

:::::: The code at line 1099 was first introduced by commit
:::::: 65f79b501030678393eae0ae03d60a8151fbef55 iio: magnetometer: yas530: Add YAS537 variant

:::::: TO: Jakob Hauser <jahau@rocketmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
