Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AEE221FDE
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761373976; cv=none; b=KyiC9eyAzcTKBt3GBW/V7mkh+d4WyzQr70XwBJW//CdrG+Cr84SsWH17nQrvH8WZ9cZWXNtxuZPHUM9s2B6b1iMJOuatPFO+8cs7Chrd2IvzONVuyMqL27t5FosddioAGuXWXoonlFgMwHnKvzlW0Gugo9Vtp9SbjiGklKiEnDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761373976; c=relaxed/simple;
	bh=F1d6x9iUqHF5eGiOET0dDYOcvs3X7z4cA4zZazSuXJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ngd/gGSC7siUyLU0Wi6rS9yQV6wE1D6IVULxvtAYAqKK0U20tF0iLyoSKozF53D5N8WzBWgQdztahsHpm+PfNsycqIx/oec0FZnrmDRixBDQJ88g5YdNoVjRHMoS0g/ootH5w2BNxDYpXP/J/4RHVN2eN2GsxoC7ozE/x0d1xIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyWeeG/2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyWeeG/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761373974; x=1792909974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1d6x9iUqHF5eGiOET0dDYOcvs3X7z4cA4zZazSuXJ8=;
  b=DyWeeG/2zna4VAlIGXhui8nJcyrx//nyXtiuZ1Llw55xj1UT2UPxiL7Y
   AX0WcnnNJ3AvKDF6xaJ77Nnivec9Hc+3jKEFLJpeO4xQ9ysZckPIIGsij
   x+Invf4VUMtfk8BggW8k6RFLJkUqp5A22Jwvt++oiILSzyLSxAScftarE
   RCmXH4Wyi7FiNO3prPdA79Fd9yECOdC+AoAdGNqOWoHRoAApYH0m4lLD/
   SYp+3KnQ80vGTwLFKjAQMXjRXbgmSdgQVjtblfub8XdpM8dJL8t6PDc+4
   aBs2+qtkVXzdQTAQf1+baIKBeH139pTQ1bHz6NjTyv1Sxm7hd2EDpY9sA
   g==;
X-CSE-ConnectionGUID: LI4rHL54SFGVJjJ69iIgBg==
X-CSE-MsgGUID: WMXe1H9rRCqIVyTmCBq1Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63450489"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63450489"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 23:32:53 -0700
X-CSE-ConnectionGUID: NIc3undfQJCtZo5/w0gkEQ==
X-CSE-MsgGUID: 6kzsz6mHTZKKxJI2Q32cMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184301729"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2025 23:32:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCXpa-000F9B-1k;
	Sat, 25 Oct 2025 06:32:50 +0000
Date: Sat, 25 Oct 2025 14:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 8/39]
 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb:
 /dmic-sound: failed to match any schema with compatible:
 ['simple-audio-card']
Message-ID: <202510251442.VCFcFPEj-lkp@intel.com>
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
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   afaa11afb19194ab185bd6dc6674bb42af42e59f
commit: a00547a3d28f0c0c83cae73c54f82a569898abd2 [8/39] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-051-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251442.VCFcFPEj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251442.VCFcFPEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251442.VCFcFPEj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: /dmic-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: /dmic-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: /dmic-sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: sound (simple-audio-card): simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: sound (simple-audio-card): simple-audio-card,routing: b'L2\x00Mic Bias\x00R2\x00Mic Bias\x00Mic Bias\x00Microphone Jack\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
