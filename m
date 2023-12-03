Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFF93D79
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfowgyIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701607615; x=1733143615;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oo8w91Xa2rLvmCBxu5C54NyK5veOpdhRPtrZh/Kdd5w=;
  b=XfowgyIHCx1f2/B17wH9OpiET1V2J/kKXiCkqp9O0Vqxzbogcz4y267c
   pU8P/HAOCcPzspaz5mcY44/x7H5APUWZ15ZDZEHHBYWndq1U0IQ6C8XNn
   xfhDUEkO7r4zzgrPm4Od/4j+eovvtkSahH7aCZlVH3cMKDEXDpITTK0vB
   CaxIe81dDKNbgdFA2bE9fPsZC58xMpcj/6+caOip5ZIYeM0YdY5t3IlEu
   jNab83aB1vU17QkezKTnHWzBWCRzLR5jfunLqwOAcUnYhyv4MEHbGjE6r
   AehZo092FRASXhdZVEHjinyfC46tnVROdYgi+wbHlQvvU2RuzrCKh+Pap
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="396454857"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="396454857"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 04:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="799295435"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="799295435"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Dec 2023 04:46:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9lrz-0006ek-2R;
	Sun, 03 Dec 2023 12:46:48 +0000
Date: Sun, 3 Dec 2023 20:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/sof/ipc4-topology.c:867:17-22: ERROR: invalid reference to
 the index variable of the iterator on line 855
Message-ID: <202312032038.6BAD5Gbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Jaska Uimonen <jaska.uimonen@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: "Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: aa84ffb721587d134702a1932f2c8793e8709df4 ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's
date:   1 year, 6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 6 months ago
config: i386-randconfig-053-20231130 (https://download.01.org/0day-ci/archive/20231203/202312032038.6BAD5Gbl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312032038.6BAD5Gbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312032038.6BAD5Gbl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/ipc4-topology.c:867:17-22: ERROR: invalid reference to the index variable of the iterator on line 855

vim +867 sound/soc/sof/ipc4-topology.c

904c48c40c66c5 Ranjani Sridharan 2022-06-08  843  
aa84ffb721587d Ranjani Sridharan 2022-06-08  844  #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
aa84ffb721587d Ranjani Sridharan 2022-06-08  845  static int snd_sof_get_hw_config_params(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
aa84ffb721587d Ranjani Sridharan 2022-06-08  846  					int *sample_rate, int *channel_count, int *bit_depth)
aa84ffb721587d Ranjani Sridharan 2022-06-08  847  {
aa84ffb721587d Ranjani Sridharan 2022-06-08  848  	struct snd_soc_tplg_hw_config *hw_config;
aa84ffb721587d Ranjani Sridharan 2022-06-08  849  	struct snd_sof_dai_link *slink;
aa84ffb721587d Ranjani Sridharan 2022-06-08  850  	bool dai_link_found = false;
aa84ffb721587d Ranjani Sridharan 2022-06-08  851  	bool hw_cfg_found = false;
aa84ffb721587d Ranjani Sridharan 2022-06-08  852  	int i;
aa84ffb721587d Ranjani Sridharan 2022-06-08  853  
aa84ffb721587d Ranjani Sridharan 2022-06-08  854  	/* get current hw_config from link */
aa84ffb721587d Ranjani Sridharan 2022-06-08 @855  	list_for_each_entry(slink, &sdev->dai_link_list, list) {
aa84ffb721587d Ranjani Sridharan 2022-06-08  856  		if (!strcmp(slink->link->name, dai->name)) {
aa84ffb721587d Ranjani Sridharan 2022-06-08  857  			dai_link_found = true;
aa84ffb721587d Ranjani Sridharan 2022-06-08  858  			break;
aa84ffb721587d Ranjani Sridharan 2022-06-08  859  		}
aa84ffb721587d Ranjani Sridharan 2022-06-08  860  	}
aa84ffb721587d Ranjani Sridharan 2022-06-08  861  
aa84ffb721587d Ranjani Sridharan 2022-06-08  862  	if (!dai_link_found) {
aa84ffb721587d Ranjani Sridharan 2022-06-08  863  		dev_err(sdev->dev, "%s: no DAI link found for DAI %s\n", __func__, dai->name);
aa84ffb721587d Ranjani Sridharan 2022-06-08  864  		return -EINVAL;
aa84ffb721587d Ranjani Sridharan 2022-06-08  865  	}
aa84ffb721587d Ranjani Sridharan 2022-06-08  866  
aa84ffb721587d Ranjani Sridharan 2022-06-08 @867  	for (i = 0; i < slink->num_hw_configs; i++) {
aa84ffb721587d Ranjani Sridharan 2022-06-08  868  		hw_config = &slink->hw_configs[i];
aa84ffb721587d Ranjani Sridharan 2022-06-08  869  		if (dai->current_config == le32_to_cpu(hw_config->id)) {
aa84ffb721587d Ranjani Sridharan 2022-06-08  870  			hw_cfg_found = true;
aa84ffb721587d Ranjani Sridharan 2022-06-08  871  			break;
aa84ffb721587d Ranjani Sridharan 2022-06-08  872  		}
aa84ffb721587d Ranjani Sridharan 2022-06-08  873  	}
aa84ffb721587d Ranjani Sridharan 2022-06-08  874  
aa84ffb721587d Ranjani Sridharan 2022-06-08  875  	if (!hw_cfg_found) {
aa84ffb721587d Ranjani Sridharan 2022-06-08  876  		dev_err(sdev->dev, "%s: no matching hw_config found for DAI %s\n", __func__,
aa84ffb721587d Ranjani Sridharan 2022-06-08  877  			dai->name);
aa84ffb721587d Ranjani Sridharan 2022-06-08  878  		return -EINVAL;
aa84ffb721587d Ranjani Sridharan 2022-06-08  879  	}
aa84ffb721587d Ranjani Sridharan 2022-06-08  880  
aa84ffb721587d Ranjani Sridharan 2022-06-08  881  	*bit_depth = le32_to_cpu(hw_config->tdm_slot_width);
aa84ffb721587d Ranjani Sridharan 2022-06-08  882  	*channel_count = le32_to_cpu(hw_config->tdm_slots);
aa84ffb721587d Ranjani Sridharan 2022-06-08  883  	*sample_rate = le32_to_cpu(hw_config->fsync_rate);
aa84ffb721587d Ranjani Sridharan 2022-06-08  884  
aa84ffb721587d Ranjani Sridharan 2022-06-08  885  	dev_dbg(sdev->dev, "%s: sample rate: %d sample width: %d channels: %d\n",
aa84ffb721587d Ranjani Sridharan 2022-06-08  886  		__func__, *sample_rate, *bit_depth, *channel_count);
aa84ffb721587d Ranjani Sridharan 2022-06-08  887  
aa84ffb721587d Ranjani Sridharan 2022-06-08  888  	return 0;
aa84ffb721587d Ranjani Sridharan 2022-06-08  889  }
aa84ffb721587d Ranjani Sridharan 2022-06-08  890  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
