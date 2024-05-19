Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9D618044
	for <oe-kbuild@lists.linux.dev>; Sun, 19 May 2024 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716149109; cv=none; b=MhEjRjP7C0Sxv6hAQWtVRpm7aqOjRx2xXVGifwwMi4gyfDzfyp4Foqc2S4boHde+eDbKy3oMVI/xpPqWkOvMrn+gsaJLMsSe1O/uW2IsO+YfpXSCAFwpiVZxYOjLVMhTdQy5WoIpapIe1ax0CQ0W59ef0M7bToQud2xMKHlPSRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716149109; c=relaxed/simple;
	bh=JajYT6EfN/zjPx6C4OOoCZ24HoBBmC20Fs/OyVBejo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hV4wue9pXfA+8abCoNWhU/2KUX2d5eBTnCV9tbEn9Q/GiwP+QIX42qEmun3tNhOFeMOpqjAZz4A++5BDSH9YvrSF+xGaBfZJi/OTQ3LvzXzC/akXgvrmRzJb/RebUNzCx7DKSiN3xGGWvhshckeaL6cTGGIqT9ohuDSpCL3XMF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S48V0SUd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S48V0SUd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716149107; x=1747685107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JajYT6EfN/zjPx6C4OOoCZ24HoBBmC20Fs/OyVBejo0=;
  b=S48V0SUdM3lk5L86hGdt/joaZ2gzgqD7PwIOcX43xIKzAp0TXg3xjVLs
   Jk/Z2VRuJ4/fMy1nWPMWsRCptQWcQ/S6fQA6fAUbYc0w92/rSyXJpxCVJ
   lVXYjYyG9Lv1RsLcf/4DDqF6EFWVmLIo1cnGIj+j7lcr9o8ytsDUbxAuY
   Q0YMO10ZiGu0821a8rxCG1zI1eUP6FBXzMgSbro7V7JjMbwpTjVdz7+y6
   oBdzzNmqjPDrDpcI/40OmHEbv2n79lKWXtJ6PGNzu8WsR+dt7vBNuGnuw
   S0RU/ttJKfwb9S0px9UJE1Kru7BkbZmmb4D3yF1v06GEKti+Gb0U8FElJ
   w==;
X-CSE-ConnectionGUID: IJ8dawokQSqrPlIQczzusw==
X-CSE-MsgGUID: h1U+zrKwQZ615dQ+DnzZwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="22940902"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="22940902"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 13:05:06 -0700
X-CSE-ConnectionGUID: 5AJSQbJiTfaY2dMbosx53w==
X-CSE-MsgGUID: cxgCBrTQSIaT3howG6huKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="37253960"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2024 13:05:05 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8mmE-00049w-28;
	Sun, 19 May 2024 20:05:02 +0000
Date: Mon, 20 May 2024 04:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] leds: leds-lp5569: Add support for Texas
 Instruments LP5569
Message-ID: <202405200307.VjDFFcBh-lkp@intel.com>
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
In-Reply-To: <20240518125914.2938-3-ansuelsmth@gmail.com>
References: <20240518125914.2938-3-ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Pavel Machek <pavel@ucw.cz>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Jacek Anaszewski <jacek.anaszewski@gmail.com>
TO: linux-leds@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Christian Marangi <ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-leds-lp55xx-Add-new-ti-lp5569-compatible/20240518-210305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20240518125914.2938-3-ansuelsmth%40gmail.com
patch subject: [PATCH v2 3/3] leds: leds-lp5569: Add support for Texas Instruments LP5569
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: alpha-randconfig-r071-20240519 (https://download.01.org/0day-ci/archive/20240520/202405200307.VjDFFcBh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405200307.VjDFFcBh-lkp@intel.com/

smatch warnings:
drivers/leds/leds-lp5569.c:967 lp5569_multicolor_brightness() error: uninitialized symbol 'ret'.

vim +/ret +967 drivers/leds/leds-lp5569.c

33d5e15a686f53 Christian Marangi 2024-05-18  950  
33d5e15a686f53 Christian Marangi 2024-05-18  951  static int lp5569_multicolor_brightness(struct lp55xx_led *led)
33d5e15a686f53 Christian Marangi 2024-05-18  952  {
33d5e15a686f53 Christian Marangi 2024-05-18  953  	struct lp55xx_chip *chip = led->chip;
33d5e15a686f53 Christian Marangi 2024-05-18  954  	int ret;
33d5e15a686f53 Christian Marangi 2024-05-18  955  	int i;
33d5e15a686f53 Christian Marangi 2024-05-18  956  
33d5e15a686f53 Christian Marangi 2024-05-18  957  	mutex_lock(&chip->lock);
33d5e15a686f53 Christian Marangi 2024-05-18  958  	for (i = 0; i < led->mc_cdev.num_colors; i++) {
33d5e15a686f53 Christian Marangi 2024-05-18  959  		ret = lp55xx_write(chip,
33d5e15a686f53 Christian Marangi 2024-05-18  960  				   LP5569_REG_LED_PWM_BASE +
33d5e15a686f53 Christian Marangi 2024-05-18  961  				   led->mc_cdev.subled_info[i].channel,
33d5e15a686f53 Christian Marangi 2024-05-18  962  				   led->mc_cdev.subled_info[i].brightness);
33d5e15a686f53 Christian Marangi 2024-05-18  963  		if (ret)
33d5e15a686f53 Christian Marangi 2024-05-18  964  			break;
33d5e15a686f53 Christian Marangi 2024-05-18  965  	}
33d5e15a686f53 Christian Marangi 2024-05-18  966  	mutex_unlock(&chip->lock);
33d5e15a686f53 Christian Marangi 2024-05-18 @967  	return ret;
33d5e15a686f53 Christian Marangi 2024-05-18  968  }
33d5e15a686f53 Christian Marangi 2024-05-18  969  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
