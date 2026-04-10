Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18729BDBB
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775784488; cv=none; b=QFm03U4uEIj9QlCcxLUTgap4xAXHLpBJpyhoZs6rZ0+Z8eFXBg6nvEQnD0ZE9knBMpoyQuWc7v2vu7w68904sDyFuT37sIyd6BBdeRl03itanTNj5X0HH685PCFRoPaHqv96Tui5p56G3PHXCR3jmLFC0ZoqvFyHx2+BcLZJDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775784488; c=relaxed/simple;
	bh=VkKo8dQ8hXiy5wJAIluVv9O5MfB9DlwyDE+9K9fugt0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fKHO7rFcJUwiaW1JUa9U6Zg/KLUOpPegCnW4mpWk7pY0JTKTQ2eJVD+Nffn7YbUj21Aj9sZw5vHAunx4x2LJhjGfFqNg0nmA6BT1vyUVGgLR6Qut+2M3UjO0ggIyl8SnbbaDK7VKCULS2+2dBs7lm+NxFvwuugHNN14ic82rO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGvvWgil; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGvvWgil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775784485; x=1807320485;
  h=date:from:to:cc:subject:message-id;
  bh=VkKo8dQ8hXiy5wJAIluVv9O5MfB9DlwyDE+9K9fugt0=;
  b=TGvvWgil75Vb14m+u1mhrPnhou7Scdkpfbo9LsWTV7TbWmEBkWQIvyl+
   AHvd8JfBcjxhYcheXzRDZqUVr+KxrioWIGVRupOJgxOZ0VRrqZkG1dt0q
   B08oEDLiIeqLjkPPycZfrFOviMmlOwjLnf8OjQcLpRkJ6Wo2buCKWaWBY
   TSo8XqnqHbn+lmaVC7bWRrphU8VJiBJGP3ISZ3RBYDrlCBIP25hLDAAJp
   fiY5N3w9lFeOukB9/NWZdKjO/zu1yBnJCOBa09gapa4URFCD8k1HwT71b
   hOOkwfiKUIknAmCsTiqcUzOBcyIkntXhn++O3of6sYRqC9QeS9IVftkM6
   A==;
X-CSE-ConnectionGUID: ZzTJD3JVRiybsl6K9OYFVA==
X-CSE-MsgGUID: hDQEAajJThWmM8bd8vrIuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="99430494"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="99430494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 18:28:05 -0700
X-CSE-ConnectionGUID: Igqh46ouTCi+ISCck/hG/A==
X-CSE-MsgGUID: J7ggNSrhTqSD5CpIgVghBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228110452"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Apr 2026 18:28:04 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB0fB-00000000Alx-1Pgh;
	Fri, 10 Apr 2026 01:28:01 +0000
Date: Fri, 10 Apr 2026 03:27:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb:
 serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required
 property
Message-ID: <202604100334.T7yXWOeS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hai Pham <hai.pham.ud@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Takeshi Kihara <takeshi.kihara.df@renesas.com>
CC: Khanh Le <khanh.le.xr@renesas.com>
CC: Huy Bui <huy.bui.wm@renesas.com>
CC: Phong Hoang <phong.hoang.wz@renesas.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: ad142a4ef7106326bbf5c67eb39f21ef77fe8be3 arm64: dts: renesas: r8a78000: Add initial Ironhide board support
date:   5 months ago
:::::: branch date: 89 minutes ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2055-20260409 (https://download.01.org/0day-ci/archive/20260410/202604100334.T7yXWOeS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604100334.T7yXWOeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604100334.T7yXWOeS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
