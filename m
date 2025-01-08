Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D41FDE3B
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355474; cv=none; b=ntUe8w34hDi8YtxXq7W0qZ5tQTMmq8ZyyUWDQT5jxurVhPZW/CGW3VbgKTzkvv1k6xYdFOgN3FqCxNfMVohtUYO+oyE0r8GTqLUItoiOXW/2nWXran9P061uSw+bZdixZEX99V1BJOt6c8dR/EiAPdPUD97VCBpZ/lytgnhW5TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355474; c=relaxed/simple;
	bh=BZ/fNx5lln4tu3Z4ZaktaC6/9LNooj7sMM6RDq7UhO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7s+gOqLluLfjarlmng/62CcDvQyhvi7VgWFUFxp0KZCihUpv/5+ph8GFQlkLBskra9WR6cDjaSVkNr+/XlwrSo0SBekJn3ty8knPTDIlZbjCw3DbZcG5iAPcPjj2WjRz8G3uOJSKv5Qaybs9oIYmMfU6UAJcExU3enmPUew9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwRQcniQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwRQcniQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736355472; x=1767891472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BZ/fNx5lln4tu3Z4ZaktaC6/9LNooj7sMM6RDq7UhO8=;
  b=XwRQcniQuLuiYwBLMIvxwXBRs8Kd6eWYNi85RPN4zy4lPVp3dJ5dCJCi
   y/cr/Mn9LX+KDuyE6I592/Gppp2CvDPEa+s6YiqtmLIfvUgrIJkqSuocQ
   /FbyrUoo2W4YjMKGalHvZSIczsipTFcpSn7kYTRqjdx1Oj+7tKoS2PFmB
   ZMylCESy9644SOsWpbLRNMkJTU8RRq98G/BG+i8snqDPr9Tk2PqwN7nyb
   eDTzjJtUSM6oHyz7t+0qA/pzkIMlpW8+bMZ0EuDvWG2QrlgUGnvFAkF+G
   N/ASF7DfIa++ZRrBnfVIsGBhh6MFK4N2V/cCPFUZ7zrbGqViMDDmspeUE
   A==;
X-CSE-ConnectionGUID: iuRzlh0MTm+Xtc1j6pf6DQ==
X-CSE-MsgGUID: xYC/8sUDRFis2CDy7nMIiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35818723"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="35818723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 08:57:50 -0800
X-CSE-ConnectionGUID: f/JFEu+ZQAy6lMip9LSifg==
X-CSE-MsgGUID: BSj4cjJKQwiImyxSEvlCMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140488470"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jan 2025 08:57:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVZNK-000GPz-2J;
	Wed, 08 Jan 2025 16:57:46 +0000
Date: Thu, 9 Jan 2025 00:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <202501090014.a9h4XpT9-lkp@intel.com>
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
In-Reply-To: <20250107135659.185293-5-markus.burri@mt.com>
References: <20250107135659.185293-5-markus.burri@mt.com>
TO: Markus Burri <markus.burri@mt.com>
TO: linux-kernel@vger.kernel.org
CC: Markus Burri <markus.burri@mt.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Marek Vasut <marek.vasut@gmail.com>
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next linus/master v6.13-rc6 next-20250108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Burri/Input-matrix_keypad-use-fsleep-for-variable-delay-duration/20250107-221307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250107135659.185293-5-markus.burri%40mt.com
patch subject: [PATCH v3 4/7] dt-bindings: input: matrix_keypad - add missing property
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: powerpc-randconfig-052-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090014.a9h4XpT9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090014.a9h4XpT9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501090014.a9h4XpT9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11700: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11700: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11800: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11900: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11a00: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11b00: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/pscfifo@11f00: failed to match any schema with compatible: ['fsl,mpc5121-psc-fifo']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/dma@14000: failed to match any schema with compatible: ['fsl,mpc5121-dma']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/axe-base@2000: failed to match any schema with compatible: ['fsl,mpc5121-axe-base']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/axe-app: failed to match any schema with compatible: ['fsl,mpc5121-axe-app']
>> arch/powerpc/boot/dts/ac14xx.dtb: matrix_keypad@0: 'col-gpios-binary', 'col-switch-delay-ms' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
   arch/powerpc/boot/dts/ac14xx.dtb: /pci@80008500: failed to match any schema with compatible: ['fsl,mpc5121-pci']
   arch/powerpc/boot/dts/ac14xx.dtb: leds: 'backlight', 'green', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
