Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058CC2376FD
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613515; cv=none; b=WF5oSLtsBcAbkBsjSZqTCbCi4q3d26TmrZ6yPEnpwaJDJZAPMey9BwA0/iES0iBazpq1+f7T0V02OtGoH6cnhdanXBC3MZSIHdk+OyEVs2ztHKZ3c8IG2k6VkwZbXzS4KPrVQnn5I4M48hd2wM0GCQK6xzqNF3hlU6xsD/heoFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613515; c=relaxed/simple;
	bh=CO5pPx4OrAcT9EuL6120kRQrdf8kGIImoO5GG9tk9T4=;
	h=Date:From:To:Subject:Message-ID; b=hMBl0x9y2RcDO4LTudSg1BNMEL3/2NcP2u6Cc2Q5iuQPjRwzaGSF7fL249NEZobHqpBdwHbUTSwurhOECriELuNrP1G4YMIbt7p/mRMCCol1d3TY9jB706jKtkPsYAcnq0ciBlxHCj/MAU+XBM+Q+4WsNXywyrAGkTtbkajjgYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8/ogL1j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8/ogL1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774613514; x=1806149514;
  h=date:from:to:subject:message-id;
  bh=CO5pPx4OrAcT9EuL6120kRQrdf8kGIImoO5GG9tk9T4=;
  b=D8/ogL1j000pf+/+oughijydUKPRvPL/OWsuoYntVYWiPrLn+U529A5w
   tbE6kAgjWaMYjZAMDkesg48+ySgw9NlTHAEogO1/pZ/mfStnw9Z78v8xP
   gD+3lygH43r0/LRtvYc60ztK+6bQLI8Ajx/0oOCVyD6EvxeSUR12BAuUP
   BWOTGrx6ycHQpgBPahElhxozafBRhg13UoIzp4HjrDDUkeCkWqj53r0yJ
   FtoTV2YbsWFUyn2o1lcICmxNxzVmhKdxi/ypy4WnnLxSQUmLLBQNIAvhn
   wTEQ35e9VdzoMOI/tIEOBupSA0b5S7cdI73omESqqEyLjU8P2q1iw8r2O
   w==;
X-CSE-ConnectionGUID: jTj3RLrhSzyPKB6LD1Vpzg==
X-CSE-MsgGUID: 1ONG0fTOQ1S9JyU3aHZ0MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75566125"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75566125"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:11:54 -0700
X-CSE-ConnectionGUID: yTZXKdaqR0u7s5zu8qoNKg==
X-CSE-MsgGUID: 8LwtPOIQTMKZc4yQwZmzjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="224505009"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2026 05:11:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w662Y-000000007U9-1vPk
	for oe-kbuild@lists.linux.dev;
	Fri, 27 Mar 2026 12:11:50 +0000
Date: Fri, 27 Mar 2026 13:11:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 1/1] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202603271354.OaX1nLWX-lkp@intel.com>
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
TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   d4b295201c1d58dc632f0cbf564270662550644d
commit: d4b295201c1d58dc632f0cbf564270662550644d [1/1] ASoC: SOF: ipc4-topology: Allow the use of multiple formats for src output
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260327/202603271354.OaX1nLWX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#8: 
intact, but this does not mean the the num_output_formats must be 0:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
