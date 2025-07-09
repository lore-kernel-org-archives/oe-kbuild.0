Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A7643164
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Jul 2025 02:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752029612; cv=none; b=L/aGw/dr/D/BLIGZaOLCbpks/rgSibXLBSce0wruYUDtHcbbuWGaDj1evMszRM4naXN5LC75gsw3DRklCoX7/+Xpq30oulDnRWZZUup9pr9GENWt+31D8oS9vDt/h9iULp5sbwbeVQxg/RbMS1cZKauzFaPj68GMXsCzyhhEC88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752029612; c=relaxed/simple;
	bh=/xQGTRKC0VXaGxqU0qHYn8ikXUzVH+AuKtU0obbbT7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gg8hmfE2FJSGK93LD45t9wof2rBW3Pg+Lmaeq7nhiJxIvdIlmNS/+RpmVqOWQIM0MwuBfnqulbVbCmac9SZuOB/EM8qxbKKUvjtxLhYX+i02kjRjWer4AZ0RV+jbBTwY/UcEArk2t4yErtzHkZFRX1mDJy65ca8CZTxpGgjVjzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B492MxZs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B492MxZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752029611; x=1783565611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/xQGTRKC0VXaGxqU0qHYn8ikXUzVH+AuKtU0obbbT7g=;
  b=B492MxZsViTgcD8aE2vc/0vEx+bbrs8qti6XOZt7SN1DPm8x7mjvPLt9
   1K99TPs6FpJUjDLh51IQ3HiHKPx5p9f8+3FEtfqwk+v3qg/eRS4IuJWkc
   /BPrgP4+0mkW6sQxHD8l3MvcGcQA6TkjPzbCTE6wmxyWPHS4RcxUtnO75
   If0nFFykknwANvOfl6DTNHJwJleW5ohHfHPt3xmUqkCIgBFJovzI6SqrX
   M9b3w+I7fbjBxr3VqfOqhrRwnG4Rrpce33tACmbV0gxPsjFyzCSChKmI6
   UjLpl4HXWzYw8VZB3hL3SkfCRg8MaIWDGG4Yn+hy/YEz0NX9DE7+BPszB
   A==;
X-CSE-ConnectionGUID: XoS7eGtlQaS99BU0/mYpIw==
X-CSE-MsgGUID: 2wQdM7eoR9y8EhC9Ixo+RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56887078"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="56887078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 19:53:30 -0700
X-CSE-ConnectionGUID: x+GXBn91TRCuJ4vKslHesA==
X-CSE-MsgGUID: rqTcs1oZRG+Qj85PpF6ttQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155065587"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jul 2025 19:53:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZKw2-00030N-1i;
	Wed, 09 Jul 2025 02:53:26 +0000
Date: Wed, 9 Jul 2025 10:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: k3-am69-sk: Add bootph-all
 property to enable Ethernet boot
Message-ID: <202507091012.uud3RINb-lkp@intel.com>
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
In-Reply-To: <20250708084252.1028191-5-c-vankar@ti.com>
References: <20250708084252.1028191-5-c-vankar@ti.com>
TO: Chintan Vankar <c-vankar@ti.com>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Tero Kristo <kristo@kernel.org>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Nishanth Menon <nm@ti.com>
TO: c-vankar@ti.com
CC: s-vadapalli@ti.com
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Chintan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.16-rc5 next-20250708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chintan-Vankar/arm64-dts-ti-k3-am68-sk-base-board-Add-bootph-all-property-to-enable-Ethernet-boot/20250708-164536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250708084252.1028191-5-c-vankar%40ti.com
patch subject: [PATCH v5 4/4] arm64: dts: ti: k3-am69-sk: Add bootph-all property to enable Ethernet boot
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091012.uud3RINb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091012.uud3RINb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507091012.uud3RINb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pinctrl@4301c068 (ti,j7200-padconf): mcu-cpsw-default-pins: 'booph-all' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: pinctrl@4301c068 (ti,j7200-padconf): mcu-cpsw-default-pins: 'booph-all' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: pinctrl@4301c068 (ti,j7200-padconf): mcu-cpsw-default-pins: 'booph-all' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
