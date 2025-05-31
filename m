Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487972236F3
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 11:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748689805; cv=none; b=TeLtDrVe37gBzjgHzRNHr3VP8Wo1HJKaD21wddS1EfyB5FX8upiuaX4QxMq9hQYnvu8k6qjQbsW2Fhf+611UWIjxu/jfXFO3vjS/LGkuELtN8cewy0lr7b/lfxott0GT137BKOVFfvnMTM34BSYRDtwcPVP/PHv9BD6rsChlAlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748689805; c=relaxed/simple;
	bh=YkBU+otRVlIoNIsynCCpIzMFIv+eNYGGMkKBArYMMhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HU4gJF3tTmT5FcmYjup00dKhQ1UfgjlVUvRjHnW7/ks5ulidGxBV5mnUbCpWBWPr4wjzEsNZl4lR30kaMt5ncKXBcBRE+sChW+oHt4KegbIktnlNDQZKZqpL8Zu7jn5qt8EdHz0hrpug6lr4uYgP8A8Z5b+KpoLyGiuugJJ972g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgoGPCVf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgoGPCVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748689803; x=1780225803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YkBU+otRVlIoNIsynCCpIzMFIv+eNYGGMkKBArYMMhI=;
  b=PgoGPCVfFZZDjkvQvrN3z6clld+/MbIrflr0KjmbqorIwgvDBrpojgmN
   7TRW7/tFURUQ2iWLPzhpN/DfVMS1Zlt7FT/ZDFMaX6bnP5srye1/pGoIq
   XgjUFELrZX+5d5vlstsXa/BSTH6f1vVS05g/jUN0I29piF+dMUKNG77H0
   ykJntMFA1tYfNurEjlFaWPHk+OoyrAuzUCuVRS9hXgPggV66cIzK3ZNql
   Ndl1nyhasqcSydNvFXGv32yfmK16uGYEP0tX4n4l08Tj/xjHrs6n2LY8w
   HB1REs2VyOx7L3sGhlK4DygR74v42m5eIim2t02v1YFH6q53jAmq5iY6v
   Q==;
X-CSE-ConnectionGUID: y0WzGFg7Q1aRQpgZzfQH0A==
X-CSE-MsgGUID: bA7sWfCySNyLMLROBLLIbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61395313"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="61395313"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 04:10:03 -0700
X-CSE-ConnectionGUID: ZCVQNXk7Q/6sqynuglw/FA==
X-CSE-MsgGUID: fPaYLJqUQMOZCBgChCG61w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="143964305"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 May 2025 04:10:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLK6B-000YM8-21;
	Sat, 31 May 2025 11:09:59 +0000
Date: Sat, 31 May 2025 19:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:master 22/33]
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb@15820000
 (renesas,usbhs-r9a09g057): interrupts: [[0, 751, 1], [0, 752, 4], [0, 753,
 4], [0, 754, 4]] is too long
Message-ID: <202505311823.JqjTNxPT-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
head:   0cc4c9c39e8953745481c13288a46edc616dc7cd
commit: 2e0689aebaa723c9d5333e217e04b2d7fef93d07 [22/33] arm64: dts: renesas: r9a09g057: Add USB2.0 support
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505311823.JqjTNxPT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311823.JqjTNxPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505311823.JqjTNxPT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb@15820000 (renesas,usbhs-r9a09g057): interrupts: [[0, 751, 1], [0, 752, 4], [0, 753, 4], [0, 754, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb@15820000 (renesas,usbhs-r9a09g057): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a09g057' is not one of ['renesas,usbhs-r7s9210']
   	'renesas,usbhs-r9a09g057' is not one of ['renesas,usbhs-r9a07g043', 'renesas,usbhs-r9a07g044', 'renesas,usbhs-r9a07g054', 'renesas,usbhs-r9a08g045']
   	'renesas,usbhs-r9a09g057' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a09g057' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: usb@15820000 (renesas,usbhs-r9a09g057): interrupts: [[0, 751, 1], [0, 752, 4], [0, 753, 4], [0, 754, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: usb@15820000 (renesas,usbhs-r9a09g057): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a09g057' is not one of ['renesas,usbhs-r7s9210']
   	'renesas,usbhs-r9a09g057' is not one of ['renesas,usbhs-r9a07g043', 'renesas,usbhs-r9a07g044', 'renesas,usbhs-r9a07g054', 'renesas,usbhs-r9a08g045']
   	'renesas,usbhs-r9a09g057' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a09g057' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
