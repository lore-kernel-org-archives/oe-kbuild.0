Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF100291C36
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691737; cv=none; b=Hmz0dG8fCaNH38iH+8zC6xxnrRFIYsiwGw93HE+elPSbPb/1H+g3MYuwWn7BYuphMNr7ZhGpMpQpEOdkHAAa3YkrIdvrctlcufDOEsY64+gXAMgOvEN+7yeCCKjo2/WJydazAe8T4B/wGWX47uoxKe0lWwld1WLyO0e7w1RoprI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691737; c=relaxed/simple;
	bh=q7sSNzk+8LCHnagqmsvgJBrzj6qoB7yCu0hjujvAPWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qLxYBLc/VbA18OvIqwLdtGXIwV/UZbtNdLmnTJb8K/RCdFpB7zz9jcjpAYSUleMfV+7cUer+lm38yZWWSavfYX5ZPWuDbnb8uFm6LadZxK2a6gkKrH8rn2kgDIpBBGWV6B2sMSnOKEkiyWm1SEESqIuMpFlwaKh4mSnEwnFvOsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fawF5Aa3; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fawF5Aa3"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73a8d0e3822so2196008a34.2
        for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691734; x=1751296534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTfj4nts57jcFtJZ+F9J6L0zMoCmBvm/T2xwE+cda6U=;
        b=fawF5Aa3HKh27pa7joKo1FaXysIaWKqXN18F0fUW9V1D+LnuDuQvPzj3ZubKFlPSru
         ekNreAjawoSfDIHcZvYGXEyNdqYZKM/5KbNiS5orBWoV6Y7xeRcxUNDFaEGFNKWlZ06/
         cOvA/2OjzBbNFTUKU2gcy07X2vggzHX1V+WX8bA04KgKZQ9iR8qjLiWW3m/5pnKwMZK9
         lTlewS5GKKOstxc4H9006UbU4ySuvLc8iTo1bFdWSmN5yD5n9xUm4Ta59LYGMFvc7YMR
         yWZR7U9+kGyIukwf5TjejAAP7ec47sSagfeQ0aMlLfIZI2IKN2f0HEtdHp4r5iNg8Tfe
         o+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691734; x=1751296534;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTfj4nts57jcFtJZ+F9J6L0zMoCmBvm/T2xwE+cda6U=;
        b=A03qItuf3UkpVDHEDToP8+aI9wC9skQfyC8GnjkGT1FUg+FYqHc4SqKgoUueTJZzYT
         6ELND4X2wGOnPK6X91GfxOklINk7HB9ld0PEhbVFH0zuv2JZ1ih7w0LPU+13TV9sOU8e
         z2mIsdZsFkcebIfJd5sLJ8/nlpE9m1Fh6B0r9sJsPd/aWI3FG69kgbnjDnuBHk/e0GjO
         0Nij/qg8nMbiJpwAvTrf1O16tdrowGPmkHf+1YvNjtlarnSvyI0IcYyLnkIyCjQjNuSy
         gIXkVywjyfZuNMKcZNLaGzuYHkcbAsYJbciFnVkjoJCZIhRoqyzlgtWZ/DvCMSFyKQ0u
         Li7Q==
X-Gm-Message-State: AOJu0YxRlYXcdtaKUNIcrSxpAoaX76oElxImhzVM0ojBedMXVTlvEyaS
	0/NkSp2dEs3fWaiqM22xyywE+YYX8KGaKas56SlGxaA7kpt1rxowbXSZ8YORbgsI7g8jNQ6jA2n
	7aE0j
X-Gm-Gg: ASbGnctz/K0kNTSgjK1BrGx5rCIaZNuZVBRAIL9C4NrdGNIiR6n+8/CxD1JU89l9gCO
	AUJ9id52tQ5GNR4VYZ+fFH5OqhR/Ciavbf0194VaTb5YeT0AggU9+hdo3a2rT2OQi97gbRVuQXL
	ieNZG5NL6gNh3c4gGZZkvpix8WlmpkU04gMcJXMRozi3eCFEb/7P2u1D7ARhw06XFTUu02QVsO8
	bH1c/plQF4BlmGGH5eZdtOl0Uiv9k+j90kg9G/bNG3ih8vRFIe0yGAgGdwu1k24j2U4ZI0C83ca
	6MUxiKzfrwu6crobMk6tjihX49dFwQxDzLBE7FMUkltfsV84J2Kx8fwsgEaORxUjhYNV/Q==
X-Google-Smtp-Source: AGHT+IFGOPmtqg7Lp4Kn7CgrXA9DtIsCo3jYjnY5DNjx5Ly5+LKVsGIHILNSrXEzujvikHfdjfdH3Q==
X-Received: by 2002:a05:6830:8208:b0:73a:8a8a:5159 with SMTP id 46e09a7af769-73a91c05183mr8709264a34.5.1750691734010;
        Mon, 23 Jun 2025 08:15:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90b1b7b0sm1485988a34.21.2025.06.23.08.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:15:33 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:15:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 12/16] drm/drm_of: Keep up with refcounting
Message-ID: <adc32694-69f9-487e-a83f-e1f284a54904@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-12-0df94aecc43d@redhat.com>

Hi Anusha,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/drm-panel-get-put-panel-reference-in-drm_panel_add-remove/20250620-032045
base:   60ba94338047bb5410a3626ced3380afe9285ed8
patch link:    https://lore.kernel.org/r/20250619-b4-of_drm_find_panel_part1-v2-12-0df94aecc43d%40redhat.com
patch subject: [PATCH v2 12/16] drm/drm_of: Keep up with refcounting
config: arm-randconfig-r073-20250623 (https://download.01.org/0day-ci/archive/20250623/202506232158.z2O78kPL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506232158.z2O78kPL-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_of.c:283 drm_of_find_panel_or_bridge() error: we previously assumed 'panel' could be null (see line 263)

vim +/panel +283 drivers/gpu/drm/drm_of.c

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

panel can be NULL.

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
                                                            ^^^^^
This code assumes panel can be NULL.

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
                                                                      ^^^^^^
Unchecked dereference.

28d4456c6f3538 Anusha Srivatsa   2025-06-19  284  
169466d4e59ca2 Bjorn Andersson   2022-04-20  285  	of_node_put(remote);
169466d4e59ca2 Bjorn Andersson   2022-04-20  286  	return ret;
1f2db3034c9f16 Rob Herring       2017-03-22  287  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

