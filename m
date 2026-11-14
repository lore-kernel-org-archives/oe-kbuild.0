Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653868;
	b=3bi4T3iomjUCA69+5Fkw2h2yxd65Oyngfcdz15j8gta8wnJiH0bMaAO2pfBFXy0kBou9
	 Cypd3Mo65QpHssrRieQFYFR1TP/h+wNaAlux0wWNUHvL15sn8B8WaeuEANEsw3+laizPr
	 UExWOGivCu5doYbJzgjz6zseHtri1y5Sz73rSo/5lQPVl5EdVV6iKh0dgWrgrf2Ry2m9K
	 unZHCl58C82eBqfpNUkFCC5N7HN3hBCucu6LmqXHjdB8PlW3+cBY8YRAwpTf/gja94pTa
	 XmxVLZKfwL/Ua00+3H7loETDxYZ36rAUvoYopRgjBMfvAAPLRMUREQ/x98tCB2PNupw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653868;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fP/cyaZeXnLAaCvwc9wjlRnatRXs1PdanIdN6QxRthg=;
	b=Z2tEVv6lV3tJb0VeaMm0tdvPY+v95+BRoZeUSZbZtsrUANWLbmgq74fvq8yvUYD48Zs3
	 Vs1suoQZ3HMjnhAWoJXUiKSR8vcRFx38l0RxH0A+ZAu3EhhIGIypCUnhEX1I25yE9XTUJ
	 UuYYax7c355h91KcBI1s3UwTSBWfFtEP6UIh6mMvW8zsqL90WD2W/xUsJYnXDHcopG/6O
	 wO+8Bg9ia/NRKkqkGoeSYeGkNWl17Og8JbABkWCY9M34Zt45mI6pE0jhoKKj7jG5r17hN
	 ZVdjBH19mtmTw7rotlJnMFq0auiGIM1sGV3G67sV7pewqDntvqTeB/xJ7ESqr7f9Nqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acwfYi+8;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D092B606A32E
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 10:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D092B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acwfYi+8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794653868; x=1826189868;
  h=date:from:to:cc:subject:message-id;
  bh=mV1oNDxLgAzjZcohJzlGeeNvJuB9s1zRdzpdENMfu3k=;
  b=acwfYi+8Qm9VPpGaUsj89WUZXKA+c+EEKMTvOZkOohlF4dOQbTUYG6b+
   x8QrecHa+2PMDn9BSG2YJ1e6NCfToG9EtBUx2nt7sKTRLvmUSCETLSWbY
   LZcXjhNbVfSQkxRPn6nW2sHRdUr5oOue8f4Bq0RvHW+NNLn3oCbBWdUb/
   eew80iAKqUsAOPi9278RifMqlXPrr/cFd7QA4GNmeKC6eLx+FKFPQfoI1
   o8Xn0wJXLuSocilKYebQet8SPOmb1YjbA22Ji1oPdDPUPhMZQfhXMoyrQ
   Cybiqpj8ySZ6LBWh5B39nILL2gLcQMQFORl51w20KIaIRj4fKSqB5sxWI
   Q==;
X-CSE-ConnectionGUID: vdh4MXIhRMS1RwmY47cM5g==
X-CSE-MsgGUID: pFKzdAXFSgW4zfi2QdkUpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3358269"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3358269"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 02:57:48 -0800
X-CSE-ConnectionGUID: aTx2rx/wT0GQQxqb9YH6Nw==
X-CSE-MsgGUID: UPubs0HUSYaIFTEWgJd8mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="11034112"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 14 Nov 2026 02:57:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSBS4-000000001Xr-1Lph;
	Sat, 14 Nov 2026 10:57:44 +0000
Date: Sat, 14 Nov 2026 11:57:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_attestation_all_2 48/68] ERROR: modpost:
 lib/ctlv/ctlv-kunit.ko: symbol '__hexagon_umoddi3' undefined!
Message-ID: <202611141120.PaKIKgN4-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/3e/3e5d2a45aaa3688da1de5a2430c2993c39451793-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

Hi Jiri,

First bad commit (maybe != root cause):

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 3e5d2a45aaa3688da1de5a2430c2993c39451793 [48/68] ctlv: Add KUnit tests
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: hexagon-randconfig-r2111-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141120.PaKIKgN4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141120.PaKIKgN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611141120.PaKIKgN4-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/ctlv/ctlv-kunit.ko: symbol '__hexagon_umoddi3' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
