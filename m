Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB21A1C8621
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Sep 2025 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757153006; cv=none; b=syScQY2trd43wVGLnaHTlaihWxQO6qRWcv73ULKzZBN4wTIl+yCZR+ifLKJQgp8ErOeUlqWhaXQIhxoOSQxy7BJSy/jYyISNlE+KnZraRpxw4EmWDflyiAVSeeMzrqyIgCve6GFfZCFDAM3dVUnMIRiDK2sAMDsZtO/Ft1FMwSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757153006; c=relaxed/simple;
	bh=RJ89G3QrhPpNGsi6IHejwNwL89V5HoM0engHX/KBlpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dkPZR3Fu3uILRxbXZPdbQcIXstDLixx+KGjtMtWUGyZHbBoeb8b4z4flHVO9z8hG0r62Fw4JtC0B5B68Kk12OWbUJ0wTc3WdA22to8X4CWGgRHbBL2KBGrN9KM4T7ry/SK6u/zi5NfsvTWUFLjzezEJHUAU49gxrNYq4foskdOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CInJr+4Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CInJr+4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757153004; x=1788689004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RJ89G3QrhPpNGsi6IHejwNwL89V5HoM0engHX/KBlpg=;
  b=CInJr+4Z5t1lEEMHJ0oio9aOsEJkgMkfgTLrI+NJqFXrsXZYqZa5WCTS
   XUTNlZ0AsDqwIUJSJlD9u4iYGUk3+wKcO3Wx7iCe4arPLGU7vXuoqNCfA
   GMYv3egAWHQqw269OGoIRRte12R0ZnnQH6TRWeovS/rzr8utj8v7D5XSe
   TfmasYgS1ov/kgwEE29oNH5w9GHi9piDxKNKlkwTyH05O4GlVg/lsELSk
   pO38c4UJZX7YFJreyCuxAstnqYePTKPDUQOG1fpjV7Cjn8PjacKrzTNjO
   n3ku7xaIy5zuvrUeBO010+PkMzFZqs7+oKX8vpyuNvp5TmfbwRi5Jwaw8
   A==;
X-CSE-ConnectionGUID: 60qgtFIlRJe3Aj2KSj8EqQ==
X-CSE-MsgGUID: Ji1VNihmSeqDKLmyOdmNkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="76943117"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="76943117"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 03:03:23 -0700
X-CSE-ConnectionGUID: HLXAK2nwRV6T3MlQvO3X1g==
X-CSE-MsgGUID: ILVYnsS3TFm4HvWh30JcjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="176680767"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Sep 2025 03:03:21 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuplP-0001Lj-0O;
	Sat, 06 Sep 2025 10:03:19 +0000
Date: Sat, 6 Sep 2025 18:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/9] arm64: tegra: Add GPU node on Tegra234
Message-ID: <202509061734.WNZ5L6Rm-lkp@intel.com>
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
In-Reply-To: <20250902154630.4032984-8-thierry.reding@gmail.com>
References: <20250902154630.4032984-8-thierry.reding@gmail.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Sumit Semwal <sumit.semwal@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Brian Starkey <Brian.Starkey@arm.com>
CC: John Stultz <jstultz@google.com>
CC: "T.J. Mercier" <tjmercier@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>
CC: Mike Rapoport <rppt@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linaro-mm-sig@lists.linaro.org

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250902]
[also build test WARNING on v6.17-rc4]
[cannot apply to robh/for-next akpm-mm/mm-everything tegra/for-next linus/master v6.17-rc4 v6.17-rc3 v6.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-reserved-memory-Document-Tegra-VPR/20250902-235038
base:   next-20250902
patch link:    https://lore.kernel.org/r/20250902154630.4032984-8-thierry.reding%40gmail.com
patch subject: [PATCH 7/9] arm64: tegra: Add GPU node on Tegra234
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-052-20250905 (https://download.01.org/0day-ci/archive/20250906/202509061734.WNZ5L6Rm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061734.WNZ5L6Rm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509061734.WNZ5L6Rm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks', 'port', 'realtek,jack-detect-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
