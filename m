Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B783628F5
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CU1Cxv+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701596278; x=1733132278;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+AmQhRHqN/jl3sAqBNeonbmH0XFyoBhnhPmmmZLDTtM=;
  b=CU1Cxv+R1E8V6//ZMRxO3heNarGgkbQJLepCQvspzdGUopQ0loe+XL6+
   zxum4goXb2sGCzHgEnpPZjBWJpKhulVdWXerRBUFd/SeGSfrvXB08vQJc
   fdmSKZ6dc5El290HyDgRmAcV8A85RczZkKJ0ywROLmrAwv/cYKrN4/1Vj
   mz8aTfRktTYx/3lA6l82W1OX4sELE13mR+KIB4rAQkOfiGaRBrNs/Hwiz
   gb5uvu/R5CdVGWbUQzlcZhLXJ6s0hq1pDU9fWoWSy88Kf8thWAj86KG2V
   IJZixzSyAqRJ7ZaCUcqa1m6furwKFu2BMfFCQZ+bMKeAAILYT4rw2zcDF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6949784"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="6949784"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 01:37:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="799267088"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="799267088"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Dec 2023 01:37:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9ivB-0006V6-0F;
	Sun, 03 Dec 2023 09:37:53 +0000
Date: Sun, 3 Dec 2023 17:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/sof/ipc4-control.c:43:6-13: ERROR: invalid reference to
 the index variable of the iterator on line 26
Message-ID: <202312031716.75pldwDz-lkp@intel.com>
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
CC: Rander Wang <rander.wang@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: 955e84fc0b6df6cfb95ee6f569be809af49d8287 ASoC: SOF: ipc4-topology: Add control IO ops
date:   1 year, 6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year, 6 months ago
config: i386-randconfig-053-20231130 (https://download.01.org/0day-ci/archive/20231203/202312031716.75pldwDz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031716.75pldwDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312031716.75pldwDz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/ipc4-control.c:43:6-13: ERROR: invalid reference to the index variable of the iterator on line 26
   sound/soc/sof/ipc4-control.c:148:38-45: ERROR: invalid reference to the index variable of the iterator on line 136

vim +43 sound/soc/sof/ipc4-control.c

955e84fc0b6df6 Ranjani Sridharan 2022-06-08  14  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  15  static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool set)
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  16  {
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  17  	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  18  	struct snd_soc_component *scomp = scontrol->scomp;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  19  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  20  	const struct sof_ipc_ops *iops = sdev->ipc->ops;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  21  	struct sof_ipc4_msg *msg = &cdata->msg;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  22  	struct snd_sof_widget *swidget;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  23  	bool widget_found = false;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  24  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  25  	/* find widget associated with the control */
955e84fc0b6df6 Ranjani Sridharan 2022-06-08 @26  	list_for_each_entry(swidget, &sdev->widget_list, list) {
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  27  		if (swidget->comp_id == scontrol->comp_id) {
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  28  			widget_found = true;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  29  			break;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  30  		}
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  31  	}
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  32  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  33  	if (!widget_found) {
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  34  		dev_err(scomp->dev, "Failed to find widget for kcontrol %s\n", scontrol->name);
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  35  		return -ENOENT;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  36  	}
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  37  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  38  	/*
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  39  	 * Volatile controls should always be part of static pipelines and the widget use_count
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  40  	 * would always be > 0 in this case. For the others, just return the cached value if the
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  41  	 * widget is not set up.
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  42  	 */
955e84fc0b6df6 Ranjani Sridharan 2022-06-08 @43  	if (!swidget->use_count)
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  44  		return 0;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  45  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  46  	msg->primary &= ~SOF_IPC4_MOD_INSTANCE_MASK;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  47  	msg->primary |= SOF_IPC4_MOD_INSTANCE(swidget->instance_id);
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  48  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  49  	return iops->set_get_data(sdev, msg, msg->data_size, set);
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  50  }
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
