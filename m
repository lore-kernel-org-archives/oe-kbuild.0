Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1FE208D2
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Nov 2023 22:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxccTR0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698963865; x=1730499865;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gs4snSbAkbz+ZvvOQ8ZO5D9scxrvR54uYzofkwO1VMg=;
  b=bxccTR0sYWpKDq3LnFnD5hRlIVBk1+xmEgUn80HA2xlvd0cX2hi7adOr
   5ip/xk86tdfSs0yaoRQ8eBVOvVZc8Onr7O8B8AV7ibgrRstX1xh0Tjxdj
   ZqXk6GZ3RdJDmDIbUFGDCQ4wijURpQKcGQkdCog0WXZvOpCZYM+QB/Yh4
   2t9Nb+sN1hWouvJUxQqikTWVMdcLATWFhfRU5F6VmgkiYF/ktcwTm6CGs
   kZppVRR4g72c7rJZY1fA/4nyKq0vc3tTRZonVKgR/O4nKtl/X3lN84/iE
   KQYEwmAnbL3tfTTqWcZkpvUa8h59Gf1RTbzQWK/JUFj1/hdJi61I4QhR4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="475071559"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="475071559"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 15:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008613333"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="1008613333"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 15:24:22 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyg6u-0001wO-2G;
	Thu, 02 Nov 2023 22:24:20 +0000
Date: Fri, 3 Nov 2023 06:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits
 from constant value (80b88 becomes b88)
Message-ID: <202311030644.TsQr6jfZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Sean Christopherson <seanjc@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: a789aeba419647c44d7e7320de20fea037c211d0 KVM: VMX: Rename "vmx/evmcs.{ch}" to "vmx/hyperv.{ch}"
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-123-20231101 (https://download.01.org/0day-ci/archive/20231103/202311030644.TsQr6jfZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030644.TsQr6jfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311030644.TsQr6jfZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/vmx/sgx.c: note: in included file (through arch/x86/kvm/vmx/vmx_ops.h, arch/x86/kvm/vmx/vmx.h, arch/x86/kvm/vmx/nested.h):
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
--
   arch/x86/kvm/vmx/pmu_intel.c: note: in included file (through arch/x86/kvm/vmx/vmx_ops.h, arch/x86/kvm/vmx/vmx.h, arch/x86/kvm/vmx/nested.h):
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
--
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
--
   arch/x86/kvm/vmx/nested.c: note: in included file:
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80608 becomes 608)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80108 becomes 108)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80388 becomes 388)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20482 becomes 482)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100910 becomes 910)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80188 becomes 188)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80208 becomes 208)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80288 becomes 288)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20402 becomes 402)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20002 becomes 2)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20082 becomes 82)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20102 becomes 102)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20182 becomes 182)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20202 becomes 202)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20282 becomes 282)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20302 becomes 302)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (20382 becomes 382)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120012 becomes 12)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120092 becomes 92)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120112 becomes 112)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120192 becomes 192)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120212 becomes 212)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120292 becomes 292)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120312 becomes 312)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120592 becomes 592)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120612 becomes 612)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120512 becomes 512)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120692 becomes 692)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120712 becomes 712)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120792 becomes 792)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120812 becomes 812)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a019a becomes 19a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a021a becomes 21a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a029a becomes 29a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a031a becomes 31a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a049a becomes 49a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80b08 becomes b08)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80708 becomes 708)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80788 becomes 788)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80808 becomes 808)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80888 becomes 888)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100390 becomes 390)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (180018 becomes 18)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: too many warnings
--
   arch/x86/kvm/vmx/vmx.c: note: in included file:
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100110 becomes 110)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a050a becomes 50a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: too many warnings

vim +79 arch/x86/kvm/vmx/hyperv.h

75edce8a45486fe arch/x86/kvm/vmx/evmcs.h Sean Christopherson 2018-12-03   75  
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   76  static __always_inline int evmcs_field_offset(unsigned long field,
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   77  					      u16 *clean_field)
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   78  {
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  @79  	unsigned int index = ROL16(field, 6);
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   80  	const struct evmcs_field *evmcs_field;
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   81  
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   82  	if (unlikely(index >= nr_evmcs_1_fields))
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   83  		return -ENOENT;
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   84  
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   85  	evmcs_field = &vmcs_field_to_evmcs_1[index];
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   86  
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   87  	/*
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   88  	 * Use offset=0 to detect holes in eVMCS. This offset belongs to
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   89  	 * 'revision_id' but this field has no encoding and is supposed to
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   90  	 * be accessed directly.
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   91  	 */
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   92  	if (unlikely(!evmcs_field->offset))
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   93  		return -ENOENT;
892a42c10ddb945 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12   94  
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   95  	if (clean_field)
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   96  		*clean_field = evmcs_field->clean_field;
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   97  
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   98  	return evmcs_field->offset;
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20   99  }
773e8a0425c923b arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  100  

:::::: The code at line 79 was first introduced by commit
:::::: 773e8a0425c923bc02668a2d6534a5ef5a43cc69 x86/kvm: use Enlightened VMCS when running on Hyper-V

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Radim Krčmář <rkrcmar@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
