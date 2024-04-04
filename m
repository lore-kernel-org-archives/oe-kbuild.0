Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0176982D90
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Apr 2024 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712268617; cv=none; b=qnJn2CTnahfxOUdLYgu+LehUPLrXlP4Wyxt7fHdb+TGYMdIfOHlEacdtecsAZwsTFsxYuDyUHyZGlNRDlJO8e1GNPipzPEkVXgQbbjU8E/IiH31egZi3fSdNEXk0RbQuFJTNBC9eRYUGApMxYDhC44SHRzs/h8+9XqCfmaKsYVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712268617; c=relaxed/simple;
	bh=uRQfgDXa1hm1pUL1QsgjAtsAlY1qannw8cidag1CfTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/Bt+L8auJfuuHucQdxUt6RXA/xtT9Nqm//oeOysZIiiNrwELC6YrhDtZka8OF/aJ1855JhrygWksmZGIskGKOTsKzQggdvodsi6TZJet5zSh7pY1vqeiDB7M5LUXq3fVKiKbsKYke7Z27hVnDoDV16biO192cWil7R7vLi+lvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuLzcWoT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuLzcWoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712268615; x=1743804615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRQfgDXa1hm1pUL1QsgjAtsAlY1qannw8cidag1CfTQ=;
  b=cuLzcWoTf79Rjh5p7B2AWKyU8FvoUgGjrpbkdT/LFhIqAUHs3eHAH9hD
   0fD5t1Bafrw5xiocZswgiYQrNruxZTx6fR2yUMlpNEdDYzC4AYCLr2hYH
   lXd/NEi4Ay23N5mUZGe2DJCzbfuNXqzeAFqaVQ7DQJveP3+gmZNRtS7WI
   syrvhj45XTNtngAex/N8J8Y5OhX9YROxPYBrOODdmDzFLDAuFAXyn3Jot
   IgikdzI2p6dmq+iLzHZrLh/s5HdNaA9Qdc7V6+4WIY1RjHa6W1ezTsYrw
   gHRxVedmowhkFtOmP+ovk9VQQp461b9lElIsmQK5dzOAxu1VAY2Tay2VT
   g==;
X-CSE-ConnectionGUID: hBZ2cHC+R12QPALa4B00vw==
X-CSE-MsgGUID: kMZh/j1kQrau5iM/pQ1RZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7713984"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7713984"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 15:10:14 -0700
X-CSE-ConnectionGUID: w4E/xAgUTN6RCytMfAJ3kQ==
X-CSE-MsgGUID: zgS/ns89TZit30jd4YJLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18829581"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2024 15:10:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsVHe-0001ZC-2K;
	Thu, 04 Apr 2024 22:10:10 +0000
Date: Fri, 5 Apr 2024 06:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2024.04.03a 77/100] ERROR: modpost:
 "cmpxchg_emu_u8" [drivers/platform/surface/aggregator/surface_aggregator.ko]
 undefined!
Message-ID: <202404050645.1LvdkwGv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit b724f305ba75b638be402fd2f130108ee1c68d5b was found in branch paulmck-rcu/dev.2024.04.03a, not in new branch paulmck-rcu/dev.2024.04.03b"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2024.04.03a
head:   f6416a4a0ebe5a37b471f04b20992be201563e81
commit: b724f305ba75b638be402fd2f130108ee1c68d5b [77/100] squash! lib: Add one-byte and two-byte cmpxchg() emulation functions
:::::: branch date: 5 hours ago
:::::: commit date: 24 hours ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240405/202404050645.1LvdkwGv-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050645.1LvdkwGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404050645.1LvdkwGv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82365.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82092.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/asus_atk0110.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/ingenic-adc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-ams.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/counter/ftm-quaddec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/sound_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/drivers/snd-pcmtest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/pci/hda/snd-hda-cirrus-scodec-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/soc-topology-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-ab8500-codec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/renoir/snd-acp3x-rn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/yc/snd-soc-acp6x-mach.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/acp/snd-acp-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/acp/snd-acp-pdm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/acp/snd-acp-legacy-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/acp/snd-acp-pci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/ps/snd-soc-ps-mach.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-dma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-da7219.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-dmic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-es8336.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-i2s-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-max98927.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-max98357a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-max98373.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-nau8825.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-probe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt274.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt286.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt298.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt5514.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt5663.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt5682.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-ssm4567.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/mxs/snd-soc-mxs-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-sdw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/qdsp6/snd-q6dsp-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-hda-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-hda-mlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-hda.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-pci-intel-tng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-pci-intel-skl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-pci-intel-apl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-pci-intel-cnl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-pci-intel-icl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-pci-intel-tgl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-pci-intel-mtl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-pci-intel-lnl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8m.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8ulp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/imx-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mtk-adsp-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8195/snd-sof-mt8195.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8186/snd-sof-mt8186.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-of.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-pci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mbochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kobject-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kset-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/fprobe/fprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/video/fbdev.o
>> ERROR: modpost: "cmpxchg_emu_u8" [drivers/platform/surface/aggregator/surface_aggregator.ko] undefined!
>> ERROR: modpost: "cmpxchg_emu_u16" [drivers/platform/surface/aggregator/surface_aggregator.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
