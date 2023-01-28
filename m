Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2A55CB6
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jan 2023 14:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674916718; x=1706452718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DmaxKsuIaNXWQ+v5xYTc2BoHyZiI5vWENKKgQwqUBbk=;
  b=mZxAzcE73swGKcVMnd96QEU2Y6rrnXrabSXRBCqwRFgCu72SNkdSOaV7
   HRYqfDv2WmFplFozDJVeif3+yQGfgOLoZKa5+SQt85ySdJrJPSQCsSx01
   WLhqlosHTZcAS463j5/gFugXSrrMDmpxtnnms/BidqSa9Ry27KbYzO9Vn
   2ROlr7FD1Qpl3GH8Iwam+QCiENQUg8GY5iEfMwWtnN56nK1lB0KLGl/at
   aUgtuawu5KL3bauJ+7bfFBuJIAgInhZQi8RAVgO1SafO75m/4ENeQtbCx
   /h8B2WbGdacfDySv4PgWunDVuiztX2cyWq1nhXAQE0p/4OwPEFzHTl8e/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354604474"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="354604474"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 06:38:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="663605661"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="663605661"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2023 06:38:35 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLmLi-0000nl-2w;
	Sat, 28 Jan 2023 14:38:34 +0000
Date: Sat, 28 Jan 2023 22:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:perf/core 3/5] arch/x86/events/intel/uncore_discovery.c:194:61:
 warning: Parameter 'ignore' can be declared as pointer to const
 [constParameter]
Message-ID: <202301282213.5SIgJMDD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/events/intel/uncore_discovery.c:194:61: warning: Parameter 'ignore' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Kan Liang <kan.liang@linux.intel.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
head:   5d515ee40cb57ea5331998f27df7946a69f14dc3
commit: bd9514a4d5ec25b29728720ca8b3a9ac4e3137d7 [3/5] perf/x86/uncore: Ignore broken units in discovery table
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout bd9514a4d5ec25b29728720ca8b3a9ac4e3137d7
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/events/intel/uncore_discovery.c:194:61: warning: Parameter 'ignore' can be declared as pointer to const [constParameter]
   uncore_ignore_unit(struct uncore_unit_discovery *unit, int *ignore)
                                                               ^
--
>> arch/x86/events/intel/uncore_snbep.c:3904:32: warning: Parameter 'ag' can be declared as pointer to const [constParameter]
          struct attribute_group *ag)
                                  ^
>> arch/x86/events/intel/uncore_snbep.c:4709:69: warning: Parameter 'sad_pmon_mapping' can be declared as pointer to const [constParameter]
   static int sad_cfg_iio_topology(struct intel_uncore_type *type, u8 *sad_pmon_mapping)
                                                                       ^
>> arch/x86/events/intel/uncore_snbep.c:1159:17: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    .event_mask  = SNBEP_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:1824:17: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    .event_mask  = IVBEP_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:2256:17: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    .event_mask  = KNL_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:2875:17: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    .event_mask  = SNBEP_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:4169:17: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    .event_mask  = SNBEP_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
>> arch/x86/events/intel/uncore_snbep.c:1140:46: warning: Either the condition 'ev_sel<=0xe' is redundant or there is signed integer overflow for expression '0xff<<(reg1->idx*8)'. [integerOverflowCond]
     reg1->config = event->attr.config1 & (0xff << (reg1->idx * 8));
                                                ^
   arch/x86/events/intel/uncore_snbep.c:1137:30: note: Assuming that condition 'ev_sel<=0xe' is not redundant
    if (ev_sel >= 0xb && ev_sel <= 0xe) {
                                ^
   arch/x86/events/intel/uncore_snbep.c:1139:13: note: reg1->idx is assigned 'ev_sel-0xb' here.
     reg1->idx = ev_sel - 0xb;
               ^
   arch/x86/events/intel/uncore_snbep.c:1140:46: note: Integer overflow
     reg1->config = event->attr.config1 & (0xff << (reg1->idx * 8));
                                                ^
>> arch/x86/events/intel/uncore_snbep.c:1159:17: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    .event_mask  = SNBEP_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:1824:17: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    .event_mask  = IVBEP_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:2256:17: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    .event_mask  = KNL_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:2875:17: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    .event_mask  = SNBEP_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:4012:17: warning: Signed integer overflow for expression '0xff<<24'. [integerOverflow]
    .event_mask  = SKX_IIO_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:4169:17: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
    .event_mask  = SNBEP_PCU_MSR_PMON_RAW_EVENT_MASK,
                   ^
   arch/x86/events/intel/uncore_snbep.c:5007:16: warning: Signed integer overflow for expression '0xff<<24'. [integerOverflow]
    .event_mask = SKX_IIO_PMON_RAW_EVENT_MASK,
                  ^
>> arch/x86/events/intel/uncore_snbep.c:4352:9: warning: Uninitialized variable: ret [uninitvar]
    return ret;
           ^
   arch/x86/events/intel/uncore_snbep.c:4339:20: note: Assuming condition is false
    for (idx = 0; idx < type->num_boxes; idx++) {
                      ^
   arch/x86/events/intel/uncore_snbep.c:4352:9: note: Uninitialized variable: ret
    return ret;
           ^

vim +/ignore +194 arch/x86/events/intel/uncore_discovery.c

edae1f06c2cda4 Kan Liang 2021-03-17  192  
bd9514a4d5ec25 Kan Liang 2023-01-12  193  static bool
bd9514a4d5ec25 Kan Liang 2023-01-12 @194  uncore_ignore_unit(struct uncore_unit_discovery *unit, int *ignore)
bd9514a4d5ec25 Kan Liang 2023-01-12  195  {
bd9514a4d5ec25 Kan Liang 2023-01-12  196  	int i;
bd9514a4d5ec25 Kan Liang 2023-01-12  197  
bd9514a4d5ec25 Kan Liang 2023-01-12  198  	if (!ignore)
bd9514a4d5ec25 Kan Liang 2023-01-12  199  		return false;
bd9514a4d5ec25 Kan Liang 2023-01-12  200  
bd9514a4d5ec25 Kan Liang 2023-01-12  201  	for (i = 0; ignore[i] != UNCORE_IGNORE_END ; i++) {
bd9514a4d5ec25 Kan Liang 2023-01-12  202  		if (unit->box_type == ignore[i])
bd9514a4d5ec25 Kan Liang 2023-01-12  203  			return true;
bd9514a4d5ec25 Kan Liang 2023-01-12  204  	}
bd9514a4d5ec25 Kan Liang 2023-01-12  205  
bd9514a4d5ec25 Kan Liang 2023-01-12  206  	return false;
bd9514a4d5ec25 Kan Liang 2023-01-12  207  }
bd9514a4d5ec25 Kan Liang 2023-01-12  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
