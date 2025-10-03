Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8942DAFC4
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 02:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759459636; cv=none; b=pQORljTycS+eM/eiMh6EqT87tjNQlZpWC3faWb2S4b7Z9UaL7nK4Ax8iDJ2OMlxRk8761/I7PR8zk2tWLTpAHASktxZUq1imZ1pvBer1DlhSpZC8eoXnxgizy0oVuxVuhJTgmA6pmZsV0PF62DgM+05XGKtk5PSByCrHHZclXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759459636; c=relaxed/simple;
	bh=tqjsfZqUhlnuGDVwzoBfaCRPZ0ArugYTCdImp+sUSlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VM00SaSdbGcf1Sx3S//8rxpH7kvzfrsL1438QSNdqnmt4dxm7lRIqRPH9q2+cHWwoo67ttukU46vx/KjsoCHvdmFoQ9gBzi1OhNn1Bmo0VgsJl2uLdtzc8lsCqJq0841th173ViA3W8T0EscQGcFcTNJox2SkrIS1aZRd9CswXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsiP9nM4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsiP9nM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759459630; x=1790995630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tqjsfZqUhlnuGDVwzoBfaCRPZ0ArugYTCdImp+sUSlg=;
  b=DsiP9nM4filGkDYKRRMrf4EexCSrsrWdaCAVy0n9sS2lc5fXIHpoeViT
   SMaxoqk0+UjaevEt3ln6b4WUrEGAJ8vnUfZvCJKGPe36CvVsR9waE6fb+
   2TvOF+ZxZHTknQmBmuURJP8F85FS44AjIhMCAdZDbus+xRb3DWOb9qHNE
   XMn2LqyiC9dZvHBhk2vzkvnQyr4dZwtiMXGZy5gMXugUNb9Hv2L4Tx5uJ
   Pwj9qYmrYBCljzwLFoacfPCNvMdfUG5VAaHQLt5U6dXA3Se3uYdpp9cO9
   gs91wWK64caKTZXhYIJp5HTuJ4AEJd/tYwZRTH5CBi3CZQx1gdzz01PwJ
   Q==;
X-CSE-ConnectionGUID: I/6QksTtRJSMBZd6Y8X/uQ==
X-CSE-MsgGUID: 34ZIRJT0Ql6kEWlclqZ4cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61634180"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="61634180"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 19:47:10 -0700
X-CSE-ConnectionGUID: SEeBQtuTSZC0Z1NrdCvmzA==
X-CSE-MsgGUID: soqwXbjbSwe+Ug2aLkiUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="183212787"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 02 Oct 2025 19:47:09 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v4Vp4-000000007Ld-24SC;
	Fri, 03 Oct 2025 02:47:06 +0000
Date: Fri, 3 Oct 2025 04:46:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sdm845-oneplus: Document TE gpio
Message-ID: <202510030412.yq1suulN-lkp@intel.com>
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
In-Reply-To: <20250925-s6e3fc2x01-v1-6-9293016768f7@ixit.cz>
References: <20250925-s6e3fc2x01-v1-6-9293016768f7@ixit.cz>
TO: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Casey Connolly <casey.connolly@linaro.org>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: phone-devel@vger.kernel.org
CC: David Heidelberg <david@ixit.cz>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ce7f1a983b074f6cf8609068088ca3182c569ee4]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/dt-bindings-panel-Add-Samsung-S6E3FC2X01-DDIC-with-panel/20250925-171444
base:   ce7f1a983b074f6cf8609068088ca3182c569ee4
patch link:    https://lore.kernel.org/r/20250925-s6e3fc2x01-v1-6-9293016768f7%40ixit.cz
patch subject: [PATCH 6/8] arm64: dts: qcom: sdm845-oneplus: Document TE gpio
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2051-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030412.yq1suulN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030412.yq1suulN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510030412.yq1suulN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): 'poc-supply', 'te-gpios', 'vci-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
