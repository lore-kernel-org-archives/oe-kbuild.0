Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB7313529
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764227558; cv=none; b=JNcMF7fjDpUwA6eUP5OQgKK3JX4nC1yiOn9XMNgw/nz9X6hEa7EUnqD85YK/QIZF0FISlV8UK4JHgTBAibHZIQ0p26Ri+0UcbqJlXPsN0u633AV29HvjhHt8908KgFFGsbY4EEulGBlSmrHI30ns733iUAbbTgTnqXy6p7E9jPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764227558; c=relaxed/simple;
	bh=5vi1ZdrBL7RgCOzeNinueaYXoNmDGmSe7Bw0I68feAM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTI8Jl6uFekjFnkmKG6j0IkApPyeV6qeHf/cDKE7vaGmSreyXi3En39tkmaH7UXrorFrUXrtRE4huSwgLjjqW4KHaxh5AOCr4miwhzvNiZ+f17gT1GtjGJihp1AkkpFdgGGJxwrP86tPflMYBGu7ZSu+tx/eNHWI5SX7ZMxmklw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWpmOA4D; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWpmOA4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764227557; x=1795763557;
  h=date:from:to:subject:message-id:mime-version;
  bh=5vi1ZdrBL7RgCOzeNinueaYXoNmDGmSe7Bw0I68feAM=;
  b=YWpmOA4DBhhHn5iei1aOO1t5hdTcxqEOht6T75wnNUTAvzzvj1csykyF
   XnLlF53WyeK13O3cZPM0iQIePsiCp9NqHwMULPsKaUceQNWU6qKmAiwwn
   tZ5Tc9onuj/2eU3Hk5kTQyHGCOEzgmjGQrDKGoYqCuEm1Cb8ap5jt6aH4
   fUYyoS1enZPOttx3NCCai4PsDB3DLUtdMQgQ1ddWgh6897kURSOwyOb/1
   wXos1uLpS7Bw1GTmNh1NaKcisJ2a424RnopC859YmQanwoj7xrS7bCVUh
   UZoP7IekXy0X5CT19ezUQZsd4GaY1Y3DMW/g6N1vsSOvAJN4oQQAU/Csj
   g==;
X-CSE-ConnectionGUID: QmUs2pscSbmSZ1EffY7eow==
X-CSE-MsgGUID: DfM6h2qIQ+G7Tcp+xoPtQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66310438"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66310438"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 23:12:36 -0800
X-CSE-ConnectionGUID: WKrKfMiHQ/iy2DsPKA6wwA==
X-CSE-MsgGUID: WHPNmJpoTl+TrCy9vh+YGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193053346"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2025 23:12:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOWB7-000000001eF-2dGh
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 07:12:33 +0000
Date: Thu, 27 Nov 2025 08:11:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [perf-tools-next:tmp.perf-tools-next 9/150] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'none'
Message-ID: <202511270820.v6Y4507h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ian Rogers <irogers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   834ebb5678d75d844f5d4f44ede78724d8c96630
commit: 4bb55de4ff03db3e8b204c9c804cef3cad29a271 [9/150] perf jevents: Support copying the source json files to OUTPUT
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270820.v6Y4507h-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'none'
#102: FILE: tools/perf/pmu-events/Build:44:
+	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) none none $(OUTPUT)pmu-events/arch $@

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
