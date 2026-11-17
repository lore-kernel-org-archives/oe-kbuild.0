Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932386;
	b=WHHlJqYvyk37rdtGEFLJgltHqm9l8A0Caz6XeCLhib+cozT7ZWKuinCOmCGTVTxV2W+A
	 JIJoYmoG35v0WGcxnPyaYSEFe1wWIl+yHvmtyk88uVZGP/C2rRAAacV1BZlLVstGHRdTJ
	 1IBANaxUm/FD4oPBaiHHKzzQVGvxpyyQjDDJF7exHifWZot+u4dZz7ON0RP2cUZZGNSgC
	 8R/QnnEG1KNcjcvxyPE9RRKkIlVycDfL9ZYbkZefbNtmAStq46pAyj+mhulH1qCRZITzD
	 +vXmHjjL2AfwKE8mGA5rzpMwsTt3sg+RJ1FVLZXqut6GbaH6ZBMvJD0qI45swserECQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932386;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TBLJ12Jc38X/UxAoQlvN20V9FJIXHgkyFMXMXWwUILQ=;
	b=jR1s4XyUB7oD0hRDVwzo4T3PtPYWaOyUcVLSjp2rDg2saq1LDnA/q/ORgAFf1Mj2gKWs
	 XbkPQqJHm+l66zszD5gPXww7kgo7hw/SaZAO8HWzLtHwtn5lwleKsEHTgfunWzIqiwKjU
	 wbeRyN9/mEkWJmOphXKB/YlFqUBceuJd2VKkIaf3zDivXsdL7qTGM1yb+Xh4e6BIUyFkz
	 2gUBQNvFUsL5+8+j4IoYItiKhTPuK/ZwJqDwcX1mU6QNnidby5QbJ+pdMUxr5OkiVBzNE
	 Hu5bE61Wf1vlGOhogDwwpdj6s1OHV+UFmXA7d5C0AmyXRJ8UUmNb8njxdjZEr9wZxyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cLoYOv1X;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D205606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 16:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D205606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cLoYOv1X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794932386; x=1826468386;
  h=date:from:to:cc:subject:message-id;
  bh=KJLM6CIJ0iqInPVZ2VErIvj2HoiDtqU1d9NWkbF27W4=;
  b=cLoYOv1XrzN4IR0kAeOWWySL2vGWFQ3pm53iQLfTc4/DXrE9QA0Ug59v
   Sv0/XkF0qWNPV7VfNThJTNKjMFOGy7qh6XWuFNW/Km1Y5+khIzVAp6tNO
   6wH4OLKs9WK4ZdLkXwX32fBOvj7Ct53XeHmyTlXltRqgwZyuQC17qX3/6
   tpcS8muOh7W0Ux8o5NusnZ9mdIEVWsWl9wDohMyNP+skzQPWlpI2Bnie6
   Jvs6vkEgHxCyVHRnb65kvDQiczaxsLSVbsEw/+5bSzOdjNv5pDI/YMSwd
   XcGkdhP63+FZSMjBjVlhcmPhKh2q9eeHSfEONatbBFmc2sk0sfujrRMQj
   A==;
X-CSE-ConnectionGUID: Pm08depNRuyjXwpiH+jeCw==
X-CSE-MsgGUID: sKFavguUS7KKwTwKjjljww==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3790754"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3790754"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:19:45 -0800
X-CSE-ConnectionGUID: BVTITEW2RmqVXgkC61oj5g==
X-CSE-MsgGUID: x51StIucSgiwah4BeRm86w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10022149"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2026 08:19:44 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTLuI-0000000039q-1yDa;
	Tue, 17 Nov 2026 16:19:42 +0000
Date: Tue, 17 Nov 2026 17:19:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2369:41-42:
 WARNING opportunity for secs_to_jiffies()
Message-ID: <20261117171434.MepvBli3-lkp@intel.com>
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
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: 7eb1535855983f67b95c2ba777d686cc17188285 ASoC: mediatek: mt8189: add platform driver
date:   12 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261117/20261117171434.MepvBli3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261117171434.MepvBli3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2369:41-42: WARNING opportunity for secs_to_jiffies()

vim +2369 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c

7eb1535855983f Cyril Chao 2025-10-31  2364  
7eb1535855983f Cyril Chao 2025-10-31  2365  static int mt8189_afe_pcm_open(struct snd_soc_component *component,
7eb1535855983f Cyril Chao 2025-10-31  2366  			       struct snd_pcm_substream *substream)
7eb1535855983f Cyril Chao 2025-10-31  2367  {
7eb1535855983f Cyril Chao 2025-10-31  2368  	/* set the wait_for_avail to 2 sec*/
7eb1535855983f Cyril Chao 2025-10-31 @2369  	substream->wait_time = msecs_to_jiffies(2 * 1000);
7eb1535855983f Cyril Chao 2025-10-31  2370  
7eb1535855983f Cyril Chao 2025-10-31  2371  	return 0;
7eb1535855983f Cyril Chao 2025-10-31  2372  }
7eb1535855983f Cyril Chao 2025-10-31  2373  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
