Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE116FD5
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Nov 2022 20:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669234177; x=1700770177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0RdC73X9FrKHY0ScaFM6hIhr+dwQ95pmfYFslsTlXQ=;
  b=a4dllGXiAfsAG0WUH2VjyaE8GSX+B0zYHHJygUGHMQjOD1vyh+3TGvs2
   OyUz47jWv2Km0RpRpnZOnXJxcCsBgpeAceYGNWxmkLJLZX+P/mdYS/TXL
   VrZLedLwSrWEGUvq6/FkKXyyqBbnM+h1lXfzZBe2Kvgt3r/Nm/1JANl6+
   eNyIjpFEawDQNcgzD/jXiBGMl1p+XLRgTijhtZXAPkIMIPWdYk4BqJmhI
   Tima7YmT/AUWF4sihlfmT9EZnVfPSQ9stUNePd9VBLlnxKAyoMgS9AAOS
   ailDO2o2+h+FZ+jUBcVddBwoG0rd3wrWtVh56KIq+mvYagk0TMGiojtSF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="400444134"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="400444134"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 12:09:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="641959453"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="641959453"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 12:09:34 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oxw3p-00034P-32;
	Wed, 23 Nov 2022 20:09:33 +0000
Date: Thu, 24 Nov 2022 04:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kvm:queue 21/62] arch/x86/kvm/vmx/hyperv.c:22:9: sparse: sparse:
 cast truncates bits from constant value (1a079a becomes 79a)
Message-ID: <202211240346.3o1ZUo1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="yLVIM82DhIPoldq9"
Content-Disposition: inline


--yLVIM82DhIPoldq9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: kvm@vger.kernel.org
CC: Robert Hu <robert.hu@intel.com>
CC: Farrah Chen <farrah.chen@intel.com>
CC: Danmei Wei <danmei.wei@intel.com>
TO: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Sean Christopherson <seanjc@google.com>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   0fa32dad1e78629cb42999dacd82489503fdf4c2
commit: a789aeba419647c44d7e7320de20fea037c211d0 [21/62] KVM: VMX: Rename "vmx/evmcs.{ch}" to "vmx/hyperv.{ch}"
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-s002-20221121
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=a789aeba419647c44d7e7320de20fea037c211d0
        git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
        git fetch --no-tags kvm queue
        git checkout a789aeba419647c44d7e7320de20fea037c211d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/hyperv.c:22:9: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
>> arch/x86/kvm/vmx/hyperv.c:24:9: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
>> arch/x86/kvm/vmx/hyperv.c:26:9: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv.c:28:9: sparse: sparse: cast truncates bits from constant value (b000b becomes b)
>> arch/x86/kvm/vmx/hyperv.c:30:9: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
>> arch/x86/kvm/vmx/hyperv.c:32:9: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
>> arch/x86/kvm/vmx/hyperv.c:34:9: sparse: sparse: cast truncates bits from constant value (1b001b becomes 1b)
>> arch/x86/kvm/vmx/hyperv.c:36:9: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
>> arch/x86/kvm/vmx/hyperv.c:38:9: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
>> arch/x86/kvm/vmx/hyperv.c:40:9: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
>> arch/x86/kvm/vmx/hyperv.c:42:9: sparse: sparse: cast truncates bits from constant value (1b049b becomes 49b)
>> arch/x86/kvm/vmx/hyperv.c:44:9: sparse: sparse: cast truncates bits from constant value (1b059b becomes 59b)
>> arch/x86/kvm/vmx/hyperv.c:46:9: sparse: sparse: cast truncates bits from constant value (80008 becomes 8)
   arch/x86/kvm/vmx/hyperv.c:48:9: sparse: sparse: cast truncates bits from constant value (80088 becomes 88)
   arch/x86/kvm/vmx/hyperv.c:50:9: sparse: sparse: cast truncates bits from constant value (80108 becomes 108)
>> arch/x86/kvm/vmx/hyperv.c:52:9: sparse: sparse: cast truncates bits from constant value (1a019a becomes 19a)
>> arch/x86/kvm/vmx/hyperv.c:54:9: sparse: sparse: cast truncates bits from constant value (1a021a becomes 21a)
>> arch/x86/kvm/vmx/hyperv.c:56:9: sparse: sparse: cast truncates bits from constant value (1a029a becomes 29a)
>> arch/x86/kvm/vmx/hyperv.c:58:9: sparse: sparse: cast truncates bits from constant value (1a031a becomes 31a)
>> arch/x86/kvm/vmx/hyperv.c:60:9: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
>> arch/x86/kvm/vmx/hyperv.c:62:9: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
>> arch/x86/kvm/vmx/hyperv.c:64:9: sparse: sparse: cast truncates bits from constant value (1a049a becomes 49a)
>> arch/x86/kvm/vmx/hyperv.c:66:9: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
>> arch/x86/kvm/vmx/hyperv.c:68:9: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
>> arch/x86/kvm/vmx/hyperv.c:70:9: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv.c:72:9: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
   arch/x86/kvm/vmx/hyperv.c:74:9: sparse: sparse: cast truncates bits from constant value (80488 becomes 488)
>> arch/x86/kvm/vmx/hyperv.c:76:9: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
>> arch/x86/kvm/vmx/hyperv.c:78:9: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.c:80:9: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
>> arch/x86/kvm/vmx/hyperv.c:82:9: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
>> arch/x86/kvm/vmx/hyperv.c:84:9: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
>> arch/x86/kvm/vmx/hyperv.c:86:9: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv.c:88:9: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv.c:90:9: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv.c:92:9: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
>> arch/x86/kvm/vmx/hyperv.c:94:9: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
>> arch/x86/kvm/vmx/hyperv.c:96:9: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv.c:98:9: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv.c:100:9: sparse: sparse: cast truncates bits from constant value (180018 becomes 18)
   arch/x86/kvm/vmx/hyperv.c:102:9: sparse: sparse: cast truncates bits from constant value (180098 becomes 98)
   arch/x86/kvm/vmx/hyperv.c:104:9: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/hyperv.c:106:9: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
>> arch/x86/kvm/vmx/hyperv.c:108:9: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
>> arch/x86/kvm/vmx/hyperv.c:110:9: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
>> arch/x86/kvm/vmx/hyperv.c:112:9: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv.c:114:9: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
>> arch/x86/kvm/vmx/hyperv.c:116:9: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
>> arch/x86/kvm/vmx/hyperv.c:118:9: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
>> arch/x86/kvm/vmx/hyperv.c:120:9: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
>> arch/x86/kvm/vmx/hyperv.c:122:9: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
>> arch/x86/kvm/vmx/hyperv.c:124:9: sparse: sparse: cast truncates bits from constant value (1b039b becomes 39b)
>> arch/x86/kvm/vmx/hyperv.c:126:9: sparse: sparse: cast truncates bits from constant value (1b051b becomes 51b)
   arch/x86/kvm/vmx/hyperv.c:128:9: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
>> arch/x86/kvm/vmx/hyperv.c:130:9: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv.c:132:9: sparse: sparse: cast truncates bits from constant value (80b08 becomes b08)
>> arch/x86/kvm/vmx/hyperv.c:134:9: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
>> arch/x86/kvm/vmx/hyperv.c:136:9: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/hyperv.c:158:9: sparse: sparse: cast truncates bits from constant value (90009 becomes 9)
   arch/x86/kvm/vmx/hyperv.c:160:9: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv.c:174:9: sparse: sparse: cast truncates bits from constant value (190299 becomes 299)
   arch/x86/kvm/vmx/hyperv.c:182:9: sparse: sparse: cast truncates bits from constant value (80188 becomes 188)
   arch/x86/kvm/vmx/hyperv.c:184:9: sparse: sparse: cast truncates bits from constant value (80208 becomes 208)
   arch/x86/kvm/vmx/hyperv.c:186:9: sparse: sparse: cast truncates bits from constant value (80288 becomes 288)
   arch/x86/kvm/vmx/hyperv.c:190:9: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/hyperv.c:192:9: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv.c:194:9: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv.c:196:9: sparse: sparse: cast truncates bits from constant value (100110 becomes 110)
   arch/x86/kvm/vmx/hyperv.c:198:9: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.c:200:9: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv.c:202:9: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv.c:205:9: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv.c:207:9: sparse: sparse: cast truncates bits from constant value (130013 becomes 13)
   arch/x86/kvm/vmx/hyperv.c:209:9: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv.c:211:9: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv.c:213:9: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv.c:215:9: sparse: sparse: cast truncates bits from constant value (120012 becomes 12)
   arch/x86/kvm/vmx/hyperv.c:217:9: sparse: sparse: cast truncates bits from constant value (120092 becomes 92)
   arch/x86/kvm/vmx/hyperv.c:219:9: sparse: sparse: cast truncates bits from constant value (120112 becomes 112)
   arch/x86/kvm/vmx/hyperv.c:221:9: sparse: sparse: cast truncates bits from constant value (120192 becomes 192)
   arch/x86/kvm/vmx/hyperv.c:223:9: sparse: sparse: cast truncates bits from constant value (120212 becomes 212)
   arch/x86/kvm/vmx/hyperv.c:225:9: sparse: sparse: cast truncates bits from constant value (120292 becomes 292)
   arch/x86/kvm/vmx/hyperv.c:227:9: sparse: sparse: cast truncates bits from constant value (120312 becomes 312)
   arch/x86/kvm/vmx/hyperv.c:229:9: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv.c:231:9: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv.c:233:9: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv.c:235:9: sparse: sparse: cast truncates bits from constant value (120512 becomes 512)
   arch/x86/kvm/vmx/hyperv.c:237:9: sparse: sparse: cast truncates bits from constant value (120592 becomes 592)
   arch/x86/kvm/vmx/hyperv.c:239:9: sparse: sparse: cast truncates bits from constant value (120612 becomes 612)
   arch/x86/kvm/vmx/hyperv.c:241:9: sparse: sparse: cast truncates bits from constant value (120692 becomes 692)
   arch/x86/kvm/vmx/hyperv.c:243:9: sparse: sparse: cast truncates bits from constant value (120712 becomes 712)
   arch/x86/kvm/vmx/hyperv.c:245:9: sparse: sparse: cast truncates bits from constant value (120792 becomes 792)
   arch/x86/kvm/vmx/hyperv.c:247:9: sparse: sparse: cast truncates bits from constant value (120812 becomes 812)
   arch/x86/kvm/vmx/hyperv.c:249:9: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv.c:251:9: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
>> arch/x86/kvm/vmx/hyperv.c:253:9: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv.c:257:9: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.c:259:9: sparse: sparse: cast truncates bits from constant value (110091 becomes 91)
   arch/x86/kvm/vmx/hyperv.c:261:9: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv.c:263:9: sparse: sparse: too many warnings

vim +22 arch/x86/kvm/vmx/hyperv.c

75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   15  
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   16  #define EVMCS1_OFFSET(x) offsetof(struct hv_enlightened_vmcs, x)
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   17  #define EVMCS1_FIELD(number, name, clean_field)[ROL16(number, 6)] = \
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   18  		{EVMCS1_OFFSET(name), clean_field}
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   19  
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   20  const struct evmcs_field vmcs_field_to_evmcs_1[] = {
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   21  	/* 64 bit rw */
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @22  	EVMCS1_FIELD(GUEST_RIP, guest_rip,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   23  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @24  	EVMCS1_FIELD(GUEST_RSP, guest_rsp,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   25  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @26  	EVMCS1_FIELD(GUEST_RFLAGS, guest_rflags,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   27  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @28  	EVMCS1_FIELD(HOST_IA32_PAT, host_ia32_pat,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   29  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @30  	EVMCS1_FIELD(HOST_IA32_EFER, host_ia32_efer,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   31  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  @32  	EVMCS1_FIELD(HOST_IA32_PERF_GLOBAL_CTRL, host_ia32_perf_global_ctrl,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30   33  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @34  	EVMCS1_FIELD(HOST_CR0, host_cr0,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   35  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @36  	EVMCS1_FIELD(HOST_CR3, host_cr3,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   37  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @38  	EVMCS1_FIELD(HOST_CR4, host_cr4,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   39  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @40  	EVMCS1_FIELD(HOST_IA32_SYSENTER_ESP, host_ia32_sysenter_esp,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   41  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @42  	EVMCS1_FIELD(HOST_IA32_SYSENTER_EIP, host_ia32_sysenter_eip,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   43  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @44  	EVMCS1_FIELD(HOST_RIP, host_rip,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   45  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @46  	EVMCS1_FIELD(IO_BITMAP_A, io_bitmap_a,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   47  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_IO_BITMAP),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   48  	EVMCS1_FIELD(IO_BITMAP_B, io_bitmap_b,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   49  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_IO_BITMAP),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   50  	EVMCS1_FIELD(MSR_BITMAP, msr_bitmap,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   51  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_MSR_BITMAP),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @52  	EVMCS1_FIELD(GUEST_ES_BASE, guest_es_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   53  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @54  	EVMCS1_FIELD(GUEST_CS_BASE, guest_cs_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   55  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @56  	EVMCS1_FIELD(GUEST_SS_BASE, guest_ss_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   57  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @58  	EVMCS1_FIELD(GUEST_DS_BASE, guest_ds_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   59  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @60  	EVMCS1_FIELD(GUEST_FS_BASE, guest_fs_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   61  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @62  	EVMCS1_FIELD(GUEST_GS_BASE, guest_gs_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   63  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @64  	EVMCS1_FIELD(GUEST_LDTR_BASE, guest_ldtr_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   65  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @66  	EVMCS1_FIELD(GUEST_TR_BASE, guest_tr_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   67  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @68  	EVMCS1_FIELD(GUEST_GDTR_BASE, guest_gdtr_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   69  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @70  	EVMCS1_FIELD(GUEST_IDTR_BASE, guest_idtr_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   71  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   72  	EVMCS1_FIELD(TSC_OFFSET, tsc_offset,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   73  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   74  	EVMCS1_FIELD(VIRTUAL_APIC_PAGE_ADDR, virtual_apic_page_addr,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   75  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @76  	EVMCS1_FIELD(VMCS_LINK_POINTER, vmcs_link_pointer,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   77  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @78  	EVMCS1_FIELD(GUEST_IA32_DEBUGCTL, guest_ia32_debugctl,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   79  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @80  	EVMCS1_FIELD(GUEST_IA32_PAT, guest_ia32_pat,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   81  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @82  	EVMCS1_FIELD(GUEST_IA32_EFER, guest_ia32_efer,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   83  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  @84  	EVMCS1_FIELD(GUEST_IA32_PERF_GLOBAL_CTRL, guest_ia32_perf_global_ctrl,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30   85  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @86  	EVMCS1_FIELD(GUEST_PDPTR0, guest_pdptr0,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   87  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @88  	EVMCS1_FIELD(GUEST_PDPTR1, guest_pdptr1,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   89  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @90  	EVMCS1_FIELD(GUEST_PDPTR2, guest_pdptr2,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   91  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @92  	EVMCS1_FIELD(GUEST_PDPTR3, guest_pdptr3,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   93  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @94  	EVMCS1_FIELD(GUEST_PENDING_DBG_EXCEPTIONS, guest_pending_dbg_exceptions,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   95  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @96  	EVMCS1_FIELD(GUEST_SYSENTER_ESP, guest_sysenter_esp,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   97  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @98  	EVMCS1_FIELD(GUEST_SYSENTER_EIP, guest_sysenter_eip,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   99  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  100  	EVMCS1_FIELD(CR0_GUEST_HOST_MASK, cr0_guest_host_mask,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  101  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  102  	EVMCS1_FIELD(CR4_GUEST_HOST_MASK, cr4_guest_host_mask,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  103  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  104  	EVMCS1_FIELD(CR0_READ_SHADOW, cr0_read_shadow,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  105  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  106  	EVMCS1_FIELD(CR4_READ_SHADOW, cr4_read_shadow,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  107  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @108  	EVMCS1_FIELD(GUEST_CR0, guest_cr0,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  109  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @110  	EVMCS1_FIELD(GUEST_CR3, guest_cr3,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  111  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @112  	EVMCS1_FIELD(GUEST_CR4, guest_cr4,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  113  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @114  	EVMCS1_FIELD(GUEST_DR7, guest_dr7,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  115  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @116  	EVMCS1_FIELD(HOST_FS_BASE, host_fs_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  117  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @118  	EVMCS1_FIELD(HOST_GS_BASE, host_gs_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  119  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @120  	EVMCS1_FIELD(HOST_TR_BASE, host_tr_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  121  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @122  	EVMCS1_FIELD(HOST_GDTR_BASE, host_gdtr_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  123  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @124  	EVMCS1_FIELD(HOST_IDTR_BASE, host_idtr_base,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  125  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @126  	EVMCS1_FIELD(HOST_RSP, host_rsp,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  127  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  128  	EVMCS1_FIELD(EPT_POINTER, ept_pointer,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  129  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_XLAT),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @130  	EVMCS1_FIELD(GUEST_BNDCFGS, guest_bndcfgs,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  131  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @132  	EVMCS1_FIELD(XSS_EXIT_BITMAP, xss_exit_bitmap,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  133  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30 @134  	EVMCS1_FIELD(ENCLS_EXITING_BITMAP, encls_exiting_bitmap,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  135  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30 @136  	EVMCS1_FIELD(TSC_MULTIPLIER, tsc_multiplier,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  137  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  138  	/*
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  139  	 * Not used by KVM:
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  140  	 *
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  141  	 * EVMCS1_FIELD(0x00006828, guest_ia32_s_cet,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  142  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  143  	 * EVMCS1_FIELD(0x0000682A, guest_ssp,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  144  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  145  	 * EVMCS1_FIELD(0x0000682C, guest_ia32_int_ssp_table_addr,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  146  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  147  	 * EVMCS1_FIELD(0x00002816, guest_ia32_lbr_ctl,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  148  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  149  	 * EVMCS1_FIELD(0x00006C18, host_ia32_s_cet,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  150  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  151  	 * EVMCS1_FIELD(0x00006C1A, host_ssp,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  152  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  153  	 * EVMCS1_FIELD(0x00006C1C, host_ia32_int_ssp_table_addr,
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  154  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
b19e4ff5e558221 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  155  	 */
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  156  
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  157  	/* 64 bit read only */
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  158  	EVMCS1_FIELD(GUEST_PHYSICAL_ADDRESS, guest_physical_address,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  159  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  160  	EVMCS1_FIELD(EXIT_QUALIFICATION, exit_qualification,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  161  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  162  	/*
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  163  	 * Not defined in KVM:
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  164  	 *
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  165  	 * EVMCS1_FIELD(0x00006402, exit_io_instruction_ecx,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  166  	 *		HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE);
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  167  	 * EVMCS1_FIELD(0x00006404, exit_io_instruction_esi,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  168  	 *		HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE);
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  169  	 * EVMCS1_FIELD(0x00006406, exit_io_instruction_esi,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  170  	 *		HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE);
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  171  	 * EVMCS1_FIELD(0x00006408, exit_io_instruction_eip,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  172  	 *		HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE);
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  173  	 */
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  174  	EVMCS1_FIELD(GUEST_LINEAR_ADDRESS, guest_linear_address,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  175  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  176  
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  177  	/*
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  178  	 * No mask defined in the spec as Hyper-V doesn't currently support
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  179  	 * these. Future proof by resetting the whole clean field mask on
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  180  	 * access.
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  181  	 */
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  182  	EVMCS1_FIELD(VM_EXIT_MSR_STORE_ADDR, vm_exit_msr_store_addr,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  183  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  184  	EVMCS1_FIELD(VM_EXIT_MSR_LOAD_ADDR, vm_exit_msr_load_addr,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  185  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  186  	EVMCS1_FIELD(VM_ENTRY_MSR_LOAD_ADDR, vm_entry_msr_load_addr,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  187  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  188  
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  189  	/* 32 bit rw */
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  190  	EVMCS1_FIELD(TPR_THRESHOLD, tpr_threshold,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  191  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  192  	EVMCS1_FIELD(GUEST_INTERRUPTIBILITY_INFO, guest_interruptibility_info,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  193  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  194  	EVMCS1_FIELD(CPU_BASED_VM_EXEC_CONTROL, cpu_based_vm_exec_control,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  195  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_PROC),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  196  	EVMCS1_FIELD(EXCEPTION_BITMAP, exception_bitmap,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  197  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_EXCPN),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  198  	EVMCS1_FIELD(VM_ENTRY_CONTROLS, vm_entry_controls,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  199  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_ENTRY),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  200  	EVMCS1_FIELD(VM_ENTRY_INTR_INFO_FIELD, vm_entry_intr_info_field,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  201  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_EVENT),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  202  	EVMCS1_FIELD(VM_ENTRY_EXCEPTION_ERROR_CODE,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  203  		     vm_entry_exception_error_code,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  204  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_EVENT),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  205  	EVMCS1_FIELD(VM_ENTRY_INSTRUCTION_LEN, vm_entry_instruction_len,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  206  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_EVENT),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  207  	EVMCS1_FIELD(HOST_IA32_SYSENTER_CS, host_ia32_sysenter_cs,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  208  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  209  	EVMCS1_FIELD(PIN_BASED_VM_EXEC_CONTROL, pin_based_vm_exec_control,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  210  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  211  	EVMCS1_FIELD(VM_EXIT_CONTROLS, vm_exit_controls,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  212  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  213  	EVMCS1_FIELD(SECONDARY_VM_EXEC_CONTROL, secondary_vm_exec_control,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  214  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  215  	EVMCS1_FIELD(GUEST_ES_LIMIT, guest_es_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  216  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  217  	EVMCS1_FIELD(GUEST_CS_LIMIT, guest_cs_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  218  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  219  	EVMCS1_FIELD(GUEST_SS_LIMIT, guest_ss_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  220  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  221  	EVMCS1_FIELD(GUEST_DS_LIMIT, guest_ds_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  222  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  223  	EVMCS1_FIELD(GUEST_FS_LIMIT, guest_fs_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  224  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  225  	EVMCS1_FIELD(GUEST_GS_LIMIT, guest_gs_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  226  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  227  	EVMCS1_FIELD(GUEST_LDTR_LIMIT, guest_ldtr_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  228  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  229  	EVMCS1_FIELD(GUEST_TR_LIMIT, guest_tr_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  230  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  231  	EVMCS1_FIELD(GUEST_GDTR_LIMIT, guest_gdtr_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  232  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  233  	EVMCS1_FIELD(GUEST_IDTR_LIMIT, guest_idtr_limit,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  234  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  235  	EVMCS1_FIELD(GUEST_ES_AR_BYTES, guest_es_ar_bytes,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  236  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  237  	EVMCS1_FIELD(GUEST_CS_AR_BYTES, guest_cs_ar_bytes,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  238  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  239  	EVMCS1_FIELD(GUEST_SS_AR_BYTES, guest_ss_ar_bytes,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  240  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  241  	EVMCS1_FIELD(GUEST_DS_AR_BYTES, guest_ds_ar_bytes,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  242  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  243  	EVMCS1_FIELD(GUEST_FS_AR_BYTES, guest_fs_ar_bytes,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  244  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  245  	EVMCS1_FIELD(GUEST_GS_AR_BYTES, guest_gs_ar_bytes,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  246  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  247  	EVMCS1_FIELD(GUEST_LDTR_AR_BYTES, guest_ldtr_ar_bytes,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  248  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  249  	EVMCS1_FIELD(GUEST_TR_AR_BYTES, guest_tr_ar_bytes,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  250  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  251  	EVMCS1_FIELD(GUEST_ACTIVITY_STATE, guest_activity_state,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  252  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  253  	EVMCS1_FIELD(GUEST_SYSENTER_CS, guest_sysenter_cs,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  254  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  255  
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  256  	/* 32 bit read only */
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  257  	EVMCS1_FIELD(VM_INSTRUCTION_ERROR, vm_instruction_error,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  258  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  259  	EVMCS1_FIELD(VM_EXIT_REASON, vm_exit_reason,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  260  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  261  	EVMCS1_FIELD(VM_EXIT_INTR_INFO, vm_exit_intr_info,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  262  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  263  	EVMCS1_FIELD(VM_EXIT_INTR_ERROR_CODE, vm_exit_intr_error_code,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  264  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  265  	EVMCS1_FIELD(IDT_VECTORING_INFO_FIELD, idt_vectoring_info_field,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  266  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  267  	EVMCS1_FIELD(IDT_VECTORING_ERROR_CODE, idt_vectoring_error_code,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  268  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  269  	EVMCS1_FIELD(VM_EXIT_INSTRUCTION_LEN, vm_exit_instruction_len,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  270  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  271  	EVMCS1_FIELD(VMX_INSTRUCTION_INFO, vmx_instruction_info,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  272  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  273  
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  274  	/* No mask defined in the spec (not used) */
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  275  	EVMCS1_FIELD(PAGE_FAULT_ERROR_CODE_MASK, page_fault_error_code_mask,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  276  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  277  	EVMCS1_FIELD(PAGE_FAULT_ERROR_CODE_MATCH, page_fault_error_code_match,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  278  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  279  	EVMCS1_FIELD(CR3_TARGET_COUNT, cr3_target_count,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  280  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  281  	EVMCS1_FIELD(VM_EXIT_MSR_STORE_COUNT, vm_exit_msr_store_count,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  282  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  283  	EVMCS1_FIELD(VM_EXIT_MSR_LOAD_COUNT, vm_exit_msr_load_count,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  284  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  285  	EVMCS1_FIELD(VM_ENTRY_MSR_LOAD_COUNT, vm_entry_msr_load_count,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  286  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  287  
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  288  	/* 16 bit rw */
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  289  	EVMCS1_FIELD(HOST_ES_SELECTOR, host_es_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  290  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  291  	EVMCS1_FIELD(HOST_CS_SELECTOR, host_cs_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  292  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  293  	EVMCS1_FIELD(HOST_SS_SELECTOR, host_ss_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  294  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  295  	EVMCS1_FIELD(HOST_DS_SELECTOR, host_ds_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  296  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  297  	EVMCS1_FIELD(HOST_FS_SELECTOR, host_fs_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  298  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  299  	EVMCS1_FIELD(HOST_GS_SELECTOR, host_gs_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  300  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  301  	EVMCS1_FIELD(HOST_TR_SELECTOR, host_tr_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  302  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  303  	EVMCS1_FIELD(GUEST_ES_SELECTOR, guest_es_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  304  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  305  	EVMCS1_FIELD(GUEST_CS_SELECTOR, guest_cs_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  306  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  307  	EVMCS1_FIELD(GUEST_SS_SELECTOR, guest_ss_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  308  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  309  	EVMCS1_FIELD(GUEST_DS_SELECTOR, guest_ds_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  310  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  311  	EVMCS1_FIELD(GUEST_FS_SELECTOR, guest_fs_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  312  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  313  	EVMCS1_FIELD(GUEST_GS_SELECTOR, guest_gs_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  314  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  315  	EVMCS1_FIELD(GUEST_LDTR_SELECTOR, guest_ldtr_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  316  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  317  	EVMCS1_FIELD(GUEST_TR_SELECTOR, guest_tr_selector,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  318  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  319  	EVMCS1_FIELD(VIRTUAL_PROCESSOR_ID, virtual_processor_id,
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  320  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_XLAT),
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  321  };
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  322  const unsigned int nr_evmcs_1_fields = ARRAY_SIZE(vmcs_field_to_evmcs_1);
75edce8a45486fe arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  323  

:::::: The code at line 22 was first introduced by commit
:::::: 75edce8a45486fe5fa5becdb43a7c36354b2a379 KVM: VMX: Move eVMCS code to dedicated files

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--yLVIM82DhIPoldq9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 6.1.0-rc4 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23900
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23900
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_WATCH_QUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_NOCB_CPU is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
# CONFIG_CGROUP_HUGETLB is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
# CONFIG_NAMESPACES is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
# CONFIG_UID16 is not set
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
# CONFIG_POSIX_TIMERS is not set
CONFIG_PRINTK=y
CONFIG_BUG=y
# CONFIG_PCSPKR_PLATFORM is not set
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
# CONFIG_KCMP is not set
CONFIG_RSEQ=y
CONFIG_DEBUG_RSEQ=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_X86_32=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=512
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_X86_32_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_BIGSMP=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=m
# CONFIG_IOSF_MBI_DEBUG is not set
# CONFIG_X86_RDC321X is not set
CONFIG_X86_32_NON_STANDARD=y
CONFIG_STA2X11=y
CONFIG_X86_32_IRIS=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_M486SX is not set
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
# CONFIG_M686 is not set
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
CONFIG_MGEODEGX1=y
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_X86_GENERIC is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=4
CONFIG_X86_L1_CACHE_SHIFT=4
CONFIG_X86_ALIGNMENT_16=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_MINIMUM_CPU_FAMILY=5
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_CYRIX_32 is not set
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_UMC_32=y
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_CPU_SUP_VORTEX_32=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=64
CONFIG_NR_CPUS_DEFAULT=32
CONFIG_NR_CPUS=32
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
# CONFIG_X86_ANCIENT_MCE is not set
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_LEGACY_VM86=y
CONFIG_VM86=y
CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX32=y
# CONFIG_X86_IOPL_IOPERM is not set
CONFIG_TOSHIBA=m
CONFIG_X86_REBOOTFIXUPS=y
CONFIG_MICROCODE=y
# CONFIG_MICROCODE_INTEL is not set
# CONFIG_MICROCODE_LATE_LOADING is not set
CONFIG_X86_MSR=y
# CONFIG_X86_CPUID is not set
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=y
# CONFIG_VMSPLIT_3G is not set
# CONFIG_VMSPLIT_3G_OPT is not set
CONFIG_VMSPLIT_2G=y
# CONFIG_VMSPLIT_2G_OPT is not set
# CONFIG_VMSPLIT_1G is not set
CONFIG_PAGE_OFFSET=0x80000000
CONFIG_HIGHMEM=y
CONFIG_X86_CPA_STATISTICS=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
# CONFIG_HIGHPTE is not set
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
# CONFIG_MTRR is not set
# CONFIG_X86_UMIP is not set
CONFIG_CC_HAS_IBT=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
CONFIG_DEBUG_HOTPLUG_CPU0=y
# CONFIG_COMPAT_VDSO is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_SUSPEND_SKIP_SYNC=y
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
# CONFIG_PM_WAKELOCKS_GC is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_DPM_WATCHDOG=y
CONFIG_DPM_WATCHDOG_TIMEOUT=120
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
# CONFIG_ACPI_IPMI is not set
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
# CONFIG_ACPI_EXTLOG is not set
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_ACPI_VIOT=y
CONFIG_X86_PM_TIMER=y
# CONFIG_APM is not set

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
# CONFIG_PCI_GOBIOS is not set
CONFIG_PCI_GOMMCONFIG=y
# CONFIG_PCI_GODIRECT is not set
# CONFIG_PCI_GOANY is not set
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
CONFIG_ISA=y
CONFIG_SCx200=y
CONFIG_SCx200HR_TIMER=m
# CONFIG_OLPC is not set
# CONFIG_ALIX is not set
CONFIG_NET5501=y
# CONFIG_GEOS is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_COMPAT_32=y
# end of Binary Emulations

CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_DIRTY_RING_TSO=y
CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_WERROR=y
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
CONFIG_KVM_SMM=y
CONFIG_KVM_XEN=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SPLIT_ARG64=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
CONFIG_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# CONFIG_GCC_PLUGINS is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_TRIM_UNUSED_KSYMS=y
CONFIG_UNUSED_KSYMS_WHITELIST=""
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=7
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
# CONFIG_ZONE_DMA is not set
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_KMAP_LOCAL=y
CONFIG_USERFAULTFD=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
# CONFIG_PCIEAER is not set
# CONFIG_PCIEASPM is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=m
# CONFIG_PCI_PF_STUB is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_PRI is not set
CONFIG_PCI_PASID=y
CONFIG_PCI_LABEL=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
# CONFIG_PCIE_BUS_DEFAULT is not set
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
CONFIG_PCIE_BUS_PEER2PEER=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
CONFIG_PCI_ENDPOINT_CONFIGFS=y
# CONFIG_PCI_EPF_TEST is not set
# CONFIG_PCI_EPF_NTB is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=m
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
CONFIG_RAPIDIO=m
CONFIG_RAPIDIO_TSI721=m
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
# CONFIG_RAPIDIO_DMA_ENGINE is not set
CONFIG_RAPIDIO_DEBUG=y
CONFIG_RAPIDIO_ENUM_BASIC=m
CONFIG_RAPIDIO_CHMAN=m
CONFIG_RAPIDIO_MPORT_CDEV=m

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=m
CONFIG_RAPIDIO_CPS_GEN2=m
CONFIG_RAPIDIO_RXS_GEN3=m
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
# CONFIG_FW_LOADER_COMPRESS_XZ is not set
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
CONFIG_EDD_OFF=y
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
# CONFIG_DMI_SYSFS is not set
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_FW_CFG_SYSFS=m
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_SYSFB_SIMPLEFB is not set
CONFIG_CS_DSP=m
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=m
CONFIG_GNSS_MTK_SERIAL=m
CONFIG_GNSS_SIRF_SERIAL=m
CONFIG_GNSS_UBX_SERIAL=m
# CONFIG_GNSS_USB is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
# CONFIG_PARPORT_PC is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
# CONFIG_ISAPNP is not set
# CONFIG_PNPBIOS is not set
CONFIG_PNPACPI=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=m
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=y
# CONFIG_SENSORS_BH1770 is not set
CONFIG_SENSORS_APDS990X=y
# CONFIG_HMC6352 is not set
CONFIG_DS1682=m
# CONFIG_VMWARE_BALLOON is not set
CONFIG_PCH_PHUB=m
# CONFIG_SRAM is not set
CONFIG_DW_XDATA_PCIE=y
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=m
CONFIG_MISC_RTSX=y
CONFIG_C2PORT=m
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=m
CONFIG_EEPROM_IDT_89HPESX=m
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

CONFIG_CB710_CORE=y
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=y
# CONFIG_INTEL_MEI_ME is not set
CONFIG_INTEL_MEI_TXE=y
CONFIG_VMWARE_VMCI=y
# CONFIG_ECHO is not set
CONFIG_MISC_ALCOR_PCI=y
CONFIG_MISC_RTSX_PCI=y
# CONFIG_MISC_RTSX_USB is not set
CONFIG_HABANA_AI=m
CONFIG_UACCE=y
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
# CONFIG_FIREWIRE_OHCI is not set
# CONFIG_FIREWIRE_NET is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_RIONET is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_3C515 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0_ISA is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2000 is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_ULTRA is not set
# CONFIG_WD80x3 is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_SMC9194 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_MDIO_DEVICE is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_LAN78XX is not set
# CONFIG_USB_USBNET is not set
# CONFIG_USB_IPHETH is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_USB4_NET is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_SPARSEKMAP is not set
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_IQS62X is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_TWL4030 is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CROS_EC is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_PS2_VMMOUSE is not set
CONFIG_MOUSE_PS2_SMBUS=y
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_CYAPA is not set
# CONFIG_MOUSE_ELAN_I2C is not set
# CONFIG_MOUSE_INPORT is not set
# CONFIG_MOUSE_LOGIBM is not set
# CONFIG_MOUSE_PC110PAD is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_MOUSE_GPIO is not set
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=m
CONFIG_SERIO_CT82C710=m
CONFIG_SERIO_PARKBD=m
CONFIG_SERIO_PCIPS2=m
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=m
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=m
CONFIG_GAMEPORT=m
CONFIG_GAMEPORT_NS558=m
CONFIG_GAMEPORT_L4=m
# CONFIG_GAMEPORT_EMU10K1 is not set
CONFIG_GAMEPORT_FM801=m
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX=y
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
CONFIG_SERIAL_TIMBERDALE=y
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
CONFIG_SERIAL_PCH_UART=y
CONFIG_SERIAL_PCH_UART_CONSOLE=y
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=m
CONFIG_SERIAL_RP2_NR_UARTS=32
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_FSL_LINFLEXUART=y
CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE=y
CONFIG_SERIAL_MEN_Z135=m
CONFIG_SERIAL_SPRD=m
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_MOXA_INTELLIO=y
CONFIG_MOXA_SMARTIO=m
CONFIG_SYNCLINK_GT=y
CONFIG_N_HDLC=m
# CONFIG_N_GSM is not set
CONFIG_NOZOMI=y
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_RPMSG_TTY is not set
CONFIG_SERIAL_DEV_BUS=m
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
CONFIG_LP_CONSOLE=y
# CONFIG_PPDEV is not set
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_IPMB=y
CONFIG_IPMI_WATCHDOG=y
CONFIG_IPMI_POWEROFF=m
CONFIG_IPMB_DEVICE_INTERFACE=m
CONFIG_HW_RANDOM=m
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=m
# CONFIG_HW_RANDOM_GEODE is not set
# CONFIG_HW_RANDOM_VIA is not set
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_XIPHERA=m
# CONFIG_DTLK is not set
CONFIG_APPLICOM=y
# CONFIG_SONYPI is not set
# CONFIG_MWAVE is not set
CONFIG_SCx200_GPIO=m
CONFIG_PC8736x_GPIO=m
CONFIG_NSC_GPIO=m
CONFIG_DEVMEM=y
# CONFIG_NVRAM is not set
# CONFIG_DEVPORT is not set
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=m
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=m
# CONFIG_TCG_TIS is not set
CONFIG_TCG_TIS_I2C=m
CONFIG_TCG_TIS_I2C_CR50=m
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
# CONFIG_TCG_NSC is not set
CONFIG_TCG_ATMEL=m
# CONFIG_TCG_INFINEON is not set
# CONFIG_TCG_CRB is not set
CONFIG_TCG_VTPM_PROXY=m
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TELCLOCK is not set
CONFIG_XILLYBUS_CLASS=m
CONFIG_XILLYBUS=m
CONFIG_XILLYUSB=m
# CONFIG_RANDOM_TRUST_CPU is not set
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
# CONFIG_I2C_MUX is not set
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
# CONFIG_I2C_ALGOPCF is not set
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=y
# CONFIG_I2C_ALI1563 is not set
CONFIG_I2C_ALI15X3=m
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=m
# CONFIG_I2C_ISMT is not set
CONFIG_I2C_PIIX4=y
CONFIG_I2C_NFORCE2=y
CONFIG_I2C_NFORCE2_S4985=y
# CONFIG_I2C_NVIDIA_GPU is not set
CONFIG_I2C_SIS5595=m
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=y

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=m
CONFIG_I2C_DESIGNWARE_SLAVE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
# CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_EG20T=m
# CONFIG_I2C_EMEV2 is not set
CONFIG_I2C_GPIO=y
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
CONFIG_I2C_KEMPLD=m
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
CONFIG_I2C_DLN2=m
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=m
CONFIG_I2C_TAOS_EVM=m
CONFIG_I2C_TINY_USB=m

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_PCA_ISA is not set
CONFIG_I2C_CROS_EC_TUNNEL=m
# CONFIG_SCx200_ACB is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=m
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
# CONFIG_CDNS_I3C_MASTER is not set
CONFIG_DW_I3C_MASTER=y
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=m
# CONFIG_SPI is not set
CONFIG_SPMI=m
CONFIG_SPMI_HISI3670=m
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_CY8C95X0=y
CONFIG_PINCTRL_DA9062=m
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=m
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_GENERIC_PLATFORM=m
# CONFIG_GPIO_ICH is not set
# CONFIG_GPIO_MB86S7X is not set
CONFIG_GPIO_MENZ127=m
# CONFIG_GPIO_SIOX is not set
CONFIG_GPIO_STA2X11=y
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_I8255=y
CONFIG_GPIO_104_DIO_48E=y
CONFIG_GPIO_104_IDIO_16=y
# CONFIG_GPIO_104_IDI_48 is not set
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_GPIO_MM=y
CONFIG_GPIO_IT87=y
# CONFIG_GPIO_SCH is not set
CONFIG_GPIO_SCH311X=y
CONFIG_GPIO_WINBOND=m
CONFIG_GPIO_WS16C48=m
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_MAX7300=m
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=y
CONFIG_GPIO_PCF857X=m
CONFIG_GPIO_TPIC2810=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_BD9571MWV=m
# CONFIG_GPIO_DLN2 is not set
CONFIG_GPIO_KEMPLD=m
# CONFIG_GPIO_LP3943 is not set
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_PALMAS=y
# CONFIG_GPIO_TIMBERDALE is not set
CONFIG_GPIO_TPS65086=m
# CONFIG_GPIO_TPS6586X is not set
# CONFIG_GPIO_TQMX86 is not set
# CONFIG_GPIO_TWL4030 is not set
CONFIG_GPIO_TWL6040=m
CONFIG_GPIO_UCB1400=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=m
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
CONFIG_GPIO_PCI_IDIO_16=y
CONFIG_GPIO_PCIE_IDIO_24=y
CONFIG_GPIO_RDC321X=y
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=m
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=m
# CONFIG_W1_MASTER_DS2490 is not set
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=y
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=y
# CONFIG_W1_SLAVE_DS2406 is not set
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=y
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_ATC260X=y
CONFIG_POWER_RESET_MT6323=y
CONFIG_POWER_RESET_RESTART=y
# CONFIG_POWER_RESET_TPS65086 is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_PDA_POWER=m
# CONFIG_GENERIC_ADC_BATTERY is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_MAX8925_POWER is not set
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=m
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=m
CONFIG_BATTERY_DS2780=m
CONFIG_BATTERY_DS2781=m
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_DA9150 is not set
CONFIG_AXP20X_POWER=m
# CONFIG_AXP288_FUEL_GAUGE is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1721X is not set
# CONFIG_BATTERY_TWL4030_MADC is not set
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_BATTERY_RX51=m
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_TWL4030=m
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_LT3651=m
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX14577=m
CONFIG_CHARGER_MAX77976=m
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ2515X=m
CONFIG_CHARGER_BQ25890=m
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=m
# CONFIG_CHARGER_TPS65090 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=m
# CONFIG_CHARGER_CROS_PCHG is not set
CONFIG_CHARGER_BD99954=m
CONFIG_BATTERY_UG3105=y
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
# CONFIG_SENSORS_ABITUGURU3 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7410=m
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=m
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
# CONFIG_SENSORS_APPLESMC is not set
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DELL_SMM=m
# CONFIG_I8K is not set
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_MC13783_ADC=m
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_FTSTEUTATES=m
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_IIO_HWMON=m
# CONFIG_SENSORS_I5500 is not set
# CONFIG_SENSORS_CORETEMP is not set
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
CONFIG_SENSORS_LTC2945=m
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX127=m
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=m
# CONFIG_SENSORS_MAX1668 is not set
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31730=m
# CONFIG_SENSORS_MAX31760 is not set
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=m
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
CONFIG_SENSORS_TC654=m
# CONFIG_SENSORS_TPS23861 is not set
CONFIG_SENSORS_MENF21BMC_HWMON=m
CONFIG_SENSORS_MR75203=m
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
# CONFIG_SENSORS_LM78 is not set
# CONFIG_SENSORS_LM80 is not set
# CONFIG_SENSORS_LM83 is not set
# CONFIG_SENSORS_LM85 is not set
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=m
# CONFIG_SENSORS_LM92 is not set
CONFIG_SENSORS_LM93=m
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NCT7904=m
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
CONFIG_SENSORS_PCF8591=m
# CONFIG_SENSORS_PECI_CPUTEMP is not set
CONFIG_SENSORS_PECI_DIMMTEMP=m
CONFIG_SENSORS_PECI=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1266=m
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
CONFIG_SENSORS_BPA_RS600=m
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
CONFIG_SENSORS_FSP_3Y=m
CONFIG_SENSORS_IBM_CFFPS=m
CONFIG_SENSORS_DPS920AB=m
CONFIG_SENSORS_INSPUR_IPSPS=m
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
CONFIG_SENSORS_IR38064=m
CONFIG_SENSORS_IRPS5401=m
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LT7182S=m
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
CONFIG_SENSORS_MAX16601=m
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
# CONFIG_SENSORS_MAX8688 is not set
CONFIG_SENSORS_MP2888=m
CONFIG_SENSORS_MP2975=m
# CONFIG_SENSORS_MP5023 is not set
CONFIG_SENSORS_PIM4328=m
CONFIG_SENSORS_PLI1209BC=m
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
CONFIG_SENSORS_STPDDC60=m
CONFIG_SENSORS_TPS40422=m
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_TPS546D24=m
# CONFIG_SENSORS_UCD9000 is not set
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_XDPE152=m
CONFIG_SENSORS_XDPE122=m
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=m
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=m
CONFIG_SENSORS_SHT4x=m
CONFIG_SENSORS_SHTC1=m
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_SY7636A is not set
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
# CONFIG_SENSORS_EMC2305 is not set
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA238=m
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
# CONFIG_SENSORS_TMP102 is not set
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=m
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_TMP464=m
CONFIG_SENSORS_TMP513=m
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_GOV_STEP_WISE is not set
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_DEVFREQ_THERMAL=y
CONFIG_THERMAL_EMULATION=y

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
CONFIG_INTEL_TCC_COOLING=y
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_GENERIC_ADC_THERMAL=m
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
CONFIG_DA9063_WATCHDOG=m
# CONFIG_DA9062_WATCHDOG is not set
CONFIG_MENF21BMC_WATCHDOG=m
CONFIG_MENZ069_WATCHDOG=m
# CONFIG_WDAT_WDT is not set
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=m
CONFIG_MLX_WDT=y
# CONFIG_CADENCE_WATCHDOG is not set
CONFIG_DW_WATCHDOG=y
CONFIG_TWL4030_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_RETU_WATCHDOG=m
CONFIG_ACQUIRE_WDT=y
CONFIG_ADVANTECH_WDT=m
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
CONFIG_EBC_C384_WDT=m
CONFIG_EXAR_WDT=m
# CONFIG_F71808E_WDT is not set
# CONFIG_SP5100_TCO is not set
# CONFIG_SBC_FITPC2_WATCHDOG is not set
# CONFIG_EUROTECH_WDT is not set
# CONFIG_IB700_WDT is not set
# CONFIG_IBMASR is not set
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=m
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=y
CONFIG_IT87_WDT=y
CONFIG_HP_WATCHDOG=y
CONFIG_HPWDT_NMI_DECODING=y
CONFIG_KEMPLD_WDT=m
# CONFIG_SC1200_WDT is not set
CONFIG_SCx200_WDT=y
CONFIG_PC87413_WDT=m
CONFIG_NV_TCO=y
# CONFIG_60XX_WDT is not set
CONFIG_SBC8360_WDT=m
CONFIG_SBC7240_WDT=y
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
CONFIG_SMSC37B787_WDT=y
# CONFIG_TQMX86_WDT is not set
# CONFIG_VIA_WDT is not set
# CONFIG_W83627HF_WDT is not set
CONFIG_W83877F_WDT=y
# CONFIG_W83977F_WDT is not set
CONFIG_MACHZ_WDT=y
CONFIG_SBC_EPX_C3_WATCHDOG=y
# CONFIG_INTEL_MEI_WDT is not set
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
CONFIG_MEN_A21_WDT=y

#
# ISA-based Watchdog Cards
#
CONFIG_PCWATCHDOG=y
# CONFIG_MIXCOMWD is not set
# CONFIG_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=y
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
CONFIG_BCMA_HOST_SOC=y
# CONFIG_BCMA_DRIVER_PCI is not set
CONFIG_BCMA_SFLASH=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_CS5535 is not set
CONFIG_MFD_AS3711=y
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=m
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CROS_EC_DEV=m
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
CONFIG_MFD_CS47L15=y
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
CONFIG_MFD_CS47L92=y
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=m
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=m
CONFIG_MFD_DLN2=m
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
CONFIG_HTC_PASIC3=y
CONFIG_HTC_I2CPLD=y
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=y
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=m
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
CONFIG_MFD_INTEL_LPSS_PCI=m
CONFIG_MFD_IQS62X=y
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=m
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=m
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=m
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=m
CONFIG_MFD_MENF21BMC=m
# CONFIG_MFD_VIPERBOARD is not set
CONFIG_MFD_RETU=m
CONFIG_MFD_PCF50633=m
CONFIG_PCF50633_ADC=m
CONFIG_PCF50633_GPIO=m
CONFIG_UCB1400_CORE=m
CONFIG_MFD_SY7636A=m
CONFIG_MFD_RDC321X=y
CONFIG_MFD_RT4831=m
CONFIG_MFD_RT5033=y
CONFIG_MFD_RT5120=m
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=m
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
CONFIG_MFD_SKY81452=y
CONFIG_MFD_STA2X11=y
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=m
CONFIG_MFD_TPS65090=y
# CONFIG_MFD_TI_LP873X is not set
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_TWL4030_CORE=y
# CONFIG_MFD_TWL4030_AUDIO is not set
CONFIG_TWL6040_CORE=y
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=y
CONFIG_MFD_TIMBERDALE=m
CONFIG_MFD_TQMX86=m
CONFIG_MFD_VX855=m
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
# CONFIG_MFD_CS47L24 is not set
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
CONFIG_MFD_WCD934X=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
# CONFIG_RAVE_SP_CORE is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=m

#
# CEC support
#
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
# CONFIG_CEC_CROS_EC is not set
# CONFIG_CEC_SECO is not set
CONFIG_USB_PULSE8_CEC=m
CONFIG_USB_RAINSHADOW_CEC=m
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_AGP is not set
# CONFIG_VGA_SWITCHEROO is not set
# CONFIG_DRM is not set
CONFIG_DRM_DEBUG_MODESET_LOCK=y

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=m
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=m
CONFIG_FB_SVGALIB=m
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
CONFIG_FB_PM2=m
# CONFIG_FB_PM2_FIFO_DISCONNECT is not set
CONFIG_FB_CYBER2000=m
CONFIG_FB_CYBER2000_DDC=y
# CONFIG_FB_ARC is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_N411=m
CONFIG_FB_HGA=m
CONFIG_FB_OPENCORES=m
# CONFIG_FB_S1D13XXX is not set
CONFIG_FB_NVIDIA=m
# CONFIG_FB_NVIDIA_I2C is not set
# CONFIG_FB_NVIDIA_DEBUG is not set
# CONFIG_FB_NVIDIA_BACKLIGHT is not set
CONFIG_FB_RIVA=m
CONFIG_FB_RIVA_I2C=y
CONFIG_FB_RIVA_DEBUG=y
CONFIG_FB_RIVA_BACKLIGHT=y
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
CONFIG_FB_MATROX=m
CONFIG_FB_MATROX_MILLENIUM=y
CONFIG_FB_MATROX_MYSTIQUE=y
# CONFIG_FB_MATROX_G is not set
# CONFIG_FB_MATROX_I2C is not set
# CONFIG_FB_RADEON is not set
CONFIG_FB_ATY128=m
CONFIG_FB_ATY128_BACKLIGHT=y
CONFIG_FB_ATY=m
# CONFIG_FB_ATY_CT is not set
# CONFIG_FB_ATY_GX is not set
# CONFIG_FB_ATY_BACKLIGHT is not set
# CONFIG_FB_S3 is not set
CONFIG_FB_SAVAGE=m
# CONFIG_FB_SAVAGE_I2C is not set
# CONFIG_FB_SAVAGE_ACCEL is not set
CONFIG_FB_SIS=m
CONFIG_FB_SIS_300=y
# CONFIG_FB_SIS_315 is not set
CONFIG_FB_VIA=m
# CONFIG_FB_VIA_DIRECT_PROCFS is not set
CONFIG_FB_VIA_X_COMPATIBILITY=y
CONFIG_FB_NEOMAGIC=m
# CONFIG_FB_KYRO is not set
CONFIG_FB_3DFX=m
CONFIG_FB_3DFX_ACCEL=y
CONFIG_FB_3DFX_I2C=y
# CONFIG_FB_VOODOO1 is not set
CONFIG_FB_VT8623=m
# CONFIG_FB_TRIDENT is not set
CONFIG_FB_ARK=m
# CONFIG_FB_PM3 is not set
CONFIG_FB_CARMINE=m
CONFIG_FB_CARMINE_DRAM_EVAL=y
# CONFIG_CARMINE_DRAM_CUSTOM is not set
CONFIG_FB_GEODE=y
CONFIG_FB_GEODE_LX=m
CONFIG_FB_GEODE_GX=m
CONFIG_FB_GEODE_GX1=m
CONFIG_FB_SM501=m
CONFIG_FB_SMSCUFX=m
CONFIG_FB_UDL=m
CONFIG_FB_IBM_GXT4500=m
CONFIG_FB_VIRTUAL=m
CONFIG_FB_METRONOME=m
CONFIG_FB_MB862XX=m
CONFIG_FB_MB862XX_PCI_GDC=y
# CONFIG_FB_MB862XX_I2C is not set
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=m
CONFIG_FB_SM712=m
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_PLATFORM is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=m
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_LM3533=m
CONFIG_BACKLIGHT_PWM=m
CONFIG_BACKLIGHT_MAX8925=m
# CONFIG_BACKLIGHT_MT6370 is not set
# CONFIG_BACKLIGHT_APPLE is not set
# CONFIG_BACKLIGHT_QCOM_WLED is not set
CONFIG_BACKLIGHT_RT4831=m
CONFIG_BACKLIGHT_SAHARA=m
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=m
# CONFIG_BACKLIGHT_PCF50633 is not set
CONFIG_BACKLIGHT_AAT2870=m
CONFIG_BACKLIGHT_LM3630A=m
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_PANDORA=m
CONFIG_BACKLIGHT_SKY81452=m
CONFIG_BACKLIGHT_AS3711=m
CONFIG_BACKLIGHT_GPIO=m
CONFIG_BACKLIGHT_LV5207LP=m
CONFIG_BACKLIGHT_BD6107=m
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_VGASTATE=m
CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
CONFIG_LOGO_LINUX_VGA16=y
# CONFIG_LOGO_LINUX_CLUT224 is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_DMAENGINE_PCM=m
CONFIG_SND_HWDEP=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=m
# CONFIG_SND_PCM_OSS is not set
CONFIG_SND_PCM_TIMER=y
# CONFIG_SND_HRTIMER is not set
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_CTL_FAST_LOOKUP is not set
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
# CONFIG_SND_PCM_XRUN_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
# CONFIG_SND_CTL_DEBUG is not set
CONFIG_SND_JACK_INJECTION_DEBUG=y
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_CTL_LED=m
# CONFIG_SND_SEQUENCER is not set
CONFIG_SND_MPU401_UART=m
CONFIG_SND_OPL3_LIB=m
CONFIG_SND_VX_LIB=m
CONFIG_SND_AC97_CODEC=m
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_SB_COMMON=m
CONFIG_SND_SB16_DSP=m
# CONFIG_SND_ISA is not set
CONFIG_SND_PCI=y
# CONFIG_SND_AD1889 is not set
# CONFIG_SND_ALS4000 is not set
CONFIG_SND_ASIHPI=m
CONFIG_SND_ATIIXP=m
# CONFIG_SND_ATIIXP_MODEM is not set
CONFIG_SND_AU8810=m
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
CONFIG_SND_BT87X=m
# CONFIG_SND_BT87X_OVERCLOCK is not set
# CONFIG_SND_CA0106 is not set
CONFIG_SND_CMIPCI=m
CONFIG_SND_OXYGEN_LIB=m
CONFIG_SND_OXYGEN=m
CONFIG_SND_CS4281=m
# CONFIG_SND_CS46XX is not set
CONFIG_SND_CS5530=m
CONFIG_SND_CS5535AUDIO=m
CONFIG_SND_CTXFI=m
CONFIG_SND_DARLA20=m
CONFIG_SND_GINA20=m
CONFIG_SND_LAYLA20=m
CONFIG_SND_DARLA24=m
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
CONFIG_SND_MONA=m
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
CONFIG_SND_INDIGO=m
CONFIG_SND_INDIGOIO=m
# CONFIG_SND_INDIGODJ is not set
CONFIG_SND_INDIGOIOX=m
CONFIG_SND_INDIGODJX=m
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_FM801 is not set
CONFIG_SND_HDSP=m
# CONFIG_SND_HDSPM is not set
CONFIG_SND_ICE1724=m
# CONFIG_SND_INTEL8X0 is not set
# CONFIG_SND_INTEL8X0M is not set
CONFIG_SND_KORG1212=m
CONFIG_SND_LOLA=m
# CONFIG_SND_LX6464ES is not set
CONFIG_SND_MIXART=m
CONFIG_SND_NM256=m
CONFIG_SND_PCXHR=m
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
CONFIG_SND_RME96=m
CONFIG_SND_RME9652=m
CONFIG_SND_VIA82XX=m
CONFIG_SND_VIA82XX_MODEM=m
# CONFIG_SND_VIRTUOSO is not set
CONFIG_SND_VX222=m
CONFIG_SND_YMFPCI=m

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_GENERIC_LEDS=y
CONFIG_SND_HDA_INTEL=m
CONFIG_SND_HDA_HWDEP=y
CONFIG_SND_HDA_RECONFIG=y
# CONFIG_SND_HDA_INPUT_BEEP is not set
# CONFIG_SND_HDA_PATCH_LOADER is not set
# CONFIG_SND_HDA_SCODEC_CS35L41_I2C is not set
CONFIG_SND_HDA_CODEC_REALTEK=m
CONFIG_SND_HDA_CODEC_ANALOG=m
CONFIG_SND_HDA_CODEC_SIGMATEL=m
CONFIG_SND_HDA_CODEC_VIA=m
CONFIG_SND_HDA_CODEC_HDMI=m
# CONFIG_SND_HDA_CODEC_CIRRUS is not set
CONFIG_SND_HDA_CODEC_CS8409=m
# CONFIG_SND_HDA_CODEC_CONEXANT is not set
# CONFIG_SND_HDA_CODEC_CA0110 is not set
CONFIG_SND_HDA_CODEC_CA0132=m
# CONFIG_SND_HDA_CODEC_CA0132_DSP is not set
CONFIG_SND_HDA_CODEC_CMEDIA=m
# CONFIG_SND_HDA_CODEC_SI3054 is not set
CONFIG_SND_HDA_GENERIC=m
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
# CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM is not set
# end of HD-Audio

CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_EXT_CORE=m
CONFIG_SND_HDA_PREALLOC_SIZE=0
CONFIG_SND_INTEL_NHLT=y
CONFIG_SND_INTEL_DSP_CONFIG=m
CONFIG_SND_INTEL_SOUNDWIRE_ACPI=m
# CONFIG_SND_USB is not set
# CONFIG_SND_FIREWIRE is not set
CONFIG_SND_SOC=m
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
# CONFIG_SND_SOC_ADI is not set
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_SOC_AMD_RENOIR is not set
# CONFIG_SND_SOC_AMD_ACP5x is not set
# CONFIG_SND_SOC_AMD_ACP6x is not set
# CONFIG_SND_AMD_ACP_CONFIG is not set
# CONFIG_SND_SOC_AMD_ACP_COMMON is not set
# CONFIG_SND_SOC_AMD_RPL_ACP6x is not set
# CONFIG_SND_SOC_AMD_PS is not set
CONFIG_SND_ATMEL_SOC=m
CONFIG_SND_BCM63XX_I2S_WHISTLER=m
CONFIG_SND_DESIGNWARE_I2S=m
# CONFIG_SND_DESIGNWARE_PCM is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
# CONFIG_SND_SOC_FSL_SAI is not set
CONFIG_SND_SOC_FSL_AUDMIX=m
CONFIG_SND_SOC_FSL_SSI=m
# CONFIG_SND_SOC_FSL_SPDIF is not set
CONFIG_SND_SOC_FSL_ESAI=m
# CONFIG_SND_SOC_FSL_MICFIL is not set
CONFIG_SND_SOC_FSL_XCVR=m
CONFIG_SND_SOC_FSL_RPMSG=m
CONFIG_SND_SOC_IMX_AUDMUX=m
# end of SoC Audio for Freescale CPUs

CONFIG_SND_I2S_HI6210_I2S=m
# CONFIG_SND_SOC_IMG is not set
# CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
# CONFIG_SND_SOC_INTEL_AVS is not set
CONFIG_SND_SOC_MTK_BTCVSD=m
# CONFIG_SND_SOC_SOF_TOPLEVEL is not set

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

# CONFIG_SND_SOC_XILINX_I2S is not set
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
# CONFIG_SND_SOC_XILINX_SPDIF is not set
# CONFIG_SND_SOC_XTFPGA_I2S is not set
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
CONFIG_SND_SOC_WM_ADSP=m
CONFIG_SND_SOC_AC97_CODEC=m
CONFIG_SND_SOC_ADAU_UTILS=m
CONFIG_SND_SOC_ADAU1372=m
CONFIG_SND_SOC_ADAU1372_I2C=m
CONFIG_SND_SOC_ADAU1701=m
# CONFIG_SND_SOC_ADAU1761_I2C is not set
# CONFIG_SND_SOC_ADAU7002 is not set
# CONFIG_SND_SOC_ADAU7118_HW is not set
# CONFIG_SND_SOC_ADAU7118_I2C is not set
CONFIG_SND_SOC_AK4118=m
CONFIG_SND_SOC_AK4375=m
CONFIG_SND_SOC_AK4458=m
CONFIG_SND_SOC_AK4554=m
CONFIG_SND_SOC_AK4613=m
# CONFIG_SND_SOC_AK4642 is not set
CONFIG_SND_SOC_AK5386=m
# CONFIG_SND_SOC_AK5558 is not set
CONFIG_SND_SOC_ALC5623=m
CONFIG_SND_SOC_AW8738=m
CONFIG_SND_SOC_BD28623=m
CONFIG_SND_SOC_BT_SCO=m
# CONFIG_SND_SOC_CROS_EC_CODEC is not set
# CONFIG_SND_SOC_CS35L32 is not set
CONFIG_SND_SOC_CS35L33=m
# CONFIG_SND_SOC_CS35L34 is not set
# CONFIG_SND_SOC_CS35L35 is not set
CONFIG_SND_SOC_CS35L36=m
CONFIG_SND_SOC_CS35L41_LIB=m
CONFIG_SND_SOC_CS35L41=m
CONFIG_SND_SOC_CS35L41_I2C=m
CONFIG_SND_SOC_CS35L45_TABLES=m
CONFIG_SND_SOC_CS35L45=m
CONFIG_SND_SOC_CS35L45_I2C=m
CONFIG_SND_SOC_CS42L42_CORE=m
# CONFIG_SND_SOC_CS42L42 is not set
CONFIG_SND_SOC_CS42L51=m
CONFIG_SND_SOC_CS42L51_I2C=m
# CONFIG_SND_SOC_CS42L52 is not set
# CONFIG_SND_SOC_CS42L56 is not set
CONFIG_SND_SOC_CS42L73=m
CONFIG_SND_SOC_CS42L83=m
# CONFIG_SND_SOC_CS4234 is not set
# CONFIG_SND_SOC_CS4265 is not set
# CONFIG_SND_SOC_CS4270 is not set
CONFIG_SND_SOC_CS4271=m
CONFIG_SND_SOC_CS4271_I2C=m
CONFIG_SND_SOC_CS42XX8=m
CONFIG_SND_SOC_CS42XX8_I2C=m
# CONFIG_SND_SOC_CS43130 is not set
CONFIG_SND_SOC_CS4341=m
# CONFIG_SND_SOC_CS4349 is not set
CONFIG_SND_SOC_CS53L30=m
CONFIG_SND_SOC_CX2072X=m
# CONFIG_SND_SOC_DA7213 is not set
CONFIG_SND_SOC_DMIC=m
# CONFIG_SND_SOC_ES7134 is not set
CONFIG_SND_SOC_ES7241=m
CONFIG_SND_SOC_ES8316=m
# CONFIG_SND_SOC_ES8326 is not set
CONFIG_SND_SOC_ES8328=m
CONFIG_SND_SOC_ES8328_I2C=m
CONFIG_SND_SOC_GTM601=m
CONFIG_SND_SOC_HDA=m
# CONFIG_SND_SOC_ICS43432 is not set
# CONFIG_SND_SOC_INNO_RK3036 is not set
CONFIG_SND_SOC_MAX98088=m
CONFIG_SND_SOC_MAX98357A=m
CONFIG_SND_SOC_MAX98504=m
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98927=m
CONFIG_SND_SOC_MAX98520=m
CONFIG_SND_SOC_MAX98373=m
CONFIG_SND_SOC_MAX98373_I2C=m
# CONFIG_SND_SOC_MAX98390 is not set
CONFIG_SND_SOC_MAX98396=m
CONFIG_SND_SOC_MAX9860=m
# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
CONFIG_SND_SOC_PCM1681=m
# CONFIG_SND_SOC_PCM1789_I2C is not set
CONFIG_SND_SOC_PCM179X=m
CONFIG_SND_SOC_PCM179X_I2C=m
# CONFIG_SND_SOC_PCM186X_I2C is not set
CONFIG_SND_SOC_PCM3060=m
CONFIG_SND_SOC_PCM3060_I2C=m
CONFIG_SND_SOC_PCM3168A=m
CONFIG_SND_SOC_PCM3168A_I2C=m
# CONFIG_SND_SOC_PCM5102A is not set
CONFIG_SND_SOC_PCM512x=m
CONFIG_SND_SOC_PCM512x_I2C=m
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RT5616=m
CONFIG_SND_SOC_RT5631=m
# CONFIG_SND_SOC_RT5640 is not set
# CONFIG_SND_SOC_RT5659 is not set
CONFIG_SND_SOC_RT9120=m
CONFIG_SND_SOC_SGTL5000=m
CONFIG_SND_SOC_SIGMADSP=m
CONFIG_SND_SOC_SIGMADSP_I2C=m
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
CONFIG_SND_SOC_SIMPLE_MUX=m
CONFIG_SND_SOC_SPDIF=m
CONFIG_SND_SOC_SRC4XXX_I2C=m
CONFIG_SND_SOC_SRC4XXX=m
# CONFIG_SND_SOC_SSM2305 is not set
CONFIG_SND_SOC_SSM2518=m
CONFIG_SND_SOC_SSM2602=m
CONFIG_SND_SOC_SSM2602_I2C=m
CONFIG_SND_SOC_SSM4567=m
# CONFIG_SND_SOC_STA32X is not set
CONFIG_SND_SOC_STA350=m
CONFIG_SND_SOC_STI_SAS=m
CONFIG_SND_SOC_TAS2552=m
# CONFIG_SND_SOC_TAS2562 is not set
CONFIG_SND_SOC_TAS2764=m
CONFIG_SND_SOC_TAS2770=m
CONFIG_SND_SOC_TAS2780=m
CONFIG_SND_SOC_TAS5086=m
CONFIG_SND_SOC_TAS571X=m
# CONFIG_SND_SOC_TAS5720 is not set
CONFIG_SND_SOC_TAS5805M=m
CONFIG_SND_SOC_TAS6424=m
CONFIG_SND_SOC_TDA7419=m
# CONFIG_SND_SOC_TFA9879 is not set
CONFIG_SND_SOC_TFA989X=m
CONFIG_SND_SOC_TLV320ADC3XXX=m
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
CONFIG_SND_SOC_TLV320AIC31XX=m
CONFIG_SND_SOC_TLV320AIC32X4=m
CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
CONFIG_SND_SOC_TLV320AIC3X=m
CONFIG_SND_SOC_TLV320AIC3X_I2C=m
CONFIG_SND_SOC_TLV320ADCX140=m
CONFIG_SND_SOC_TS3A227E=m
# CONFIG_SND_SOC_TSCS42XX is not set
CONFIG_SND_SOC_TSCS454=m
# CONFIG_SND_SOC_UDA1334 is not set
CONFIG_SND_SOC_WCD9335=m
CONFIG_SND_SOC_WCD_MBHC=m
CONFIG_SND_SOC_WCD934X=m
CONFIG_SND_SOC_WM8510=m
# CONFIG_SND_SOC_WM8523 is not set
CONFIG_SND_SOC_WM8524=m
# CONFIG_SND_SOC_WM8580 is not set
# CONFIG_SND_SOC_WM8711 is not set
CONFIG_SND_SOC_WM8728=m
# CONFIG_SND_SOC_WM8731_I2C is not set
# CONFIG_SND_SOC_WM8737 is not set
CONFIG_SND_SOC_WM8741=m
# CONFIG_SND_SOC_WM8750 is not set
CONFIG_SND_SOC_WM8753=m
CONFIG_SND_SOC_WM8776=m
CONFIG_SND_SOC_WM8782=m
# CONFIG_SND_SOC_WM8804_I2C is not set
# CONFIG_SND_SOC_WM8903 is not set
CONFIG_SND_SOC_WM8904=m
CONFIG_SND_SOC_WM8940=m
CONFIG_SND_SOC_WM8960=m
# CONFIG_SND_SOC_WM8962 is not set
CONFIG_SND_SOC_WM8974=m
CONFIG_SND_SOC_WM8978=m
CONFIG_SND_SOC_WM8985=m
# CONFIG_SND_SOC_MAX9759 is not set
# CONFIG_SND_SOC_MT6351 is not set
CONFIG_SND_SOC_MT6358=m
CONFIG_SND_SOC_MT6660=m
# CONFIG_SND_SOC_NAU8315 is not set
# CONFIG_SND_SOC_NAU8540 is not set
CONFIG_SND_SOC_NAU8810=m
CONFIG_SND_SOC_NAU8821=m
CONFIG_SND_SOC_NAU8822=m
CONFIG_SND_SOC_NAU8824=m
# CONFIG_SND_SOC_TPA6130A2 is not set
CONFIG_SND_SOC_LPASS_MACRO_COMMON=m
# CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
CONFIG_SND_SOC_LPASS_VA_MACRO=m
CONFIG_SND_SOC_LPASS_RX_MACRO=m
CONFIG_SND_SOC_LPASS_TX_MACRO=m
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=m
CONFIG_SND_SIMPLE_CARD=m
CONFIG_SND_X86=y
CONFIG_SND_VIRTIO=m
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
# CONFIG_HID_ACCUTOUCH is not set
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_ASUS is not set
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_PRODIKEYS is not set
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
# CONFIG_HID_CYPRESS is not set
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_ELO is not set
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_GOOGLE_HAMMER is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_UCLOGIC is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
# CONFIG_HID_TWINHAN is not set
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_LETSKETCH is not set
# CONFIG_HID_LOGITECH is not set
# CONFIG_HID_MAGICMOUSE is not set
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NINTENDO is not set
# CONFIG_HID_NTI is not set
# CONFIG_HID_NTRIG is not set
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PLAYSTATION is not set
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_TOPRE is not set
# CONFIG_HID_THINGM is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
CONFIG_USB_FEW_INIT_RETRIES=y
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG=y
CONFIG_USB_OTG_PRODUCTLIST=y
CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB=y
# CONFIG_USB_OTG_FSM is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=m
CONFIG_USB_XHCI_DBGCAP=y
CONFIG_USB_XHCI_PCI_RENESAS=m
CONFIG_USB_XHCI_PLATFORM=m
# CONFIG_USB_EHCI_HCD is not set
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=m
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_OHCI_HCD is not set
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_SSB is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
# CONFIG_USB_PRINTER is not set
CONFIG_USB_WDM=m
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
# CONFIG_USBIP_CORE is not set
CONFIG_USB_CDNS_SUPPORT=y
CONFIG_USB_CDNS_HOST=y
CONFIG_USB_CDNS3=m
CONFIG_USB_CDNS3_GADGET=y
CONFIG_USB_CDNS3_HOST=y
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=y
# CONFIG_USB_DWC2_HOST is not set

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_PERIPHERAL=y
# CONFIG_USB_DWC2_DUAL_ROLE is not set
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
# CONFIG_USB_DWC2_DEBUG_PERIODIC is not set
CONFIG_USB_CHIPIDEA=m
# CONFIG_USB_CHIPIDEA_UDC is not set
CONFIG_USB_CHIPIDEA_MSM=m
CONFIG_USB_CHIPIDEA_GENERIC=m
CONFIG_USB_ISP1760=m
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1761_UDC=y
# CONFIG_USB_ISP1760_HOST_ROLE is not set
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
CONFIG_USB_ISP1760_DUAL_ROLE=y

#
# USB port drivers
#
CONFIG_USB_USS720=m
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
CONFIG_USB_EMI26=y
# CONFIG_USB_ADUTUX is not set
CONFIG_USB_SEVSEG=m
# CONFIG_USB_LEGOTOWER is not set
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=y
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
CONFIG_USB_APPLEDISPLAY=m
CONFIG_APPLE_MFI_FASTCHARGE=y
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=m
CONFIG_USB_YUREX=m
CONFIG_USB_EZUSB_FX2=m
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=y
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
CONFIG_USB_CHAOSKEY=m

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_TAHVO_USB=m
# CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
CONFIG_USB_ISP1301=y
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG=y
# CONFIG_USB_GADGET_VERBOSE is not set
# CONFIG_USB_GADGET_DEBUG_FILES is not set
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_U_SERIAL_CONSOLE=y

#
# USB Peripheral Controller
#
CONFIG_USB_FUSB300=y
CONFIG_USB_FOTG210_UDC=m
CONFIG_USB_GR_UDC=m
# CONFIG_USB_R8A66597 is not set
CONFIG_USB_PXA27X=y
CONFIG_USB_MV_UDC=m
# CONFIG_USB_MV_U3D is not set
# CONFIG_USB_M66592 is not set
# CONFIG_USB_BDC_UDC is not set
CONFIG_USB_NET2272=y
CONFIG_USB_NET2272_DMA=y
# CONFIG_USB_DUMMY_HCD is not set
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=m
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_AUDIO=m
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
CONFIG_USB_F_FS=m
CONFIG_USB_F_UAC2=m
CONFIG_USB_F_MIDI=m
CONFIG_USB_F_HID=m
CONFIG_USB_F_PRINTER=m
CONFIG_USB_CONFIGFS=m
# CONFIG_USB_CONFIGFS_SERIAL is not set
CONFIG_USB_CONFIGFS_ACM=y
# CONFIG_USB_CONFIGFS_OBEX is not set
# CONFIG_USB_CONFIGFS_NCM is not set
# CONFIG_USB_CONFIGFS_ECM is not set
# CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
# CONFIG_USB_CONFIGFS_RNDIS is not set
# CONFIG_USB_CONFIGFS_EEM is not set
CONFIG_USB_CONFIGFS_F_LB_SS=y
CONFIG_USB_CONFIGFS_F_FS=y
# CONFIG_USB_CONFIGFS_F_UAC1 is not set
# CONFIG_USB_CONFIGFS_F_UAC1_LEGACY is not set
CONFIG_USB_CONFIGFS_F_UAC2=y
# CONFIG_USB_CONFIGFS_F_MIDI is not set
# CONFIG_USB_CONFIGFS_F_HID is not set
CONFIG_USB_CONFIGFS_F_PRINTER=y

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=m
# CONFIG_USB_ZERO_HNPTEST is not set
# CONFIG_USB_AUDIO is not set
# CONFIG_USB_ETH is not set
# CONFIG_USB_G_NCM is not set
# CONFIG_USB_GADGETFS is not set
# CONFIG_USB_FUNCTIONFS is not set
CONFIG_USB_G_SERIAL=y
CONFIG_USB_MIDI_GADGET=m
CONFIG_USB_G_PRINTER=m
# CONFIG_USB_CDC_COMPOSITE is not set
CONFIG_USB_G_HID=m
CONFIG_USB_G_DBGP=y
# CONFIG_USB_G_DBGP_PRINTK is not set
CONFIG_USB_G_DBGP_SERIAL=y
CONFIG_USB_RAW_GADGET=y
# end of USB Gadget precomposed configurations

CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=m
CONFIG_UCSI_CCG=m
# CONFIG_UCSI_ACPI is not set
CONFIG_UCSI_STM32G0=m
CONFIG_TYPEC_TPS6598X=y
CONFIG_TYPEC_ANX7411=m
CONFIG_TYPEC_RT1719=y
# CONFIG_TYPEC_HD3SS3220 is not set
# CONFIG_TYPEC_STUSB160X is not set
CONFIG_TYPEC_WUSB3801=m

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_FSA4480=m
CONFIG_TYPEC_MUX_PI3USB30532=m
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
# CONFIG_USB_ROLES_INTEL_XHCI is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
CONFIG_MEMSTICK_JMICRON_38X=m
CONFIG_MEMSTICK_R592=m
CONFIG_MEMSTICK_REALTEK_PCI=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=m
CONFIG_LEDS_CLASS_FLASH=m
CONFIG_LEDS_CLASS_MULTICOLOR=m
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_APU=m
# CONFIG_LEDS_LM3530 is not set
CONFIG_LEDS_LM3532=m
CONFIG_LEDS_LM3533=m
# CONFIG_LEDS_LM3642 is not set
CONFIG_LEDS_MT6323=m
CONFIG_LEDS_NET48XX=m
# CONFIG_LEDS_WRAP is not set
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=m
# CONFIG_LEDS_LP3944 is not set
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_PCA955X=m
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=m
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_BD2802=m
CONFIG_LEDS_INTEL_SS4200=m
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_MC13783=m
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=m
# CONFIG_LEDS_MAX8997 is not set
CONFIG_LEDS_LM355x=m
CONFIG_LEDS_OT200=m
CONFIG_LEDS_MENF21BMC=m
CONFIG_LEDS_IS31FL319X=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
# CONFIG_LEDS_MLXCPLD is not set
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
# CONFIG_LEDS_NIC78BX is not set
CONFIG_LEDS_TI_LMU_COMMON=m

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AS3645A is not set
CONFIG_LEDS_LM3601X=m
# CONFIG_LEDS_RT8515 is not set
CONFIG_LEDS_SGM3140=m

#
# RGB LED drivers
#
# CONFIG_LEDS_PWM_MULTICOLOR is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
CONFIG_LEDS_TRIGGER_CAMERA=m
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_NETDEV is not set
CONFIG_LEDS_TRIGGER_PATTERN=m
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=m

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y

#
# Speakup console speech
#
# end of Speakup console speech

# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
# CONFIG_EDAC_LEGACY_SYSFS is not set
CONFIG_EDAC_DEBUG=y
# CONFIG_EDAC_AMD76X is not set
CONFIG_EDAC_E7XXX=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82875P=m
CONFIG_EDAC_I82975X=y
# CONFIG_EDAC_I3000 is not set
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=y
# CONFIG_EDAC_X38 is not set
CONFIG_EDAC_I5400=y
CONFIG_EDAC_I7CORE=y
CONFIG_EDAC_I82860=y
CONFIG_EDAC_R82600=m
CONFIG_EDAC_I5000=m
# CONFIG_EDAC_I5100 is not set
CONFIG_EDAC_I7300=m
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
CONFIG_ALTERA_MSGDMA=m
CONFIG_INTEL_IDMA64=m
CONFIG_PCH_DMA=y
CONFIG_PLX_DMA=y
CONFIG_TIMB_DMA=m
# CONFIG_QCOM_HIDMA_MGMT is not set
CONFIG_QCOM_HIDMA=y
CONFIG_DW_DMAC_CORE=y
# CONFIG_DW_DMAC is not set
CONFIG_DW_DMAC_PCI=y
CONFIG_HSU_DMA=y
CONFIG_SF_PDMA=y
CONFIG_INTEL_LDMA=y

#
# DMA Clients
#
# CONFIG_ASYNC_TX_DMA is not set
# CONFIG_DMATEST is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
CONFIG_DMABUF_HEAPS_SYSTEM=y
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_HD44780_COMMON=m
# CONFIG_HD44780 is not set
# CONFIG_IMG_ASCII_LCD is not set
# CONFIG_HT16K33 is not set
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=m
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=m
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
# CONFIG_UIO_PCI_GENERIC is not set
CONFIG_UIO_NETX=m
CONFIG_UIO_PRUSS=m
CONFIG_UIO_MF624=m
# CONFIG_VFIO is not set
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_NET is not set
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
CONFIG_COMEDI_PCI_DRIVERS=m
CONFIG_COMEDI_8255_PCI=m
CONFIG_COMEDI_ADDI_WATCHDOG=m
CONFIG_COMEDI_ADDI_APCI_1032=m
CONFIG_COMEDI_ADDI_APCI_1500=m
# CONFIG_COMEDI_ADDI_APCI_1516 is not set
# CONFIG_COMEDI_ADDI_APCI_1564 is not set
CONFIG_COMEDI_ADDI_APCI_16XX=m
CONFIG_COMEDI_ADDI_APCI_2032=m
CONFIG_COMEDI_ADDI_APCI_2200=m
CONFIG_COMEDI_ADDI_APCI_3120=m
CONFIG_COMEDI_ADDI_APCI_3501=m
# CONFIG_COMEDI_ADDI_APCI_3XXX is not set
# CONFIG_COMEDI_ADL_PCI6208 is not set
# CONFIG_COMEDI_ADL_PCI7X3X is not set
CONFIG_COMEDI_ADL_PCI8164=m
CONFIG_COMEDI_ADL_PCI9111=m
CONFIG_COMEDI_ADL_PCI9118=m
CONFIG_COMEDI_ADV_PCI1710=m
CONFIG_COMEDI_ADV_PCI1720=m
# CONFIG_COMEDI_ADV_PCI1723 is not set
CONFIG_COMEDI_ADV_PCI1724=m
CONFIG_COMEDI_ADV_PCI1760=m
CONFIG_COMEDI_ADV_PCI_DIO=m
CONFIG_COMEDI_AMPLC_DIO200_PCI=m
CONFIG_COMEDI_AMPLC_PC236_PCI=m
# CONFIG_COMEDI_AMPLC_PC263_PCI is not set
CONFIG_COMEDI_AMPLC_PCI224=m
CONFIG_COMEDI_AMPLC_PCI230=m
# CONFIG_COMEDI_CONTEC_PCI_DIO is not set
# CONFIG_COMEDI_DAS08_PCI is not set
CONFIG_COMEDI_DT3000=m
# CONFIG_COMEDI_DYNA_PCI10XX is not set
CONFIG_COMEDI_GSC_HPDI=m
# CONFIG_COMEDI_MF6X4 is not set
CONFIG_COMEDI_ICP_MULTI=m
# CONFIG_COMEDI_DAQBOARD2000 is not set
CONFIG_COMEDI_JR3_PCI=m
CONFIG_COMEDI_KE_COUNTER=m
# CONFIG_COMEDI_CB_PCIDAS64 is not set
CONFIG_COMEDI_CB_PCIDAS=m
CONFIG_COMEDI_CB_PCIDDA=m
# CONFIG_COMEDI_CB_PCIMDAS is not set
# CONFIG_COMEDI_CB_PCIMDDA is not set
CONFIG_COMEDI_ME4000=m
CONFIG_COMEDI_ME_DAQ=m
# CONFIG_COMEDI_NI_6527 is not set
CONFIG_COMEDI_NI_65XX=m
# CONFIG_COMEDI_NI_660X is not set
CONFIG_COMEDI_NI_670X=m
CONFIG_COMEDI_NI_LABPC_PCI=m
# CONFIG_COMEDI_NI_PCIDIO is not set
CONFIG_COMEDI_NI_PCIMIO=m
CONFIG_COMEDI_RTD520=m
CONFIG_COMEDI_S626=m
CONFIG_COMEDI_MITE=m
CONFIG_COMEDI_NI_TIOCMD=m
CONFIG_COMEDI_USB_DRIVERS=m
# CONFIG_COMEDI_DT9812 is not set
CONFIG_COMEDI_NI_USB6501=m
# CONFIG_COMEDI_USBDUX is not set
# CONFIG_COMEDI_USBDUXFAST is not set
CONFIG_COMEDI_USBDUXSIGMA=m
CONFIG_COMEDI_VMK80XX=m
CONFIG_COMEDI_8254=m
CONFIG_COMEDI_8255=m
CONFIG_COMEDI_8255_SA=m
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_AMPLC_DIO200=m
CONFIG_COMEDI_AMPLC_PC236=m
CONFIG_COMEDI_NI_LABPC=m
CONFIG_COMEDI_NI_TIO=m
CONFIG_COMEDI_NI_ROUTING=m
# CONFIG_COMEDI_TESTS is not set
# CONFIG_STAGING is not set
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CHROMEOS_ACPI is not set
CONFIG_CHROMEOS_LAPTOP=y
CONFIG_CHROMEOS_PSTORE=m
# CONFIG_CHROMEOS_TBMC is not set
CONFIG_CROS_EC=y
# CONFIG_CROS_EC_I2C is not set
# CONFIG_CROS_EC_LPC is not set
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_KBD_LED_BACKLIGHT=m
CONFIG_CROS_EC_CHARDEV=m
# CONFIG_CROS_EC_LIGHTBAR is not set
CONFIG_CROS_EC_DEBUGFS=m
CONFIG_CROS_EC_SENSORHUB=m
CONFIG_CROS_EC_SYSFS=m
# CONFIG_CROS_USBPD_NOTIFY is not set
CONFIG_CROS_TYPEC_SWITCH=m
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
CONFIG_MLXREG_IO=m
CONFIG_MLXREG_LC=m
# CONFIG_NVSW_SN2201 is not set
# CONFIG_SURFACE_PLATFORMS is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_SI5341=y
CONFIG_COMMON_CLK_SI5351=m
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_CDCE706=y
CONFIG_COMMON_CLK_CS2000_CP=m
CONFIG_CLK_TWL6040=m
# CONFIG_COMMON_CLK_PALMAS is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PCC is not set
CONFIG_ALTERA_MBOX=m
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

CONFIG_IOMMU_DEBUGFS=y
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y
CONFIG_IOMMU_DMA=y
CONFIG_VIRTIO_IOMMU=y

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=m
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=m
# CONFIG_EXTCON_AXP288 is not set
# CONFIG_EXTCON_FSA9480 is not set
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_MAX14577=m
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PALMAS=m
# CONFIG_EXTCON_PTN5150 is not set
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=m
CONFIG_EXTCON_USB_GPIO=y
CONFIG_EXTCON_USBC_CROS_EC=m
# CONFIG_EXTCON_USBC_TUSB320 is not set
CONFIG_MEMORY=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
# CONFIG_IIO_BUFFER_DMA is not set
# CONFIG_IIO_BUFFER_DMAENGINE is not set
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
CONFIG_IIO_SW_TRIGGER=m
# CONFIG_IIO_TRIGGERED_EVENT is not set

#
# Accelerometers
#
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
CONFIG_ADXL345=m
CONFIG_ADXL345_I2C=m
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
CONFIG_ADXL367=m
CONFIG_ADXL367_I2C=m
CONFIG_ADXL372=y
CONFIG_ADXL372_I2C=y
CONFIG_BMA180=y
CONFIG_BMA400=m
CONFIG_BMA400_I2C=m
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_DA280=m
CONFIG_DA311=m
# CONFIG_DMARD06 is not set
# CONFIG_DMARD09 is not set
# CONFIG_DMARD10 is not set
# CONFIG_FXLS8962AF_I2C is not set
CONFIG_IIO_CROS_EC_ACCEL_LEGACY=m
CONFIG_IIO_ST_ACCEL_3AXIS=y
# CONFIG_IIO_ST_ACCEL_I2C_3AXIS is not set
# CONFIG_KXSD9 is not set
CONFIG_KXCJK1013=y
CONFIG_MC3230=m
# CONFIG_MMA7455_I2C is not set
# CONFIG_MMA7660 is not set
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=m
CONFIG_MMA9553=y
# CONFIG_MSA311 is not set
CONFIG_MXC4005=y
# CONFIG_MXC6255 is not set
CONFIG_STK8312=m
CONFIG_STK8BA50=y
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7091R5=y
# CONFIG_AD7291 is not set
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD799X=y
# CONFIG_AXP20X_ADC is not set
CONFIG_AXP288_ADC=m
# CONFIG_DA9150_GPADC is not set
# CONFIG_DLN2_ADC is not set
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_HX711=m
# CONFIG_INA2XX_ADC is not set
CONFIG_LTC2471=y
CONFIG_LTC2485=m
# CONFIG_LTC2497 is not set
CONFIG_MAX1363=y
CONFIG_MAX9611=m
CONFIG_MCP3422=m
CONFIG_MEDIATEK_MT6360_ADC=m
CONFIG_MEN_Z188_ADC=m
# CONFIG_MP2629_ADC is not set
# CONFIG_NAU7802 is not set
CONFIG_PALMAS_GPADC=m
CONFIG_QCOM_VADC_COMMON=m
# CONFIG_QCOM_SPMI_IADC is not set
CONFIG_QCOM_SPMI_VADC=m
CONFIG_QCOM_SPMI_ADC5=m
# CONFIG_RICHTEK_RTQ6056 is not set
CONFIG_SD_ADC_MODULATOR=y
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADS1015 is not set
CONFIG_TWL4030_MADC=m
# CONFIG_TWL6030_GPADC is not set
# CONFIG_VF610_ADC is not set
CONFIG_XILINX_XADC=m
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
CONFIG_STX104=y
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=m
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_HMC425 is not set
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
CONFIG_AD7746=y
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=m
CONFIG_BME680=m
CONFIG_BME680_I2C=m
CONFIG_CCS811=y
CONFIG_IAQCORE=m
CONFIG_PMS7003=m
CONFIG_SCD30_CORE=y
# CONFIG_SCD30_I2C is not set
CONFIG_SCD30_SERIAL=m
CONFIG_SCD4X=y
CONFIG_SENSIRION_SGP30=m
CONFIG_SENSIRION_SGP40=m
# CONFIG_SPS30_I2C is not set
# CONFIG_SPS30_SERIAL is not set
CONFIG_SENSEAIR_SUNRISE_CO2=m
# CONFIG_VZ89X is not set
# end of Chemical Sensors

CONFIG_IIO_CROS_EC_SENSORS_CORE=m
CONFIG_IIO_CROS_EC_SENSORS=m
CONFIG_IIO_CROS_EC_SENSORS_LID_ANGLE=m

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
# CONFIG_AD5380 is not set
CONFIG_AD5446=m
CONFIG_AD5592R_BASE=m
CONFIG_AD5593R=m
CONFIG_AD5686=m
CONFIG_AD5696_I2C=m
CONFIG_CIO_DAC=y
CONFIG_DPOT_DAC=m
# CONFIG_DS4424 is not set
CONFIG_M62332=y
CONFIG_MAX517=y
CONFIG_MAX5821=y
# CONFIG_MCP4725 is not set
CONFIG_TI_DAC5571=y
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=m
CONFIG_IIO_SIMPLE_DUMMY=m
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_BMG160=m
CONFIG_BMG160_I2C=m
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
# CONFIG_MPU3050_I2C is not set
CONFIG_IIO_ST_GYRO_3AXIS=y
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=m
# CONFIG_MAX30100 is not set
CONFIG_MAX30102=m
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
CONFIG_DHT11=y
CONFIG_HDC100X=y
# CONFIG_HDC2010 is not set
# CONFIG_HTS221 is not set
CONFIG_HTU21=m
CONFIG_SI7005=m
# CONFIG_SI7020 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_BMI160_I2C is not set
CONFIG_BOSCH_BNO055=m
CONFIG_BOSCH_BNO055_SERIAL=m
CONFIG_BOSCH_BNO055_I2C=m
CONFIG_FXOS8700=m
CONFIG_FXOS8700_I2C=m
# CONFIG_KMX61 is not set
# CONFIG_INV_ICM42600_I2C is not set
# CONFIG_INV_MPU6050_I2C is not set
# CONFIG_IIO_ST_LSM6DSX is not set
CONFIG_IIO_ST_LSM9DS0=y
# CONFIG_IIO_ST_LSM9DS0_I2C is not set
# end of Inertial measurement units

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
CONFIG_ADJD_S311=y
# CONFIG_ADUX1020 is not set
CONFIG_AL3010=y
# CONFIG_AL3320A is not set
CONFIG_APDS9300=m
CONFIG_APDS9960=y
# CONFIG_AS73211 is not set
CONFIG_BH1750=y
# CONFIG_BH1780 is not set
CONFIG_CM32181=y
CONFIG_CM3232=m
CONFIG_CM3323=y
CONFIG_CM3605=y
# CONFIG_CM36651 is not set
# CONFIG_IIO_CROS_EC_LIGHT_PROX is not set
# CONFIG_GP2AP002 is not set
# CONFIG_GP2AP020A00F is not set
# CONFIG_IQS621_ALS is not set
CONFIG_SENSORS_ISL29018=y
CONFIG_SENSORS_ISL29028=y
CONFIG_ISL29125=m
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=y
# CONFIG_SENSORS_LM3533 is not set
CONFIG_LTR501=y
CONFIG_LTRF216A=m
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=y
CONFIG_MAX44009=m
# CONFIG_NOA1305 is not set
CONFIG_OPT3001=y
CONFIG_PA12203001=m
CONFIG_SI1133=y
# CONFIG_SI1145 is not set
CONFIG_STK3310=m
# CONFIG_ST_UVIS25 is not set
CONFIG_TCS3414=y
CONFIG_TCS3472=m
CONFIG_SENSORS_TSL2563=m
# CONFIG_TSL2583 is not set
# CONFIG_TSL2591 is not set
CONFIG_TSL2772=y
# CONFIG_TSL4531 is not set
CONFIG_US5182D=y
# CONFIG_VCNL4000 is not set
CONFIG_VCNL4035=y
CONFIG_VEML6030=m
CONFIG_VEML6070=y
# CONFIG_VL6180 is not set
CONFIG_ZOPT2201=m
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=y
CONFIG_AK09911=m
# CONFIG_BMC150_MAGN_I2C is not set
CONFIG_MAG3110=y
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
CONFIG_SENSORS_RM3100=y
CONFIG_SENSORS_RM3100_I2C=y
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=m
CONFIG_IIO_INTERRUPT_TRIGGER=y
# CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=m
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=y
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# CONFIG_AD5110 is not set
CONFIG_AD5272=y
CONFIG_DS1803=y
CONFIG_MAX5432=m
# CONFIG_MCP4018 is not set
CONFIG_MCP4531=y
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=m
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_IIO_CROS_EC_BARO=m
CONFIG_DLHL60D=y
CONFIG_DPS310=m
# CONFIG_HP03 is not set
CONFIG_ICP10100=m
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
CONFIG_MPL3115=y
# CONFIG_MS5611 is not set
CONFIG_MS5637=y
CONFIG_IIO_ST_PRESS=y
# CONFIG_IIO_ST_PRESS_I2C is not set
CONFIG_T5403=m
# CONFIG_HP206C is not set
CONFIG_ZPA2326=m
CONFIG_ZPA2326_I2C=m
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_CROS_EC_MKBP_PROXIMITY is not set
CONFIG_ISL29501=y
CONFIG_LIDAR_LITE_V2=y
# CONFIG_MB1232 is not set
CONFIG_PING=y
CONFIG_RFD77402=y
# CONFIG_SRF04 is not set
CONFIG_SX_COMMON=m
CONFIG_SX9310=m
CONFIG_SX9324=m
# CONFIG_SX9360 is not set
# CONFIG_SX9500 is not set
CONFIG_SRF08=y
CONFIG_VCNL3020=y
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_IQS620AT_TEMP is not set
CONFIG_MLX90614=m
CONFIG_MLX90632=y
CONFIG_TMP006=m
CONFIG_TMP007=m
CONFIG_TMP117=y
CONFIG_TSYS01=y
# CONFIG_TSYS02D is not set
# end of Temperature sensors

# CONFIG_NTB is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_DEBUG=y
# CONFIG_PWM_CLK is not set
CONFIG_PWM_CROS_EC=y
CONFIG_PWM_DWC=m
CONFIG_PWM_IQS620A=y
# CONFIG_PWM_LP3943 is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
# CONFIG_PWM_LPSS_PLATFORM is not set
CONFIG_PWM_PCA9685=y
CONFIG_PWM_TWL=y
CONFIG_PWM_TWL_LED=y

#
# IRQ chip support
#
CONFIG_MADERA_IRQ=y
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=m

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=m

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=m
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_CPCAP_USB is not set
# CONFIG_PHY_QCOM_USB_HS is not set
CONFIG_PHY_QCOM_USB_HSIC=y
CONFIG_PHY_SAMSUNG_USB2=m
CONFIG_PHY_TUSB1210=y
CONFIG_PHY_INTEL_LGM_EMMC=m
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=m
CONFIG_MCB_PCI=m
CONFIG_MCB_LPC=m

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
CONFIG_USB4=m
CONFIG_USB4_DEBUGFS_WRITE=y
# CONFIG_USB4_DEBUGFS_MARGINING is not set
# CONFIG_USB4_DMA_TEST is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_RMEM=m
CONFIG_NVMEM_SPMI_SDAM=m

#
# HW tracing support
#
CONFIG_STM=m
CONFIG_STM_PROTO_BASIC=m
CONFIG_STM_PROTO_SYS_T=m
# CONFIG_STM_DUMMY is not set
CONFIG_STM_SOURCE_CONSOLE=m
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_ACPI is not set
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
# CONFIG_INTEL_TH_MSU is not set
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

CONFIG_FPGA=y
# CONFIG_ALTERA_PR_IP_CORE is not set
CONFIG_FPGA_MGR_ALTERA_CVP=m
CONFIG_FPGA_BRIDGE=y
# CONFIG_ALTERA_FREEZE_BRIDGE is not set
# CONFIG_XILINX_PR_DECOUPLER is not set
CONFIG_FPGA_REGION=y
# CONFIG_FPGA_DFL is not set
CONFIG_MULTIPLEXER=m

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_GPIO=m
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=m
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
CONFIG_104_QUAD_8=m
CONFIG_INTERRUPT_CNT=m
CONFIG_INTEL_QEP=y
CONFIG_MOST=m
# CONFIG_MOST_USB_HDM is not set
# CONFIG_MOST_CDEV is not set
CONFIG_MOST_SND=m
CONFIG_PECI=y
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
# CONFIG_NETFS_STATS is not set
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_DEBUG is not set
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=m
CONFIG_ECRYPT_FS=y
CONFIG_ECRYPT_FS_MESSAGING=y
# CONFIG_CRAMFS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=m
CONFIG_PSTORE_LZO_COMPRESS=m
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
CONFIG_PSTORE_ZSTD_COMPRESS=y
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
CONFIG_PSTORE_RAM=m
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_FSCACHE is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=m
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=m
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=y
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=m
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=m
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=y
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=y
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=m
# CONFIG_DLM is not set
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
CONFIG_USER_DECRYPTED_DATA=y
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
CONFIG_EVM_ADD_XATTRS=y
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=m
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_SM2=m
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=m
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=m
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=m
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XCTR=m
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=m
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLYVAL=m
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=m
CONFIG_CRYPTO_SM3_GENERIC=m
CONFIG_CRYPTO_STREEBOG=m
CONFIG_CRYPTO_VMAC=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=m
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=m
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_AES_NI_INTEL=m
CONFIG_CRYPTO_SERPENT_SSE2_586=y
# CONFIG_CRYPTO_TWOFISH_586 is not set
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
# CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
CONFIG_CRYPTO_DEV_GEODE=y
CONFIG_CRYPTO_DEV_HIFN_795X=m
CONFIG_CRYPTO_DEV_HIFN_795X_RNG=y
CONFIG_CRYPTO_DEV_ATMEL_I2C=m
CONFIG_CRYPTO_DEV_ATMEL_ECC=m
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=m
# CONFIG_CRYPTO_DEV_CCP is not set
CONFIG_CRYPTO_DEV_QAT=y
CONFIG_CRYPTO_DEV_QAT_DH895xCC=y
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
CONFIG_CRYPTO_DEV_QAT_C62X=y
CONFIG_CRYPTO_DEV_QAT_4XXX=m
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=y
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=m
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
CONFIG_CRYPTO_LIB_POLY1305=m
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=m
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=m
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
# CONFIG_XZ_DEC_POWERPC is not set
# CONFIG_XZ_DEC_IA64 is not set
CONFIG_XZ_DEC_ARM=y
# CONFIG_XZ_DEC_ARMTHUMB is not set
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_CMA is not set
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
# CONFIG_CPUMASK_OFFSTACK is not set
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_32=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
CONFIG_READABLE_ASM=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
CONFIG_UBSAN_UNREACHABLE=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_SHRINKER_DEBUG=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_DEBUG_PER_CPU_MAPS=y
CONFIG_DEBUG_KMAP_LOCAL=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=y
CONFIG_DEBUG_HIGHMEM=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
# CONFIG_SYNTH_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_GCOV_PROFILE_FTRACE is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
CONFIG_IO_DELAY_NONE=y
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
CONFIG_PUNIT_ATOM_DEBUG=m
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_DEBUG_VIRTUAL is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--yLVIM82DhIPoldq9--
