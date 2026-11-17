Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916767;
	b=K5SDkMVqF3tR+Qr9/BBlsIaVznAidXSQ65q8SjrF+KmYUK0GHjimhulMJpgpTLrbbrKm
	 L8HJr9flH3/Yh31C9J0urJDhJz++rrrXIpItsrcmxqHdJkoUkn+TgRAufsYUm/mn+sznv
	 w0VqhTub1I1+FGYdDX535iqHaIaqDgyEFrLFWxNQylXipN5CbjAsnkxDoTM141+gVQvoE
	 CS0BDdEQFqNEB4Ekdr1SnujuetzqrZSRWbZaAijjHE1Ij2PdnbJ91Kly1dD2dc2nsShNy
	 ZIwskMAjWWPRqW0I7s5GA5aJZUbXjoedhWmp7xg6EO5wtmtfwtM7niczEaZoa1UE+SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916767;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fY4Z4jW5c0Yls45OsVr2Ro/aRWDrIbi0tckEYRoRtyU=;
	b=24ap7uM+nd5cgmfxbCOEsf/NuV+tQtVG9uLwRjdjMIk8Eeogji7RA34iTO7zXkTcqbPp
	 C/nmSM5qvSpNuvyfLMcsnBFhOJTMlU/B2exSH392vmKjAAYhW3kjOYvHLB0965s4nO9/r
	 KtPDvCb07KVudwJl7hBGXLx9l2UHzA+lsLF7xsi6QuJYbG6VP79khGUgHzibUDt5Eqs34
	 L442RHSZclYepTUwiWImEKx7asr7lcHOSdUrWJDlaTZ/K2fR1lNv8HZzG6o7fP6ZZyUq5
	 v/cpF2wo5/0/0Pq9hSeXeK2txKUCg94iaVBHv0OryRRuk+cVwwep1J+b89b2OIC+Ptg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CsSPRJUS;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9DB606A339
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 11:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9DB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CsSPRJUS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794916767; x=1826452767;
  h=date:from:to:cc:subject:message-id;
  bh=8lghMfFJ6KVylYWyNweFsyWFt79MSMRsz48t3Cl3tiU=;
  b=CsSPRJUSqijaDkKoAU9V1HwsYUgEbYPPyYxbbyB0nsNnn1oH+LneBgQX
   zZD0I1jKBLdnjtZcIhHZgH7YpHLa220hvlTqfEMPgLULWrlzDyYOBjgwo
   sqfF/plhiaZECa7M4byaVwVWJV7YwvH0kDcmFJVwiuB1iW90DJAiYPuHN
   5znZj8Qu9Byt38f5SqorEsQZLq99o3R3nc4rQXniAnLutlurofgs8TCj4
   hMz7N0gUhrkwM/8/8tCkFg/SZtiO82bLCSiyj1hbl0I059YiLuwXrLCvV
   pBYT9qOhD4G6bKq84P1lbk78X0VK76T4bydz5/9GzGFBCQ1JlZ0q1SSVR
   g==;
X-CSE-ConnectionGUID: txmsinb2TrGhnywsu0sMUg==
X-CSE-MsgGUID: RCNCpzftSWa0bcfp1d7REA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3721334"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3721334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:59:26 -0800
X-CSE-ConnectionGUID: uBjhxzPhT7mGtWaHxSmGwg==
X-CSE-MsgGUID: C5AgnZwDRVmq7HM2Fh4H9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10049536"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 17 Nov 2026 03:59:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTHqN-0000000036U-2GMm;
	Tue, 17 Nov 2026 11:59:23 +0000
Date: Tue, 17 Nov 2026 12:58:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/240-isp 11/96]
 drivers/media/platform/apple/avd/avd-inst.h:141:41: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <20261117125430.wGxOpiSU-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: sofus <sofus.c@icloud.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   41eeb3a08926fbe6037568be57148a360190fbe6
commit: d0352139c245fdd54bce14b5de508b45ccdf5b8a [11/96] media: apple: avd: define static values and bitmasks
:::::: branch date: 24 hours ago
:::::: commit date: 2 weeks ago
config: loongarch-randconfig-r2108-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117125430.wGxOpiSU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117125430.wGxOpiSU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117125430.wGxOpiSU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/apple/avd/avd-hevc.c:25:
   drivers/media/platform/apple/avd/avd-hevc.c: In function 'stream_refs':
>> drivers/media/platform/apple/avd/avd-inst.h:141:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     141 | #define AVD_REF_NUM(v)                  FIELD_PREP(GENMASK(31, 28), v)
         |                                         ^~~~~~~~~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~
   drivers/media/platform/apple/avd/avd-hevc.c:125:22: note: in expansion of macro 'AVD_REF_NUM'
     125 |                 push(AVD_REF_NUM(decode->num_active_dpb_entries - 1)
         |                      ^~~~~~~~~~~
--
   In file included from drivers/media/platform/apple/avd/avd-h264.c:24:
   drivers/media/platform/apple/avd/avd-h264.c: In function 'stream_refs':
>> drivers/media/platform/apple/avd/avd-inst.h:141:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     141 | #define AVD_REF_NUM(v)                  FIELD_PREP(GENMASK(31, 28), v)
         |                                         ^~~~~~~~~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~
   drivers/media/platform/apple/avd/avd-h264.c:127:22: note: in expansion of macro 'AVD_REF_NUM'
     127 |                 push(AVD_REF_NUM(run->num_valid - 1)
         |                      ^~~~~~~~~~~


vim +/FIELD_PREP +141 drivers/media/platform/apple/avd/avd-inst.h

d0352139c245fd sofus 2026-08-02  140  
d0352139c245fd sofus 2026-08-02 @141  #define AVD_REF_NUM(v)			FIELD_PREP(GENMASK(31, 28), v)
d0352139c245fd sofus 2026-08-02  142  #define AVD_REF_FLAG_CONST		FIELD_PREP(BIT(24), 1)
d0352139c245fd sofus 2026-08-02  143  #define AVD_REF_FLAG_LONG(v)		FIELD_PREP(BIT(17), !!(v))
d0352139c245fd sofus 2026-08-02  144  #define AVD_REF_DELTA_POC(v)		FIELD_PREP(GENMASK(16, 0), v)
d0352139c245fd sofus 2026-08-02  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
