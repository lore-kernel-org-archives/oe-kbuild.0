Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD5347501
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 22:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772836865; cv=none; b=iJQLHhDvfaQC9qNnVPmHHiJNz5gzqsEOvZkJ330sVkJz4oU+bbofXH6836eSXh7QA3sY/bGqMxm0boyL3uNffF5SOOoNvj1iVaocFc+hnkjAzBX+z7zlVEjEH1n4VJNVA0RiNy+kNTQvZ+6NRDqkIugGXxUD8tIv3cWa+EatKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772836865; c=relaxed/simple;
	bh=p5BmP9EAf8L1AsifAfZgj28mnFvKV2hMq39eUX6ENI0=;
	h=Date:From:To:Subject:Message-ID; b=TQwJtSFp9vv/PR4SWuEaYCzwpuIAlAGHss3CPZSDFYx/I3YTpRTcjSSNTNvFqDkiw7ZW1oD9dRQuv3iae1qVnlLKQzxLYfVbcninFFyYAXKjfHl3+vULBX8xc28asCljbc1z7uRN4xhM2JpLbe0qPy3sa6pJg/nOxfHKgq2ONYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YItbM7rN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YItbM7rN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772836864; x=1804372864;
  h=date:from:to:subject:message-id;
  bh=p5BmP9EAf8L1AsifAfZgj28mnFvKV2hMq39eUX6ENI0=;
  b=YItbM7rNXZV5y7ZvvgpCm7xflCrsppWNt7NZjJObh0RoCCeGetkrCogI
   lurxyuZUWE01ZlzCYHQyz+QTntSCRVXo1OmWrxkEFswsuIDaQp4Aoo8Ol
   suSuiqOm1ryDj78JPLL8pxGFV0G4ujt8LSLbWhsoDk5SSZ29K+b0Taqyg
   7htCH2PjyLzrQ7K9QpYgrRaE9vEOUJ5Vp90aQxaR0+a3U46UEcTMcTbLZ
   54duXFTnTchkf0Y9v9C5Jw5GLiA3PqO/NWIm/4O1r8olzglBk7LAJIVUd
   EJnVBF8sI/BVIqyTdhtKy1sylBTlKFbGfN895WRL2YsS1hg9N9XL9kmyW
   g==;
X-CSE-ConnectionGUID: iHK7Z8UNTyy0cqEnFxl3nA==
X-CSE-MsgGUID: tdwk7JekRxuVpt48ZQcn4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77828794"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77828794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 14:41:04 -0800
X-CSE-ConnectionGUID: T7WivzkqRVqMND3jMi9Vkg==
X-CSE-MsgGUID: BQhSHMHdQ4ipQhTaEcOrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="257058809"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2026 14:41:03 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vydqu-000000002Mj-28f9
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 22:41:00 +0000
Date: Fri, 06 Mar 2026 23:40:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 23/23] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'create'
Message-ID: <202603062338.VIl3YO0S-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   87a77580f782dacdf55955940a86f6407bbcd099
commit: 87a77580f782dacdf55955940a86f6407bbcd099 [23/23] bcachefs: EC now handles devices with mismatched sizes
:::::: branch date: 17 minutes ago
:::::: commit date: 17 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603062338.VIl3YO0S-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'create'
#108: FILE: fs/bcachefs/data/ec/create.c:996:
+		/* It's pointless to create create stripes with a single data

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
