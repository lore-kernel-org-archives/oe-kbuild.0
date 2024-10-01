Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB051AC422
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Oct 2024 03:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727754478; cv=none; b=p5EXZxBs1p9pxaAxkvEHAYym3PDhbNsJNz+0eR3VhSTWFFc18rYZACBVeAgw1uq8IXSgQxzwiTSZNSFJIHt2YDUrZqPdsy9nmP13h+5gL5ZAUVVZ+VPV3ab5Vq/xxk4r6vsDvrCVo6JW+9Me6iIEkNV3ye+tTES1/rnM65/Tkfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727754478; c=relaxed/simple;
	bh=+13Dtvul7q7WqkW7CkClKywy4IfGfZ7+iysiShiU2tU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AXoikfVSxp+Mt3Vc0ykdC9PDd0/BQWw8YhZojJFDTiuAB/GjpcHn4a4Xk+OHOUwCgLjOAmi+R9qpigUR1vJvBV77lvxlMeffR9WfF8raiQ73miM7H32kpplhXUpRJHzSCjJS11PMmWjRrx5bOC65RLC19N9DM1kO4K3GipH7eKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npuQ4WuK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npuQ4WuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727754476; x=1759290476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+13Dtvul7q7WqkW7CkClKywy4IfGfZ7+iysiShiU2tU=;
  b=npuQ4WuKkQ/ft5Wpznkr2xlS2oPjj3KTk+LNoD80PseqRqZlUSCl5y1R
   mbPRm9OubuaYh7NKPCgm4EUK2KsNAkkxK1Xy/SvKooUeqUzB8+T95itNL
   MfzpZzNv0GEc7fPD++hyDaGG9GsnpZa3o78sV2cBerC34w7+CKFfNM8pW
   cs6CgXhQImmk/AFczDO/DeTPM0rQkc77lN57A3iaYYZGpR8tCUuGRUIO+
   rBhMPiOaqCokX9uhzIRTgALg3aAZz0bcecZzG2ZaUttBJPspafgr/bEWn
   NaF6Q71ZfPu0b8EedbdsvoJAvxhxF1QMRlXxgcJZ8dEKqIRwJ/h2FYnp9
   A==;
X-CSE-ConnectionGUID: qE6/8WowSeCF5CU3Sn+GBg==
X-CSE-MsgGUID: +QsVXLErTFuSouQEa9UyTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26997573"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26997573"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 20:47:55 -0700
X-CSE-ConnectionGUID: yZICZ+kJSRa0A1oCUNy+Ew==
X-CSE-MsgGUID: coUaO8dpSsKJd2c/hTjDiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73186906"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2024 20:47:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svTrZ-000QD5-25;
	Tue, 01 Oct 2024 03:47:49 +0000
Date: Tue, 1 Oct 2024 11:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-ci:filekCZcLQ 7/13] sound/soc/codecs/rt1320-sdw.c:564
 rt1320_load_mcu_patch() warn: impossible condition '(addr > 4295491583) =>
 (0-u32max > 4295491583)'
Message-ID: <202410011117.3dImGD4j-lkp@intel.com>
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
TO: Shuming Fan <shumingf@realtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filekCZcLQ
head:   4649cbd97fdae5069e9a71cd7669b62b90e03669
commit: d72498fad93abf1817c4998d172a3d7f98f76bbe [7/13] ASoC: rt1320: reads patch code from firmware file
:::::: branch date: 6 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-141-20240930 (https://download.01.org/0day-ci/archive/20241001/202410011117.3dImGD4j-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410011117.3dImGD4j-lkp@intel.com/

smatch warnings:
sound/soc/codecs/rt1320-sdw.c:564 rt1320_load_mcu_patch() warn: impossible condition '(addr > 4295491583) => (0-u32max > 4295491583)'

vim +564 sound/soc/codecs/rt1320-sdw.c

f465d10cd73188 Shuming Fan 2024-09-02  527  
d72498fad93abf Shuming Fan 2024-09-14  528  /*
d72498fad93abf Shuming Fan 2024-09-14  529   * The 'patch code' is written to the patch code area.
d72498fad93abf Shuming Fan 2024-09-14  530   * The patch code area is used for SDCA register expansion flexibility.
d72498fad93abf Shuming Fan 2024-09-14  531   */
d72498fad93abf Shuming Fan 2024-09-14  532  static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
d72498fad93abf Shuming Fan 2024-09-14  533  {
d72498fad93abf Shuming Fan 2024-09-14  534  	struct sdw_slave *slave = rt1320->sdw_slave;
d72498fad93abf Shuming Fan 2024-09-14  535  	const struct firmware *patch;
d72498fad93abf Shuming Fan 2024-09-14  536  	const char *filename;
d72498fad93abf Shuming Fan 2024-09-14  537  	unsigned int addr, val;
d72498fad93abf Shuming Fan 2024-09-14  538  	const unsigned char *ptr;
d72498fad93abf Shuming Fan 2024-09-14  539  	int ret, i;
d72498fad93abf Shuming Fan 2024-09-14  540  
d72498fad93abf Shuming Fan 2024-09-14  541  	if (rt1320->version_id <= RT1320_VB)
d72498fad93abf Shuming Fan 2024-09-14  542  		filename = RT1320_VAB_MCU_PATCH;
d72498fad93abf Shuming Fan 2024-09-14  543  	else
d72498fad93abf Shuming Fan 2024-09-14  544  		filename = RT1320_VC_MCU_PATCH;
d72498fad93abf Shuming Fan 2024-09-14  545  
d72498fad93abf Shuming Fan 2024-09-14  546  	/* load the patch code here */
d72498fad93abf Shuming Fan 2024-09-14  547  	ret = request_firmware(&patch, filename, &slave->dev);
d72498fad93abf Shuming Fan 2024-09-14  548  	if (ret) {
d72498fad93abf Shuming Fan 2024-09-14  549  		dev_err(&slave->dev, "%s: Failed to load %s firmware", __func__, filename);
d72498fad93abf Shuming Fan 2024-09-14  550  		regmap_write(rt1320->regmap, 0xc598, 0x00);
d72498fad93abf Shuming Fan 2024-09-14  551  		regmap_write(rt1320->regmap, 0x10007000, 0x67);
d72498fad93abf Shuming Fan 2024-09-14  552  		regmap_write(rt1320->regmap, 0x10007001, 0x80);
d72498fad93abf Shuming Fan 2024-09-14  553  		regmap_write(rt1320->regmap, 0x10007002, 0x00);
d72498fad93abf Shuming Fan 2024-09-14  554  		regmap_write(rt1320->regmap, 0x10007003, 0x00);
d72498fad93abf Shuming Fan 2024-09-14  555  	} else {
d72498fad93abf Shuming Fan 2024-09-14  556  		ptr = (const unsigned char *)patch->data;
d72498fad93abf Shuming Fan 2024-09-14  557  		if ((patch->size % 8) == 0) {
d72498fad93abf Shuming Fan 2024-09-14  558  			for (i = 0; i < patch->size; i += 8) {
d72498fad93abf Shuming Fan 2024-09-14  559  				addr = (ptr[i] & 0xff) | (ptr[i + 1] & 0xff) << 8 |
d72498fad93abf Shuming Fan 2024-09-14  560  					(ptr[i + 2] & 0xff) << 16 | (ptr[i + 3] & 0xff) << 24;
d72498fad93abf Shuming Fan 2024-09-14  561  				val = (ptr[i + 4] & 0xff) | (ptr[i + 5] & 0xff) << 8 |
d72498fad93abf Shuming Fan 2024-09-14  562  					(ptr[i + 6] & 0xff) << 16 | (ptr[i + 7] & 0xff) << 24;
d72498fad93abf Shuming Fan 2024-09-14  563  
d72498fad93abf Shuming Fan 2024-09-14 @564  				if (addr > 0x10007ffff || addr < 0x10007000) {
d72498fad93abf Shuming Fan 2024-09-14  565  					dev_err(&slave->dev, "%s: the address 0x%x is wrong", __func__, addr);
d72498fad93abf Shuming Fan 2024-09-14  566  					goto _exit_;
d72498fad93abf Shuming Fan 2024-09-14  567  				}
d72498fad93abf Shuming Fan 2024-09-14  568  				if (val > 0xff) {
d72498fad93abf Shuming Fan 2024-09-14  569  					dev_err(&slave->dev, "%s: the value 0x%x is wrong", __func__, val);
d72498fad93abf Shuming Fan 2024-09-14  570  					goto _exit_;
d72498fad93abf Shuming Fan 2024-09-14  571  				}
d72498fad93abf Shuming Fan 2024-09-14  572  				regmap_write(rt1320->regmap, addr, val);
d72498fad93abf Shuming Fan 2024-09-14  573  			}
d72498fad93abf Shuming Fan 2024-09-14  574  		}
d72498fad93abf Shuming Fan 2024-09-14  575  _exit_:
d72498fad93abf Shuming Fan 2024-09-14  576  		release_firmware(patch);
d72498fad93abf Shuming Fan 2024-09-14  577  	}
d72498fad93abf Shuming Fan 2024-09-14  578  }
d72498fad93abf Shuming Fan 2024-09-14  579  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
