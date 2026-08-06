Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC06349CD1
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 03:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785988718; cv=none; b=kjO0wTReSudvkq9p3vwPlBTUDUtOcVJEDJBXrTZsBsEVazbaAIKd/y81n+kAhjvouOoTNV4du5KmhNLEZ7ck7Q7hSVsH8VBag/XTNbm4OP9wOgVEKoAt+QdVCcCyS1WT2I0ht/lzj3aLAcRSlQ9PeooSxCnHN9/7JHh/3HzCMbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785988718; c=relaxed/simple;
	bh=8RoSxUYZxbkGR5eF22jb4wgx+OJpSsXovtjcqK5wMcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W98AB0PjTouewZckczNcd/S3qLDhFsSfcXwkpQQbQoQdSpFh7E/hh8JtU/HPZKRHfE3h3TModM0Zxe6fEiby4glDQBXfSLyA3Wrl++ILuwczcaxzUcmBns0LwS3XlS4PJrnxh5GjITgcWWd9AvVXNLlFu7qEnHas87WhqGrYZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoV2wloD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoV2wloD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785988716; x=1817524716;
  h=date:from:to:cc:subject:message-id;
  bh=8RoSxUYZxbkGR5eF22jb4wgx+OJpSsXovtjcqK5wMcY=;
  b=YoV2wloDgAHf7rXtI15rj67ZywWqUq3dpZRpFcF7CWvzScjpAID3++vv
   1loOZgrXo1Df4uYxzOz1bA1S6dexNmjvOWwBwFoFtCJ1LIgAN0DTLhdsy
   fVsWX21PWIdcl7MQwISvi+No/yGPCvUmZ0J9FpYXwbtj8k/njBnPrhhdX
   XFug8YWHJkGYGkjuHAUZ+bm2oYoeA+JJ9L29EYhAFBYuDkOeR2HvTiQ2F
   BO1FyDOrwU0eKHr/eecM3L35VPkmN+tuhySoyYhcdgj1cbN5Seaki3dfL
   LVypOERqdnoPnjS99Pt7ZZTa22Ycme7P8aSTKEh7rM2JxOe7voHTyZ71C
   A==;
X-CSE-ConnectionGUID: Qppz/MCdSOqg6mreR3KF0g==
X-CSE-MsgGUID: IlEFkt+ISLeFwPjDoLvYtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96923815"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="96923815"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 20:58:36 -0700
X-CSE-ConnectionGUID: O+95qGgPRKGDpQGWKabTeA==
X-CSE-MsgGUID: yOLzcSKeQ4ynq6LMhtkf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="266207156"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2026 20:58:35 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrpFY-000000004Y2-39FZ;
	Thu, 06 Aug 2026 03:58:32 +0000
Date: Thu, 06 Aug 2026 05:57:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb:
 serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
Message-ID: <202608060522.WDK1sree-lkp@intel.com>
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
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: ad142a4ef7106326bbf5c67eb39f21ef77fe8be3 arm64: dts: renesas: r8a78000: Add initial Ironhide board support
date:   9 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-2054-20260805 (https://download.01.org/0day-ci/archive/20260806/202608060522.WDK1sree-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060522.WDK1sree-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608060522.WDK1sree-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
