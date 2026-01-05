Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DBC344023
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767617142; cv=none; b=O6uqqwLjG21ux3w4FA799XmDy2DxU68EkVfb/uV0JaGWmurXpvgdgC7IG5uj5r/dhEdAxpGAeca0NxieD9QPkqKYZBGtdtHImtTe2b6wT9OPnlzJ5V7eJip+eRWI1rSDwBa68jZwMmg79T34PCcuP5+Wu3MXTAMYp2c6YYDLRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767617142; c=relaxed/simple;
	bh=zpYiSCwjmkYZN2ZuxKFk0zxnKBEZi4nc5w3cePjvajM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kf3g06wdHtu9XKhp6eesxl2XIXSyeDDwfIe0g2rHfkt9Ab1M9In08W3+OHqWzPoyJTZVy+0rEDB1i+P+h31lAqo0EvQAHFkixv++KtzzXuvzo0jCkZTgPBuoSlfqWx6aZXkMjQlXfDWnEF5j9xT8+IJXE6qeiqb8AeYzNAOSb2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hx04OJIe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hx04OJIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767617139; x=1799153139;
  h=date:from:to:subject:message-id:mime-version;
  bh=zpYiSCwjmkYZN2ZuxKFk0zxnKBEZi4nc5w3cePjvajM=;
  b=Hx04OJIegPeFHfe49/aTePROXu/fUbfwGpHVVGyt/4kdERT1F00Mf+HM
   1OWY/9SSg2yMu/C1sb4mqzOlYE9NG8BNwJeDgkyJby0A+bKzdznjBu91/
   /J8fxH2nLQFVbO9iPnl3yFUTBVgZgyrsfBceHr95QLeUaLf9fyFEarwTv
   wM3YEVhgXfbDGiiex6xmukD/UoVAyvfUA68VyrRDJrjWRy3IrNEwJe6mK
   eHlpfjMfngmwDkBvNoEW67cV+NAJRBYLcGHdZgLjlekniQ5//xOab4ier
   GHdJopw5B0jmeoZI8RD+tcsie/a4iJUsrz+KJDbN6MAU27yNTFi0c/Uod
   g==;
X-CSE-ConnectionGUID: gPNMojK7S+SHwgKCbL4nRQ==
X-CSE-MsgGUID: JVj2C+/oTuGeWe55OLSKbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80100331"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="80100331"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 04:45:39 -0800
X-CSE-ConnectionGUID: beBXBjFxRFafnsVmYDz4kQ==
X-CSE-MsgGUID: ypaDM1IVSJWKh+99Oi1tSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="203352343"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2026 04:45:38 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcjxo-00000000197-06As
	for oe-kbuild@lists.linux.dev;
	Mon, 05 Jan 2026 12:45:36 +0000
Date: Mon, 5 Jan 2026 13:44:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v5 2/2] x86/alternative: Patch a single alternative
 location only once
Message-ID: <202601051306.KfFREWM9-lkp@intel.com>
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
In-Reply-To: <20260105080452.5064-3-jgross@suse.com>
References: <20260105080452.5064-3-jgross@suse.com>
TO: Juergen Gross <jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-alternative-Use-helper-functions-for-patching-alternatives/20260105-161434
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260105080452.5064-3-jgross%40suse.com
patch subject: [PATCH v5 2/2] x86/alternative: Patch a single alternative location only once
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601051306.KfFREWM9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#48: FILE: arch/x86/kernel/alternative.c:614:
+static struct alt_instr * __init_or_module analyze_patch_site(struct patch_site *ps,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
