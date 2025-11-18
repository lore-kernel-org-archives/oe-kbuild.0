Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104E52DE6ED
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 19:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493248; cv=none; b=pRAnfEv12WwUIjkuHqRM+kMXY5bwBl0INxDmRCiSvQ1EJ0tCCEkwL982wRCzbvv3Qwv0okDK1+lT4uRKMlUi34UE6BNaSWjzrxaqMzHGh9d3gaIMdQE2Nfd9DnHM0dZaiIy4WcDUjNq806ibTDwArlJ/KM0LB1Dve83v7lKkJ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493248; c=relaxed/simple;
	bh=oocTLCBqaE0U9J6J4O7LaBgtHFh6QOA5XBhUGjmLh30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMkNhgEW0s/m675GkDSHE23vgJjFZE/RmYns0WrBjWcsypZzM9mAAcmKjfz8bRIrTPu6L4uIywimUiGXCVeETt56/QqapL7qBruI7W3Opp+5OVOD5HrHV/OX1/sm3U4xYNnzUnvasry2d0r6yu0SFsBXhNc77yzL/Kr+lDNcfzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2hMr5Lh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2hMr5Lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763493247; x=1795029247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oocTLCBqaE0U9J6J4O7LaBgtHFh6QOA5XBhUGjmLh30=;
  b=e2hMr5LhXTWCnDpdF8CQQfC0Dxxyxu7iDxECzfC6KEHKeeoRI6FuAzlj
   NUCcNeicGa3fcQuNU0uWyehaKvR79M8jFxABwRD0+GP/rYyAdcPNxD9JU
   HskbUD3ofqnXP4Q8cTNEKl7B3hdqhkss6z/meDHH09WzFaco3NhYk438+
   sXTlb3N7ySkdX4chA1Luq/VR2r+xcc5CGdqvsVCQmQ+1SyfGV3e1tct3o
   EcGtdhEOIK49dJLrtCbTfUoRj1SX9PolzZWzlYlKceipeK0ZYZW6xbwVu
   Bq/vMhLlMlEtatGTwQBjXMoys8EnAOBHI7YZjwWLylMekTeRB/t02wq+j
   w==;
X-CSE-ConnectionGUID: TflafYfzRiGQHeTaeECU9A==
X-CSE-MsgGUID: Qhml9SnCRGmN15aVEaD64A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88179608"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="88179608"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 11:14:07 -0800
X-CSE-ConnectionGUID: YVHTt1+oSY2r8TpfUFYAlQ==
X-CSE-MsgGUID: uriBshn+TS6knBAiUCjUdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190495467"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2025 11:14:06 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLR9P-00026h-1f;
	Tue, 18 Nov 2025 19:14:03 +0000
Date: Wed, 19 Nov 2025 03:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: crypto/drbg.o: warning: objtool: drbg_generate+0x1f0: unreachable
 instruction
Message-ID: <202511190316.luI90kAo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yuli Wang <wangyuli@uniontech.com>
CC: Huacai Chen <chenhuacai@kernel.org>
CC: Wentao Guan <guanwentao@uniontech.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bebe8de19264946d398ead4e6c20c229454a552
commit: 892a79634196d2729b81bb8e5b029d095704df63 LoongArch: Enable UBSAN (Undefined Behavior Sanitizer)
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251119/202511190316.luI90kAo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190316.luI90kAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511190316.luI90kAo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/drbg.o: warning: objtool: drbg_seed+0x1bc: unreachable instruction
>> crypto/drbg.o: warning: objtool: drbg_generate+0x1f0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
