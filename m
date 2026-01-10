Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6903822097
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 06:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768028315; cv=none; b=oUEgNa7fdkEWEXtDOLTOJlZJL1NircltQJyyLNaOFnTXDOUKND07outtVEl6rEkBkNMc8UwXqNn43TsGa3354ORDK1YeQ24mHEAVOeCCIqGSGEII9xCkGxXdBZmxvCGVFiAbNi1IJzKnjsYnZyC9oIs1P0vwo4Zs0058OviCEyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768028315; c=relaxed/simple;
	bh=NAfJPD7lcXPk+C381b6Q22Anur1Tf/uU06eMPXwD1fA=;
	h=Date:From:To:Subject:Message-ID; b=fINpX+T91tkQrBvGnhgLaJnDLrg+4NZsGd7DFDazaUbj45qoYfJlZLwN6j70HtuBKCUwStMOxDWC6ocYVoaQqE8pJ4uE/zoOIkV6Vb8DT5nTBGLIp1KfRcKQVFiJL1JZEtuJwlebJ8J45NBmBfzpkTXBaKylwr1SlMOojKg87n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBTlVyOS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBTlVyOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768028314; x=1799564314;
  h=date:from:to:subject:message-id;
  bh=NAfJPD7lcXPk+C381b6Q22Anur1Tf/uU06eMPXwD1fA=;
  b=LBTlVyOSzRMinV/YoUGGAEOvK/nDihHGD07niHbQQayF5ysI+mkF0Lv6
   7kvPAxgVEaM3Ow+fHj82jTfLU4Ho4hWJD1ZbJMAl4vjAqhY2pEwgiFrwv
   l59gLf5vNq+hxlkT+LkRauxxjNn4iRZJMD4bjbDW+mbSG+daVq1qmvZPp
   rxrUiWOYqVgZNLhMkHqTk8s3LwW88/9ajXvrP6Bk+6wIWhIpJJAlG4T7T
   pKYpT7CkFxd0g4u5VkH8N7p6QaoYXMVcw3gjTX9bldXJdGgOCixz2i+Zd
   +t4mUWDl7Kqubg6J8gLfoT5ZQ1YMXaEzJIOfC7LZO2Cw7DV8Otyrj5BxR
   w==;
X-CSE-ConnectionGUID: INDtadcqRumdSST4BdyeCA==
X-CSE-MsgGUID: Pq8jkO2HSpSJkWkChBbNtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80765038"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="80765038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 22:58:34 -0800
X-CSE-ConnectionGUID: WsOVaqAdQJ+iSMUKE+XbBQ==
X-CSE-MsgGUID: qza/cPX7TH+Ny2LMdq4izQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203724000"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2026 22:58:33 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veSvf-000000002IS-05G9
	for oe-kbuild@lists.linux.dev;
	Sat, 10 Jan 2026 06:58:31 +0000
Date: Sat, 10 Jan 2026 07:57:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 130/130] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601100731.mpCvjZTT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   38c0d0c6764d5759f2da1ed710401a00bbf59e9e
commit: 38c0d0c6764d5759f2da1ed710401a00bbf59e9e [130/130] arm64: dts: apple: j[34]1[46]: Mark ps_atc3_common as always-on
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260110/202601100731.mpCvjZTT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#8: 
atc/dcp for the the HDMI output on 14 and 16-inch Macbook Pros.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
