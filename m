Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F952275AE4
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176990; cv=none; b=kMZf41vHZCu9lag+SMzt5tHjNDIFiTyVO5HA3mfGYMNEpm3K/1Dwnmmmmwd3cgoQMM6U1XOW/HQDSmmLD6lZ9DCvqI/13vQAEZrgAZmCdN3JrGsRleMb5XY3tqKMAFrpPmRpoyC3i+1BfDh7EQlvsMOm/LPS9Ej6TbNEsFAc7tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176990; c=relaxed/simple;
	bh=C3o+kRe67EwWUTaiSFtYMS+oRoaUgwyW5bN/Q11iiCg=;
	h=Date:From:To:Subject:Message-ID; b=m6wBRw+zaJiu17sOw+ruyyn8kkbbcWfxDYGObyLa+IDsViaqGFCpAVuRYjgJIPNpA9SacRq5FXtmO3Z0WB1Qm+zQ0d2gdfTZEZUpcP5IpzJE6wiTusZUxrQDAKZgfKG8Gl+gYpK69wAggmw2X7Os7h1VLcob9/yEP6/2MqDez1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMjI15rq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMjI15rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767176990; x=1798712990;
  h=date:from:to:subject:message-id;
  bh=C3o+kRe67EwWUTaiSFtYMS+oRoaUgwyW5bN/Q11iiCg=;
  b=CMjI15rqtBXvN5yPeOvituR2UD7+qIlWCUaMmN+bwN+yRpGOO5Qk11Dn
   AZ8yN4DDvPAP1Fae4o9mGfZJUFbkLelVkEo8LsYbQVTLm8lSqVlE0SHwg
   USX9YkAKwqH02J0GSxnxV6D9nY/oAdU3IpFBrjnT4VYmLe0GoISyZ2Icx
   uXajKojZDwJjldGeW3lH6aT2/Z1Y/CnNY4cS2EgxnTFfcGcCxutKfEaDw
   bPhPxZlVBVoLf2XGO81d1QZERVd76Bn3RNz+e+nzbKhH8yxfQHe3N6gZP
   d+S0hQQDR6gvOvlwaePO8PCHK5a4wyrFIVPw/skeVOuUvIK1viJCwkvED
   g==;
X-CSE-ConnectionGUID: ECAvBZKeTLyjNxoUMKehog==
X-CSE-MsgGUID: Cc6lHKRATBGWaOqk9REwdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68815755"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="68815755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 02:29:49 -0800
X-CSE-ConnectionGUID: qBJne3CvRF+vkiZh/my4oQ==
X-CSE-MsgGUID: fssDiRCTQlOrWxpv/X7OgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201289546"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 31 Dec 2025 02:29:48 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vatSc-0000000002v-0aOe
	for oe-kbuild@lists.linux.dev;
	Wed, 31 Dec 2025 10:29:46 +0000
Date: Wed, 31 Dec 2025 11:29:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rppt:hugetlb-init/v2 22/28] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'it'
Message-ID: <202512311100.blYQXq6w-lkp@intel.com>
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
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git hugetlb-init/v2
head:   7d599e1adc180839a78060d547becaa0d5bbc061
commit: f3a9ab7909ff815b296d1893774d4bb7d816d61f [22/28] arch, mm: consolidate initialization of nodes, zones and memory map
:::::: branch date: 86 minutes ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251231/202512311100.blYQXq6w-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#29: 
After this refactoring it it possible to consolidate hugetlb allocations

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
