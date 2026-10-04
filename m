Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789E831A55B
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 22:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791151442; cv=none; b=XkmjLUUTn+m8IXvCk7RNFNkT+OLt4Ykh4vZ9cpwLt8kYtRyreHErR5dHalO9rZ7yh77KmHHtHWxPcr6hEwv3cCr8LjT59N0CtTlmRB1wZRO9eL3DD4AVk9BfPQg/DW0CLXHWEhjOP5Kyf9zegG9ZVWmG0eT4jOeTBVu0V5KVbL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791151442; c=relaxed/simple;
	bh=yK7j3mPubUJdiyrlwly1IxPBra+Td4736D9zvsa1rH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nt6gGHT9E6bi4JmUWhur/qUjTb6GU8nymrTCfAFhCoeECFtm2BPzD963BUdv6EAlNc46XxaTzMvvXR4yI6Rja7OD0iDanxSRqbTIwRoCeyK5VluhTb3pbjPkLOx1+ZdUruCdanp2EzIZ6rhinjXsH7gj49JUP0nT6bXwafxcozA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDp5eZjV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDp5eZjV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791151440; x=1822687440;
  h=date:from:to:cc:subject:message-id;
  bh=yK7j3mPubUJdiyrlwly1IxPBra+Td4736D9zvsa1rH0=;
  b=YDp5eZjVl4fj7CEKdfsh/oYcy5atSjDCRe3jFeUgkNw243neGXLFhTt8
   N50GkCtHIMkLq0SLy92ZrSQas3F4tINd69kCyL4Td/MiAaCaU5500Kthb
   U/7czBXcLckIWaV/fR4CeqPxQzkQD5RARxkICzytnAZ2YnYCjNXNkKSyy
   hwtZa7cLQr1FfmY2JaBlK7i4r8lHg7XBXz4pBFglqn07XHmuh9DyOlwPB
   5nTOsjMash7Z9r8I+YS7vWY++dX8SDWRcPXTdAFRV86gWoLYXALySERR9
   d35FG4sviWdZWwe1Ai/xv6yEIppu7kiVAsJMesTyrnBz0snTL8L3AUt3P
   g==;
X-CSE-ConnectionGUID: pXiSn5ZsQt6jmgjyeoRMzQ==
X-CSE-MsgGUID: kuVwwKh0R6akrjWlizYTbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91848922"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91848922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 15:04:00 -0700
X-CSE-ConnectionGUID: Bufr6SvqQFmwQLiJSrELaA==
X-CSE-MsgGUID: HBgE/Y2oRqejtlByg3ZnGA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 04 Oct 2026 15:03:59 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDUJJ-000000000Qx-18mP;
	Sun, 04 Oct 2026 22:03:57 +0000
Date: Mon, 05 Oct 2026 00:03:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v7.4 13/13]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dtb:
 /soc@0/mmc@10808000: failed to match any schema with compatible:
 ['altr,agilex5-sd6hc', 'cdns,sd6hc']
Message-ID: <202610042301.ir4evI8j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v7.4
head:   29f11fb83ad5dc06af30a92e5c16988b44cec984
commit: 29f11fb83ad5dc06af30a92e5c16988b44cec984 [13/13] arm64: dts: agilex5: add support for debug daughter card
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2403-20261002 (https://download.01.org/0day-ci/archive/20261004/202610042301.ir4evI8j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610042301.ir4evI8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610042301.ir4evI8j-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dtb: eeprom@0 (microchip,25aa128): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,25aa128', 'atmel,at25'] is too long
   	'microchip,25aa128' is not one of ['anvo,anv32c81w', 'anvo,anv32e61w', 'atmel,at25256B', 'fujitsu,mb85rs1mt', 'fujitsu,mb85rs256', 'fujitsu,mb85rs64', 'microchip,25aa010a', 'microchip,at25160bn', 'microchip,25lc040', 'st,m95m02', 'st,m95256', 'st,m95640', 'cypress,fm25']
   	'atmel,at25' was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dtb: /soc@0/spi@10da4000/eeprom@0: failed to match any schema with compatible: ['microchip,25aa128', 'atmel,at25']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dtb: /soc@0/bus@11000000/usb@0: failed to match any schema with compatible: ['altr,agilex5-dwc3']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
