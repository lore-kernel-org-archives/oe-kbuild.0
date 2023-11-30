Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2420B47A7A
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCcev3TX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701351509; x=1732887509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UepqnXKAgxUI6LCsqFzABM/bP2dr6LqN2rbBF71LQWE=;
  b=ZCcev3TXA1HpnmkNYCBzND2MAF9SsljdsB5G/lnRxA2KRomuAtTHeHbr
   zWyD9G9AKkpfWuVIW9qBt+acsW/0fm27J/8WAb5fgPhCmUpxpcnOhmOD6
   tIyHTjgT2cz1S61lMSDQzfsEIYlEgk6zvrloYvr3JsGCdK7QsnTQXUVGB
   +fC557P5QjjHKI0Zk2MtZPXpLTUPw0yVCJbNTtLZl8RSVnTYr9nOJ6xyn
   Q89pn7ZKrx7tBGBWfD3GWYeQLHsuUho9JZFHDalhF6pT6tnd7+D7asJ1T
   Q3e2xxXyKGAnWamW50m5k4gvcE/PI/bsoMZ464kn/lcVwBN0ep9dkeL5t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373509275"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="373509275"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 05:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719128188"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="719128188"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2023 05:38:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8hFH-00023K-1o;
	Thu, 30 Nov 2023 13:38:23 +0000
Date: Thu, 30 Nov 2023 21:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/sof/ipc4-control.c:62:1-7: preceding lock on line 41
Message-ID: <202311302123.VrgLKK5F-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: f94f3915274d22d5cd8b253e0533822b934f5f41 ASoC: SOF: Protect swidget->use_count with mutex for kcontrol access race
date:   10 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-053-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302123.VrgLKK5F-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311302123.VrgLKK5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202311302123.VrgLKK5F-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/ipc4-control.c:62:1-7: preceding lock on line 41

vim +62 sound/soc/sof/ipc4-control.c

955e84fc0b6df6 Ranjani Sridharan 2022-06-08  14  
f94f3915274d22 Peter Ujfalusi    2023-01-27  15  static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol,
f94f3915274d22 Peter Ujfalusi    2023-01-27  16  					  bool set, bool lock)
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  17  {
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  18  	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  19  	struct snd_soc_component *scomp = scontrol->scomp;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  20  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  21  	const struct sof_ipc_ops *iops = sdev->ipc->ops;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  22  	struct sof_ipc4_msg *msg = &cdata->msg;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  23  	struct snd_sof_widget *swidget;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  24  	bool widget_found = false;
f94f3915274d22 Peter Ujfalusi    2023-01-27  25  	int ret = 0;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  26  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  27  	/* find widget associated with the control */
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  28  	list_for_each_entry(swidget, &sdev->widget_list, list) {
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  29  		if (swidget->comp_id == scontrol->comp_id) {
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  30  			widget_found = true;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  31  			break;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  32  		}
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  33  	}
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  34  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  35  	if (!widget_found) {
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  36  		dev_err(scomp->dev, "Failed to find widget for kcontrol %s\n", scontrol->name);
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  37  		return -ENOENT;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  38  	}
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  39  
f94f3915274d22 Peter Ujfalusi    2023-01-27  40  	if (lock)
f94f3915274d22 Peter Ujfalusi    2023-01-27 @41  		mutex_lock(&swidget->setup_mutex);
f94f3915274d22 Peter Ujfalusi    2023-01-27  42  	else
f94f3915274d22 Peter Ujfalusi    2023-01-27  43  		lockdep_assert_held(&swidget->setup_mutex);
f94f3915274d22 Peter Ujfalusi    2023-01-27  44  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  45  	/*
f94f3915274d22 Peter Ujfalusi    2023-01-27  46  	 * Volatile controls should always be part of static pipelines and the
f94f3915274d22 Peter Ujfalusi    2023-01-27  47  	 * widget use_count would always be > 0 in this case. For the others,
f94f3915274d22 Peter Ujfalusi    2023-01-27  48  	 * just return the cached value if the widget is not set up.
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  49  	 */
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  50  	if (!swidget->use_count)
f94f3915274d22 Peter Ujfalusi    2023-01-27  51  		goto unlock;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  52  
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  53  	msg->primary &= ~SOF_IPC4_MOD_INSTANCE_MASK;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  54  	msg->primary |= SOF_IPC4_MOD_INSTANCE(swidget->instance_id);
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  55  
f94f3915274d22 Peter Ujfalusi    2023-01-27  56  	ret = iops->set_get_data(sdev, msg, msg->data_size, set);
f94f3915274d22 Peter Ujfalusi    2023-01-27  57  
f94f3915274d22 Peter Ujfalusi    2023-01-27  58  unlock:
f94f3915274d22 Peter Ujfalusi    2023-01-27  59  	if (lock)
f94f3915274d22 Peter Ujfalusi    2023-01-27  60  		mutex_unlock(&swidget->setup_mutex);
f94f3915274d22 Peter Ujfalusi    2023-01-27  61  
f94f3915274d22 Peter Ujfalusi    2023-01-27 @62  	return ret;
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  63  }
955e84fc0b6df6 Ranjani Sridharan 2022-06-08  64  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
