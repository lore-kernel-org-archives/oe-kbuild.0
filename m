Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E977B218EB1
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761391738; cv=none; b=VWuZzZdWxCvKbrzhfdMSWYoRC+8CgzziDVyHUcKa4jFh+5JMPGaVpCWca4KaN4ULMrCD+4+b0qdTUrhPjxNrPOF1CoQFxZmLJUrW9BpNCcO8nJcwO+VLpeeYuyGn7QyTuRm9ePT/cQGp+Nq/x8daucpguJqvO4mhIMDHwVhl28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761391738; c=relaxed/simple;
	bh=MGUcwvDnnQcmJ4+Mdhk9F13O3zPM0UaC7E+WP6mDPOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXYqLioeWGcmhBvrv2kMpWCg8jNu1Qdoe38OYdLZkHgbOLJeEop6paa332DsKEhlbvsx1rAvlNrTP3T7rsm40LOluHgW8ZG3UP+yjZ4sowULJoJPAJ18yzpfyJxoYM/ixoEtIhWDQDMdyW8CCFCA5P0RtCUwRWRc5DSW5Y8DsRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TW3MtM42; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TW3MtM42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761391737; x=1792927737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MGUcwvDnnQcmJ4+Mdhk9F13O3zPM0UaC7E+WP6mDPOQ=;
  b=TW3MtM425+uv9dEserSjt0EoKRh+DlV0Q9O45JE53I3khxoPzn80rsWt
   qHOUG0wktGcYJana6CIModIg8jvd3MuGkZnR+FjRDW8bkbwi6+b4fNWhw
   +Wp0QXyIGcZW8/Wdzp+XwbIptQQzylGqNapY9JybmKtqf1/mBPZikYFSS
   NTB2bxWJVcGX5/3AeRROurr1RZYQyxOTsBMZERFRFbKXnRC5RPkY6nUgL
   p2eZxJPlvZLqHCIeHtYzj8jlfOLB5w5KDICTqkv7IUAU8gC8kNz9ZrBue
   DZoz8A/dIirhaOenwzsODqh+R/yt66fPrKXtT/Gpb8Vw/n+46ov/go4+p
   w==;
X-CSE-ConnectionGUID: NCoOoUJOQXCbfo4pbuC12Q==
X-CSE-MsgGUID: G+LY9ysMSnGs7g0p2EQbCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80981330"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="80981330"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 04:28:56 -0700
X-CSE-ConnectionGUID: Ez6FjO27TyaQJMxaZpbhVw==
X-CSE-MsgGUID: bATOkPTEScaydPJFufzU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="183815106"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Oct 2025 04:28:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCcS5-000FHZ-15;
	Sat, 25 Oct 2025 11:28:53 +0000
Date: Sat, 25 Oct 2025 19:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] arm64: dts: exynos: ExynosAutov920: Add USB and
 USB-phy nodes
Message-ID: <202510251822.7oeos3rZ-lkp@intel.com>
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
In-Reply-To: <20251024114845.2395166-2-pritam.sutar@samsung.com>
References: <20251024114845.2395166-2-pritam.sutar@samsung.com>
TO: Pritam Manohar Sutar <pritam.sutar@samsung.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: alim.akhtar@samsung.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: rosa.pila@samsung.com
CC: dev.tailor@samsung.com
CC: faraz.ata@samsung.com
CC: muhammed.ali@samsung.com
CC: selvarasu.g@samsung.com
CC: pritam.sutar@samsung.com

Hi Pritam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pritam-Manohar-Sutar/arm64-dts-exynos-ExynosAutov920-Add-USB-and-USB-phy-nodes/20251024-194927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20251024114845.2395166-2-pritam.sutar%40samsung.com
patch subject: [PATCH 1/3] arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251822.7oeos3rZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251822.7oeos3rZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251822.7oeos3rZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16480000: failed to match any schema with compatible: ['samsung,exynosautov920-usb31drd-combo-ssphy']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16490000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-combo-hsphy']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16500000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-phy']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16510000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-phy']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16520000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
