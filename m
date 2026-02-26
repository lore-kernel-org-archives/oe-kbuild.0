Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2E33D9028
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772134044; cv=none; b=ubaaKMuaxpLfnlNpMfCG0ZwrejHzlUKM4zMBFdrMMeg5JKU5uFGQDk20M4r2kDslLFgKzlOO5K810PvL7JCCZgmrzNHCQsG07HdmOY4lHfQ7QdxguR2RRE5qCrh2EtiqCycAhpQEw7hi0kifJgtuKSp/pgfO7J92dB55HJH48no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772134044; c=relaxed/simple;
	bh=GOvxdvjicCgg7WNMZaud9ar9u6ZGdqglHy2AWbIRt1Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCXn1TfvabF6E24ise0SUvD3lnzo6XUGpPK/nso0GDE0AAaBthtZ7E9I40THecBwk5tAvKWVQ4vOb28Moua39TiQCrLr2pwuLQOeRDXGbNpidaTr1XInE660x7Cz8SfQJTrjkW00lDOugcM/fkpc8Ps7To+MPj2LEL4mnGIPgBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVMGtViZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVMGtViZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772134042; x=1803670042;
  h=date:from:to:subject:message-id:mime-version;
  bh=GOvxdvjicCgg7WNMZaud9ar9u6ZGdqglHy2AWbIRt1Q=;
  b=ZVMGtViZaUOZP7ofV3pUQ2lH2l8pSvHjvUYyMIDtFxDgxHSGInEXdZkX
   3vP7dlGBvL5Uabm4wdBuZqOsbiylgrSRfLfKFeInxFgJBJlPbPLI3aL5i
   q5+/DRiVYczL9lJKPfF6cyEii4z0rNKgT84BY+wPgrqXBAU614CfDhQa3
   g7pXiXWvG72YBcTjD57vCfDX2v5445WPaIUBK1V9mUiPwJTYznjLB136Q
   ScceXFedi4W8TFcJLSEiuJmbDUEnp9SMSxvZA24jx7v4XWVGaIkdqWWYt
   qvwi1sW5PtKr2e7j6s4wJxCQbDgEhpnL6sRf6CEi/hcN2Ys+B4nhhkSSS
   A==;
X-CSE-ConnectionGUID: UMt3rF8oRSKfqjWAC0Ei1w==
X-CSE-MsgGUID: G4kJNRXOTtqTx8+fZeknIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83540538"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="83540538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:27:18 -0800
X-CSE-ConnectionGUID: 1m5AEmr+RrSevCxlUR7sgg==
X-CSE-MsgGUID: xkLp3dTDT52e7H4M1FCiGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="239659109"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Feb 2026 11:27:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvh10-000000000Ht-1GDg
	for oe-kbuild@lists.linux.dev;
	Thu, 26 Feb 2026 19:27:14 +0000
Date: Thu, 26 Feb 2026 20:26:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v5 1/3] libbpf: support appending split BTF in
 btf__add_btf()
Message-ID: <202602262019.1uQ33qof-lkp@intel.com>
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
In-Reply-To: <c00216ed48cf7897078d9645679059d5ebf42738.1771950922.git.josef@toxicpanda.com>
References: <c00216ed48cf7897078d9645679059d5ebf42738.1771950922.git.josef@toxicpanda.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: bpf@vger.kernel.org

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/net]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/libbpf-support-appending-split-BTF-in-btf__add_btf/20260225-005622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/c00216ed48cf7897078d9645679059d5ebf42738.1771950922.git.josef%40toxicpanda.com
patch subject: [PATCH v5 1/3] libbpf: support appending split BTF in btf__add_btf()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260226/202602262019.1uQ33qof-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#33: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
