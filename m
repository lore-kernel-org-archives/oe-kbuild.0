Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CD93C6BA
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730762694; cv=none; b=Rg7XmIlHSLld7dnH/csY/ng2jWOvU6V3KFQp0cAf/vuuCOfO887lg11kLTT4gTndOSRg2ev9q3WCsfrHoNqU/S/MG/atYtSayEPfuEpvqY2qH0eqTFaFK9QGgBWcOFsh7ObhzvCpFcpWCw6jcxH0471clBaodQ8SW3yYnMlnfVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730762694; c=relaxed/simple;
	bh=lBN6RrZiqesxi9dOBdJdrf0qidi1HTKCwYyQbxZ45C4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fl/DaC9a+qXJyVRICje+78lSkdpu618yhsQu+grERXbYC/yjf3XpuHgD0kbCqEO4OntU88X5ucdL5W8phh/l/O/+sx31nY/TafyNiTdMg9OA4YFiR7PDla3GltIBtm1T08inKAFVm/3bS08ww/1AwmAyTiBAxy8pyzWZIn3Gq8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmWczMFe; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmWczMFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730762692; x=1762298692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBN6RrZiqesxi9dOBdJdrf0qidi1HTKCwYyQbxZ45C4=;
  b=cmWczMFe1mD9aQnFfKFKjt65dYMUSa0inoFqiCT/2O2pAqsPZXiJChx2
   1nkx645b/MR5MLZxw2k/o0oitGvTCbN/WeR4Z0XAVhPn/s3ICpATciH9f
   Tvmqa6+tlm/cRyfJPesC5y97z7f+BWo4rjIhpFfKsZ1WppiS8Bl8fwQ1Q
   Kf8MIQp2AFjBuAyMU0rAdTBkJz7cfe/75hhsMgfxMRc53wbFysLVp5nWb
   C7Nafs8ZzVGQXDmsxkiug6BkmcAzBt++4+MoROxBTMgi/iH5PTO6dw1cn
   QnTrwpXGJvhKbdsK0i30vEswpKLCbj2NmW/dW0eXddxJA8ph9ce8KEByT
   g==;
X-CSE-ConnectionGUID: p+PY5E5dQtq5VEneJhaC3w==
X-CSE-MsgGUID: RSJBB1AsQQ2v3vhArcbR0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41069801"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="41069801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 15:24:51 -0800
X-CSE-ConnectionGUID: OXCcNwBWRoCO/rEr3vGnBg==
X-CSE-MsgGUID: /8ltg7LuQFeh2vVi52Rahw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="114588871"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2024 15:24:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t86RE-000lNt-1A;
	Mon, 04 Nov 2024 23:24:48 +0000
Date: Tue, 5 Nov 2024 07:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:gpio-irq-regmap 14/18]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41100000: ngpios:
 16 is not one of [14, 24, 32]
Message-ID: <202411050744.mpcR2vbY-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq-regmap
head:   45bbcc5430f7ddc969253a078a04aeb6f9ee4d67
commit: 5d1f5d8f142537de5038d19b05ce5c3ba50fbfe8 [14/18] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt descriptions
:::::: branch date: 5 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-052-20241105 (https://download.01.org/0day-ci/archive/20241105/202411050744.mpcR2vbY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050744.mpcR2vbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411050744.mpcR2vbY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41100000: ngpios: 16 is not one of [14, 24, 32]
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41200000: ngpios: 20 is not one of [14, 24, 32]
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@44000000: ngpios: 20 is not one of [14, 24, 32]
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
