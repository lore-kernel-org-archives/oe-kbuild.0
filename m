Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9352FFDD6
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 17:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261761; cv=none; b=ZL6S9mm+remYUhcMZPkY9EeFKGbgTyNp0H9EabCpKiEG52iWjsz8ZabQ0ZskJoYaTbPVDzZm/AUgGMvXnHHOdyRfNbvVj+YtOpz2/bvKrgaV+TKj7ApACs3M4qDhH528LzyuY0iTzY1EKa0fCG8hOfV+ZmM1uDM0n7LqXQMc1Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261761; c=relaxed/simple;
	bh=cerV0EVA4rKo3r2bFMl27q9nFUjrtVmu9Bga0EkUOno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sMjuEsCTIk7MtLcEkzhG+xPRP8KS6IrWa0wDAaiwu0vuz+VlfBQjTIjoAq0xn+ehPsWFwgc10GFF+g1nILCXFki8O8DaPCpGm27tfJiK5pBTiKyl0irbphG+KjuN8aYmr32qESiytz1hBZsKp04kzCI4T3+7H7Q/E0rDo2iD4l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EobFLsvI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EobFLsvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778261760; x=1809797760;
  h=date:from:to:cc:subject:message-id;
  bh=cerV0EVA4rKo3r2bFMl27q9nFUjrtVmu9Bga0EkUOno=;
  b=EobFLsvIoBxxG0vK9BnG6ix10amWv/jQftAxoFrxQ6NlxkMta0NBOx8J
   cINtJfmuouAH4+65HwgTMUzSi1XDwfF2y6g0Z7ItJk7eRqCBbhibZrN0w
   cvBwxLzo8HjFFyAr2VcDw8r5nw4fJeX3rvpzhKV/aytB5ixbemLj6xvGc
   pT57oV1ud3rr6GkS9uWKKj7JvoymLrhV7AlnA0wRHjdSkxu62aNO0Z/ti
   VDmfte0OLB+GHoLrr7SlsLmJ6GU+wCI/cUJwLbKD7MfgEUmwN+DUa+1Da
   yTF4bxSfTljB82eQAQGhpZjAd1mS0wkg70LwqqXdj8cwnDlrPPf39SjrE
   g==;
X-CSE-ConnectionGUID: FTPVKmC4TKS4TGdZV/wnvg==
X-CSE-MsgGUID: zi52R/IbQTeV3HHvRZx2Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79259258"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79259258"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 10:35:59 -0700
X-CSE-ConnectionGUID: K08hiUpJTAOpUBgmPePgWQ==
X-CSE-MsgGUID: dVEw618JQGSCRYCOJ2by4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="230433425"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 May 2026 10:35:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLP7E-000000007EN-0hDa;
	Fri, 08 May 2026 17:35:56 +0000
Date: Fri, 08 May 2026 19:35:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v6.16-next/dts64 9/19]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000
 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts'
 was unexpected)
Message-ID: <202605081920.FY92eJ9I-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.16-next/dts64
head:   a9b906f15995e18b700a7e7791865ecf2f1cee65
commit: 57ac6f86ee9ab446e49d7c72eef10b2b44d58f9e [9/19] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
:::::: branch date: 10 months ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260508/202605081920.FY92eJ9I-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081920.FY92eJ9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605081920.FY92eJ9I-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
