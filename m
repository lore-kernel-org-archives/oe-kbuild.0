Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877410788
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Aug 2023 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692094672; x=1723630672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FLkQC5V0MRWjtQG4iwG90mWKw/qB1tnXyyIPNjbd2u4=;
  b=bnAgLtQmsQD7ClI/iWi+fMvY2vMXtBWJOGJo2+FnZlZqT4EBVJ9dNuPG
   MznbNxEd2BIMhk0P/3iqP2xhVhc2sOObtpcZngWttStEFdFbCqt4ElrjK
   jYUYPfzntaOl6VMF/BZH0ipHIhtlbUMSD9WcDtiO6BT1rOnrHUNjcySpZ
   FnHGaaEn7aauGFKxGx9AoHEvZWQlq8gpAtTgoDp9djQOeM7TBXSqilEjb
   zpgjRnh81OwVYa76faCUJqQzjVdan2zhbAhP1ZgVs0XyHKFBRV0mDGl7j
   46KtkOpT+/F2zKtG02hIoZGBszdugZl7C5kcizkKFW2ChCEhcTmlORTTQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="352573613"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="352573613"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 03:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="727351540"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="727351540"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Aug 2023 03:17:50 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVr7V-0000s1-36;
	Tue, 15 Aug 2023 10:17:49 +0000
Date: Tue, 15 Aug 2023 18:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hid:for-6.6/nvidia 2/3] drivers/hid/hid-nvidia-shield.c:121:1:
 sparse: sparse: static assertion failed: "sizeof(enum
 thunderstrike_charger_type) == 1"
Message-ID: <202308151816.bcZbOG9c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hid/hid-nvidia-shield.c:121:1: sparse: sparse: static assertion failed: "sizeof(enum thunderstrike_charger_type) == 1""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-input@vger.kernel.org
TO: Rahul Rameshbabu <rrameshbabu@nvidia.com>
CC: Jiri Kosina <jkosina@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.6/nvidia
head:   77fe1fed4741b14ccf5abf19dc794cc5928c1ac8
commit: 3ab196f882377ed5c2a946cf9f7ede8be4727f44 [2/3] HID: nvidia-shield: Add battery support for Thunderstrike
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230815/202308151816.bcZbOG9c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151816.bcZbOG9c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308151816.bcZbOG9c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hid/hid-nvidia-shield.c:104:1: sparse: sparse: static assertion failed: "sizeof(enum thunderstrike_led_state) == 1"
>> drivers/hid/hid-nvidia-shield.c:121:1: sparse: sparse: static assertion failed: "sizeof(enum thunderstrike_charger_type) == 1"
>> drivers/hid/hid-nvidia-shield.c:130:1: sparse: sparse: static assertion failed: "sizeof(enum thunderstrike_charger_state) == 1"
   drivers/hid/hid-nvidia-shield.c:183:1: sparse: sparse: static assertion failed: "sizeof(struct thunderstrike_hostcmd_req_report) == THUNDERSTRIKE_HOSTCMD_REPORT_SIZE"

vim +121 drivers/hid/hid-nvidia-shield.c

09308562d4afb1 Rahul Rameshbabu 2023-06-08   99  
f88af60e74a5b3 Rahul Rameshbabu 2023-05-29  100  enum thunderstrike_led_state {
f88af60e74a5b3 Rahul Rameshbabu 2023-05-29  101  	THUNDERSTRIKE_LED_OFF = 1,
f88af60e74a5b3 Rahul Rameshbabu 2023-05-29  102  	THUNDERSTRIKE_LED_ON = 8,
f88af60e74a5b3 Rahul Rameshbabu 2023-05-29  103  } __packed;
f88af60e74a5b3 Rahul Rameshbabu 2023-05-29 @104  static_assert(sizeof(enum thunderstrike_led_state) == 1);
f88af60e74a5b3 Rahul Rameshbabu 2023-05-29  105  
3ab196f882377e Rahul Rameshbabu 2023-08-07  106  struct thunderstrike_hostcmd_battery {
3ab196f882377e Rahul Rameshbabu 2023-08-07  107  	__le16 voltage_avg;
3ab196f882377e Rahul Rameshbabu 2023-08-07  108  	u8 reserved_at_10;
3ab196f882377e Rahul Rameshbabu 2023-08-07  109  	__le16 thermistor;
3ab196f882377e Rahul Rameshbabu 2023-08-07  110  	__le16 voltage_min;
3ab196f882377e Rahul Rameshbabu 2023-08-07  111  	__le16 voltage_boot;
3ab196f882377e Rahul Rameshbabu 2023-08-07  112  	__le16 voltage_now;
3ab196f882377e Rahul Rameshbabu 2023-08-07  113  	u8 capacity;
3ab196f882377e Rahul Rameshbabu 2023-08-07  114  } __packed;
3ab196f882377e Rahul Rameshbabu 2023-08-07  115  
3ab196f882377e Rahul Rameshbabu 2023-08-07  116  enum thunderstrike_charger_type {
3ab196f882377e Rahul Rameshbabu 2023-08-07  117  	THUNDERSTRIKE_CHARGER_TYPE_NONE = 0,
3ab196f882377e Rahul Rameshbabu 2023-08-07  118  	THUNDERSTRIKE_CHARGER_TYPE_TRICKLE,
3ab196f882377e Rahul Rameshbabu 2023-08-07  119  	THUNDERSTRIKE_CHARGER_TYPE_NORMAL,
3ab196f882377e Rahul Rameshbabu 2023-08-07  120  } __packed;
3ab196f882377e Rahul Rameshbabu 2023-08-07 @121  static_assert(sizeof(enum thunderstrike_charger_type) == 1);
3ab196f882377e Rahul Rameshbabu 2023-08-07  122  
3ab196f882377e Rahul Rameshbabu 2023-08-07  123  enum thunderstrike_charger_state {
3ab196f882377e Rahul Rameshbabu 2023-08-07  124  	THUNDERSTRIKE_CHARGER_STATE_UNKNOWN = 0,
3ab196f882377e Rahul Rameshbabu 2023-08-07  125  	THUNDERSTRIKE_CHARGER_STATE_DISABLED,
3ab196f882377e Rahul Rameshbabu 2023-08-07  126  	THUNDERSTRIKE_CHARGER_STATE_CHARGING,
3ab196f882377e Rahul Rameshbabu 2023-08-07  127  	THUNDERSTRIKE_CHARGER_STATE_FULL,
3ab196f882377e Rahul Rameshbabu 2023-08-07  128  	THUNDERSTRIKE_CHARGER_STATE_FAILED = 8,
3ab196f882377e Rahul Rameshbabu 2023-08-07  129  } __packed;
3ab196f882377e Rahul Rameshbabu 2023-08-07 @130  static_assert(sizeof(enum thunderstrike_charger_state) == 1);
3ab196f882377e Rahul Rameshbabu 2023-08-07  131  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
