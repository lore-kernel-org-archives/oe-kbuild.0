Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207821AA1F4
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750264458; cv=none; b=G7FTOKnNKJAme7fwS4muGS/ZE4+kapftMaBNZ6BIVY/tkPu+dDCCs6WUKiMvwmhiBpmO7lnLgxCm02K+tYNHk+/O6AiHvFHXS10+LOD4gOT8kLPJiyurO56F9ACal/BS65GhW8cpo70jvvKPYHiS2S4E5gFLlNRE2juYxp4044U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750264458; c=relaxed/simple;
	bh=LHENZiVtf8UfvRsKYDnO8CG9yG9jsPHhSEyBlb+gLNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c0A+s/e1v5Z7lzCI+ln1+OLE2e0Lqz8NbRbKnRdADwVpusER6ITy6qF5Ck++7nVDbs6EbzHCvGdl4s33ubdAA7vyfTqnrYwQ9/0AlO0/LkhQM2Fj4LqYRyyRRc47F8A2KsDzc0kflMR0AzTrfj8TExSZQiLYSlL0yl6XTCxUKJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRB41sA7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRB41sA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750264456; x=1781800456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHENZiVtf8UfvRsKYDnO8CG9yG9jsPHhSEyBlb+gLNk=;
  b=bRB41sA73om7H/qeGIuPY7aXL8Zcr6JYnonPLTuBHbyd7ThGqaielo7L
   z/nCzA2jJ3DJTMtBKFdbbuPAhj6J5UXBgLU5uqzolm+hbnDfDHZOScaqG
   96XcAgjuyvz7J+XDSv9gUkRgJDyxKU9y3ytyYbrI37vjuBXMDpW4J8JEr
   LT02gs9rK0MsulzI/FEMbZ0CiSAmMpUhphYFVnd/fV/ftxcuiMTWz1gca
   MOXO6hC33cyGBOXSQK3I+VoPQU1nAoT6ygwWTHIu8rYiQH+6DSKmbrc3i
   +VG+YaUJQK764Y3WZlPPVHNzZHlbb186R6IY7sbFUQx3Cc4j5l1OTbt3y
   w==;
X-CSE-ConnectionGUID: iV5qB98RT42jYvZf2MHjJg==
X-CSE-MsgGUID: JuW0xp/iR06iOOaY+a5QQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="55112177"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="55112177"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 09:33:07 -0700
X-CSE-ConnectionGUID: /zk7sLVjRjiOlzVnVgV8Kg==
X-CSE-MsgGUID: ZvLZ44mKQsu/g576yrjSWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150545217"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jun 2025 09:33:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRvih-000Jz8-2K;
	Wed, 18 Jun 2025 16:33:03 +0000
Date: Thu, 19 Jun 2025 00:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/3] vdso: Switch get/put unaligned from packed struct
 to memcpy
Message-ID: <202506190009.DyDpM6gF-lkp@intel.com>
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
In-Reply-To: <20250617205320.1580946-2-irogers@google.com>
References: <20250617205320.1580946-2-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Eric Biggers <ebiggers@google.com>
TO: Yuzhuo Jing <yuzhuo@google.com>
TO: Andy Lutomirski <luto@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
TO: Arnaldo Carvalho de Melo <acme@redhat.com>
TO: Al Viro <viro@zeniv.linux.org.uk>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: "Jason A. Donenfeld" <Jason@zx2c4.com>
TO: linux-kernel@vger.kernel.org
TO: linux-perf-users@vger.kernel.org
CC: Ian Rogers <irogers@google.com>

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc2 next-20250618]
[cannot apply to tip/timers/vdso acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/vdso-Switch-get-put-unaligned-from-packed-struct-to-memcpy/20250618-045610
base:   linus/master
patch link:    https://lore.kernel.org/r/20250617205320.1580946-2-irogers%40google.com
patch subject: [PATCH v2 1/3] vdso: Switch get/put unaligned from packed struct to memcpy
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-141-20250618 (https://download.01.org/0day-ci/archive/20250619/202506190009.DyDpM6gF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506190009.DyDpM6gF-lkp@intel.com/

smatch warnings:
drivers/iio/magnetometer/yamaha-yas530.c:1101 yas537_get_calibration_data() warn: ' - 256' 4294967040 can't fit into 32767 'c->Cx'
drivers/iio/magnetometer/yamaha-yas530.c:1102 yas537_get_calibration_data() warn: ' - 256' 4294967040 can't fit into 32767 'c->Cy1'
drivers/iio/magnetometer/yamaha-yas530.c:1104 yas537_get_calibration_data() warn: ' - 64' 4294967232 can't fit into 127 'c->a2'
drivers/iio/magnetometer/yamaha-yas530.c:1105 yas537_get_calibration_data() warn: ' - 64' 4294967232 can't fit into 127 'c->a3'
drivers/iio/magnetometer/yamaha-yas530.c:1107 yas537_get_calibration_data() warn: ' - 112' 4294967184 can't fit into 32767 'c->a5'
drivers/iio/magnetometer/yamaha-yas530.c:1108 yas537_get_calibration_data() warn: ' - 64' 4294967232 can't fit into 127 'c->a6'
drivers/iio/magnetometer/yamaha-yas530.c:1110 yas537_get_calibration_data() warn: ' - 64' 4294967232 can't fit into 127 'c->a8'
drivers/iio/magnetometer/yamaha-yas530.c:1111 yas537_get_calibration_data() warn: ' - 112' 4294967184 can't fit into 32767 'c->a9'

vim +1101 drivers/iio/magnetometer/yamaha-yas530.c

de8860b1ed4701 Linus Walleij 2020-12-24   925  
65f79b50103067 Jakob Hauser  2022-08-13   926  static int yas537_get_calibration_data(struct yas5xx *yas5xx)
65f79b50103067 Jakob Hauser  2022-08-13   927  {
65f79b50103067 Jakob Hauser  2022-08-13   928  	struct yas5xx_calibration *c = &yas5xx->calibration;
65f79b50103067 Jakob Hauser  2022-08-13   929  	u8 data[17];
65f79b50103067 Jakob Hauser  2022-08-13   930  	u32 val1, val2, val3, val4;
65f79b50103067 Jakob Hauser  2022-08-13   931  	int i, ret;
65f79b50103067 Jakob Hauser  2022-08-13   932  
65f79b50103067 Jakob Hauser  2022-08-13   933  	/* Writing SRST register */
65f79b50103067 Jakob Hauser  2022-08-13   934  	ret = regmap_write(yas5xx->map, YAS537_SRST, BIT(1));
65f79b50103067 Jakob Hauser  2022-08-13   935  	if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   936  		return ret;
65f79b50103067 Jakob Hauser  2022-08-13   937  
65f79b50103067 Jakob Hauser  2022-08-13   938  	/* Calibration readout, YAS537 needs one readout only */
65f79b50103067 Jakob Hauser  2022-08-13   939  	ret = regmap_bulk_read(yas5xx->map, YAS537_CAL, data, sizeof(data));
65f79b50103067 Jakob Hauser  2022-08-13   940  	if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   941  		return ret;
65f79b50103067 Jakob Hauser  2022-08-13   942  	dev_dbg(yas5xx->dev, "calibration data: %17ph\n", data);
65f79b50103067 Jakob Hauser  2022-08-13   943  
65f79b50103067 Jakob Hauser  2022-08-13   944  	/* Sanity check, is this all zeroes? */
65f79b50103067 Jakob Hauser  2022-08-13   945  	if (!memchr_inv(data, 0x00, 16) && !FIELD_GET(GENMASK(5, 0), data[16]))
65f79b50103067 Jakob Hauser  2022-08-13   946  		dev_warn(yas5xx->dev, "calibration is blank!\n");
65f79b50103067 Jakob Hauser  2022-08-13   947  
65f79b50103067 Jakob Hauser  2022-08-13   948  	/* Contribute calibration data to the input pool for kernel entropy */
65f79b50103067 Jakob Hauser  2022-08-13   949  	add_device_randomness(data, sizeof(data));
65f79b50103067 Jakob Hauser  2022-08-13   950  
65f79b50103067 Jakob Hauser  2022-08-13   951  	/* Extract version information */
65f79b50103067 Jakob Hauser  2022-08-13   952  	yas5xx->version = FIELD_GET(GENMASK(7, 6), data[16]);
65f79b50103067 Jakob Hauser  2022-08-13   953  
65f79b50103067 Jakob Hauser  2022-08-13   954  	/* There are two versions of YAS537 behaving differently */
65f79b50103067 Jakob Hauser  2022-08-13   955  	switch (yas5xx->version) {
65f79b50103067 Jakob Hauser  2022-08-13   956  	case YAS537_VERSION_0:
65f79b50103067 Jakob Hauser  2022-08-13   957  		/*
65f79b50103067 Jakob Hauser  2022-08-13   958  		 * The first version simply writes data back into registers:
65f79b50103067 Jakob Hauser  2022-08-13   959  		 *
65f79b50103067 Jakob Hauser  2022-08-13   960  		 * data[0]  YAS537_MTC		0x93
65f79b50103067 Jakob Hauser  2022-08-13   961  		 * data[1]			0x94
65f79b50103067 Jakob Hauser  2022-08-13   962  		 * data[2]			0x95
65f79b50103067 Jakob Hauser  2022-08-13   963  		 * data[3]			0x96
65f79b50103067 Jakob Hauser  2022-08-13   964  		 * data[4]			0x97
65f79b50103067 Jakob Hauser  2022-08-13   965  		 * data[5]			0x98
65f79b50103067 Jakob Hauser  2022-08-13   966  		 * data[6]			0x99
65f79b50103067 Jakob Hauser  2022-08-13   967  		 * data[7]			0x9a
65f79b50103067 Jakob Hauser  2022-08-13   968  		 * data[8]			0x9b
65f79b50103067 Jakob Hauser  2022-08-13   969  		 * data[9]			0x9c
65f79b50103067 Jakob Hauser  2022-08-13   970  		 * data[10]			0x9d
65f79b50103067 Jakob Hauser  2022-08-13   971  		 * data[11] YAS537_OC		0x9e
65f79b50103067 Jakob Hauser  2022-08-13   972  		 *
65f79b50103067 Jakob Hauser  2022-08-13   973  		 * data[12] YAS537_OFFSET_X	0x84
65f79b50103067 Jakob Hauser  2022-08-13   974  		 * data[13] YAS537_OFFSET_Y1	0x85
65f79b50103067 Jakob Hauser  2022-08-13   975  		 * data[14] YAS537_OFFSET_Y2	0x86
65f79b50103067 Jakob Hauser  2022-08-13   976  		 *
65f79b50103067 Jakob Hauser  2022-08-13   977  		 * data[15] YAS537_HCK		0x88
65f79b50103067 Jakob Hauser  2022-08-13   978  		 * data[16] YAS537_LCK		0x89
65f79b50103067 Jakob Hauser  2022-08-13   979  		 */
65f79b50103067 Jakob Hauser  2022-08-13   980  		for (i = 0; i < 12; i++) {
65f79b50103067 Jakob Hauser  2022-08-13   981  			ret = regmap_write(yas5xx->map, YAS537_MTC + i,
65f79b50103067 Jakob Hauser  2022-08-13   982  					   data[i]);
65f79b50103067 Jakob Hauser  2022-08-13   983  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   984  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13   985  		}
65f79b50103067 Jakob Hauser  2022-08-13   986  		for (i = 0; i < 3; i++) {
65f79b50103067 Jakob Hauser  2022-08-13   987  			ret = regmap_write(yas5xx->map, YAS537_OFFSET_X + i,
65f79b50103067 Jakob Hauser  2022-08-13   988  					   data[i + 12]);
65f79b50103067 Jakob Hauser  2022-08-13   989  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   990  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13   991  			yas5xx->hard_offsets[i] = data[i + 12];
65f79b50103067 Jakob Hauser  2022-08-13   992  		}
65f79b50103067 Jakob Hauser  2022-08-13   993  		for (i = 0; i < 2; i++) {
65f79b50103067 Jakob Hauser  2022-08-13   994  			ret = regmap_write(yas5xx->map, YAS537_HCK + i,
65f79b50103067 Jakob Hauser  2022-08-13   995  					   data[i + 15]);
65f79b50103067 Jakob Hauser  2022-08-13   996  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13   997  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13   998  		}
65f79b50103067 Jakob Hauser  2022-08-13   999  		break;
65f79b50103067 Jakob Hauser  2022-08-13  1000  	case YAS537_VERSION_1:
65f79b50103067 Jakob Hauser  2022-08-13  1001  		/*
65f79b50103067 Jakob Hauser  2022-08-13  1002  		 * The second version writes some data into registers but also
65f79b50103067 Jakob Hauser  2022-08-13  1003  		 * extracts calibration coefficients.
65f79b50103067 Jakob Hauser  2022-08-13  1004  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1005  		 * Registers being written:
65f79b50103067 Jakob Hauser  2022-08-13  1006  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1007  		 * data[0]  YAS537_MTC			0x93
65f79b50103067 Jakob Hauser  2022-08-13  1008  		 * data[1]  YAS537_MTC+1		0x94
65f79b50103067 Jakob Hauser  2022-08-13  1009  		 * data[2]  YAS537_MTC+2		0x95
65f79b50103067 Jakob Hauser  2022-08-13  1010  		 * data[3]  YAS537_MTC+3 (partially)	0x96
65f79b50103067 Jakob Hauser  2022-08-13  1011  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1012  		 * data[12] YAS537_OFFSET_X		0x84
65f79b50103067 Jakob Hauser  2022-08-13  1013  		 * data[13] YAS537_OFFSET_Y1		0x85
65f79b50103067 Jakob Hauser  2022-08-13  1014  		 * data[14] YAS537_OFFSET_Y2		0x86
65f79b50103067 Jakob Hauser  2022-08-13  1015  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1016  		 * data[15] YAS537_HCK (partially)	0x88
65f79b50103067 Jakob Hauser  2022-08-13  1017  		 *          YAS537_LCK (partially)	0x89
65f79b50103067 Jakob Hauser  2022-08-13  1018  		 * data[16] YAS537_OC  (partially)	0x9e
65f79b50103067 Jakob Hauser  2022-08-13  1019  		 */
65f79b50103067 Jakob Hauser  2022-08-13  1020  		for (i = 0; i < 3; i++) {
65f79b50103067 Jakob Hauser  2022-08-13  1021  			ret = regmap_write(yas5xx->map, YAS537_MTC + i,
65f79b50103067 Jakob Hauser  2022-08-13  1022  					   data[i]);
65f79b50103067 Jakob Hauser  2022-08-13  1023  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1024  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1025  		}
65f79b50103067 Jakob Hauser  2022-08-13  1026  		for (i = 0; i < 3; i++) {
65f79b50103067 Jakob Hauser  2022-08-13  1027  			ret = regmap_write(yas5xx->map, YAS537_OFFSET_X + i,
65f79b50103067 Jakob Hauser  2022-08-13  1028  					   data[i + 12]);
65f79b50103067 Jakob Hauser  2022-08-13  1029  			if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1030  				return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1031  			yas5xx->hard_offsets[i] = data[i + 12];
65f79b50103067 Jakob Hauser  2022-08-13  1032  		}
65f79b50103067 Jakob Hauser  2022-08-13  1033  		/*
65f79b50103067 Jakob Hauser  2022-08-13  1034  		 * Visualization of partially taken data:
65f79b50103067 Jakob Hauser  2022-08-13  1035  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1036  		 * data[3]       n 7 6 5 4 3 2 1 0
65f79b50103067 Jakob Hauser  2022-08-13  1037  		 * YAS537_MTC+3    x x x 1 0 0 0 0
65f79b50103067 Jakob Hauser  2022-08-13  1038  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1039  		 * data[15]      n 7 6 5 4 3 2 1 0
65f79b50103067 Jakob Hauser  2022-08-13  1040  		 * YAS537_HCK      x x x x 0
65f79b50103067 Jakob Hauser  2022-08-13  1041  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1042  		 * data[15]      n 7 6 5 4 3 2 1 0
65f79b50103067 Jakob Hauser  2022-08-13  1043  		 * YAS537_LCK              x x x x 0
65f79b50103067 Jakob Hauser  2022-08-13  1044  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1045  		 * data[16]      n 7 6 5 4 3 2 1 0
65f79b50103067 Jakob Hauser  2022-08-13  1046  		 * YAS537_OC           x x x x x x
65f79b50103067 Jakob Hauser  2022-08-13  1047  		 */
65f79b50103067 Jakob Hauser  2022-08-13  1048  		ret = regmap_write(yas5xx->map, YAS537_MTC + 3,
65f79b50103067 Jakob Hauser  2022-08-13  1049  				   FIELD_PREP(YAS537_MTC3_MASK_PREP,
65f79b50103067 Jakob Hauser  2022-08-13  1050  				   FIELD_GET(YAS537_MTC3_MASK_GET, data[3])) |
65f79b50103067 Jakob Hauser  2022-08-13  1051  				   YAS537_MTC3_ADD_BIT);
65f79b50103067 Jakob Hauser  2022-08-13  1052  		if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1053  			return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1054  		ret = regmap_write(yas5xx->map, YAS537_HCK,
65f79b50103067 Jakob Hauser  2022-08-13  1055  				   FIELD_PREP(YAS537_HCK_MASK_PREP,
65f79b50103067 Jakob Hauser  2022-08-13  1056  				   FIELD_GET(YAS537_HCK_MASK_GET, data[15])));
65f79b50103067 Jakob Hauser  2022-08-13  1057  		if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1058  			return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1059  		ret = regmap_write(yas5xx->map, YAS537_LCK,
65f79b50103067 Jakob Hauser  2022-08-13  1060  				   FIELD_PREP(YAS537_LCK_MASK_PREP,
65f79b50103067 Jakob Hauser  2022-08-13  1061  				   FIELD_GET(YAS537_LCK_MASK_GET, data[15])));
65f79b50103067 Jakob Hauser  2022-08-13  1062  		if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1063  			return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1064  		ret = regmap_write(yas5xx->map, YAS537_OC,
65f79b50103067 Jakob Hauser  2022-08-13  1065  				   FIELD_GET(YAS537_OC_MASK_GET, data[16]));
65f79b50103067 Jakob Hauser  2022-08-13  1066  		if (ret)
65f79b50103067 Jakob Hauser  2022-08-13  1067  			return ret;
65f79b50103067 Jakob Hauser  2022-08-13  1068  		/*
65f79b50103067 Jakob Hauser  2022-08-13  1069  		 * For data extraction, build some blocks. Four 32-bit blocks
65f79b50103067 Jakob Hauser  2022-08-13  1070  		 * look appropriate.
65f79b50103067 Jakob Hauser  2022-08-13  1071  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1072  		 *            n    7  6  5  4  3  2  1  0
65f79b50103067 Jakob Hauser  2022-08-13  1073  		 *  data[0]   0 [ Cx Cx Cx Cx Cx Cx Cx Cx ] bits 31 .. 24
65f79b50103067 Jakob Hauser  2022-08-13  1074  		 *  data[1]   1 [ Cx C1 C1 C1 C1 C1 C1 C1 ] bits 23 .. 16
65f79b50103067 Jakob Hauser  2022-08-13  1075  		 *  data[2]   2 [ C1 C1 C2 C2 C2 C2 C2 C2 ] bits 15 .. 8
65f79b50103067 Jakob Hauser  2022-08-13  1076  		 *  data[3]   3 [ C2 C2 C2                ] bits  7 .. 0
65f79b50103067 Jakob Hauser  2022-08-13  1077  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1078  		 *            n    7  6  5  4  3  2  1  0
65f79b50103067 Jakob Hauser  2022-08-13  1079  		 *  data[3]   0 [          a2 a2 a2 a2 a2 ] bits 31 .. 24
65f79b50103067 Jakob Hauser  2022-08-13  1080  		 *  data[4]   1 [ a2 a2 a3 a3 a3 a3 a3 a3 ] bits 23 .. 16
65f79b50103067 Jakob Hauser  2022-08-13  1081  		 *  data[5]   2 [ a3 a4 a4 a4 a4 a4 a4 a4 ] bits 15 .. 8
65f79b50103067 Jakob Hauser  2022-08-13  1082  		 *  data[6]   3 [ a4                      ] bits  7 .. 0
65f79b50103067 Jakob Hauser  2022-08-13  1083  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1084  		 *            n    7  6  5  4  3  2  1  0
65f79b50103067 Jakob Hauser  2022-08-13  1085  		 *  data[6]   0 [    a5 a5 a5 a5 a5 a5 a5 ] bits 31 .. 24
65f79b50103067 Jakob Hauser  2022-08-13  1086  		 *  data[7]   1 [ a5 a5 a6 a6 a6 a6 a6 a6 ] bits 23 .. 16
65f79b50103067 Jakob Hauser  2022-08-13  1087  		 *  data[8]   2 [ a6 a7 a7 a7 a7 a7 a7 a7 ] bits 15 .. 8
65f79b50103067 Jakob Hauser  2022-08-13  1088  		 *  data[9]   3 [ a7                      ] bits  7 .. 0
65f79b50103067 Jakob Hauser  2022-08-13  1089  		 *
65f79b50103067 Jakob Hauser  2022-08-13  1090  		 *            n    7  6  5  4  3  2  1  0
65f79b50103067 Jakob Hauser  2022-08-13  1091  		 *  data[9]   0 [    a8 a8 a8 a8 a8 a8 a8 ] bits 31 .. 24
65f79b50103067 Jakob Hauser  2022-08-13  1092  		 *  data[10]  1 [ a9 a9 a9 a9 a9 a9 a9 a9 ] bits 23 .. 16
65f79b50103067 Jakob Hauser  2022-08-13  1093  		 *  data[11]  2 [ a9  k  k  k  k  k  k  k ] bits 15 .. 8
65f79b50103067 Jakob Hauser  2022-08-13  1094  		 *  data[12]  3 [                         ] bits  7 .. 0
65f79b50103067 Jakob Hauser  2022-08-13  1095  		 */
65f79b50103067 Jakob Hauser  2022-08-13  1096  		val1 = get_unaligned_be32(&data[0]);
65f79b50103067 Jakob Hauser  2022-08-13  1097  		val2 = get_unaligned_be32(&data[3]);
65f79b50103067 Jakob Hauser  2022-08-13  1098  		val3 = get_unaligned_be32(&data[6]);
65f79b50103067 Jakob Hauser  2022-08-13  1099  		val4 = get_unaligned_be32(&data[9]);
65f79b50103067 Jakob Hauser  2022-08-13  1100  		/* Extract calibration coefficients and modify */
65f79b50103067 Jakob Hauser  2022-08-13 @1101  		c->Cx  = FIELD_GET(GENMASK(31, 23), val1) - 256;
65f79b50103067 Jakob Hauser  2022-08-13 @1102  		c->Cy1 = FIELD_GET(GENMASK(22, 14), val1) - 256;
65f79b50103067 Jakob Hauser  2022-08-13  1103  		c->Cy2 = FIELD_GET(GENMASK(13,  5), val1) - 256;
65f79b50103067 Jakob Hauser  2022-08-13 @1104  		c->a2  = FIELD_GET(GENMASK(28, 22), val2) -  64;
65f79b50103067 Jakob Hauser  2022-08-13 @1105  		c->a3  = FIELD_GET(GENMASK(21, 15), val2) -  64;
65f79b50103067 Jakob Hauser  2022-08-13  1106  		c->a4  = FIELD_GET(GENMASK(14,  7), val2) - 128;
65f79b50103067 Jakob Hauser  2022-08-13 @1107  		c->a5  = FIELD_GET(GENMASK(30, 22), val3) - 112;
65f79b50103067 Jakob Hauser  2022-08-13 @1108  		c->a6  = FIELD_GET(GENMASK(21, 15), val3) -  64;
65f79b50103067 Jakob Hauser  2022-08-13  1109  		c->a7  = FIELD_GET(GENMASK(14,  7), val3) - 128;
65f79b50103067 Jakob Hauser  2022-08-13 @1110  		c->a8  = FIELD_GET(GENMASK(30, 24), val4) -  64;
65f79b50103067 Jakob Hauser  2022-08-13 @1111  		c->a9  = FIELD_GET(GENMASK(23, 15), val4) - 112;
65f79b50103067 Jakob Hauser  2022-08-13  1112  		c->k   = FIELD_GET(GENMASK(14,  8), val4);
65f79b50103067 Jakob Hauser  2022-08-13  1113  		break;
65f79b50103067 Jakob Hauser  2022-08-13  1114  	default:
65f79b50103067 Jakob Hauser  2022-08-13  1115  		dev_err(yas5xx->dev, "unknown version of YAS537\n");
65f79b50103067 Jakob Hauser  2022-08-13  1116  		return -EINVAL;
65f79b50103067 Jakob Hauser  2022-08-13  1117  	}
65f79b50103067 Jakob Hauser  2022-08-13  1118  
65f79b50103067 Jakob Hauser  2022-08-13  1119  	return 0;
65f79b50103067 Jakob Hauser  2022-08-13  1120  }
65f79b50103067 Jakob Hauser  2022-08-13  1121  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
