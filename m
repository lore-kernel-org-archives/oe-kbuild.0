Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C520281741
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Jun 2025 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051970; cv=none; b=alc14HggebALWAdfD7S1eqHEr6JEngU9g8F0mOK47K0bANFFSgMaGX5eH2VoyVhII0+sa8uSpMjoGAUWwIsCQWd9eEmAiiv+co7RyirVQCtzKWlz97A6a3KSNMG62HDnMdAC/jN5MUtyk7pZgrWT125fG/VVO8IfG++9yIUyPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051970; c=relaxed/simple;
	bh=5d9mrXwGKPol2PIuu1H8s8JKI/XUBuCPvViEAgmKikQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hw8A4UNnnHjMnZEV6wJTpYErNqcisZr6vspm4JQXbTQDvdFiTPQcOUbGxEifYcONz4y8M01qFoE2Ffb7zzJqhjpepiMw8aoIw+oDWAR9A4qR+T+IWEDmnsdHQnYgY4iOt3Om38xqE1SMekNrdU/aDKoNeJR2/0HfQXP10G7hFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2GOVQ4p; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2GOVQ4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749051968; x=1780587968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5d9mrXwGKPol2PIuu1H8s8JKI/XUBuCPvViEAgmKikQ=;
  b=n2GOVQ4plClU0OgeY029YHBCxLWtGqQb8b76bi9ANyFRx/75b07UYqbE
   SPYOqmELv4pr+WBiwcKKk9N7pMHFyYyg2Z+U3ODdTMQMrpaP/+EBE9Mt0
   2kwX5HbilUf1TYHU5DR3i56e8moPskrTClrH4DMkmR5pJaEQYBErMO6wd
   tARYEm8euXHVgU18CroGpEDvEivuZSpQkM4GZ4VuaZAwI9x3z3//QPW5x
   fqekUyhIx+Galyu+15+f2gtDsobxr17XKU5IbV0kg4XbvaOndu7ZrXaqL
   f8UXu/rwY6a0gZh0wmiUHk0Dwg9ON+kVZ/ZjfYy7ufLiwZSN0wo3rpXbF
   g==;
X-CSE-ConnectionGUID: SBTtzkxlQgqIXq3NJeTSng==
X-CSE-MsgGUID: 1LAlkGO5RjKFKs5i45kacQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="53770765"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="53770765"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 08:46:07 -0700
X-CSE-ConnectionGUID: lNAoFiVpR4GDsLwlNhK3rw==
X-CSE-MsgGUID: 7T6Et79rTrShj3Sb0uQG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="168387114"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2025 08:46:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMqJX-0003GD-2A;
	Wed, 04 Jun 2025 15:46:03 +0000
Date: Wed, 4 Jun 2025 23:45:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: ds90ub960: Add support for DS90UB954-Q1
Message-ID: <202506042333.FlFAp4mW-lkp@intel.com>
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
In-Reply-To: <20250523083655.3876005-3-y-abhilashchandra@ti.com>
References: <20250523083655.3876005-3-y-abhilashchandra@ti.com>
TO: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
TO: tomi.valkeinen@ideasonboard.com
TO: mchehab@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: hverkuil@xs4all.nl
CC: sakari.ailus@linux.intel.com
CC: laurent.pinchart@ideasonboard.com
CC: vaishnav.a@ti.com
CC: u-kumar1@ti.com
CC: jai.luthra@linux.dev
CC: linux-media@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: y-abhilashchandra@ti.com

Hi Yemike,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master next-20250604]
[cannot apply to robh/for-next v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yemike-Abhilash-Chandra/media-dt-bindings-ti-ds90ub960-Add-bindings-for-DS90UB954-Q1/20250523-164041
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250523083655.3876005-3-y-abhilashchandra%40ti.com
patch subject: [PATCH 2/2] media: i2c: ds90ub960: Add support for DS90UB954-Q1
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arc-randconfig-r071-20250604 (https://download.01.org/0day-ci/archive/20250604/202506042333.FlFAp4mW-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506042333.FlFAp4mW-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ds90ub960.c:5046 ub960_enable_core_hw() error: uninitialized symbol 'refclk_freq'.

vim +/refclk_freq +5046 drivers/media/i2c/ds90ub960.c

afe267f2d368f5 Tomi Valkeinen          2023-06-19  4980  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4981  static int ub960_enable_core_hw(struct ub960_data *priv)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4982  {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4983  	struct device *dev = &priv->client->dev;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4984  	u8 rev_mask;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4985  	int ret;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4986  	u8 dev_sts;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4987  	u8 refclk_freq;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4988  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4989  	ret = regulator_enable(priv->vddio);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4990  	if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4991  		return dev_err_probe(dev, ret,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4992  				     "failed to enable VDDIO regulator\n");
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4993  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4994  	ret = clk_prepare_enable(priv->refclk);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4995  	if (ret) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4996  		dev_err_probe(dev, ret, "Failed to enable refclk\n");
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4997  		goto err_disable_vddio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4998  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  4999  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5000  	if (priv->pd_gpio) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5001  		gpiod_set_value_cansleep(priv->pd_gpio, 1);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5002  		/* wait min 2 ms for reset to complete */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5003  		fsleep(2000);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5004  		gpiod_set_value_cansleep(priv->pd_gpio, 0);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5005  		/* wait min 2 ms for power up to finish */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5006  		fsleep(2000);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5007  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5008  
8f512c3113756c Tomi Valkeinen          2025-03-03  5009  	ret = ub960_reset(priv, true);
8f512c3113756c Tomi Valkeinen          2025-03-03  5010  	if (ret)
8f512c3113756c Tomi Valkeinen          2025-03-03  5011  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5012  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5013  	/* Runtime check register accessibility */
24868501a74402 Tomi Valkeinen          2025-03-03  5014  	ret = ub960_read(priv, UB960_SR_REV_MASK, &rev_mask, NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5015  	if (ret) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5016  		dev_err_probe(dev, ret, "Cannot read first register, abort\n");
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5017  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5018  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5019  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5020  	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5021  		rev_mask);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5022  
24868501a74402 Tomi Valkeinen          2025-03-03  5023  	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts, NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5024  	if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5025  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5026  
ba3bdb93947c90 Tomi Valkeinen          2024-12-06  5027  	if (priv->hw_data->is_ub9702)
24868501a74402 Tomi Valkeinen          2025-03-03  5028  		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
24868501a74402 Tomi Valkeinen          2025-03-03  5029  				 NULL);
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5030  	else if (priv->hw_data->is_ub954) {
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5031  		/* From DS90UB954-Q1 datasheet:
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5032  		 * "REFCLK_FREQ measurement is not synchronized. Value in this
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5033  		 * register should read twice and only considered valid if
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5034  		 * REFCLK_FREQ is unchanged between reads."
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5035  		 */
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5036  		unsigned long timeout = jiffies + msecs_to_jiffies(100);
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5037  
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5038  		do {
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5039  			u8 refclk_new;
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5040  
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5041  			ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_new,
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5042  					 NULL);
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5043  			if (ret)
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5044  				goto err_pd_gpio;
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5045  
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23 @5046  			if (refclk_new == refclk_freq)
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5047  				break;
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5048  			refclk_freq = refclk_new;
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5049  		} while (time_before(jiffies, timeout));
8a8ba5651f9d39 Yemike Abhilash Chandra 2025-05-23  5050  	}
ba3bdb93947c90 Tomi Valkeinen          2024-12-06  5051  	else
24868501a74402 Tomi Valkeinen          2025-03-03  5052  		ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq,
24868501a74402 Tomi Valkeinen          2025-03-03  5053  				 NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5054  	if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5055  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5056  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5057  	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5058  		!!(dev_sts & BIT(4)), refclk_freq,
a56fac44beced4 Tomi Valkeinen          2024-12-06  5059  		clk_get_rate(priv->refclk) / HZ_PER_MHZ);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5060  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5061  	/* Disable all RX ports by default */
24868501a74402 Tomi Valkeinen          2025-03-03  5062  	ret = ub960_write(priv, UB960_SR_RX_PORT_CTL, 0, NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5063  	if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5064  		goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5065  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5066  	/* release GPIO lock */
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5067  	if (priv->hw_data->is_ub9702) {
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5068  		ret = ub960_update_bits(priv, UB960_SR_RESET,
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5069  					UB960_SR_RESET_GPIO_LOCK_RELEASE,
24868501a74402 Tomi Valkeinen          2025-03-03  5070  					UB960_SR_RESET_GPIO_LOCK_RELEASE,
24868501a74402 Tomi Valkeinen          2025-03-03  5071  					NULL);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5072  		if (ret)
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5073  			goto err_pd_gpio;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5074  	}
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5075  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5076  	return 0;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5077  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5078  err_pd_gpio:
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5079  	gpiod_set_value_cansleep(priv->pd_gpio, 1);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5080  	clk_disable_unprepare(priv->refclk);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5081  err_disable_vddio:
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5082  	regulator_disable(priv->vddio);
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5083  
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5084  	return ret;
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5085  }
afe267f2d368f5 Tomi Valkeinen          2023-06-19  5086  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
