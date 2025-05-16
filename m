Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ECD182
	for <oe-kbuild@lists.linux.dev>; Fri, 16 May 2025 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747354230; cv=none; b=qzrAq10a94FkVLE9sgpmIFm50E98+mbh+ff9L8ewRhWaUoe4ascGmbOrFfdDXAeqGuQtab97GEooonSE3C/YHewKrPU3xTMUFXKKrhHIA1tUURpUKDxOZMxx1K0ZzJ9rZqcgtyf5VDmL9DM2NHP4muNxJepgmYxWZ+Jyrqw+p1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747354230; c=relaxed/simple;
	bh=cU76iWnx0w5J3IXFRwcTx7H23B4SJUIhPzlPdFkJTxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KjorM2hFnK12eCv72yqbgWCYGLK1gVGizy3YB9TTa/Z5kkAGn4lSHhq8qPtVUFqyMA4BlBRguJGdZ1XcS0uPW0tUtqjMoTdfI6qep6vcwDlG7OFfbeMh+GiAx8V1HlxOZhH37a4MJlxkIfZAwpOcCff5gf6Y5WszDMxn9vwTy0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkkunqHB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkkunqHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747354229; x=1778890229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cU76iWnx0w5J3IXFRwcTx7H23B4SJUIhPzlPdFkJTxE=;
  b=EkkunqHBPXUt3C4rcJAo5wVyNsFCletM4veHTfIoJy8jyBXeAncs5Res
   tBQiU3NsOvadywDOI03J5d+E6y2chyQqE2NEiYV8csY+uOX65xcPxtFVz
   S95na9DvdlsyIJu29Lh3bqt9HnHECnVHiXwb2XvwMulpEaUnAOwcJ9/xx
   Aq1sx9RiIRcFhDI3w5J3K3fnLP3fhRp65wy+QBCOfuo6IsBC8v70Twh/q
   jzI/kCFNR2JSEPOXQpVhYX49LBJGnBZTrpmlpc7q8xNw4FD6v7R980Klh
   hkyo7H65nkqVhtCZUdS/hb2nCzgyyllZ/erwV54VfLkXQWttHkISxpWJf
   w==;
X-CSE-ConnectionGUID: xcxAjWM+RoCWjPNbgip/Yg==
X-CSE-MsgGUID: CFcapQ34R3erzJbLVC1Z0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="52989664"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="52989664"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 17:10:29 -0700
X-CSE-ConnectionGUID: gOe5ao7YSxyrgyU9Y1CpSg==
X-CSE-MsgGUID: Brf2TU3KQXyj1JLbEhrpVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="143301465"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 15 May 2025 17:10:27 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFief-0000K3-09;
	Fri, 16 May 2025 00:10:25 +0000
Date: Fri, 16 May 2025 08:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.16-armsoc/dts64 66/86]
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /edp@fdec0000: failed
 to match any schema with compatible: ['rockchip,rk3588-edp']
Message-ID: <202505160830.X2KizpwI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.16-armsoc/dts64
head:   1631cbdb808963354ef6b6454bc617cd15f90718
commit: 376cb9696298df2028afb620a9dc6c4b10a18605 [66/86] arm64: dts: rockchip: add Rock 5B+
:::::: branch date: 11 hours ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20250515 (https://download.01.org/0day-ci/archive/20250516/202505160830.X2KizpwI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160830.X2KizpwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505160830.X2KizpwI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /edp@fded0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
