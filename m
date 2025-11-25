Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408551A23B9
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 21:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764107807; cv=none; b=tnYVMguIm7fuHcTG3VGJUWpwBgMCHxf1ip76cI9IAgqa9XFTihWeYFKRubhHZdRnehwX/3kGQChrFtUCFu+BTPLR2uVIHTk09HUw16LLqLLr0qdvIhqm6kvNvhK9iSMflwW7XRB5ZcV/YzHcui34fv+nlvKGb+pbBCwp2OxPPoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764107807; c=relaxed/simple;
	bh=N9+BlfNVOQtnf5tGN5NwliA4sfafLyq9LaC0Puz9Uzo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hBeME/sDGNQlS8FJBrl1b0GDf2QYz5fD3jolrMyM7pOoNfZSdwn/4RAOgw/RvNkcgYQk93MhAm+5jgE9579LHmJDpTopODtqdYxLBoMk/HjvwiohhmkjCTIe0TiLnuXlFz0PSIIakcGMovMu23kZBKJRXpMkXB6+C+wGmRK7vpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXLld65x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXLld65x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764107806; x=1795643806;
  h=date:from:to:subject:message-id:mime-version;
  bh=N9+BlfNVOQtnf5tGN5NwliA4sfafLyq9LaC0Puz9Uzo=;
  b=eXLld65xGk1KBaHlgMH02TNwwCrQf9bdAV2V0YBpOr9lsMnMtdgGNav4
   nB4QEU6iKL6EFW/u/IC389kUIGF5tvwpMuYoXoE8TubRo6ToGBcbCRhmC
   apVBMjOhQYSBLLjWU/RlKoKm7XiHLusZRVFylvXwyUz5np/xvuCR92nHb
   RYI4Z7Qgp3Te0QmNR+8AruzGlXt4JmJUy0EpTNldlqV3+U2RhBDWr9Lw7
   2zKb6vjojxuSFTZ1wY6WHNHDAfgzeIkfmW2naJzMXAZCpQERZ0DWyYaQV
   3w8X4Z7idaCGb16m2BZqfhKk9oI6sL2yZTAYU/9n/J/dJ1x+T81My2FuM
   A==;
X-CSE-ConnectionGUID: vm+/c5VVQbGPzhI8nIxf2A==
X-CSE-MsgGUID: /GaUFJBJSWKNyd/KvVLMJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65139574"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="65139574"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 13:56:46 -0800
X-CSE-ConnectionGUID: bskJTjUORdWAQIuY/POTvA==
X-CSE-MsgGUID: wywEXH9BSTiXlIPpsCmlKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192659371"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 13:56:45 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO11f-000000000ZN-0nOh
	for oe-kbuild@lists.linux.dev;
	Tue, 25 Nov 2025 21:56:43 +0000
Date: Tue, 25 Nov 2025 22:55:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 11/26] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202511252237.tL9VDxUk-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   3f83b91c6f2ee77a9f0e471c30f0dd9b6e7f7a19
commit: 50a179e4b0ba76ad928fcda84a3d65feabd40fa7 [11/26] xfs: convey metadata health events to the health monitor
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511252237.tL9VDxUk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#564: FILE: fs/xfs/xfs_healthmon.c:147:
+			if (existing->group == new->group){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
