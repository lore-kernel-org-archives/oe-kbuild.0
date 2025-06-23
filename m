Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583821F1522
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750684442; cv=none; b=d4kXT1w0p5XVEDG7hyXBmWXq1wyed4HtQMygBFniX7Wz3WMYLf9FvKWZCb28BGAUqqiqHQUWyq0ewgzQJy6r1rJkgNn+W7QKpgT3sYuG2lrmOzy2KL0JvuAhFxcRZZiRa1Zf6FcjWewSYN0V4lgc7rpMnkwjPEAbtnzIq2psaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750684442; c=relaxed/simple;
	bh=7RQhtX0LA3Cvka3Vrk/6uzvlvKJL1eJVJPy0RRsJZCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=elsDjNy9QElrEbA/7CG4yzFgKd7KV5iUoIvsVLYjL/qy/e65K9VNREpWGIeLmn3N8xAxeyddSy0rvenMJYOuhvXn5prRCuW6Ah6L6NiPjMpIJMt3Qy3ZajNzHdjqhfsL56EPWfC9HY0lWISMR59bmEKQ/DCJlGpRM5JBHqfFN8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFEVdqb+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFEVdqb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750684440; x=1782220440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7RQhtX0LA3Cvka3Vrk/6uzvlvKJL1eJVJPy0RRsJZCM=;
  b=lFEVdqb+/zBm1HKqmPrR0gaeVbwJhbYW+qsWBWDwkWC0cGAiAjI3N+6e
   5OvoQSyqBH2JAgGJ/hNt/Py4huQMYvoPgoeqrkuZhsOPttISoh2t0qqML
   uWBxCb/EigQl1GG9zaiSAOXjc4A5pUxcJ1i4ygMQauLt0YM3wLZEf7yWr
   tWa6D7vLNIT7UuMuja53inOfZod5g1NHQ09iUlXDAnSlJbrGc4PAp44j2
   yn/VZu+OTTy5ngUl2S01E+WQo2dQiO2xmISdq6z8Muwh4uqmki1MvofRe
   8sUVX0vcW7wWrtfWGGWQpXo7/xGYILjXLwHgZ9q1cDj56ZUiPnb1yByIj
   A==;
X-CSE-ConnectionGUID: JV/hrUVlRC65I0DEpBsjnQ==
X-CSE-MsgGUID: bPVTiOFOQdmxWUTqByp9HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70317749"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="70317749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:14:00 -0700
X-CSE-ConnectionGUID: Ljv0k18zRkGiiASzyFZDsw==
X-CSE-MsgGUID: 8j2naCH3TaKiXyaR+Xg+ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="188809423"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jun 2025 06:13:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTgzk-000OAk-01;
	Mon, 23 Jun 2025 13:13:56 +0000
Date: Mon, 23 Jun 2025 21:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 12/16] drm/drm_of: Keep up with refcounting
Message-ID: <202506232158.z2O78kPL-lkp@intel.com>
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
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-12-0df94aecc43d@redhat.com>
References: <20250619-b4-of_drm_find_panel_part1-v2-12-0df94aecc43d@redhat.com>
TO: Anusha Srivatsa <asrivats@redhat.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Inki Dae <inki.dae@samsung.com>
TO: Jagan Teki <jagan@amarulasolutions.com>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Samuel Holland <samuel@sholland.org>
TO: "Seung-Woo Kim" <sw0312.kim@samsung.com>
TO: Kyungmin Park <kyungmin.park@samsung.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
TO: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Biju Das <biju.das.jz@bp.renesas.com>
TO: Alain Volmat <alain.volmat@foss.st.com>
TO: "Raphael Gallais-Pou" <rgallaispou@gmail.com>
TO: Stefan Agner <stefan@agner.ch>
TO: Alison Wang <alison.wang@nxp.com>

Hi Anusha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 60ba94338047bb5410a3626ced3380afe9285ed8]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/drm-panel-get-put-panel-reference-in-drm_panel_add-remove/20250620-032045
base:   60ba94338047bb5410a3626ced3380afe9285ed8
patch link:    https://lore.kernel.org/r/20250619-b4-of_drm_find_panel_part1-v2-12-0df94aecc43d%40redhat.com
patch subject: [PATCH v2 12/16] drm/drm_of: Keep up with refcounting
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r073-20250623 (https://download.01.org/0day-ci/archive/20250623/202506232158.z2O78kPL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506232158.z2O78kPL-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_of.c:283 drm_of_find_panel_or_bridge() error: we previously assumed 'panel' could be null (see line 263)

vim +/panel +283 drivers/gpu/drm/drm_of.c

1f2db3034c9f16 Rob Herring       2017-03-22  219  
3fbdfe99f7523a Simona Vetter     2019-01-11  220  /**
1f2db3034c9f16 Rob Herring       2017-03-22  221   * drm_of_find_panel_or_bridge - return connected panel or bridge device
1f2db3034c9f16 Rob Herring       2017-03-22  222   * @np: device tree node containing encoder output ports
3fbdfe99f7523a Simona Vetter     2019-01-11  223   * @port: port in the device tree node
3fbdfe99f7523a Simona Vetter     2019-01-11  224   * @endpoint: endpoint in the device tree node
1f2db3034c9f16 Rob Herring       2017-03-22  225   * @panel: pointer to hold returned drm_panel
1f2db3034c9f16 Rob Herring       2017-03-22  226   * @bridge: pointer to hold returned drm_bridge
1f2db3034c9f16 Rob Herring       2017-03-22  227   *
1f2db3034c9f16 Rob Herring       2017-03-22  228   * Given a DT node's port and endpoint number, find the connected node and
1f2db3034c9f16 Rob Herring       2017-03-22  229   * return either the associated struct drm_panel or drm_bridge device. Either
1f2db3034c9f16 Rob Herring       2017-03-22  230   * @panel or @bridge must not be NULL.
1f2db3034c9f16 Rob Herring       2017-03-22  231   *
87ea95808d53e5 Maxime Ripard     2021-09-10  232   * This function is deprecated and should not be used in new drivers. Use
87ea95808d53e5 Maxime Ripard     2021-09-10  233   * devm_drm_of_get_bridge() instead.
87ea95808d53e5 Maxime Ripard     2021-09-10  234   *
1f2db3034c9f16 Rob Herring       2017-03-22  235   * Returns zero if successful, or one of the standard error codes if it fails.
1f2db3034c9f16 Rob Herring       2017-03-22  236   */
1f2db3034c9f16 Rob Herring       2017-03-22  237  int drm_of_find_panel_or_bridge(const struct device_node *np,
1f2db3034c9f16 Rob Herring       2017-03-22  238  				int port, int endpoint,
1f2db3034c9f16 Rob Herring       2017-03-22  239  				struct drm_panel **panel,
1f2db3034c9f16 Rob Herring       2017-03-22  240  				struct drm_bridge **bridge)
1f2db3034c9f16 Rob Herring       2017-03-22  241  {
169466d4e59ca2 Bjorn Andersson   2022-04-20  242  	int ret = -EPROBE_DEFER;
169466d4e59ca2 Bjorn Andersson   2022-04-20  243  	struct device_node *remote;
1f2db3034c9f16 Rob Herring       2017-03-22  244  
1f2db3034c9f16 Rob Herring       2017-03-22  245  	if (!panel && !bridge)
1f2db3034c9f16 Rob Herring       2017-03-22  246  		return -EINVAL;
320e421ea303b1 Dan Carpenter     2017-09-25  247  	if (panel)
320e421ea303b1 Dan Carpenter     2017-09-25  248  		*panel = NULL;
1f2db3034c9f16 Rob Herring       2017-03-22  249  
169466d4e59ca2 Bjorn Andersson   2022-04-20  250  	/*
169466d4e59ca2 Bjorn Andersson   2022-04-20  251  	 * of_graph_get_remote_node() produces a noisy error message if port
169466d4e59ca2 Bjorn Andersson   2022-04-20  252  	 * node isn't found and the absence of the port is a legit case here,
169466d4e59ca2 Bjorn Andersson   2022-04-20  253  	 * so at first we silently check whether graph presents in the
169466d4e59ca2 Bjorn Andersson   2022-04-20  254  	 * device-tree node.
169466d4e59ca2 Bjorn Andersson   2022-04-20  255  	 */
169466d4e59ca2 Bjorn Andersson   2022-04-20  256  	if (!of_graph_is_present(np))
169466d4e59ca2 Bjorn Andersson   2022-04-20  257  		return -ENODEV;
67bae5f28c895f Paul Kocialkowski 2022-03-29  258  
169466d4e59ca2 Bjorn Andersson   2022-04-20  259  	remote = of_graph_get_remote_node(np, port, endpoint);
169466d4e59ca2 Bjorn Andersson   2022-04-20  260  	if (!remote)
169466d4e59ca2 Bjorn Andersson   2022-04-20  261  		return -ENODEV;
169466d4e59ca2 Bjorn Andersson   2022-04-20  262  
169466d4e59ca2 Bjorn Andersson   2022-04-20 @263  	if (panel) {
169466d4e59ca2 Bjorn Andersson   2022-04-20  264  		*panel = of_drm_find_panel(remote);
169466d4e59ca2 Bjorn Andersson   2022-04-20  265  		if (!IS_ERR(*panel))
169466d4e59ca2 Bjorn Andersson   2022-04-20  266  			ret = 0;
169466d4e59ca2 Bjorn Andersson   2022-04-20  267  		else
169466d4e59ca2 Bjorn Andersson   2022-04-20  268  			*panel = NULL;
1f2db3034c9f16 Rob Herring       2017-03-22  269  	}
1f2db3034c9f16 Rob Herring       2017-03-22  270  
169466d4e59ca2 Bjorn Andersson   2022-04-20  271  	if (bridge) {
169466d4e59ca2 Bjorn Andersson   2022-04-20  272  		if (ret) {
9d60cf4e8cf7c4 Luca Ceresoli     2025-02-14  273  			/* No panel found yet, check for a bridge next. */
169466d4e59ca2 Bjorn Andersson   2022-04-20  274  			*bridge = of_drm_find_bridge(remote);
169466d4e59ca2 Bjorn Andersson   2022-04-20  275  			if (*bridge)
169466d4e59ca2 Bjorn Andersson   2022-04-20  276  				ret = 0;
169466d4e59ca2 Bjorn Andersson   2022-04-20  277  		} else {
169466d4e59ca2 Bjorn Andersson   2022-04-20  278  			*bridge = NULL;
169466d4e59ca2 Bjorn Andersson   2022-04-20  279  		}
169466d4e59ca2 Bjorn Andersson   2022-04-20  280  
169466d4e59ca2 Bjorn Andersson   2022-04-20  281  	}
169466d4e59ca2 Bjorn Andersson   2022-04-20  282  
28d4456c6f3538 Anusha Srivatsa   2025-06-19 @283  	drm_panel_put(*panel);
28d4456c6f3538 Anusha Srivatsa   2025-06-19  284  
169466d4e59ca2 Bjorn Andersson   2022-04-20  285  	of_node_put(remote);
169466d4e59ca2 Bjorn Andersson   2022-04-20  286  	return ret;
1f2db3034c9f16 Rob Herring       2017-03-22  287  }
1f2db3034c9f16 Rob Herring       2017-03-22  288  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
6529007522ded0 Fabrizio Castro   2019-12-17  289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
