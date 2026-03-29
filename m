Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7399F1C3C1F
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803382; cv=none; b=mclFDEt7smr8u88y7PVWsnNvJgjlvxuThXgwsDk1x0p6/kNo7OKQ97Qv4JE+Qgg1jhsLbBB7FqF2wCBFSPzqWwaDlAMd7r0QeKRcUAj/Rg1mXFVObfrSsO+zRNWkj0aPuHXaZU0t1kqGwM5aeQ+Q3iTnXoLIa6yKLklLJkYOxk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803382; c=relaxed/simple;
	bh=AzJUxLQX3RSTxz6a/74hVqAn5QAIRtZLuQXvwqbUl2s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hn7EpegmT3BYDMPngI4uvY/DFiDhqan25UE+q50C3+7RBzM2zxBmn1Kkx9gDPj9+GpSWbsCo45tRodbMvquAPDNojoEcGoUnULY0eTW0tunwgtfh71Pdn4jziOEhu8XfLloQYyNQSpBYpB89VfygUuvqQFpTc8pGhIg3Ps+aOGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcUWhGIt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcUWhGIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774803380; x=1806339380;
  h=date:from:to:subject:message-id:mime-version;
  bh=AzJUxLQX3RSTxz6a/74hVqAn5QAIRtZLuQXvwqbUl2s=;
  b=NcUWhGItnlm4R0hwqS/334HUnUCYMnfzdtCQ4FngMb7brqMHIuZh7HZr
   fj4fVU+qFB2s1+FjpfeV8lVZWW7X41elCgYYHbPh8h3f82F6StvG6rhw9
   oT34Z3eEJZhuPNkP/uY2AQN75rG8Sx9TBLGm8eQo7JWgv0FjrBp4nRKJ3
   JRWYJbunUTGN75w2ZEJV9t4NWpcxoShYlNH+thGsiov+F+ogZBZBrvhvY
   3PLe9GF+POlmzIfsVWDIKUC2g8bkR4Sy406qhC9dUkEDsX3ltgQvRSA26
   FfyjQ7Ki4/K+70ECZrE7UKMKRaVUs4UNIA0wEMdjhuuvCtpZNfxHrZphj
   w==;
X-CSE-ConnectionGUID: R/gNKNSgS5yytKGOaHP6IA==
X-CSE-MsgGUID: MyL/uaw8Q92jDZhgLQfoxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="101263971"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="101263971"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 09:56:19 -0700
X-CSE-ConnectionGUID: kcHSBA2gRoChNXIm8IJ/9g==
X-CSE-MsgGUID: rWinNDrjS+yNO1okQEoT6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="225717537"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 29 Mar 2026 09:56:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6tQu-000000007wP-1k1U
	for oe-kbuild@lists.linux.dev;
	Sun, 29 Mar 2026 16:56:16 +0000
Date: Sun, 29 Mar 2026 18:55:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 13/24] KVM: nVMX: pass advanced EPT violation vmexit info
 to guest
Message-ID: <202603291812.e2NXR4dD-lkp@intel.com>
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
In-Reply-To: <20260326181723.218115-14-pbonzini@redhat.com>
References: <20260326181723.218115-14-pbonzini@redhat.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: linux-kernel@vger.kernel.org
TO: kvm@vger.kernel.org

Hi Paolo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-TDX-VMX-rework-EPT_VIOLATION_EXEC_FOR_RING3_LIN-into-PROT_MASK/20260329-124019
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260326181723.218115-14-pbonzini%40redhat.com
patch subject: [PATCH 13/24] KVM: nVMX: pass advanced EPT violation vmexit info to guest
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260329/202603291812.e2NXR4dD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'nested'
#8: 
testing nested nested.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
