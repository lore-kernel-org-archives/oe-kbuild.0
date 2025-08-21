Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5ED296BA0
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792281; cv=none; b=KTFNkstMoPsg3Fx+vurrnf0OahrBiZ57tH4EC7SUiD6iZqiqErr1zSQ0uaFy7oFF5zJFDszsU1kEsu2zOsil7wsqv59DUzvGdKW59i4c/YFvy0HQ+6plZeIqcztXhKfgEdP30BfZaLRAb83nPXvPTb27EnNXG7NM5ay0hsOYBH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792281; c=relaxed/simple;
	bh=6BgYBkA0C8nqXjpF8AuFrW54TgDmhuqVeFRuWj7LPn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=brjsPORAD/7WMDsbnlQcR+XkYMAGVej55S7/pi9ZEx82s9UaHVKWI164qtEv5ChSI87Q0Y3j844Gn2tdcAsjtjb+FVXCKJX4PAz3xzUB06AjXcfqXkDMg/MMfHb82ineWjbFg+JskgAo147IYdzDYxXppgDgImofxdlOQ/sfNBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwydCY/Y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwydCY/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755792280; x=1787328280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6BgYBkA0C8nqXjpF8AuFrW54TgDmhuqVeFRuWj7LPn4=;
  b=hwydCY/YvgQOHxPQs40gaF32X1HJfviXTnmIlQdnmYX66GX/V2WbcPNX
   oyFC8JcsbqsJxrBoi2HntTdasmGSenoXbWEhINqvErgG8kkie05+Uy0sd
   S3tspa6sRaBTNBG4rO9JT+0gXXOjRz6jjUodetwaA79k2iOh/CDvX4i/r
   O6xCd8FvyzZTieRg6w3Tv1r1AKlpSV45FWXZvpD6H71XnkdtCCMzxYwkP
   vfsRRa/4DShx0PTHBF/u/SPTG4MuYHt4S0w/1L1beBYZui90pigxfJ3c7
   crpACIS8fTDg7559NTayzXt0G1VnXP4jE0jmAE6jz1VJiTaCzLBtD4kNF
   w==;
X-CSE-ConnectionGUID: tgfluFObS8OMT/60ww3M1g==
X-CSE-MsgGUID: 295+VsspT4CX+/VQVPCR6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57290963"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57290963"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 09:04:37 -0700
X-CSE-ConnectionGUID: jAQDFQYKR+uIYX3sg4VvFQ==
X-CSE-MsgGUID: CJpUYiyLR4elKz2Xtb6BqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168363696"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Aug 2025 09:04:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up7mD-000KSV-2b;
	Thu, 21 Aug 2025 16:04:33 +0000
Date: Fri, 22 Aug 2025 00:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 10/14] regulator: dt-bindings: Convert Dialog
 Semiconductor DA9211 Regulators to YAML
Message-ID: <202508212352.x9FGWZ65-lkp@intel.com>
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
In-Reply-To: <20250820171302.324142-11-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-11-ariel.dalessandro@collabora.com>
TO: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
TO: airlied@gmail.com
TO: amergnat@baylibre.com
TO: andrew+netdev@lunn.ch
TO: andrew-ct.chen@mediatek.com
TO: angelogioacchino.delregno@collabora.com
TO: ariel.dalessandro@collabora.com
TO: broonie@kernel.org
TO: chunkuang.hu@kernel.org
TO: ck.hu@mediatek.com
TO: conor+dt@kernel.org
TO: davem@davemloft.net
TO: dmitry.torokhov@gmail.com
TO: edumazet@google.com
TO: flora.fu@mediatek.com
TO: houlong.wei@mediatek.com
TO: jeesw@melfas.com
TO: jmassot@collabora.com
TO: kernel@collabora.com
TO: krzk+dt@kernel.org
TO: kuba@kernel.org
TO: kyrie.wu@mediatek.corp-partner.google.com
TO: lgirdwood@gmail.com
TO: linus.walleij@linaro.org
TO: louisalexis.eyraud@collabora.com
TO: maarten.lankhorst@linux.intel.com
TO: matthias.bgg@gmail.com
TO: mchehab@kernel.org
TO: minghsiu.tsai@mediatek.com
TO: mripard@kernel.org
TO: p.zabel@pengutronix.de

Hi Ariel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on broonie-sound/for-next broonie-regulator/for-next linus/master v6.17-rc2 next-20250821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariel-D-Alessandro/media-dt-bindings-Convert-MediaTek-mt8173-mdp-bindings-to-YAML/20250821-011915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250820171302.324142-11-ariel.dalessandro%40collabora.com
patch subject: [PATCH v1 10/14] regulator: dt-bindings: Convert Dialog Semiconductor DA9211 Regulators to YAML
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212352.x9FGWZ65-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212352.x9FGWZ65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508212352.x9FGWZ65-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pwrap@1000d000 (mediatek,mt8173-pwrap): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: da9211@68 (dlg,da9211): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
