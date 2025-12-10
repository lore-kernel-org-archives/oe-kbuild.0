Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA1B1E89C
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765374141; cv=none; b=mR6nkF+SIurzHm3Py5t3a7eEoEa3V322hSTZDL+YvjuZ+wUdkKulRyeTPqz3PbQlH17nwVnc1RzLKlB89AnjnwSdUDUA2k7OyKjg4Wk1KexB61IwbqOlEJ27p1WZCJgGyudgAp+C+JowxiKAHxcPdzf+XKqJoDlxcUhMYkyuBjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765374141; c=relaxed/simple;
	bh=uRz26H295EGN3g7Yv1IVbkBV+XuAWUHTbHhMJU4iT00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MemJ7eAMPUyoqpdUC3pdLjASrohkFIfUMpaMeFDU2CQj5ugVdtPWvDZt56s9v3HcwViWr94ZIgwHVhV/wpTTucEh3qoHQ183LCDNWsa0TrCfKJ7lM22/fjQ1EQCxvfCYL3gXuSuXNILUWWoj9XZiozH16UICNk4nBIgzlRNooT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=By0LVSOc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="By0LVSOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765374139; x=1796910139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRz26H295EGN3g7Yv1IVbkBV+XuAWUHTbHhMJU4iT00=;
  b=By0LVSOcrnSXsVUYoMkWr1kibBNl9baqlPRsqVA1L3J2bfYImcADCu22
   mkJq3yKactyRktZ/ijFEsCJK64D/p6nkb00pVKc2Z8CsnAwJYWMzk2wL4
   aLz+9TyNi1FZIWfSl6bA17KmLbSwRQx5U/I0GpnHgS7awSeKd3Q/9zwCH
   eF0/xLW5P1POSd6XzqTAe0jYtQE9OFyrM6A5Lxhpx/zn/8PBKot02Pib9
   kDG8/cv8PNohlol314CIfCIQDDiO8SJjS8UgrWqRA1wnWmvT6Ld9PI/5f
   IFEhgFfTarpe5qi09/YTMQFZTOC/yJAfxVvE8uDb2CmUSxKukJOj3Zabi
   g==;
X-CSE-ConnectionGUID: 9QVEfFYPSvqhb6JbqmcTTQ==
X-CSE-MsgGUID: ucezYDYxRIeZroPTpwNFRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67232637"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67232637"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:42:18 -0800
X-CSE-ConnectionGUID: ULwu8JwiQm2cpjG3wCVwng==
X-CSE-MsgGUID: aN5pzJ+7RXefM3TvqTrxqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196518738"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 05:42:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTKSM-000000003En-29Wl;
	Wed, 10 Dec 2025 13:42:14 +0000
Date: Wed, 10 Dec 2025 21:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v20 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202512102103.4w4OlP2O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>
References: <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>
TO: Pankaj Gupta <pankaj.gupta@nxp.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Pankaj Gupta <pankaj.gupta@nxp.com>
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Frank Li <Frank.Li@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251203-145202
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251203-imx-se-if-v20-3-a04a25c4255f%40nxp.com
patch subject: [PATCH v20 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251210/202512102103.4w4OlP2O-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512102103.4w4OlP2O-lkp@intel.com/

smatch warnings:
drivers/firmware/imx/ele_common.c:264 se_save_imem_state() warn: missing error code? 'ret'
drivers/firmware/imx/ele_common.c:302 se_restore_imem_state() warn: missing error code? 'ret'

vim +/ret +264 drivers/firmware/imx/ele_common.c

a9e23a74789346 Pankaj Gupta 2025-12-03  250  
a9e23a74789346 Pankaj Gupta 2025-12-03  251  int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
a9e23a74789346 Pankaj Gupta 2025-12-03  252  {
a9e23a74789346 Pankaj Gupta 2025-12-03  253  	struct ele_dev_info s_info = {0};
a9e23a74789346 Pankaj Gupta 2025-12-03  254  	int ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  255  
a9e23a74789346 Pankaj Gupta 2025-12-03  256  	ret = ele_get_info(priv, &s_info);
a9e23a74789346 Pankaj Gupta 2025-12-03  257  	if (ret) {
a9e23a74789346 Pankaj Gupta 2025-12-03  258  		dev_err(priv->dev, "Failed to get info from ELE.\n");
a9e23a74789346 Pankaj Gupta 2025-12-03  259  		return ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  260  	}
a9e23a74789346 Pankaj Gupta 2025-12-03  261  
a9e23a74789346 Pankaj Gupta 2025-12-03  262  	/* Do not save the IMEM buffer, if the current IMEM state is BAD. */
a9e23a74789346 Pankaj Gupta 2025-12-03  263  	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_BAD)
a9e23a74789346 Pankaj Gupta 2025-12-03 @264  		return ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  265  
a9e23a74789346 Pankaj Gupta 2025-12-03  266  	/*
a9e23a74789346 Pankaj Gupta 2025-12-03  267  	 * EXPORT command will save encrypted IMEM to given address,
a9e23a74789346 Pankaj Gupta 2025-12-03  268  	 * so later in resume, IMEM can be restored from the given
a9e23a74789346 Pankaj Gupta 2025-12-03  269  	 * address.
a9e23a74789346 Pankaj Gupta 2025-12-03  270  	 *
a9e23a74789346 Pankaj Gupta 2025-12-03  271  	 * Size must be at least 64 kB.
a9e23a74789346 Pankaj Gupta 2025-12-03  272  	 */
a9e23a74789346 Pankaj Gupta 2025-12-03  273  	ret = ele_service_swap(priv, imem->phyaddr, ELE_IMEM_SIZE, ELE_IMEM_EXPORT);
a9e23a74789346 Pankaj Gupta 2025-12-03  274  	if (ret < 0) {
a9e23a74789346 Pankaj Gupta 2025-12-03  275  		dev_err(priv->dev, "Failed to export IMEM.");
a9e23a74789346 Pankaj Gupta 2025-12-03  276  		imem->size = 0;
a9e23a74789346 Pankaj Gupta 2025-12-03  277  	} else {
a9e23a74789346 Pankaj Gupta 2025-12-03  278  		dev_dbg(priv->dev,
a9e23a74789346 Pankaj Gupta 2025-12-03  279  			"Exported %d bytes of encrypted IMEM.",
a9e23a74789346 Pankaj Gupta 2025-12-03  280  			ret);
a9e23a74789346 Pankaj Gupta 2025-12-03  281  		imem->size = ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  282  	}
a9e23a74789346 Pankaj Gupta 2025-12-03  283  
a9e23a74789346 Pankaj Gupta 2025-12-03  284  	return ret > 0 ? 0 : ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  285  }
a9e23a74789346 Pankaj Gupta 2025-12-03  286  
a9e23a74789346 Pankaj Gupta 2025-12-03  287  int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
a9e23a74789346 Pankaj Gupta 2025-12-03  288  {
a9e23a74789346 Pankaj Gupta 2025-12-03  289  	struct ele_dev_info s_info;
a9e23a74789346 Pankaj Gupta 2025-12-03  290  	int ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  291  
a9e23a74789346 Pankaj Gupta 2025-12-03  292  	/* get info from ELE */
a9e23a74789346 Pankaj Gupta 2025-12-03  293  	ret = ele_get_info(priv, &s_info);
a9e23a74789346 Pankaj Gupta 2025-12-03  294  	if (ret) {
a9e23a74789346 Pankaj Gupta 2025-12-03  295  		dev_err(priv->dev, "Failed to get info from ELE.");
a9e23a74789346 Pankaj Gupta 2025-12-03  296  		return ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  297  	}
a9e23a74789346 Pankaj Gupta 2025-12-03  298  	imem->state = s_info.d_addn_info.imem_state;
a9e23a74789346 Pankaj Gupta 2025-12-03  299  
a9e23a74789346 Pankaj Gupta 2025-12-03  300  	/* Get IMEM state, if 0xFE then import IMEM if imem size is non-zero. */
a9e23a74789346 Pankaj Gupta 2025-12-03  301  	if (s_info.d_addn_info.imem_state != ELE_IMEM_STATE_BAD || !imem->size)
a9e23a74789346 Pankaj Gupta 2025-12-03 @302  		return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
