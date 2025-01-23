Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE105234
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737626453; cv=none; b=V/G83x57e6GtfM6ZfDX5SGR4JXpmH7ABNcqYWZkUjyRf2G2MJo4peghnlGl4ibGiMwj1T+waqDWy2UJOJjm6Ett7eKEWW000fepYh1IczpEO/Mmmgp94g5CSSL6yC5hTk8Y2S8SQY8Kx01KpclYULMJxGjFpJi4lzzqfNw8fugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737626453; c=relaxed/simple;
	bh=EyLyZQ2JWM2AhEoi/1+Jwozt+FEdSvuZyd9XxM7wKyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KAq0cydDBXlkgr4HCA3CDyr+vsy1EwYhqI9F6xcKlMWqlFzruoELNNcYAskd3O85mrqekJVSkHUxP5epXD4IfEw/q7SR6HzW1BUGp00uoWzV9X8/ydVLhEa3Rt7HkAI4VpzTwwS5Bd4EbmXcLl9UmPYlUtmvAlpniEVukWfcsqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+NQ4aip; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+NQ4aip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737626452; x=1769162452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EyLyZQ2JWM2AhEoi/1+Jwozt+FEdSvuZyd9XxM7wKyw=;
  b=Z+NQ4aipuQja0XffOf0TgLEKDHrrWq3XVRU4VVWRSpRnTR6Nl9FVeZaM
   ehD9w03n3eYiX77cRAvsZwh8OlGw6ZDqIdwauL30kv8SQBs0vwAqRNeMC
   /YRUP9mJboEIrkrRkELrc2QMEoLW2kihjzBSbtgVqcUY5NjDmnPo6CXm0
   ri1+AUPRBuvgrD6lgtcZ3s1p4pm9s7jLZ6MatkHMRHiVM9FRf/S0Pf+8L
   32PSxgcjTxhllGIQiT8i+Y7+oSXXXBsar0+zaRzPyHPGc/pThJmPS0uF1
   4KQqV+fSCSxKOyb9Zgpd/CVTAQIYWUpOm3OAHOg6uLBl/IW7ZLgXcSXHW
   A==;
X-CSE-ConnectionGUID: rXP0DjpSR2edApkeHNJvQQ==
X-CSE-MsgGUID: q5/D/z4JRViynsABiqe9gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="40941791"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="40941791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 02:00:51 -0800
X-CSE-ConnectionGUID: nklJcseDQTy6/KGDMRvzKg==
X-CSE-MsgGUID: jfwKUgU7SvGwojPaa8U73g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107409867"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jan 2025 02:00:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tau0x-000b2B-2I;
	Thu, 23 Jan 2025 10:00:43 +0000
Date: Thu, 23 Jan 2025 18:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v16 7/7] leds: max77705: Add LEDs support
Message-ID: <202501231758.nV7PpitG-lkp@intel.com>
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
In-Reply-To: <20250117-starqltechn_integration_upstream-v16-7-11afa877276c@gmail.com>
References: <20250117-starqltechn_integration_upstream-v16-7-11afa877276c@gmail.com>
TO: Dzmitry Sankouski <dsankouski@gmail.com>
TO: Sebastian Reichel <sre@kernel.org>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Pavel Machek <pavel@ucw.cz>
TO: Hans de Goede <hdegoede@redhat.com>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
TO: Purism Kernel Team <kernel@puri.sm>
CC: linux-pm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-input@vger.kernel.org
CC: linux-leds@vger.kernel.org
CC: Dzmitry Sankouski <dsankouski@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 260d7c5e5392ac41c94152005d416172ba0a906d]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/dt-bindings-power-supply-add-maxim-max77705-charger/20250117-211002
base:   260d7c5e5392ac41c94152005d416172ba0a906d
patch link:    https://lore.kernel.org/r/20250117-starqltechn_integration_upstream-v16-7-11afa877276c%40gmail.com
patch subject: [PATCH v16 7/7] leds: max77705: Add LEDs support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc64-randconfig-r072-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231758.nV7PpitG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501231758.nV7PpitG-lkp@intel.com/

smatch warnings:
drivers/leds/leds-max77705.c:109 max77705_led_brightness_set() error: uninitialized symbol 'ret'.

vim +/ret +109 drivers/leds/leds-max77705.c

623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   78  
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   79  static int max77705_led_brightness_set(struct regmap *regmap, struct mc_subled *subled,
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   80  				int num_colors)
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   81  {
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   82  	int ret;
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   83  
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   84  	for (int i = 0; i < num_colors; i++) {
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   85  		unsigned int channel, brightness;
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   86  
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   87  		channel = subled[i].channel;
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   88  		brightness = subled[i].brightness;
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   89  
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   90  		if (brightness == LED_OFF) {
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   91  			/* Flash OFF */
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   92  			ret = regmap_update_bits(regmap,
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   93  					MAX77705_RGBLED_REG_LEDEN,
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   94  					MAX77705_LED_EN_MASK << MAX77705_LED_EN_SHIFT(channel), 0);
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   95  		} else {
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   96  			/* Set current */
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   97  			ret = regmap_write(regmap, MAX77705_LED_REG_BRIGHTNESS(channel),
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   98  					brightness);
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17   99  			if (ret < 0)
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  100  				return ret;
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  101  
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  102  			ret = regmap_update_bits(regmap,
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  103  					MAX77705_RGBLED_REG_LEDEN,
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  104  					LED_ON << MAX77705_LED_EN_SHIFT(channel),
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  105  					MAX77705_LED_EN_MASK << MAX77705_LED_EN_SHIFT(channel));
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  106  		}
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  107  	}
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  108  
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17 @109  	return ret;
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  110  }
623ea7235e1fe4 Dzmitry Sankouski 2025-01-17  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
