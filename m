Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD087C
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Feb 2023 02:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676340773; x=1707876773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2TRLeRAB75KjRvV4fjSdGWwL3ZTG+ZL7qO6gg9ufi2Q=;
  b=RAhuO2Jf6GVALbKVFfWjxVoBeugJTlGmbJRihaKR2nuUiF+kbGGXCc1O
   INOCQQRiSp6f+tnDhu/oIqc0Ptg4T6ADDol/59t1qSXW4GxPWe1pH9QNk
   0B/ROaFceLWDEr0yGW6BYxSLjAuu9WKePev3u0VGOh30fzI0NCFRVZd0D
   8H7zH0e9W8Gkf8cUa/pq+a7/Z7SRJsHqYHB5qVDmRWLMpNMRJH1jHpfSF
   n0XsiDaNx/mGMJEvU1+sXTH5Lk9dd2Bdi9W9RT1XO+8GsHIRvxCGrf2v5
   Q2w733R8wE9uHZxG+IeOry5/Pso/cDQooz/CnkqaDDMebfxmtvq03H8cA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358465492"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="358465492"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 18:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914564583"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="914564583"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Feb 2023 18:12:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRkoL-00088f-0Y;
	Tue, 14 Feb 2023 02:12:49 +0000
Date: Tue, 14 Feb 2023 10:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/2] HID: asus: use spinlock to safely schedule workers
Message-ID: <202302141039.anZLT940-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230125-hid-unregister-leds-v3-2-0a52ac225e00@diag.uniroma1.it>
References: <20230125-hid-unregister-leds-v3-2-0a52ac225e00@diag.uniroma1.it>
TO: Pietro Borrello <borrello@diag.uniroma1.it>
TO: Jiri Kosina <jikos@kernel.org>
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
TO: Hanno Zulla <kontakt@hanno.de>
TO: Carlo Caione <carlo@endlessm.com>
CC: Cristiano Giuffrida <c.giuffrida@vu.nl>
CC: "Bos, H.J." <h.j.bos@vu.nl>
CC: Jakob Koschel <jkl820.git@gmail.com>
CC: Roderick Colenbrander <roderick@gaikai.com>
CC: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Pietro Borrello <borrello@diag.uniroma1.it>

Hi Pietro,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 2241ab53cbb5cdb08a6b2d4688feb13971058f65]

url:    https://github.com/intel-lab-lkp/linux/commits/Pietro-Borrello/HID-bigben-use-spinlock-to-safely-schedule-workers/20230210-080058
base:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
patch link:    https://lore.kernel.org/r/20230125-hid-unregister-leds-v3-2-0a52ac225e00%40diag.uniroma1.it
patch subject: [PATCH v3 2/2] HID: asus: use spinlock to safely schedule workers
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230214/202302141039.anZLT940-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302141039.anZLT940-lkp@intel.com/

smatch warnings:
drivers/hid/hid-asus.c:532 asus_kbd_backlight_work() warn: sleeping in atomic context

vim +532 drivers/hid/hid-asus.c

af22a610bc3850 Carlo Caione    2017-04-06  520  
af22a610bc3850 Carlo Caione    2017-04-06  521  static void asus_kbd_backlight_work(struct work_struct *work)
af22a610bc3850 Carlo Caione    2017-04-06  522  {
af22a610bc3850 Carlo Caione    2017-04-06  523  	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
af22a610bc3850 Carlo Caione    2017-04-06  524  	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
af22a610bc3850 Carlo Caione    2017-04-06  525  	int ret;
31e578b641b3b3 Pietro Borrello 2023-02-09  526  	unsigned long flags;
af22a610bc3850 Carlo Caione    2017-04-06  527  
31e578b641b3b3 Pietro Borrello 2023-02-09  528  	spin_lock_irqsave(&led->lock, flags);
af22a610bc3850 Carlo Caione    2017-04-06  529  
af22a610bc3850 Carlo Caione    2017-04-06  530  	buf[4] = led->brightness;
af22a610bc3850 Carlo Caione    2017-04-06  531  
af22a610bc3850 Carlo Caione    2017-04-06 @532  	ret = asus_kbd_set_report(led->hdev, buf, sizeof(buf));
af22a610bc3850 Carlo Caione    2017-04-06  533  	if (ret < 0)
af22a610bc3850 Carlo Caione    2017-04-06  534  		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
31e578b641b3b3 Pietro Borrello 2023-02-09  535  
31e578b641b3b3 Pietro Borrello 2023-02-09  536  	spin_unlock_irqrestore(&led->lock, flags);
af22a610bc3850 Carlo Caione    2017-04-06  537  }
af22a610bc3850 Carlo Caione    2017-04-06  538  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
