Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1433FA5CC
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973581; cv=none; b=NYWVmzn/2YT7g+gVDtaQ8LTXfa09bm7NA+KqGqek7HT9H62Hhlj7i58C0KAc0S4h4N7AqYU9VIPZzgBwPSW21aY1zo1ov0x3QJ5ltWGCPCWRqHfoHH+r6Or8DpqnPrJcq00DxMSWtF9ZhOWxQFea0JXk0MAM6MD/jzV8Jta0HCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973581; c=relaxed/simple;
	bh=vtu27e6rcM6j+sauaQ+/UOUS8lYuSsUow4jSIxaRvBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e9l8+zUZ8zI/oetXQmf+JPhGyrK0G3jgl5vZOiTvsH9I0kw5khwVYsxJoSiwGLzaQw486Sp99/1nKl6q2npI66iCUT6WKR7TWaOYTpdRRdNCcT4TzWgRZ6xtTDpdmUZK0zshSXg2g/mFyLYXHdmOvTDRENSgxy3egpjVEBn33Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arYtMfXu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arYtMfXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786973577; x=1818509577;
  h=date:from:to:cc:subject:message-id;
  bh=vtu27e6rcM6j+sauaQ+/UOUS8lYuSsUow4jSIxaRvBY=;
  b=arYtMfXu4Q1npB1YrdDVnNGRqEmX6s4bWEqUYGqP+jNeNriUNKHdl1N/
   USeMm7ZHomDQVc6Cm91I5K1iy8YAzykCIFddsSyTnF2NrU1gSGLnyGGd3
   uFpkSQWPtxh6sSn7rD8RvybqHkRefg2/hPOomTlBV6JwSPaqB2QC5qgrF
   XhQDZOanuxDd+o/fpJ2UEIzshidP3+aeY1IFljwGsLBpYW3nt2I+eCftL
   E9Uxmp7n/Se+y/Vd+bTou/NTPtkrqhErv/NGKJhMANu8pEdZ2Xei8ovjx
   na5o2Dxatm3k9LZlbeqzCy7TJsckSA7Zf9n/Kzh6mTpnoZRFrcVXEnXLq
   g==;
X-CSE-ConnectionGUID: VGaC6umjRbq7EFSbqqXdUw==
X-CSE-MsgGUID: Rzisgje4S6S6OgJa7TFFPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="110232162"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="110232162"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 06:32:54 -0700
X-CSE-ConnectionGUID: +JswlPEnT262ULIXnxebjw==
X-CSE-MsgGUID: vPkE39LBSP+SrvWYjEwmrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="264457834"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Aug 2026 06:32:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvxSO-00000000dUo-0IDM;
	Mon, 17 Aug 2026 13:32:52 +0000
Date: Mon, 17 Aug 2026 21:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm_init.c:(.text+0x0): multiple definition of
 `liveupdate_flb_incoming_early';
 kernel/kexec_core.o:kexec_core.c:(.text+0x880): first defined here
Message-ID: <202608172134.Nk8vrxnU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pratyush-Yadav/kho-drop-restriction-on-maximum-page-order/20260815-221525, commit: d0e70617c45e88d720e7461e6ea9f2d136a610c4"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pratyush Yadav <pratyush@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-drop-restriction-on-maximum-page-order/20260815-221525
head:   e99e331639f1c4883ed41f9a5201e7c5aec1bdbf
commit: d0e70617c45e88d720e7461e6ea9f2d136a610c4 liveupdate: flb: allow getting FLB data in early boot
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260817/202608172134.Nk8vrxnU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172134.Nk8vrxnU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608172134.Nk8vrxnU-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/mm_init.o: in function `liveupdate_flb_incoming_early':
>> mm_init.c:(.text+0x0): multiple definition of `liveupdate_flb_incoming_early'; kernel/kexec_core.o:kexec_core.c:(.text+0x880): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
