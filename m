Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860715;
	b=miCDLXg1R51XA6Aoy5+U5iFMLCcMYkkKcf0/hdIJMtmZy5Nens3gpBRN4mMEOvn+1DOI
	 IadzO9NX2D9gpt+vtlK+fRJWuvqwlJo4+mGr1EFBUYnhpg4U4wHywqIbi0xg2dkgbhBka
	 KaUVFHcy7J5c8EEXHg9ZTUPwrhL81bsMlZFhLm8bUK/jL9eBhRjZzvFZ8sVhjfVciaTDa
	 CnYw8RFp+wTT8em6K3xFE7rWwK53/EMt3Vbnfn6s/W7qj9Hqdz7/e+D7db5Yh2bnJCh7C
	 sZ21Xh1yubdTATzARqGTNS+2zHVJpxNPCybQZtU5W/4rMIfd8yvz6Sh/Pbsy7BMOwdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860715;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vcjFaEyprnDwd0paOGgIWnMbQI5GFCKKM42vxfUTBfg=;
	b=XmIf6vezCd3P7dcYbA2noH8hpMuzOQgvN3SvSgh+Gg7HBdDRPfLiqabW/MRbXyzRgI5q
	 HETJyjZQ9jf1lFV90cZ6ALVgrgSLcugXxEh1UyY91St/x+5VjOntl07yFRm3pnnB5U1d7
	 Vf2z49l33GfqsDw6j5H5gzpj1PjC+QLfcHeYfCFa2owf95kdFS+5brM+TTatSOl7v1Qjb
	 ntK2M+nQ7y2GyTh2WtuM5/uzK7vaqc9sktDZADT/us/6Wy1zRVlvE61GFcQ1YvNehxWWM
	 W8s5bmYDzkx4/+DoyPOTFbftLsO2Eat3epAVKpBthapvvOgd5mpS0h5Zxe0fZ93999A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="aLyu/xoQ";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7A2606A331
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 20:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E7A2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aLyu/xoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794860714; x=1826396714;
  h=date:from:to:cc:subject:message-id;
  bh=ZgjYIKTjr2gkVjz7ADBFZoICLBQmn2OPiuR2W4vCrxA=;
  b=aLyu/xoQQJWORRaZqqldjXNehqV6b7ewk9lvXXHmgu7eM8l9ePuyJdD+
   sghuOuYdVP0YMUSbnZRS18riE4bH50XGTo6gL4l/qODOiMo4mb7Q+5ULX
   QPQtGk4JvoIZIhwNney5O8hm/zDrB9zVSfmAhbmW7z18nTY/XA+6CdjM/
   ZEpwO05wjk2yehEkySjYmeFnvFdrmR1F3Cc851O7D1dJVic+9lQKnE+w2
   1w8FdmR95cralnZ/IF4wmztljiH29McQHwormY4RMPbrYL+NVbyvHqvTh
   mCQwP1Bdj8AvCEVNYX9SxBy3HnRIMwQVPttDHmwl3tPzrp1gs/BaOiqns
   g==;
X-CSE-ConnectionGUID: CTgF9g9MT/CKnGLgd8pexg==
X-CSE-MsgGUID: MRBZTUbcRza8Qwdm1aWatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3521415"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3521415"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 12:25:14 -0800
X-CSE-ConnectionGUID: WBjFAIZERiuZZqVyE0harw==
X-CSE-MsgGUID: Dw616Z35Qz+6jqtxuT6J4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9622567"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Nov 2026 12:25:14 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT3GJ-000000002ny-0yNz;
	Mon, 16 Nov 2026 20:25:11 +0000
Date: Mon, 16 Nov 2026 21:24:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-lts 152/152]
 khugepaged.c:1195:24: error: 'KSFT_SKIP' undeclared
Message-ID: <202611162124.bpk871Bw-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 6cd1e92981f88bb67bc6c76773de0e3583c6a8cb [152/152] ksm_tests: skip hugepage test when Transparent Hugepages are disabled
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261116/202611162124.bpk871Bw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162124.bpk871Bw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611162124.bpk871Bw-lkp@intel.com/

All errors (new ones prefixed by >>):

   khugepaged.c: In function 'main':
>> khugepaged.c:1195:24: error: 'KSFT_SKIP' undeclared (first use in this function)
    1195 |                 return KSFT_SKIP;
         |                        ^~~~~~~~~
   khugepaged.c:1195:24: note: each undeclared identifier is reported only once for each function it appears in

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
