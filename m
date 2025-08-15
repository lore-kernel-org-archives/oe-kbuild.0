Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3727A11E
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Aug 2025 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755251265; cv=none; b=q1s8hy3mLyAP4AMBy6ltScVTXk633KDESm1je7iYhLeva9RFln8N+lHO8A+OKNGWWrwbRLrMEoGE819ymgGvRW6IyozyuVtVEdgelXi31d787H0LzazJen1ACsLUr664WxQVAmgiaQ05kuCePdEALxNRo5ASrd9bs7M8ZQhMOXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755251265; c=relaxed/simple;
	bh=7BbaOI6F7Jg1Y20VDmev08JegQra1TNk3nO+wEYEskQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgSEK9g314QJf8kpT4FHVEBDAwK4UNDxhW/RbtoWUmnMCQcALstk9a8t/RRj73r5wqcb0j9fgKVZaj095X3AZQA49omV6TUkQliULVIXdZ/YDJUOs+O5RuDdxX0I/BKNXjldfMUMgkCj1nf4NSgSfwnVrXLpD+pDsIom/TlVgfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzTRShTe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzTRShTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755251264; x=1786787264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7BbaOI6F7Jg1Y20VDmev08JegQra1TNk3nO+wEYEskQ=;
  b=SzTRShTeSGUeOUbZA9n8hyiELGar48MSr9t2H5FUfHshP2baKu5kRpqW
   LjIaPe25UBdKtsn/y2Y6ZnXcsNRxS2T/GPHwsfJvYFfayKwLpw8RfyGFH
   3CP7WpgiLbk9k/BsfT4orGGUi1cAlJxWLWmP+bDmO3q0WbnjVy+bEtC/Z
   Y2K26Ei7hA9f//yUIfkaablv91CyIvjkCDdTPY5/5fCyFS3pgYzqZELKl
   161TF/xP8VFHahH+JSCO+jZ2EiUeHeARFsja3VZrr/rbxdrjSciZHaj7s
   d3jAHpc3O2dNR0I5k1CP/i1gbTl/HNx7xB+sZovfgsg5b0sW46b/hOuwJ
   A==;
X-CSE-ConnectionGUID: pnRruwRtTVqCdRmUpvOKew==
X-CSE-MsgGUID: MFBRdq/NTXONjPifUop1tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61412541"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61412541"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:47:44 -0700
X-CSE-ConnectionGUID: 00Svuy3cRnCPH/oq70/BKw==
X-CSE-MsgGUID: qQOvJbFuTOiXXpnMqCC+IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171440267"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2025 02:47:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umr2C-000Bp2-03;
	Fri, 15 Aug 2025 09:47:40 +0000
Date: Fri, 15 Aug 2025 17:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] dt-bindings: phy: mtk-tphy: add property for
 software role switch
Message-ID: <202508151710.A0HZap2R-lkp@intel.com>
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
In-Reply-To: <20250814234825.810-1-me@adomerle.pw>
References: <20250814234825.810-1-me@adomerle.pw>
TO: Arseniy Velikanov <me@adomerle.pw>
TO: Chunfeng Yun <chunfeng.yun@mediatek.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: Arseniy Velikanov <me@adomerle.pw>

Hi Arseniy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arseniy-Velikanov/phy-mediatek-tphy-Add-software-role-switching/20250815-075416
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250814234825.810-1-me%40adomerle.pw
patch subject: [PATCH v1 1/2] dt-bindings: phy: mtk-tphy: add property for software role switch
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: csky-randconfig-051-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151710.A0HZap2R-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151710.A0HZap2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508151710.A0HZap2R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/mediatek,tphy.yaml: mediatek,software-role-switch: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
