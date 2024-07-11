Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2FF16132B
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720706912; cv=none; b=fuRB04d2sjlCCAiDMAsNB66NzY5qzdkQK99RGakF92ccMwDtz4/h3aB7eVDEf76mDeKkVn4+PSCclgcaDw/8rIoINQWj62iHU97+7V9LEO8Tf6E390Piv28P5qOUQ/amheFU6u8Id5Ch3Qw+l6muglYADzDbqiYeaGOi6slKIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720706912; c=relaxed/simple;
	bh=DoHQXQ88g4EvNkEMu3q7DNXFrK+oavVv0DBTkrnDTHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qAsuXvz5llJZgjfEwa8d+UukZQjgblQFUDCV8DSITHz3SaFiEwFHIJvrr9/SAJyPh8fBn3Gfrrt0bYRyCB8+mpxItQlR7Hi7n0R63oE/NBN62eU3Lq3J6hiKWygY2hynEeP4Qy3a3D45GMbDKHGue5+0luXWxvXVEIlEwCRRDfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N24X9nCU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N24X9nCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720706910; x=1752242910;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DoHQXQ88g4EvNkEMu3q7DNXFrK+oavVv0DBTkrnDTHA=;
  b=N24X9nCU1BrDmI9iiHmj3MjXeuV7K+iOBf4cWasWq44MLJV6lGoSILxu
   CjM1QoBkVrcktx4Mek/U6rUUvP9ZkdMLMqkvR2EILUENAPJ+7fwA+dTo+
   4ARb7z64H1/VXWnVAbU2Fj/J109JpxWfJYGnoT7qtTYCBiNIcHYp7EQL0
   WAFME1pa4eyhs6Hkgta4sc18AksEbd46fmOlIRYZBcp7r0/ug+7HkRpkU
   E7gTmtXKKkcY1yuA4nSwOOAghV/ulAAfYBKp9XaaKjzmsbG6Wld1qP+xw
   +5xtgBP1hMsH6B7ztUKI2mr+VP5UdXU9IUHE90TJgZiMngx0gnd7Ta94r
   g==;
X-CSE-ConnectionGUID: 84bzATlmQRSvUwJpCWta5g==
X-CSE-MsgGUID: ZcQpU2urR4SqfS8fxktqgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18294502"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="18294502"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 07:08:28 -0700
X-CSE-ConnectionGUID: 6YmzAOfZThiAIoYfD5vL9w==
X-CSE-MsgGUID: a6py20wgTxyO3cSK5VfIGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53161524"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jul 2024 07:08:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRuTA-000ZM6-39;
	Thu, 11 Jul 2024 14:08:24 +0000
Date: Thu, 11 Jul 2024 22:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/wfamnae-next20240710-cbc 1/13]
 drivers/leds/leds-cros_ec.c:70:40: warning: structure containing a flexible
 array member is not at the end of another structure
Message-ID: <202407112258.ZvWw5uJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240710-cbc
head:   73efb8d9b6a2ba4b07021861a1760ec742ddf432
commit: d692eacf807861f523e66bd7d1c60f5dc254f4c6 [1/13] Makefile: Enable -Wflex-array-member-not-at-end globally
:::::: branch date: 8 hours ago
:::::: commit date: 9 hours ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240711/202407112258.ZvWw5uJq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112258.ZvWw5uJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407112258.ZvWw5uJq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-cros_ec.c: In function 'cros_ec_led_send_cmd':
>> drivers/leds/leds-cros_ec.c:70:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      70 |                 struct cros_ec_command msg;
         |                                        ^~~


vim +70 drivers/leds/leds-cros_ec.c

8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  64  
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  65  static int cros_ec_led_send_cmd(struct cros_ec_device *cros_ec,
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  66  				union cros_ec_led_cmd_data *arg)
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  67  {
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  68  	int ret;
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  69  	struct {
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13 @70  		struct cros_ec_command msg;
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  71  		union cros_ec_led_cmd_data data;
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  72  	} __packed buf = {
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  73  		.msg = {
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  74  			.version = 1,
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  75  			.command = EC_CMD_LED_CONTROL,
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  76  			.insize  = sizeof(arg->resp),
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  77  			.outsize = sizeof(arg->req),
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  78  		},
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  79  		.data.req = arg->req
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  80  	};
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  81  
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  82  	ret = cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  83  	if (ret < 0)
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  84  		return ret;
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  85  
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  86  	arg->resp = buf.data.resp;
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  87  
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  88  	return 0;
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  89  }
8d6ce6f3ec9d5f Thomas Weiﬂschuh 2024-06-13  90  

:::::: The code at line 70 was first introduced by commit
:::::: 8d6ce6f3ec9d5f384e3eac92e43cfeac7a36e6b1 leds: Add ChromeOS EC driver

:::::: TO: Thomas Weiﬂschuh <linux@weissschuh.net>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
