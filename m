Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779224A08
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737707; cv=none; b=NaVgwRKwTkGFycTx1hHF4qQweN9P4y6wzCLWVhVNzUVAcKjGZeYwtB/FBfNnC9JgAGKwV387r07iiLVA8Yq78MXNfN2IYkLtPVyHM46qP+gSNRl23xTHMSDLklVDVIRQnga7C88ipnP4vTbdORUYhFx04g77qOoQDXiq2sjbnHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737707; c=relaxed/simple;
	bh=CrgXscDBcyRLdii5kro9esuStUx2YPJ5OVldoTHYshg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XZVjhDKLuCA2ESBMnCeq8neKv6Ign+5uIF4PsjjMM7D5Fyt6g8VtxjwmkVp7RBiYgqqHyr6i/sCqK5NLvUuoPrdFHowAdukbORQhncArMj5ec/WENNQ24B2TrnFB1Nw4E4E15wByDnaDP90htN3p4/ThM0eKhmCyKLsfiSSU5fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mX5Ikhyf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mX5Ikhyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730737706; x=1762273706;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CrgXscDBcyRLdii5kro9esuStUx2YPJ5OVldoTHYshg=;
  b=mX5IkhyfMp4ZyOzoLPdeVv2MAPqwlfGJQeMgWZVUR4l2XzGosYj8vsOf
   Ii78YpvpCdlh556rIOFmKZALneu/O1se0cejD6eIPh+Z10BkLBiWwARuR
   Tdn4cj1qgKzV73mbTGkzWAxsBYSyNg3+lUkwSa4xOcYioVJfDLkKLvqVR
   KHnliAMpZqbF3nWPiD5Wa8iPwFbsuiuxgnbkJqjHDFF178K5j0es1TFGz
   SeMylGxeOv7klIMPRVXaEkKLmzSKyjKZiePwK7YiS+cGIF+FKnr4ATtvn
   9J+qrbkN6Q37xmBMxJnhhbsyRFmuNmSapkn1H70dTuctzt9zPh5RyQndY
   A==;
X-CSE-ConnectionGUID: nthVrNGnRN2goE6XkldY6w==
X-CSE-MsgGUID: +7vaqs6fQHCkOsyM6+LuKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34136365"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34136365"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 08:28:25 -0800
X-CSE-ConnectionGUID: cwNDxHezRQasegCY7toArA==
X-CSE-MsgGUID: GNU5RdcOQ1K/gYMoeTLWxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88467467"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2024 08:28:24 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7zwD-000l1l-2Q;
	Mon, 04 Nov 2024 16:28:21 +0000
Date: Tue, 5 Nov 2024 00:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/microchip 1/2]
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg:
 [[48, 0, 0, 134217728], [0, 1124073472, 0, 65536]] is too short
Message-ID: <202411050050.CeutkPIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Conor Dooley <conor.dooley@microchip.com>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/microchip
head:   e071e6bd994056e31b445b7ab2255076777e426d
commit: ae5ebdb405ddc320f7bf9b23c1040b197bca3ab2 [1/2] dt-bindings: PCI: microchip,pcie-host: Fix reg properties
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-051-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050050.CeutkPIS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050050.CeutkPIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411050050.CeutkPIS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg: [[48, 0, 0, 134217728], [0, 1124073472, 0, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg-names: ['cfg', 'apb'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
--
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: pcie@2000000000: reg: [[32, 0, 0, 134217728], [0, 1124073472, 0, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: pcie@2000000000: reg-names: ['cfg', 'apb'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
--
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: pcie@2000000000: reg: [[32, 0, 0, 134217728], [0, 1124073472, 0, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: pcie@2000000000: reg-names: ['cfg', 'apb'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
