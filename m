Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B15464D
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 01:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758505235; cv=none; b=rH/6JR3hKjD/wfvX2zXXNl0TImPjzuoVyk6Kh0UBT95I69j3WrGYJHVcT+kS2McPW5nd51VfPshZbIvHAIcLHhH2Bv8Z8bGECTJLnoayOy9MvF5kcVC+kQ1eo9sCameQWF057Po6bXB7ekhwhij8pU1spCD3BIUd7G6TJsXrFac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758505235; c=relaxed/simple;
	bh=AZIi+quLuPzN1/Bz4HRxso456ff4BlyEjl4HKewgHkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjHsS3Xa+20zGi7d45Ze2WrWsYn/IPugnWtdQHnp2ryFQcc3DWGHPBckrJQ8zAoP3MnSGRIlBGzzWjWDq+xoxJQzBDSecZtL0azhYhsuQx7ggiE3pBm2Ml5/OIYmNjSdgHaiIcbdS18sTzKDSzzWHqyJy3BPaWOwW8efB/X08GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iw4mULX/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iw4mULX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758505233; x=1790041233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZIi+quLuPzN1/Bz4HRxso456ff4BlyEjl4HKewgHkA=;
  b=iw4mULX/3TCvW2w+ZYkrJ6bCPQD0HnbCDyQ7rgvWTDXCDsSWpsSJhv7g
   bvyqmWQFTmdcj8NOj09Kq6pgEXLYT93x4xd27N6upy73zDO2GweIzAjWJ
   tA+dxr95Jw6ARLhh7flEDSODeP/G/Li/E3rHbrvEP5T6vSxsgNpD2cTgX
   cJiZ5P5PbcjJPm2I1PBdAIH8Bs9Zyq4lARIUUuk8W80YV32Fy4Z/X1Mop
   mWhrbcFVf5ncW/NP4DkGRo7oTKs/mdQBRY74vuRTZgsm0HbHMKRguWTL6
   auy0C8pGhGJg9ez27+U0UYJ3tTmsBBTKHwgXLlP10Uto4Pjkyg+uk6eJc
   A==;
X-CSE-ConnectionGUID: oO41DgvQQmOHtkt1Xaxtyw==
X-CSE-MsgGUID: I+uk1Bt1RtSTPYO26IxIwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="78369141"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="78369141"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 18:40:33 -0700
X-CSE-ConnectionGUID: NA8MgeK2QUWB4WM5winkOg==
X-CSE-MsgGUID: C4CVdYcNQj+9Alr3zuMJmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="176787999"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Sep 2025 18:40:31 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0VXV-0001Cn-0V;
	Mon, 22 Sep 2025 01:40:25 +0000
Date: Mon, 22 Sep 2025 09:39:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7981b: OpenWrt One: set
 console UART to 115200
Message-ID: <202509220924.RQpKrqSJ-lkp@intel.com>
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
In-Reply-To: <20250920000619.2643457-3-bryan@bryanhinton.com>
References: <20250920000619.2643457-3-bryan@bryanhinton.com>
TO: bryan@bryanhinton.com
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: linux-mediatek@lists.infradead.org
CC: angelogioacchino.delregno@collabora.com
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: matthias.bgg@gmail.com
CC: robh@kernel.org
CC: Bryan Hinton <bryan@bryanhinton.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1522b530ac3e2dadd75ccb351b88d3c7c4cf584e]

url:    https://github.com/intel-lab-lkp/linux/commits/bryan-bryanhinton-com/arm64-dts-mediatek-mt7981b-add-labels-for-UART0-1-2-nodes/20250920-080820
base:   1522b530ac3e2dadd75ccb351b88d3c7c4cf584e
patch link:    https://lore.kernel.org/r/20250920000619.2643457-3-bryan%40bryanhinton.com
patch subject: [PATCH 2/2] arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250920 (https://download.01.org/0day-ci/archive/20250922/202509220924.RQpKrqSJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220924.RQpKrqSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509220924.RQpKrqSJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: serial@11002000 (mediatek,mt7981-uart): Unevaluated properties are not allowed ('current-speed' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/mediatek,uart.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
