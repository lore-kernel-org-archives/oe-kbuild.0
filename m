Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B64303A07
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Feb 2026 19:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771703111; cv=none; b=auVwxSj9v7JPoWeWJWQE5fk2O8XV0RHEm2VwJ5nwyrcDAEGdSr3z8yDIw5eTqcQI9TRoHvcsUfHe/BvXP9tK6MyM6Evj6JU8vPfV8qn1mRyVawDZCcoiM6vs+iKjxs2BnkYidf9XgprbcSLa4FhTxtKWLqhPikM9UF1MMl3nw0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771703111; c=relaxed/simple;
	bh=oGHYd2MpQrq6BagKAAmDGgrR0XRXQwLZa2fZEpcYNhc=;
	h=Date:From:To:Subject:Message-ID; b=NlLItI7+DstkSUBHfY6e69L/hFqiSOZx9BnevXh4MgQXex66ThQToPDb7Hmzxw7RARCz30xXlDvookYPQjLGjtGzYG0pDlJsrt7bfLBin8sNbhhMVy/8yLycpesRFvAW/1etkjYIh77M8CxPv0b5k4Z+f4Uvg14NYhMA+LY4IcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNMNL6N1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNMNL6N1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771703109; x=1803239109;
  h=date:from:to:subject:message-id;
  bh=oGHYd2MpQrq6BagKAAmDGgrR0XRXQwLZa2fZEpcYNhc=;
  b=KNMNL6N1SLkf/L+ESKNzZniNXVBHeu6AOYBMACX3RdPbOvlC3Pf98/P0
   9lbqhSzq74vTmqBLrFw1TrD9QtATBEP0NyPHmkDIVXQxUnML5H7RztULN
   KZgSfXiLOclsJzsIqt0B43NcwinQ6VIYy5nd5RZYmkjzLXjZpTWjdIX2r
   Yi16Z1at9jEzrYqb/pEtYxlt/cZkrWmVJB0w3srnPBKHKWV5vluiaUdnq
   pMgJsaQlzESmAFJnDppovfn8KFLRx4uk43D3y568N+yZDXdnl8hxPH66f
   WgAf9B5P7KjR300Y75gYjdzwbEvAcTPVt+/8DZOryJVWXu0RabNPvp0g9
   g==;
X-CSE-ConnectionGUID: pXq6UgAtR3SUXgIx8/bpLA==
X-CSE-MsgGUID: z+3X07dyS+mW2FWKjg5iuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72637438"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="72637438"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 11:45:09 -0800
X-CSE-ConnectionGUID: aoD84fwVT3iGYcrYaZzhUw==
X-CSE-MsgGUID: yTeagqx/RNG5n0LmZGYJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="238106385"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2026 11:45:04 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtsuT-000000004TN-1Tmt
	for oe-kbuild@lists.linux.dev;
	Sat, 21 Feb 2026 19:45:01 +0000
Date: Sat, 21 Feb 2026 20:44:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 14/15] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202602212038.YZDpAGiO-lkp@intel.com>
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
TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   a25970a14b9475f196893335f324ef36e00cc374
commit: 5031765ec23510286985446de554a32ea21e6b44 [14/15] LiteX: driver for MMCM
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260221/202602212038.YZDpAGiO-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1223: FILE: drivers/clk/clk-litex.c:925:
+				synthetic_phase = (d_t * global_period) +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
