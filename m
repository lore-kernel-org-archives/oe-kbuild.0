Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42527FA
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 05:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676785711; x=1708321711;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ybDyp5exGLTLm/ffLI21We0WYV9AT2rUICEUCw//18U=;
  b=W73wNxYqHR7ZAXInSGk8qTeD4N9Nd3X8VcjjBEBda1ssTeRCt6sLERIH
   gwUKJ5lR+uaI2f3B+CCBI6NPRYyvwKhu+cKwKiVx3n3freosKS6ulwJmG
   TuwjpDScL8TwFAREVb+OelpqK1tn+VIN4+MQqPSaiNfn+fmG7FbET83kO
   TTTrAaHAxPfMzlN/7KIt4a0JPQidHQAP3cnTzqveKgWZUX1oStWbnZT8M
   HsWsyM5krhzJMeCdDRRM3MhCvRtMneIrAfdwDSOvILcxQtMr9N1ZvZzL+
   1vtfBaqhREkqAc/3bRf0Yto2kEqi9CTgU8fYVB5uu+S/inkOis7L+pwt8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="333586896"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="333586896"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 21:48:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="620813988"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="620813988"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Feb 2023 21:48:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTcYk-000D4l-2J;
	Sun, 19 Feb 2023 05:48:26 +0000
Date: Sun, 19 Feb 2023 13:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/sof/topology.c:1780 sof_route_load() warn: missing error
 code 'ret'
Message-ID: <202302191307.w6f1Lcem-lkp@intel.com>
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
CC: "Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 31cd6e469364c42c9c929750991c51e83a95e80b ASoC: SOF: topology: Add ops for setting up and tearing down pipelines
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: openrisc-randconfig-m041-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191307.w6f1Lcem-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191307.w6f1Lcem-lkp@intel.com/

New smatch warnings:
sound/soc/sof/topology.c:1780 sof_route_load() warn: missing error code 'ret'

Old smatch warnings:
sound/soc/sof/topology.c:908 sof_control_load() warn: possible memory leak of 'scontrol'

vim +/ret +1780 sound/soc/sof/topology.c

909dadf21aae8f Ranjani Sridharan     2022-03-14  1742  
311ce4fe7637d9 Liam Girdwood         2019-04-12  1743  /* DAI link - used for any driver specific init */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1744  static int sof_route_load(struct snd_soc_component *scomp, int index,
311ce4fe7637d9 Liam Girdwood         2019-04-12  1745  			  struct snd_soc_dapm_route *route)
311ce4fe7637d9 Liam Girdwood         2019-04-12  1746  {
311ce4fe7637d9 Liam Girdwood         2019-04-12  1747  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1748  	struct snd_sof_widget *source_swidget, *sink_swidget;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1749  	struct snd_soc_dobj *dobj = &route->dobj;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1750  	struct snd_sof_route *sroute;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1751  	int ret = 0;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1752  
311ce4fe7637d9 Liam Girdwood         2019-04-12  1753  	/* allocate memory for sroute and connect */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1754  	sroute = kzalloc(sizeof(*sroute), GFP_KERNEL);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1755  	if (!sroute)
311ce4fe7637d9 Liam Girdwood         2019-04-12  1756  		return -ENOMEM;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1757  
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1758  	sroute->scomp = scomp;
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1759  	dev_dbg(scomp->dev, "sink %s control %s source %s\n",
311ce4fe7637d9 Liam Girdwood         2019-04-12  1760  		route->sink, route->control ? route->control : "none",
311ce4fe7637d9 Liam Girdwood         2019-04-12  1761  		route->source);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1762  
311ce4fe7637d9 Liam Girdwood         2019-04-12  1763  	/* source component */
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1764  	source_swidget = snd_sof_find_swidget(scomp, (char *)route->source);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1765  	if (!source_swidget) {
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1766  		dev_err(scomp->dev, "error: source %s not found\n",
311ce4fe7637d9 Liam Girdwood         2019-04-12  1767  			route->source);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1768  		ret = -EINVAL;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1769  		goto err;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1770  	}
311ce4fe7637d9 Liam Girdwood         2019-04-12  1771  
311ce4fe7637d9 Liam Girdwood         2019-04-12  1772  	/*
311ce4fe7637d9 Liam Girdwood         2019-04-12  1773  	 * Virtual widgets of type output/out_drv may be added in topology
311ce4fe7637d9 Liam Girdwood         2019-04-12  1774  	 * for compatibility. These are not handled by the FW.
311ce4fe7637d9 Liam Girdwood         2019-04-12  1775  	 * So, don't send routes whose source/sink widget is of such types
311ce4fe7637d9 Liam Girdwood         2019-04-12  1776  	 * to the DSP.
311ce4fe7637d9 Liam Girdwood         2019-04-12  1777  	 */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1778  	if (source_swidget->id == snd_soc_dapm_out_drv ||
311ce4fe7637d9 Liam Girdwood         2019-04-12  1779  	    source_swidget->id == snd_soc_dapm_output)
311ce4fe7637d9 Liam Girdwood         2019-04-12 @1780  		goto err;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1781  
311ce4fe7637d9 Liam Girdwood         2019-04-12  1782  	/* sink component */
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1783  	sink_swidget = snd_sof_find_swidget(scomp, (char *)route->sink);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1784  	if (!sink_swidget) {
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1785  		dev_err(scomp->dev, "error: sink %s not found\n",
311ce4fe7637d9 Liam Girdwood         2019-04-12  1786  			route->sink);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1787  		ret = -EINVAL;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1788  		goto err;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1789  	}
311ce4fe7637d9 Liam Girdwood         2019-04-12  1790  
311ce4fe7637d9 Liam Girdwood         2019-04-12  1791  	/*
311ce4fe7637d9 Liam Girdwood         2019-04-12  1792  	 * Don't send routes whose sink widget is of type
311ce4fe7637d9 Liam Girdwood         2019-04-12  1793  	 * output or out_drv to the DSP
311ce4fe7637d9 Liam Girdwood         2019-04-12  1794  	 */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1795  	if (sink_swidget->id == snd_soc_dapm_out_drv ||
311ce4fe7637d9 Liam Girdwood         2019-04-12  1796  	    sink_swidget->id == snd_soc_dapm_output)
311ce4fe7637d9 Liam Girdwood         2019-04-12  1797  		goto err;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1798  
311ce4fe7637d9 Liam Girdwood         2019-04-12  1799  	sroute->route = route;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1800  	dobj->private = sroute;
0a2dea1f101067 Ranjani Sridharan     2021-09-27  1801  	sroute->src_widget = source_swidget;
0a2dea1f101067 Ranjani Sridharan     2021-09-27  1802  	sroute->sink_widget = sink_swidget;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1803  
311ce4fe7637d9 Liam Girdwood         2019-04-12  1804  	/* add route to route list */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1805  	list_add(&sroute->list, &sdev->route_list);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1806  
b9f8e1387cf0c9 Guennadi Liakhovetski 2020-09-17  1807  	return 0;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1808  err:
311ce4fe7637d9 Liam Girdwood         2019-04-12  1809  	kfree(sroute);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1810  	return ret;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1811  }
311ce4fe7637d9 Liam Girdwood         2019-04-12  1812  

:::::: The code at line 1780 was first introduced by commit
:::::: 311ce4fe7637d96608b6e57bf9ebbd8aabcf429e ASoC: SOF: Add support for loading topologies

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
