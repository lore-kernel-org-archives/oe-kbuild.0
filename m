Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E252D5A14
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958796; cv=none; b=jRwQ1+S2/QVNlh/RPF+VoIjymGoWLOKvcDvDGMOtkcxaTbwh/cp2eVzpgCfgmBmjbDe7G2hgrEy/My9r8LznRaBkFCW6Rc4mTUx+ueNleeLvas6VQZiXAGNBnEsVBbRrmT94tqqcCUvQfrnHGsuRJH5o+Ta8pHuZoLrm/m9a3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958796; c=relaxed/simple;
	bh=TttI59P2WQHb3n1DuDnyF+dtV1GgR7CLg8TseNAqGjU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CBoA3IC/14/JJ/X958AzQg8vo/0VsLcD99Q3Nzxo3tLoF6kt+OUM4QawM8kiIPTPfYZNnUzKJeip660U0Zq8hSWCwa7JF+eXrRON2DojN0UlYvngVG47SoQ7xdLo7El1q9oWEg/CNevqBEXxHr5B+G6aSaFTKzB46eIZohzHUiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gb9ed97/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gb9ed97/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764958795; x=1796494795;
  h=date:from:to:subject:message-id:mime-version;
  bh=TttI59P2WQHb3n1DuDnyF+dtV1GgR7CLg8TseNAqGjU=;
  b=gb9ed97/mQd/cGg2E5HyKdV6NgBiJuGWTG6s6vi1cILL1On/WljQcUtr
   /3v8Dil75Pwop7C6ss+ftb3AQiiZNHa7hK1NX9OTztI2FgrurWgZlhVRV
   nYlBqfyOuNNw5SoZCE6iZnj4dH6KQ2DDb/56uAceO9UaR9Tecv8wCUCcG
   PJ1PxCd7cGeI6VkYTifRd672ty5mhjS9yG/X5hxifJq4LM8JAnClUSQXi
   G4vLu7ml/gw8pggX5EPAvC7xYVzTVah271mUEL/KuybeKT3/IPjjPt6UA
   THmFRXOWQdQ9LVQwM8Af5OVkXQH/H9MY2bFaDnSt/CIpnV7NMCt0T4eCb
   A==;
X-CSE-ConnectionGUID: ARbKk8pjQwKZvSPau/zLWw==
X-CSE-MsgGUID: TRED3RqATMu8syRcVO0E8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67158191"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="67158191"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 10:19:55 -0800
X-CSE-ConnectionGUID: 3cf31SQqS3mYAvVYt/BOVA==
X-CSE-MsgGUID: UhjodNAeSbuIgnuaV61aow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195278247"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Dec 2025 10:19:54 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRaPH-000000000xx-2qJG
	for oe-kbuild@lists.linux.dev;
	Fri, 05 Dec 2025 18:19:51 +0000
Date: Fri, 5 Dec 2025 19:19:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:x86/mediated_pmu 43/45] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512051933.bdlvhGBc-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   fa9dadacc710a06aad337013a55d5fba6438b2e6
commit: 1f69c84a4457d8d629a5db82ea4162ede59d638f [43/45] KVM: VMX: Dedup code for adding MSR to VMCS's auto list
:::::: branch date: 72 minutes ago
:::::: commit date: 72 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251205/202512051933.bdlvhGBc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#7: 
code in add_atomic_switch_msr(), and so that the the functionality can be

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
