Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715901;
	b=VklVqLhwkn5zpIFYsSPkMKD+uRK8bjeCMGx5BXaBxXCEua5LTwFWKbdjngg7csbB11bM
	 LvvZuZlvYwePIDqTiKmjZ+Y+k/fk7Rz+ikInNCUfG5m33QpnjlZe5Ey39VxuHjkDSYLrL
	 UmbMu3JYo8VFVDdwpQLor+G6TIX4T40AUxJImXX6uogDg4Hd24jyyifTXhJmkBKeE6SaW
	 +rz6ymFz+0y8rybJ9otMJAw712UZ0LZkcgzln7HZ6LLaS0nYu5j9OK94u9X95RH+DVgnV
	 uAFv5IXuLXP8NpVhw31tQUDyNh17MbIh1mi+P0qfgnXoRioSfeODvcjpePHqika/OYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715901;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Y78IFZUaUMn64+IXzku183popTv3S1/KpCSXG0rHBZc=;
	b=FcirIFT7XahVHwFoSh3rnr3ZEFuwNhOc1/OlCIPdN//pTx7fXK51wMPjJNsyxHosooOf
	 Lt0S4sbXw5hhAHSOK3xfbD+6JjD4Umnjgt2C6U7fbszizo6ygHsCw5UQD7GOS8nUOB4RN
	 fDN/ShH+6Dy1fnyrMWENSe1WQLhOq2RJjT1ZRYtIzttjyMAM4Odo19PQsAppZMxcgTgXE
	 MjLRIyxmofhxVQo/QiMqIELuHXnQ5+vx+2bhK0/WIqlDcUsPtOoBIkuLaTtwy1QFpYBcM
	 a0qKCkOjhck0d9qnC/dIyb7PWhzuyRinKY68bFlFD2vAuKzQT9UCGPBRjjzMD3N7fYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K70kDYlR;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F4606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 17:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K70kDYlR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795715900; x=1827251900;
  h=date:from:to:cc:subject:message-id;
  bh=GovM7gT55Ano8Yn5BU34G5RVo/K9253Oc99RVZoU3IY=;
  b=K70kDYlRaIjhRT1Duc0KSYzd0D8lgoXSZfu5hCF0Pss7BUlK/j/DximH
   db6rIu4hgXICW8f9UA5mVKFeSE69u74snNYDGot7ArTH0KWT7/Ns7pBJJ
   c046uC2EoE2epggPW3bTS3KLnIxrRc33bbOFr3PNJXUdbmwP52lsIOXZc
   y2KtjH6EFml2EKAKZsBH6FbBwK5BxFVmDAOW3Ru3VQo5+6sDXJL+SLrba
   CNXvL8AEn2GvRNAuUSMH9IBSsnX6k7wFybr9rtHUdbkGf/JKcqzctTORx
   1UDQAovHfubcFVt5D/BYrkhgxwYk35E02XztxAJEUINHVu0HWHeSymVR7
   g==;
X-CSE-ConnectionGUID: XgJzOrFWTYm4q7QLaNzdIQ==
X-CSE-MsgGUID: XiOeMZEgTjmi7lZQIqDdpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4632457"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4632457"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 09:58:20 -0800
X-CSE-ConnectionGUID: v+zvPi+/QOqoF1z1P6Q+Fw==
X-CSE-MsgGUID: WpX1hM4GQlWUHCN4ScPfqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12730077"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 09:58:19 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWdjc-00000000098-3rzo;
	Thu, 26 Nov 2026 17:58:16 +0000
Date: Thu, 26 Nov 2026 18:58:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-5.15 65/65]
 drivers/net/hamradio/baycom_ser_hdx.o: warning: objtool:
 ser12_interrupt()+0x380: can't find switch jump table
Message-ID: <20261126185725.SczvnSwF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Sean,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   36e3098ebf6d37570aab9dc5f8f4d24bd5ffdd06
commit: 36b32816fbab267611f073223f1b0b816ec5920f [65/65] cpu: Re-enable CPU mitigations by default for !X86 architectures
:::::: branch date: 14 hours ago
:::::: commit date: 2 years, 7 months ago
config: x86_64-randconfig-2000-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126185725.SczvnSwF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126185725.SczvnSwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126185725.SczvnSwF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/hamradio/baycom_ser_hdx.o: warning: objtool: ser12_interrupt()+0x380: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
