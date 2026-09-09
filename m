Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC08335C183
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 04:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929906; cv=none; b=aSfo9JaW4fIgjfJGgTWlXAb82d3OyaA7OJuGZp/x1N8rBVq8sIWBeAUbKtIAezR3OLYri4ya5cRZ7mIkZpAHq5V6ARbqhL6GGAHO0LK60lTvniKbig6p3VFJIQ8yl7OV4LQfmZtvDe/JTJm1fizLAXdNZT+KYWEcPkN0GW6sO3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929906; c=relaxed/simple;
	bh=l0ATmuFAyJSd/YxSlG+G/eXSaHfssVpIs52Xi7lahJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WbqZgCYsOY+w26u8lWtNB2jyblqV4VGmGZknixxbqXnnoIj8scf+82etOLdJ7rtObj667VJsgUnZxtwJ0R4HS/YfgmmOMkwUFq0xavNMCdiHOBiOOV6h2rn0h9vOkqbTgxv93OlsxlDczC+YwOqMGhONPqLyU8oMlYytpxSWQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwmPD8a0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwmPD8a0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788929902; x=1820465902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0ATmuFAyJSd/YxSlG+G/eXSaHfssVpIs52Xi7lahJI=;
  b=cwmPD8a06THzwH28NjXzZlaJVnDvm7PgQdwZJCsvIJyJlRxSIxGuPagj
   MNXrFQSXxuHIFyJufsBqAB0sX7sRGWQoFLby/TYUmWEbV3w8dICUGV4zS
   KgNq7YEU0u+DwKbQW7PAwBGQ5uzztwAhL3XnSAY2zTPIS/QGrwDU7le7u
   FJi5pQdVvI+3ZqeTXL2UwkKolz0kKtY/oJEfkUCpcj3dIrO70fGbjCfIp
   uqNbJOdPF6KV5YpHOLfN9rkgir7UxY20EFJaMe9UZgdLORDHrdESFuHbo
   Px2Sp+8rYDdaVNq9hfi5UrnG9TifE7YbzQHwEP1jGg1dh+uBDN6y+MUUH
   Q==;
X-CSE-ConnectionGUID: e0eGmt9cR8KTwEuJ3WJ0Jg==
X-CSE-MsgGUID: FVv5cs1KS3WhyWxaiNybFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89468625"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89468625"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 21:58:20 -0700
X-CSE-ConnectionGUID: kAypjWLjQx2eDpF4aQWP3w==
X-CSE-MsgGUID: HXi0G65URkKBHLQ76IiHbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="271700200"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Sep 2026 21:58:19 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4AO1-00000000146-0N7x;
	Wed, 09 Sep 2026 04:58:17 +0000
Date: Wed, 9 Sep 2026 06:57:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] MAINTAINERS: Add Qualcomm QAIF driver entry
Message-ID: <202609090624.axJcwPv7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260903072902.3870009-11-harendra.gautam@oss.qualcomm.com>
References: <20260903072902.3870009-11-harendra.gautam@oss.qualcomm.com>
TO: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
TO: Srinivas Kandagatla <srini@kernel.org>
CC: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: linux-sound@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
CC: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
CC: Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
CC: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Hi Harendra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.3-rc2 next-20260908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harendra-Gautam/MAINTAINERS-Add-Qualcomm-QAIF-driver-entry/20260903-125901
base:   linus/master
patch link:    https://lore.kernel.org/r/20260903072902.3870009-11-harendra.gautam%40oss.qualcomm.com
patch subject: [PATCH v4] MAINTAINERS: Add Qualcomm QAIF driver entry
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260909/202609090624.axJcwPv7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609090624.axJcwPv7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/translations/zh_CN/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
