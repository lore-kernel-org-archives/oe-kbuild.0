Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5514B06C
	for <oe-kbuild@lists.linux.dev>; Sat,  3 May 2025 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250985; cv=none; b=B8Q5sCnyrDcOP4fTYOD0nRt81sCNz0Yd1mnH4abU4tIEHa47xEUUEkydFg/WOhJyIZf8U/PO9kZg1JL1mDWLgzHVfvzUHLBq73dLJ8JrT/MVcOAQHDaoE8qaQAVxLMotVoaHkXqWf1UFDGGQg4S4sDc+5yHIcvbdXHckX9kvdsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250985; c=relaxed/simple;
	bh=EqlAyYs18fHWObQQ1VeFey6f+MKIG4LmT1wOdeEsKws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7RqyMieSwFKLSzVCppdJaV6yh3QggCLa0cTxJu62FO/aQyd8ChCnvU1LOWfYX4baxzL4mLNmLqfFf/oa+6iuSb5Iowj9UiJk50CrDYNNM6wQEGAV131UanJsi2pPbJ37Tas9dxbLgEl2q4uXY8ATRzbgDlV2s5FqRI0G0eBGf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfCgCtnB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfCgCtnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746250983; x=1777786983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EqlAyYs18fHWObQQ1VeFey6f+MKIG4LmT1wOdeEsKws=;
  b=DfCgCtnBryHEGhcbvsbNKsfU1238DKxvk47HD4g682EJ9C92N/+Abyw1
   GtJz24UsjofnfpyGP97qTdIZbOO0QcWve0k8O1KqU+/BZX0P+2vgjUmx+
   9+bEHSTVTZheYuvPdywV74opd+cV7miFQdB9pMtbiM+230oiDcSKo8BRo
   IJXMBGQdnaZzvONfJ6m782rVfTzFJoJAG1P+ykySoDaF+ldcrjcLy2Hnz
   ymH8fFTVTeGW8RIlPwshqGsYGgZW7a38RtbIAVFwhERSOnHvEkwdSVe16
   EtxxyGFln8aIyCyCKDlv4srgUOjkhVGzaRiineZJm/6kt2ZJaPs5xZZUs
   w==;
X-CSE-ConnectionGUID: uhbIlIw1Q6CukqFolLrncw==
X-CSE-MsgGUID: zCwOuj9DQPiAny+Swz1U7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="59289898"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="59289898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 22:43:02 -0700
X-CSE-ConnectionGUID: j/Qd36KAT1y70MD8revYhA==
X-CSE-MsgGUID: 6aXYV0SjQouImN1AjI2ikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="134726861"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 May 2025 22:43:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB5eM-0005DB-1D;
	Sat, 03 May 2025 05:42:58 +0000
Date: Sat, 3 May 2025 13:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 3131/4324] arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not
 match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202505031342.tPEU6Lct-lkp@intel.com>
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
head:   da2f3a9f5091c2c6ee04ce79f7031338e6decac3
commit: 85fbc56f6b9120c56423361ea389462606f739dc [3131/4324] arm64: dts: mediatek: add device-tree for Genio 510 EVK board
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: arm64-randconfig-052-20250503 (https://download.01.org/0day-ci/archive/20250503/202505031342.tPEU6Lct-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031342.tPEU6Lct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505031342.tPEU6Lct-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
