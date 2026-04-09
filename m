Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257451E89C
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Apr 2026 04:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775709237; cv=none; b=NOGA1IpZjv7hpkOqtQW51FPB/HWkCEZXM4r/kZLCBlq295xxi3zs1ggxj3Duf1DaXERtLU31XkSIdvppi5WPf8+ZjWk5jaCH59aYZG0+VdKZMYB0zjFOPJ0QAh4S1ehGY6DZnrHa4H6nvUQut9ypw0TYU2/YqM6Plrxma2cOW74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775709237; c=relaxed/simple;
	bh=cuRHVKlrYXe01arOs2hTrfYeealRrgQwWYGHaUqLag8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XA8Am3pOi93edLilJdJ8GSJOGsIRqRy0TfwmFoh1UqlmttDjMZj/PEkacUsaTLbI3F+wheohy/66qGpW/8aTuBOzljFYACAihKUd1/LrmHhZK4tFQFtWK4LcDC1ETuIcdSOIFBZubc3TqeIVvmsx34A7M1CRjDxm4xqTojOq/34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5g/AczZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5g/AczZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775709235; x=1807245235;
  h=date:from:to:cc:subject:message-id;
  bh=cuRHVKlrYXe01arOs2hTrfYeealRrgQwWYGHaUqLag8=;
  b=V5g/AczZiyMk34eS1EDfcgX3GBBDvBVKr6yepg82AENkQPR4WB2yi2Op
   1xBj7b5EXW2ZKLEbPf1uJEADK4SW3p/HM5dy/aTpXbV8LQr08Nwv9M8Cj
   +/OAuyNACqiODYJJvsjS0zsc333+gKeAArRabtrN8zRcu657kVNMCLExG
   9JH2Awy93EIfIdy9l5e/mQbQ1TdI94dEM6R+dmvdwP7NLyRQTeO4K/aK7
   wMS6kJKUl8L65iQ5cNsGoQatzdt9PQHaBbB3gRMu5p7/JFcPsKQQNo1Qd
   XFsJB8i60z9Su1jz41Fu9r9b1JxVuVhhIuTggV6++to+54onX4JvbGz0i
   A==;
X-CSE-ConnectionGUID: MrpPljHUTd2tbuiWZnexCQ==
X-CSE-MsgGUID: vc2HKLm8RZW7Fj5wulgg0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88092945"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="88092945"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 21:33:54 -0700
X-CSE-ConnectionGUID: NS/uJ/HVQC6nD3zJC7mqLw==
X-CSE-MsgGUID: vP20UvkqQPus73uVL+eyzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="222151365"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 Apr 2026 21:33:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAh5T-00000000AbN-3GaK;
	Thu, 09 Apr 2026 04:33:51 +0000
Date: Thu, 09 Apr 2026 06:33:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dwmw2:arm-disable-exits 5/7] arm64/vgic_group_v2.c:28:17:
 warning: 'shared_rev' defined but not used
Message-ID: <202604090604.MJojGxpN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Woodhouse <dwmw@amazon.co.uk>

tree:   git://git.infradead.org/users/dwmw2/linux arm-disable-exits
head:   9a4463f0b113629ce8431de476af332b2ff3ea98
commit: aef9e327c1a62db78d5b4018724bac2bc9fc975c [5/7] KVM: arm64: selftests: Add GICv2 IGROUPR writability test
:::::: branch date: 10 hours ago
:::::: commit date: 17 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260409/202604090604.MJojGxpN-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090604.MJojGxpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604090604.MJojGxpN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm64/vgic_group_v2.c:28:17: warning: 'shared_rev' defined but not used [-Wunused-variable]
      28 | static uint64_t shared_rev;
         |                 ^~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
