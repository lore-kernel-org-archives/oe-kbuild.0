Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E4922DFA5
	for <oe-kbuild@lists.linux.dev>; Tue,  6 May 2025 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567422; cv=none; b=epr8RRic8eEnPqVV9DKU+FNfZ5Smii3kVSTT2ctOSf98SQrysUPM13JpJLmpPtyolBRzReWqAqDCEmYStS8HsNBlPBcjOS9wx07WXCgooLZdzww5clLur05d9qd1CpIHBxLV2chb0onRY4s2kSIw42g2vGxwaVKTtlris5c18qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567422; c=relaxed/simple;
	bh=oKL62tmiDPRsh3b/cqkIdMdEM64PBGFAh4thvubo/n8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGawfjAyC8zts5FEjjdwq65M7HooOy1cdWm2CxI20NPx+YfS7oIacV3gwcFrFlqX/FkxJhqLMEAAz1x6ZlGZzKn9TgxRdShhoytRRSfvHxIpu8iR4UZjwLkwPD0kYe8izUCoToRgubLCl5rh0sUMs1UDdXxSd7r++V8ujGwtAWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIEPZ3Fr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIEPZ3Fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746567420; x=1778103420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKL62tmiDPRsh3b/cqkIdMdEM64PBGFAh4thvubo/n8=;
  b=aIEPZ3FrF24CCUPAfn0wsdhXoRd8S0XHJLy/ragY+zgT6jUJU/M3kQuU
   nrAejiePQK9bJty5jAjZlssuQoer1USNGIt2JqX+rEItUUkqIuSnH9vEa
   EWFqswVDnlEqw5qhRfCjt4CZJDMG9Zu8y/jlMzbLaUc1QuOQmCtyC9Ev6
   DEBDjegCurhVP9WUlnXOTi7sBE/ZyBn+Co53ufqK5Qm475tjERErJpu8+
   Klojw1ar1g+3X/MEBtfnCzlnUGgOFa3EXHlvlhbSZg3+CixW3dxQ5DZOR
   OM8ap8A7noFfs00jQs3C/NCp6KGlIVQT8b3BoqG1lacVqiJKHMnpACYjP
   Q==;
X-CSE-ConnectionGUID: rwA1aLyNSM2DsDdh+J2yvQ==
X-CSE-MsgGUID: JMlNeEzjRsGcHn2itmHz4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48169070"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="48169070"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 14:36:59 -0700
X-CSE-ConnectionGUID: r0lqUB+kQfmYuj7uF4aCkw==
X-CSE-MsgGUID: wGJEegR7QkWWHr1+0YBJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="135460909"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 06 May 2025 14:36:58 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCPyC-00005s-0g;
	Tue, 06 May 2025 21:36:56 +0000
Date: Wed, 7 May 2025 05:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mbox@ff6b0000:
 failed to match any schema with compatible: ['rockchip,rk3368-mailbox']
Message-ID: <202505070534.Scrq5oHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alex Bee <knaerzche@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: 7b4a8097e58b608638d416bd57469f8a9ab70e7b arm64: dts: rockchip: Add Neardi LBA3368 board
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2051-20250429 (https://download.01.org/0day-ci/archive/20250507/202505070534.Scrq5oHO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070534.Scrq5oHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505070534.Scrq5oHO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mbox@ff6b0000: failed to match any schema with compatible: ['rockchip,rk3368-mailbox']
   arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: i2s-8ch@ff898000 (rockchip,rk3368-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-i2s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
