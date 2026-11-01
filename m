Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793518337;
	b=w+11lUwLTu8qOqSdhVoEiv5s31oIzjYtyY/dr2l04hJvDtt+WgVdKIS2hFl4Bo6UexsI
	 oEryn1IJhhLgvhjTw38BkMOPUmaARJ+TuItMjTcxq7IoIaHZRfFxp9KOazdI8da4hdrY5
	 2QbRFo/Pbeeu1MkaTMPqoJD2fDh9dw/2cN1cL2Ey0JuJ0mNeyYLrGK/QFgs6biGN1IoVg
	 /j2U7gS7SLfi5BM5hY/cGdm+ayISjBaZTbjTL9OMy1Tl5tEr42yIHsH5oJxHyA4mQ8LO8
	 164nHLDGFm8BE8ybvDDZh/UGu2bNYwP/iuNb26OBQybbc3l4KfFG5hMhnMs3M3GQ8LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793518337;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=saX3wwfyIklEmj0KOrkdFUlcGGW44GIpiXbY7CJ1bGM=;
	b=xSb1xDFmtJyLRF/jzinMfUDrdVKDjrl8rCbIvgCcUTchuRCt65gJ+/4d4ZCfhHGhSwCX
	 1uFcWc/tfXILaAdT1dHJ2cMfFPc0z9oHG2llrpVZmbYQEBClmpW+atcvrDy6H6ebECPlU
	 ETiOTeXfn0s+EqZ2gtg2t89KWfl5EkbXaeNMGE+3khvxD+NkpQXO3dtlRfNtD3ziIf8NW
	 rc98MhT2PeIwjPPonFyb2Ulb50qEHgAtL3Nk+xWHMbqf4GXemAPN7MKZxk6xVKtCIqjCg
	 kgokYQKInPmpOMYa9M9ZMN68U6eCjGVIOqdh94I5K8eScPcOcK+NuT3II+Trh+DZpDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qsk4qJVj;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7F606A324
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Nov 2026 07:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE7F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qsk4qJVj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793518335; x=1825054335;
  h=date:from:to:cc:subject:message-id;
  bh=7Fi8SNyQiHvfJtdY5TH3c75fMBx06WlccVKoO6hOx2w=;
  b=Qsk4qJVj21T8CeL9XEpi6CoVrFHW5nho45dnR0HbrYnzhajhCQdkYdm0
   vRqhzfN2PfCRFYnMJ63uWb0fX/5aiEHVK/gdHx5P+5kf+S7nhz4HMLv6p
   Q1vCIYgoOLx9ukV+ZKwdgEFGkDPs3pxCjn/XxtreYjhrnNOFL4qFrGNra
   OBFLnCbeQdxW7B6A5vrxqDWDhOHY6aLSeQdaKsnwjBDE09mVKLIYMc1Tv
   PIPJcTWbyxPKx3A4VZXKszKfBDm+6yRlDBtmfAvB2LlgVdJAk4vEOOrlY
   Dp1GEwHp0Y1QQHEnJvTeEAtDgNbsPMxlImZ8hqjDDOKgn3dChV49MiMjj
   w==;
X-CSE-ConnectionGUID: 69r5G4IrSM+Tf8KpwMD0eA==
X-CSE-MsgGUID: 2TXkIUNHQWisgJF2K4CfnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2242312"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2242312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 00:32:14 -0700
X-CSE-ConnectionGUID: epETLFAhTMy9RVexANY45Q==
X-CSE-MsgGUID: vMQ3nVtuQH2joPMTnAVaMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="6139559"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Nov 2026 00:32:13 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNQ30-000000006Oh-1tWy;
	Sun, 01 Nov 2026 07:32:10 +0000
Date: Sun, 01 Nov 2026 08:31:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 ../shared/linux/../../../../include/linux/rbtree_augmented.h:19:10: fatal
 error: linux/minmax.h: No such file or directory
Message-ID: <202611010840.IMgfWsml-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Yiwei Lin <s921975628@gmail.com>

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   36aad21d50d1af3f6954bb0c988257a908202477
commit: c2c620f4345c50006af90c37fd104fed8e9dea14 rbtree: Declare augmented callbacks per field with RB_AUG()
date:   3 weeks ago
:::::: branch date: 26 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261101/202611010840.IMgfWsml-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010840.IMgfWsml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c2c620f4345c ("rbtree: Declare augmented callbacks per field with RB_AUG()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611010840.IMgfWsml-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ../shared/linux/rbtree_augmented.h:5,
                    from ../../../lib/rbtree_test.c:4,
                    from rbtree_test.c:11:
>> ../shared/linux/../../../../include/linux/rbtree_augmented.h:19:10: fatal error: linux/minmax.h: No such file or directory
      19 | #include <linux/minmax.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
