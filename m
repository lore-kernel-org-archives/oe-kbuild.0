Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6472E03EA
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088941; cv=none; b=uo0KAfXp0TDvHwGfUBkVoSrYRGwtObNxbBAusEhn7zvmCYjGQorxrqrDg346pVmePUnTw2noaNBy9Ux70hNAlJutJezPRoWzkYgYuj/LmCyu1CbD8BZ1DtHvmovqdDuhBkYDDVHITkFtseNGOpUb8XYGJiZqR9xDsdoY5TnXBmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088941; c=relaxed/simple;
	bh=o5ZBX9qOGpnb1ml+CzYM2RFODpcnJAKJmwhx+tOvAvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i3INPPQmggaw50QnClpaBpGBFpiiBav5+rQedeMFRQyvJ13NH0Bb6dxBTUq/4lcgRPZxQzLc3y6pvCrJ6LSiJlyAj7WcaSjMrs4tJmiPodTyfzZvQ7j4iBCA9M0wRhxAON6j3VaEfapgZt6t0Jf314ddEBB4VNa+69jWNB/R6p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMFU1lSW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMFU1lSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755088940; x=1786624940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5ZBX9qOGpnb1ml+CzYM2RFODpcnJAKJmwhx+tOvAvE=;
  b=CMFU1lSWUWeY7knEAhP7QF+oztKW/H6J3iGcfDZNYFXFgP2m6Zsjzfch
   5o91u+9Ti8EEGOAxTveadQGqZtbWsuPY7le35Ng+q7t9yYJ9afPkaGvct
   TDJdR5IMh7kLtlLEY5/XRwFw0aVkXc3IQ5E5L8PiNln/CmXy2BxNGW3IY
   myCnW4uQM9Z9CasY2fwkdkcRsxdOBypj4Z4tKFGTl0q+8BDnwmKwciYF5
   JzjWX1XZ7L/vU5RUbX/7CWSMo+veTMNxo3Pia60L0yVBVSNIULwo2mPML
   FCF3FxRuTF0AC5OEyirT43rmiqQLGZpgiAfVgEsbsbxe16J8p/W7m3Dc+
   A==;
X-CSE-ConnectionGUID: 7nmA0uHrS92AsVQ/fM+MYA==
X-CSE-MsgGUID: 2/40asfXQ7KKRc4Olt9wxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68834760"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="68834760"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 05:42:18 -0700
X-CSE-ConnectionGUID: vxDy6ZVOQi6+hkHZDk01hA==
X-CSE-MsgGUID: S4p4zCfEQ/6lbPs53Y/dAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171787860"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2025 05:42:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umAo2-0009tc-1x;
	Wed, 13 Aug 2025 12:42:14 +0000
Date: Wed, 13 Aug 2025 20:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
Message-ID: <202508132044.XYcvSpm4-lkp@intel.com>
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
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Alexey Klimov <alexey.klimov@linaro.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: Sean Wang <sean.wang@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Paul Cercueil <paul@crapouillou.net>
TO: Kees Cook <kees@kernel.org>
TO: Andy Shevchenko <andy@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Hildenbrand <david@redhat.com>
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
TO: "Liam R. Howlett" <Liam.Howlett@oracle.com>
TO: Vlastimil Babka <vbabka@suse.cz>
TO: Mike Rapoport <rppt@kernel.org>
TO: Suren Baghdasaryan <surenb@google.com>
TO: Michal Hocko <mhocko@suse.com>
TO: Dong Aisheng <aisheng.dong@nxp.com>
TO: Fabio Estevam <festevam@gmail.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Jacky Bai <ping.bai@nxp.com>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: NXP S32 Linux Team <s32@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Tony Lindgren <tony@atomide.com>
TO: Haojian Zhuang <haojian.zhuang@linaro.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/devres-provide-devm_kmemdup_const/20250812-170336
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64%40linaro.org
patch subject: [PATCH v4 12/15] pinctrl: allow to mark pin functions as requestable GPIOs
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: um-randconfig-r072-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132044.XYcvSpm4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508132044.XYcvSpm4-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinmux.c:96 pinmux_can_be_used_for_gpio() warn: variable dereferenced before check 'desc' (see line 92)

vim +/desc +96 drivers/pinctrl/pinmux.c

1e2082b5207217 Stephen Warren      2012-03-02   77  
472a61e777fe78 Stefan Wahren       2019-08-14   78  /**
472a61e777fe78 Stefan Wahren       2019-08-14   79   * pinmux_can_be_used_for_gpio() - check if a specific pin
472a61e777fe78 Stefan Wahren       2019-08-14   80   *	is either muxed to a different function or used as gpio.
472a61e777fe78 Stefan Wahren       2019-08-14   81   *
d340351f8168d2 Lee Jones           2020-07-13   82   * @pctldev: the associated pin controller device
472a61e777fe78 Stefan Wahren       2019-08-14   83   * @pin: the pin number in the global pin space
472a61e777fe78 Stefan Wahren       2019-08-14   84   *
472a61e777fe78 Stefan Wahren       2019-08-14   85   * Controllers not defined as strict will always return true,
472a61e777fe78 Stefan Wahren       2019-08-14   86   * menaning that the gpio can be used.
472a61e777fe78 Stefan Wahren       2019-08-14   87   */
7cc4e6b0e4ddf6 Andy Shevchenko     2023-11-29   88  bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
472a61e777fe78 Stefan Wahren       2019-08-14   89  {
472a61e777fe78 Stefan Wahren       2019-08-14   90  	struct pin_desc *desc = pin_desc_get(pctldev, pin);
472a61e777fe78 Stefan Wahren       2019-08-14   91  	const struct pinmux_ops *ops = pctldev->desc->pmxops;
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  @92  	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12   93  	bool func_is_gpio = false;
472a61e777fe78 Stefan Wahren       2019-08-14   94  
472a61e777fe78 Stefan Wahren       2019-08-14   95  	/* Can't inspect pin, assume it can be used */
6ba2fd391ac58c Alexandre Torgue    2019-12-04  @96  	if (!desc || !ops)
472a61e777fe78 Stefan Wahren       2019-08-14   97  		return true;
472a61e777fe78 Stefan Wahren       2019-08-14   98  
5a3e85c3c397c7 Mukesh Ojha         2024-10-15   99  	guard(mutex)(&desc->mux_lock);
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  100  	if (mux_setting && ops->function_is_gpio)
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  101  		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  102  
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  103  	if (ops->strict && desc->mux_usecount && !func_is_gpio)
472a61e777fe78 Stefan Wahren       2019-08-14  104  		return false;
472a61e777fe78 Stefan Wahren       2019-08-14  105  
472a61e777fe78 Stefan Wahren       2019-08-14  106  	return !(ops->strict && !!desc->gpio_owner);
472a61e777fe78 Stefan Wahren       2019-08-14  107  }
472a61e777fe78 Stefan Wahren       2019-08-14  108  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
