Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5A32208E
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720074726; cv=none; b=gJYQx/J+lGBG5l2zYwk0Mkr7MZI3927MEcpzYoRjlkA8hFFqKNlYCTBNmJxwD7voIvq+TUnUCpEoXbLEpzbGa+OLhfCyPY5i3gybG1dmWRpf/d4xUF6n/XwM6bw+FFAlK/Xt2VXHRPq27LC8wp5yLH6FPOvxn8mttS78xJoJo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720074726; c=relaxed/simple;
	bh=wrkELsyDcrJ2//0MIkms4c9nXKsuz5mDdw6+ROXAV28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AcL3UBeH+TONtQVUXcMVrh5DnFKO43/7nxDZBQn+CB5YFFUGsyB6poePQWpey/8o6wy91BBj7e6nqLoDQ0ZfruFSv8sz3y16h0bXCnYiuZeYrioD6NsjJMOvQbN3XzrYMQnuu01239d4OnR9o/CM/LsBNcr9aFtfFsptx/s5wNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/40nBm+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/40nBm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720074726; x=1751610726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wrkELsyDcrJ2//0MIkms4c9nXKsuz5mDdw6+ROXAV28=;
  b=R/40nBm+oYz9PlcliRH9R6Sx4vRCbnlzM2nGUwQTHZ8ZEaFegtBZj+ke
   utIRP6KiH78QTi/NRhA1Tp2whu5vtrqCbZXz4xQt5HzVhvsLVGf3HRVP+
   ub9NCKSNT0xfxHRkoLcsz+kswSOkbGQeJgCBzhz9Pv7VHTNbXv//ne5Xm
   idc2Ci4xkjMyc55u+N9Q+UVhUx3QHoUryxOBpa9F+pYlO/7/QJ8TmNSvm
   reHXqZ1dX+Gs/2FCscypl7+kX6UfpdX1h+MZd/EU/85xHOhxbsei2zAEX
   jn89v4Q1v/5Vid+cCsjL3jJg/cPmpjZhlHZMBlm3B1c9TdxWZ0VyZDO33
   Q==;
X-CSE-ConnectionGUID: 3vRgGXYFRRy361UE9S6VoQ==
X-CSE-MsgGUID: UVgqi1kiQ+mrYbqz1R+guQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39852318"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39852318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 23:32:05 -0700
X-CSE-ConnectionGUID: 9VoGnqIeQayXWE8b4xJxVQ==
X-CSE-MsgGUID: j4vlhkalTsSvQmmXT9nh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51359972"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Jul 2024 23:32:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPG0e-000QfA-2e;
	Thu, 04 Jul 2024 06:32:00 +0000
Date: Thu, 4 Jul 2024 14:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7978/10451]
 arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtb: gpio@27:
 'vin0_adv7612_en' does not match any of the regexes:
 '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
Message-ID: <202407041432.YIUId3gg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: afbd730d0f3ec9ec01dad32b3aed5e00ffe5b22b [7978/10451] kbuild: verify dtoverlay files against schema
:::::: branch date: 24 hours ago
:::::: commit date: 8 days ago
config: arm64-randconfig-051-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041432.YIUId3gg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041432.YIUId3gg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407041432.YIUId3gg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtb: gpio@27: 'vin0_adv7612_en' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtb: vin0_adv7612_en: $nodename:0: 'vin0_adv7612_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
