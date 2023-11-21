Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2467920DD3
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 17:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaaDRcsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700588824; x=1732124824;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j2TS2oq/BVNZL/OhWZasvDk/tbBCncq4bO4Oxo84rsE=;
  b=MaaDRcsNOxQ0GA4EJ15GiLrV3nrzRNOsIDLu1lu8oLxzyywvISD/3WVb
   d0gtXGOMG5Hae5n+UGQUWDdAsiigRdZNhzNT7B42PLGVu8K4JMEkmhy0x
   bFf6D1Eqpf2lXhpQ8B3LOEHPqStNxwylA71lm96xFfYKgTlOQdUaZ1XfS
   TrqTynCFif01BqnhNC9ad9H9vGmFGWwcBINV2AToNbgtADgmkQbsg0Dgt
   m0nNmmACBc0rzDk/0c3sQcqPLXTfoJaf51ymLj7igR5OCdrhSZ9fo5rEr
   xFEArpV2yL1gjUtpC8CHxTGYvb6BZz8TSxe1mX2w2UVRmWLa6yGds8Ee6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458384989"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="458384989"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 09:47:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857394496"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="857394496"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 09:47:01 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Upu-00085u-39;
	Tue, 21 Nov 2023 17:46:58 +0000
Date: Wed, 22 Nov 2023 01:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] input: touchscreen: imagis: Add touch key support
Message-ID: <202311220121.p8svhQjv-lkp@intel.com>
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
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231112194124.24916-1-duje.mihanovic@skole.hr>
References: <20231112194124.24916-1-duje.mihanovic@skole.hr>
TO: "Duje Mihanović" <duje.mihanovic@skole.hr>
TO: Markuss Broks <markuss.broks@gmail.com>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: phone-devel@vger.kernel.org
CC: Karel Balej <balejk@matfyz.cz>
CC: "Duje Mihanović" <duje.mihanovic@skole.hr>
CC: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Duje,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi/input-touchscreen-imagis-Add-touch-key-support/20231113-034453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20231112194124.24916-1-duje.mihanovic%40skole.hr
patch subject: [PATCH] input: touchscreen: imagis: Add touch key support
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: powerpc64-randconfig-r131-20231121 (https://download.01.org/0day-ci/archive/20231122/202311220121.p8svhQjv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311220121.p8svhQjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311220121.p8svhQjv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/imagis.c:149:16: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     149 |         key_pressed = FIELD_GET(IST3032C_KEY_STATUS_MASK, intr_message);
         |                       ^
   1 error generated.


vim +/FIELD_GET +149 drivers/input/touchscreen/imagis.c

a23ba3c043db9a Markuss Broks  2022-03-14   95  
a23ba3c043db9a Markuss Broks  2022-03-14   96  static irqreturn_t imagis_interrupt(int irq, void *dev_id)
a23ba3c043db9a Markuss Broks  2022-03-14   97  {
a23ba3c043db9a Markuss Broks  2022-03-14   98  	struct imagis_ts *ts = dev_id;
a23ba3c043db9a Markuss Broks  2022-03-14   99  	u32 intr_message, finger_status;
7371770ece2db7 Duje Mihanović 2023-11-12  100  	unsigned int finger_count, finger_pressed, key_pressed;
a23ba3c043db9a Markuss Broks  2022-03-14  101  	int i;
a23ba3c043db9a Markuss Broks  2022-03-14  102  	int error;
a23ba3c043db9a Markuss Broks  2022-03-14  103  
8eb834ae8a9b34 Markuss Broks  2023-10-03  104  	error = imagis_i2c_read_reg(ts, ts->tdata->interrupt_msg_cmd, &intr_message);
a23ba3c043db9a Markuss Broks  2022-03-14  105  	if (error) {
a23ba3c043db9a Markuss Broks  2022-03-14  106  		dev_err(&ts->client->dev,
a23ba3c043db9a Markuss Broks  2022-03-14  107  			"failed to read the interrupt message: %d\n", error);
a23ba3c043db9a Markuss Broks  2022-03-14  108  		goto out;
a23ba3c043db9a Markuss Broks  2022-03-14  109  	}
a23ba3c043db9a Markuss Broks  2022-03-14  110  
a23ba3c043db9a Markuss Broks  2022-03-14  111  	finger_count = (intr_message & IST3038C_FINGER_COUNT_MASK) >>
a23ba3c043db9a Markuss Broks  2022-03-14  112  				IST3038C_FINGER_COUNT_SHIFT;
a23ba3c043db9a Markuss Broks  2022-03-14  113  	if (finger_count > IST3038C_MAX_FINGER_NUM) {
a23ba3c043db9a Markuss Broks  2022-03-14  114  		dev_err(&ts->client->dev,
a23ba3c043db9a Markuss Broks  2022-03-14  115  			"finger count %d is more than maximum supported\n",
a23ba3c043db9a Markuss Broks  2022-03-14  116  			finger_count);
a23ba3c043db9a Markuss Broks  2022-03-14  117  		goto out;
a23ba3c043db9a Markuss Broks  2022-03-14  118  	}
a23ba3c043db9a Markuss Broks  2022-03-14  119  
a23ba3c043db9a Markuss Broks  2022-03-14  120  	finger_pressed = intr_message & IST3038C_FINGER_STATUS_MASK;
a23ba3c043db9a Markuss Broks  2022-03-14  121  
a23ba3c043db9a Markuss Broks  2022-03-14  122  	for (i = 0; i < finger_count; i++) {
8eb834ae8a9b34 Markuss Broks  2023-10-03  123  		if (ts->tdata->protocol_b)
a23ba3c043db9a Markuss Broks  2022-03-14  124  			error = imagis_i2c_read_reg(ts,
8eb834ae8a9b34 Markuss Broks  2023-10-03  125  						    ts->tdata->touch_coord_cmd, &finger_status);
8eb834ae8a9b34 Markuss Broks  2023-10-03  126  		else
8eb834ae8a9b34 Markuss Broks  2023-10-03  127  			error = imagis_i2c_read_reg(ts,
8eb834ae8a9b34 Markuss Broks  2023-10-03  128  						    ts->tdata->touch_coord_cmd + (i * 4),
a23ba3c043db9a Markuss Broks  2022-03-14  129  						    &finger_status);
a23ba3c043db9a Markuss Broks  2022-03-14  130  		if (error) {
a23ba3c043db9a Markuss Broks  2022-03-14  131  			dev_err(&ts->client->dev,
a23ba3c043db9a Markuss Broks  2022-03-14  132  				"failed to read coordinates for finger %d: %d\n",
a23ba3c043db9a Markuss Broks  2022-03-14  133  				i, error);
a23ba3c043db9a Markuss Broks  2022-03-14  134  			goto out;
a23ba3c043db9a Markuss Broks  2022-03-14  135  		}
a23ba3c043db9a Markuss Broks  2022-03-14  136  
a23ba3c043db9a Markuss Broks  2022-03-14  137  		input_mt_slot(ts->input_dev, i);
a23ba3c043db9a Markuss Broks  2022-03-14  138  		input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER,
a23ba3c043db9a Markuss Broks  2022-03-14  139  					   finger_pressed & BIT(i));
a23ba3c043db9a Markuss Broks  2022-03-14  140  		touchscreen_report_pos(ts->input_dev, &ts->prop,
a23ba3c043db9a Markuss Broks  2022-03-14  141  				       (finger_status & IST3038C_X_MASK) >>
a23ba3c043db9a Markuss Broks  2022-03-14  142  						IST3038C_X_SHIFT,
a23ba3c043db9a Markuss Broks  2022-03-14  143  				       finger_status & IST3038C_Y_MASK, 1);
a23ba3c043db9a Markuss Broks  2022-03-14  144  		input_report_abs(ts->input_dev, ABS_MT_TOUCH_MAJOR,
a23ba3c043db9a Markuss Broks  2022-03-14  145  				 (finger_status & IST3038C_AREA_MASK) >>
a23ba3c043db9a Markuss Broks  2022-03-14  146  					IST3038C_AREA_SHIFT);
a23ba3c043db9a Markuss Broks  2022-03-14  147  	}
a23ba3c043db9a Markuss Broks  2022-03-14  148  
7371770ece2db7 Duje Mihanović 2023-11-12 @149  	key_pressed = FIELD_GET(IST3032C_KEY_STATUS_MASK, intr_message);
7371770ece2db7 Duje Mihanović 2023-11-12  150  
7371770ece2db7 Duje Mihanović 2023-11-12  151  	input_report_key(ts->input_dev, KEY_APPSELECT, (key_pressed & BIT(0)));
7371770ece2db7 Duje Mihanović 2023-11-12  152  	input_report_key(ts->input_dev, KEY_BACK, (key_pressed & BIT(1)));
7371770ece2db7 Duje Mihanović 2023-11-12  153  
a23ba3c043db9a Markuss Broks  2022-03-14  154  	input_mt_sync_frame(ts->input_dev);
a23ba3c043db9a Markuss Broks  2022-03-14  155  	input_sync(ts->input_dev);
a23ba3c043db9a Markuss Broks  2022-03-14  156  
a23ba3c043db9a Markuss Broks  2022-03-14  157  out:
a23ba3c043db9a Markuss Broks  2022-03-14  158  	return IRQ_HANDLED;
a23ba3c043db9a Markuss Broks  2022-03-14  159  }
a23ba3c043db9a Markuss Broks  2022-03-14  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
