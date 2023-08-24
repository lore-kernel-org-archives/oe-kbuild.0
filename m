Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0527F8F50
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Aug 2023 21:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692912653; x=1724448653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brUAzo+41euZ67VOo+ncJaehSB8s3OhBYi1aj0zNjik=;
  b=OsViO16wg6XxrWqyfN8CpEzdmdzUXK3AvtwBbPvpbCdff7TQ2mEn7Q2P
   dg4dNOD43QzZjqvKIsM0nxCc/Ec0E5Qu/MErvABJwEClMxn509rXolStc
   EG3AJv9TWAjMbLU5diBxlw2xIKgQLKwODcjzW8p79QmW+mWfM/2WIOUGE
   8EmxO0HMxmsbY/1cteotowuBnBVzo4VoclYrZBFLhdaiFrutk0orwQegl
   VdyK4NFoWOxpXQXRe8mmTZYi/54m1ZVNHqGZzMZkGDoF9jfxr4ocLvA2P
   PkjGsG5s7vSTTDX8opVSinqtHwRKsiHi6GKMDgKyCsWZTISMqSy80B0gB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364754227"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364754227"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 14:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="983858672"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="983858672"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2023 14:30:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZHug-0002yJ-1Z;
	Thu, 24 Aug 2023 21:30:46 +0000
Date: Fri, 25 Aug 2023 05:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: test_set_error_stamp: rm
 /kbuild/obj/consumer/i386-randconfig-141-20230825/.reduce_errors/arch-x86-kvm-smm.c-enter_smm()-warn:inconsistent-indenting
Message-ID: <202308250530.SrNZiPxe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Paolo Bonzini <pbonzini@redhat.com>
CC: Maxim Levitsky <mlevitsk@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5cc3833f13ace75e26e3f7b51cd7b6da5e9cf17
commit: c53da4f3af6e613e82f88abc6eb988e44c5dadd7 KVM: x86: move SMM entry to a new file
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250530.SrNZiPxe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250530.SrNZiPxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308250530.SrNZiPxe-lkp@intel.com/

smatch warnings:
arch/x86/kvm/smm.c:215 enter_smm() warn: inconsistent indenting

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
