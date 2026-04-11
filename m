Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB882F851
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775915302; cv=none; b=JxITlYDtB3F5KwDXG/JyWGt1LBt47iPcdYdxN8sjIN2Khj6VApzlHoUS08cLLQ3tjUJLPmkuauGo1t4a0PZOl9lgEI4ziNXQjNjAlI8w/3Ade1otHniIP4t2RiqQp3yWclOmUPHGKTpIZ6kJMWiiIEQgqRA7LK3kcR4sfWVQJXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775915302; c=relaxed/simple;
	bh=TVHtrPGpz64IsFDGdCUMQvut2kc/DRmosHllEfjwqc4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzFD6SIhxfyESqE94iTHEV3wMDXfppALaaS77wU7dD681pUGkluIlwYPhbzolZMiNFvPKHA4iraYljRK5HZPZYELvHebSfcMZE3y2O6V3sJwnKDcREabYzklhlvVfI+pXztGws8sBgZ9b3KEChfb17L2OJqlAbF5epaLMMqiQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fY2j6zfs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fY2j6zfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775915301; x=1807451301;
  h=date:from:to:subject:message-id:mime-version;
  bh=TVHtrPGpz64IsFDGdCUMQvut2kc/DRmosHllEfjwqc4=;
  b=fY2j6zfsgwT7m7kbUaM6he4yILMiyAicB0QeddZWGnjfFp++S97IZ5Kr
   X0oERQKJDrH8nuv6rFYrWtAqbR5hs8/j9jJR0M96tYuPPZD38R1e/pOkT
   jRGdYNMmmLtG112CcHyHieTnniIF1VXvo3gLuz1qp0aApzkU/q5NQQ6aT
   Lsc4ukRNkJPP6IhSke7dCItGwqKy+TeqN//CFVklLvs+QeyLBSQeGxelE
   WoVXw6VUvZp23mURnHgsqTa3mpxK9uqByys4qiM5kJkIS3ZTcxyIkLhKS
   k1OILlbCONtRLTNISDWnpx3e/+ucoptKUoHf1sNXiVxLhILB/FMALjFhc
   g==;
X-CSE-ConnectionGUID: 9vHPiKDGRSaOIZPpUvAZOg==
X-CSE-MsgGUID: /n3tcbBUQBipleyEcTD8NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="77029222"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="77029222"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 06:48:20 -0700
X-CSE-ConnectionGUID: wZJtpX1eQiqA87EAmIFQXQ==
X-CSE-MsgGUID: A4McHgs2T9+JKkvy+9iWjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="224620121"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Apr 2026 06:48:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBYh7-00000000B5N-31X5
	for oe-kbuild@lists.linux.dev;
	Sat, 11 Apr 2026 13:48:17 +0000
Date: Sat, 11 Apr 2026 15:47:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v2 1/1] HID: add malicious HID device detection driver
Message-ID: <202604111526.fJWjmgGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260404133746.80914-2-zybo1000@gmail.com>
References: <20260404133746.80914-2-zybo1000@gmail.com>
TO: Zubeyr Almaho <zybo1000@gmail.com>
TO: Jiri Kosina <jikos@kernel.org>

Hi Zubeyr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zubeyr-Almaho/HID-add-malicious-HID-device-detection-driver/20260411-092245
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260404133746.80914-2-zybo1000%40gmail.com
patch subject: [PATCH v2 1/1] HID: add malicious HID device detection driver
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260411/202604111526.fJWjmgGl-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(unsigned int, s->sample_count, MAX_TIMING_SAMPLES)
#135: FILE: drivers/hid/hid-omg-detect.c:107:
+	n = min(s->sample_count, (unsigned int)MAX_TIMING_SAMPLES);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
