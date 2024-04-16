Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6359012E48
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 03:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713237029; cv=none; b=en/xdkX8Kn9aD98rqbvaiePaRRx0Bxe+MGK1vz2z7hbeUL0t7RL9zzdNcBNBdRCAeHUoycEQLe3TioxyKGqXX1OBKmMNZ30n2KTF0AFZLwh4Gld0h9kLzSPXciS0eORWzJ+FasBy3ssW2sHKAlB5wEdbQYs2/KFY7kljiavcw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713237029; c=relaxed/simple;
	bh=PdsaucKDvmy4U+v5VY0T2F3f8v3zozCgVkWfpoSdSXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqE05STeRxdxSl1LrsgSwt1x3G6+CdDbo/JN/Oh9Xylm8IlV+Bl3rkS7UVGMdCXXAAlY2vbkU/4FT3lU2jl/+e9h1G8Uo05FyRdqqVclVOmhOdZ+dkD90EBF9Jmg5oPYFU6LU5kQSANZGvb5cgvIyOx6a/kpVUQIDhmK4LGxas0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7Be+uyB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7Be+uyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713237027; x=1744773027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PdsaucKDvmy4U+v5VY0T2F3f8v3zozCgVkWfpoSdSXU=;
  b=l7Be+uyBrGRas2GUszk6oPJKckWIiKUi1C6RFqdkIwZldSRuMw6MiTMG
   QIy8CgWQr2W0e1rwCL/sRoGmz3VDwF8BQMtr626J+jD11cSoZZMuAkrBg
   sxD4gXjU2SX75feOTSDw52E2PAwLh1d/ET6duTSoCBnVncw4WPpcFqo0h
   hYWDPcXG7Diwy1RRsK70jCdd+7mdRUg/ysS11349cJdzw8KxTzpLnAmBy
   KhRW+qjWUuRTcmWDgTZsK7rf2IF8CaWQgr6cCLgV99IpzYsL1JCety5yC
   d4PIhv1YPZZ1/TNYbGRF5w8YTPJTD5T3iCJkCCE9vhiYRHPO+sO7juYrj
   w==;
X-CSE-ConnectionGUID: Do53RlZ6Qu2s1DRgjy7W8g==
X-CSE-MsgGUID: E4THABYZTXiNdCTu44mv2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19257619"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="19257619"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 20:10:27 -0700
X-CSE-ConnectionGUID: 1HxBpHUcS5yhAwUhuuQA5Q==
X-CSE-MsgGUID: QP8ocFqKT52kIIVh5ZkchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26770129"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2024 20:10:25 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwZDD-0004to-1h;
	Tue, 16 Apr 2024 03:10:23 +0000
Date: Tue, 16 Apr 2024 11:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: conf.c:119:1: warning: non-void function does not return a value in
 all control paths
Message-ID: <202404161009.ZcnFbWPa-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   96fca68c4fbf77a8185eb10f7557e23352732ea2
commit: f7d5bcd35d427daac7e206b1073ca14f5db85c27 selftests: kselftest: Mark functions that unconditionally call exit() as __noreturn
date:   4 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 days ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161009.ZcnFbWPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404161009.ZcnFbWPa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> conf.c:119:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     119 | }
         | ^
   1 warning generated.


vim +119 tools/testing/selftests/alsa/conf.c

aba51cd0949aee Jaroslav Kysela 2022-11-08  107  
aba51cd0949aee Jaroslav Kysela 2022-11-08  108  static int dump_config_tree(snd_config_t *top)
aba51cd0949aee Jaroslav Kysela 2022-11-08  109  {
aba51cd0949aee Jaroslav Kysela 2022-11-08  110  	snd_output_t *out;
aba51cd0949aee Jaroslav Kysela 2022-11-08  111  	int err;
aba51cd0949aee Jaroslav Kysela 2022-11-08  112  
aba51cd0949aee Jaroslav Kysela 2022-11-08  113  	err = snd_output_stdio_attach(&out, stdout, 0);
aba51cd0949aee Jaroslav Kysela 2022-11-08  114  	if (err < 0)
aba51cd0949aee Jaroslav Kysela 2022-11-08  115  		ksft_exit_fail_msg("stdout attach\n");
aba51cd0949aee Jaroslav Kysela 2022-11-08  116  	if (snd_config_save(top, out))
aba51cd0949aee Jaroslav Kysela 2022-11-08  117  		ksft_exit_fail_msg("config save\n");
aba51cd0949aee Jaroslav Kysela 2022-11-08  118  	snd_output_close(out);
aba51cd0949aee Jaroslav Kysela 2022-11-08 @119  }
aba51cd0949aee Jaroslav Kysela 2022-11-08  120  

:::::: The code at line 119 was first introduced by commit
:::::: aba51cd0949aee50a2b93f1b32ed3668cd613649 selftests: alsa - add PCM test

:::::: TO: Jaroslav Kysela <perex@perex.cz>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
