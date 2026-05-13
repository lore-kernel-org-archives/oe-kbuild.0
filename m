Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5B3D75AF
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 07:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658284; cv=none; b=sc69u9bbiQD34bTjwh3Dk1iSGYphKiM2dOeAHON2+lXbUaqx0qG8ZmUtOz73VSrFtndZqToXmB+nlxGXCKgrnt4M0VvMK0rGMKHY1/xrpasDq767TDC6Ew8/1pbN3ZvHtAp8T+pwV580VH6EfdJakYMbL+xv/9CMCY1gVAbLd5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658284; c=relaxed/simple;
	bh=bzT3nU3zyUMCFwvNz0dGyJirvF94HcG0movoFPgdzP0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FEXL772IeRDfQnYXJ53MyGJR341iM4Pu8Nw1GhVUr6V4LbMrIib16OP23MGZJ3EYifT17j+PK6lrhjveg4ORR+dfjA3FWlPKmXRzDGtWkM91xL7C+Ds2GHhqVUbkJA0eEJGmI1pHeW/19a+suUkrPrzxJ+3nu8DVyfnOg3KFSgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfAjBxLy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfAjBxLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778658282; x=1810194282;
  h=date:from:to:cc:subject:message-id;
  bh=bzT3nU3zyUMCFwvNz0dGyJirvF94HcG0movoFPgdzP0=;
  b=mfAjBxLy0byzpWJmPQ/N3Zrc3hrD6qd0nxnZkNhRTkZsMPJo7tdf/AVG
   1NAa7B3sVHUBPtO7mwaqC05Cx2CwWkV5HAkhay/aRmZsfRH2KDTVJNU99
   Me99BqSQRsFhSFyAwqQ5RBy4pnDa8DPJ9bjA3vTyh8K/g9jD9IYdRDnNF
   ofo6CiwHHU9xmunGvPhya/BRRW2v3gkuYW6z10FsAA56wke1OCfahFfZP
   nkQOzaS5x6V//pYKzLREelUufM3YYte0hBDoEq++DFhnCqJ2mVtY9+d8f
   7z2l3lwvl9GH8vH8NcoZQrzLcoCB2+fXJugAZGvDZmMyA9zVmYxDNl7eb
   A==;
X-CSE-ConnectionGUID: OGNbkMBuTsqmb0BSNnSsVA==
X-CSE-MsgGUID: cswZqmLjShSQHNxt7aEeyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79691421"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79691421"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 00:44:41 -0700
X-CSE-ConnectionGUID: mNkW220ZR12LHpIR4jpQlQ==
X-CSE-MsgGUID: /P66bfDHR2606rcnngDQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237026236"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2026 00:44:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN4Gk-000000008W2-0cyP;
	Wed, 13 May 2026 07:44:38 +0000
Date: Wed, 13 May 2026 09:44:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.2 70/84]
 arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@1bd4000
 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required
 property
Message-ID: <202605130913.WdRbhv3X-lkp@intel.com>
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
TO: Xin Liu <xin.liu@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.2
head:   4a1779f42e21962381a9696d182a2620c830ff10
commit: bde860892c92a43624a7bcf932a1d375b1ad43eb [70/84] arm64: dts: qcom: purwa: Add EL2 overlay for purwa-iot-evk
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130913.WdRbhv3X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130913.WdRbhv3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130913.WdRbhv3X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
