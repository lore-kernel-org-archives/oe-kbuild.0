Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025B8F5B
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612030; cv=none; b=BEWxxvsd4DCK3rc70dPmiCUkzPjbvZT5+bEy+Xt1KD4UdhFQvXDAWeSGpzCoIX0yhRGNx1f/K7ZT/lSH2JBLl6XPQtSBIYdG7XseDEc4eoVuPJ4qkBbx0w6WrO9Zc3aon8MQ0PF2vj2kQaNQUtAWL94YFxlOm3Ldh/TIiws+4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612030; c=relaxed/simple;
	bh=htZdVyW9bmxLrVeIc1tAyEs6JHXlbfHiNMupe+tZLvE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tceXJN2ggYd29KsUAUTMzPIaDHtzeWBdeACLjn9XdeOvUaO/ajnrDvYeyx86sUWSpaQsvvcnJtD5WIvHPTtrDZ757PWXFnVGrS+7geHgUVj1/FfV1JgUSCLbv+Du9xV9Z36je724KtkBj6WYBmdo7+HrZ8eQaZwTAzXITFhcWJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWUpt0Lx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWUpt0Lx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764612029; x=1796148029;
  h=date:from:to:subject:message-id:mime-version;
  bh=htZdVyW9bmxLrVeIc1tAyEs6JHXlbfHiNMupe+tZLvE=;
  b=hWUpt0Lxjx9NmHKTnYImzqzNTnss9zePjghbCAExNtqtpMAQv4qLPFFk
   EBZGuZCBNhsmNXyG38LpfX1cZKgqDlmIPl0QAC+RjoSIDlI4VmUPXKA0s
   AH84n5tRPSEkC/STkfuAqXReCURekz9X15ugmMIgzFxiAWiKGvXFjfnXy
   uyDw7ede0mRSDPJpvPRKOiHq4YSqapfHXT2z0kZAgdad4YRNgml1bMET2
   gfctYYeYgAtyIlLJc/+s+0VmtT49VcDdhet4LWuabjUVcG/XSfv5/eZTL
   Vs53h418ZRkiNO6eVnhcII3Fe+V/2YNhGsdqoLCOa4VzCM0nWc/968OKs
   g==;
X-CSE-ConnectionGUID: 6rTIZgLgSUqv4222i1k56g==
X-CSE-MsgGUID: F6inos89T4GYzM+ftvZBOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77909614"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="77909614"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 10:00:28 -0800
X-CSE-ConnectionGUID: Mmcqj3FzQAar76FtmO++bw==
X-CSE-MsgGUID: FCeGmVn7SnCsCfFL7IRpyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198511256"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 10:00:27 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ8CG-000000002iZ-498P
	for oe-kbuild@lists.linux.dev;
	Mon, 01 Dec 2025 18:00:24 +0000
Date: Mon, 1 Dec 2025 18:59:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [clk:clk-cleanup 4/8] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'Unknown'
Message-ID: <202512011836.IUJKInsq-lkp@intel.com>
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
TO: Charles Mirabile <cmirabil@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-cleanup
head:   b276445e98fe28609688fb85b89a81b803910e63
commit: 23b2d2fb136959fd0a8e309c70be83d9b8841c7e [4/8] clk: spacemit: Set clk_hw_onecell_data::num before using flex array
:::::: branch date: 22 hours ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251201/202512011836.IUJKInsq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Unknown'
#13: 
Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10spacemit 10/01/2022

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
