Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA067284B26
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623441; cv=none; b=aDDM6OTMaDq6XjuuENpv2XjEuSQzXbg5RLA8P4ANkYTU0B3bk/plHYBneQCvqf2SiPogqX5eOPLsAtanFN3nuCHsxQ09nFVL5zcJ3VE/yXvRtkMa9I15w50vbG7KslDVFbZ9HGnlfufW5nQyGp5Xfh1LDvLjSHtdxtRA6SbqZu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623441; c=relaxed/simple;
	bh=IoYySTYo6DqNFGcWCpON69jSc5CnKHwHWgmDolECAvc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rrl98AuE95C1aD7sleTSHmZeZNkxvuOc4MnKSo/uKZJZlavlby72z+tqo1g0GxK91hBe6dCJ21cXpdI47YxB1g5Tr2NJK0C758Ih5UnYf7FTisg1rSnfpSkgupmz3kodSKtZXfgYKVxqbEHhvux9vd1vdS4RFB6oDlGSO5iOmYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrNjK6RM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrNjK6RM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767623439; x=1799159439;
  h=date:from:to:subject:message-id:mime-version;
  bh=IoYySTYo6DqNFGcWCpON69jSc5CnKHwHWgmDolECAvc=;
  b=IrNjK6RMlu1E/jQygsMNNlnFwl5AJsuZQ7P2NTPW26Vk6KJ1PGPUExJi
   x8qEMxbRbFkFtidvVAlGdvlsvXlKsik4XZSHxWR6G6rYl1UWRh08+7xfd
   0xxhv1Kw0OaYmT3plcdMa9jaqWE0CCW1HE4KMdqIGmgAUBXGl/MzUO4Cd
   jhzeM+fZ7jQpL1ybBLJeCl1Y9yemu0Ua5kszbIuUgK4RmgocIFh5p9qfP
   geL7kZfRmn7JoIVk2SSemfbIW6gln7lAw3PudK68kCUEX88WitjoSf71X
   STeGlnfwcGYBx6X8rvNpmIt3rJSpt2LvaScfL8cMhL3PHiYCJZgyeoV26
   w==;
X-CSE-ConnectionGUID: 0kBg6FcsQO+MKSBTIUzNxg==
X-CSE-MsgGUID: 1nIGNjkKRAKjzITBGKGn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69037427"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="69037427"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 06:30:39 -0800
X-CSE-ConnectionGUID: 7TyxpyczQOmyMOV2Y0tQ/g==
X-CSE-MsgGUID: eX8Hm8AAT9eVKsAkOX5OOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="206956132"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Jan 2026 06:30:39 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vclbQ-0000000019Z-1ZVQ
	for oe-kbuild@lists.linux.dev;
	Mon, 05 Jan 2026 14:30:36 +0000
Date: Mon, 5 Jan 2026 15:30:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 4/6] powerpc64/bpf: Add arch_bpf_stack_walk() for BPF JIT
Message-ID: <202601051528.Q2ggPobq-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260105105212.136645-5-adubey@linux.ibm.com>
References: <20260105105212.136645-5-adubey@linux.ibm.com>
TO: adubey@linux.ibm.com
TO: bpf@vger.kernel.org
TO: linuxppc-dev@lists.ozlabs.org
TO: linux-kselftest@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adubey-linux-ibm-com/powerpc64-bpf-Support-tailcalls-with-subprogs/20260105-185536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260105105212.136645-5-adubey%40linux.ibm.com
patch subject: [PATCH 4/6] powerpc64/bpf: Add arch_bpf_stack_walk() for BPF JIT
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601051528.Q2ggPobq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#35: FILE: arch/powerpc/net/bpf_jit_comp64.c:249:
+		if(!validate_sp(fp, current))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
