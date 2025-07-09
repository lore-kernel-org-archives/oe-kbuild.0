Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F49526B74A
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Jul 2025 23:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752103298; cv=none; b=RJyoHlZnNRyqdH8vshmr5MWzj4l8zbdDAJaPFGIjaHl49p51mhNZX9bvhJn6tuUVM36rbRK/UaIqKky5N+zFBRpxl3oRsjh7YjgE/TCZUi6dLbbPMcXxT5XDTL1wBtbrzeb2kDGEMfXYDwAZhLTeV86+8X/jHSE4fsqAJqv1EBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752103298; c=relaxed/simple;
	bh=T6skmbV5REXvYSk3Fg4mzm8Etu4a6e//4us6ExU1oFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=snOOkl3UWA/xx0VZY/yyH1zw32cuByxfRUe66fm60tHjh+zWMq6st4fw1tFdWXeTeiT12TtuevvcAooeE4F06gwiKP6qcKFZJ+3qdGfdLimwX2Z8kI43ojnn6pd6uQSTNsKu6PtVrbmfzt4nA0pbMeNN3h8d2hirwVks+cyFvHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/r5frt+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/r5frt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752103296; x=1783639296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T6skmbV5REXvYSk3Fg4mzm8Etu4a6e//4us6ExU1oFc=;
  b=Q/r5frt+/xV4Ylx7hxe9Tu8hD4Qe6KyAlm8P58ROAYnlKscODfHl314m
   kg8696XVgxSqeapXmWH02J19fslDJtpvffLyoowd800MYknrHsIB5fsti
   BFmwIFoh/vvfidJ7Vm6l5LBw7Yid2wxSWaOHc4z8PNWoSc6j6E3tdqiPW
   0I31KMsA3ZWsylCwN80u0PT6uBWapGd7snyFGmxgWp3ecNPmX8WQ5/jnK
   czL5QguJmKrJoVspH0n/14kvyjrjqKI4wnuBN4fDOiNOEmPt4UsRtEkJR
   2NMc8PO2YiYV06dWqktEnCIbgYwQXHoW/J2ay87UhHF7WgVCADBrhfEKn
   w==;
X-CSE-ConnectionGUID: 0+1pacccSx6nG/6Wm2nX8Q==
X-CSE-MsgGUID: SEZex6bORIKZtPPNCq824w==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65074197"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="65074197"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 16:21:35 -0700
X-CSE-ConnectionGUID: 8vrIn0YEQxuSVbacgvlCYA==
X-CSE-MsgGUID: QjdHV6SPQRq9P6mdG0vBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="161464651"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jul 2025 16:21:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZe6W-0004C7-0V;
	Wed, 09 Jul 2025 23:21:32 +0000
Date: Thu, 10 Jul 2025 07:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: exynos: add abox generic for ExynosAutov920
Message-ID: <202507100751.tuzqyGqR-lkp@intel.com>
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
In-Reply-To: <20250709001210.379418-1-ew.kim@samsung.com>
References: <20250709001210.379418-1-ew.kim@samsung.com>
TO: ew kim <ew.kim@samsung.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: alim.akhtar@samsung.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: ew kim <ew.kim@samsung.com>

Hi ew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on linus/master v6.16-rc5 next-20250709]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ew-kim/arm64-dts-exynos-add-abox-generic-for-ExynosAutov920/20250709-082511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250709001210.379418-1-ew.kim%40samsung.com
patch subject: [PATCH] arm64: dts: exynos: add abox generic for ExynosAutov920
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100751.tuzqyGqR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100751.tuzqyGqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507100751.tuzqyGqR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi:18.3-10: Warning (ranges_format): /abox_generic@generic:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
   arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi:10.37-19.4: Warning (unit_address_vs_reg): /abox_generic@generic: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: / (samsung,exynosautov920-sadk): 'abox_generic@generic' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /abox_generic@generic: failed to match any schema with compatible: ['samsung,abox_generic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
