Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C508249625
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 18:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222482; cv=none; b=E7TTX9LPTnoDJ3gBJ1wtFOc7mwvMK4R226EnZBn5kIXASCW/F8Z5MomPWchFqEBN05WP+tpw5fIGq8QsJAH4KqECbMdW+iKMioG1LTtC2Ruyr7ewxRcYlJQ4LFGjI7e/MrrLzFtLiCANxBygBhcjkC4eZnpOs9NK2AjGP1Y+LeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222482; c=relaxed/simple;
	bh=TExNF3tCcNaOYawwcmuFZj7lsf+gUsJ4q5qX9n30vh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lIkAVNTJC5skPdNFisslzNXYiEY83JpPMQ13t+wtVw+3hT+tlvEOV3GJwpYHu5tG15ynBj4RIkGEVh34ENCwx7OajRnwrsWEDNGi2nTqnD8Cs56lJtEzaAvDqzf1NFh7g+YI3Oo4LWp264CARiCuPvi1dk5V/zzZFZKCCplSKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqV9DARA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqV9DARA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751222481; x=1782758481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TExNF3tCcNaOYawwcmuFZj7lsf+gUsJ4q5qX9n30vh0=;
  b=SqV9DARApdjXx+6BL4TEH8Z55ytyo2yYgQV5CaKUA4uyIhO33TG4i9/F
   DFYneK2S/0J7m3xh3zZysatAngzI81vEaypNd+AlvG1nl6FFsiwhmC/Ze
   lH7gGHhsL62gCjJFAbkwKc/SM5BUjdLDMQQIlzGddFWEetFxwLaHmebTr
   i7WqGUoiUvwikjrn3eGJGm5Dp08mmO2TILQwuo8FcZRWBtk+RPPwAIh9y
   ZBzVr4B9DR4sHXicLYh5X0uFoYvpauwd0U+TjPXpVAn1pHsZpJKx/fPy6
   pAb15oY7PLTsT6YQR2WASWYgy6dgLAMLx9kR8ge6lu6gbDm5wGyezb+nd
   Q==;
X-CSE-ConnectionGUID: IDTz0NryTa+zl3wpkH3EFQ==
X-CSE-MsgGUID: qr1zzxEkTIWUyxkT+lXLow==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53176305"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="53176305"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 11:41:21 -0700
X-CSE-ConnectionGUID: 7OgcvHiWSTqW+WVNtp9R6g==
X-CSE-MsgGUID: JGvrhl9EQZeAp1mUVMpZPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153450581"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Jun 2025 11:41:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVwxo-000Y9e-36;
	Sun, 29 Jun 2025 18:41:16 +0000
Date: Mon, 30 Jun 2025 02:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-mi424wr 4/4]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: gpio@1,0
 (brcm,bcm6345-gpio): 'bank-width', 'intel,ixp4xx-eb-write-enable',
 'pci-reset-hog', 'pstn-relay-hog-1', 'pstn-relay-hog-2' do not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202506300205.61p62lrD-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-052-20250627 (https://download.01.org/0day-ci/archive/20250630/202506300205.61p62lrD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300205.61p62lrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506300205.61p62lrD-lkp@intel.com/

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
