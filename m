Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861292D47E9
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 08:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791706594; cv=none; b=nDZrN0+zuQA9FB/yYdJZOtypM+lmf+pK0MegVfvge6kZNkPEwRpa7tYQQAxzXPkZKetls1DomnBl3BREcNec6NXzSBCVEG2CXVW3cQKRb5pJ3QFSUOVXpWv6HbE6Yibst+wIkzjIcSsOpV1wEabsJwkn5p+fdQQp8FP2f5/ISZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791706594; c=relaxed/simple;
	bh=p3g6zVGWbNDMjz1BkEADtARwGttfF6XomN7AN93qh+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iUBkbBK18pXF2ECsd3U0msYbSGLwnifdOcykFRNyZ7aSg/0oQw5ncJhiSeSFTrFne4FoM/GHhGQ8UcaQnwdptmfHlkMbr6To9O9vy/wHSTp0yMf6RaK5+rA1bNLeiBVNai3WuTO9JBQ/YqDvZSfqLVCZygxs/SED28NOiaNCpsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUESl+Ru; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUESl+Ru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791706592; x=1823242592;
  h=date:from:to:cc:subject:message-id;
  bh=p3g6zVGWbNDMjz1BkEADtARwGttfF6XomN7AN93qh+M=;
  b=YUESl+RuIz8/136zh0DVukBiMATAWsIOmyn1+hzJikc7cEoDFPnfljb6
   hPyVPpD6NeLDzBWb2MUl9qUEoaofGc8zaxa9dK0X7Sa/4K9nZlJ3v6qKb
   RB4BH1ygq6I7CMDhJ9QikqazRUQHeEG8rtlAZLVsx03wiFFcb0kPvO1jX
   g5R5ZTvVrK3onlJ+7aFno+1OC1Js3A+hdRZMp9rGuBSw1p5Zr5dK8td2K
   E3eOGgEBHgELXSuYn7/irT0vIUnXaoTc7lSBoUjUp11er+CREWJuY7siT
   jKjJZWDnpNCZ+brNsI3WePmW/8pfNg26fTiTqoGZMGWVxPzNCY0ssvVBj
   g==;
X-CSE-ConnectionGUID: JE3TP6a+SXaMUEGtIHas7Q==
X-CSE-MsgGUID: m93VvckXQ/GwSzIqhVS4ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="451202"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="451202"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 01:16:31 -0700
X-CSE-ConnectionGUID: BbB0O4TOQs6JhjFrbqX+zg==
X-CSE-MsgGUID: +f+BQw5nQGmk2ac1W6H5iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="985677"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2026 01:16:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFojM-000000009S1-3ewM;
	Sun, 11 Oct 2026 08:16:28 +0000
Date: Sun, 11 Oct 2026 10:15:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.4-armsoc/dts64 68/68]
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dtb: ethernet-switch@29
 (realtek,rtl8365mb): False schema does not allow {'#address-cells': 1,
 '#size-cells': 0, 'ethernet-phy@0': {'reg': [[0]], 'interrupt-parent':
 [[164]], 'interrupts': [[0]], 'phandle': 1...
Message-ID: <202610111015.TXnM5uq7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Chukun Pan <amadeus@jmu.edu.cn>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.4-armsoc/dts64
head:   ae965b9856f033145e292b0c29082a26bcc45efd
commit: ae965b9856f033145e292b0c29082a26bcc45efd [68/68] arm64: dts: rockchip: Add Radxa E54C
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261011/202610111015.TXnM5uq7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610111015.TXnM5uq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610111015.TXnM5uq7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dtb: ethernet-switch@29 (realtek,rtl8365mb): False schema does not allow {'#address-cells': 1, '#size-cells': 0, 'ethernet-phy@0': {'reg': [[0]], 'interrupt-parent': [[164]], 'interrupts': [[0]], 'phandle': 166}, 'ethernet-phy@1': {'reg': [[1]], 'interrupt-parent': [[164]], 'interrupts': [[1]], 'phandle': 168}, 'ethernet-phy@2': {'reg': [[2]], 'interrupt-parent': [[164]], 'interrupts': [[2]], 'phandle': 170}, 'ethernet-phy@3': {'reg': [[3]], 'interrupt-parent': [[164]], 'interrupts': [[3]], 'phandle': 172}, 'ethernet-phy@4': {'reg': [[4]], 'interrupt-parent': [[164]], 'interrupts': [[4]]}}
   	from schema $id: http://devicetree.org/schemas/net/dsa/realtek.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
