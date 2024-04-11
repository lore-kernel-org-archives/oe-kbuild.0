Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F1B1F5FA
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830162; cv=none; b=E8JZPjRF9U8safl2ZvZt52cLKkqtUh+BAqopsm4lYh5BmeOhokAmSZDv3YelUm+Rg/sHgj5gC8TEw7TJzq80hron3VWQT/PtG+s2GA/SczRjeTkolYSbqOZvhBZi7u+qjQOnNm9ilDi+KkqEBwzwY7ykk4zshWyu+RklyJmmneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830162; c=relaxed/simple;
	bh=mCKR7AsuWAutCKKm7kaIdnsOts5V61LFsH/mn7e96ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yps6okC1wkC3cHHD4SzOU1gmO/sxq63nDKRELR2Vjz8Z8tEQXN3Qy3yDtduzFdFfbJR8HSf5x7PKgHk0Ao/ukMm7pencGpdy5oGPgzUrzb3HBG/kUaSRzDvt7vkMISGNN1GHplEeA+FHTMkcNzQLN3BAiJeFru8uHRSlCtjgX40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vb3p6++l; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vb3p6++l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712830161; x=1744366161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mCKR7AsuWAutCKKm7kaIdnsOts5V61LFsH/mn7e96ik=;
  b=Vb3p6++lNGgE3iA7UDiPArYLXUVyqGycWQjZ/DZsDRH1fuVTA8GYsReb
   zb66JziqAip0DOvG2/CYkDMa1TLtopmbrWKfT7CvhWNXQYKdF4IOU7/p0
   1hHbmyeXj8SpvEfXnlAaiOXpQ62bGqU7uRmdhqst669k2DaQ/oPkoeP7d
   5gDzmjI20ZcvTZcBW+xEwB8kDm7KdsVpa7GSu0/y6jGYLSew12D9riAFV
   luzMXAHgoFPQwqIabkdCMcsjZFhw7NJfXRwg29aHWRkEsEEahAvpJz0w7
   3hilLeg7JPYZCN7iMlTDEqN64thwkLlWnNgI9M1VPrF1ZJ6BcB0jm2Cjs
   g==;
X-CSE-ConnectionGUID: UwLJ2L1JTK6gO8Ir5HB1Ag==
X-CSE-MsgGUID: lAwbpnCUR2GDVpfen5u6Vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25686263"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25686263"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 03:09:20 -0700
X-CSE-ConnectionGUID: 9SAHaycsSPiAOd/cT6TqzQ==
X-CSE-MsgGUID: Nq9qT4TjTlCjosxHfdl9Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="52039772"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Apr 2024 03:09:19 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rurMq-0008Un-29;
	Thu, 11 Apr 2024 10:09:16 +0000
Date: Thu, 11 Apr 2024 18:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:timers/posix 4/52] posix_timers.c:28:9: warning:
 ignoring return value of 'strerror_r' declared with attribute
 'warn_unused_result'
Message-ID: <202404111834.yiz79nbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   e61ecfa7c797953c6d66b9a0de0adcdbbf7308a0
commit: 52f690d7b6f55b7a18bddfeaf80d002dde83acbb [4/52] selftests/timers/posix_timers: Add SIG_IGN test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111834.yiz79nbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404111834.yiz79nbY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   posix_timers.c: In function '__fatal_error':
>> posix_timers.c:28:9: warning: ignoring return value of 'strerror_r' declared with attribute 'warn_unused_result' [-Wunused-result]
      28 |         strerror_r(errno, buf, sizeof(buf));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +28 tools/testing/selftests/timers/posix_timers.c

0bc4b0cf15708f Frederic Weisbecker 2013-06-28  23  
67c1de711b083d Thomas Gleixner     2023-04-28  24  static void __fatal_error(const char *test, const char *name, const char *what)
67c1de711b083d Thomas Gleixner     2023-04-28  25  {
67c1de711b083d Thomas Gleixner     2023-04-28  26  	char buf[64];
67c1de711b083d Thomas Gleixner     2023-04-28  27  
67c1de711b083d Thomas Gleixner     2023-04-28 @28  	strerror_r(errno, buf, sizeof(buf));
67c1de711b083d Thomas Gleixner     2023-04-28  29  
67c1de711b083d Thomas Gleixner     2023-04-28  30  	if (name && strlen(name))
67c1de711b083d Thomas Gleixner     2023-04-28  31  		ksft_exit_fail_msg("%s %s %s %s\n", test, name, what, buf);
67c1de711b083d Thomas Gleixner     2023-04-28  32  	else
67c1de711b083d Thomas Gleixner     2023-04-28  33  		ksft_exit_fail_msg("%s %s %s\n", test, what, buf);
67c1de711b083d Thomas Gleixner     2023-04-28  34  }
67c1de711b083d Thomas Gleixner     2023-04-28  35  

:::::: The code at line 28 was first introduced by commit
:::::: 67c1de711b083d7a652a24ba4643ce5530d6f9d7 selftests/timers/posix_timers: Simplify error handling

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
