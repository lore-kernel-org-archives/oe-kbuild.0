Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B5B23EAB3
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616826; cv=none; b=Qu4XddxnefqUPm80kHC7HHPgsVb3jlqQA0EOzifrjxPxaJQ+zuueQrRCRufwtQtn605eGdEv+oez408UEF6a2Sc4Yrd5L/QnTMRDYdEUlUaBgmValf+E+jxbExbIrl+sPgYthWCf2SstZN2lPfMcZGAftJaVS70G4ZLlgpiRi48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616826; c=relaxed/simple;
	bh=r0Qgi7rRdme2muuUT4mAjh/zjB4q5hODB5+Zn/VDNBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNEceyT6pOV9zLKnoivurEeUbx7CAksSOasjzZEhDhLXZpfvfivlicEZmTJw/6yP6+l9PuiiCV1vkFTnea1VRMi8qQy7yrhS8GS7bu0dqwaIefGS9L6X/VobuZctCVppX12jur53ZxrVyr+I2RyaVzf8SrXkmn3dXWcRyCT+Nn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbV+M1QY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbV+M1QY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775616823; x=1807152823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r0Qgi7rRdme2muuUT4mAjh/zjB4q5hODB5+Zn/VDNBs=;
  b=DbV+M1QYDiZqEGOzCzSiAGMuo58T8+otavFtKFIs9s4KGd+rHNdtyLs5
   fZ/3ynQqSBXeHP1XY/Lk4Dmh/QFf1CXINm/ismt6s8nf/BXboKDlZrLDH
   qHKjSR4SojSE5wzUINitZj8fFQuKoXyQt2bGxNC+MjojP32v7BE80+Erw
   YjKZq6WIB2q4kd7i2x5XkpFNVOMZ6QSzZa1eGBHECmBvWJJmxBH3jG5xA
   QeXPhqDMjlojX2Je6YnB+nWbmze3DKi6+GRLyYPYSFFDD6Nnsc3c3ZhDU
   IYOBO/qh0n9Fhvj01+h3xJx60p3UMzxtvOWYSye7HoBXpvVcYgmPZShNO
   A==;
X-CSE-ConnectionGUID: EYeoYC5ARzy7dJGKtOXycw==
X-CSE-MsgGUID: vzP/QlLIQgu0rjGt4Poj5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="94175340"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="94175340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 19:53:43 -0700
X-CSE-ConnectionGUID: 3m9hEu9vSWODm4eh5SDprw==
X-CSE-MsgGUID: vx8lCk6+Q8OWv1O1u2hfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="225585902"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2026 19:53:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAJ2y-00000000AOP-24Jf;
	Wed, 08 Apr 2026 02:53:40 +0000
Date: Wed, 8 Apr 2026 04:53:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
Message-ID: <202604080428.xvA8Ugma-lkp@intel.com>
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
In-Reply-To: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
TO: "karthik.s" <karthik.s@oss.qualcomm.com>
TO: Srinivas Kandagatla <srini@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
CC: linux-sound@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "karthik.s" <karthik.s@oss.qualcomm.com>

Hi karthik.s,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v7.0-rc7 next-20260407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/karthik-s/ASoC-codecs-wcd937x-Add-conditional-regulator-control-for-wcd937x/20260407-210725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260402072256.2811085-1-karthik.s%40oss.qualcomm.com
patch subject: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator control for wcd937x
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: openrisc-randconfig-2051-20260407 (https://download.01.org/0day-ci/archive/20260408/202604080428.xvA8Ugma-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080428.xvA8Ugma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604080428.xvA8Ugma-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml: properties:qcom,always-on-supply: 'type' is not one of ['description', 'deprecated']
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
