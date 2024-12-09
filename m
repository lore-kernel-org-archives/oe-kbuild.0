Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C643AA8
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717821; cv=none; b=ahcnQbhTe24EQ9UFxwdFeVbvGs3vmUm2NpAWvCuIygQGicvMWYWzE7BTt56eWX9LE2OE0VT3Yj90gKiktX0kQcH7Gia9myRlbHDn4oWxAdPf7heObEQV//dG/Ui5YM6lMsf41Hf245KZsjKokZ+C3Shdaa7nRcD/+CPhqQZv0SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717821; c=relaxed/simple;
	bh=kuiQoG97j+CjGl2ooZ5sf62hJjkv9SKF/0OIScvYYZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huTqvLtKXzW3tUgdXSVlgMcnUOQK5Sv49U6nZJXxsW9bLHR8VOh3WxFxXNsPI9MhuiMWXXWx0nNkEVxeFIkUcr3ZRUqjdsLcEBu3Okh1rjlJfYhJu8bEQMrBMNpxPemmMeaFaFEfVPeWojUSnIhHUmPW7uJ9JvFXn0hmuu6TGXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqpwXX/x; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqpwXX/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717820; x=1765253820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kuiQoG97j+CjGl2ooZ5sf62hJjkv9SKF/0OIScvYYZE=;
  b=EqpwXX/xmgeU3z4lsNjINflW0luYb4Y0/mNDbC4leZ7Bch0teUNiDasK
   6ATUCogqXvIjKrWHCajoo7A+KIX2g1QVbvz8KfbCQ+rj1GAfdZVXVOJzl
   8J5KpS2DFg6ftI24ThwPGdUADuG7+qgcPXTDWnOUUf8x0k29MSmJuZDeu
   YKkMwNnUUfleIqrDpT/3U69jPfSne9W3eLJT29eg+uX27ALATG+HG6cCG
   foPwWMtf5W8FGFR7C9wUCc0SED4Vkun+KQ4iXycNMQjh1c3K52vYQA5oa
   E+YSJTSc8sT6ObFdwUEh7syLhOWQA3uK03jCWgC59a7Y7MO+aFCfSmZNc
   A==;
X-CSE-ConnectionGUID: YxC3HO2TSUC/rG5u/f6Y/A==
X-CSE-MsgGUID: ERzPaUo9TK6C7Q8ANbHGFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34235962"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34235962"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:16:10 -0800
X-CSE-ConnectionGUID: N/KaVUH/TjWnmflC7yV8/w==
X-CSE-MsgGUID: VZMuc3kmRd2GpN0cmGvwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94823958"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2024 20:16:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVBm-0003p9-1C;
	Mon, 09 Dec 2024 04:16:06 +0000
Date: Mon, 9 Dec 2024 12:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/exynos/exynos_mixer.c:1322 exynos_mixer_resume()
 warn: 'ctx->hdmi' from clk_prepare_enable() not released on lines:
 1308,1317.
Message-ID: <202412071907.QYwoBgnU-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: xtensa-randconfig-r072-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071907.QYwoBgnU-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071907.QYwoBgnU-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/exynos/exynos_mixer.c:1322 exynos_mixer_resume() warn: 'ctx->hdmi' from clk_prepare_enable() not released on lines: 1308,1317.
drivers/gpu/drm/exynos/exynos_mixer.c:1322 exynos_mixer_resume() warn: 'ctx->mixer' from clk_prepare_enable() not released on lines: 1300,1308,1317.
drivers/gpu/drm/exynos/exynos_mixer.c:1322 exynos_mixer_resume() warn: 'ctx->vp' from clk_prepare_enable() not released on lines: 1317.

vim +1322 drivers/gpu/drm/exynos/exynos_mixer.c

ccf034a9adb7aa Gustavo Padovan 2015-09-04  1282  
e0fea7e7b63108 Arnd Bergmann   2015-11-17  1283  static int __maybe_unused exynos_mixer_resume(struct device *dev)
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1284  {
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1285  	struct mixer_context *ctx = dev_get_drvdata(dev);
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1286  	int ret;
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1287  
524c59f1b79885 Andrzej Hajda   2017-09-29  1288  	ret = clk_prepare_enable(ctx->mixer);
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1289  	if (ret < 0) {
6f83d20838c099 Inki Dae        2019-04-15  1290  		DRM_DEV_ERROR(ctx->dev,
6f83d20838c099 Inki Dae        2019-04-15  1291  			      "Failed to prepare_enable the mixer clk [%d]\n",
6f83d20838c099 Inki Dae        2019-04-15  1292  			      ret);
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1293  		return ret;
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1294  	}
524c59f1b79885 Andrzej Hajda   2017-09-29  1295  	ret = clk_prepare_enable(ctx->hdmi);
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1296  	if (ret < 0) {
6f83d20838c099 Inki Dae        2019-04-15  1297  		DRM_DEV_ERROR(dev,
6f83d20838c099 Inki Dae        2019-04-15  1298  			      "Failed to prepare_enable the hdmi clk [%d]\n",
6f83d20838c099 Inki Dae        2019-04-15  1299  			      ret);
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1300  		return ret;
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1301  	}
adeb6f44858c7b Tobias Jakobi   2016-09-22  1302  	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
524c59f1b79885 Andrzej Hajda   2017-09-29  1303  		ret = clk_prepare_enable(ctx->vp);
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1304  		if (ret < 0) {
6f83d20838c099 Inki Dae        2019-04-15  1305  			DRM_DEV_ERROR(dev,
6f83d20838c099 Inki Dae        2019-04-15  1306  				      "Failed to prepare_enable the vp clk [%d]\n",
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1307  				      ret);
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1308  			return ret;
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1309  		}
adeb6f44858c7b Tobias Jakobi   2016-09-22  1310  		if (test_bit(MXR_BIT_HAS_SCLK, &ctx->flags)) {
524c59f1b79885 Andrzej Hajda   2017-09-29  1311  			ret = clk_prepare_enable(ctx->sclk_mixer);
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1312  			if (ret < 0) {
6f83d20838c099 Inki Dae        2019-04-15  1313  				DRM_DEV_ERROR(dev,
6f83d20838c099 Inki Dae        2019-04-15  1314  					   "Failed to prepare_enable the " \
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1315  					   "sclk_mixer clk [%d]\n",
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1316  					   ret);
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1317  				return ret;
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1318  			}
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1319  		}
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1320  	}
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1321  
ccf034a9adb7aa Gustavo Padovan 2015-09-04 @1322  	return 0;
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1323  }
ccf034a9adb7aa Gustavo Padovan 2015-09-04  1324  

:::::: The code at line 1322 was first introduced by commit
:::::: ccf034a9adb7aaca2ee8e5433f80191090f7d923 drm/exynos: add pm_runtime to Mixer

:::::: TO: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
:::::: CC: Inki Dae <daeinki@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
