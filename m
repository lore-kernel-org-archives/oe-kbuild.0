Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461962BE644
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048358; cv=none; b=vBbK7aR4sy0XRgz5FCh5uE/nOyattKjpNq8H2hyxqbNlrspf+cuose/pf7RGEceZ1ufnDYzJWREZ7w2EsWv6c6+eSOdPO8lcc+vdQNGO3Su5E1sNolgRqZKWaB8wWM2309t0pJAL2TQTtxmFWFbxgrIECdQs2NJczoskbd13rf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048358; c=relaxed/simple;
	bh=EFDivUYM7s8L09AMl6hTfC/7YH/nfVOMdx6VnTSUWFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QDO/yPptljG/C5OsswIKrw33oWBZQYcYevwETRLKbLQ89w7JOhdqakKOTf0TeEP99181Btdai1Sb6+fshOTaMIfniTjud7+wmEF/A2WGoO8mtz3mOM0/io0qpeDRSXhYX0TGCpiIy5PdUzPk4EeD1DrmNNKvZkLqItNiBEMyrL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vt3/Ev+s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vt3/Ev+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780048356; x=1811584356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EFDivUYM7s8L09AMl6hTfC/7YH/nfVOMdx6VnTSUWFc=;
  b=Vt3/Ev+sO5N+oEWirdzBWFK146xFX4dLkNB9lvk6XivZp1mmKJffuHfa
   YuXhvYxO87GthzuteKfT6G8uTld+5u0rjpwfhSA5CAijXfpdVoIxVlDa/
   nnscWopFPF0w25v4LKuJS9WukVSMsk8rpqsp3jXEyYZbjM+6VKtSt1bZB
   m4ogs3TdHjdDodNBMUyWvSlk14SbOriB+e5FNEE2rESvjT9+EJ48x+ltv
   LCD5ybSNAg2MZ+c76GJ/PFOUhCFM8zsnu+4+7YPGU8EKsMzwhwscRHGad
   fppZPATHnCsDOwRzoca8q44i6IWYLXhdTvAF+courrZaoJdztjeEZXhbc
   w==;
X-CSE-ConnectionGUID: AysvoU7MTnipMGCPOdAIWA==
X-CSE-MsgGUID: eSCmaQJwQ4+9jaHVrZT2Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91583906"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="91583906"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 02:52:35 -0700
X-CSE-ConnectionGUID: +OV/g3toRXmqryvAKiY8BA==
X-CSE-MsgGUID: qHXKr4muQMedrHHUYTM/8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247900332"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2026 02:52:34 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSttI-000000000r3-1CCV;
	Fri, 29 May 2026 09:52:32 +0000
Date: Fri, 29 May 2026 11:52:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] KVM: selftests: hyperv_tlb_flush: use swap() to swap
 PTEs
Message-ID: <202605291150.gsn5py6z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260528154003.3594107-1-piotr.zarycki@gmail.com>
References: <20260528154003.3594107-1-piotr.zarycki@gmail.com>
TO: Piotr Zarycki <piotr.zarycki@gmail.com>
TO: seanjc@google.com
TO: pbonzini@redhat.com
CC: shuah@kernel.org
CC: dmatlack@google.com
CC: vkuznets@redhat.com
CC: kvm@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Piotr Zarycki <piotr.zarycki@gmail.com>

Hi Piotr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next linus/master v7.1-rc5 next-20260528]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes kvm/linux-next mst-vhost/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Piotr-Zarycki/KVM-selftests-hyperv_tlb_flush-use-swap-to-swap-PTEs/20260528-235427
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260528154003.3594107-1-piotr.zarycki%40gmail.com
patch subject: [PATCH v2] KVM: selftests: hyperv_tlb_flush: use swap() to swap PTEs
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260529/202605291150.gsn5py6z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291150.gsn5py6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605291150.gsn5py6z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> uffd-stress.c:59:9: warning: "swap" redefined
      59 | #define swap(a, b) \
         |         ^~~~
   In file included from uffd-common.h:38,
                    from uffd-stress.c:37:
   tools/testing/selftests/../../../tools/testing/selftests/kselftest.h:68:9: note: this is the location of the previous definition
      68 | #define swap(a, b)  do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |         ^~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
