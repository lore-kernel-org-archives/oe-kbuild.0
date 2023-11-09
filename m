Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA9200DD
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Nov 2023 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5+78+cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699556888; x=1731092888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3KdZ9abY5IXqHBO3UohTQAOwOcW55+bOGsTS2dG2ad0=;
  b=O5+78+ccSN6UcNJAM+hI9bdees6j2InZ/hmxqXHkZlrRsHUnIzokWoci
   UB8DNi5T+s+0WS7XeLwn1LHDbYZ25XB7KzGLPp87ukj8SzBozK+JqB3j6
   s4MAI8uAE6HD5t+oRyKeqa7F6d12ti0WULLLQ1kaajrs3CI/Yg/cGs/nT
   Vd7gZtRDB8UcO0e/03ZXvwIvC/Q/M98xFJ6qf4b1NBVy8gq5FLDeg7+Nu
   RjRa64cqU9et3UQzZXocZ5BrOfmqPZsRdXrGJkwTssBRynuoWlxkCZoqV
   98dNwisMsGydzv7dvAKR9U5af9h1nrOJ4lQPNysD5Cebl7xpShkr2ClU7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="8710185"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="8710185"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 11:08:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="713415343"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="713415343"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Nov 2023 11:08:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ANn-00094m-0I;
	Thu, 09 Nov 2023 19:08:03 +0000
Date: Fri, 10 Nov 2023 03:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] KVM: X86: Add a capability to configure bus
 frequency for APIC timer
Message-ID: <202311100209.zIaZqZhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <70c2a2277f57b804c715c5b4b4aa0b3561ed6a4f.1699383993.git.isaku.yamahata@intel.com>
References: <70c2a2277f57b804c715c5b4b4aa0b3561ed6a4f.1699383993.git.isaku.yamahata@intel.com>
TO: isaku.yamahata@intel.com
TO: kvm@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: isaku.yamahata@intel.com
CC: isaku.yamahata@gmail.com
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: erdemaktas@google.com
CC: Sean Christopherson <seanjc@google.com>
CC: Vishal Annapurve <vannapurve@google.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on linus/master next-20231109]
[cannot apply to mst-vhost/linux-next kvm/linux-next v6.6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/isaku-yamahata-intel-com/KVM-x86-Make-the-hardcoded-APIC-bus-frequency-vm-variable/20231108-032736
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/70c2a2277f57b804c715c5b4b4aa0b3561ed6a4f.1699383993.git.isaku.yamahata%40intel.com
patch subject: [PATCH 2/2] KVM: X86: Add a capability to configure bus frequency for APIC timer
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-buildonly-randconfig-002-20231109 (https://download.01.org/0day-ci/archive/20231110/202311100209.zIaZqZhg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100209.zIaZqZhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311100209.zIaZqZhg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/x86.o: in function `kvm_vm_ioctl_enable_cap':
>> x86.c:(.text+0x1265b): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
