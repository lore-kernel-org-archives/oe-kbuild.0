Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF35471EAE
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Feb 2024 18:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709145852; cv=none; b=er2qOGeYtaif3YXTwt8am1cZVxL4x/7N8N459QUFsQvqTtGEzBDwWuRrgTqnHT72jFsec54tpq57tnlGVltrNDJdQ58nkCD1RqVwRQlFzIa2iGxAxZOUyGpbu1cGgWLV/+r+A48zVKBxJe1coNhQE4w8Np047KC+1j3zkv37TeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709145852; c=relaxed/simple;
	bh=7XkIQYFR5NbWf+vIls0ZTPvsim8r85fchGB2LFsWYp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwHL1rt8NCMjg5wK0OfoKEWFV0Y4Myqp0txJ+oXGXf1bnhEHlknwUt1j9H7eTluHf0h5ScnLKb4MBk5EEUiu//fq3We/ABlthD2kqBoNmXrKQubJs1h6V/NFKvYY0xf4epHxJHgFMzKwX+AQS6x4ATmalOt9BdlJ72C1+HYd4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TveVwcOh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TveVwcOh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-412a3ebad2aso486535e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 28 Feb 2024 10:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709145849; x=1709750649; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RlL8J08fHvkzwmFzz95rsENMRtFT+pAtVTboOdHsxsk=;
        b=TveVwcOhXl7Wu8UyB/UqwuKNvq4vMrqUp8KF5bTkPbIq7SWP3xA4LaCz+LFvMpZcM2
         pLmARIowerxoinSRJXI5Z7t9kDTXO3loOovH/D1y8F54HTj3zS7MtgDadHnBZ4uK5Yoe
         pYccJi/5TbhvLPXnYkVXYFR42Y3cPZ3wNCwWphLu+clM+fyf+QXzOkjaR9v1k7ZXGjSs
         ubIdIs4NTUlx+dA1BFO5+9vk5DdY2ahhhL1H4FpAoaBkraxZOgywlx7iTPDEXEfsSRDW
         WC9RHrWDdQFFbTkFcCY5QHNOfZBzIal5u+6T5qDCF24990jHhCGV4Pn2uxX0IbxA2+mc
         2jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145849; x=1709750649;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RlL8J08fHvkzwmFzz95rsENMRtFT+pAtVTboOdHsxsk=;
        b=vOEBLBIkfDmf3DoeeWvXtlt0gkPNqVAVhVsywTBDWlLfoLVc6/JCLfKr4TViIJoZSf
         8cuGjdowpz5ZBvqkfLMtG3v2iPziBwMWr7gqhkJQoj1GLBrYCsHGnGb4RAz1Ql78bB3u
         e9DWReTEb4aQE+262ewgROqYjmSpa3YoJwyB4Qcpd8as04k2dFEQ1/ytEfozrrddeRT0
         20z7tNrvvONjkQMvGngF7eX128d0FLShonF98IN5+HFSKx9a7+hGEsBRLxMmKr7dlz3G
         0Ju0aZkiGGZMxfb8SZayhiuxpGDCZoT9rpVsTsTEq+pt8CWtBuba/6eSIRB45b6m04do
         icwg==
X-Gm-Message-State: AOJu0YyVyZr7PjHBEpwyvQdpFQi3kaj5617FuDUItR18VtB4Hhrhr1AF
	23K78eOxSZFGJjBnC5iM5kMRS6dxCl5ANXEMxWazOxmuO8Xyw0kzjg1yV9UTOHkM+CO1evBfp/I
	k
X-Google-Smtp-Source: AGHT+IEyjljEBQC9LqtwXuT1ZB5f2IOzrnDQ/4mGlz3bMEJc/uqPxYdUgAhInRbv1pmRB9y9CFP34A==
X-Received: by 2002:a05:600c:3486:b0:412:afed:5d06 with SMTP id a6-20020a05600c348600b00412afed5d06mr76626wmq.23.1709145848753;
        Wed, 28 Feb 2024 10:44:08 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id jj18-20020a05600c6a1200b004129e8af6absm2827632wmb.33.2024.02.28.10.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 10:44:08 -0800 (PST)
Date: Wed, 28 Feb 2024 21:44:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [esmil:th1520 3/29] drivers/pinctrl/pinctrl-th1520.c:499
 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'
Message-ID: <ac149c89-2ce3-4241-9754-6aa73377279b@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux th1520
head:   7f2988d92a4ae84f21fa512b2c15c4e007b7a9be
commit: 49128de47348770cd4f872628ce727613204a539 [3/29] pinctrl: Add driver for the T-Head TH1520 SoC
config: powerpc-randconfig-r071-20240227 (https://download.01.org/0day-ci/archive/20240229/202402290235.AqLIV39I-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402290235.AqLIV39I-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:499 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'

vim +/ret +499 drivers/pinctrl/pinctrl-th1520.c

49128de4734877 Emil Renner Berthing 2023-12-05  411  static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
49128de4734877 Emil Renner Berthing 2023-12-05  412  					 struct device_node *np,
49128de4734877 Emil Renner Berthing 2023-12-05  413  					 struct pinctrl_map **maps,
49128de4734877 Emil Renner Berthing 2023-12-05  414  					 unsigned int *num_maps)
49128de4734877 Emil Renner Berthing 2023-12-05  415  {
49128de4734877 Emil Renner Berthing 2023-12-05  416  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
49128de4734877 Emil Renner Berthing 2023-12-05  417  	struct device_node *child;
49128de4734877 Emil Renner Berthing 2023-12-05  418  	struct pinctrl_map *map;
49128de4734877 Emil Renner Berthing 2023-12-05  419  	unsigned long *configs;
49128de4734877 Emil Renner Berthing 2023-12-05  420  	unsigned int nconfigs;
49128de4734877 Emil Renner Berthing 2023-12-05  421  	unsigned int nmaps;
49128de4734877 Emil Renner Berthing 2023-12-05  422  	int ret;
49128de4734877 Emil Renner Berthing 2023-12-05  423  
49128de4734877 Emil Renner Berthing 2023-12-05  424  	nmaps = 0;
49128de4734877 Emil Renner Berthing 2023-12-05  425  	for_each_available_child_of_node(np, child) {
49128de4734877 Emil Renner Berthing 2023-12-05  426  		int npins = of_property_count_strings(child, "pins");
49128de4734877 Emil Renner Berthing 2023-12-05  427  
49128de4734877 Emil Renner Berthing 2023-12-05  428  		if (npins <= 0) {
49128de4734877 Emil Renner Berthing 2023-12-05  429  			of_node_put(child);
49128de4734877 Emil Renner Berthing 2023-12-05  430  			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
49128de4734877 Emil Renner Berthing 2023-12-05  431  				np, child);
49128de4734877 Emil Renner Berthing 2023-12-05  432  			return -EINVAL;
49128de4734877 Emil Renner Berthing 2023-12-05  433  		}
49128de4734877 Emil Renner Berthing 2023-12-05  434  		nmaps += npins;
49128de4734877 Emil Renner Berthing 2023-12-05  435  		if (of_property_present(child, "function"))
49128de4734877 Emil Renner Berthing 2023-12-05  436  			nmaps += npins;
49128de4734877 Emil Renner Berthing 2023-12-05  437  	}
49128de4734877 Emil Renner Berthing 2023-12-05  438  
49128de4734877 Emil Renner Berthing 2023-12-05  439  	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
49128de4734877 Emil Renner Berthing 2023-12-05  440  	if (!map)
49128de4734877 Emil Renner Berthing 2023-12-05  441  		return -ENOMEM;
49128de4734877 Emil Renner Berthing 2023-12-05  442  
49128de4734877 Emil Renner Berthing 2023-12-05  443  	nmaps = 0;
49128de4734877 Emil Renner Berthing 2023-12-05  444  	mutex_lock(&thp->mutex);
49128de4734877 Emil Renner Berthing 2023-12-05  445  	for_each_available_child_of_node(np, child) {
49128de4734877 Emil Renner Berthing 2023-12-05  446  		unsigned int rollback = nmaps;
49128de4734877 Emil Renner Berthing 2023-12-05  447  		enum th1520_muxtype muxtype;
49128de4734877 Emil Renner Berthing 2023-12-05  448  		struct property *prop;
49128de4734877 Emil Renner Berthing 2023-12-05  449  		const char *funcname;
49128de4734877 Emil Renner Berthing 2023-12-05  450  		const char **pgnames;
49128de4734877 Emil Renner Berthing 2023-12-05  451  		const char *pinname;
49128de4734877 Emil Renner Berthing 2023-12-05  452  		int npins;
49128de4734877 Emil Renner Berthing 2023-12-05  453  
49128de4734877 Emil Renner Berthing 2023-12-05  454  		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
49128de4734877 Emil Renner Berthing 2023-12-05  455  		if (ret) {
49128de4734877 Emil Renner Berthing 2023-12-05  456  			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
49128de4734877 Emil Renner Berthing 2023-12-05  457  				np, child);
49128de4734877 Emil Renner Berthing 2023-12-05  458  			goto put_child;
49128de4734877 Emil Renner Berthing 2023-12-05  459  		}
49128de4734877 Emil Renner Berthing 2023-12-05  460  
49128de4734877 Emil Renner Berthing 2023-12-05  461  		if (!of_property_read_string(child, "function", &funcname)) {
49128de4734877 Emil Renner Berthing 2023-12-05  462  			muxtype = th1520_muxtype_get(funcname);
49128de4734877 Emil Renner Berthing 2023-12-05  463  			if (!muxtype) {
49128de4734877 Emil Renner Berthing 2023-12-05  464  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
49128de4734877 Emil Renner Berthing 2023-12-05  465  					np, child, funcname);
49128de4734877 Emil Renner Berthing 2023-12-05  466  				ret = -EINVAL;
49128de4734877 Emil Renner Berthing 2023-12-05  467  				goto free_configs;
49128de4734877 Emil Renner Berthing 2023-12-05  468  			}
49128de4734877 Emil Renner Berthing 2023-12-05  469  
49128de4734877 Emil Renner Berthing 2023-12-05  470  			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
49128de4734877 Emil Renner Berthing 2023-12-05  471  						  np, child);
49128de4734877 Emil Renner Berthing 2023-12-05  472  			if (!funcname) {
49128de4734877 Emil Renner Berthing 2023-12-05  473  				ret = -ENOMEM;
49128de4734877 Emil Renner Berthing 2023-12-05  474  				goto free_configs;
49128de4734877 Emil Renner Berthing 2023-12-05  475  			}
49128de4734877 Emil Renner Berthing 2023-12-05  476  
49128de4734877 Emil Renner Berthing 2023-12-05  477  			npins = of_property_count_strings(child, "pins");
49128de4734877 Emil Renner Berthing 2023-12-05  478  			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
49128de4734877 Emil Renner Berthing 2023-12-05  479  			if (!pgnames) {
49128de4734877 Emil Renner Berthing 2023-12-05  480  				ret = -ENOMEM;
49128de4734877 Emil Renner Berthing 2023-12-05  481  				goto free_configs;
49128de4734877 Emil Renner Berthing 2023-12-05  482  			}
49128de4734877 Emil Renner Berthing 2023-12-05  483  		} else {
49128de4734877 Emil Renner Berthing 2023-12-05  484  			funcname = NULL;
49128de4734877 Emil Renner Berthing 2023-12-05  485  		}
49128de4734877 Emil Renner Berthing 2023-12-05  486  
49128de4734877 Emil Renner Berthing 2023-12-05  487  		npins = 0;
49128de4734877 Emil Renner Berthing 2023-12-05  488  		of_property_for_each_string(child, "pins", prop, pinname) {
49128de4734877 Emil Renner Berthing 2023-12-05  489  			unsigned int i;
49128de4734877 Emil Renner Berthing 2023-12-05  490  
49128de4734877 Emil Renner Berthing 2023-12-05  491  			for (i = 0; i < thp->desc.npins; i++) {
49128de4734877 Emil Renner Berthing 2023-12-05  492  				if (!strcmp(pinname, thp->desc.pins[i].name))
49128de4734877 Emil Renner Berthing 2023-12-05  493  					break;
49128de4734877 Emil Renner Berthing 2023-12-05  494  			}
49128de4734877 Emil Renner Berthing 2023-12-05  495  			if (i == thp->desc.npins) {
49128de4734877 Emil Renner Berthing 2023-12-05  496  				nmaps = rollback;
49128de4734877 Emil Renner Berthing 2023-12-05  497  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
49128de4734877 Emil Renner Berthing 2023-12-05  498  					np, child, pinname);
49128de4734877 Emil Renner Berthing 2023-12-05 @499  				goto free_configs;

ret = -EINVAL;

49128de4734877 Emil Renner Berthing 2023-12-05  500  			}
49128de4734877 Emil Renner Berthing 2023-12-05  501  
49128de4734877 Emil Renner Berthing 2023-12-05  502  			if (nconfigs) {
49128de4734877 Emil Renner Berthing 2023-12-05  503  				map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
49128de4734877 Emil Renner Berthing 2023-12-05  504  				map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
49128de4734877 Emil Renner Berthing 2023-12-05  505  				map[nmaps].data.configs.configs = configs;
49128de4734877 Emil Renner Berthing 2023-12-05  506  				map[nmaps].data.configs.num_configs = nconfigs;
49128de4734877 Emil Renner Berthing 2023-12-05  507  				nmaps += 1;
49128de4734877 Emil Renner Berthing 2023-12-05  508  			}
49128de4734877 Emil Renner Berthing 2023-12-05  509  			if (funcname) {
49128de4734877 Emil Renner Berthing 2023-12-05  510  				pgnames[npins++] = thp->desc.pins[i].name;
49128de4734877 Emil Renner Berthing 2023-12-05  511  				map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
49128de4734877 Emil Renner Berthing 2023-12-05  512  				map[nmaps].data.mux.function = funcname;
49128de4734877 Emil Renner Berthing 2023-12-05  513  				map[nmaps].data.mux.group = thp->desc.pins[i].name;
49128de4734877 Emil Renner Berthing 2023-12-05  514  				nmaps += 1;
49128de4734877 Emil Renner Berthing 2023-12-05  515  			}
49128de4734877 Emil Renner Berthing 2023-12-05  516  		}
49128de4734877 Emil Renner Berthing 2023-12-05  517  
49128de4734877 Emil Renner Berthing 2023-12-05  518  		if (funcname) {
49128de4734877 Emil Renner Berthing 2023-12-05  519  			ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
49128de4734877 Emil Renner Berthing 2023-12-05  520  							  npins, (void *)muxtype);
49128de4734877 Emil Renner Berthing 2023-12-05  521  			if (ret < 0) {
49128de4734877 Emil Renner Berthing 2023-12-05  522  				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
49128de4734877 Emil Renner Berthing 2023-12-05  523  				goto put_child;
49128de4734877 Emil Renner Berthing 2023-12-05  524  			}
49128de4734877 Emil Renner Berthing 2023-12-05  525  		}
49128de4734877 Emil Renner Berthing 2023-12-05  526  	}
49128de4734877 Emil Renner Berthing 2023-12-05  527  
49128de4734877 Emil Renner Berthing 2023-12-05  528  	*maps = map;
49128de4734877 Emil Renner Berthing 2023-12-05  529  	*num_maps = nmaps;
49128de4734877 Emil Renner Berthing 2023-12-05  530  	mutex_unlock(&thp->mutex);
49128de4734877 Emil Renner Berthing 2023-12-05  531  	return 0;
49128de4734877 Emil Renner Berthing 2023-12-05  532  
49128de4734877 Emil Renner Berthing 2023-12-05  533  free_configs:
49128de4734877 Emil Renner Berthing 2023-12-05  534  	kfree(configs);
49128de4734877 Emil Renner Berthing 2023-12-05  535  put_child:
49128de4734877 Emil Renner Berthing 2023-12-05  536  	of_node_put(child);
49128de4734877 Emil Renner Berthing 2023-12-05  537  	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
49128de4734877 Emil Renner Berthing 2023-12-05  538  	mutex_unlock(&thp->mutex);
49128de4734877 Emil Renner Berthing 2023-12-05  539  	return ret;
49128de4734877 Emil Renner Berthing 2023-12-05  540  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

