Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BCC246788
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 05:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438686; cv=none; b=rSz1phBukkP+r4kDN2xq6X1y1h6tT9aN4r7gX+d/vJwTbTd6vlAZD7EWXKT24T18DXDYCBCd28U1vFzyNzfwwEtTGzrtFlogpr8SrRrHMXwSh3M3+zzuPhUFJmDpb6sz4VTYFN4pcNl1cf4UdxvA8bEhiKof4FhCzYkyqewIgYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438686; c=relaxed/simple;
	bh=kp09VlcGd/bys6YA2hlSkfu63AweIbgNfRHRlRZ1vm8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q+tAkOg8nJkC9V/WrHq/KDUJTgEDOvMryd9Enb5KNGGGipdjTOMSjJ8SfpmA3cQSo28gbOxf3VmZe/G51uVQWGjftpXBYL4oM2FD844HCgoyNeCxwYzedGFaM9AtTeMTt/hdkvEn6/YFhdq0jAaDmTtpwTqgcZig2aQRonBiRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TO07xsLg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TO07xsLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791438685; x=1822974685;
  h=date:from:to:cc:subject:message-id;
  bh=kp09VlcGd/bys6YA2hlSkfu63AweIbgNfRHRlRZ1vm8=;
  b=TO07xsLg/mAcN7k3t9D0hFt2+zHh2kL8mfLab0kMWdhQxmIS1l+9Nhyi
   DE5XcQCaDr/+muwq0En/gs434Axy7dQHsyH+eVEi/OkOkmaui7NFjr7pm
   dUfYurgiSds8csCS7+F2+FgRwv5h/ayEWDWdhjBACYpRizZK1CHHPNp16
   TS1hSNduD1Xq2tI42naqY9DSdtDBBzHDeODYsZB9zV6JqoOlejnFl4TYB
   7N3bt2vNwGCAUyjvV3ultGvkeNZMjPFEBpMGMAMCH9IOhABUHaqEAnBSx
   f4iJq/MD+Z7+jHfpQqT6uB9O/psEpfdBJV2Fx1YbTDcm7y3l6kE9ExNAF
   w==;
X-CSE-ConnectionGUID: LStWoxyJSnOqD5C6TA5s7w==
X-CSE-MsgGUID: XqZ9CECIQvaw2UWHO7HyoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="208329"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="208329"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 22:51:25 -0700
X-CSE-ConnectionGUID: KLF+bOi4TTaatdqhRtSZAg==
X-CSE-MsgGUID: E4SPdX/CQXi/I6fEUiDLNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="254178"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Oct 2026 22:51:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEh2H-000000004t3-2WqY;
	Thu, 08 Oct 2026 05:51:21 +0000
Date: Thu, 08 Oct 2026 07:50:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-pinctrl:devel 70/73]
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pinctrl@10005000
 (mediatek,mt6795-pinctrl): interrupts: [[0, 153, 4], [0, 154, 4]] is too long
Message-ID: <202610080747.rsC4F89M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-gpio@vger.kernel.org
TO: Yassine Oudjana <y.oudjana@protonmail.com>
CC: Linus Walleij <linusw@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   7c402485c56380fdc06e00c6fcdae903f63d9c89
commit: 2035f19379581a9014adb4482bef732a7fe85f1d [70/73] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-2400-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080747.rsC4F89M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080747.rsC4F89M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610080747.rsC4F89M-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pinctrl@10005000 (mediatek,mt6795-pinctrl): interrupts: [[0, 153, 4], [0, 154, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@14000000 (mediatek,mt6795-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
