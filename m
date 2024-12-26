Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F6120EB
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 01:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735177373; cv=none; b=t1NpkRPlMSWdar3X5jedk4w54zZe6X/6swwPlPimyXYRIjzSCQYmwUZ9XqSYv/9nIsXGb3a4sG52WY7adn2Sx6rdj34GA/w9uBCYqhbJl/imghc1+iBSME4yLR3RvskZSJBJpc4jurJg9QeDm3+qwuAST23tk3p69hmpr0j37KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735177373; c=relaxed/simple;
	bh=rD/oikV9Ev1rMQFPAn6je6z6glTazKMjMfgB9SGFeJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C07RAFnL7B1j+h28cYbO6nLkViN9wujKlpa2lq3mgo1muC7PHpWmJxr3ElRuexOIKXWAQNOMykRVU9PoWVebM4areN5H0NAW3mQbwN7npHwJFLaq/Wqf92emjQVuaAH3uQAlFSQKMGnRkAU8BlB6UDek2+4WPg/YhaX9Q8kzs6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrPbdl+l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrPbdl+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735177372; x=1766713372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rD/oikV9Ev1rMQFPAn6je6z6glTazKMjMfgB9SGFeJc=;
  b=IrPbdl+l0yc/MMgPON3Ha7xOeEMxhETzRbd6GH/aIT4+q6CHbN1HiOBC
   jLfAoCQyIqnYizvF+0JhHEDIWwf4aERUeyPa4SFfreiSbiwTeg/r4qqKO
   U6M8aXhmxXr96nHUbxyvBOGv7rci+2ffucOaUz8h5r0gt7c83wyCUK5LD
   m1w3+zjOVy38RWDV2kWB2c78e/CyQBRkloehLeSQd4225zNRIdEitv1cp
   tT8iJSlAKJP2kbRHvjl73xtaeUZK3Qanp3il5zI4sdayEXDkokeyapwnd
   Br7LolGhRtEJlRl4cc//O4KFMJT8Xp3pw/5BZQri1R5yeCTF3b7FCEjkf
   g==;
X-CSE-ConnectionGUID: J3ya+E9mQ1u/pq9mq740wg==
X-CSE-MsgGUID: aOGKgFMrSduzIZ5cFzk2jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46285125"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="46285125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 17:42:52 -0800
X-CSE-ConnectionGUID: 1yPsa9PhSnakdUoy0hvibQ==
X-CSE-MsgGUID: qBKSyTTpTCaoj6znSwXHFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100640241"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Dec 2024 17:42:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQctj-0002Gs-0b;
	Thu, 26 Dec 2024 01:42:47 +0000
Date: Thu, 26 Dec 2024 09:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 3/9]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb:
 /soc/usb@c800b000: failed to match any schema with compatible:
 ['intel,ixp4xx-udc']
Message-ID: <202412260929.yhVzecDO-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-netgear-wgr826v
head:   417131a0c509bba7b4db3f1301a0205ebb4ab0d6
commit: 6eb7bf44970b29ea5202340d81c9af406f0cf7c9 [3/9] ARM: dts: Add Netgear WGR826V Device Tree
:::::: branch date: 5 days ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241226/202412260929.yhVzecDO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260929.yhVzecDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412260929.yhVzecDO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: ethernet@c800c000: 'intel,npe' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml#
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /spi/switch@0: failed to match any schema with compatible: ['micrel,ks8995']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
