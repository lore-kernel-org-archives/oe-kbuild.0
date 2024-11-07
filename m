Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B301D8E01
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 23:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731023382; cv=none; b=kXex3a8lB95pTHNDFFuG/RYAjHpyIBieR74DcONzStFZ0zOisyGEPbOFWECDtsdo9cwEoUbLCU8+NSDTmLA3Nl8a3wXIwRcrGc8LISQT6y6Uh838SApxDK7eFn7KNTOuoCissvJsF4H3TFkSUYJ9X+hxJcm4dywQ+erlGuKZcUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731023382; c=relaxed/simple;
	bh=QXMJr8J6tUvfXGoNtnJ5xpEBlVBDH1gmPHJCLIe598g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fGriBKTX7cogKGxlgnQ57uq2Tho01u5Z3XlXKtL1vFqXEnOxuNz9kPL7453IPgvjj37TNIgyoQckLlfgsUnrB5goMgjdJH3HaVx8xvuyvnU1iAKxAyD6hU6JarN1+0Ewgey7hi4rUIzCyl1MI6VRtrh+XhXAUyV8trrGX6ZIkwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyk+ov2w; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyk+ov2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731023381; x=1762559381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QXMJr8J6tUvfXGoNtnJ5xpEBlVBDH1gmPHJCLIe598g=;
  b=fyk+ov2wbnFB5Yr/YoMMMjMHdiXsjS0A9j+fd/LGVuc9bsbw5U1iQGuv
   37/8BzdtUIBSVxtUZTp44K0cTRS2q7eO9pRAK7E8Yo9m+X60j92IBTy6I
   ny5ATNVqRoy0QIlpa672cD5alBZ/gAYeuOQTSRGb19ZlLwmpAC3uPRTYB
   JxTZdq0/lJpIH5DZtGwHu8yJPLwvU13m3Xc93jz1NqG/F8kLUgFxLSXAN
   DVfY8Mk1LXNXwl7YEzy5IYkc08N7ZXNFwSpV2+vfYc+5kzFIPKvsF1hq7
   NMkpdWlGKwgO468GF2EcI4T5cNES9MSh1XSxNwM3STgBdyisZw6NCDUUz
   w==;
X-CSE-ConnectionGUID: dAu6QWJeSgunfuMQGvApbQ==
X-CSE-MsgGUID: CNtUluQOTH2NuWYqGEEXsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31004628"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="31004628"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 15:49:40 -0800
X-CSE-ConnectionGUID: 8mr4v61qTSyCqvd3Hfgd6Q==
X-CSE-MsgGUID: qYKB5wz0RRWKUoR+dQbckQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="116145775"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2024 15:49:38 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9CFr-000qnM-1x;
	Thu, 07 Nov 2024 23:49:35 +0000
Date: Fri, 8 Nov 2024 07:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] [PATCH v6] leds: Add LED1202 I2C driver
Message-ID: <202411080756.6eYdrM5X-lkp@intel.com>
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
In-Reply-To: <20241106061812.6819-3-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241106061812.6819-3-vicentiu.galanopulo@remote-tech.co.uk>
TO: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
TO: Pavel Machek <pavel@ucw.cz>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
TO: linux-leds@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org

Hi Vicentiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.12-rc6 next-20241107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vicentiu-Galanopulo/dt-bindings-leds-Add-LED1202-LED-Controller/20241106-142011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20241106061812.6819-3-vicentiu.galanopulo%40remote-tech.co.uk
patch subject: [PATCH 3/3] [PATCH v6] leds: Add LED1202 I2C driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r073-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080756.6eYdrM5X-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411080756.6eYdrM5X-lkp@intel.com/

smatch warnings:
drivers/leds/leds-st1202.c:175 st1202_brightness_get() error: uninitialized symbol 'value'.

vim +/value +175 drivers/leds/leds-st1202.c

7e6780184dc934 Vicentiu Galanopulo 2024-11-06  154  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  155  static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  156  {
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  157  	struct st1202_led *led;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  158  	struct st1202_chip *chip;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  159  	u8 value;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  160  	int ret;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  161  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  162  	led = cdev_to_st1202_led(led_cdev);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  163  	chip = led->chip;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  164  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  165  	mutex_lock(&chip->lock);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  166  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  167  	ret = st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num,
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  168  				&value);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  169  	if (ret != 0)
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  170  		dev_err(&chip->client->dev, "Reading register [0x%x] failed, error: %d\n",
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  171  			ST1202_ILED_REG0 + led->led_num, ret);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  172  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  173  	mutex_unlock(&chip->lock);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  174  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06 @175  	return value;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  176  }
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
