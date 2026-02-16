Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78CF286D70
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 22:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771282599; cv=none; b=V8fHpgIMqbnJh12gWFPrK4+ckAwAR0p5mnAWFTZGrpy6EqRvSJktgHptk3D5LlA3ynHpl4Unr1XOl0bgYgGBMxZ1AjQjHSRi3L7tcmRzrY6CoJ6+0wCWx6sBzETwXEff6IRtsHQxEHN/1PPScHHhYHCuhWqetTeVIqpxXUk92cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771282599; c=relaxed/simple;
	bh=7K/W2wyk3J6kkN5zaq4cR1w8C3cAyUSw/eOnqglFLBQ=;
	h=Date:From:To:Subject:Message-ID; b=BfGekFGvlXhDHMsxLi4tLh/m/QfI4ZUiSyg5M7ezDvlkYpZ0gnPjHlh4WNjkXIRvXO6EOPwUn5ozq5S1TDGzdhxt/Qk2Zx/Ar7aw8HdlCWxTLI1NcB9ES4bPX1fpYRNJNskJUx0Kuj1rP/LqrAD2eyug9UPNFCRHC5hJ7uDSIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXkVAfQq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXkVAfQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771282598; x=1802818598;
  h=date:from:to:subject:message-id;
  bh=7K/W2wyk3J6kkN5zaq4cR1w8C3cAyUSw/eOnqglFLBQ=;
  b=iXkVAfQqpbvunB6jldF9P2hLegJ5bXE0WG5zJmJz0kuxvcVZM4CEYJ9Y
   wI+A2odwF4pHDtIZx3FroxU1GhLDl2yZHBuTh6SggfBUuOhfZjabV/AQZ
   C7f2XdkpZr9wP8/ZqvMKrwPqiH8HfeewTnbAgmtTrnbFH0o6FVbwP6i79
   8kbuEtFwzSi6ONZDkhjKmrb2FGs7S0/nggJ0kLtHsc92PQ3EIk9nb0nwj
   him+VZMOyQjH3wDmhjoDOrZoB3RckC0q8agnGs6XVLgPVsLD6Dwggi6NE
   Ru7fN19+/ooFdTsyxNUJ8lsI7QJB+c9P6NPX91E3LFLwpLO969ydx/suR
   g==;
X-CSE-ConnectionGUID: ItFAAMFkToe2Wz9ha0gXMQ==
X-CSE-MsgGUID: uOygPMYOQJ2+dF246HuzLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82688785"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82688785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 14:56:35 -0800
X-CSE-ConnectionGUID: GiFW9KpjR2GArJU/OJe1iQ==
X-CSE-MsgGUID: fh39DX3VTMOSOgHTWT91KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213013277"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2026 14:56:34 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs7W4-000000002d1-3bkd
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Feb 2026 22:56:32 +0000
Date: Mon, 16 Feb 2026 23:56:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 30/36] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602162304.5nVww61e-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   b4fb5671d1c3610e5afbae296e258f8f5cd9d512
commit: 39c659dac17dec6bd1bbe03a217ee26ba96cd1b1 [30/36] hrtimer: Avoid re-evaluation when nothing changed
:::::: branch date: 19 minutes ago
:::::: commit date: 19 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602162304.5nVww61e-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#12: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
