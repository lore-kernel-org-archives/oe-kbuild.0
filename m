Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D613C10A8
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 12:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314124; cv=none; b=rrOebMyLIIfDfYRSJx7zf9ANWs8OHOwhvcjioyt9zCrhQdEYlZhuMBRS5YEAw4yvYu8jeMwd2UGGru76ejw//GXwMwwSSWKz6tzQ3nFQB4nZa/SsOc5SyMpUelcIvpDnAvOHfo+Od2Lh2ddRwwHovePJe+iiZhHjFEjpyN/jzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314124; c=relaxed/simple;
	bh=HqoqpbTaYRL5JgIeQZfixWCQyY/zRr/1vVZpwdvbBZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rTZvSHj46BgoAWkktm5G5nKA6K917FtmNOKgl0BJaOO3qY4XeTH91Cy92cujM70Sa40RjD2pIHS011SQsSkxzXF/9hG1kDKVDZi3L3b1WODO3OabeKqufMFCKp/ZXVxddJXBU20+NyRhujpQ3kJUk8ElxaCGaj8hx7JB1WKxVQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsgPru6w; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsgPru6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787314119; x=1818850119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HqoqpbTaYRL5JgIeQZfixWCQyY/zRr/1vVZpwdvbBZE=;
  b=bsgPru6wkaxuwKy82iPXxRKyRWGzZqcyZfHtNe53wEufu486IxUEv+PN
   0JqYze5hVrPWREORS7c8eCGxdjeQdsWK+vM7WC7bk6tkmjDY58q/1kjYv
   d8jwYY4OumJXh+fQk6c2uSZZK2CKI1uKHZ7bVc4IpqB5OIo/TPu8dcc1K
   ToWaNDpWxuyzW7ZsZmUYvbjFS6f8PJrEHdTyn8x+sDEKl8Po1houB5AXl
   SKHXo1ZD7Tz6beAmoBAyvUe5rfWkPHuK1Zsnz30hOcTSTAYTe2OxZk2K0
   +nbh2AMckE7BeMrCI5UfWJOE61b1liAAg7G2MqEhZM4q1yIeUY+hcrN9d
   Q==;
X-CSE-ConnectionGUID: 7A8AMnQ5RyCYGqnmWlbRCg==
X-CSE-MsgGUID: l2dwJPhxT6ih+ijyI0phpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87921974"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87921974"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 05:08:36 -0700
X-CSE-ConnectionGUID: 0iYpzyd8QmKnvFk0lJpC2w==
X-CSE-MsgGUID: 0cyzzquZRiydoF3Ni4q/4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="268261593"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Aug 2026 05:08:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxO2y-00000000prB-28eD;
	Fri, 21 Aug 2026 12:08:32 +0000
Date: Fri, 21 Aug 2026 20:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] ASoC: tas2783-sdw: add firmware download status check
Message-ID: <202608211928.Mf2dYDwX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260813021450.1897-1-baojun.xu@ti.com>
References: <20260813021450.1897-1-baojun.xu@ti.com>
TO: Baojun Xu <baojun.xu@ti.com>
TO: broonie@kernel.org
CC: tiwai@suse.de
CC: andriy.shevchenko@linux.intel.com
CC: 13916275206@139.com
CC: alsa-devel@alsa-project.org
CC: shenghao-ding@ti.com
CC: baojun.xu@ti.com
CC: linux-sound@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: k-yi@ti.com
CC: henry.lo@ti.com
CC: robinchen@ti.com
CC: niranjan.hy@ti.com
CC: pin-hao.huang@hp.com
CC: Syed.SabaKareem@amd.com

Hi Baojun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master next-20260820]
[cannot apply to v7.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baojun-Xu/ASoC-tas2783-sdw-add-firmware-download-status-check/20260813-101450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260813021450.1897-1-baojun.xu%40ti.com
patch subject: [PATCH v2] ASoC: tas2783-sdw: add firmware download status check
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-r061-20260821 (https://download.01.org/0day-ci/archive/20260821/202608211928.Mf2dYDwX-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211928.Mf2dYDwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608211928.Mf2dYDwX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2783-sdw.c:1238:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1238 |         if (val == 0x20) {
         |             ^~~~~~~~~~~
   sound/soc/codecs/tas2783-sdw.c:1253:7: note: uninitialized use occurs here
    1253 |         if (!ret) {
         |              ^~~
   sound/soc/codecs/tas2783-sdw.c:1238:2: note: remove the 'if' if its condition is always true
    1238 |         if (val == 0x20) {
         |         ^~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2783-sdw.c:1231:9: note: initialize the variable 'ret' to silence this warning
    1231 |         s32 ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +1238 sound/soc/codecs/tas2783-sdw.c

e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1226  
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1227  static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1228  {
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1229  	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
2af7676ead60e3a Baojun Xu           2026-08-13  1230  	unsigned int val;
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1231  	s32 ret;
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1232  
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1233  	if (tas_dev->hw_init)
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1234  		return 0;
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1235  
2af7676ead60e3a Baojun Xu           2026-08-13  1236  	regmap_read(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 7), &val);
2af7676ead60e3a Baojun Xu           2026-08-13  1237  	/* Check if the AMP is in reset status. */
2af7676ead60e3a Baojun Xu           2026-08-13 @1238  	if (val == 0x20) {
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1239  		tas_dev->fw_dl_success = false;
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1240  
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1241  		ret = regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1242  		if (ret) {
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1243  			dev_err(dev, "sw reset failed, err=%d", ret);
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1244  			return ret;
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1245  		}
2af7676ead60e3a Baojun Xu           2026-08-13  1246  		fsleep(2200);
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1247  
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1248  		tas_dev->fw_use_fallback = false;
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1249  		ret = tas_fw_load(tas_dev, slave);
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1250  		if (!ret && tas_dev->fw_use_fallback)
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1251  			ret = tas_fw_load(tas_dev, slave);
2af7676ead60e3a Baojun Xu           2026-08-13  1252  	}
e26bb459d0f3dad Bartosz Juraszewski 2026-06-22  1253  	if (!ret) {
ca8f3611dcf8548 Niranjan H Y        2025-12-15  1254  		if (tas_dev->sa_func_data)
ca8f3611dcf8548 Niranjan H Y        2025-12-15  1255  			ret = sdca_regmap_write_init(dev, tas_dev->regmap,
ca8f3611dcf8548 Niranjan H Y        2025-12-15  1256  						     tas_dev->sa_func_data);
ca8f3611dcf8548 Niranjan H Y        2025-12-15  1257  		else
4cc9bd8d7b32d59 Niranjan H Y        2025-09-12  1258  			ret = regmap_multi_reg_write(tas_dev->regmap, tas2783_init_seq,
4cc9bd8d7b32d59 Niranjan H Y        2025-09-12  1259  						     ARRAY_SIZE(tas2783_init_seq));
2af7676ead60e3a Baojun Xu           2026-08-13  1260  		/* Re-active AMP after resume. */
2af7676ead60e3a Baojun Xu           2026-08-13  1261  		regmap_write(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 2), 0);
ca8f3611dcf8548 Niranjan H Y        2025-12-15  1262  		if (ret)
ca8f3611dcf8548 Niranjan H Y        2025-12-15  1263  			dev_err(tas_dev->dev,
ca8f3611dcf8548 Niranjan H Y        2025-12-15  1264  				"init writes failed, err=%d", ret);
ca8f3611dcf8548 Niranjan H Y        2025-12-15  1265  		else
4cc9bd8d7b32d59 Niranjan H Y        2025-09-12  1266  			tas_dev->hw_init = true;
4cc9bd8d7b32d59 Niranjan H Y        2025-09-12  1267  	}
4cc9bd8d7b32d59 Niranjan H Y        2025-09-12  1268  
4cc9bd8d7b32d59 Niranjan H Y        2025-09-12  1269  	return ret;
4cc9bd8d7b32d59 Niranjan H Y        2025-09-12  1270  }
4cc9bd8d7b32d59 Niranjan H Y        2025-09-12  1271  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
