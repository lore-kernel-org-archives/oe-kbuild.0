Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF91EA8
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pl6ridZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585179; x=1733121179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=laDXN9ijJUIT1wVaTa4sWVV9ddBDXdh/b9AJ04gIPlQ=;
  b=Pl6ridZ7eNcZrx5zvtGxvnGBLDiIAhQlmjpQEsOrX6b80EPsPgaO5csl
   JLMlzYMKg8UiSGrwNr2x+q1grLGjweGQdexRjfYzx9hKpf5UljPd7Blq9
   UTzwzNABp82rVX4LvfcBPiInKlVmT5Jl5m1eQ4dU6ht3GRlnS3REEWGok
   Wbu8j6H8czrzOqRZdREUstZ2In53ilTOg4T75iOZTg8i6CUwR287Bv41L
   TG6Af6pb2mKoP1wLoIBb9WStD25g+LmquTvMVOyUTG35cUTSgfukxjiQL
   uI7AtaQ7dDFCj+yXLWJLjvk4nBpbGQpo6Iz8BOBYiK3DgO3zJ8pXm+l7z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180429"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180429"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081672"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081672"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g21-0006MK-02;
	Sun, 03 Dec 2023 06:32:45 +0000
Date: Sun, 3 Dec 2023 14:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/sof/sof-audio.c:309:34-40: ERROR: invalid reference to the
 index variable of the iterator on line 297
Message-ID: <202312031301.6ohMAu9n-lkp@intel.com>
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
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>
CC: Daniel Baluta <daniel.baluta@nxp.com>
CC: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: 5fcdbb2d45df6afb654674379546996b0027aa3e ASoC: SOF: Add support for dynamic pipelines
date:   2 years, 2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 years, 2 months ago
config: i386-randconfig-053-20231130 (https://download.01.org/0day-ci/archive/20231203/202312031301.6ohMAu9n-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031301.6ohMAu9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312031301.6ohMAu9n-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/sof-audio.c:309:34-40: ERROR: invalid reference to the index variable of the iterator on line 297

vim +309 sound/soc/sof/sof-audio.c

5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  268  
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  269  static int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsource,
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  270  			   struct snd_soc_dapm_widget *wsink)
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  271  {
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  272  	struct snd_sof_widget *src_widget = wsource->dobj.private;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  273  	struct snd_sof_widget *sink_widget = wsink->dobj.private;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  274  	struct snd_sof_route *sroute;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  275  	bool route_found = false;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  276  
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  277  	/* ignore routes involving virtual widgets in topology */
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  278  	switch (src_widget->id) {
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  279  	case snd_soc_dapm_out_drv:
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  280  	case snd_soc_dapm_output:
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  281  	case snd_soc_dapm_input:
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  282  		return 0;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  283  	default:
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  284  		break;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  285  	}
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  286  
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  287  	switch (sink_widget->id) {
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  288  	case snd_soc_dapm_out_drv:
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  289  	case snd_soc_dapm_output:
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  290  	case snd_soc_dapm_input:
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  291  		return 0;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  292  	default:
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  293  		break;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  294  	}
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  295  
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  296  	/* find route matching source and sink widgets */
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27 @297  	list_for_each_entry(sroute, &sdev->route_list, list)
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  298  		if (sroute->src_widget == src_widget && sroute->sink_widget == sink_widget) {
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  299  			route_found = true;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  300  			break;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  301  		}
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  302  
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  303  	if (!route_found) {
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  304  		dev_err(sdev->dev, "error: cannot find SOF route for source %s -> %s sink\n",
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  305  			wsource->name, wsink->name);
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  306  		return -EINVAL;
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  307  	}
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  308  
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27 @309  	return sof_route_setup_ipc(sdev, sroute);
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  310  }
5fcdbb2d45df6a Ranjani Sridharan 2021-09-27  311  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
