Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B2531B131
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 03:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770781285; cv=none; b=EsO1EdF/rxoReWa5p1j4HdULEsqmGEge1Ky0kP/lBO8NDxtRH4PAaydI/kMCzn5k4rV8Rrn1qmyzNE+UALvpcWoTXg+enl3GMmmODWAHrCRjG475LDYu4anPekKs8hG3VL5wwuHcvwzvfT0ptsUmbrTRKCFY4Jt6Odiyfuxpea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770781285; c=relaxed/simple;
	bh=VTyHVVp/NWien/6aMSiM/Hl+fkur+Sv/J0ktvJ8vXX8=;
	h=Date:From:To:Subject:Message-ID; b=IfaH3QjVXug2S3XnyB2zAyMKGzzGwfOTI9m/Buh0yjntsryoAAv/G5cMA/aKicC1KeN2h9JoEGjJ4zCS2JuTgU4wP7kvr6/GwRp1hTVCWjWnTAHWUZ59ARuEXRbF0OzRJNKSDe1EMx5ovDWHRFfe9nRKAmh36fwwNDLh84XP0I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHca6OL2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHca6OL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770781283; x=1802317283;
  h=date:from:to:subject:message-id;
  bh=VTyHVVp/NWien/6aMSiM/Hl+fkur+Sv/J0ktvJ8vXX8=;
  b=IHca6OL2/Y0VH3TQkLJkxApPf9EYVExImBoDiyNDewCruO8Lu2sFstEU
   /tzZ1qXpyfN4dhLwFD7s1t4ja2tOyt/YveIxh38UlpNAmVk1zCQREJbGQ
   YFA1pIlgKd1Cl4qpJwW8TUG+BHIpHv0ZAs4r1YpLDGCSWjxABOvgmU/xw
   ooitehTukEqSKBUfeTHuhVbmKkKnm3icnwuLUtQK9xU1c1naU5YQJct8s
   6Jqrf108xxlAoK/xO46S2GoFq8rdbMAXH1kTCqyryp6WMxXzorDpWO/XA
   eKW4IAAdcoxm+5JRKHKMxGAkFYrJDnrx4MQk6LGxSHP9KVWZRyXXWNQf4
   g==;
X-CSE-ConnectionGUID: RWX8NAJlS3KoOx+sruxTVA==
X-CSE-MsgGUID: 3csKP1K6QVq4zGE67NmiRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="70940817"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70940817"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 19:41:22 -0800
X-CSE-ConnectionGUID: Uq6OeSYRRg6r4NluHDPVzg==
X-CSE-MsgGUID: IZw84BCJROqct9dV0rHxAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212151170"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 19:41:22 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq16N-000000000zt-3sSR
	for oe-kbuild@lists.linux.dev;
	Wed, 11 Feb 2026 03:41:19 +0000
Date: Wed, 11 Feb 2026 04:41:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [trace:for-next 6/25] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'it'
Message-ID: <202602110434.tLW3ojwq-lkp@intel.com>
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
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
head:   1f37c538ff24e5b14e9047923951597b7d5cb89e
commit: ba73713da50e5c24499ca8941171593466ea34f7 [6/25] tracing: Clean up use of trace_create_maxlat_file()
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260211/202602110434.tLW3ojwq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#13: 
But the one place that it it used has:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
