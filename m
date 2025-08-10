Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958691C4A10
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 05:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754802848; cv=none; b=V8TiIrIR+y25yA5GaNW+dK4AZ8ULVUBtpb1aGwMo/AxLzFARm/cFOeu5uWrRoSSEBKhHhl1NPMpIbzk9nzrWOTOkpR2En0SjiwyOc3TFgM4ojbiPBe4yYHJYomF1gIJAmRcEPkT1Tko4CaYSkIOg2UGJyQObMVvM2umhJOR04QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754802848; c=relaxed/simple;
	bh=QORxmFzfDIXBNBG1Mn3UCsG7791e1n4QFlTDzZODPic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GrrB6ymzPofREZhe0uIU/jOhNUoKtVyXXO5S0PIeyAbeXyh/VUFxeDXUsIq8tGyJoQPUsP9Yj/bAk/KXMb8GbKhzaC2pixs8MEtgacD+rukQtX3/wAIiQZB90iIf7EGegwhYcSaiT9iqpfp2gcc4qg6DP2eEkCimkENP9pGE1pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLo/dytc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLo/dytc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754802847; x=1786338847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QORxmFzfDIXBNBG1Mn3UCsG7791e1n4QFlTDzZODPic=;
  b=CLo/dytcxyVJZqDf5Rm5100dOQyanunY4Y0zh4Gj30INHvR4uXIYH3ce
   ZcuPytcCKDBGudJunKw4Dc5lIeydMy78y3JIM0KoEQv9mC6Wb11sEQsY/
   vnrNjitGgJPiQLrR8JLCxCFlKss0LvvgKTT9s+HlSdspANF1c0HFx11bW
   cU3wg70E6RgqEZy0ZNI76bPQqg111UK2YSI5G7q0FbBsr87fF/bgEzycx
   gD0FuePS0IbL9ijOHZP5qYJHyK242QW6IxVl8mZjNQlxDwVUm4e9NTF7E
   edu2BsmhYSDQKAIark5qQA9Y4morn5F8v/Mz/xgUHXhm4cam3wuEVSi6C
   g==;
X-CSE-ConnectionGUID: SaJBGvW7SyC+NHek50/3Tg==
X-CSE-MsgGUID: ajHRDiP6TtKFrea9yZWqwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="56993215"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56993215"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 22:14:06 -0700
X-CSE-ConnectionGUID: q3c1GNmBSkmDplpxzSAqXQ==
X-CSE-MsgGUID: 6MxTxwelQ+S/3Dt1ClhmLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169845906"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 09 Aug 2025 22:14:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukyNe-0005Ai-1f;
	Sun, 10 Aug 2025 05:14:02 +0000
Date: Sun, 10 Aug 2025 13:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [arnd-playground:to_build 18/21] drivers/nfc/s3fwrn5/i2c.c:167
 s3fwrn5_i2c_parse_dt() warn: passing zero to 'PTR_ERR'
Message-ID: <202508101336.NYrzRmBN-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   c0a2b3cd5b78ddb721e53baf675d7164a118bc2d
commit: ffbe497edf85ef06fcbc6c8687a15b491e2a4829 [18/21] nfc: s3fwrn5: convert to gpio descriptors
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250810 (https://download.01.org/0day-ci/archive/20250810/202508101336.NYrzRmBN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508101336.NYrzRmBN-lkp@intel.com/

smatch warnings:
drivers/nfc/s3fwrn5/i2c.c:167 s3fwrn5_i2c_parse_dt() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +167 drivers/nfc/s3fwrn5/i2c.c

c04c674fadeb4a Robert Baldyga      2015-08-20  148  
c04c674fadeb4a Robert Baldyga      2015-08-20  149  static int s3fwrn5_i2c_parse_dt(struct i2c_client *client)
c04c674fadeb4a Robert Baldyga      2015-08-20  150  {
c04c674fadeb4a Robert Baldyga      2015-08-20  151  	struct s3fwrn5_i2c_phy *phy = i2c_get_clientdata(client);
ffbe497edf85ef Arnd Bergmann       2025-07-22  152  	struct device *dev = &client->dev;
c04c674fadeb4a Robert Baldyga      2015-08-20  153  
ffbe497edf85ef Arnd Bergmann       2025-07-22  154  	phy->common.gpio_en = devm_gpiod_get(dev, "en", GPIOD_OUT_HIGH);
ffbe497edf85ef Arnd Bergmann       2025-07-22  155  	if (IS_ERR(phy->common.gpio_en)) {
1995c4cc3ae407 Krzysztof Kozlowski 2020-09-10  156  		/* Support also deprecated property */
ffbe497edf85ef Arnd Bergmann       2025-07-22  157  		phy->common.gpio_en = devm_gpiod_get(dev, "s3fwrn5,en", GPIOD_OUT_HIGH);
ffbe497edf85ef Arnd Bergmann       2025-07-22  158  		if (IS_ERR(phy->common.gpio_en))
ffbe497edf85ef Arnd Bergmann       2025-07-22  159  			return PTR_ERR(phy->common.gpio_en);
1995c4cc3ae407 Krzysztof Kozlowski 2020-09-10  160  	}
c04c674fadeb4a Robert Baldyga      2015-08-20  161  
ffbe497edf85ef Arnd Bergmann       2025-07-22  162  	phy->common.gpio_fw_wake = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
ffbe497edf85ef Arnd Bergmann       2025-07-22  163  	if (IS_ERR(phy->common.gpio_fw_wake)) {
1995c4cc3ae407 Krzysztof Kozlowski 2020-09-10  164  		/* Support also deprecated property */
ffbe497edf85ef Arnd Bergmann       2025-07-22  165  		phy->common.gpio_fw_wake = devm_gpiod_get(dev, "s3fwrn5,fw", GPIOD_OUT_LOW);
ffbe497edf85ef Arnd Bergmann       2025-07-22  166  		if (IS_ERR(phy->common.gpio_fw_wake))
ffbe497edf85ef Arnd Bergmann       2025-07-22 @167  			return PTR_ERR(phy->common.gpio_en);
1995c4cc3ae407 Krzysztof Kozlowski 2020-09-10  168  	}
c04c674fadeb4a Robert Baldyga      2015-08-20  169  
c04c674fadeb4a Robert Baldyga      2015-08-20  170  	return 0;
c04c674fadeb4a Robert Baldyga      2015-08-20  171  }
c04c674fadeb4a Robert Baldyga      2015-08-20  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
