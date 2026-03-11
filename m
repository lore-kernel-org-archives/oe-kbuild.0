Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C96B3C9EF3
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225296; cv=none; b=TFntFYl+S3fZFeVKV1z8rLijyDY/vaGo6l7r/7drY2PY5P88KR7sYrsdxLHx9a3d3pbtt/lK2NDhDt+3RT4/DhagvFXhUo1yjSppqIwL0qReRV3bEvfT0tLOcsTBHOVHpljHWQkIeZ21gH5BGth5UxEIe3mTGCu0aVXmvZLzSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225296; c=relaxed/simple;
	bh=Ozb7/evOn1MSElJhFmPWGpQvECETikpwo7S5Ak860p0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=naWv6bwbwhJ+6rNZ9S158lM7GQgKy99k7H59aHJodeHIESqqvitBS330rO9doq2pz2DG1S7xfE6FAoEWcvh1CurxIeZJWUxZef2QZ20qS6laYwJWXo9wxZMJtlfctdIBzQR/m6RsSHJeADIGHWXmUqZp1VeRNXQumH4ms6/zMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j14hSx1q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j14hSx1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773225294; x=1804761294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ozb7/evOn1MSElJhFmPWGpQvECETikpwo7S5Ak860p0=;
  b=j14hSx1qLQBITwyUSWU+Xxpso0xB3Aq+jKm4Bh5LTsXPKD5E9itEkZ0N
   DxrvkV9HQboRpnLt6GaDpNlYKsUSoKxxCZr2Qc2l3/B7HYSiD+hGt4sZw
   053bGWVYdzuUl6yHoJl+kahGB2eEPkcBBE5ZzfjdCIC3neg5a0ss601uI
   PKBFk7m7O8pFHqylwTO/OZlDqfjf6RI1kWlgxNW7qgIL2OGAFeBbTEx/i
   00BZCK63GPDpKrD6VIkiCSIpROJR/0rq4kqsh3oRZzfjRYJm6DjRD4wpj
   Z+y68SB88z2kW+CqqE/gS7OG5D1r3Yl+xo4Ar8l8a7EhFjYxZqndWbGXL
   g==;
X-CSE-ConnectionGUID: LlhEuyVgTsaiqgd4nBhMAw==
X-CSE-MsgGUID: Pri4BPovQI+njByM7j1qtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61862386"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="61862386"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 03:34:54 -0700
X-CSE-ConnectionGUID: S2H8v70jS7yADQnvq5VGUw==
X-CSE-MsgGUID: R+C65ihXQXOxop2C9A0nig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="246015868"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 03:34:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Gtu-000000003Iv-3JU2;
	Wed, 11 Mar 2026 10:34:50 +0000
Date: Wed, 11 Mar 2026 11:34:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
Message-ID: <202603111140.dEQ2uxSk-lkp@intel.com>
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
In-Reply-To: <20260311034342.721583-1-ot_meiker.gao@mediatek.com>
References: <20260311034342.721583-1-ot_meiker.gao@mediatek.com>
TO: Meiker Gao <ot_meiker.gao@mediatek.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Bayi Cheng <bayi.cheng@mediatek.com>
TO: Chuanhong Guo <gch981213@gmail.com>
CC: linux-spi@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com
CC: sirius.wang@mediatek.com
CC: vince-wl.liu@mediatek.com
CC: jh.hsu@mediatek.com
CC: Meiker Gao <ot_meiker.gao@mediatek.com>

Hi Meiker,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v7.0-rc3 next-20260310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Meiker-Gao/spi-dt-bindings-mediatek-spi-mtk-nor-Add-clock-bindings-for-mt8189/20260311-114624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20260311034342.721583-1-ot_meiker.gao%40mediatek.com
patch subject: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock bindings for mt8189
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: microblaze-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111140.dEQ2uxSk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111140.dEQ2uxSk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603111140.dEQ2uxSk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:then:properties:clock-names: {'maxItems': 5, 'items': [{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
