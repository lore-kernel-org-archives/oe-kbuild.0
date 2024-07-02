Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633B85298
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jul 2024 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719947483; cv=none; b=FHYEOl5zCsUr8f0Ww6KrG743+2on9eTZizYqunvt5hXLmf+nOP8ekzMWMd8rb8FEQD0s519e7wUPHfTDQAQ5aF61NZhdTVK0r+2Q/vEG4/QH/pcnssSr+xXQFDZC1t8wyGAyaiYdaQ2GP84/rVGZE0R658/1stOs0KUJUDdBdXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719947483; c=relaxed/simple;
	bh=5q/7inr6QwCFRae2UujVeMGhY0FhcHd5MJjPhQroNeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LKndIZp7WpnTNhm+C62AgMvki3Lsk2E75bpyKr+AXJy3BN83B9v0nZnq+jmfhTvIHtzSwr9gZtr6ZNqo8HO36qqK5xqJ8F7htuByUPMYfao3IEolKcc3zEEoS10rFHq0KBNP6VD7A2Zj7ldnWXZeZbXfwRpIcgFjn8dPHetvN38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8WOzGl8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8WOzGl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719947482; x=1751483482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5q/7inr6QwCFRae2UujVeMGhY0FhcHd5MJjPhQroNeA=;
  b=R8WOzGl8MvbK6mV9Ca3imZuLr0LyDJ+0PWFqmfGUmJYOx6G16JBVE7E2
   rXs+HIxRwZX/Z1xkyYkTWp0KQgchtHSZ1PxqkaKevdBqCk4Rgqtx0sla1
   xWXvITg9F8/Jkcsv3dfvxWW6QkC2H7ly4Zty5XSHoTkx4KMknBJIA1Gi3
   O0e6UDCrJZAB7b0MjXIt1rsEzzBkIahSatWF8FqIRzyDjGCQH/fZN9YrU
   t33zVdQ7XhF7lAFeVzUq9xGxUAivIGn87KNT9RqHQNE8fO3J306UHWrny
   59m4ULPQdt0xC0R+IDOJCO9G47GFqnR4+7tbQPShjyxrY67pq6drn+Ri+
   g==;
X-CSE-ConnectionGUID: DSNJvIW8S52d/od3Mi8YMw==
X-CSE-MsgGUID: V9rHupwNQ3mL689E0kKkWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27745289"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="27745289"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 12:11:21 -0700
X-CSE-ConnectionGUID: kjG7qjrsR1mSqDuJslaS2g==
X-CSE-MsgGUID: JqHfkhkeRwmto2OyIXmeFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="51191353"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2024 12:11:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOiuL-000OZ6-23;
	Tue, 02 Jul 2024 19:11:17 +0000
Date: Wed, 3 Jul 2024 03:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8010/10049]
 arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel:
 data-mapping:0: 'jeida-24' was expected
Message-ID: <202407030334.WdXZn3XI-lkp@intel.com>
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
head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
commit: afbd730d0f3ec9ec01dad32b3aed5e00ffe5b22b [8010/10049] kbuild: verify dtoverlay files against schema
:::::: branch date: 11 hours ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030334.WdXZn3XI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030334.WdXZn3XI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407030334.WdXZn3XI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
