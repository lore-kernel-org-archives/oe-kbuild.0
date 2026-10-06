Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF263BE168
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276832; cv=none; b=BsvaT1L9576gqmpbVoqTWdSDz08RSI7PnSqAjNTarabu0demEq50jt2fsihO7Sl0W5so4/Ciz+doXER7sDJHTP7PuEbHPnv1u9HaGyOjLw82NlyNPqTp1Xo8VesdUbiBQjRl9AzxZP9TOWFrFxrNtGUVcR/cGas7Uxm4pk8ryN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276832; c=relaxed/simple;
	bh=3L6/4CqXH6Psdnl7+Ng3bXCK9bqNVlBLwcfWZCm4XFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k76nChDNWWOVZDrg8GFu66OS6XLRgmFlRdOJeYQk0zksh2CYs16eF6Hwa/vlJlwiaq2Iw+wGD2ciXkvbUaspx1J1V8xfrBsDwZv5O6A/tZ/3r1NJ0St5ryTDPMRxYkrszV8BT3qJwnduYel4XT5rrnkb+c+yhFlQ0daUg/SOY+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cmr3tCzc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cmr3tCzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791276830; x=1822812830;
  h=date:from:to:cc:subject:message-id;
  bh=3L6/4CqXH6Psdnl7+Ng3bXCK9bqNVlBLwcfWZCm4XFc=;
  b=Cmr3tCzc3LCso/uZplZYu2AkWPCqU+gVJCqT+bUhfGXb0unYOPCvbBID
   gmLxu4nF1hUGB358J+R7FAlSpIimInXniEccFE7qB2kDktL3xcjmqAnlt
   hw6zR/YOI1TFTJbIg5vmLEqakRahuaKhVz4XqknQWdOrTDutSfYHgRKGQ
   MkZaF4OvXFZ8oE6TwZmHtwbj19Wp0f6PrICyvJOIVHMFz1aFdsxUYqedL
   xGdInCnqbZB3FcG4gWP/RxOZpGabKC3EVQ4Y2rKFGEXUwZn5IZOgM8QYC
   yUIfbY0XhgWpGMaT55y4nnujfwt7gB0VTi9tTxBGv8801ZpP1P8m4hR75
   A==;
X-CSE-ConnectionGUID: OJuCog6MRtSqASsnIEE8dw==
X-CSE-MsgGUID: EtncRk/wQ3aIC4beuiqfcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="95777337"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="95777337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:53:48 -0700
X-CSE-ConnectionGUID: IgMlxE7WSw6CT3Jp2+H/Zg==
X-CSE-MsgGUID: 3mLBLQRBTbqvSueAWlTDyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="277203969"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Oct 2026 01:53:46 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE0vg-0000000010U-19Gc;
	Tue, 06 Oct 2026 08:53:44 +0000
Date: Tue, 06 Oct 2026 10:53:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linuxtv-media-pending:next 23/25]
 drivers/media/i2c/maxim-serdes/max9296a.c:337 max9296a_log_phy_status() warn:
 subtract is higher precedence than shift
Message-ID: <202610061033.FttmuZAj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   ee2e9bf41d3e78b85486986cb861305576c6fe21
commit: 64f76d5d9fd17a5661d7e5eab2aa99218db60d0b [23/25] media: i2c: maxim-serdes: add MAX9296A driver
:::::: branch date: 21 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-r2201-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061033.FttmuZAj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610061033.FttmuZAj-lkp@intel.com/

smatch warnings:
drivers/media/i2c/maxim-serdes/max9296a.c:337 max9296a_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:337 max9296a_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:337 max9296a_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:337 max9296a_log_phy_status() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:691 max9296a_set_pipe_remap() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:691 max9296a_set_pipe_remap() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:691 max9296a_set_pipe_remap() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:691 max9296a_set_pipe_remap() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:758 max96714_set_pipe_stream_id() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:758 max96714_set_pipe_stream_id() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:758 max96714_set_pipe_stream_id() warn: subtract is higher precedence than shift
drivers/media/i2c/maxim-serdes/max9296a.c:758 max96714_set_pipe_stream_id() warn: subtract is higher precedence than shift

vim +337 drivers/media/i2c/maxim-serdes/max9296a.c

64f76d5d9fd17a Cosmin Tanislav 2026-09-30  321  
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  322  static int max9296a_log_phy_status(struct max_des *des,
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  323  				   struct max_des_phy *phy)
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  324  {
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  325  	struct max9296a_priv *priv = des_to_priv(des);
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  326  	unsigned int index = phy->index;
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  327  	unsigned int val;
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  328  	int ret;
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  329  
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  330  	if (!priv->info->supports_phy_log)
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  331  		return 0;
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  332  
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  333  	ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY18, &val);
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  334  	if (ret)
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  335  		return ret;
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  336  
64f76d5d9fd17a Cosmin Tanislav 2026-09-30 @337  	dev_info(priv->dev, "\tcsi2_pkt_cnt: %lu\n",
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  338  		 field_get(MAX9296A_MIPI_PHY18_CSI2_TX_PKT_CNT(index), val));
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  339  
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  340  	ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY20(index), &val);
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  341  	if (ret)
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  342  		return ret;
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  343  
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  344  	dev_info(priv->dev, "\tphy_pkt_cnt: %u\n", val);
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  345  
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  346  	return 0;
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  347  }
64f76d5d9fd17a Cosmin Tanislav 2026-09-30  348  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
