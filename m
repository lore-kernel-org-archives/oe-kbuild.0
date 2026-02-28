Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CF01FBEB0
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Feb 2026 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772251180; cv=none; b=JC+QeURhFUtIYsv0X5WW5hUE2/S+RqvREXznpS+uRCkTp40t7oj4z5LYbeAASzwOhaVZpZzz3RVnOo0InFbDw6msSsIeRBKRQ1wmoGihz7i4303tPwztWmnmrXw96usJAhyWNQ18Dtm4r5EGwgnwXaEHiTUcB8PZjrpf8cJXGlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772251180; c=relaxed/simple;
	bh=xzEqwwFSCE+aOEiGtWdYQtsgCzl4Bt3uqZISspMV1fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VMjJXkkwxdZOQ1xjAmT+26ExSxhRqBvTqDGKlE79uWl2CQzkCM74xJshB/y6SFNeCxinlbXRhJhdBu/AWvh0Bo/lxcAEB6W5HLLAkPRGOEjXSxT3y1eNVww0J1IPEskYwdidGWYHsDwa0tgOKccrci6kP5qDojmfbGkxtH+GPnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6chKa/s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6chKa/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772251177; x=1803787177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xzEqwwFSCE+aOEiGtWdYQtsgCzl4Bt3uqZISspMV1fs=;
  b=b6chKa/s9a1D6q+pYq5kQez+1TiHdV7H4ri4hwK8hZzPyZJdHi6PZB/u
   amrwMJRQM9386oJV4yUjYbypf3X4mP2vry+9G1WrREpax7Tx2KpNuOIOy
   Iemwd0zwm2+4gi1shQblqOPDn29LajhtP0fln0jTzjmIpf6eW4LgRCGoB
   KeFNGMW9EinAGioSQHeZuvj7MZPqA0hzv8Dh1/OLJ4iaWDX3xRaVwLNc1
   MkgFlFu8VBrhtWAOuLYPrrE8Cbz5eeOD7iH1j1SxOaw/BuJN4NB61ZBKm
   R4EeX8+vQVoRyVTwzqcmuVUWpQfEpF5FLrT3j/rWby7Hiq4Q/nRKZhpIw
   g==;
X-CSE-ConnectionGUID: vVic+fvFTkqL7xpcE5EQcQ==
X-CSE-MsgGUID: jgIAfBZ9Sr6lckOvYr4a1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="76948517"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="76948517"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 19:59:36 -0800
X-CSE-ConnectionGUID: pNooNJ/bS2KR6jqFkcTrSg==
X-CSE-MsgGUID: T3iOjh/KQ4eBjYqfsLriMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="216214900"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Feb 2026 19:59:35 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwBUL-00000000BIh-0F0l;
	Sat, 28 Feb 2026 03:59:33 +0000
Date: Sat, 28 Feb 2026 11:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 7/9] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Message-ID: <202602281123.mFzdCbj7-lkp@intel.com>
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
In-Reply-To: <20260227190617.271388-8-i@rong.moe>
References: <20260227190617.271388-8-i@rong.moe>
TO: Rong Zhang <i@rong.moe>

Hi Rong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on a75cb869a8ccc88b0bc7a44e1597d9c7995c56e5]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/leds-Load-trigger-modules-on-demand-if-used-as-hw-control-trigger/20260228-031338
base:   a75cb869a8ccc88b0bc7a44e1597d9c7995c56e5
patch link:    https://lore.kernel.org/r/20260227190617.271388-8-i%40rong.moe
patch subject: [RFC PATCH 7/9] leds: trigger: Add led_trigger_notify_hw_control_changed() interface
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: powerpc64-randconfig-r072-20260228 (https://download.01.org/0day-ci/archive/20260228/202602281123.mFzdCbj7-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602281123.mFzdCbj7-lkp@intel.com/

smatch warnings:
drivers/leds/led-triggers.c:510 led_trigger_do_hw_control_transition() error: we previously assumed 'led_cdev->trigger' could be null (see line 501)

vim +510 drivers/leds/led-triggers.c

9534cc31dda2bb1 Heiner Kallweit 2016-01-02  495  
db770fd1890f22c Rong Zhang      2026-02-28  496  static void led_trigger_do_hw_control_transition(struct led_classdev *led_cdev, bool activate,
db770fd1890f22c Rong Zhang      2026-02-28  497  						 struct led_trigger *hc_trig)
db770fd1890f22c Rong Zhang      2026-02-28  498  {
db770fd1890f22c Rong Zhang      2026-02-28  499  	int err = 0;
db770fd1890f22c Rong Zhang      2026-02-28  500  
db770fd1890f22c Rong Zhang      2026-02-28 @501  	if (!led_cdev->trigger) {
db770fd1890f22c Rong Zhang      2026-02-28  502  		/* "none" => hw control trigger (offloaded). */
db770fd1890f22c Rong Zhang      2026-02-28  503  		if (activate) {
db770fd1890f22c Rong Zhang      2026-02-28  504  			err = __led_trigger_set(led_cdev, hc_trig, true);
db770fd1890f22c Rong Zhang      2026-02-28  505  
db770fd1890f22c Rong Zhang      2026-02-28  506  			/*
db770fd1890f22c Rong Zhang      2026-02-28  507  			 * hw control trigger must recognize the current hw state during
db770fd1890f22c Rong Zhang      2026-02-28  508  			 * its activation and mark itself as offloaded.
db770fd1890f22c Rong Zhang      2026-02-28  509  			 */
db770fd1890f22c Rong Zhang      2026-02-28 @510  			WARN_ON(!err && !led_trigger_get_offloaded(led_cdev));
db770fd1890f22c Rong Zhang      2026-02-28  511  		}
db770fd1890f22c Rong Zhang      2026-02-28  512  	} else if (led_cdev->trigger == hc_trig && led_trigger_get_offloaded(led_cdev)) {
db770fd1890f22c Rong Zhang      2026-02-28  513  		/* hw control trigger (offloaded) => "none". */
db770fd1890f22c Rong Zhang      2026-02-28  514  		if (!activate)
db770fd1890f22c Rong Zhang      2026-02-28  515  			err = __led_trigger_set(led_cdev, NULL, true);
db770fd1890f22c Rong Zhang      2026-02-28  516  	} else {
db770fd1890f22c Rong Zhang      2026-02-28  517  		/* Other trigger is active, or hw control trigger is not offloaded. */
db770fd1890f22c Rong Zhang      2026-02-28  518  		dev_dbg(led_cdev->dev,
db770fd1890f22c Rong Zhang      2026-02-28  519  			"Do not %s hw control trigger %s while %s is active",
db770fd1890f22c Rong Zhang      2026-02-28  520  			activate ? "activate" : "deactivate", hc_trig->name,
db770fd1890f22c Rong Zhang      2026-02-28  521  			led_cdev->trigger->name);
db770fd1890f22c Rong Zhang      2026-02-28  522  
db770fd1890f22c Rong Zhang      2026-02-28  523  		return;
db770fd1890f22c Rong Zhang      2026-02-28  524  	}
db770fd1890f22c Rong Zhang      2026-02-28  525  
db770fd1890f22c Rong Zhang      2026-02-28  526  	if (err)
db770fd1890f22c Rong Zhang      2026-02-28  527  		dev_warn(led_cdev->dev, "Failed to %s hw control trigger %s: %d",
db770fd1890f22c Rong Zhang      2026-02-28  528  			 activate ? "activate" : "deactivate", hc_trig->name, err);
db770fd1890f22c Rong Zhang      2026-02-28  529  }
db770fd1890f22c Rong Zhang      2026-02-28  530  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
