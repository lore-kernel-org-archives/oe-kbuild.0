Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC75B70808
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 05:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771565765; cv=none; b=dFATsBHVswtmgu/BbRmbJQCTpSVwrUZXveFarctoV4Nt8Mh9Gzn3Y0tEnAYUaUarK1zvcm5Ow1yu4AlFTCbqb8V8bKMJ8R99N6WwGh2aNl4Nv4E+pemiB3e8zoZaGLngkp2XbQqME4sOkcmEwJCIi4r4MCdbSgf++F0VLUccHqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771565765; c=relaxed/simple;
	bh=vO4b1YxAHGTHwNHxVmgLMBdvqn/VjvjQNt0t8XKwQRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gMJ0lhTMjZNDhFNcfogT5lAZbqKRVYZIBoeCTwW3T5NIrTNB6y3faanAZz/N6+2al4yBowQ88k4QFuJPQgZtWWbzTAsrffDGIu9H9EuWABP3m2S/h+EkzYKAB//ueO24p49emsTy2QHYLSFLgab+4p0COe9kvJl5msV9evKUkug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDnPdCVl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDnPdCVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771565763; x=1803101763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vO4b1YxAHGTHwNHxVmgLMBdvqn/VjvjQNt0t8XKwQRU=;
  b=gDnPdCVl/Q87XiH4/pp1/CHDYBHTIr3TDwpREg94KObF/qaoVuRFHilg
   Ae4TKIwrcVxuxTnRaX2FwcXyMaX5UGPlI+4lWpxdX3LrmxavsnT8zBI9U
   mO1BLFtJUZY+8xia/R0VjrjbymKIL+CwNaN1YnNV+O8zPf7ksh2hS99Q2
   +2QLiON02oIZCYS9VGeMRknYGCqkGu9GlDv8GcGgHz1UIQPaV9ZGijMXM
   om3ZX3b3ichgkSR9d6m9nITSSwNJBTDVXp7ScwDhcEheVKouudd8Cvij/
   sroO4nqYcjyL6pSzFIu6m/lnQb9qhL4hm4VJQ6L/fWhTrEtfMXitfSCl7
   g==;
X-CSE-ConnectionGUID: Ig7j1j9MQam38y6CDNddfA==
X-CSE-MsgGUID: +EzFc6pdRRyNRUSRP81HFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72565882"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72565882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 21:36:02 -0800
X-CSE-ConnectionGUID: kh1bpKN1S5qzzMO7+bNqQw==
X-CSE-MsgGUID: ynuO3Ro7Rci7oqedCwLmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="252447816"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Feb 2026 21:36:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtJBG-000000013qe-2wmR;
	Fri, 20 Feb 2026 05:35:58 +0000
Date: Fri, 20 Feb 2026 13:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] HID: generic: add LampArray support via hid-lamparray
 helper
Message-ID: <202602201309.gZ868F1G-lkp@intel.com>
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
In-Reply-To: <20260219130217.2042972-1-tgu@tuxedocomputers.com>
References: <20260219130217.2042972-1-tgu@tuxedocomputers.com>
TO: Tim Guttzeit <tgu@tuxedocomputers.com>
TO: Jiri Kosina <jikos@kernel.org>
TO: Benjamin Tissoires <bentiss@kernel.org>
CC: wse@tuxedocomputers.com
CC: Tim Guttzeit <tgu@tuxedocomputers.com>
CC: linux-kernel@vger.kernel.org
CC: linux-input@vger.kernel.org

Hi Tim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.19 next-20260219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Guttzeit/HID-generic-add-LampArray-support-via-hid-lamparray-helper/20260219-211040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260219130217.2042972-1-tgu%40tuxedocomputers.com
patch subject: [PATCH] HID: generic: add LampArray support via hid-lamparray helper
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-r072-20260219 (https://download.01.org/0day-ci/archive/20260220/202602201309.gZ868F1G-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602201309.gZ868F1G-lkp@intel.com/

smatch warnings:
drivers/hid/hid-lamparray.c:445 lamparray_led_brightness_set() warn: can 'la' even be NULL?
drivers/hid/hid-lamparray.c:491 lamparray_led_brightness_get() warn: can 'la' even be NULL?

vim +/la +445 drivers/hid/hid-lamparray.c

3e9882018e5183 Tim Guttzeit 2026-02-19  434  
3e9882018e5183 Tim Guttzeit 2026-02-19  435  static int lamparray_led_brightness_set(struct led_classdev *cdev,
3e9882018e5183 Tim Guttzeit 2026-02-19  436  					enum led_brightness brightness)
3e9882018e5183 Tim Guttzeit 2026-02-19  437  {
3e9882018e5183 Tim Guttzeit 2026-02-19  438  	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
3e9882018e5183 Tim Guttzeit 2026-02-19  439  	struct lamparray_device *ldev =
3e9882018e5183 Tim Guttzeit 2026-02-19  440  		container_of(mc, struct lamparray_device, mc_cdev);
3e9882018e5183 Tim Guttzeit 2026-02-19  441  	struct lamparray *la = container_of(ldev, struct lamparray, ldev);
3e9882018e5183 Tim Guttzeit 2026-02-19  442  	u8 r, g, b;
3e9882018e5183 Tim Guttzeit 2026-02-19  443  	int ret;
3e9882018e5183 Tim Guttzeit 2026-02-19  444  
3e9882018e5183 Tim Guttzeit 2026-02-19 @445  	if (!la)
3e9882018e5183 Tim Guttzeit 2026-02-19  446  		return -ENODEV;
3e9882018e5183 Tim Guttzeit 2026-02-19  447  	ldev = &la->ldev;
3e9882018e5183 Tim Guttzeit 2026-02-19  448  
3e9882018e5183 Tim Guttzeit 2026-02-19  449  	ret = led_mc_calc_color_components(mc, brightness);
3e9882018e5183 Tim Guttzeit 2026-02-19  450  	if (ret)
3e9882018e5183 Tim Guttzeit 2026-02-19  451  		return ret;
3e9882018e5183 Tim Guttzeit 2026-02-19  452  
3e9882018e5183 Tim Guttzeit 2026-02-19  453  	r = mc->subled_info[0].brightness;
3e9882018e5183 Tim Guttzeit 2026-02-19  454  	g = mc->subled_info[1].brightness;
3e9882018e5183 Tim Guttzeit 2026-02-19  455  	b = mc->subled_info[2].brightness;
3e9882018e5183 Tim Guttzeit 2026-02-19  456  
3e9882018e5183 Tim Guttzeit 2026-02-19  457  	ret = lamparray_hw_set_state(ldev, r, g, b, brightness);
3e9882018e5183 Tim Guttzeit 2026-02-19  458  	if (ret)
3e9882018e5183 Tim Guttzeit 2026-02-19  459  		hid_err(ldev->hdev, "Failed to send LampArray update: %d\n",
3e9882018e5183 Tim Guttzeit 2026-02-19  460  			ret);
3e9882018e5183 Tim Guttzeit 2026-02-19  461  
3e9882018e5183 Tim Guttzeit 2026-02-19  462  	mutex_lock(&ldev->lock);
3e9882018e5183 Tim Guttzeit 2026-02-19  463  	ldev->last_r = r;
3e9882018e5183 Tim Guttzeit 2026-02-19  464  	ldev->last_g = g;
3e9882018e5183 Tim Guttzeit 2026-02-19  465  	ldev->last_b = b;
3e9882018e5183 Tim Guttzeit 2026-02-19  466  	ldev->last_brightness = brightness;
3e9882018e5183 Tim Guttzeit 2026-02-19  467  	mutex_unlock(&ldev->lock);
3e9882018e5183 Tim Guttzeit 2026-02-19  468  
3e9882018e5183 Tim Guttzeit 2026-02-19  469  	return 0;
3e9882018e5183 Tim Guttzeit 2026-02-19  470  }
3e9882018e5183 Tim Guttzeit 2026-02-19  471  
3e9882018e5183 Tim Guttzeit 2026-02-19  472  static enum led_brightness
3e9882018e5183 Tim Guttzeit 2026-02-19  473  lamparray_led_brightness_get(struct led_classdev *cdev)
3e9882018e5183 Tim Guttzeit 2026-02-19  474  {
3e9882018e5183 Tim Guttzeit 2026-02-19  475  	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
3e9882018e5183 Tim Guttzeit 2026-02-19  476  	struct lamparray_device *ldev =
3e9882018e5183 Tim Guttzeit 2026-02-19  477  		container_of(mc, struct lamparray_device, mc_cdev);
3e9882018e5183 Tim Guttzeit 2026-02-19  478  	enum led_brightness brightness;
3e9882018e5183 Tim Guttzeit 2026-02-19  479  	struct lamparray *la = container_of(ldev, struct lamparray, ldev);
3e9882018e5183 Tim Guttzeit 2026-02-19  480  	u8 rr, gg, bb;
3e9882018e5183 Tim Guttzeit 2026-02-19  481  	enum led_brightness br;
3e9882018e5183 Tim Guttzeit 2026-02-19  482  	int ret;
3e9882018e5183 Tim Guttzeit 2026-02-19  483  
3e9882018e5183 Tim Guttzeit 2026-02-19  484  	/* Default: cache (also used while registering LED classdev) */
3e9882018e5183 Tim Guttzeit 2026-02-19  485  	mutex_lock(&ldev->lock);
3e9882018e5183 Tim Guttzeit 2026-02-19  486  	brightness = ldev->last_brightness;
3e9882018e5183 Tim Guttzeit 2026-02-19  487  	mutex_unlock(&ldev->lock);
3e9882018e5183 Tim Guttzeit 2026-02-19  488  
3e9882018e5183 Tim Guttzeit 2026-02-19  489  	/* Only do HID readback after registration completed */
3e9882018e5183 Tim Guttzeit 2026-02-19  490  	if (READ_ONCE(ldev->led_registered)) {
3e9882018e5183 Tim Guttzeit 2026-02-19 @491  		if (!la)
3e9882018e5183 Tim Guttzeit 2026-02-19  492  			return brightness;
3e9882018e5183 Tim Guttzeit 2026-02-19  493  		ldev = &la->ldev;
3e9882018e5183 Tim Guttzeit 2026-02-19  494  
3e9882018e5183 Tim Guttzeit 2026-02-19  495  		ret = lamparray_hw_get_state(ldev, &rr, &gg, &bb, &br);
3e9882018e5183 Tim Guttzeit 2026-02-19  496  		if (ret) {
3e9882018e5183 Tim Guttzeit 2026-02-19  497  			hid_warn(ldev->hdev,
3e9882018e5183 Tim Guttzeit 2026-02-19  498  				 "Failed to read LampArray state (%d), using cached brightness %u\n",
3e9882018e5183 Tim Guttzeit 2026-02-19  499  				 ret, brightness);
3e9882018e5183 Tim Guttzeit 2026-02-19  500  			return brightness;
3e9882018e5183 Tim Guttzeit 2026-02-19  501  		}
3e9882018e5183 Tim Guttzeit 2026-02-19  502  
3e9882018e5183 Tim Guttzeit 2026-02-19  503  		mutex_lock(&ldev->lock);
3e9882018e5183 Tim Guttzeit 2026-02-19  504  		if (ldev->last_r != rr || ldev->last_g != gg ||
3e9882018e5183 Tim Guttzeit 2026-02-19  505  		    ldev->last_b != bb || ldev->last_brightness != br) {
3e9882018e5183 Tim Guttzeit 2026-02-19  506  			ldev->last_r = rr;
3e9882018e5183 Tim Guttzeit 2026-02-19  507  			ldev->last_g = gg;
3e9882018e5183 Tim Guttzeit 2026-02-19  508  			ldev->last_b = bb;
3e9882018e5183 Tim Guttzeit 2026-02-19  509  			ldev->last_brightness = br;
3e9882018e5183 Tim Guttzeit 2026-02-19  510  
3e9882018e5183 Tim Guttzeit 2026-02-19  511  			if (ldev->led_registered && ldev->mc_cdev.subled_info) {
3e9882018e5183 Tim Guttzeit 2026-02-19  512  				ldev->mc_cdev.subled_info[0].brightness = rr;
3e9882018e5183 Tim Guttzeit 2026-02-19  513  				ldev->mc_cdev.subled_info[1].brightness = gg;
3e9882018e5183 Tim Guttzeit 2026-02-19  514  				ldev->mc_cdev.subled_info[2].brightness = bb;
3e9882018e5183 Tim Guttzeit 2026-02-19  515  			}
3e9882018e5183 Tim Guttzeit 2026-02-19  516  		}
3e9882018e5183 Tim Guttzeit 2026-02-19  517  		mutex_unlock(&ldev->lock);
3e9882018e5183 Tim Guttzeit 2026-02-19  518  		return br;
3e9882018e5183 Tim Guttzeit 2026-02-19  519  	}
3e9882018e5183 Tim Guttzeit 2026-02-19  520  	return brightness;
3e9882018e5183 Tim Guttzeit 2026-02-19  521  }
3e9882018e5183 Tim Guttzeit 2026-02-19  522  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
