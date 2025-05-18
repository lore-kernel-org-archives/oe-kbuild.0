Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587E1D63FC
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 19:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747598369; cv=none; b=pyWKtgXCWm9DzmleLD9Y5RhwmPYVL2KsCwhHhx1U1ztDIWDgngHaCGwANOnXp52mTirLAgjh11f20hn9mYHgS1z4FIa4q2rfqe3M+aJQVwXRqo7Xc7EtkZ3bxneVyJVMdOvnWn6UeMI8tGIVufg68UlZ7S/gzVXd00meYcvu5Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747598369; c=relaxed/simple;
	bh=/hNBnSddnix7aO98CuvkqPQpeCz03p5PbIvdnUZnK+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CTM5ktpgfzY6LsPcd8oum0hWRxkYCxq03MFLLil773ZN54Xbx2wS6E+rbVjQwxSmBbtT+uubeMJJaBYvopE9Xk71RjdehAFOXMTXMKWP7Q9x08SeJjjsSGf7nVisH0IVZD2nkDSvqOlu/YlYR8fQcVkiVWJ76dfUZlfHSzWlyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2qTKhx0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2qTKhx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747598367; x=1779134367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/hNBnSddnix7aO98CuvkqPQpeCz03p5PbIvdnUZnK+o=;
  b=Q2qTKhx0dowHAsGbl/W49C0vYxOpC80EXgLSAJDIPgjTCsHUYcIVWSrC
   gQ7fzIvjY9ApfEYNlXA+VtcBNB7P7IPACIsUSk4nnYt2UNXAhs7+s6ShP
   gOrNwahyoswghFRPsAXSeIFxqfEL63/A9c9085F5thExDBxVGp3s3AgNc
   6nmo6rSphaE7zNhg+MuAvfDw8XNTihyvSnhQ7aetz4XYQdA7ApiKrNiAp
   yTQVUnKn35SwB/nNKYcfndvPQC7Ntt+AOO3ku4QHcHYn4S7QCQlrL/7+s
   cuCeW91kl6a0n3u5PvAVNOyf+DVLlgn9InWz73YRqCVnjWD5dAtdiD5XT
   w==;
X-CSE-ConnectionGUID: jNHEJa2+RzSWOFwgulFmiw==
X-CSE-MsgGUID: csGEA6XeSluMWk9Gwh9lOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49397095"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="49397095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 12:59:26 -0700
X-CSE-ConnectionGUID: WktZHkDFQXSbfjY3e3P/3Q==
X-CSE-MsgGUID: KKE4bceTSIW3EN76bitznw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="162480729"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 May 2025 12:59:25 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGkAN-0000kt-1T;
	Sun, 18 May 2025 19:59:23 +0000
Date: Mon, 19 May 2025 03:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 3131/4329] arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202505190354.ldS98ci7-lkp@intel.com>
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
TO: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   9d5f0863e401cb64a69c27af17034edd01e989b3
commit: 85fbc56f6b9120c56423361ea389462606f739dc [3131/4329] arm64: dts: mediatek: add device-tree for Genio 510 EVK board
:::::: branch date: 2 weeks ago
:::::: commit date: 3 months ago
config: arm64-randconfig-2051-20250516 (https://download.01.org/0day-ci/archive/20250519/202505190354.ldS98ci7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190354.ldS98ci7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505190354.ldS98ci7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
