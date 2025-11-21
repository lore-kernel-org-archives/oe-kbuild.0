Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D942FF644
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 20:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757645; cv=none; b=hBYusR14FxJzzXwErKon7YrkXtZajQx2I2AsozW+xxHoaHxZ8Tw+N/WJkTkBkBdwnbuKNZKDL+bLKfsEyqT3cnOyY36PZFT61YpE5HV7TXvxKJgnjB9pbpd6UkB/QibUGCM42hBWpdCshMkWRmflMOL1N+y1b+r0wfGG97uQrr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757645; c=relaxed/simple;
	bh=+Uu0ZMoZtCXiP8MgkTKtAmr+mOdMUiDfgls7dVb3xyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ckVpDa7P295M+Ujh+oTg4xOckbFbu50pZb7ufVlijamZsPtuC4sjhbZBFQW9Ab+2JwNc580kerNFNX+H0IlJXgKlNEaJ+Mq12aKVbqxx1QjsWh77F0J9dyqSHFnCWTzd8mTNCLxLGGf7v3qmo0xN0/HhBuRSNUz1cjHDlY+oaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWSG/84i; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWSG/84i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763757643; x=1795293643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Uu0ZMoZtCXiP8MgkTKtAmr+mOdMUiDfgls7dVb3xyk=;
  b=KWSG/84i04CQd59G1P/3FOrS2ntgVI46mau620McDS+aaT9jcNNsa656
   Qto0/ZYoEMAFXvjsEuSfXC0vUP6nxRLyacKdXqRia5M/ovDwp5WDA1wXd
   fgbycfmEdoGNQV4Qu1QKtKP++mznbompxZ4WrZGydXcWBtOlryWUAoIHM
   3uh8BITtipG9rsb+vFrmD0FRslmayOg4fCy970V/uY92LuqTb22C3tp39
   mdBYkEPlI3WxW1lF3tc+9hzBYlo0Lgqx9Td4FFtsRSbLFq7B0INTyJnrH
   0RVX7eSItPm910spWbe7siM0BgmFOUEoO1TiPJ5mFkezN/D9lqDaSNbq7
   A==;
X-CSE-ConnectionGUID: s/B6q5U7TDSt56jxAhlHgA==
X-CSE-MsgGUID: 5g0Mz52OTweI89Exsc5EsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65941244"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65941244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 12:40:40 -0800
X-CSE-ConnectionGUID: Z/J6ncZAQ6OXe5q5Xd7Svg==
X-CSE-MsgGUID: 6x1PAkTsR3+yWJbxTImPWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="192042143"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2025 12:40:39 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMXvp-0006rr-0A;
	Fri, 21 Nov 2025 20:40:37 +0000
Date: Sat, 22 Nov 2025 04:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] cifs: client: allow changing multichannel mount options
 on remount
Message-ID: <202511220407.4PHDdCbQ-lkp@intel.com>
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
In-Reply-To: <20251118022655.126994-1-rajasimandalos@gmail.com>
References: <20251118022655.126994-1-rajasimandalos@gmail.com>
TO: Rajasi Mandal <rajasimandalos@gmail.com>

Hi Rajasi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.18-rc6 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rajasi-Mandal/cifs-client-allow-changing-multichannel-mount-options-on-remount/20251118-102841
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20251118022655.126994-1-rajasimandalos%40gmail.com
patch subject: [PATCH] cifs: client: allow changing multichannel mount options on remount
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251119 (https://download.01.org/0day-ci/archive/20251122/202511220407.4PHDdCbQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511220407.4PHDdCbQ-lkp@intel.com/

smatch warnings:
fs/smb/client/fs_context.c:1164 smb3_reconfigure() warn: inconsistent returns '&ses->session_mutex'.

vim +1164 fs/smb/client/fs_context.c

d6a78783407cdf fs/cifs/fs_context.c Ronnie Sahlberg 2020-12-14  1163  
d6a78783407cdf fs/cifs/fs_context.c Ronnie Sahlberg 2020-12-14 @1164  	return rc;
d6a78783407cdf fs/cifs/fs_context.c Ronnie Sahlberg 2020-12-14  1165  }
d6a78783407cdf fs/cifs/fs_context.c Ronnie Sahlberg 2020-12-14  1166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
