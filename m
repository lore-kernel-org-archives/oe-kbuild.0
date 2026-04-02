Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C335320A00
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112920; cv=none; b=vFrtICf0u0w7Aqcf/IVSEJnl+y1KWZ73L6RQNSC6omUy1ozxdoEUnsLHYjaz640sYWgGkIlkdsJSjn7Ju4wkfY2d5EQje2ATV8A5U5jMz+jH5nOUyh99rUmrSb/usLHS3+y4M2/SL2/2DVupt8Ul0wYDNU/E1NLF+rsa/HcQRO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112920; c=relaxed/simple;
	bh=FHn/Ew6O9/8hPru9AuMadMem3X+GIhGBJ9D6x8G8l6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rTm8KIUImmRxUitf4Y9wvLDwMrqWkr37/p8o0AQFIeSk8inxFkr00AFDS+vnMok39KlqDmHFcT/WDlNvw7u1hycy28jX/qq4wWciD6xwHWbs07B5BbHYLUFZ+u8GFFFCjnv/Hixyq4ksUCf0rEpOiBFiknQWux9oJo4j95C2BPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDuMhDHj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDuMhDHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775112920; x=1806648920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FHn/Ew6O9/8hPru9AuMadMem3X+GIhGBJ9D6x8G8l6c=;
  b=eDuMhDHjaxnDN3+eW/fcOzNclCLi2tHCLFWnoPofik6S/6huhWSjBIfl
   V9PHjNFEn8usMWwl6cmp02UdwrIbqVsNlJ4RCWdKWJ5HzQ56hdhtfJBxC
   ThLMBmsbGxopgQpfcTTNy89+LS/7nGHYixu/jqHug43NPyGoO4e3Xa/Gm
   OzyRIFPYjOvArk8BrMlHuf5Qry9sF0oSFagdPVtw6b3OVp3Dd1uSEnr9y
   17cCZpmS3vhYO/DSGeLfvIRUuWCEW8ldk6S5UqW2lo5XT25oiGn3GcBfX
   PBJwWOvlEoPxkNbsvFTNW1n8PhgKjHEQJ+G60bveRWEJQbRQhjNFGBFAQ
   g==;
X-CSE-ConnectionGUID: zszgo+RES6+tlBnn8JgGjg==
X-CSE-MsgGUID: MtsRVLy3Soid5QTHtYFeOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80023736"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="80023736"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:55:19 -0700
X-CSE-ConnectionGUID: jTacwFl8RHKv6Y29tjBq7g==
X-CSE-MsgGUID: 1Jt3WRqRTBq4NAOGXFdIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="257374773"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 01 Apr 2026 23:55:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8BxU-00000000913-0lP0;
	Thu, 02 Apr 2026 06:55:16 +0000
Date: Thu, 2 Apr 2026 08:54:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Message-ID: <202604020837.KM182aX5-lkp@intel.com>
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
In-Reply-To: <20260330083429.359819-4-l.scorcia@gmail.com>
References: <20260330083429.359819-4-l.scorcia@gmail.com>
TO: Luca Leonardo Scorcia <l.scorcia@gmail.com>
TO: linux-mediatek@lists.infradead.org
CC: Luca Leonardo Scorcia <l.scorcia@gmail.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Sen Chu <sen.chu@mediatek.com>
CC: Sean Wang <sean.wang@mediatek.com>
CC: Macpaul Lin <macpaul.lin@mediatek.com>
CC: Lee Jones <lee@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Linus Walleij <linusw@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Julien Massot <julien.massot@collabora.com>
CC: Gary Bisson <bisson.gary@gmail.com>
CC: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
CC: Val Packett <val@packett.cool>
CC: Fabien Parent <parent.f@gmail.com>
CC: Chen Zhong <chen.zhong@mediatek.com>
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-gpio@vger.kernel.org

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on broonie-regulator/for-next linusw-pinctrl/devel linusw-pinctrl/for-next lee-mfd/for-mfd-fixes linus/master v7.0-rc6 next-20260401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/dt-bindings-mfd-mt6397-Add-MT6392-PMIC/20260331-081127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260330083429.359819-4-l.scorcia%40gmail.com
patch subject: [PATCH v4 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260331 (https://download.01.org/0day-ci/archive/20260402/202604020837.KM182aX5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604020837.KM182aX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604020837.KM182aX5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/mfd/fsl,imx25-tsadc.yaml: Unresolvable reference: /schemas/input/touchscreen/fsl,imx25-tcq.yaml
>> Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml: 'maintainers' is a required property
   	hint: Metaschema for devicetree binding documentation
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
   Documentation/devicetree/bindings/mfd/maxim,max77620.yaml: Unresolvable reference: /schemas/pinctrl/maxim,max77620-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
