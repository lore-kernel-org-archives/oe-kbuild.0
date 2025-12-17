Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B12957C2
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765990020; cv=none; b=oztjkHDb0EXK1105knMyOcNRnfc7bcPJBO5218xqRTQ861UY8bA7yfqfIlhwKUo+hR2sosEbgZXNXSVR0I6piURN+oFA3+LXTH1ZSAqAVzlFD7zp3+6tm5FZT2YPzP5GxZ5/i/xdEzRx/ZtUgpB71ib6qMJA8R13d4HS8ch5nBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765990020; c=relaxed/simple;
	bh=VpOL9JlBtP7bdE1z1uN/kCenbmRFLIDiCvm0y0YCMVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnId1Tt+pT/exInf8GA0zxU/D5tcNTVz9quPjX0V3a5JPc1QmMKT5wYOUl1d/1aSCT9YudsmRk8n8N507oH6zs+MLQ6Sv4WtVI2UO7R9Er9OzusAhO625/RJfGLhtNQtsHlXtJb4xhmyH7k3efFvDYg0898lK+Wnk7AB1pnf/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k58ir4ZO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k58ir4ZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765990017; x=1797526017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VpOL9JlBtP7bdE1z1uN/kCenbmRFLIDiCvm0y0YCMVI=;
  b=k58ir4ZOBziQNJjL5oJVfFXksXowWnYziXPBbOVkdWNBXYvPrKlPkmdR
   9rla/Morp+ypzHn5xK/GGb/fJICAh9c2otgGBnqmzwUzufFnkY1xogwaV
   vVSyoO1Vzrd3i9SGBRCSmD4FZsxs71XpAWWltpWA8EiJbO6kVsH2Xhs+b
   4V6kK172CH0XZLzqw1Dhiw21f806LYtqiR1rmI4l67YfEkeIYvEfIDrUw
   dgGFpK/peFP9E4SPZzLL/ardDd6Lg2n+qvXbOa8IiT4eHlHy9lzdCxuWA
   I1J+nViewUea2PvX12yKy+R0qTriYrnS5T5ci69Mza2cmbvB3xHfCE1YO
   w==;
X-CSE-ConnectionGUID: OdC3MkpcRpKQ0O5A2Uzi7A==
X-CSE-MsgGUID: 94AasHzySn28lDwJUm3n3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="93408266"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="93408266"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 08:46:57 -0800
X-CSE-ConnectionGUID: Lte03WzXT3uAorVlTwRtvA==
X-CSE-MsgGUID: tVvqaKpeQCusPHLeEZojQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229034495"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2025 08:46:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVuft-000000003dw-3SJT;
	Wed, 17 Dec 2025 16:46:53 +0000
Date: Wed, 17 Dec 2025 17:46:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 2/3] arm64: dts: mt8188-ciri: Split into base and
 overlays based on components
Message-ID: <202512171723.2HFMudgX-lkp@intel.com>
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
In-Reply-To: <20251208073306.75279-3-wenst@chromium.org>
References: <20251208073306.75279-3-wenst@chromium.org>
TO: "Chen-Yu Tsai" <wenst@chromium.org>

Hi Chen-Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20251217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-arm-mediatek-Add-generic-Ciri-base-board/20251208-154001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251208073306.75279-3-wenst%40chromium.org
patch subject: [RFC PATCH 2/3] arm64: dts: mt8188-ciri: Split into base and overlays based on components
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251217/202512171723.2HFMudgX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171723.2HFMudgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512171723.2HFMudgX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1281.7-1289.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
