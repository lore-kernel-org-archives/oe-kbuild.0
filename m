Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9E718EB0
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631383; cv=none; b=GRrhpZv326deQUThrPrXrEQH4Yy78gHn812BYhDitBrAv4LCdL8SQjMpMSTwPUJVH84Vnvp8THwUptKMvt3WUA5wYo1XWqoSdz/d5NTccVTc3L7XK9T2hhYd6b0NIK/dInfrE5ZzftNU8kMElnmNQtgkLMdtaguXO69PIAv8XTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631383; c=relaxed/simple;
	bh=i/fxzKgimbs3yIEbgjwaydEi40QB3RnAOjp3WEedNIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eLafND+lnZOSmuK2Aw0z0juL/uyDFrwWLpe9ygvmDtx53mpAWSicJqqFuqxo1uVOE7Gm2jV1+zSZcpxH1S5nW6PEutzzRfUAB2ttHEwAw5jt8hY+2p677FlLXJ0qUZ9cz5xWe/9dhrk5OfQlBYyVNAHKRXU/u2ILTQlL+eK3uVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h37I9MsY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h37I9MsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746631381; x=1778167381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i/fxzKgimbs3yIEbgjwaydEi40QB3RnAOjp3WEedNIY=;
  b=h37I9MsY66zV2kf5pqa9RXy7BO/ZmDxmnOF1J/0DXLqWY1orxDjdTxMV
   Q97aQRMohtrmom9BOPCqRrINc9NKBCm/LPyVvRG94g6FHWlDA86paWEiU
   Uvg7Viv5s0vp8fgv5MrhVooKMxy/RyHgGfclClStIFMgmrqBtKpB/Jj1G
   Y0E/RZw8exmAPAEPXBkpsqEDVfDAL2hO0xBIHKDmdNhDGJc1XkuamUKqv
   3n8wgFWNqUgKjLGDWDAVOcsYocqH5a23QKCcnGCENIT3PmrnOjMPOvwrE
   bXqWqhXsyq3K0rcuGn976gphoxRNowp332eOZvtIwHx7psL4b5+1MpxTR
   Q==;
X-CSE-ConnectionGUID: 12z7kWMIQlqFpSYQt8GIvw==
X-CSE-MsgGUID: 0aU1w4BeTPewh0ic/OYKSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52186922"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52186922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:23:00 -0700
X-CSE-ConnectionGUID: b3YG2Mz/SYKXryXdttSBxA==
X-CSE-MsgGUID: H8gx0R9yQyWf6alThz7ylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="173179085"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 08:22:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCgbp-000845-0G;
	Wed, 07 May 2025 15:22:57 +0000
Date: Wed, 7 May 2025 23:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 -next 10/12] arm64: dts: broadcom: Add overlay for RP1
 device
Message-ID: <202505072315.Dm7J9s6J-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <4bd8dbb374f15a01e3b3ea27f9e802cd702c1bab.1745347417.git.andrea.porta@suse.com>
References: <4bd8dbb374f15a01e3b3ea27f9e802cd702c1bab.1745347417.git.andrea.porta@suse.com>
TO: Andrea della Porta <andrea.porta@suse.com>
TO: Andrea della Porta <andrea.porta@suse.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: Krzysztof Wilczynski <kw@linux.com>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Derek Kiernan <derek.kiernan@amd.com>
TO: Dragan Cvetic <dragan.cvetic@amd.com>
TO: Arnd Bergmann <arnd@arndb.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Saravana Kannan <saravanak@google.com>
TO: linux-clk@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: linux-pci@vger.kernel.org
TO: linux-gpio@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: Stefan Wahren <wahrenst@gmx.net>
TO: Herve Codina <herve.codina@bootlin.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250422]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20250423-025437
base:   next-20250422
patch link:    https://lore.kernel.org/r/4bd8dbb374f15a01e3b3ea27f9e802cd702c1bab.1745347417.git.andrea.porta%40suse.com
patch subject: [PATCH v9 -next 10/12] arm64: dts: broadcom: Add overlay for RP1 device
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-003-20250424 (https://download.01.org/0day-ci/archive/20250507/202505072315.Dm7J9s6J-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072315.Dm7J9s6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505072315.Dm7J9s6J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /fragment@0/__overlay__/rp1_nexus: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/rp1.dtso:6.8-11.3: Warning (avoid_unnecessary_addr_size): /fragment@0/__overlay__: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +3 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi

ac266e4bf6f33e Andrea della Porta 2025-04-22  2  
ac266e4bf6f33e Andrea della Porta 2025-04-22 @3  rp1_nexus {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
