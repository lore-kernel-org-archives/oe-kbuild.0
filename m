Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A134405AC0
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 23:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773359051; cv=none; b=uzcsdD4ABE5YTFBeFKyBQjR8wTK5vEVOtqrpEr/goXXuyINmW4Hpg8zV7m+CBZszTV1+oVofsofMUO77ykHmVpT/LBpT3L4g4LQfXInDjw0uxaIRHc4gKlXnC5eJAnN7YScucW3yN+DzG3MMCOkXfI1ybOaFkbxUkIywNs+omNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773359051; c=relaxed/simple;
	bh=/skDJlRpc4SWqarDegN4dlE1jW3DsaX0krjnaNJAW9A=;
	h=Date:From:To:Subject:Message-ID; b=WEx6VdCJUDLshz8pamdQ9nzuXN6kqjknfO4icSFHRr0nwMoeoljEPRNwbE0c5nSfhsdPIhekczGRu3lTGyMlLqjhAgEYgbZJ7lY48CKbehZDgOGeGSQgL0LsTsGl8boif43522LPLn/BWC9csCECHryziXsfvKV5IxQvFAsYjEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kquu9Kli; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kquu9Kli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773359050; x=1804895050;
  h=date:from:to:subject:message-id;
  bh=/skDJlRpc4SWqarDegN4dlE1jW3DsaX0krjnaNJAW9A=;
  b=Kquu9KlibLwBk9Mk1GxW8P2ZzczK/02nEeyFTsuvo254N9sF8opseJxM
   34WL5ilfSI3EHWSkIc8DqxcpdX8dV8lXNMbDVzkvID67Pd4XCHN/CLy2s
   UDf6smQy1rqE3ct7QlmWFbX8dN8+7uyqxbVW1DvLtpC1/ermv+3mB5UEi
   VgW7ureYRKKay+nX07/ooa5aobJ8HoetcMSLnbax8FFhM7IeJ3wwwfrx3
   MJbIsSrLMFdaTE9xkABaHG43RjDP0whKxSRT/BqNLo/Wu+L1P5OAu/B7v
   m6tfjiEpWCBJ7XkrNhFL7DarktcGFlMjjMS8W5//g/bjkzbP8TmBJs6FC
   Q==;
X-CSE-ConnectionGUID: su3ONOoTQzedHKIy+iCCEA==
X-CSE-MsgGUID: FaV6XpNNR9qqZL2xxB/Tag==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74506672"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74506672"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 16:44:10 -0700
X-CSE-ConnectionGUID: NzLJMWFbQ+Gh3n7xX3+RAA==
X-CSE-MsgGUID: fg7BBdEdT5yGv400+o6pCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="225686203"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2026 16:44:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0phG-000000003bF-3jpu
	for oe-kbuild@lists.linux.dev;
	Thu, 12 Mar 2026 23:44:06 +0000
Date: Fri, 13 Mar 2026 00:43:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [atorgue-stm32:stm32-next 4/41] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'Add'
Message-ID: <202603130057.Cjs4BZkB-lkp@intel.com>
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
TO: Christophe Parant <c.parant@phytec.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
head:   1dd6f0f026268472a69a201abd4f761caf3d73ad
commit: 9a711cfa6e2f37ec6301923bf8137a3796584fbd [4/41] ARM: dts: stm32: Add new pinmux groups for phyboard-sargas and phycore
:::::: branch date: 11 hours ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260313/202603130057.Cjs4BZkB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Add'
#7: 
Add add alternate pinmux for following interfaces used on

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
