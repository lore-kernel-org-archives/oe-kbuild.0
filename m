Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16351157E6B
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826309; cv=none; b=VoWE9Ud4ScxGun4GvX4Ybw9RUZ3cAUpoVHCbqzgeZADPiP7r5BL/PbREvABtqjE1CsB4UyURdXIiZ3DniLbsPyIbvboV6pfhEbU9ns5mM+lE+iSYyyk02q5e5Jhv+I5EaEPUFRM2i7P1pVSSCN0wzuo5Qwway1j6FHfATq8w+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826309; c=relaxed/simple;
	bh=ytZh0keuGYsPZmYeYwM4rnaRmEeBMMBkBjPqLPSWdLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPFwPh3ldgYMPju4+B52ehwfd1/7vMs+XfQTqwOxvrXxyti7X/2bA4sWAQBNgqY4hKth/cu0D0ca0prRRBRdsUiSeY5waC9tSZUETHkIIfj0uCM3uuQFwmanhX4XTpbnJbwga+Ht7NSHUds/dycAWDwTsOOB5DwzF7GFhs7eQKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUXz44Fg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUXz44Fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749826308; x=1781362308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ytZh0keuGYsPZmYeYwM4rnaRmEeBMMBkBjPqLPSWdLs=;
  b=LUXz44Fg7+BCKJFbJmuoXOjyb7A4NA6iQdbq4hs+Tjx8X+m5cbUnGEjE
   lHGqzCmaCHuXmsw0aFd3B1sPbdxe+pB+OyqmRCplMhTFWqpQbcWex+KsE
   cj46t0hKGwoQ/9sOssUSQIoCtvKTTtlsx+wdi80P3ktEK62+03ZGQTBMz
   a5Udw+cd630pSrRs6ybDGw093lGZWfrm7T77PNFcT5S3vgPd3TKDZUYNp
   TC1l3w1U8MEUNwAVrlXUqzE1aU/6DMJ4nHvLvuHa32xIywLEO1nLREXjc
   MfmlGm4AX5wuLvPTChXZNrnHWeucQy1idIMe3EfciL+oAiAjgljexumDL
   w==;
X-CSE-ConnectionGUID: QbG6UF7JR8iUGRWS5yfsLg==
X-CSE-MsgGUID: RaT1ATM1Re2n7Wdmbdiq3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52192229"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="52192229"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 07:51:47 -0700
X-CSE-ConnectionGUID: oRmDW5R/Q9m+TRbht6Z7Hg==
X-CSE-MsgGUID: KuS4cetcRIOPLALzp3a2Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148737440"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jun 2025 07:51:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ5kt-000Cia-1Y;
	Fri, 13 Jun 2025 14:51:43 +0000
Date: Fri, 13 Jun 2025 22:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 2/4] leds: add TI/National Semiconductor LP5812 LED
 Driver
Message-ID: <202506132206.dBqw1BIJ-lkp@intel.com>
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
In-Reply-To: <20250610174319.183375-4-trannamatk@gmail.com>
References: <20250610174319.183375-4-trannamatk@gmail.com>
TO: Nam Tran <trannamatk@gmail.com>
TO: lee@kernel.org
CC: pavel@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: conor+dt@kernel.org
CC: corbet@lwn.net
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Nam Tran <trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f09079bd04a924c72d555cd97942d5f8d7eca98c]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-add-TI-National-Semiconductor-LP5812-LED-Driver/20250611-100314
base:   f09079bd04a924c72d555cd97942d5f8d7eca98c
patch link:    https://lore.kernel.org/r/20250610174319.183375-4-trannamatk%40gmail.com
patch subject: [PATCH v9 2/4] leds: add TI/National Semiconductor LP5812 LED Driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132206.dBqw1BIJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506132206.dBqw1BIJ-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-lp5812.c:827 lp5812_multicolor_brightness() error: uninitialized symbol 'ret'.

vim +/ret +827 drivers/leds/rgb/leds-lp5812.c

8089ca4ee5bd17 Nam Tran 2025-06-11  812  
8089ca4ee5bd17 Nam Tran 2025-06-11  813  static int lp5812_multicolor_brightness(struct lp5812_led *led)
8089ca4ee5bd17 Nam Tran 2025-06-11  814  {
8089ca4ee5bd17 Nam Tran 2025-06-11  815  	struct lp5812_chip *chip = led->chip;
8089ca4ee5bd17 Nam Tran 2025-06-11  816  	int ret, i;
8089ca4ee5bd17 Nam Tran 2025-06-11  817  
8089ca4ee5bd17 Nam Tran 2025-06-11  818  	guard(mutex)(&chip->lock);
8089ca4ee5bd17 Nam Tran 2025-06-11  819  	for (i = 0; i < led->mc_cdev.num_colors; i++) {
8089ca4ee5bd17 Nam Tran 2025-06-11  820  		ret = lp5812_manual_dc_pwm_control(chip, led->mc_cdev.subled_info[i].channel,
8089ca4ee5bd17 Nam Tran 2025-06-11  821  						   led->mc_cdev.subled_info[i].brightness,
8089ca4ee5bd17 Nam Tran 2025-06-11  822  						   LP5812_DIMMING_PWM);
8089ca4ee5bd17 Nam Tran 2025-06-11  823  		if (ret)
8089ca4ee5bd17 Nam Tran 2025-06-11  824  			break;
8089ca4ee5bd17 Nam Tran 2025-06-11  825  	}
8089ca4ee5bd17 Nam Tran 2025-06-11  826  
8089ca4ee5bd17 Nam Tran 2025-06-11 @827  	return ret;
8089ca4ee5bd17 Nam Tran 2025-06-11  828  }
8089ca4ee5bd17 Nam Tran 2025-06-11  829  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
