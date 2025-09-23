Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6B3321266
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758646409; cv=none; b=KW6fI94yLVu4LLOqAsIAY89QMgXTIHC5FSTMOmrxaFMuWjbWzg9LgAqrQEriWsJY7IJ71XrUp0gXsJEA1uE4YgHcTQvChOfGFFg3OrKewyUYd+HbsALpYw6YI5mtqN3B7cxFVaFK1irgf9WT9CxfJzbr+KmpOnENdPyBLEzLBn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758646409; c=relaxed/simple;
	bh=WiMHc3OXKXBIRFWBnxhwn6CtonUyNmDQkParWsRBNCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGY8M6P9oQzWKB33X20/Ra4o1crXdVsz15F7Wjzi1vFo0PLH8QiqdtSf5YbYb7uzTOAYWhrTAaaIwfrXP+ot35vUvok6jCQM3Feor0HNFMhoIxasCzy23MZof2vH36/UGqbMSBPlONzS8+20G736jDwVyRRHnDNbA35v4OppZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1s7bS8M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1s7bS8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758646407; x=1790182407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WiMHc3OXKXBIRFWBnxhwn6CtonUyNmDQkParWsRBNCY=;
  b=Q1s7bS8Mp51h8kwZIKhbnQWFkGqLm+8UkGtQjXNlBTXpMtcn6YtCaMwb
   DfHmtGCWIS7dtN8PAjlshilUZXxqB5FdHDLqi+Nc4smuuj2gqgMibqGyc
   bhH9g6CKJqrIzZsBfOjbobRB9JFV00kviSk185RV5o4rxREzu11g84ukN
   vRnnSZblml9jLiA4wlp7Eq8naV5u2k3Jt55ysbPlfK1eEdPE7DxJRp5P7
   41eU0gSdoCRHwXFYCEtqQqtCs9OUg3zFzhQV2FZkI8gbYhKb0aj7TRyLr
   f1uggnuFb8fSPDV5bxh1vm55RTTLFgdobYdpqjk7nY5nVNnIZ5Dinyqng
   g==;
X-CSE-ConnectionGUID: uoAHlHztRAuyLzF4yBmTwQ==
X-CSE-MsgGUID: lLmFPjRKSWuC9pEXiy+z2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71555809"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="71555809"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 09:53:16 -0700
X-CSE-ConnectionGUID: yHRmRhZqQfGBCmsn0pt7gQ==
X-CSE-MsgGUID: GiIgPDqRQcGRfryXTH7bIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="207743226"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2025 09:53:15 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v16GO-0003LB-3C;
	Tue, 23 Sep 2025 16:53:12 +0000
Date: Wed, 24 Sep 2025 00:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: apm-shadowcat: Move slimpro nodes out of
 "simple-bus" node
Message-ID: <202509240017.YGXrAnMJ-lkp@intel.com>
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
In-Reply-To: <20250919161509.1292227-1-robh@kernel.org>
References: <20250919161509.1292227-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: soc@kernel.org
TO: Khuong Dinh <khuong@os.amperecomputing.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc7 next-20250922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm64-dts-apm-shadowcat-Move-slimpro-nodes-out-of-simple-bus-node/20250920-001650
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250919161509.1292227-1-robh%40kernel.org
patch subject: [PATCH] arm64: dts: apm-shadowcat: Move slimpro nodes out of "simple-bus" node
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250920 (https://download.01.org/0day-ci/archive/20250924/202509240017.YGXrAnMJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240017.YGXrAnMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509240017.YGXrAnMJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@200 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@201 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@300 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: cpu@301 (apm,strega): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: refclk (fixed-clock): #clock-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: /i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: /hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: soc (simple-bus): reboot@17000014: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: socplldiv2 (fixed-factor-clock): #clock-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-factor-clock.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: pcie@1f2b0000 (apm,xgene-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apm,xgene-pcie', 'apm,xgene2-pcie'] is too long
   	'apm,xgene-storm-pcie' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
