Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9FE2588
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Feb 2023 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675254928; x=1706790928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bcGaglO7saZpiyoI+l4YmPsrINrsgjqZ7ZaGSIlVPFg=;
  b=PXKfIfq0DoP0GwvDhWHW2GeVLv6a8GZOEVt1YEuSu4PtaFf8JvK5cDTW
   4lZ3nb8g0aWBOn46y74ds/W32F5oAGikouOdDwrV64iZrY42FCv9xMW5t
   BT0dBOCHNMxAfiIbAV/+6KQmfCbi3TYKS5TTamv3TyHYm8j+ue6iWzgkE
   XrdxnWKuP+F70sSiC5DYu+6CDmq2C4SaCLQEPxdYiwxKj1r9agU92ARPq
   t4XUufLw1BIJt4n08xbCNXBJP222ermAOVHmC2LJIjzyiKptDiYbkbSiM
   Ad7+9llGNCHbbVWhgctROCAKqKpnG8YDnrpPvE1L4133ZqpQnvgr00/CQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311773535"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="311773535"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 04:35:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910305946"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="910305946"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2023 04:35:26 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNCKj-0005QM-1X;
	Wed, 01 Feb 2023 12:35:25 +0000
Date: Wed, 1 Feb 2023 20:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:timers/core 4/4] include/vdso/bits.h:8:41: warning: shift by
 count ('4294967292') >= precision of type ('64')
Message-ID: <202302012009.t1J7Kj3v-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: include/vdso/bits.h:8:41: warning: shift by count ('4294967292') >= precision of type ('64') [-Wanalyzer-shift-count-overflow]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

Hi Andy,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
head:   cbdb1f163af2bb90d01be1f0263df1d8d5c9d9d3
commit: cbdb1f163af2bb90d01be1f0263df1d8d5c9d9d3 [4/4] vdso/bits.h: Add BIT_ULL() for the sake of consistency
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-c001-20230130 (https://download.01.org/0day-ci/archive/20230201/202302012009.t1J7Kj3v-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=cbdb1f163af2bb90d01be1f0263df1d8d5c9d9d3
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip timers/core
        git checkout cbdb1f163af2bb90d01be1f0263df1d8d5c9d9d3
        # save the config file
        make ARCH=x86_64 KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        make ARCH=x86_64 KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
              | 2634 |                 if (gaudi2_is_arc_enabled(hdev, i))
              |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (10) returning to 'gaudi2_init_arcs' from 'gaudi2_is_arc_enabled'
              |......
              | 2640 |         for (i = GAUDI2_QUEUE_ID_PDMA_0_0 ; i < GAUDI2_QUEUE_ID_CPU_PQ ; i += 4) {
              |      |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                               |
              |      |                                               (11) following 'true' branch (when 'i != 260')...
              | 2641 |                 if (!gaudi2_is_queue_enabled(hdev, i))
              |      |                 ~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |    |
              |      |                 |    (13) calling 'gaudi2_is_queue_enabled' from 'gaudi2_init_arcs'
              |      |                 (12) ...to here
              |
              +--> 'gaudi2_is_queue_enabled': events 14-22
                     |
                     | 5563 | static bool gaudi2_is_queue_enabled(struct hl_device *hdev, u32 hw_queue_id)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (14) entry to 'gaudi2_is_queue_enabled'
                     |......
                     | 5571 |         switch (hw_queue_id) {
                     |      |         ~~~~~~
                     |      |         |
                     |      |         (15) following 'case 0 ... 1:' branch...
                     |......
                     | 5657 |         if (hw_tpc_cap_bit)
                     |      |         ~~ ~ 
                     |      |         |  |
                     |      |         |  (17) following 'false' branch (when 'hw_tpc_cap_bit == 0')...
                     |      |         (16) ...to here
                     |......
                     | 5660 |         if (hw_nic_cap_bit)
                     |      |         ~~ ~ 
                     |      |         |  |
                     |      |         |  (19) following 'false' branch (when 'hw_nic_cap_bit == 0')...
                     |      |         (18) ...to here
                     |......
                     | 5663 |         if (hw_test_cap_bit)
                     |      |         ~~ ~ 
                     |      |         |  |
                     |      |         |  (21) following 'false' branch (when 'hw_test_cap_bit == 0')...
                     |      |         (20) ...to here
                     |......
                     | 5666 |         return !!(gaudi2->hw_cap_initialized & hw_cap_mask);
                     |      |         ~~~~~~
                     |      |         |
                     |      |         (22) ...to here
                     |
              <------+
              |
            'gaudi2_init_arcs': events 23-26
              |
              | 2641 |                 if (!gaudi2_is_queue_enabled(hdev, i))
              |      |                    ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                    | |
              |      |                    | (23) returning to 'gaudi2_init_arcs' from 'gaudi2_is_queue_enabled'
              |      |                    (24) following 'true' branch...
              |......
              | 2644 |                 arc_id = gaudi2_queue_id_to_arc_id[i];
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (25) ...to here
              | 2645 |                 if (gaudi2_is_arc_enabled(hdev, arc_id))
              |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (26) calling 'gaudi2_is_arc_enabled' from 'gaudi2_init_arcs'
              |
              +--> 'gaudi2_is_arc_enabled': events 27-30
                     |
                     | 5669 | static bool gaudi2_is_arc_enabled(struct hl_device *hdev, u64 arc_id)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (27) entry to 'gaudi2_is_arc_enabled'
                     |......
                     | 5673 |         switch (arc_id) {
                     |      |         ~~~~~~
                     |      |         |
                     |      |         (28) following 'case 31 ... 44:' branch...
                     |......
                     | 5681 |         case CPU_ID_NIC_QMAN_ARC0...CPU_ID_NIC_QMAN_ARC23:
                     |      |         ~~~~ 
                     |      |         |
                     |      |         (29) ...to here
                     | 5682 |                 return !!(gaudi2->active_nic_arc & BIT_ULL(arc_id - CPU_ID_NIC_QMAN_ARC0));
                     |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                        |
                     |      |                        (30) shift by count '4294967292' here
                     |
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:22,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from drivers/misc/habanalabs/gaudi2/../common/../include/common/cpucp_if.h:12,
                    from drivers/misc/habanalabs/gaudi2/../common/habanalabs.h:11,
                    from drivers/misc/habanalabs/gaudi2/gaudi2P.h:12,
                    from drivers/misc/habanalabs/gaudi2/gaudi2.c:8:
   drivers/misc/habanalabs/gaudi2/gaudi2.c: In function 'gaudi2_set_arc_id_cap':
>> include/vdso/bits.h:8:41: warning: shift by count ('4294967292') >= precision of type ('64') [-Wanalyzer-shift-count-overflow]
       8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                         ^~
   drivers/misc/habanalabs/gaudi2/gaudi2.c:5727:43: note: in expansion of macro 'BIT_ULL'
    5727 |                 gaudi2->active_nic_arc |= BIT_ULL(arc_id - CPU_ID_NIC_QMAN_ARC0);
         |                                           ^~~~~~~
     'gaudi2_compute_reset_late_init': events 1-2
       |
       | 6175 | static int gaudi2_compute_reset_late_init(struct hl_device *hdev)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'gaudi2_compute_reset_late_init'
       |......
       | 6183 |         gaudi2_init_arcs(hdev);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'gaudi2_init_arcs' from 'gaudi2_compute_reset_late_init'
       |
       +--> 'gaudi2_init_arcs': event 3
              |
              | 2627 | static void gaudi2_init_arcs(struct hl_device *hdev)
              |      |             ^~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'gaudi2_init_arcs'
              |
            'gaudi2_init_arcs': events 4-6
              |
              | 2633 |         for (i = CPU_ID_SCHED_ARC0 ; i <= CPU_ID_SCHED_ARC3 ; i++) {
              | 2634 |                 if (gaudi2_is_arc_enabled(hdev, i))
              |      |                 ~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |   |
              |      |                 |   (6) calling 'gaudi2_is_arc_enabled' from 'gaudi2_init_arcs'
              |      |                 (5) ...to here
              |
              +--> 'gaudi2_is_arc_enabled': events 7-9
                     |
                     | 5669 | static bool gaudi2_is_arc_enabled(struct hl_device *hdev, u64 arc_id)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (7) entry to 'gaudi2_is_arc_enabled'
                     |......
                     | 5673 |         switch (arc_id) {
                     |      |         ~~~~~~
                     |      |         |
                     |      |         (8) following 'case 0 ... 5:' branch...
                     |......
                     | 5676 |                 return !!(gaudi2->active_hw_arc & BIT_ULL(arc_id));
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (9) ...to here
                     |
              <------+
              |
            'gaudi2_init_arcs': events 10-13
              |
              | 2634 |                 if (gaudi2_is_arc_enabled(hdev, i))
              |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (10) returning to 'gaudi2_init_arcs' from 'gaudi2_is_arc_enabled'
              |......
              | 2640 |         for (i = GAUDI2_QUEUE_ID_PDMA_0_0 ; i < GAUDI2_QUEUE_ID_CPU_PQ ; i += 4) {
              |      |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                               |
              |      |                                               (11) following 'true' branch (when 'i != 260')...
              | 2641 |                 if (!gaudi2_is_queue_enabled(hdev, i))
              |      |                 ~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |    |
              |      |                 |    (13) calling 'gaudi2_is_queue_enabled' from 'gaudi2_init_arcs'
              |      |                 (12) ...to here
              |
              +--> 'gaudi2_is_queue_enabled': events 14-22
                     |
                     | 5563 | static bool gaudi2_is_queue_enabled(struct hl_device *hdev, u32 hw_queue_id)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (14) entry to 'gaudi2_is_queue_enabled'
                     |......
                     | 5571 |         switch (hw_queue_id) {
                     |      |         ~~~~~~
                     |      |         |
                     |      |         (15) following 'case 0 ... 1:' branch...
                     |......
                     | 5657 |         if (hw_tpc_cap_bit)
                     |      |         ~~ ~ 
                     |      |         |  |
                     |      |         |  (17) following 'false' branch (when 'hw_tpc_cap_bit == 0')...
                     |      |         (16) ...to here
                     |......
                     | 5660 |         if (hw_nic_cap_bit)
                     |      |         ~~ ~ 
                     |      |         |  |
                     |      |         |  (19) following 'false' branch (when 'hw_nic_cap_bit == 0')...
                     |      |         (18) ...to here
                     |......
                     | 5663 |         if (hw_test_cap_bit)
                     |      |         ~~ ~ 
                     |      |         |  |
                     |      |         |  (21) following 'false' branch (when 'hw_test_cap_bit == 0')...
                     |      |         (20) ...to here
                     |......
                     | 5666 |         return !!(gaudi2->hw_cap_initialized & hw_cap_mask);

vim +8 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20  7  #define BIT(nr)			(UL(1) << (nr))
cbdb1f163af2bb Andy Shevchenko   2022-11-28 @8  #define BIT_ULL(nr)		(ULL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
