Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B2F1DDA2D
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170380; cv=none; b=IwWHCMw4ccUCtazRcZLJu0iuTtJkspAUKmQLElJ8McPBxOfBABcyGg3Wxz2HrmGsJGqEzdWWKtwIzPrjqAwnRPBn9BaxLq9duM3LL8rLsQIiwzUR1VmPw8lMK7cHKIoEVuzpD+44VZ5L8Vcc6xz7UYjkN9Z+Zv9eXTvj3eCgsRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170380; c=relaxed/simple;
	bh=6rYaSaUOKDgln149WpBRJZpMJaTNO5CydlVRt4HBza4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDBUUestQKXKG/uk3pmVjy3lcpj2jFxhT8d77qB6uQjSo/GdR11/8QYPYe5CWgW54NaVvw2N6elEFUAXVne8iqH3bWp2U2N5dWKsmaQE/FBAwAlxl4y58Bs1fgKO8eVbCUUWpkkuK9XDvC9y8tRgm78W/JgxC0nEawKGTVzCBIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yj+IDn76; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yj+IDn76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736170378; x=1767706378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rYaSaUOKDgln149WpBRJZpMJaTNO5CydlVRt4HBza4=;
  b=Yj+IDn76VpJe0qP6JJLVsjbD518g8zDprrVRV8pc/WPyquNkTLyrn7Jq
   aQfAYgymWW/dlNtSASASsRfmGKG1G/1qakjd1MEGKXiqhms+FJP4ZFY3y
   AWpt+8pMYXF7GX+ANdbuiCjFkmpNxV2RPTSZTMeBFVEEI41byaY6TvGLQ
   7Iys/r4PwPx97vHy5xSdbYolsCpmPq//Tr329A4knGK0hgqH6JB5ciND9
   pYwLe2C3JqDBhtlPVGM3rk/oAMlBhEcPLxIgbCVDiKLIcQsyUlNoqJWpo
   e4B8WJkaAAWDvuhsTzA9Ez+19HHubuANQnJQOLE7T16LVvaTtD3asPUmJ
   g==;
X-CSE-ConnectionGUID: ntNTX+mLRGaU+0x6Ttf/5w==
X-CSE-MsgGUID: bSsz8mRRT/+ox999wt1Uwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36543907"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36543907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 05:32:57 -0800
X-CSE-ConnectionGUID: 2PP7y36nQJSgCgCz8GG6kg==
X-CSE-MsgGUID: D1r0OWdJQt2xyHjuC6fmSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106473721"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jan 2025 05:32:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUnDy-000Cet-2m;
	Mon, 06 Jan 2025 13:32:54 +0000
Date: Mon, 6 Jan 2025 21:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 2/191]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235100000: failed to
 match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
Message-ID: <202501062126.BRyz4XtS-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   3579121c157a4c56e00b67dbb6eb45d963046590
commit: 56e1d91181f0494381b4b82de16e844fa873df43 [2/191] arm64: dts: apple: t8103: Add spi controller nodes
:::::: branch date: 29 hours ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250106/202501062126.BRyz4XtS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062126.BRyz4XtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501062126.BRyz4XtS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
