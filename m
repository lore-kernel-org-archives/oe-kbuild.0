Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED29050094D
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978387; cv=none; b=W/PxbBm1vRz3+F1d1iKjGzHMNT1gngtS8FBGLzObdCotNZr20M8g5AmvXcZ9rafX7JFcY/FOBwnb3WyycmHoTkohyG8p/7q6OouwK4yB9hHj7q8bi0VtbuL9FMTSmRVeMTyWrF4jr8dxdTBcQbsRB1uW9/pTzvV6kB2ig3HkHw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978387; c=relaxed/simple;
	bh=q3/zIJdNkPWgznF0HOYY8Mkl1e8swyqwmE4DWhICLVE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fFKR1QzAi2KjdOtBdDdJOiFfhPfKRhDqUL9bDdNHN7R//d7cCyuOsTEpTMiLWZNgrRJu+Idrp4LX1qumzme7DMxKqJ58FrLZlg/28F6aAp9nC7rs6+AhnylgJyWf8deb5LA092DOXim2FMjenB2dwnQM5rCFzUoGWEYrC69L5nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMguLRJZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMguLRJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767978386; x=1799514386;
  h=date:from:to:subject:message-id:mime-version;
  bh=q3/zIJdNkPWgznF0HOYY8Mkl1e8swyqwmE4DWhICLVE=;
  b=DMguLRJZnZ9jplCWq3G5wYgEclOQ9s3CNcdIIgAguCZFgRZiQ3sqNF8Z
   rXUDfojITmi52MckWSIr4llQtaC0WIqzOhBKh40DYQryUuzXZCfiPHsbz
   GNWH1pRcdXit2s4BkTip4xyNVg7cZL5oxNaWuWMFNiKk6Do+gBLCAJ5ZN
   VKSllD3Dse3n/u0mROPLcQIHOlF7uTXvT7mOqC5AU4kP/Pjq5P90FOLvo
   s4ADinuaL2ITKfMzlaqJf6jGfO15WM1EtoYDieO8rvYJxfJYbRKyUm5Xq
   0z3CSTcVlZ45ooe3V7FW6wN9g+6TOj53EKecVX2hUx1AkL8YllUFMxehQ
   g==;
X-CSE-ConnectionGUID: Dn4g1NJVRn63gHddKAe6jg==
X-CSE-MsgGUID: 4chs5IPgQUiXFyxLdDkHiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69262545"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="69262545"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 09:06:25 -0800
X-CSE-ConnectionGUID: 9F0R87IjRcGK9kBFFC3jnA==
X-CSE-MsgGUID: c5LOpxQCT+2P+bck3EcZBQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2026 09:06:25 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veFwM-0000000026q-2LeG
	for oe-kbuild@lists.linux.dev;
	Fri, 09 Jan 2026 17:06:22 +0000
Date: Fri, 9 Jan 2026 18:06:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 3/4] KVM: nVMX: Disallow access to vmcs12 fields that
 aren't supported by "hardware"
Message-ID: <202601091810.glHSu2rO-lkp@intel.com>
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
In-Reply-To: <20260109041523.1027323-4-seanjc@google.com>
References: <20260109041523.1027323-4-seanjc@google.com>
TO: Sean Christopherson <seanjc@google.com>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/KVM-nVMX-Setup-VMX-MSRs-on-loading-CPU-during-nested_vmx_hardware_setup/20260109-122321
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20260109041523.1027323-4-seanjc%40google.com
patch subject: [PATCH v3 3/4] KVM: nVMX: Disallow access to vmcs12 fields that aren't supported by "hardware"
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260109/202601091810.glHSu2rO-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Xin Li <xin@zytor.com'
#34: 
Reviewed-by: Xin Li <xin@zytor.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
