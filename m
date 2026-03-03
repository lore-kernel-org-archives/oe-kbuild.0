Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF82D3EE5
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545401; cv=none; b=UFCArUBASdf0o2gF+bqmx+WslrUeNUiDEssSm6YuWLd0V++tnKV4cwlnc5L9z4qYl+L48HToQGpbbu558fIlkLeNl7tnpHvhKpmcQ7MlxLgD+kEqWr7wQbr5ns+SBRFnoN8x25gQvku+MxoCtUN4Z9rj4fV2VHJz+w2T8oEHwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545401; c=relaxed/simple;
	bh=rTpPPK3Hm6fbCdM0P/yzzam7aKnvY1LJH9cub9A94Ww=;
	h=Date:From:To:Subject:Message-ID; b=KXt58a2Zr0uAlL84sGCoXmcN4BdCaa46nLSyxNfTMVs9NsAjn0HfbI+DK4UXXy5ihUwn9hYSmAprFzScqn6soU6HE8i53dEhUChDOIldlHfrUug4CAA+hSk0PFlC34OJ0NcwAiO9ozyTi/bSyVCR9ulp8TZLCVCFydxZRF8XauA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LV1U51Ub; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LV1U51Ub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772545399; x=1804081399;
  h=date:from:to:subject:message-id;
  bh=rTpPPK3Hm6fbCdM0P/yzzam7aKnvY1LJH9cub9A94Ww=;
  b=LV1U51UbTbouEOkECcEd22tE1VOvGq2t2EkebBsgfEA2iyvyi2RVvB8A
   6iPOCfGGTJa4cSfldxfK6BrtTNVGQsYfgpyOjP119J8JKdcwhtNdlXpjK
   lJz6lMuC0RX7awyN5zXi13oYvAWkaDlpW4TLEG/ffwttWpCab9xCSPaYI
   3/9hX4eZlRTunqqNl24TamB1g7Z3PK6d1nY6pAMfbF1WhMWkx6Sqx16Vo
   fw9IDMA3U4UpekBdVVwvUnz5B9A5/FHGR2GpwjCcmZs0fWDIz82b9JN+a
   HhzJq6KKb9rRuVe28dZpbVm0yas1eX7OLpnlq0AGc0CR6Uy9Vie1zbI9t
   w==;
X-CSE-ConnectionGUID: V1YokbldRiyFi4tY+eh1+Q==
X-CSE-MsgGUID: JRsnDPmhSvKqsFvZv8RyWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84216945"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="84216945"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:43:18 -0800
X-CSE-ConnectionGUID: 8MoPq8MpQeKGcUIvekcOcg==
X-CSE-MsgGUID: V/QnqYeMSPiDKZiwexQ3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="217155412"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2026 05:43:18 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxQ1r-000000001Sn-17cW
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 13:43:15 +0000
Date: Tue, 03 Mar 2026 14:42:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_6 17/24] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'for'
Message-ID: <202603031430.0RDWHGRY-lkp@intel.com>
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
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_6
head:   af446b2f2e0f478bc501b1791673d2aa5994101b
commit: 17ac09b37b36e6b14480ceacdec022b342ea10db [17/24] selftests/bpf: Add tracing multi skel/pattern/ids attach tests
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031430.0RDWHGRY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'for'
#160: FILE: tools/testing/selftests/bpf/prog_tests/tracing_multi.c:113:
+	/* extra +1 count for for sleepable programs */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
