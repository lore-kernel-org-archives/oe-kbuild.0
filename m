Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063591;
	b=rOWDFdIKyE+iuGmmyg/wJMcudkRntMPYBlOFGyhB8bgVdGSqEfqwvNuuN3SKCAdnYo+h
	 VgcKjVfoYgcn30RP23EI0/HkC/+bGeGX0m8P9CYZ0lmIdwc+afkaxYHfYmkO4KczHbXt6
	 SA4+GxjtgF//3rIyoThcoFYsKuyIYLAzTKoFirIC7pWECC9XVx92vrYHGisWpLP3P0hBd
	 Ic3dzCPr3ZVPqOFu85/9Gow7YxKs1awwCSNgpZT8Tc7Aq7T0edFyOLJpDwSFJjfqQVG0r
	 XM22TsTKhC9r94ycoid+d299oBmY1RM7KP++kg8PG2AumD9GDvvHyBvPeTmkv5hfZBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063591;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KBO5YacKPDNCAEEexGL08TH/aflvoTcWwIdT4zuwajs=;
	b=mwz9wobr3UqZlc3k+P1DAUuE1xfzNFtPBNyxmdJqpI+fLwhDTuGsFdFYmJwpoJna3zFr
	 3+kUEXigCPQKIAxCW4Kp4rklTCNinn/6RBj2wgeAJv56YfdziRmxjZsrxpGk5B9dXGjJd
	 GYrapk/bGgvil3GCDhtV4WMFkbDwbAwTBtHkJCDEww5Uuxmp/rUBp2gIiXTv78w9BgtLV
	 wBeFPlQ0T7fAAAsZi/3UIsDpJ/wh4ERhADGIKsfKHVbDbCVU627LT0tpY4e/kTjyhSD2C
	 J0cA+wFw832nblyJDbry4/WEf7TAfgQr34E8ZjpDjbtQQP6g+y7k/ecxFjG7fHpHU+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fV9gP3Kh;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7CF606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 04:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC7CF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fV9gP3Kh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795063591; x=1826599591;
  h=date:from:to:cc:subject:message-id;
  bh=lslPGQvXDf8RWWbhBHPYBHnL0Yfbf5KaePzQ+RZQMms=;
  b=fV9gP3KhFJHPr6rgD6z6MUGRFEN0BraRrum8rW66BmOM5I9uF7D0YM5Q
   L/n8VW23e6CJKase4YOr5SmXT5Ma2k9/AYC//SlSD7ZHnyO2bRKheQ1as
   TeIb538jegxcIQW1uTFMAlxz25FiqxSsBvxxO9rjg6DL6WFDkm/9WwDpo
   HvSzaYf+KclLq/diuF++fTp0xzVnNWZvvQ94pHyi6A4hpFNjKsUhg+L6A
   Lf+vNcjrWw1LtU926qdmnps8OXUKouwEXtr1AylNr1Cqb+NmtgZAoFApE
   2gfZ4mzDfSw51k7gL94W1de3dZ6uZm/+izeMHJCsnHs/UaChize2Qx4bf
   g==;
X-CSE-ConnectionGUID: cr51RwEkQxi+UfRFXT5A4g==
X-CSE-MsgGUID: fnK3lh43SueYU0loqlpTRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3895719"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3895719"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 20:46:31 -0800
X-CSE-ConnectionGUID: FhCsEfdjS8+r4WXHk/6Y7A==
X-CSE-MsgGUID: 5y7oQ4vzSW+fDJaUTSprNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10327006"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 20:46:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTu2T-000000003fR-32sb;
	Thu, 19 Nov 2026 04:46:25 +0000
Date: Thu, 19 Nov 2026 05:45:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2369:41-42:
 WARNING opportunity for secs_to_jiffies()
Message-ID: <20261119053835.G2jGL9qz-lkp@intel.com>
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
head:   4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
commit: 7eb1535855983f67b95c2ba777d686cc17188285 ASoC: mediatek: mt8189: add platform driver
date:   1 year ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261119/20261119053835.G2jGL9qz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261119053835.G2jGL9qz-lkp@intel.com/

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
