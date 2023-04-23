Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D771365
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Apr 2023 00:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682208658; x=1713744658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SvVc59N2wm2OxS/T9ECByq+g//505Q0f94nfSWutbmw=;
  b=EvKIvtzH4u7N2XiJoBdbp+NasGYqtEcLHWfpHVmHrIcx0N6jFgpapDHA
   bir6fp5RXZY4uNpRmQ1YSxz0cit2PBBRan7pUI44ZAjToYjfUZL51RUSb
   8macUuyKOOkPziVjFd3xTWSSi4RrYkDBzEVqjqXzugjRMPJlExtQDW/s4
   cZw0EpElZNfMOCSLZhWFoUOb2R5WzKLc5G9hwiMREmq25jp1+lQilbJQD
   FIKC2Q2HhMOeE0hSiEdnAhfHsvJ/+qTAc0zEAnu1nTp+/4dmed02ek7ra
   kWUK/UVqQpbxpVH7mvBUPCKqlrXl1RtLJTjnCLhxP7z2JkmMD3u76lKca
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="330421066"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="330421066"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 17:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="686222325"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="686222325"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Apr 2023 17:10:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqNJf-000haC-2p;
	Sun, 23 Apr 2023 00:10:55 +0000
Date: Sun, 23 Apr 2023 08:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:x86/kvm_gmem_solo 18/31] virt/kvm/guest_mem.c:
 linux/pagemap.h is included more than once.
Message-ID: <202304230856.M38fCNxk-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Yu Zhang <yu.c.zhang@linux.intel.com>
CC: Chao Peng <chao.p.peng@linux.intel.com>

tree:   https://github.com/sean-jc/linux x86/kvm_gmem_solo
head:   7c98330658cf3711469536c8381120158bdc89d7
commit: 6bbc66eb07de8ee71e1eb038e496673ca160d378 [18/31] KVM: Introduced ioctl() to allocate dedicated memory for guests
:::::: branch date: 23 hours ago
:::::: commit date: 30 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304230856.M38fCNxk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> virt/kvm/guest_mem.c: linux/pagemap.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
