Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD54248F66
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708746; cv=none; b=a6aXB1F1aV6QvilbDOIMZfY3sYD86MNopU3s3ulcqFhhlCeK7MV3cpOucyqZCpdCs8JrTQh7fBsTBd/sKItJNdv1xjmcDQ6OKCrpmTYx/mZczX8ize0D+04Iz9KmsCnDzqPLD4tpf2ZRuXlbI2C+qHIwUdz6wBbSuqbsTquZ7UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708746; c=relaxed/simple;
	bh=MzYMSxK0kaGueINPMc93GKoLk34rNivlup/ZGQuRG9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N5UikFMwgtyuDgVOKHq4IP2FEuey4euZ5H7X3wW+S9Pn/R67pzGluHKrw32czF7GzRlfnCTF51A108+SjT2/5H63raU5u/u9DecvPV50+/PsXcarvj2hbFrhDe/2aZLLEkh17OyRJ3flNeMQO+SIdivypzbXmCMDK6angVrhz4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bp9Rsmfc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bp9Rsmfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772708744; x=1804244744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MzYMSxK0kaGueINPMc93GKoLk34rNivlup/ZGQuRG9M=;
  b=Bp9RsmfcX5LnbtWlDM84oJNbb/WXe3KrBasG57xZIUgEEvjRYMVIkLDc
   wThVf8MIHpmUxEEOF0flthAm61iUmZ2BfxqlUeeP561Rqv0fn9FYsa5di
   EXXQVgiKC1BQekU7ECXTOsws2YRHKphXHaoiOy77/HD+tJxVKTU+G+zpm
   My/MBjLWq/mdtkgSFsOpWh37yRwpQ32f8hSdcqQMfnc1CcoAQ4gyVLsOa
   N/dQQjAu3ZgATwJ47E9A9nMXpfDDDqydJg8CrmeT2kVA5Hd0Nh2GtwzlO
   q5PQVx99y4eQl9zPfl7JVpqmEv4YbB3YkjP0prXHgYpC1Af9AwPvDP3dF
   A==;
X-CSE-ConnectionGUID: Cv9gT92DRTmo34/usMAV9A==
X-CSE-MsgGUID: 8bRTKPYCSviYKSguIIW52A==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84505908"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="84505908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 03:05:43 -0800
X-CSE-ConnectionGUID: A0FAf2J1TE+xxbovKRriPg==
X-CSE-MsgGUID: QalFxnnSRgGnwflBjAieKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="216921728"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 03:05:42 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy6WS-000000001yb-0sfH;
	Thu, 05 Mar 2026 11:05:40 +0000
Date: Thu, 5 Mar 2026 12:04:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
Message-ID: <202603051115.ec1LfoyS-lkp@intel.com>
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
In-Reply-To: <20260305022740.2334033-1-ot_meiker.gao@mediatek.com>
References: <20260305022740.2334033-1-ot_meiker.gao@mediatek.com>
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
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.16-rc1 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Meiker-Gao/spi-dt-bindings-mediatek-spi-mtk-nor-Add-clock-bindings-for-mt8189/20260305-103450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20260305022740.2334033-1-ot_meiker.gao%40mediatek.com
patch subject: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock bindings for mt8189
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: openrisc-randconfig-2051-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051115.ec1LfoyS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051115.ec1LfoyS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603051115.ec1LfoyS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:else:properties:clock-names: {'minItems': 2, 'maxItems': 2, 'items': [{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi'}, {'const': 'axi_s'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:then:properties:clock-names: {'minItems': 5, 'maxItems': 5, 'items': [{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
   	False schema does not allow 5
   	[{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}] is too long
   	[{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}] is too short
   	1 was expected
   	5 is greater than the maximum of 2
   	5 is greater than the maximum of 3
   	5 is greater than the maximum of 4
   	hint: "minItems" is only needed if less than the "items" list length
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
--
>> Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml:20:1: [warning] too many blank lines (2 > 1) (empty-lines)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
