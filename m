Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B657156F4A
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Jul 2025 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137568; cv=none; b=lF/SmjlMOoechr/vaLX3FJ31nU70S0UB+DqDfmnOBNKlS9yE9lHJacjYRoXhshDukipYTX14hLtObvCmoxcKfZ3Y/oydWOdPF3w6bFRbVDwog3m0a/Tu6mCgc0fu0imMUVbZG9sTSQ63b+KuQ/CRxQRXt35hzUe36mpZiyibUmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137568; c=relaxed/simple;
	bh=+8DZP3fisi7qcFnDEImzNj2yQG0V1kQazKXJZEhzmvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZgMMlnTlHFRgF9S2oRxNTA+Y0ckAvBEHjwjx5uRhg0eZhGzB45nscEHOUriXZUCecAv5kX4ESifbk1tV+OtIxJtjoUG0auNK84SjtXSSd8VvBFiTa/A5KO0+J2oGviIL3tP9Xgzob/muaeBx4NDOtPB5tuuh/uI1j3Wjm/lNDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3VrAbtv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3VrAbtv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752137567; x=1783673567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+8DZP3fisi7qcFnDEImzNj2yQG0V1kQazKXJZEhzmvc=;
  b=N3VrAbtvJfkfi891JIR7hksSUJOrQzY6l4bmNthhpaBtPPpvRerwZIIt
   Rm1FB3bbIgSYsoMrRGm5XnbHepjAf1tRKuIbXe99Xix6jMeJm4McoGej2
   nK7z/yLQX/ETXL+pTuug6GgmwoXtPHjOhPUJpQa2p9bOjKn3JTmf9Cr/1
   NVqcOVwQZayfsDEjhxFOcsZOB04Sp+UsUi7S7Sh05HVBAGrMic2CRjh1O
   wLDjyAm61XMTcyFsnRJr0a27O9lko1/f17mf79Habulg7GYuYHU7Ap5Fu
   rzJEDha/+AmfEGh/AUeIx1dI+ykYY7jnEcdSeETlmeKRIfOq6sAtl/vnw
   w==;
X-CSE-ConnectionGUID: Cjz2nTEZQCmCjn1zN2Q+yw==
X-CSE-MsgGUID: PItpS0Y2QLaRtLMR8FEkCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64669742"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="64669742"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 01:52:46 -0700
X-CSE-ConnectionGUID: Zei7Jkk7R0WgyR535quVew==
X-CSE-MsgGUID: pAOW7KIUSNCOj6u5gYVEsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="155781989"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jul 2025 01:52:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZn1G-0004pb-0h;
	Thu, 10 Jul 2025 08:52:42 +0000
Date: Thu, 10 Jul 2025 16:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: exynos: add abox generic for ExynosAutov920
Message-ID: <202507101616.sBizGfFY-lkp@intel.com>
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
CC: llvm@lists.linux.dev
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
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250710/202507101616.sBizGfFY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101616.sBizGfFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507101616.sBizGfFY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi:18.3-10: Warning (ranges_format): /abox_generic@generic:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
>> arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi:10.37-19.4: Warning (unit_address_vs_reg): /abox_generic@generic: node has a unit name, but no reg or ranges property

vim +/ranges +18 arch/arm64/boot/dts/exynos/exynosautov920-audio.dtsi

f0da8a74de3aba ew kim 2025-07-09 @10  	abox_generic: abox_generic@generic {
f0da8a74de3aba ew kim 2025-07-09  11  		compatible = "samsung,abox_generic";
f0da8a74de3aba ew kim 2025-07-09  12  		samsung,num-of-pcm_playback = <32>;
f0da8a74de3aba ew kim 2025-07-09  13  		samsung,num-of-pcm_capture = <32>;
f0da8a74de3aba ew kim 2025-07-09  14  		samsung,num-of-i2s-dummy-backend = <5>;
f0da8a74de3aba ew kim 2025-07-09  15  		status = "disabled";
f0da8a74de3aba ew kim 2025-07-09  16  		#address-cells = <2>;
f0da8a74de3aba ew kim 2025-07-09  17  		#size-cells = <1>;
f0da8a74de3aba ew kim 2025-07-09 @18  		ranges;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
