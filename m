Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB6817B50F
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770687245; cv=none; b=J1azyBm+9YjidZO9jpucSkFiclZXnlppSXXmWgVRMHeyOM1Ux1DaBLV9p8zxNQXLcfhRmCwJpTH8t8erVSwSc8o1QaDz4oFxidknkxDxACRQ8b2pUjg862efvoLsnZy3eHFojqpk5YQcZol00nUnYMbiz3ZVy1sj7dBA4wMM0Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770687245; c=relaxed/simple;
	bh=qz70iw0CvYygtFw/g/J4ibyX9RxIgF2Gq0icJ0Qm4SU=;
	h=Date:From:To:Subject:Message-ID; b=LFaa8ucvZhZWnOHGhFY8AaqwNYnInDih/kca6Av3vBHbAwlq/pUiIcqWGDqwUnJeNfMU4nQsDzTSlFpwy+Y444uykFcW1+tSeggndpSA+BzLG9zl5G1WYAiRXgz2OfrPMeoj87bRqjrTrQcxp4zb37eN/mseWD3HVxVw4+zRIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cp9CXCNT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cp9CXCNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770687244; x=1802223244;
  h=date:from:to:subject:message-id;
  bh=qz70iw0CvYygtFw/g/J4ibyX9RxIgF2Gq0icJ0Qm4SU=;
  b=cp9CXCNT1rFtppXo/XIvN52Li8YIHbIzAM1f8oJhm7HSKe+mNkefgs6T
   AqWitn9zTxb8LA5hJi6N95vF3ab1iJ/Dnp+CV0lc7QLbqNQ5MJz6HQcQs
   oxXMExDtjrVjZt/9nirgIQ5Ek9wUlzfZAAo+UE1khPf3DJL9z2RVc0teg
   nr0isl0hK87jUnza+TcJcN2zriglCFLWWXJP62mvJLdBOqEi9H+tw4+BJ
   kKWRwY9s+1l8bhCu9sXfvaAOl2I+1VZ2ihCYfuXMgSrsxadICxR98MlZb
   If28Deu70lNQ/NMD1xIfskRS4QU64vcRHWuGA3n+5Myfbdphc77eD4xIj
   w==;
X-CSE-ConnectionGUID: S4AQmapVSHWFuj1hk7Ru9w==
X-CSE-MsgGUID: KuK9P2RgRmSuVTrZpTLHnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89391616"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89391616"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 17:34:04 -0800
X-CSE-ConnectionGUID: GmrczDt3RGmm+oP+enxCGg==
X-CSE-MsgGUID: e/EAug+MS0uSe6JhOfWWug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216129348"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 09 Feb 2026 17:34:03 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpcdd-000000000XR-0pwo
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 01:34:01 +0000
Date: Tue, 10 Feb 2026 02:33:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:x86-slaunch 34/41] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'events'
Message-ID: <202602100223.eFGG3sWR-lkp@intel.com>
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
TO: "Daniel P. Smith" <dpsmith@apertussolutions.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: 270a276d903ee3e318ae6523ae01d561c4c146e3 [34/41] x86: Secure Launch late initcall platform module
:::::: branch date: 12 hours ago
:::::: commit date: 34 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602100223.eFGG3sWR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'events'
#12: 
fetching and writing events events to the DRTM TPM event log. In

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
