Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839383;
	b=qCX1z4Sf48Myrv5fh8c+05xcAa3nMwY6KqqqDIdO8d2e67rd8hDEJ9065QyYQh8FY3kU
	 7nODgXQVSj37W8B+1f3ZF3mVgNpNx7Iy2Y30WGOIRZamD+yYKdAalphx9eaWQzn9IPlnK
	 oNAJSc/yw3rW92Ea7cwPQp809f/Oc6uCHlnLApUMWLLz9B/5XOnJT5aAWZy7FxPgn3+2n
	 8lWfceLvWmQT9iXN9b9DBnpX9j+o/sHN4/CYMhesBpQHDS+kfFo/Mrb+V9nXaOMey32p6
	 OElZpFX84QmAZ/1EfzzM/uH4kARvKf+r/3WMjvJjJqvv0d49QCICFcmV5qo07WseztA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839383;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Sv6y0oTKSyZGEjLuYOojXV0YDKP+khNs3E7J3k4tywE=;
	b=bTmbmfHDfFPiK+aeEGpp4Bau3XPE0DNu42Ccwr9cqM0bTjQ0ZP5V619UZPE+TUQwIqEb
	 VjRuo26EDphluGRAXIC0jI7MjIkp6hZeAy4LzNpf4Nv3VPU1eZWI42caQ9yUQyANrvmPt
	 rAqURmUFN15c+Ervg7Cgy+iSgavLgFfBCNe7ycP0HanwTtMclLQtBKYAQpD0t9xDy08qa
	 yocOv5hf6oXd1RBepLPGfb4VSvVQmyXNAyEn309UZpo9AgIFlz+JFRh2TO9NdVk7pwOGA
	 e/Rd8LQrWIVailWqz+A2LWyT/lJOVw2QqVHCZ6Zivs0+X575oS8Cfle6LValhUzRJPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YLL4TPYX;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B7A606A32A
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 14:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B7A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YLL4TPYX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794839383; x=1826375383;
  h=date:from:to:cc:subject:message-id;
  bh=u27hFRWVi29Is6t2HSKga474NzNlybKHD0IS3peQu5c=;
  b=YLL4TPYX7efnmHkksW/hvL0jdlDASybNGNPy+olHNABNN7sEL1W/k+gE
   e4lRwvukj+p2DWnt2MOmYdMt7GVVqPp28VxNG55RKb7Sj3k5wOOoU6Jrq
   5hhF50eLentzIP9P9oBfLbMuF89aqkrHwQ/3FZZn8bljv5Kr8eMbHGsi9
   +4Spkn8Zx+BokuYHiD5VSUX1wACMG+z12qet6K8g4tclxpiF9D+hDMNYJ
   OWxJgGJ93HO/iy32Ea1PaJY+MDL5kDVE7Nuka9ilcSuBS/CmAdjW6FM5c
   hdbw/NQd8O60pU+te8c8OZMmrta6wKhY6SgiikrfGg1s4pnTZnBL5raVI
   A==;
X-CSE-ConnectionGUID: VHj+uaf0TLe0mPGkvk1lkg==
X-CSE-MsgGUID: D1xb3qGKRgeYhf5ej4Yp9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3441477"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3441477"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:26:25 -0800
X-CSE-ConnectionGUID: uImHc+qRQdq/uzO8nInv2g==
X-CSE-MsgGUID: 0iVHHPDwSGOTk1s0ISDnsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9615326"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2026 06:26:24 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSxf3-000000002iQ-3FgO;
	Mon, 16 Nov 2026 14:26:21 +0000
Date: Mon, 16 Nov 2026 15:25:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2369:41-42:
 WARNING opportunity for secs_to_jiffies()
Message-ID: <202611161506.1PAhofYo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Cyril Chao <Cyril.Chao@mediatek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 7eb1535855983f67b95c2ba777d686cc17188285 ASoC: mediatek: mt8189: add platform driver
date:   12 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261116/202611161506.1PAhofYo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611161506.1PAhofYo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2369:41-42: WARNING opportunity for secs_to_jiffies()

vim +2369 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c

7eb1535855983f6 Cyril Chao 2025-10-31  2364  
7eb1535855983f6 Cyril Chao 2025-10-31  2365  static int mt8189_afe_pcm_open(struct snd_soc_component *component,
7eb1535855983f6 Cyril Chao 2025-10-31  2366  			       struct snd_pcm_substream *substream)
7eb1535855983f6 Cyril Chao 2025-10-31  2367  {
7eb1535855983f6 Cyril Chao 2025-10-31  2368  	/* set the wait_for_avail to 2 sec*/
7eb1535855983f6 Cyril Chao 2025-10-31 @2369  	substream->wait_time = msecs_to_jiffies(2 * 1000);
7eb1535855983f6 Cyril Chao 2025-10-31  2370  
7eb1535855983f6 Cyril Chao 2025-10-31  2371  	return 0;
7eb1535855983f6 Cyril Chao 2025-10-31  2372  }
7eb1535855983f6 Cyril Chao 2025-10-31  2373  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
