Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE2E1A0BFE
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729610027; cv=none; b=WoPDNCZmv6c3i404ojb1K/dkoaXmgD3ua4SKucLZqz1g+xUMymth9KMPFZe/CLwZK4SsUlLvf9UP8zA0NTtUaQnBEwj6b/2x5AtpyPjgykKmCANHuBpSZm9f9N4Oee4T80UE+qZ7H7GQAMz7UGfaRucqtfV58t3j9v28Ze4LxDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729610027; c=relaxed/simple;
	bh=4MbufFQkLGWg7dh9pN+QnDoOW71WrCpuI7I3FPcibCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZHpesgpzKmWH5V/a9MEunQwj2bZElQIhl6GUCNMTWZPxUo8C6TKsaesP1hvNDb/1p2KEYKkqjyc+tcoKhNQMVsFR38tIR44urCTD1kf1tl6Np1ie69X4JLI8Zr3mccFJDAMfo5QaNrCGApjVTPcFUt/mkiVeAwXCQ2Ou9e5Uw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlXX30HX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlXX30HX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729610025; x=1761146025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4MbufFQkLGWg7dh9pN+QnDoOW71WrCpuI7I3FPcibCs=;
  b=BlXX30HXMjwJOrdkn/ufXb9j+y27+xpcJJ+ZYsWZu2mHXeebYUsdw+YE
   w3HUGfft8QqjLzatPwmq4Upl5VsikY6q+kk+/a578xq7il8C2eGHZjgxi
   qWDR8eWvRK7XfW2ISCTuM/7S2SKtKiSuP0YiUod83bblv9atf338ApoSI
   Ocr/NUwtY4Lx+pE5Y8SeIEFgLpkhyRxIg8tEdrxbQqQzQFTx7EFIApOPS
   7Y+GdoIL9ZoJ39K5OlteOn1a+n15myPzsuM8Z3w1eOzkh27Wu9dCYkW2+
   nr0cIZp9bpVvN9PVO7RQ1/nCjuWhef++9dgEWAhxl8M/I07kUZoZra7MZ
   g==;
X-CSE-ConnectionGUID: fNHt6/3LQbyJcYp42GNnqw==
X-CSE-MsgGUID: AeYJn+y2QbuYDz7WwtkOnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39735835"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39735835"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:13:44 -0700
X-CSE-ConnectionGUID: R4WcMfhNTWCGP4DP+OGVKw==
X-CSE-MsgGUID: t9g2htmNQQ6P6TzoCVwqdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79841372"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2024 08:13:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3GZo-000TiA-1j;
	Tue, 22 Oct 2024 15:13:40 +0000
Date: Tue, 22 Oct 2024 23:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [rafael-pm:thermal-core-testing 3/27]
 drivers/thermal/thermal_thresholds.c:156:4-34: opportunity for
 str_up_down(temperature > last_temperature)
Message-ID: <202410222338.z3SU3JyP-lkp@intel.com>
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
CC: linux-acpi@vger.kernel.org
CC: devel@acpica.org
CC: linux-pm@vger.kernel.org
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal-core-testing
head:   84a08c4f3bebd5ddb3f1e41a2240ea0bde1a5881
commit: 445936f9e258eca624c8239056bd8cd6e853b3fd [3/27] thermal: core: Add user thresholds support
:::::: branch date: 5 hours ago
:::::: commit date: 12 days ago
config: csky-randconfig-r063-20241022 (https://download.01.org/0day-ci/archive/20241022/202410222338.z3SU3JyP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410222338.z3SU3JyP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/thermal_thresholds.c:156:4-34: opportunity for str_up_down(temperature > last_temperature)

vim +156 drivers/thermal/thermal_thresholds.c

445936f9e258ec Daniel Lezcano 2024-09-23  118  
445936f9e258ec Daniel Lezcano 2024-09-23  119  void thermal_thresholds_handle(struct thermal_zone_device *tz, int *low, int *high)
445936f9e258ec Daniel Lezcano 2024-09-23  120  {
445936f9e258ec Daniel Lezcano 2024-09-23  121  	struct list_head *thresholds = &tz->user_thresholds;
445936f9e258ec Daniel Lezcano 2024-09-23  122  
445936f9e258ec Daniel Lezcano 2024-09-23  123  	int temperature = tz->temperature;
445936f9e258ec Daniel Lezcano 2024-09-23  124  	int last_temperature = tz->last_temperature;
445936f9e258ec Daniel Lezcano 2024-09-23  125  	bool notify;
445936f9e258ec Daniel Lezcano 2024-09-23  126  
445936f9e258ec Daniel Lezcano 2024-09-23  127  	lockdep_assert_held(&tz->lock);
445936f9e258ec Daniel Lezcano 2024-09-23  128  
445936f9e258ec Daniel Lezcano 2024-09-23  129  	/*
445936f9e258ec Daniel Lezcano 2024-09-23  130  	 * We need a second update in order to detect a threshold being crossed
445936f9e258ec Daniel Lezcano 2024-09-23  131  	 */
445936f9e258ec Daniel Lezcano 2024-09-23  132  	if (last_temperature == THERMAL_TEMP_INVALID)
445936f9e258ec Daniel Lezcano 2024-09-23  133  		return;
445936f9e258ec Daniel Lezcano 2024-09-23  134  
445936f9e258ec Daniel Lezcano 2024-09-23  135  	/*
445936f9e258ec Daniel Lezcano 2024-09-23  136  	 * The temperature is stable, so obviously we can not have
445936f9e258ec Daniel Lezcano 2024-09-23  137  	 * crossed a threshold.
445936f9e258ec Daniel Lezcano 2024-09-23  138  	 */
445936f9e258ec Daniel Lezcano 2024-09-23  139  	if (last_temperature == temperature)
445936f9e258ec Daniel Lezcano 2024-09-23  140  		return;
445936f9e258ec Daniel Lezcano 2024-09-23  141  
445936f9e258ec Daniel Lezcano 2024-09-23  142  	/*
445936f9e258ec Daniel Lezcano 2024-09-23  143  	 * Since last update the temperature:
445936f9e258ec Daniel Lezcano 2024-09-23  144  	 * - increased : thresholds are crossed the way up
445936f9e258ec Daniel Lezcano 2024-09-23  145  	 * - decreased : thresholds are crossed the way down
445936f9e258ec Daniel Lezcano 2024-09-23  146  	 */
445936f9e258ec Daniel Lezcano 2024-09-23  147  	if (temperature > last_temperature)
445936f9e258ec Daniel Lezcano 2024-09-23  148  		notify = thermal_thresholds_handle_raising(thresholds, temperature,
445936f9e258ec Daniel Lezcano 2024-09-23  149  							   last_temperature, low, high);
445936f9e258ec Daniel Lezcano 2024-09-23  150  	else
445936f9e258ec Daniel Lezcano 2024-09-23  151  		notify = thermal_thresholds_handle_dropping(thresholds, temperature,
445936f9e258ec Daniel Lezcano 2024-09-23  152  							    last_temperature, low, high);
445936f9e258ec Daniel Lezcano 2024-09-23  153  
445936f9e258ec Daniel Lezcano 2024-09-23  154  	if (notify)
445936f9e258ec Daniel Lezcano 2024-09-23  155  		pr_debug("A threshold has been crossed the way %s, with a temperature=%d, last_temperature=%d\n",
445936f9e258ec Daniel Lezcano 2024-09-23 @156  			 temperature > last_temperature ? "up" : "down", temperature, last_temperature);
445936f9e258ec Daniel Lezcano 2024-09-23  157  }
445936f9e258ec Daniel Lezcano 2024-09-23  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
