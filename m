Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CA3207
	for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717052297; cv=none; b=aS4yPMc+14Suf//yb5heArOtmbNiov9HygAqn8m1KWaXLnSlKPUJSrXxo1VDE9MxTxUk9RgSRQfkt09W1j1ixuRZC+0+83pFp+P7DFk3m7fDbFNmaLYYCAD+tumz8JhZ6vHK2G4/eSATv+VASZBmbMQ6uX+iyMQ2IFEd/XxniPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717052297; c=relaxed/simple;
	bh=Ph254mOd+8WfE9j1EfzZjVfuiRg42HlJ+f0u+qnt/7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ckR3fkutYPFCXwUkncXy2VtNQO/+JLBS/4IWAOZMTbhW3YB+L+xiKZ2UAeOQB3Er0L1ZfrSB0E9+TRCQ3xttxWVAqQPk3Kl09PMWoOZC6WstY04+eUgw7JRSigQW+mkEKtRm4zX3ep8shmP4eTe0pD5s/sGovHW3ubCmEz+JErU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1HlK15V; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1HlK15V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717052295; x=1748588295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ph254mOd+8WfE9j1EfzZjVfuiRg42HlJ+f0u+qnt/7E=;
  b=J1HlK15VilbLsmu6CBEOlIcq/y76v09UWG/xHItS7BQ96LXiUVW0CX25
   KyvG7p77ajfJm5kozlsnCVew52k/PgrXcZGL7WPvl2DyBigHW6+Y/U818
   fCwR29ZrnvaefdpbA9h/OUciOW3VbKbRhWgwHEKi0P6l5D2yeCevI+Rxm
   HB1PdMGu0lUQd2ftqWmYRywV7YCWPv3i9HvzcCwRY1Au5m+et10I7qbk5
   UG3YAQePFEmbXi3L+B5k+yx9wJogRbxHXVuVZsLsK2gDC8tpca6H0yQPP
   Ndr/NpySGeMp38k1YTK2bCllc12kpwgyCPk7qp6UC94sMPaVRoXpm4hOG
   Q==;
X-CSE-ConnectionGUID: kBxyVGiAQYKN3eM607ZI+w==
X-CSE-MsgGUID: 3xbb4G5PSUec9g+oYbnFgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31012741"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="31012741"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 23:58:14 -0700
X-CSE-ConnectionGUID: OyqyV3+vQ0Sln4fmZ0oEdg==
X-CSE-MsgGUID: VmJo4KMDR82o9lrdbxh7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="66913601"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2024 23:58:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCZjm-000EvV-1E;
	Thu, 30 May 2024 06:58:10 +0000
Date: Thu, 30 May 2024 14:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net] net: dsa: microchip: fix KSZ9477 set_ageing_time
 function
Message-ID: <202405301413.aXVlGX8b-lkp@intel.com>
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
In-Reply-To: <1716932192-3555-1-git-send-email-Tristram.Ha@microchip.com>
References: <1716932192-3555-1-git-send-email-Tristram.Ha@microchip.com>
TO: Tristram.Ha@microchip.com
TO: Arun Ramadoss <arun.ramadoss@microchip.com>
TO: Woojung Huh <woojung.huh@microchip.com>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Vivien Didelot <vivien.didelot@gmail.com>
TO: Florian Fainelli <f.fainelli@gmail.com>
TO: Vladimir Oltean <olteanv@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: UNGLinuxDriver@microchip.com
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Tristram Ha <tristram.ha@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tristram-Ha-microchip-com/net-dsa-microchip-fix-KSZ9477-set_ageing_time-function/20240529-053626
base:   net/main
patch link:    https://lore.kernel.org/r/1716932192-3555-1-git-send-email-Tristram.Ha%40microchip.com
patch subject: [PATCH net] net: dsa: microchip: fix KSZ9477 set_ageing_time function
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-161-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301413.aXVlGX8b-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405301413.aXVlGX8b-lkp@intel.com/

smatch warnings:
drivers/net/dsa/microchip/ksz9477.c:1156 ksz9477_set_ageing_time() error: uninitialized symbol 'data'.

vim +/data +1156 drivers/net/dsa/microchip/ksz9477.c

65ac79e1812016 Arun Ramadoss 2022-05-17  1098  
2c119d9982b1ab Arun Ramadoss 2022-09-07  1099  int ksz9477_set_ageing_time(struct ksz_device *dev, unsigned int msecs)
2c119d9982b1ab Arun Ramadoss 2022-09-07  1100  {
2c119d9982b1ab Arun Ramadoss 2022-09-07  1101  	u32 secs = msecs / 1000;
1af487480fe750 Tristram Ha   2024-05-28  1102  	u8 first, last, mult, i;
1af487480fe750 Tristram Ha   2024-05-28  1103  	int min, ret;
1af487480fe750 Tristram Ha   2024-05-28  1104  	int diff[8];
2c119d9982b1ab Arun Ramadoss 2022-09-07  1105  	u8 value;
2c119d9982b1ab Arun Ramadoss 2022-09-07  1106  	u8 data;
2c119d9982b1ab Arun Ramadoss 2022-09-07  1107  
1af487480fe750 Tristram Ha   2024-05-28  1108  	/* The aging timer comprises a 3-bit multiplier and an 8-bit second
1af487480fe750 Tristram Ha   2024-05-28  1109  	 * value.  Either of them cannot be zero.  The maximum timer is then
1af487480fe750 Tristram Ha   2024-05-28  1110  	 * 7 * 255 = 1785.
1af487480fe750 Tristram Ha   2024-05-28  1111  	 */
1af487480fe750 Tristram Ha   2024-05-28  1112  	if (!secs)
1af487480fe750 Tristram Ha   2024-05-28  1113  		secs = 1;
2c119d9982b1ab Arun Ramadoss 2022-09-07  1114  
1af487480fe750 Tristram Ha   2024-05-28  1115  	ret = ksz_read8(dev, REG_SW_LUE_CTRL_0, &value);
2c119d9982b1ab Arun Ramadoss 2022-09-07  1116  	if (ret < 0)
2c119d9982b1ab Arun Ramadoss 2022-09-07  1117  		return ret;
2c119d9982b1ab Arun Ramadoss 2022-09-07  1118  
1af487480fe750 Tristram Ha   2024-05-28  1119  	/* Check whether there is need to update the multiplier. */
1af487480fe750 Tristram Ha   2024-05-28  1120  	mult = FIELD_GET(SW_AGE_CNT_M, value);
1af487480fe750 Tristram Ha   2024-05-28  1121  	if (mult > 0) {
1af487480fe750 Tristram Ha   2024-05-28  1122  		/* Try to use the same multiplier already in the register. */
1af487480fe750 Tristram Ha   2024-05-28  1123  		min = secs / mult;
1af487480fe750 Tristram Ha   2024-05-28  1124  		if (min <= 0xff && min * mult == secs)
1af487480fe750 Tristram Ha   2024-05-28  1125  			return ksz_write8(dev, REG_SW_LUE_CTRL_3, min);
1af487480fe750 Tristram Ha   2024-05-28  1126  	}
2c119d9982b1ab Arun Ramadoss 2022-09-07  1127  
1af487480fe750 Tristram Ha   2024-05-28  1128  	/* Return error if too large. */
1af487480fe750 Tristram Ha   2024-05-28  1129  	if (secs > 7 * 0xff)
1af487480fe750 Tristram Ha   2024-05-28  1130  		return -EINVAL;
1af487480fe750 Tristram Ha   2024-05-28  1131  
1af487480fe750 Tristram Ha   2024-05-28  1132  	/* Find out which combination of multiplier * value results in a timer
1af487480fe750 Tristram Ha   2024-05-28  1133  	 * value close to the specified timer value.
1af487480fe750 Tristram Ha   2024-05-28  1134  	 */
1af487480fe750 Tristram Ha   2024-05-28  1135  	first = (secs + 0xfe) / 0xff;
1af487480fe750 Tristram Ha   2024-05-28  1136  	for (i = first; i <= 7; i++) {
1af487480fe750 Tristram Ha   2024-05-28  1137  		min = secs / i;
1af487480fe750 Tristram Ha   2024-05-28  1138  		diff[i] = secs - i * min;
1af487480fe750 Tristram Ha   2024-05-28  1139  		if (!diff[i]) {
1af487480fe750 Tristram Ha   2024-05-28  1140  			i++;
1af487480fe750 Tristram Ha   2024-05-28  1141  			break;
1af487480fe750 Tristram Ha   2024-05-28  1142  		}
1af487480fe750 Tristram Ha   2024-05-28  1143  	}
1af487480fe750 Tristram Ha   2024-05-28  1144  
1af487480fe750 Tristram Ha   2024-05-28  1145  	last = i;
1af487480fe750 Tristram Ha   2024-05-28  1146  	min = 0xff;
1af487480fe750 Tristram Ha   2024-05-28  1147  	for (i = last - 1; i >= first; i--) {
1af487480fe750 Tristram Ha   2024-05-28  1148  		if (diff[i] < min) {
1af487480fe750 Tristram Ha   2024-05-28  1149  			data = i;
1af487480fe750 Tristram Ha   2024-05-28  1150  			min = diff[i];
1af487480fe750 Tristram Ha   2024-05-28  1151  		}
1af487480fe750 Tristram Ha   2024-05-28  1152  		if (!min)
1af487480fe750 Tristram Ha   2024-05-28  1153  			break;
1af487480fe750 Tristram Ha   2024-05-28  1154  	}
2c119d9982b1ab Arun Ramadoss 2022-09-07  1155  
1af487480fe750 Tristram Ha   2024-05-28 @1156  	if (mult != data) {
2c119d9982b1ab Arun Ramadoss 2022-09-07  1157  		value &= ~SW_AGE_CNT_M;
2c119d9982b1ab Arun Ramadoss 2022-09-07  1158  		value |= FIELD_PREP(SW_AGE_CNT_M, data);
1af487480fe750 Tristram Ha   2024-05-28  1159  		ret = ksz_write8(dev, REG_SW_LUE_CTRL_0, value);
1af487480fe750 Tristram Ha   2024-05-28  1160  		if (ret)
1af487480fe750 Tristram Ha   2024-05-28  1161  			return ret;
1af487480fe750 Tristram Ha   2024-05-28  1162  	}
2c119d9982b1ab Arun Ramadoss 2022-09-07  1163  
1af487480fe750 Tristram Ha   2024-05-28  1164  	value = secs / data;
1af487480fe750 Tristram Ha   2024-05-28  1165  	return ksz_write8(dev, REG_SW_LUE_CTRL_3, value);
2c119d9982b1ab Arun Ramadoss 2022-09-07  1166  }
2c119d9982b1ab Arun Ramadoss 2022-09-07  1167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
