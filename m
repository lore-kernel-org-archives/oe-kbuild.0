Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6A917B4E0
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726653916; cv=none; b=u/RqaN1vBjETfhLGnkuL54ABfS1XoxEzwjCdv2nd1VXA+HVvr5PiXfkrauaBLG2W6yPL3cqXC0PyTG13NEQEt1lueDCQosEf4AqxZbB1CJ4uCTTwtiP1LMx2a5FAJnTi8BpeRkyW3XbXWH2HfQAv0IXpoQ6QA1YoHZMeGHFn9Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726653916; c=relaxed/simple;
	bh=YW9bY9WVEJm/G3aIDuxIJ55nDs+Arr6OOhaEXfKRq0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/TEsPlzT9J4EKPFAdiawSl/TaTgC0BuTqSpK29q/LtT6FLwYlGMX0FqtDiz08uz2Se70pz8Oqh7Qy6xdisqzHFesndQwlViY6+DJTL0wSzcTWVaDVOaglaNAj0l6uIA8xCtfoE520Dn+dBzEXWAwnuPz9tI14QfIArkYcWqohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ft3d4hXY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ft3d4hXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726653914; x=1758189914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YW9bY9WVEJm/G3aIDuxIJ55nDs+Arr6OOhaEXfKRq0o=;
  b=Ft3d4hXYSEt0b6dGk6v8SOc3+Io4eEGK74aTKpVQst/IZpObgbmGoabV
   Bx+db9Y1Xgjp0MP3C8OiX+tPC/GEm8k+Zu4CocGxpoOaBI/YguYt27335
   UHwHAkgeXNkXEXXB4lcDlGy/iDe4R+w82Y2wikIrYzY9bzcFWsOmlJL+c
   Y1GBd5d+vkSEutQUWFUUqj/rGi8MdPCHYaZqTI7olzPYLZGJTdPVbFORX
   RQYYhEmh5v9vCfFKGoqQgSeThJOxbfMlSx3ZqgcFxNu927BUBgFdr5/nF
   8kB8bduHZ8HlRYDeUtkIAnAbbCWxVV6IX19K7xcJTo/q2O8u755MzGim3
   g==;
X-CSE-ConnectionGUID: PY6hoVxNRli2psQzkbBC7Q==
X-CSE-MsgGUID: U2kP29RFQG23FkUZ3XAaxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29299362"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="29299362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 03:05:13 -0700
X-CSE-ConnectionGUID: ZLUOnI2GRc6fjy8IUEgZlw==
X-CSE-MsgGUID: 8o1hqAqDScqU+Bsbs877Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="92782964"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Sep 2024 03:05:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqrYc-000C9m-1q;
	Wed, 18 Sep 2024 10:05:10 +0000
Date: Wed, 18 Sep 2024 18:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.1-main 56/235]
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts:49.10-103.4:
 Warning (unit_address_vs_reg): /ethernet@1b100000/mdio-bus/switch1: node has
 a reg or ranges property, but no unit name
Message-ID: <202409181806.y7aTUGdD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.1-main
head:   d77f27a08153c2b1e4bf61b38e4b20ecd44c047f
commit: 837f2016b18885de8089f8fad5300edf7728dc14 [56/235] arm64: dts: mediatek: add r64 v0.1 variant with rtl8367 switch
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 9 months ago
config: arm64-randconfig-001-20240918 (https://download.01.org/0day-ci/archive/20240918/202409181806.y7aTUGdD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409181806.y7aTUGdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409181806.y7aTUGdD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622.dtsi:895.27-909.4: Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts:49.10-103.4: Warning (unit_address_vs_reg): /ethernet@1b100000/mdio-bus/switch1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts:75.9-77.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7622.dtsi:530.22-541.4: Warning (unique_unit_address): /nfi@1100d000: duplicate unit-address (also used in node /spi@1100d000)

vim +49 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64-rtl8367.dts

837f2016b18885d Frank Wunderlich 2022-01-05  47  
837f2016b18885d Frank Wunderlich 2022-01-05  48  &mdio {
837f2016b18885d Frank Wunderlich 2022-01-05 @49  	switch1 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
