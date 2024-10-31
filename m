Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14448479
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730373375; cv=none; b=cR7SQaE+njorRIGjmEoovtiGHAShX1j2Sg2xE02Evzi3hsW3/IJPw3VpbOLhsBWSVvAnTMqIouFwYQKIEVvYFBCbq1HfVmV6mF70CLQWRj3Rh50Ez8L19xe9xCV/D6ei6e0qmgfYDCr0UNZyNZYUHcIKoWIq8O/HxpcN/u7papE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730373375; c=relaxed/simple;
	bh=VhdJX5PBENJJzWRaDJnHMMsIjxIgPak28vDaXwHwv0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EoEB4AnyDnF5eTrW3G6q2Iy+Q22b/+hyFixLfcSTx3F9rPdmEwYgqkNhWTL1bRBSRMfMN6iXNyjkI2qE755XJf043m8XvwzsffAB54tMOaRojGJTBf3F/G1SbmfxgkuRRvCXjF2r9+LZbsOmRrJeaZJE/GaFWJaS2vBQM34SySU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baZ/WmbP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baZ/WmbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730373373; x=1761909373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VhdJX5PBENJJzWRaDJnHMMsIjxIgPak28vDaXwHwv0c=;
  b=baZ/WmbP1DqRkAjldwRsdL8+fhaflQsj/srm7Kg4XMDZnfur42T/kT2z
   YbJEwr2SCc+00rvjpIVU+ltiXIG3Qu4/UvEi1H6/vhOy1+TpjscBS5Y7C
   UYZWSkPcL2BfHZOCPTDeKO4fPvP2BezVreZlrmkCdzKxYx3J7s+O13QME
   07+j2VLWfzKjNWx4uvluAfwyoeD1PRKoDIwClHKvLbQSfb1eYcBUVdB83
   yX3Ack0EwHCkklSz7cafCSKPOAI6lBPBDaRsp8iLQmHIhbrcwVac5lPHY
   chVvS3nqofIqb752J8wsLLEb3zC1LXmVdLL+wtFPal720UgD67uIj5Gjt
   g==;
X-CSE-ConnectionGUID: DyWGRXW2R2WNS6kiXgoo7A==
X-CSE-MsgGUID: yYqklgMJSyiZQizcHPvxXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52659539"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52659539"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 04:16:13 -0700
X-CSE-ConnectionGUID: 8G/F6hpTTPWF5+64Dvi/aQ==
X-CSE-MsgGUID: vDB2XnphQZmWpaeiQm9kAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113447259"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2024 04:16:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6T9s-000g24-0d;
	Thu, 31 Oct 2024 11:16:08 +0000
Date: Thu, 31 Oct 2024 19:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/time/timekeeping.c:807:19-20: WARNING opportunity for min()
Message-ID: <202410311931.twiNKosB-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fc810ae3ae110f9e2fcccce80fc8c8d62f97907
commit: fcf190c369149c3b04539797cedf28741eb14164 timekeeping: Make delta calculation overflow safe
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311931.twiNKosB-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410311931.twiNKosB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/time/timekeeping.c:807:19-20: WARNING opportunity for min()

vim +807 kernel/time/timekeeping.c

cc06268c6a87db1 Thomas Gleixner    2011-11-13  787  
8524070b7982d76 John Stultz        2007-05-08  788  /**
155ec60226ae0ae Martin Schwidefsky 2009-08-14  789   * timekeeping_forward_now - update clock to the current time
6e5a91901c2dff3 Alex Shi           2020-11-13  790   * @tk:		Pointer to the timekeeper to update
8524070b7982d76 John Stultz        2007-05-08  791   *
9a055117d3d9cb5 Roman Zippel       2008-08-20  792   * Forward the current clock to update its state since the last call to
9a055117d3d9cb5 Roman Zippel       2008-08-20  793   * update_wall_time(). This is useful before significant clock changes,
9a055117d3d9cb5 Roman Zippel       2008-08-20  794   * as it avoids having to deal with this time offset explicitly.
8524070b7982d76 John Stultz        2007-05-08  795   */
f726a697d06102e John Stultz        2012-07-13  796  static void timekeeping_forward_now(struct timekeeper *tk)
8524070b7982d76 John Stultz        2007-05-08  797  {
a5a1d1c2914b531 Thomas Gleixner    2016-12-21  798  	u64 cycle_now, delta;
8524070b7982d76 John Stultz        2007-05-08  799  
ceea5e3771ed237 John Stultz        2017-06-08  800  	cycle_now = tk_clock_read(&tk->tkr_mono);
876e78818def298 Peter Zijlstra     2015-03-19  801  	delta = clocksource_delta(cycle_now, tk->tkr_mono.cycle_last, tk->tkr_mono.mask);
876e78818def298 Peter Zijlstra     2015-03-19  802  	tk->tkr_mono.cycle_last = cycle_now;
4a4ad80d32cea69 Peter Zijlstra     2015-03-19  803  	tk->tkr_raw.cycle_last  = cycle_now;
8524070b7982d76 John Stultz        2007-05-08  804  
fcf190c369149c3 Adrian Hunter      2024-03-25  805  	while (delta > 0) {
fcf190c369149c3 Adrian Hunter      2024-03-25  806  		u64 max = tk->tkr_mono.clock->max_cycles;
fcf190c369149c3 Adrian Hunter      2024-03-25 @807  		u64 incr = delta < max ? delta : max;
fc6eead7c1e2e53 John Stultz        2017-05-22  808  
fcf190c369149c3 Adrian Hunter      2024-03-25  809  		tk->tkr_mono.xtime_nsec += incr * tk->tkr_mono.mult;
fcf190c369149c3 Adrian Hunter      2024-03-25  810  		tk->tkr_raw.xtime_nsec += incr * tk->tkr_raw.mult;
fc6eead7c1e2e53 John Stultz        2017-05-22  811  		tk_normalize_xtime(tk);
fcf190c369149c3 Adrian Hunter      2024-03-25  812  		delta -= incr;
fcf190c369149c3 Adrian Hunter      2024-03-25  813  	}
8524070b7982d76 John Stultz        2007-05-08  814  }
8524070b7982d76 John Stultz        2007-05-08  815  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
