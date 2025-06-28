Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7452413BAE3
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751104668; cv=none; b=Ox9bSIW3NbRLb13C7pNjDt8EyC6HxOldwqllXI0LDEZylg4uWu/S9ofe54UTMtLixJFse2mvWYl0gzCi7SlfRFsiHlj2QVzuV/dSsA6mqdN4akF+1Nh2v6Bii9j4ypiHjeD++uCe4OP3FG20cxJVZySk6S33zCPYWet1cdRGKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751104668; c=relaxed/simple;
	bh=oehtPhWC83Kkh21u+NBBqDjeJZfDiF9FjzItHcGKnB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PKr3Zt8w2wO4tysQyVkbeuNm/W3lNmO3VsJvwkfMJJPasVpSIc4IRuGMgokTfTDKx10nrF/ptIMps40z3rZHI+vPeM63dPhSxIC52NO+S2CM6vA0S5IbuDVs1ckkIJMmPrlixhKLQc2pvg5048ePmyOWwA06Uhu1UyYnMDTwik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLmsodv9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLmsodv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751104666; x=1782640666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oehtPhWC83Kkh21u+NBBqDjeJZfDiF9FjzItHcGKnB0=;
  b=LLmsodv9Xb4iOfJOabV4Q6LJJbM1rrWerHwLadDZjloS39onvBxOjqzQ
   ymJ3koTWVTWITpkAZ9VQ3Zc9oMj6xAQR7TRiiSjg4nE7l5N1JnYAOsgwo
   lDXHxWHvYqZikaYvRtCsWb6C6Z05sts9gzhMoJQKYG9WCZFDuy+DYKnL8
   isTC2Tno9kBv/GNAaasGcLIvL5Mhr2L7su5BNpa7qBbi7dkOB4xRqTe/c
   7F9MzKXbYaX/UohwrHgJzf6hgOC59Dix93LLQSipn3wPhjWUwIyR1li7t
   aM3VY9ppp8q7KIz/i+FDCCBO1G32AEZC3yJwjzFGsWMqYkvkWq9Rd+lJ4
   Q==;
X-CSE-ConnectionGUID: rhqrAMM9SwqL+agidGluEg==
X-CSE-MsgGUID: aFty/EeWQR6HiLYrjvRfOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53368814"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="53368814"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 02:57:46 -0700
X-CSE-ConnectionGUID: DWiYGEsQSDqFavGH/48KCw==
X-CSE-MsgGUID: fl7+GE6BTLuWgv9lz6Ea3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="183927224"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jun 2025 02:57:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVSJb-000WyM-0B;
	Sat, 28 Jun 2025 09:57:43 +0000
Date: Sat, 28 Jun 2025 17:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-mi424wr 4/4]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: gpio@1,0
 (brcm,bcm6345-gpio): 'bank-width', 'intel,ixp4xx-eb-write-enable',
 'pci-reset-hog', 'pstn-relay-hog-1', 'pstn-relay-hog-2' do not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202506281729.Ss70sxEJ-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-mi424wr
head:   e55d16d975f47bc278d1e7e97b52b0ec26bfa04c
commit: e55d16d975f47bc278d1e7e97b52b0ec26bfa04c [4/4] ARM: dts: Add ixp4xx Actiontec MI424WR device trees
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20250627 (https://download.01.org/0day-ci/archive/20250628/202506281729.Ss70sxEJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281729.Ss70sxEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506281729.Ss70sxEJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: gpio@1,0 (brcm,bcm6345-gpio): 'bank-width', 'intel,ixp4xx-eb-write-enable', 'pci-reset-hog', 'pstn-relay-hog-1', 'pstn-relay-hog-2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: /spi/switch@0: failed to match any schema with compatible: ['micrel,ks8995']
--
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dtb: gpio@1,0 (brcm,bcm6345-gpio): 'bank-width', 'intel,ixp4xx-eb-write-enable', 'pci-reset-hog', 'pstn-relay-hog-1', 'pstn-relay-hog-2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dtb: /spi/switch@0: failed to match any schema with compatible: ['micrel,ks8995']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
