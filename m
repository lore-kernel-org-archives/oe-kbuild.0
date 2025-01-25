Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC51E480
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 01:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737769743; cv=none; b=Oa/wcEfnu5kicnFxAbb1EIYJxtNicvnZeMwzJKrnzE8CFx7HxZTpa/N+F8HIcarI5ulXqNQhtwYLXTPX/AXv9sm8CC8jvdq+cj8YM9bNeyXL8P3vzahmQPIZpwReCwLoxV0/kfzl+tL1v5k0c5BloisnR2PUigepjMvFhtR1LJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737769743; c=relaxed/simple;
	bh=5udTO9m9GwtdJjEXaHeyAhzYCIAU+hKUl734P/e5pEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2TEADmNQZiU+gF0Z7BjxFeBpN6SmbWhSuARmNToHkjggt3WzlkxAyTSL61X2FaSV6WpGUvKJp/8hwD1VvuLT4Kmmj5QHjRCnKTUy+IaRZxLtF7CJXUI+G1gYZ93x0pK586dbxlfJ6m1pJUt1KYc6VnZDNKGe/SYsUUkNImkSz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyperq7U; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyperq7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737769741; x=1769305741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5udTO9m9GwtdJjEXaHeyAhzYCIAU+hKUl734P/e5pEw=;
  b=eyperq7UELfSXOi0z27UjohJ5SerL1ogQv1Gm8w9A2pcoaK9uqb1aRJX
   7hiaBzTtJckKeyCpqovh9dQgvnM3drMhN7aAI+FENLwIOTg7A7y2TznXX
   5eFiuSdN1GRYuoWcx12SlEeTPlmnDxLKIzpWBdOxQ6+yzf7+HhW1kHTOk
   G87lU21W6VoywqY1SmTboRJUXmSXV/9tEpL/uyM8aDOlA6lVPnhyo9Cub
   fjgtjsqfYUnHTHDYgG6GS2yzR5g7NytsgRhCuhx32uLpL3HEqQQssfttO
   UKRXeQPhEn6dCHyS+haMWEGTc7BVA3zqxKDnlxri+aQvn01ESLv5Usvr6
   A==;
X-CSE-ConnectionGUID: bjtsX6QATTOle3a0wnSX/g==
X-CSE-MsgGUID: hh1KcRqQSSyZGF66E01MpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="25916733"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="25916733"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 17:49:00 -0800
X-CSE-ConnectionGUID: Xo0X1hthRuubNoSN/Xjcpw==
X-CSE-MsgGUID: 35p9mcfRTJCfKcNHJDHL1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="107908460"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jan 2025 17:48:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbVI8-000dMh-1f;
	Sat, 25 Jan 2025 01:48:56 +0000
Date: Sat, 25 Jan 2025 09:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jsarha:capture-hw-mute-indicator 6/9] sound/soc/sof/topology.c:2257
 sof_complete() error: uninitialized symbol 'ret'.
Message-ID: <202501250917.qfJzUa3V-lkp@intel.com>
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
TO: Jyri Sarha <jyri.sarha@linux.intel.com>

tree:   https://github.com/jsarha/linux capture-hw-mute-indicator
head:   34df55e2634f610fc34f29047badf07ddf41ba2e
commit: 23f60efe259d2228126035eca4d1e6fed89ea47e [6/9] ASoC: sof: capture-hw-mute-indicator: First HACK
:::::: branch date: 3 hours ago
:::::: commit date: 4 days ago
config: csky-randconfig-r072-20250125 (https://download.01.org/0day-ci/archive/20250125/202501250917.qfJzUa3V-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501250917.qfJzUa3V-lkp@intel.com/

New smatch warnings:
sound/soc/sof/topology.c:2257 sof_complete() error: uninitialized symbol 'ret'.

Old smatch warnings:
sound/soc/sof/topology.c:2105 sof_route_load() warn: missing error code 'ret'

vim +/ret +2257 sound/soc/sof/topology.c

2c28ecad0d099f Ranjani Sridharan 2021-09-27  2172  
311ce4fe7637d9 Liam Girdwood     2019-04-12  2173  /* completion - called at completion of firmware loading */
415717e1e367de Ranjani Sridharan 2021-09-27  2174  static int sof_complete(struct snd_soc_component *scomp)
311ce4fe7637d9 Liam Girdwood     2019-04-12  2175  {
311ce4fe7637d9 Liam Girdwood     2019-04-12  2176  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2177  	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2178  	const struct sof_ipc_tplg_widget_ops *widget_ops;
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2179  	struct snd_sof_control *scontrol;
9c04363d222bc9 Ranjani Sridharan 2023-01-27  2180  	struct snd_sof_pipeline *spipe;
415717e1e367de Ranjani Sridharan 2021-09-27  2181  	int ret;
311ce4fe7637d9 Liam Girdwood     2019-04-12  2182  
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2183  	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2184  
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2185  	/* first update all control IPC structures based on the IPC version */
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2186  	if (tplg_ops && tplg_ops->control_setup)
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2187  		list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2188  			ret = tplg_ops->control_setup(sdev, scontrol);
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2189  			if (ret < 0) {
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2190  				dev_err(sdev->dev, "failed updating IPC struct for control %s\n",
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2191  					scontrol->name);
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2192  				return ret;
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2193  			}
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2194  		}
b5cee8feb1d482 Ranjani Sridharan 2022-03-14  2195  
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2196  	/* set up the IPC structures for the pipeline widgets */
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2197  	list_for_each_entry(spipe, &sdev->pipeline_list, list) {
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2198  		struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2199  		struct snd_sof_widget *swidget;
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2200  
defc0c638d20ee Ranjani Sridharan 2023-08-07  2201  		pipe_widget->instance_id = -EINVAL;
defc0c638d20ee Ranjani Sridharan 2023-08-07  2202  
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2203  		/* Update the scheduler widget's IPC structure */
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2204  		if (widget_ops && widget_ops[pipe_widget->id].ipc_setup) {
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2205  			ret = widget_ops[pipe_widget->id].ipc_setup(pipe_widget);
7006d20e5e9d25 Ranjani Sridharan 2022-03-14  2206  			if (ret < 0) {
7006d20e5e9d25 Ranjani Sridharan 2022-03-14  2207  				dev_err(sdev->dev, "failed updating IPC struct for %s\n",
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2208  					pipe_widget->widget->name);
7006d20e5e9d25 Ranjani Sridharan 2022-03-14  2209  				return ret;
7006d20e5e9d25 Ranjani Sridharan 2022-03-14  2210  			}
7006d20e5e9d25 Ranjani Sridharan 2022-03-14  2211  		}
9c04363d222bc9 Ranjani Sridharan 2023-01-27  2212  
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2213  		/* set the pipeline and update the IPC structure for the non scheduler widgets */
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2214  		list_for_each_entry(swidget, &sdev->widget_list, list)
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2215  			if (swidget->widget->id != snd_soc_dapm_scheduler &&
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2216  			    swidget->pipeline_id == pipe_widget->pipeline_id) {
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2217  				ret = sof_set_widget_pipeline(sdev, spipe, swidget);
2c28ecad0d099f Ranjani Sridharan 2021-09-27  2218  				if (ret < 0)
2c28ecad0d099f Ranjani Sridharan 2021-09-27  2219  					return ret;
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2220  
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2221  				if (widget_ops && widget_ops[swidget->id].ipc_setup) {
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2222  					ret = widget_ops[swidget->id].ipc_setup(swidget);
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2223  					if (ret < 0) {
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2224  						dev_err(sdev->dev,
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2225  							"failed updating IPC struct for %s\n",
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2226  							swidget->widget->name);
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2227  						return ret;
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2228  					}
3d3e223f09ed59 Ranjani Sridharan 2023-03-21  2229  				}
2c28ecad0d099f Ranjani Sridharan 2021-09-27  2230  			}
311ce4fe7637d9 Liam Girdwood     2019-04-12  2231  	}
1b7d57d7178697 Ranjani Sridharan 2021-09-27  2232  
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2233  	/* verify topology components loading including dynamic pipelines */
12b401f4de7876 Peter Ujfalusi    2021-12-23  2234  	if (sof_debug_check_flag(SOF_DBG_VERIFY_TPLG)) {
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2235  		if (tplg_ops && tplg_ops->set_up_all_pipelines &&
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2236  		    tplg_ops->tear_down_all_pipelines) {
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2237  			ret = tplg_ops->set_up_all_pipelines(sdev, true);
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2238  			if (ret < 0) {
31cd6e469364c4 Ranjani Sridharan 2022-03-17  2239  				dev_err(sdev->dev, "Failed to set up all topology pipelines: %d\n",
31cd6e469364c4 Ranjani Sridharan 2022-03-17  2240  					ret);
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2241  				return ret;
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2242  			}
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2243  
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2244  			ret = tplg_ops->tear_down_all_pipelines(sdev, true);
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2245  			if (ret < 0) {
31cd6e469364c4 Ranjani Sridharan 2022-03-17  2246  				dev_err(sdev->dev, "Failed to tear down topology pipelines: %d\n",
31cd6e469364c4 Ranjani Sridharan 2022-03-17  2247  					ret);
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2248  				return ret;
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2249  			}
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2250  		}
31cd6e469364c4 Ranjani Sridharan 2022-03-17  2251  	}
c0e7969cf9c4fd Ranjani Sridharan 2021-09-27  2252  
1b7d57d7178697 Ranjani Sridharan 2021-09-27  2253  	/* set up static pipelines */
dbdbf88bdd4f29 Peter Ujfalusi    2022-12-21  2254  	if (tplg_ops && tplg_ops->set_up_all_pipelines)
23f60efe259d22 Jyri Sarha        2025-01-20  2255  		ret = tplg_ops->set_up_all_pipelines(sdev, false);
23f60efe259d22 Jyri Sarha        2025-01-20  2256  
23f60efe259d22 Jyri Sarha        2025-01-20 @2257  	if (ret < 0)
23f60efe259d22 Jyri Sarha        2025-01-20  2258  		return ret;
23f60efe259d22 Jyri Sarha        2025-01-20  2259  
23f60efe259d22 Jyri Sarha        2025-01-20  2260  	/* set up non topology mixers */
23f60efe259d22 Jyri Sarha        2025-01-20  2261  	if (tplg_ops && tplg_ops->control && tplg_ops->control->create_non_topology_controls)
23f60efe259d22 Jyri Sarha        2025-01-20  2262  		return tplg_ops->control->create_non_topology_controls(sdev);
31cd6e469364c4 Ranjani Sridharan 2022-03-17  2263  
31cd6e469364c4 Ranjani Sridharan 2022-03-17  2264  	return 0;
311ce4fe7637d9 Liam Girdwood     2019-04-12  2265  }
311ce4fe7637d9 Liam Girdwood     2019-04-12  2266  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
