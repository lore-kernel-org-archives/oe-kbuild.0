Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D8B10F2
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Oct 2023 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLJLVBJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697295043; x=1728831043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ac7x03xciiUopz2yZ5WdczWWndiSGx4hOFo4e4w569A=;
  b=OLJLVBJXQF7USK8m+YJZv3PCb1jIgYPN4EeJq/yPCkPcH1pzedjDtbjH
   Hm3MWFYDheOExnqa81kyRuZGxB/DmHSWx9KkiILSaIzr8g+lECBb+T5KE
   8Q8T1gxCbzE7sIg/JTF+VUVPFs5RrPQQb4yr17VwXvq5zzEHyfWdEtzxK
   NWa/ezzM2M4qmt7WLsa4J88qS6ZqAap3crjCfc0RLLAQUwoD05l4aCSOs
   oCcPpxV85UY3WL53gEkQCgOnwG+9FsyzUH/OAlhKAjifMuGbHj7I2/2VD
   niQbsB9PmI6EJED75/OHRAD3JHtfV7LY+5OU37DF7RygWS1IN0UQZLc4f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471558847"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471558847"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 07:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784493401"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784493401"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 07:50:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrfyQ-0006H9-0T;
	Sat, 14 Oct 2023 14:50:38 +0000
Date: Sat, 14 Oct 2023 22:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC 06/11] KVM: VMX: Split off hyperv_evmcs.{ch}
Message-ID: <202310142251.DkseuK4B-lkp@intel.com>
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
In-Reply-To: <20231010160300.1136799-7-vkuznets@redhat.com>
References: <20231010160300.1136799-7-vkuznets@redhat.com>
TO: Vitaly Kuznetsov <vkuznets@redhat.com>

Hi Vitaly,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on linus/master v6.6-rc5 next-20231013]
[cannot apply to mst-vhost/linux-next kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Kuznetsov/KVM-x86-xen-Remove-unneeded-xen-context-from-struct-kvm_arch-when-CONFIG_KVM_XEN/20231011-001336
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20231010160300.1136799-7-vkuznets%40redhat.com
patch subject: [PATCH RFC 06/11] KVM: VMX: Split off hyperv_evmcs.{ch}
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-061-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142251.DkseuK4B-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142251.DkseuK4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310142251.DkseuK4B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/vmx/vmx.c: note: in included file (through arch/x86/kvm/vmx/vmx_onhyperv.h, arch/x86/kvm/vmx/vmx_ops.h, arch/x86/kvm/vmx/vmx.h, ...):
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100110 becomes 110)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a050a becomes 50a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: too many warnings
--
   arch/x86/kvm/vmx/nested.c: note: in included file (through arch/x86/kvm/vmx/vmx_onhyperv.h, arch/x86/kvm/vmx/vmx_ops.h, arch/x86/kvm/vmx/vmx.h, ...):
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80608 becomes 608)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80108 becomes 108)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80388 becomes 388)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20482 becomes 482)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100910 becomes 910)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80188 becomes 188)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80208 becomes 208)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80288 becomes 288)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20002 becomes 2)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20082 becomes 82)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20102 becomes 102)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20182 becomes 182)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20202 becomes 202)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20282 becomes 282)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20302 becomes 302)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (20382 becomes 382)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120012 becomes 12)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120092 becomes 92)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120112 becomes 112)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120192 becomes 192)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120212 becomes 212)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120292 becomes 292)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120312 becomes 312)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120592 becomes 592)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120612 becomes 612)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120512 becomes 512)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120692 becomes 692)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120712 becomes 712)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120792 becomes 792)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120812 becomes 812)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a019a becomes 19a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a021a becomes 21a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a029a becomes 29a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a031a becomes 31a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a049a becomes 49a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80b08 becomes b08)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80708 becomes 708)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80788 becomes 788)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80808 becomes 808)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80888 becomes 888)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100390 becomes 390)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (180018 becomes 18)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv_evmcs.h:128:30: sparse: sparse: too many warnings

vim +128 arch/x86/kvm/vmx/hyperv_evmcs.h

d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  124  
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  125  static __always_inline int evmcs_field_offset(unsigned long field,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  126  					      u16 *clean_field)
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  127  {
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @128  	unsigned int index = ROL16(field, 6);
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  129  	const struct evmcs_field *evmcs_field;
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  130  
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  131  	if (unlikely(index >= nr_evmcs_1_fields))
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  132  		return -ENOENT;
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  133  
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  134  	evmcs_field = &vmcs_field_to_evmcs_1[index];
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  135  
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  136  	/*
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  137  	 * Use offset=0 to detect holes in eVMCS. This offset belongs to
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  138  	 * 'revision_id' but this field has no encoding and is supposed to
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  139  	 * be accessed directly.
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  140  	 */
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  141  	if (unlikely(!evmcs_field->offset))
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  142  		return -ENOENT;
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  143  
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  144  	if (clean_field)
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  145  		*clean_field = evmcs_field->clean_field;
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  146  
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  147  	return evmcs_field->offset;
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  148  }
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
