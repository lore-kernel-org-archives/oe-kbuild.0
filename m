Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544E309EFA
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 21:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778277064; cv=none; b=sSI/12vM5+HJJThKxSc+vtbX+SCoLMAZ19n3jkC6c/VsuoeXloNrCEj53qhCuzmk+gCnFYAAZS79B5SbeonmnDSm/I5KqhljNpIU6nE4O1rCJYo1Hul0SKVH8BSFIPN/uS7TUWKs4h+xGkwH0j7d9WrEkjPN/jvzP6olOxFC59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778277064; c=relaxed/simple;
	bh=nCnugFrIg/AHs25GWhOajhHxVmprUA1tieLjgBFt33M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NgcNTjLgGWwu6oOaW867Gxfvf3Bd1catWAEdJ6G/sKgeOWKHfYyJKsBrb4tgK8DM2bVhjiJ9kg4vUTH74+NXQ3Nkg3cJKKuSR/6513ShU2Sbb+M1otR1f+bMfh1vU/YfnxWtW7X/3OEWVgmpj12lvFVU+swrWKO9M6GukvNVT3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTkSex7V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTkSex7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778277062; x=1809813062;
  h=date:from:to:cc:subject:message-id;
  bh=nCnugFrIg/AHs25GWhOajhHxVmprUA1tieLjgBFt33M=;
  b=RTkSex7VfO8OIlb78+510mPf/RRXOMgWWgE6yJSpijGUgs6hk09HnjKW
   Gf3oyIlI2Udtfgq7mrrW//6ETtkJJtwxn/tLDWdLdwycF5HXBRb4TboPy
   yKa8Z+p0F27V7chl9xhtacCe4z3Tw1pBCEuxzJg32yo6IJSCFBOXcqJw1
   Alg+qvL1DhCsCvwCV9B7u9AJ4YTeZcaMmIxIuDz49wHii97kn9FHBQ0nX
   7wkm1sBenkyFWJsQDo4J4VhcIUPhfJ2IyaakTFLRjXXYxJ7nGHC91ksE9
   DRzpNJOTs8UZ/B4B/050GD/Q9yUTFxGl5ZDCZddbPSqoz0YxSH2KHuWcQ
   Q==;
X-CSE-ConnectionGUID: VrG4wfz+ShSbhOYfkgl/jA==
X-CSE-MsgGUID: hbHmbrauRp6QzBO1RcQyNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89958601"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="89958601"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 14:51:01 -0700
X-CSE-ConnectionGUID: eRq8IiC9QwSw+FB6V2Vj0w==
X-CSE-MsgGUID: KHSlMcWvSuyMjRiSQpJ6rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="236814975"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2026 14:51:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLT62-000000007HN-3Qk0;
	Fri, 08 May 2026 21:50:58 +0000
Date: Fri, 08 May 2026 23:50:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v6.16-next/dts64 10/19]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000
 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts'
 was unexpected)
Message-ID: <202605082332.2fIf8Iew-lkp@intel.com>
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
commit: 85c767d2d36fa9d505266b2038931c5b745e6678 [10/19] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
:::::: branch date: 10 months ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260508/202605082332.2fIf8Iew-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605082332.2fIf8Iew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605082332.2fIf8Iew-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: touchscreen@16 (elan,ekth8d18): compatible: 'oneOf' conditional failed, one must be fixed:
   	['elan,ekth8d18', 'elan,ekth6a12nay'] is too long
   	'elan,ekth8d18' is not one of ['elan,ekth5015m']
   	'elan,ekth8d18' is not one of ['elan,ekth6915', 'elan,ekth6a12nay']
   	'elan,ekth6915' was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: touchscreen@16 (elan,ekth8d18): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/i2c@11008000/touchscreen@16: failed to match any schema with compatible: ['elan,ekth8d18', 'elan,ekth6a12nay']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
