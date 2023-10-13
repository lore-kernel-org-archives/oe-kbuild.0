Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1024203
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 21:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5L0FRIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697232415; x=1728768415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uIA7wzSFtWPJ/IWSfH6Q6FpPa77c7L5a6rYnkxH9IE=;
  b=k5L0FRIhxxQbtQ/58xtTxcmwodYn3pseTUYSpdD+iJJGiviJr2Fjds45
   KVqGsa4RUk+07g+TR6gKr8JEIInjOa4+y47h1Ae++0V8BGb6IqM8j9Mna
   j9/g23wfptuTdM5MgSXhAOqlykVYrVLkTNSLcD3Ts7q6xzgSwFMUdNeGf
   zgPARni+7a7BbusX9N7lxgLc8p+wvqKOblIt15zBwalZ+WR73ory7IxGB
   6W+8+PLq2kqRV/9CWHXn++4jFnQTbgm5OFa1EkJZ57jI+fuwDcN56q0Qd
   MugGvP0Yi4Vswx3k78t/KFf8DI+5F3qHMW6XPxPH2e142uZEyEtirGNrm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388121333"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388121333"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 14:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758627825"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="758627825"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Oct 2023 14:26:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrPgH-0005Pb-04;
	Fri, 13 Oct 2023 21:26:49 +0000
Date: Sat, 14 Oct 2023 05:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC 06/11] KVM: VMX: Split off hyperv_evmcs.{ch}
Message-ID: <202310140532.d8aEDVAY-lkp@intel.com>
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
[cannot apply to mst-vhost/linux-next kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Kuznetsov/KVM-x86-xen-Remove-unneeded-xen-context-from-struct-kvm_arch-when-CONFIG_KVM_XEN/20231011-001336
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20231010160300.1136799-7-vkuznets%40redhat.com
patch subject: [PATCH RFC 06/11] KVM: VMX: Split off hyperv_evmcs.{ch}
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-063-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140532.d8aEDVAY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140532.d8aEDVAY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310140532.d8aEDVAY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:11:9: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:13:9: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:15:9: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:17:9: sparse: sparse: cast truncates bits from constant value (b000b becomes b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:19:9: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:21:9: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:23:9: sparse: sparse: cast truncates bits from constant value (1b001b becomes 1b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:25:9: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:27:9: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:29:9: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:31:9: sparse: sparse: cast truncates bits from constant value (1b049b becomes 49b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:33:9: sparse: sparse: cast truncates bits from constant value (1b059b becomes 59b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:35:9: sparse: sparse: cast truncates bits from constant value (80008 becomes 8)
   arch/x86/kvm/vmx/hyperv_evmcs.c:37:9: sparse: sparse: cast truncates bits from constant value (80088 becomes 88)
   arch/x86/kvm/vmx/hyperv_evmcs.c:39:9: sparse: sparse: cast truncates bits from constant value (80108 becomes 108)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:41:9: sparse: sparse: cast truncates bits from constant value (1a019a becomes 19a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:43:9: sparse: sparse: cast truncates bits from constant value (1a021a becomes 21a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:45:9: sparse: sparse: cast truncates bits from constant value (1a029a becomes 29a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:47:9: sparse: sparse: cast truncates bits from constant value (1a031a becomes 31a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:49:9: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:51:9: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:53:9: sparse: sparse: cast truncates bits from constant value (1a049a becomes 49a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:55:9: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:57:9: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:59:9: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv_evmcs.c:61:9: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
   arch/x86/kvm/vmx/hyperv_evmcs.c:63:9: sparse: sparse: cast truncates bits from constant value (80488 becomes 488)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:65:9: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:67:9: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:69:9: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:71:9: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:73:9: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:75:9: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:77:9: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:79:9: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:81:9: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:83:9: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:85:9: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:87:9: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv_evmcs.c:89:9: sparse: sparse: cast truncates bits from constant value (180018 becomes 18)
   arch/x86/kvm/vmx/hyperv_evmcs.c:91:9: sparse: sparse: cast truncates bits from constant value (180098 becomes 98)
   arch/x86/kvm/vmx/hyperv_evmcs.c:93:9: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/hyperv_evmcs.c:95:9: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:97:9: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:99:9: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:101:9: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:103:9: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:105:9: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:107:9: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:109:9: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:111:9: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:113:9: sparse: sparse: cast truncates bits from constant value (1b039b becomes 39b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:115:9: sparse: sparse: cast truncates bits from constant value (1b051b becomes 51b)
   arch/x86/kvm/vmx/hyperv_evmcs.c:117:9: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:119:9: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:121:9: sparse: sparse: cast truncates bits from constant value (80b08 becomes b08)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:123:9: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:125:9: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/hyperv_evmcs.c:147:9: sparse: sparse: cast truncates bits from constant value (90009 becomes 9)
   arch/x86/kvm/vmx/hyperv_evmcs.c:149:9: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.c:163:9: sparse: sparse: cast truncates bits from constant value (190299 becomes 299)
   arch/x86/kvm/vmx/hyperv_evmcs.c:171:9: sparse: sparse: cast truncates bits from constant value (80188 becomes 188)
   arch/x86/kvm/vmx/hyperv_evmcs.c:173:9: sparse: sparse: cast truncates bits from constant value (80208 becomes 208)
   arch/x86/kvm/vmx/hyperv_evmcs.c:175:9: sparse: sparse: cast truncates bits from constant value (80288 becomes 288)
   arch/x86/kvm/vmx/hyperv_evmcs.c:179:9: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/hyperv_evmcs.c:181:9: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.c:183:9: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.c:185:9: sparse: sparse: cast truncates bits from constant value (100110 becomes 110)
   arch/x86/kvm/vmx/hyperv_evmcs.c:187:9: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.c:189:9: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.c:191:9: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv_evmcs.c:194:9: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv_evmcs.c:196:9: sparse: sparse: cast truncates bits from constant value (130013 becomes 13)
   arch/x86/kvm/vmx/hyperv_evmcs.c:198:9: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv_evmcs.c:200:9: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv_evmcs.c:202:9: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.c:204:9: sparse: sparse: cast truncates bits from constant value (120012 becomes 12)
   arch/x86/kvm/vmx/hyperv_evmcs.c:206:9: sparse: sparse: cast truncates bits from constant value (120092 becomes 92)
   arch/x86/kvm/vmx/hyperv_evmcs.c:208:9: sparse: sparse: cast truncates bits from constant value (120112 becomes 112)
   arch/x86/kvm/vmx/hyperv_evmcs.c:210:9: sparse: sparse: cast truncates bits from constant value (120192 becomes 192)
   arch/x86/kvm/vmx/hyperv_evmcs.c:212:9: sparse: sparse: cast truncates bits from constant value (120212 becomes 212)
   arch/x86/kvm/vmx/hyperv_evmcs.c:214:9: sparse: sparse: cast truncates bits from constant value (120292 becomes 292)
   arch/x86/kvm/vmx/hyperv_evmcs.c:216:9: sparse: sparse: cast truncates bits from constant value (120312 becomes 312)
   arch/x86/kvm/vmx/hyperv_evmcs.c:218:9: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv_evmcs.c:220:9: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv_evmcs.c:222:9: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv_evmcs.c:224:9: sparse: sparse: cast truncates bits from constant value (120512 becomes 512)
   arch/x86/kvm/vmx/hyperv_evmcs.c:226:9: sparse: sparse: cast truncates bits from constant value (120592 becomes 592)
   arch/x86/kvm/vmx/hyperv_evmcs.c:228:9: sparse: sparse: cast truncates bits from constant value (120612 becomes 612)
   arch/x86/kvm/vmx/hyperv_evmcs.c:230:9: sparse: sparse: cast truncates bits from constant value (120692 becomes 692)
   arch/x86/kvm/vmx/hyperv_evmcs.c:232:9: sparse: sparse: cast truncates bits from constant value (120712 becomes 712)
   arch/x86/kvm/vmx/hyperv_evmcs.c:234:9: sparse: sparse: cast truncates bits from constant value (120792 becomes 792)
   arch/x86/kvm/vmx/hyperv_evmcs.c:236:9: sparse: sparse: cast truncates bits from constant value (120812 becomes 812)
   arch/x86/kvm/vmx/hyperv_evmcs.c:238:9: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv_evmcs.c:240:9: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:242:9: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv_evmcs.c:246:9: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv_evmcs.c:248:9: sparse: sparse: cast truncates bits from constant value (110091 becomes 91)
   arch/x86/kvm/vmx/hyperv_evmcs.c:250:9: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv_evmcs.c:252:9: sparse: sparse: too many warnings

vim +11 arch/x86/kvm/vmx/hyperv_evmcs.c

d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10    4  
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10    5  #define EVMCS1_OFFSET(x) offsetof(struct hv_enlightened_vmcs, x)
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10    6  #define EVMCS1_FIELD(number, name, clean_field)[ROL16(number, 6)] = \
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10    7  		{EVMCS1_OFFSET(name), clean_field}
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10    8  
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10    9  const struct evmcs_field vmcs_field_to_evmcs_1[] = {
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   10  	/* 64 bit rw */
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @11  	EVMCS1_FIELD(GUEST_RIP, guest_rip,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   12  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @13  	EVMCS1_FIELD(GUEST_RSP, guest_rsp,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   14  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @15  	EVMCS1_FIELD(GUEST_RFLAGS, guest_rflags,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   16  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @17  	EVMCS1_FIELD(HOST_IA32_PAT, host_ia32_pat,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   18  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @19  	EVMCS1_FIELD(HOST_IA32_EFER, host_ia32_efer,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   20  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @21  	EVMCS1_FIELD(HOST_IA32_PERF_GLOBAL_CTRL, host_ia32_perf_global_ctrl,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   22  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @23  	EVMCS1_FIELD(HOST_CR0, host_cr0,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   24  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @25  	EVMCS1_FIELD(HOST_CR3, host_cr3,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   26  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @27  	EVMCS1_FIELD(HOST_CR4, host_cr4,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   28  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @29  	EVMCS1_FIELD(HOST_IA32_SYSENTER_ESP, host_ia32_sysenter_esp,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   30  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @31  	EVMCS1_FIELD(HOST_IA32_SYSENTER_EIP, host_ia32_sysenter_eip,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   32  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @33  	EVMCS1_FIELD(HOST_RIP, host_rip,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   34  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @35  	EVMCS1_FIELD(IO_BITMAP_A, io_bitmap_a,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   36  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_IO_BITMAP),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   37  	EVMCS1_FIELD(IO_BITMAP_B, io_bitmap_b,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   38  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_IO_BITMAP),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   39  	EVMCS1_FIELD(MSR_BITMAP, msr_bitmap,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   40  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_MSR_BITMAP),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @41  	EVMCS1_FIELD(GUEST_ES_BASE, guest_es_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   42  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @43  	EVMCS1_FIELD(GUEST_CS_BASE, guest_cs_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   44  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @45  	EVMCS1_FIELD(GUEST_SS_BASE, guest_ss_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   46  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @47  	EVMCS1_FIELD(GUEST_DS_BASE, guest_ds_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   48  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @49  	EVMCS1_FIELD(GUEST_FS_BASE, guest_fs_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   50  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @51  	EVMCS1_FIELD(GUEST_GS_BASE, guest_gs_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   52  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @53  	EVMCS1_FIELD(GUEST_LDTR_BASE, guest_ldtr_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   54  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @55  	EVMCS1_FIELD(GUEST_TR_BASE, guest_tr_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   56  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @57  	EVMCS1_FIELD(GUEST_GDTR_BASE, guest_gdtr_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   58  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @59  	EVMCS1_FIELD(GUEST_IDTR_BASE, guest_idtr_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   60  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   61  	EVMCS1_FIELD(TSC_OFFSET, tsc_offset,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   62  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   63  	EVMCS1_FIELD(VIRTUAL_APIC_PAGE_ADDR, virtual_apic_page_addr,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   64  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @65  	EVMCS1_FIELD(VMCS_LINK_POINTER, vmcs_link_pointer,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   66  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @67  	EVMCS1_FIELD(GUEST_IA32_DEBUGCTL, guest_ia32_debugctl,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   68  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @69  	EVMCS1_FIELD(GUEST_IA32_PAT, guest_ia32_pat,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   70  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @71  	EVMCS1_FIELD(GUEST_IA32_EFER, guest_ia32_efer,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   72  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @73  	EVMCS1_FIELD(GUEST_IA32_PERF_GLOBAL_CTRL, guest_ia32_perf_global_ctrl,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   74  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @75  	EVMCS1_FIELD(GUEST_PDPTR0, guest_pdptr0,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   76  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @77  	EVMCS1_FIELD(GUEST_PDPTR1, guest_pdptr1,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   78  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @79  	EVMCS1_FIELD(GUEST_PDPTR2, guest_pdptr2,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   80  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @81  	EVMCS1_FIELD(GUEST_PDPTR3, guest_pdptr3,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   82  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @83  	EVMCS1_FIELD(GUEST_PENDING_DBG_EXCEPTIONS, guest_pending_dbg_exceptions,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   84  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @85  	EVMCS1_FIELD(GUEST_SYSENTER_ESP, guest_sysenter_esp,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   86  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @87  	EVMCS1_FIELD(GUEST_SYSENTER_EIP, guest_sysenter_eip,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   88  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   89  	EVMCS1_FIELD(CR0_GUEST_HOST_MASK, cr0_guest_host_mask,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   90  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   91  	EVMCS1_FIELD(CR4_GUEST_HOST_MASK, cr4_guest_host_mask,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   92  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   93  	EVMCS1_FIELD(CR0_READ_SHADOW, cr0_read_shadow,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   94  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   95  	EVMCS1_FIELD(CR4_READ_SHADOW, cr4_read_shadow,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   96  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @97  	EVMCS1_FIELD(GUEST_CR0, guest_cr0,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10   98  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  @99  	EVMCS1_FIELD(GUEST_CR3, guest_cr3,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  100  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @101  	EVMCS1_FIELD(GUEST_CR4, guest_cr4,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  102  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @103  	EVMCS1_FIELD(GUEST_DR7, guest_dr7,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  104  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @105  	EVMCS1_FIELD(HOST_FS_BASE, host_fs_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  106  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @107  	EVMCS1_FIELD(HOST_GS_BASE, host_gs_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  108  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @109  	EVMCS1_FIELD(HOST_TR_BASE, host_tr_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  110  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @111  	EVMCS1_FIELD(HOST_GDTR_BASE, host_gdtr_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  112  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @113  	EVMCS1_FIELD(HOST_IDTR_BASE, host_idtr_base,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  114  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @115  	EVMCS1_FIELD(HOST_RSP, host_rsp,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  116  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  117  	EVMCS1_FIELD(EPT_POINTER, ept_pointer,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  118  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_XLAT),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @119  	EVMCS1_FIELD(GUEST_BNDCFGS, guest_bndcfgs,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  120  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @121  	EVMCS1_FIELD(XSS_EXIT_BITMAP, xss_exit_bitmap,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  122  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @123  	EVMCS1_FIELD(ENCLS_EXITING_BITMAP, encls_exiting_bitmap,
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10  124  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
d81ea0d25c7e5f Vitaly Kuznetsov 2023-10-10 @125  	EVMCS1_FIELD(TSC_MULTIPLIER, tsc_multiplier,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
