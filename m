Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E043C25E44B
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 05:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531924; cv=none; b=qS1pBYkK8VAb5Ja5gV0XYGHJagAL30PtWXhOEEecjpEw/Vud2MC7Maqre1pS61l8ftM9+CRP8XHPyE4V0lrHZtx2UklVF4oHoqqI/uvLnjajRZRWfSQaakgKR9BL6PLojTQvRV1y2f35D2zrgf9vhaoL0iV5cJZ5Bo4HyL+unFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531924; c=relaxed/simple;
	bh=e0LgwmNlkdAXXjrOhifjMXfZl8RYG/X00mn+kWu85Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FRLbMYS4ryWVS0bk6xyzaywVBXW5vob4h66Q9cNc+6LAjc5EHI02kFMur92s8KDk67cDvZeg5b9WoNwPKB2ym9HIxjqNxvDohRqtYq5+KCi6pxMzYDZc85p+Tm3/wO3owVE2d/GqgjfoFdwDTDmP8xp6B/9eutqY3QiEEcIwOr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtTLMWUS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtTLMWUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749531923; x=1781067923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0LgwmNlkdAXXjrOhifjMXfZl8RYG/X00mn+kWu85Lk=;
  b=RtTLMWUSWXmsDTBgTkoLqA8v48uZnMQR2bKBt4xVqaJxL07+fSg9/wf6
   rEVIyslGSnYS1tdBoEaDTmhrj8zjRYxfWoQ1isY/hl12IFgcEwnRcGSj+
   4Ui8ZWajq9hDvssditsJLUeaD6J6Jbwyq1kFvYgyM9X5YAtvyHkvKVe/7
   Hynow3AF7dRD7RW/s7FphuW/cQrrdAnU6VOScSmPyKQvN6BoU+lfBLbZU
   dJnMA2AS3Fn4lHRGzmZM0RSgRFYDTjcPpY0Okxx4jYu0Aag15SqkvODh1
   1rM6GEq0fmaKGR8a25L7n5MxltmNCNYaOLuxyTziS09yYKc6gL0X9DRSn
   w==;
X-CSE-ConnectionGUID: SzsRiP2xQ0aHWCFxUTtDUw==
X-CSE-MsgGUID: Ebz+bEpwQOGBsVo45esHkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55417859"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="55417859"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 22:05:21 -0700
X-CSE-ConnectionGUID: dHIRkLY4TWGiFC/IfxcilQ==
X-CSE-MsgGUID: vQJeBaGFRoSEHdgrDPKVGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147283073"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2025 22:05:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOrAj-0007mr-2q;
	Tue, 10 Jun 2025 05:05:17 +0000
Date: Tue, 10 Jun 2025 13:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.17-armsoc/dts64 1/20]
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb:
 /dsi@fde20000/panel@0: failed to match any schema with compatible:
 ['huiling,hl055fhav028c', 'himax,hx8399c']
Message-ID: <202506101206.NkoSZzPg-lkp@intel.com>
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
TO: Chris Morgan <macromorgan@hotmail.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.17-armsoc/dts64
head:   208e7e76fbc77775b760edeeb528318992c60595
commit: 6b28769116971a4427ea09ed2cb1cf1afa79ab82 [1/20] arm64: dts: rockchip: Add DSI panel support for gameforce-ace
:::::: branch date: 18 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-051-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101206.NkoSZzPg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101206.NkoSZzPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506101206.NkoSZzPg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /dsi@fde20000/panel@0: failed to match any schema with compatible: ['huiling,hl055fhav028c', 'himax,hx8399c']
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /dsi@fde20000/panel@0: failed to match any schema with compatible: ['huiling,hl055fhav028c', 'himax,hx8399c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
