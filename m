Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421857494
	for <oe-kbuild@lists.linux.dev>; Tue, 16 May 2023 05:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684215602; x=1715751602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/YNkha6pwECdohoVliMywCjSoUig6a5vmKYZ21SRF4g=;
  b=hWKAfwM+iQXMXKhuOs4/k07T531ATTALRTwVPjAcrfaJmXqgwlnWo5dK
   7fz8vsEoIAvz2g2TySd+a8Cgra+GcgkA4rxmQXz0Mu2lZE7gRZP/aaRip
   qUFvCBizIvBabiHbLHo58ItMUi5FoQPQ46pROo0/66jQY2ufm/36yV3Y2
   55VpFYH4UF5no+RPFZIEstt8a4vvg9jNl7Fj1jXBFFkgqvKp+VkhC3qzE
   Vx6nz8qHXeolt2UF6/Qb4uKOJdrz5S54nVh/8JGDhe2w97HwVyBBQ1FOO
   L74pP2z1ncVoqep7PKM64CmiOOJ6elUlA0pytxedMZmq4blc3fr/tEogW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="348886974"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="348886974"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 22:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="813269339"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="813269339"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 May 2023 22:39:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pynPf-000710-0C;
	Tue, 16 May 2023 05:39:55 +0000
Date: Tue, 16 May 2023 13:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kvm/vmx/hyperv.c:22:9: sparse: sparse: cast truncates bits
 from constant value (1a079a becomes 79a)
Message-ID: <202305161338.YQRhmQGc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Sean Christopherson <seanjc@google.com>

Hi Vitaly,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
commit: a789aeba419647c44d7e7320de20fea037c211d0 KVM: VMX: Rename "vmx/evmcs.{ch}" to "vmx/hyperv.{ch}"
date:   6 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-s001-20230515 (https://download.01.org/0day-ci/archive/20230516/202305161338.YQRhmQGc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a789aeba419647c44d7e7320de20fea037c211d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a789aeba419647c44d7e7320de20fea037c211d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/ drivers/gpu/drm/gma500/ drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305161338.YQRhmQGc-lkp@intel.com/

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
--
   arch/x86/kvm/vmx/pmu_intel.c: note: in included file (through arch/x86/kvm/vmx/vmx_ops.h, arch/x86/kvm/vmx/vmx.h, arch/x86/kvm/vmx/nested.h):
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
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
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
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
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
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
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
>> arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: too many warnings

vim +22 arch/x86/kvm/vmx/hyperv.c

75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   15  
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   16  #define EVMCS1_OFFSET(x) offsetof(struct hv_enlightened_vmcs, x)
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   17  #define EVMCS1_FIELD(number, name, clean_field)[ROL16(number, 6)] = \
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   18  		{EVMCS1_OFFSET(name), clean_field}
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   19  
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   20  const struct evmcs_field vmcs_field_to_evmcs_1[] = {
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   21  	/* 64 bit rw */
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @22  	EVMCS1_FIELD(GUEST_RIP, guest_rip,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   23  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @24  	EVMCS1_FIELD(GUEST_RSP, guest_rsp,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   25  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @26  	EVMCS1_FIELD(GUEST_RFLAGS, guest_rflags,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   27  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @28  	EVMCS1_FIELD(HOST_IA32_PAT, host_ia32_pat,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   29  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @30  	EVMCS1_FIELD(HOST_IA32_EFER, host_ia32_efer,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   31  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  @32  	EVMCS1_FIELD(HOST_IA32_PERF_GLOBAL_CTRL, host_ia32_perf_global_ctrl,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30   33  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @34  	EVMCS1_FIELD(HOST_CR0, host_cr0,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   35  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @36  	EVMCS1_FIELD(HOST_CR3, host_cr3,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   37  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @38  	EVMCS1_FIELD(HOST_CR4, host_cr4,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   39  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @40  	EVMCS1_FIELD(HOST_IA32_SYSENTER_ESP, host_ia32_sysenter_esp,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   41  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @42  	EVMCS1_FIELD(HOST_IA32_SYSENTER_EIP, host_ia32_sysenter_eip,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   43  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @44  	EVMCS1_FIELD(HOST_RIP, host_rip,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   45  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @46  	EVMCS1_FIELD(IO_BITMAP_A, io_bitmap_a,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   47  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_IO_BITMAP),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   48  	EVMCS1_FIELD(IO_BITMAP_B, io_bitmap_b,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   49  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_IO_BITMAP),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   50  	EVMCS1_FIELD(MSR_BITMAP, msr_bitmap,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   51  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_MSR_BITMAP),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @52  	EVMCS1_FIELD(GUEST_ES_BASE, guest_es_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   53  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @54  	EVMCS1_FIELD(GUEST_CS_BASE, guest_cs_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   55  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @56  	EVMCS1_FIELD(GUEST_SS_BASE, guest_ss_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   57  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @58  	EVMCS1_FIELD(GUEST_DS_BASE, guest_ds_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   59  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @60  	EVMCS1_FIELD(GUEST_FS_BASE, guest_fs_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   61  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @62  	EVMCS1_FIELD(GUEST_GS_BASE, guest_gs_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   63  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @64  	EVMCS1_FIELD(GUEST_LDTR_BASE, guest_ldtr_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   65  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @66  	EVMCS1_FIELD(GUEST_TR_BASE, guest_tr_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   67  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @68  	EVMCS1_FIELD(GUEST_GDTR_BASE, guest_gdtr_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   69  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @70  	EVMCS1_FIELD(GUEST_IDTR_BASE, guest_idtr_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   71  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   72  	EVMCS1_FIELD(TSC_OFFSET, tsc_offset,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   73  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   74  	EVMCS1_FIELD(VIRTUAL_APIC_PAGE_ADDR, virtual_apic_page_addr,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   75  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @76  	EVMCS1_FIELD(VMCS_LINK_POINTER, vmcs_link_pointer,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   77  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @78  	EVMCS1_FIELD(GUEST_IA32_DEBUGCTL, guest_ia32_debugctl,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   79  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @80  	EVMCS1_FIELD(GUEST_IA32_PAT, guest_ia32_pat,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   81  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @82  	EVMCS1_FIELD(GUEST_IA32_EFER, guest_ia32_efer,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   83  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  @84  	EVMCS1_FIELD(GUEST_IA32_PERF_GLOBAL_CTRL, guest_ia32_perf_global_ctrl,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30   85  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @86  	EVMCS1_FIELD(GUEST_PDPTR0, guest_pdptr0,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   87  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @88  	EVMCS1_FIELD(GUEST_PDPTR1, guest_pdptr1,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   89  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @90  	EVMCS1_FIELD(GUEST_PDPTR2, guest_pdptr2,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   91  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @92  	EVMCS1_FIELD(GUEST_PDPTR3, guest_pdptr3,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   93  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @94  	EVMCS1_FIELD(GUEST_PENDING_DBG_EXCEPTIONS, guest_pending_dbg_exceptions,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   95  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @96  	EVMCS1_FIELD(GUEST_SYSENTER_ESP, guest_sysenter_esp,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   97  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  @98  	EVMCS1_FIELD(GUEST_SYSENTER_EIP, guest_sysenter_eip,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03   99  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  100  	EVMCS1_FIELD(CR0_GUEST_HOST_MASK, cr0_guest_host_mask,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  101  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  102  	EVMCS1_FIELD(CR4_GUEST_HOST_MASK, cr4_guest_host_mask,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  103  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  104  	EVMCS1_FIELD(CR0_READ_SHADOW, cr0_read_shadow,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  105  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  106  	EVMCS1_FIELD(CR4_READ_SHADOW, cr4_read_shadow,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  107  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @108  	EVMCS1_FIELD(GUEST_CR0, guest_cr0,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  109  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @110  	EVMCS1_FIELD(GUEST_CR3, guest_cr3,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  111  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @112  	EVMCS1_FIELD(GUEST_CR4, guest_cr4,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  113  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @114  	EVMCS1_FIELD(GUEST_DR7, guest_dr7,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  115  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @116  	EVMCS1_FIELD(HOST_FS_BASE, host_fs_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  117  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @118  	EVMCS1_FIELD(HOST_GS_BASE, host_gs_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  119  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @120  	EVMCS1_FIELD(HOST_TR_BASE, host_tr_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  121  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @122  	EVMCS1_FIELD(HOST_GDTR_BASE, host_gdtr_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  123  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @124  	EVMCS1_FIELD(HOST_IDTR_BASE, host_idtr_base,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  125  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @126  	EVMCS1_FIELD(HOST_RSP, host_rsp,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  127  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  128  	EVMCS1_FIELD(EPT_POINTER, ept_pointer,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  129  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_XLAT),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @130  	EVMCS1_FIELD(GUEST_BNDCFGS, guest_bndcfgs,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  131  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03 @132  	EVMCS1_FIELD(XSS_EXIT_BITMAP, xss_exit_bitmap,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  133  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30 @134  	EVMCS1_FIELD(ENCLS_EXITING_BITMAP, encls_exiting_bitmap,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  135  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30 @136  	EVMCS1_FIELD(TSC_MULTIPLIER, tsc_multiplier,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  137  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  138  	/*
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  139  	 * Not used by KVM:
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  140  	 *
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  141  	 * EVMCS1_FIELD(0x00006828, guest_ia32_s_cet,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  142  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  143  	 * EVMCS1_FIELD(0x0000682A, guest_ssp,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  144  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  145  	 * EVMCS1_FIELD(0x0000682C, guest_ia32_int_ssp_table_addr,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  146  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  147  	 * EVMCS1_FIELD(0x00002816, guest_ia32_lbr_ctl,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  148  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  149  	 * EVMCS1_FIELD(0x00006C18, host_ia32_s_cet,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  150  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  151  	 * EVMCS1_FIELD(0x00006C1A, host_ssp,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  152  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  153  	 * EVMCS1_FIELD(0x00006C1C, host_ia32_int_ssp_table_addr,
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  154  	 *	     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
b19e4ff5e55822 arch/x86/kvm/vmx/evmcs.c Vitaly Kuznetsov    2022-08-30  155  	 */
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  156  
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  157  	/* 64 bit read only */
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  158  	EVMCS1_FIELD(GUEST_PHYSICAL_ADDRESS, guest_physical_address,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  159  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  160  	EVMCS1_FIELD(EXIT_QUALIFICATION, exit_qualification,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  161  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  162  	/*
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  163  	 * Not defined in KVM:
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  164  	 *
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  165  	 * EVMCS1_FIELD(0x00006402, exit_io_instruction_ecx,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  166  	 *		HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE);
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  167  	 * EVMCS1_FIELD(0x00006404, exit_io_instruction_esi,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  168  	 *		HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE);
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  169  	 * EVMCS1_FIELD(0x00006406, exit_io_instruction_esi,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  170  	 *		HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE);
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  171  	 * EVMCS1_FIELD(0x00006408, exit_io_instruction_eip,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  172  	 *		HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE);
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  173  	 */
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  174  	EVMCS1_FIELD(GUEST_LINEAR_ADDRESS, guest_linear_address,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  175  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  176  
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  177  	/*
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  178  	 * No mask defined in the spec as Hyper-V doesn't currently support
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  179  	 * these. Future proof by resetting the whole clean field mask on
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  180  	 * access.
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  181  	 */
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  182  	EVMCS1_FIELD(VM_EXIT_MSR_STORE_ADDR, vm_exit_msr_store_addr,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  183  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  184  	EVMCS1_FIELD(VM_EXIT_MSR_LOAD_ADDR, vm_exit_msr_load_addr,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  185  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  186  	EVMCS1_FIELD(VM_ENTRY_MSR_LOAD_ADDR, vm_entry_msr_load_addr,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  187  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  188  
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  189  	/* 32 bit rw */
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  190  	EVMCS1_FIELD(TPR_THRESHOLD, tpr_threshold,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  191  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  192  	EVMCS1_FIELD(GUEST_INTERRUPTIBILITY_INFO, guest_interruptibility_info,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  193  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  194  	EVMCS1_FIELD(CPU_BASED_VM_EXEC_CONTROL, cpu_based_vm_exec_control,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  195  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_PROC),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  196  	EVMCS1_FIELD(EXCEPTION_BITMAP, exception_bitmap,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  197  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_EXCPN),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  198  	EVMCS1_FIELD(VM_ENTRY_CONTROLS, vm_entry_controls,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  199  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_ENTRY),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  200  	EVMCS1_FIELD(VM_ENTRY_INTR_INFO_FIELD, vm_entry_intr_info_field,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  201  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_EVENT),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  202  	EVMCS1_FIELD(VM_ENTRY_EXCEPTION_ERROR_CODE,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  203  		     vm_entry_exception_error_code,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  204  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_EVENT),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  205  	EVMCS1_FIELD(VM_ENTRY_INSTRUCTION_LEN, vm_entry_instruction_len,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  206  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_EVENT),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  207  	EVMCS1_FIELD(HOST_IA32_SYSENTER_CS, host_ia32_sysenter_cs,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  208  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  209  	EVMCS1_FIELD(PIN_BASED_VM_EXEC_CONTROL, pin_based_vm_exec_control,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  210  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  211  	EVMCS1_FIELD(VM_EXIT_CONTROLS, vm_exit_controls,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  212  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  213  	EVMCS1_FIELD(SECONDARY_VM_EXEC_CONTROL, secondary_vm_exec_control,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  214  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  215  	EVMCS1_FIELD(GUEST_ES_LIMIT, guest_es_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  216  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  217  	EVMCS1_FIELD(GUEST_CS_LIMIT, guest_cs_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  218  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  219  	EVMCS1_FIELD(GUEST_SS_LIMIT, guest_ss_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  220  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  221  	EVMCS1_FIELD(GUEST_DS_LIMIT, guest_ds_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  222  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  223  	EVMCS1_FIELD(GUEST_FS_LIMIT, guest_fs_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  224  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  225  	EVMCS1_FIELD(GUEST_GS_LIMIT, guest_gs_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  226  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  227  	EVMCS1_FIELD(GUEST_LDTR_LIMIT, guest_ldtr_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  228  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  229  	EVMCS1_FIELD(GUEST_TR_LIMIT, guest_tr_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  230  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  231  	EVMCS1_FIELD(GUEST_GDTR_LIMIT, guest_gdtr_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  232  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  233  	EVMCS1_FIELD(GUEST_IDTR_LIMIT, guest_idtr_limit,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  234  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  235  	EVMCS1_FIELD(GUEST_ES_AR_BYTES, guest_es_ar_bytes,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  236  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  237  	EVMCS1_FIELD(GUEST_CS_AR_BYTES, guest_cs_ar_bytes,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  238  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  239  	EVMCS1_FIELD(GUEST_SS_AR_BYTES, guest_ss_ar_bytes,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  240  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  241  	EVMCS1_FIELD(GUEST_DS_AR_BYTES, guest_ds_ar_bytes,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  242  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  243  	EVMCS1_FIELD(GUEST_FS_AR_BYTES, guest_fs_ar_bytes,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  244  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  245  	EVMCS1_FIELD(GUEST_GS_AR_BYTES, guest_gs_ar_bytes,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  246  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  247  	EVMCS1_FIELD(GUEST_LDTR_AR_BYTES, guest_ldtr_ar_bytes,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  248  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  249  	EVMCS1_FIELD(GUEST_TR_AR_BYTES, guest_tr_ar_bytes,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  250  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  251  	EVMCS1_FIELD(GUEST_ACTIVITY_STATE, guest_activity_state,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  252  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  253  	EVMCS1_FIELD(GUEST_SYSENTER_CS, guest_sysenter_cs,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  254  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  255  
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  256  	/* 32 bit read only */
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  257  	EVMCS1_FIELD(VM_INSTRUCTION_ERROR, vm_instruction_error,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  258  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  259  	EVMCS1_FIELD(VM_EXIT_REASON, vm_exit_reason,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  260  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  261  	EVMCS1_FIELD(VM_EXIT_INTR_INFO, vm_exit_intr_info,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  262  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  263  	EVMCS1_FIELD(VM_EXIT_INTR_ERROR_CODE, vm_exit_intr_error_code,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  264  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  265  	EVMCS1_FIELD(IDT_VECTORING_INFO_FIELD, idt_vectoring_info_field,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  266  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  267  	EVMCS1_FIELD(IDT_VECTORING_ERROR_CODE, idt_vectoring_error_code,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  268  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  269  	EVMCS1_FIELD(VM_EXIT_INSTRUCTION_LEN, vm_exit_instruction_len,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  270  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  271  	EVMCS1_FIELD(VMX_INSTRUCTION_INFO, vmx_instruction_info,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  272  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  273  
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  274  	/* No mask defined in the spec (not used) */
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  275  	EVMCS1_FIELD(PAGE_FAULT_ERROR_CODE_MASK, page_fault_error_code_mask,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  276  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  277  	EVMCS1_FIELD(PAGE_FAULT_ERROR_CODE_MATCH, page_fault_error_code_match,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  278  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  279  	EVMCS1_FIELD(CR3_TARGET_COUNT, cr3_target_count,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  280  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  281  	EVMCS1_FIELD(VM_EXIT_MSR_STORE_COUNT, vm_exit_msr_store_count,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  282  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  283  	EVMCS1_FIELD(VM_EXIT_MSR_LOAD_COUNT, vm_exit_msr_load_count,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  284  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  285  	EVMCS1_FIELD(VM_ENTRY_MSR_LOAD_COUNT, vm_entry_msr_load_count,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  286  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  287  
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  288  	/* 16 bit rw */
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  289  	EVMCS1_FIELD(HOST_ES_SELECTOR, host_es_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  290  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  291  	EVMCS1_FIELD(HOST_CS_SELECTOR, host_cs_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  292  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  293  	EVMCS1_FIELD(HOST_SS_SELECTOR, host_ss_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  294  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  295  	EVMCS1_FIELD(HOST_DS_SELECTOR, host_ds_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  296  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  297  	EVMCS1_FIELD(HOST_FS_SELECTOR, host_fs_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  298  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  299  	EVMCS1_FIELD(HOST_GS_SELECTOR, host_gs_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  300  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  301  	EVMCS1_FIELD(HOST_TR_SELECTOR, host_tr_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  302  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  303  	EVMCS1_FIELD(GUEST_ES_SELECTOR, guest_es_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  304  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  305  	EVMCS1_FIELD(GUEST_CS_SELECTOR, guest_cs_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  306  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  307  	EVMCS1_FIELD(GUEST_SS_SELECTOR, guest_ss_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  308  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  309  	EVMCS1_FIELD(GUEST_DS_SELECTOR, guest_ds_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  310  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  311  	EVMCS1_FIELD(GUEST_FS_SELECTOR, guest_fs_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  312  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  313  	EVMCS1_FIELD(GUEST_GS_SELECTOR, guest_gs_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  314  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  315  	EVMCS1_FIELD(GUEST_LDTR_SELECTOR, guest_ldtr_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  316  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  317  	EVMCS1_FIELD(GUEST_TR_SELECTOR, guest_tr_selector,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  318  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  319  	EVMCS1_FIELD(VIRTUAL_PROCESSOR_ID, virtual_processor_id,
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  320  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_XLAT),
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  321  };
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  322  const unsigned int nr_evmcs_1_fields = ARRAY_SIZE(vmcs_field_to_evmcs_1);
75edce8a45486f arch/x86/kvm/vmx/evmcs.c Sean Christopherson 2018-12-03  323  

:::::: The code at line 22 was first introduced by commit
:::::: 75edce8a45486fe5fa5becdb43a7c36354b2a379 KVM: VMX: Move eVMCS code to dedicated files

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
