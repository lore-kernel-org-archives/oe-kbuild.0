Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5127E7EC
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764680378; cv=none; b=BmTvWFi1TysHjfIdWyXSJKucBIuYaYLybnpGQAkKzwBe/sdD5gukEqS+HGFrt+R2mEeV/uAKxwDZ1Z286ZTD7v+FtUIA2ioxfxygVxOpA/XV6lLE/SuGYFyy7K/55XRBTuNQ6VMHm0S1du3RdDogbZBx4gAZTgkPjKKszOo0RgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764680378; c=relaxed/simple;
	bh=X5WdI0uJpoM1xzsznlITMH8B31ClEnfildkOojcne1A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CuC5gJrv311DDpuLQ3t8ANmHXGqd6DyKYeD9JTGzjJeGM2tzUZtlLUKUw4yGxXCuQo+TwyIwwXM3gyT1nU6Kurhkwq79J2hl+0ptupnZglh2rsG6ulIN8ipo5YGk2as5pmx4+yB28BMPZ4dnHfBb4pzdLkyZrhUdzJHlFXgMdII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkrguVCF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkrguVCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764680377; x=1796216377;
  h=date:from:to:subject:message-id:mime-version;
  bh=X5WdI0uJpoM1xzsznlITMH8B31ClEnfildkOojcne1A=;
  b=IkrguVCF2Av0EQS6HmFmOkOaV0SiR3RIr5F+mrZDw1eTFZ65fIiBIjxV
   mGwh4RA1CawUup04ebKj3uQQ/IqSM8ORTmzHleeKMxdZd3M/feYy1C7nJ
   EWHde75b6eECBF6o4lcfVQm0agGvBSbLDiEzpyRIimz+aveVl/WEB8CfN
   GFQbSaqghQJyc0DYnOfeghAqwCycvcJcwhOUj+aA8Guu8HzSmY6Kto5YG
   vIYanSiRrgzns8vXtuWoER8wXsoI5uNtLTstxgmD8tAx3wOY2ftagWAXZ
   mRsnZKu9APAebuc9RAfVdenVNnQc0K8g4DNBibeGZoTa89UwEi6HzGUuh
   w==;
X-CSE-ConnectionGUID: 4wwvJWr1Qgm+UMZGjZ9zpw==
X-CSE-MsgGUID: OoD/tdgiS0Kh/R91mEbE3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66685631"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66685631"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 04:59:36 -0800
X-CSE-ConnectionGUID: Vh31y+QTRmm047naqozaTQ==
X-CSE-MsgGUID: fHMwxvgATVidxGMS8Gfvcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="231687852"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 Dec 2025 04:59:34 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQPye-000000002sJ-3LNy
	for oe-kbuild@lists.linux.dev;
	Tue, 02 Dec 2025 12:59:32 +0000
Date: Tue, 2 Dec 2025 13:58:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mingo-tip:WIP.sched/misc 12/12] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Vincent Guittot
 <vincent.guittot@linaro.org> wrote:', should be: 'Vincent Guittot
 <vincent.guittot@linaro.org> (wrote:)'
Message-ID: <202512021323.C5TVjM6K-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>

Hi Ingo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/misc
head:   ae9952358c782ce80811cc253c9dd13d0538ea97
commit: ae9952358c782ce80811cc253c9dd13d0538ea97 [12/12] sched/fair: Sort out 'blocked_load*' namespace noise
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251202/202512021323.C5TVjM6K-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Vincent Guittot <vincent.guittot@linaro.org> wrote:', should be: 'Vincent Guittot <vincent.guittot@linaro.org> (wrote:)'
#23: 
Suggested-by: Vincent Guittot <vincent.guittot@linaro.org> wrote:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
