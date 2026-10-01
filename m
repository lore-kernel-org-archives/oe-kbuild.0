Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759B749EC73
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 20:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886958; cv=none; b=lYKGuwW1ayS+DVhX6ArfkrvLiWIhbSQne/Z/URbjZy5nR+PdOacURUUkp5yf1Sfq6AfGmbDgkzYaTWm8tAmqNLTpab4mIFG0W2rETDXc0gX9pOvOOJDkSu4uvkRaMTuOxmEqyHTErtpllGqoTeIq2eO64wMtKyikfZU+2ClNx3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886958; c=relaxed/simple;
	bh=17WX10ZuyLRvVaEIMhkaL1LLicL4utcFnjhe4W9vGm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aI4awuyZAC2aZCL1SA53YshYj//kF8MmLp14cWeUMn0Ak+tiuE2B7Z2aYH1bxoDKhaKJPSOaSRgptp10hWOx0LPq9seN1wwJdKBzGnUFa0Eis/vLxbxuVR5f2DwoZh9Xv+VKps9BU5x+6uo+b5ls7xo14RjUj/jvbe6ZlIblx3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Axme4Msk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Axme4Msk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790886956; x=1822422956;
  h=date:from:to:cc:subject:message-id;
  bh=17WX10ZuyLRvVaEIMhkaL1LLicL4utcFnjhe4W9vGm4=;
  b=Axme4MskGgbABR9cRyvCoMfFPj3YQOul/mKA8E4BVS+3ZGlJnbguoLDs
   CPuMw95WMUfuimI52V2t9yrDzbX5z+1oFpwDBYOBocoEei3OOh/VGdYrG
   EJwMxA99N3cEXD4xhlujbYMbh4uCp6SGrlXouek2c+eVvQFXGZyoLTR7n
   Wn7UiCBreT+kpDA6IrX+ZwuF2KipYDlhuvDtQ9E34/Gz0dJ9pHYbClVjw
   WNNHHuSmuxJN+Trg31VjT8VMSj9ufzW9cS1Wc7YZnvtp2tk2aPby0KOS4
   L0Xb4WLyv7cjk0BRWb+lQOtNuv7IwV6q7I7KNCY0nV2gslifcpqHsOEY3
   g==;
X-CSE-ConnectionGUID: gLlB6jT+TCGYvHKce2M5nw==
X-CSE-MsgGUID: dnvJMnbdTx+bsZTgdXxMIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91677363"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91677363"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 13:35:54 -0700
X-CSE-ConnectionGUID: mmgLChufTI2vT41Ht1gnCA==
X-CSE-MsgGUID: 502EYi59Sv6vsUMKIXwXDQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2026 13:35:54 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCNVQ-000000000CZ-03xi;
	Thu, 01 Oct 2026 20:35:52 +0000
Date: Thu, 01 Oct 2026 22:34:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dtb:
 audio-codec@11 (everest,es8323): compatible: ['everest,es8323',
 'everest,es8388'] is too long
Message-ID: <202610012249.KUM6E2lJ-lkp@intel.com>
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
TO: BG9OXA <bg9oxa@163.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/BG9OXA/arm64-dts-rockchip-add-ALIENTEK-QuarkPi-CA2/20260927-215132
head:   3d704abed3e248083efe27e11af33a3fc31f6d2f
commit: 3d704abed3e248083efe27e11af33a3fc31f6d2f arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2402-20260930 (https://download.01.org/0day-ci/archive/20261001/202610012249.KUM6E2lJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610012249.KUM6E2lJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610012249.KUM6E2lJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dtb: audio-codec@11 (everest,es8323): compatible: ['everest,es8323', 'everest,es8388'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dtb: audio-codec@11 (everest,es8323): Unevaluated properties are not allowed ('AVDD-supply', 'DVDD-supply', 'HPVDD-supply', 'PVDD-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
