Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD83E23373D
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 02:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767665565; cv=none; b=EhCOJzXQK8ahUQlLUS9pH0Rb189Fdy9DAOVATClwxsiIQ41/Xa9sqYYj7qSvwZAkwdZv+w787C1zLrnJXGaA7ssJoMWQvhfkmATnvTak/4giXgugFJEfxO/jyLs90s0Zq8Ilv1/tgBTOqFEi39CqJHMMZQNpq4sx6UFAF0Z/PkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767665565; c=relaxed/simple;
	bh=CnWIu3vNdPyDHH2d4lcI1Ka2NFPqTEnxPRXJ6qAXQkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WwYrMzG2Za4k+f/7CqEJF+DJo21ze53HKPg+vbp0Ckxo37DJY++Uu0c9bDR3fDyhzonw2fVMzUyVboD8v0Q/e8wXbbkpvx8bNfUdzMa30Lb1amvskn1IryT9N0ZL59u1hmZ1BDt2nv8d8VIWv2BgxkpP/lWKwmOFVXgC1ijLB9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dn84/EFM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dn84/EFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767665564; x=1799201564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CnWIu3vNdPyDHH2d4lcI1Ka2NFPqTEnxPRXJ6qAXQkE=;
  b=dn84/EFMMrZRzanRqDFmhx011iAujYFs6FnRFUYco5qTY3aMNWZGm6/f
   LCbNu53JybKxsP/5/frOsqYy3LESvW7bDfGJqrEltZRFrKJCN1h8Ayws6
   hEvSFrEM/9STtpP3M/CD1BMKLlYHJYPiA3xtizFvm6KeUCTcSquuC/vBS
   J1htF14jkscoBTzfAyaqe2McxSX+mnEho/6hiW3+0ziemndFjzS6Y7QlO
   Ov/zlSHTXJKPJ0RX59YTZTU1tpq1fRAusxn4nBNYSygcx5z4wlnbbjcfk
   +uhTb5FvPbrwkf0MrzPtQXZaoUyuUFU1WbgjHPuAtzMx2MKaQzs0gsDEz
   Q==;
X-CSE-ConnectionGUID: 2zhmLFB4QYC90wzVPNP3rw==
X-CSE-MsgGUID: SNmtm+JSReODWdDfjrMnUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69109656"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="69109656"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 18:12:43 -0800
X-CSE-ConnectionGUID: BE0j4ZWNQimMdrITYV7X3w==
X-CSE-MsgGUID: 8nkLjpAnQpOybXEje38Aog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="203506350"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2026 18:12:42 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcwYq-000000001EP-0VFh;
	Tue, 06 Jan 2026 02:12:40 +0000
Date: Tue, 6 Jan 2026 03:12:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] [PATCH v1 2/2] arm64: dts: qcom: add Acer Swift
 SFA14-11 device tree
Message-ID: <202601060333.5IaLrWRS-lkp@intel.com>
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
In-Reply-To: <tencent_9C28E18B378E0835E704B3173AC4045BA606@qq.com>
References: <tencent_9C28E18B378E0835E704B3173AC4045BA606@qq.com>
TO: weifu wu <boss@oi-io.cc>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: weifu wu <boss@oi-io.cc>

Hi weifu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc4 next-20260105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/weifu-wu/arm64-dts-qcom-add-Acer-Swift-SFA14-11-device-tree/20260104-223900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/tencent_9C28E18B378E0835E704B3173AC4045BA606%40qq.com
patch subject: [PATCH 2/2] [PATCH v1 2/2] arm64: dts: qcom: add Acer Swift SFA14-11 device tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260105 (https://download.01.org/0day-ci/archive/20260106/202601060333.5IaLrWRS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060333.5IaLrWRS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601060333.5IaLrWRS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dtb: / (acer,swift-sfa14-11): compatible: 'oneOf' conditional failed, one must be fixed:
   	['acer,swift-sfa14-11', 'lenovo,thinkpad-t14s', 'qcom,x1e78100', 'qcom,x1e80100'] is too long
   	['acer,swift-sfa14-11', 'lenovo,thinkpad-t14s', 'qcom,x1e78100', 'qcom,x1e80100'] is too short
   	'acer,swift-sfa14-11' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'acer,swift-sfa14-11' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'acer,swift-sfa14-11' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'acer,swift-sfa14-11' is not one of ['qcom,apq8074-dragonboard']
   	'acer,swift-sfa14-11' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'acer,swift-sfa14-11' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'acer,swift-sfa14-11' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'acer,swift-sfa14-11' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
--
>> arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11-el2.dtb: / (acer,swift-sfa14-11): compatible: 'oneOf' conditional failed, one must be fixed:
   	['acer,swift-sfa14-11', 'lenovo,thinkpad-t14s', 'qcom,x1e78100', 'qcom,x1e80100'] is too long
   	['acer,swift-sfa14-11', 'lenovo,thinkpad-t14s', 'qcom,x1e78100', 'qcom,x1e80100'] is too short
   	'acer,swift-sfa14-11' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'acer,swift-sfa14-11' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'acer,swift-sfa14-11' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'acer,swift-sfa14-11' is not one of ['qcom,apq8074-dragonboard']
   	'acer,swift-sfa14-11' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'acer,swift-sfa14-11' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'acer,swift-sfa14-11' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'acer,swift-sfa14-11' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
