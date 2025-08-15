Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2302D7D5C
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Aug 2025 17:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755277374; cv=none; b=RXbSb2j6pZn3XZPlPTk6r/MoedrQTjauJL/nPOACLCCnShzSFz5ddGwYtj+zsVoXSjc2q2+wjgoOn7ynSdvjSKvtrpOsNgC90D2VB8GAh/QL7QJNOxVdY38v8BVI91ZP4nD2q+dt3sZx9LBF2L+YgjieR0Oenh5OJP77gZjjzUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755277374; c=relaxed/simple;
	bh=Yuq6Tdh3DFkPzT9ouyt73AYq6tlgLmEsWggIycLZ1oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjT4W2du0avakHrljl6mW9VwARigcMZ2tAUODhscoArArfholmsy2n+RG6QbA1UbBPujBKj+pPYpFFdrCuZTgttATtg2cEx2YAptVPRxyMLS0xYYp6FobopwIE0ZYhd4hBzGwJV+osrOAJZY/XXM/NNSWPeMzFDTB2g9LDTpI2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HL1SKMJN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HL1SKMJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755277372; x=1786813372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yuq6Tdh3DFkPzT9ouyt73AYq6tlgLmEsWggIycLZ1oo=;
  b=HL1SKMJNqZdCfonz69VzRMSJ3hifXmoZcnsrqoC03myhRgiz59ZbAYYh
   5BiYAxiS38bKaYG8gx8mi7rHGnqz1s4inSk+EoirS2E4ly4KxtNZGaSVV
   05Fd5qWNqV5Z+VWr/fkoTO9s6JSXiGufxP3qHAlwx71K7hfgERf3p7S5A
   E8xT4qcqxj5JL9ojX8rHMl/W/xNfPgO2tlrbjpDY69x9rZ1z6dd4ZFRm9
   m1vt7KuYIcCGoSREpnc6esgycvOw3ra+DdyCvavoulYWT2kBgpX7mDHIU
   Os7PYSpIuW0m3ojM08Cz61N/fuf/ydrGq4vzfbF/0GDSOpysqt1HyLbEd
   g==;
X-CSE-ConnectionGUID: OhQNyIFLQ8e5PnqseX5mqw==
X-CSE-MsgGUID: /e4KHab2S+KbUO12MiONEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68307109"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68307109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 10:02:51 -0700
X-CSE-ConnectionGUID: bPrLoOzbQ9aYZBrljOV58A==
X-CSE-MsgGUID: HgT/AG3nQm6YvZy5UIFyDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="198047630"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Aug 2025 10:02:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umxpB-000C9g-2S;
	Fri, 15 Aug 2025 17:02:43 +0000
Date: Sat, 16 Aug 2025 01:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-i915:for-linux-next 11/18]
 drivers/gpu/drm/i915/i915_switcheroo.c:21 i915_switcheroo_set_state() warn:
 variable dereferenced before check 'i915' (see line 18)
Message-ID: <202508160035.hmzuKiww-lkp@intel.com>
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
TO: Jani Nikula <jani.nikula@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>

tree:   https://gitlab.freedesktop.org/drm/i915/kernel for-linux-next
head:   63e0b17ae79a4365e874d7e2ff3816db2e6d55b5
commit: d2e184f8e16ab85876ddcc0779358fbfe5162414 [11/18] drm/i915/switcheroo: pass display to HAS_DISPLAY()
:::::: branch date: 6 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160035.hmzuKiww-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508160035.hmzuKiww-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/i915_switcheroo.c:21 i915_switcheroo_set_state() warn: variable dereferenced before check 'i915' (see line 18)
drivers/gpu/drm/i915/i915_switcheroo.c:55 i915_switcheroo_can_switch() warn: variable dereferenced before check 'i915' (see line 48)

vim +/i915 +21 drivers/gpu/drm/i915/i915_switcheroo.c

63bf8301aac492 Jani Nikula       2019-10-04  13  
63bf8301aac492 Jani Nikula       2019-10-04  14  static void i915_switcheroo_set_state(struct pci_dev *pdev,
63bf8301aac492 Jani Nikula       2019-10-04  15  				      enum vga_switcheroo_state state)
63bf8301aac492 Jani Nikula       2019-10-04  16  {
63bf8301aac492 Jani Nikula       2019-10-04  17  	struct drm_i915_private *i915 = pdev_to_i915(pdev);
d2e184f8e16ab8 Jani Nikula       2025-08-06 @18  	struct intel_display *display = i915->display;
63bf8301aac492 Jani Nikula       2019-10-04  19  	pm_message_t pmm = { .event = PM_EVENT_SUSPEND };
63bf8301aac492 Jani Nikula       2019-10-04  20  
63bf8301aac492 Jani Nikula       2019-10-04 @21  	if (!i915) {
63bf8301aac492 Jani Nikula       2019-10-04  22  		dev_err(&pdev->dev, "DRM not initialized, aborting switch.\n");
63bf8301aac492 Jani Nikula       2019-10-04  23  		return;
63bf8301aac492 Jani Nikula       2019-10-04  24  	}
d2e184f8e16ab8 Jani Nikula       2025-08-06  25  	if (!HAS_DISPLAY(display)) {
a273e95721e968 Thomas Zimmermann 2023-01-16  26  		dev_err(&pdev->dev, "Device state not initialized, aborting switch.\n");
a273e95721e968 Thomas Zimmermann 2023-01-16  27  		return;
a273e95721e968 Thomas Zimmermann 2023-01-16  28  	}
63bf8301aac492 Jani Nikula       2019-10-04  29  
63bf8301aac492 Jani Nikula       2019-10-04  30  	if (state == VGA_SWITCHEROO_ON) {
f54efb6ad03322 Jani Nikula       2020-04-02  31  		drm_info(&i915->drm, "switched on\n");
63bf8301aac492 Jani Nikula       2019-10-04  32  		i915->drm.switch_power_state = DRM_SWITCH_POWER_CHANGING;
63bf8301aac492 Jani Nikula       2019-10-04  33  		/* i915 resume handler doesn't set to D0 */
63bf8301aac492 Jani Nikula       2019-10-04  34  		pci_set_power_state(pdev, PCI_D0);
b8d65b8a5aea33 Jani Nikula       2021-11-11  35  		i915_driver_resume_switcheroo(i915);
63bf8301aac492 Jani Nikula       2019-10-04  36  		i915->drm.switch_power_state = DRM_SWITCH_POWER_ON;
63bf8301aac492 Jani Nikula       2019-10-04  37  	} else {
f54efb6ad03322 Jani Nikula       2020-04-02  38  		drm_info(&i915->drm, "switched off\n");
63bf8301aac492 Jani Nikula       2019-10-04  39  		i915->drm.switch_power_state = DRM_SWITCH_POWER_CHANGING;
b8d65b8a5aea33 Jani Nikula       2021-11-11  40  		i915_driver_suspend_switcheroo(i915, pmm);
63bf8301aac492 Jani Nikula       2019-10-04  41  		i915->drm.switch_power_state = DRM_SWITCH_POWER_OFF;
63bf8301aac492 Jani Nikula       2019-10-04  42  	}
63bf8301aac492 Jani Nikula       2019-10-04  43  }
63bf8301aac492 Jani Nikula       2019-10-04  44  
63bf8301aac492 Jani Nikula       2019-10-04  45  static bool i915_switcheroo_can_switch(struct pci_dev *pdev)
63bf8301aac492 Jani Nikula       2019-10-04  46  {
63bf8301aac492 Jani Nikula       2019-10-04  47  	struct drm_i915_private *i915 = pdev_to_i915(pdev);
d2e184f8e16ab8 Jani Nikula       2025-08-06 @48  	struct intel_display *display = i915->display;
63bf8301aac492 Jani Nikula       2019-10-04  49  
63bf8301aac492 Jani Nikula       2019-10-04  50  	/*
63bf8301aac492 Jani Nikula       2019-10-04  51  	 * FIXME: open_count is protected by drm_global_mutex but that would lead to
63bf8301aac492 Jani Nikula       2019-10-04  52  	 * locking inversion with the driver load path. And the access here is
63bf8301aac492 Jani Nikula       2019-10-04  53  	 * completely racy anyway. So don't bother with locking for now.
63bf8301aac492 Jani Nikula       2019-10-04  54  	 */
d2e184f8e16ab8 Jani Nikula       2025-08-06 @55  	return i915 && HAS_DISPLAY(display) && atomic_read(&i915->drm.open_count) == 0;
63bf8301aac492 Jani Nikula       2019-10-04  56  }
63bf8301aac492 Jani Nikula       2019-10-04  57  

:::::: The code at line 21 was first introduced by commit
:::::: 63bf8301aac492d4c5fdf7b0ec42b142c05080e3 drm/i915: split out i915_switcheroo.[ch] from i915_drv.c

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
