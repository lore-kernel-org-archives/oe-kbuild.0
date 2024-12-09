Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B51E515
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 20:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733777563; cv=none; b=VbLc/4CGmNZRwEkH+JrD/+nGZhhr3Pk6IUUtBl15xko2VHGKJNIpoxl0QyxbRzA2ecutqPhCQB46AQt+YYAvAjHj4wCxTI8rnAQ/huE5Srwc++QQKZ81k+3v+r5JO/kIBfxCinvonAMw8V+nN9HZmcMcApfZMNWwZEfOYxB7mAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733777563; c=relaxed/simple;
	bh=Zyy0COcS5nz9wVkgaXb3lGGEKB+emCxKE5ROp/INBd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+WvSpuOsJRs7tmnymqvy/Na+ZqQ6SBgfrQW0nOXxRtl52fu2XbvG1pfWeskH5o/te7+Fgxr9dnoj4UwN94V9L5PrsQxwdG2KMdbJW03/ES0crgJ2yUy/dzQ+BzTyAAwT2aXE89+2n7p8flpvlKXT8vIsmURMUThq2xomyhzV/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSV/wGIb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSV/wGIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733777561; x=1765313561;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zyy0COcS5nz9wVkgaXb3lGGEKB+emCxKE5ROp/INBd4=;
  b=GSV/wGIbaeWSqV0vAhvruwLU+PNsHldQ8JEs3/vc0VMcvoDbScuKeVSZ
   u30pYSbyjcNX1N3MGEwQgjR8701AIEP94cn8IZAjR92zQTk7ozdX1uY3f
   gESZgVT5Idr2kbfiX12g7ojOuRx6vChQmCtHfs2iudxPYcrtLdTTbk81i
   pKyAM6JpDWdH0ceSsFFmDxh1rKA8KGxLBCocqJjYRyxdNG4OKBYNO55GP
   THUyKRmaIWzb+5wnRFamax9AA3b3Mt7GLZfYRM7veyC2rbmn/7w5+8Sjz
   LmpopcS9iog5aQuIGId25kdisPlFvrFSaB0qb0BIcR4GkxzTx2ACzWkXx
   A==;
X-CSE-ConnectionGUID: QjkX5xctQ+enUoYUWv8+vw==
X-CSE-MsgGUID: 9Y3gckKNSQS4LyUzOGVn/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44568136"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="44568136"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 12:52:40 -0800
X-CSE-ConnectionGUID: 8LCJOyOXTEiz+1df3yWWHg==
X-CSE-MsgGUID: ppDRJ6caQsKgHli3/qRrNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95640981"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Dec 2024 12:52:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKkk8-0004o1-2S;
	Mon, 09 Dec 2024 20:52:36 +0000
Date: Tue, 10 Dec 2024 04:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 28/187]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any
 schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
Message-ID: <202412100427.sNA0n8YR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   5553f8f1fe2a6f02eded3969869311b465aeb258
commit: 1dd6eacb938db7f46e9c03ab89282456bd4a40a4 [28/187] arm64: dts: apple: t600x-jxxx: Put in audio nodes
:::::: branch date: 4 hours ago
:::::: commit date: 12 days ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241210/202412100427.sNA0n8YR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100427.sNA0n8YR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412100427.sNA0n8YR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000: iommus: [[140, 0], [141, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@1302280000: iommus: [[144, 0], [145, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000: iommus: [[154, 0], [155, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@1302280000: iommus: [[158, 0], [159, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
