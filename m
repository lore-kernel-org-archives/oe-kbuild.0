Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E2F78F4C
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 17:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754759077; cv=none; b=JzncjS1vI9SriZdUL19PphOwmGKMO9Tjiugl8hD8JmfW6i1XTJZt9FbrNVXHmB5/KDiTfxyQX6H5lu1ki88muBn+kwIDdRcOBHr+1jlKOhTsMxjU/9xD/LqVEnOWD/jHVa8h35HkCN4bg4mH6t/n4StCz8mZvHsV2EB1yQlPlJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754759077; c=relaxed/simple;
	bh=C24G0/iaUHNv5HhuRIXIW/G0r4VtevLXwNyRjFcnkWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQFAWFMQK3hM7jP3ttlteFrA6BsvgkwNxOTb5AmEie3xeayZFfncwCGt2Aa4yRabMSybWdlR/1m4oGO8T7HCYfUSVhR/oAIkbVbfTDaULI7TbfZUsj4EFJfdzC14d0rblkHk/hexE+SCokWxiFpfV5ehHawIU4UEt2rzo9YdfWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2+9+478; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2+9+478"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754759076; x=1786295076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C24G0/iaUHNv5HhuRIXIW/G0r4VtevLXwNyRjFcnkWE=;
  b=Q2+9+478zUYYEwRoaoyvBeOVjwJJVd+6ULi7d32MXSRPpZ5AvoRyBlvI
   EjpngoLkeVCQ4Sz1smqR4PRh6s7NuHbmjq+/DM9SIEyLqTx11qyPmVgLc
   qjB+Wns+wxETlKYRAReCa0WgEaUjiZI9Ww8PovkyPpRdz1atiOJqQX7Tk
   bwbGMfyKdu3bhQ5XrI8407KHy1AWdUKWqjI9iRGBN542pCFwqRDnvJdIb
   nPKwod+iMarSrUbl33dtByfPJqdJvfzZ8FRrEB4UbkJDeSIUhLLYY6NpW
   Wf8VC+jWw3FfKNHtRUmGQajxruJafwTUauJcEfhug+ZibggpxsJqsYhda
   w==;
X-CSE-ConnectionGUID: aDCD4Td6RJiPg1zPrxcB/Q==
X-CSE-MsgGUID: eP99rUMLSha7iyhk2Kzm5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="60707815"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60707815"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 10:04:34 -0700
X-CSE-ConnectionGUID: OCAewG3gTEmaqh5+nCRqEQ==
X-CSE-MsgGUID: HTRBEJRITIekxReNlBGQuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165975936"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 09 Aug 2025 10:04:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukmze-0004wq-27;
	Sat, 09 Aug 2025 17:04:30 +0000
Date: Sun, 10 Aug 2025 01:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000
 (xlnx,xps-ethernetlite-3.00.a): 'clocks' is a required property
Message-ID: <202508100057.RPRHqreB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Abin Joseph <abin.joseph@amd.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   561c80369df0733ba0574882a1635287b20f9de2
commit: 60dbdc6e08d6fe66380598ef8bb857a4474e30d9 dt-bindings: net: emaclite: Add clock support
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: mips-randconfig-052-20250810 (https://download.01.org/0day-ci/archive/20250810/202508100057.RPRHqreB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508100057.RPRHqreB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508100057.RPRHqreB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: gpio@10600000 (xlnx,xps-gpio-1.00.a): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: gpio@10600000 (xlnx,xps-gpio-1.00.a): Unevaluated properties are not allowed ('#gpio-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): 'device_type', 'mdio', 'xlnx,duplex', 'xlnx,include-global-buffers', 'xlnx,include-internal-loopback', 'xlnx,include-mdio', 'xlnx,instance', 'xlnx,s-axi-id-width', 'xlnx,use-internal' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,rx-ping-pong: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,tx-ping-pong: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml#
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): Unevaluated properties are not allowed ('xlnx,clk-freq', 'xlnx,family', 'xlnx,gpo-width', 'xlnx,iic-freq', 'xlnx,scl-inertial-delay', 'xlnx,sda-inertial-delay', 'xlnx,ten-bit-adr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: /i2c@10a00000/ad7420@4b: failed to match any schema with compatible: ['adi,adt7420']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
