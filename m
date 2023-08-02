Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A0D1869
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Aug 2023 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690961444; x=1722497444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCcpEFuH6dnxjHClPjg27ausyDAiWsrNvnPdQLbn4Ts=;
  b=Ir35M2CyxhUf+H3UEHei8C0sHDyKcXOXsPZ4xjtp+dI5Ql7UQJQGANYw
   dDODbHm6iaYroHlCk8KhnLT8QBWAlwF1P2t8AqYetHj5w/8XB0ITiW3S9
   kiXCu8FK6ikjirOMpDVMkT8Zfjy7rKDzg+w6wdpM9+vSbkOoLr1xDkyCw
   BwLSMkgLgnJbeo7+qeDYfiqY2Ux9MLviBxixujyXQup1kXc8Ln3Bx/Mug
   fHDX/vAR8gmco6uApDulTiEqnWLzlUZsqRDIvQhl1HfD17elUUWZq1TPA
   PiOnAXxb7EEpaEGjm/Nix6W+Tp7X8vzRjJeFySGgtaikcbeXGqvb22xgc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372237462"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="372237462"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 00:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758642774"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="758642774"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2023 00:30:18 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR6JF-0000zp-2h;
	Wed, 02 Aug 2023 07:30:17 +0000
Date: Wed, 2 Aug 2023 15:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hid/hid-nvidia-shield.c:61:1: sparse: sparse: static
 assertion failed: "sizeof(enum thunderstrike_led_state) == 1"
Message-ID: <202308021501.T2U3kOwK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hid/hid-nvidia-shield.c:61:1: sparse: sparse: static assertion failed: "sizeof(enum thunderstrike_led_state) == 1""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rahul Rameshbabu <rrameshbabu@nvidia.com>
CC: Jiri Kosina <jkosina@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
commit: f88af60e74a5b31be1551ffb9af216c8a800501c HID: nvidia-shield: Support LED functionality for Thunderstrike
date:   8 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: nios2-randconfig-r072-20230802 (https://download.01.org/0day-ci/archive/20230802/202308021501.T2U3kOwK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021501.T2U3kOwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308021501.T2U3kOwK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-nvidia-shield.c:61:1: sparse: sparse: static assertion failed: "sizeof(enum thunderstrike_led_state) == 1"
   drivers/hid/hid-nvidia-shield.c:86:1: sparse: sparse: static assertion failed: "sizeof(struct thunderstrike_hostcmd_resp_report) == THUNDERSTRIKE_HOSTCMD_REPORT_SIZE"
>> drivers/hid/hid-nvidia-shield.c:106:1: sparse: sparse: static assertion failed: "sizeof(struct thunderstrike_hostcmd_req_report) == THUNDERSTRIKE_HOSTCMD_REPORT_SIZE"

vim +61 drivers/hid/hid-nvidia-shield.c

09308562d4afb1a Rahul Rameshbabu 2023-06-08   56  
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   57  enum thunderstrike_led_state {
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   58  	THUNDERSTRIKE_LED_OFF = 1,
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   59  	THUNDERSTRIKE_LED_ON = 8,
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   60  } __packed;
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29  @61  static_assert(sizeof(enum thunderstrike_led_state) == 1);
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   62  
09308562d4afb1a Rahul Rameshbabu 2023-06-08   63  struct thunderstrike_hostcmd_board_info {
09308562d4afb1a Rahul Rameshbabu 2023-06-08   64  	__le16 revision;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   65  	__le16 serial[7];
09308562d4afb1a Rahul Rameshbabu 2023-06-08   66  };
09308562d4afb1a Rahul Rameshbabu 2023-06-08   67  
09308562d4afb1a Rahul Rameshbabu 2023-06-08   68  struct thunderstrike_hostcmd_haptics {
09308562d4afb1a Rahul Rameshbabu 2023-06-08   69  	u8 motor_left;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   70  	u8 motor_right;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   71  };
09308562d4afb1a Rahul Rameshbabu 2023-06-08   72  
09308562d4afb1a Rahul Rameshbabu 2023-06-08   73  struct thunderstrike_hostcmd_resp_report {
09308562d4afb1a Rahul Rameshbabu 2023-06-08   74  	u8 report_id; /* THUNDERSTRIKE_HOSTCMD_RESP_REPORT_ID */
09308562d4afb1a Rahul Rameshbabu 2023-06-08   75  	u8 cmd_id;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   76  	u8 reserved_at_10;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   77  
09308562d4afb1a Rahul Rameshbabu 2023-06-08   78  	union {
09308562d4afb1a Rahul Rameshbabu 2023-06-08   79  		struct thunderstrike_hostcmd_board_info board_info;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   80  		struct thunderstrike_hostcmd_haptics motors;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   81  		__le16 fw_version;
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   82  		enum thunderstrike_led_state led_state;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   83  		u8 payload[30];
09308562d4afb1a Rahul Rameshbabu 2023-06-08   84  	};
09308562d4afb1a Rahul Rameshbabu 2023-06-08   85  } __packed;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   86  static_assert(sizeof(struct thunderstrike_hostcmd_resp_report) ==
09308562d4afb1a Rahul Rameshbabu 2023-06-08   87  	      THUNDERSTRIKE_HOSTCMD_REPORT_SIZE);
09308562d4afb1a Rahul Rameshbabu 2023-06-08   88  
09308562d4afb1a Rahul Rameshbabu 2023-06-08   89  struct thunderstrike_hostcmd_req_report {
09308562d4afb1a Rahul Rameshbabu 2023-06-08   90  	u8 report_id; /* THUNDERSTRIKE_HOSTCMD_REQ_REPORT_ID */
09308562d4afb1a Rahul Rameshbabu 2023-06-08   91  	u8 cmd_id;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   92  	u8 reserved_at_10;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   93  
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   94  	union {
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   95  		struct {
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   96  			u8 update;
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   97  			enum thunderstrike_led_state state;
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29   98  		} led;
09308562d4afb1a Rahul Rameshbabu 2023-06-08   99  		struct {
09308562d4afb1a Rahul Rameshbabu 2023-06-08  100  			u8 update;
09308562d4afb1a Rahul Rameshbabu 2023-06-08  101  			struct thunderstrike_hostcmd_haptics motors;
09308562d4afb1a Rahul Rameshbabu 2023-06-08  102  		} haptics;
f88af60e74a5b31 Rahul Rameshbabu 2023-05-29  103  	};
09308562d4afb1a Rahul Rameshbabu 2023-06-08  104  	u8 reserved_at_30[27];
09308562d4afb1a Rahul Rameshbabu 2023-06-08  105  } __packed;
09308562d4afb1a Rahul Rameshbabu 2023-06-08 @106  static_assert(sizeof(struct thunderstrike_hostcmd_req_report) ==
09308562d4afb1a Rahul Rameshbabu 2023-06-08  107  	      THUNDERSTRIKE_HOSTCMD_REPORT_SIZE);
09308562d4afb1a Rahul Rameshbabu 2023-06-08  108  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
