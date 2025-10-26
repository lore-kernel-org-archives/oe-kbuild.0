Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348F6248F59
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761518164; cv=none; b=O+smAmyi4bPvshzS/TsfhaEHBqkoF/KmUFIuch8FPqgus3HIDBeFL5nGh+uAoMMlBxSnvPK3+Pl3iJCFbMCc9qHFF/cHlJudZgddLsFY90OUXHOrrjYaDsioOaftpxevjVDnOOU9jQrJK68cIrjC/bk9w5srbxEZcq/FSU/5mpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761518164; c=relaxed/simple;
	bh=fTXyFg9JiWBx0vK9//A6ktQG+trnngFKBANLilUVgn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s8CP0LiQ9tIKnrI0kNQhPHmgUk/hC3KHKmjn3rO3alDvdjpwsjd6F6y6l1ZqZHzLSrtFqc+xZNsK3JOrav1nnFrEucMLeJj5MMil8tt5v435v+ymhbgM4c7/qWXjlkYWzJeFArgJNZM7wSjaYo2VsETUNoiAeCUDs4UsmaRXEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlMBrT35; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlMBrT35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761518163; x=1793054163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fTXyFg9JiWBx0vK9//A6ktQG+trnngFKBANLilUVgn8=;
  b=GlMBrT35o92MiER1DnJnFFmDQ3X4HCzj8oSjZo1DSIeNSbdDZfoEqj1+
   yaBrp1DYWzuKfAk2Jn+RjgfM2NsNQQy8MqfPIP3nPRE/K4cpqBayzLx08
   0leCTEJBYjEYbA19slijsoKv7Ce5x7i5y180f8kvbdkX2rjql6JbFh3om
   2UnwX/NTYlAo4BkLWLDszGzD/wVXfqpmb3rfi/eiNq7JydpN/CAHyZksc
   BSM87pe28BEb+xf5+2aSr1RUsairBMwTGODvKFwn7xfeMJ8pkK+0VFzLG
   SJfvx8ns7gbr7rK3nKR4/Vk3WJS4Xl380wBtQ+L+Jizpfkr6yFmkBu4th
   w==;
X-CSE-ConnectionGUID: qcAmm5QFSiGBMz3lAaXsmA==
X-CSE-MsgGUID: lKaWvVGyTDadJr2c87qwvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62808456"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="62808456"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 15:36:01 -0700
X-CSE-ConnectionGUID: 5Zg1UmdNRImZLI67eYSWiw==
X-CSE-MsgGUID: 1ccez8liQICRZbZAEswAaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184793830"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Oct 2025 15:35:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD9L7-000GN1-1Q;
	Sun, 26 Oct 2025 22:35:57 +0000
Date: Mon, 27 Oct 2025 06:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:ux500-janice-v6.18-rc1 10/11]
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio):
 Unevaluated properties are not allowed ('#address-cells', '#size-cells',
 'haptic@49' were unexpected)
Message-ID: <202510270627.gWv9PIVy-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-janice-v6.18-rc1
head:   ccd3929e54f44ccae885d803cc472204f661c886
commit: e008aa373e9391a32f3bfd82d41eb847c2d2599e [10/11] ARM: dts: ux500: Add the Immersion ISA to Janice DTS
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251027/202510270627.gWv9PIVy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270627.gWv9PIVy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510270627.gWv9PIVy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@2e' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: current-sense-shunt (current-sense-shunt): 'io-channel-ranges' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/afe/current-sense-shunt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'touchkey@20' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): $nodename:0: 'i2c-gpio-2' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'haptic@49' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nfc@2b' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: nfc@2b (nxp,pn544-i2c): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nfc/nxp,pn544.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
