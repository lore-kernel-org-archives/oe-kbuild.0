Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0510A02
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3fFFpcv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-332f90a375eso517620f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 06 Dec 2023 21:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701926779; x=1702531579; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7z0RXkoXYkLl1p5YIwWXp82DBhxPyJ1qOpvwjveyO4=;
        b=W3fFFpcv6BllA3cgQ1XAFdKl2Yp56jVHRMMOjyN+fxc+67gRiF59RzAxVsSIWHGA7a
         pIb6WqYVmkyf3ajZOpI314Wmihula5A6HUTA0V76MHY2omPm+ODNvWkF1YE3y3Az7ZML
         Di3eKp2O1JTNq1mCwA6hq81FL/tr1dS62KUnPKJ4ggTza+nXjgksCJcFwgcwiWFp2fom
         wCcpq0IXCF9V6c/2dMeLTKqc+iVKYYinrsG4Wg/ChLZ/1l9DACE3VCb6sJVxYUsQM/io
         hnHZVM7GwwaFfc2vSX8h62owY9PmmIGC3YtQAccWwVr2Nup3/AKga8beGeFzeKs+3oMx
         X/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701926779; x=1702531579;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7z0RXkoXYkLl1p5YIwWXp82DBhxPyJ1qOpvwjveyO4=;
        b=h9UAubN7Ih5aC96Ee83Lxp5ExGMz4l/bOpT4iNuS6q/RT+NihwVC0PoP8AHkSdqSVJ
         G9MkIMytl399ZS6VNr5yrXeSXEoXZXqx1hkIOgZc0gOY0HJcIr4zs3MXH6K548jD5spb
         Z+kdaF0Cq1goLpupSmQ7uprbWd55k71JX79xaSn6g6Ev2DdgTv6ygT801UBdfKoxjWFA
         3ZITKr+hZhL2O/43wnoGMGCJJhBA7mxRhfXApPqHyo36Kv6Rqt8AaWVYGfsS85nrN6JV
         30VqfGkAcM4JeVJiR9relPypIBDbWAi9dxe+Gl2oMh5khbHBWU3BxY9sKnpWOdCFwUo2
         MyDg==
X-Gm-Message-State: AOJu0Yy6xVWLzhddp3IG3qHy2e1aqv8FMDWcAJ1M9M/kwH3fvgLUsnL5
	WE3gHuU2yAS7na4BgLcRkBA3qWCy3QvShK+JUtw=
X-Google-Smtp-Source: AGHT+IEtMvE6B+5pXLBT+duzDpyx4x4YiJIjKZqE8bbzfzR49FgeGTytFNRVKhTMcDDUQ3a9d0h+4Q==
X-Received: by 2002:a5d:5252:0:b0:332:ec48:a132 with SMTP id k18-20020a5d5252000000b00332ec48a132mr1172607wrc.53.1701926779204;
        Wed, 06 Dec 2023 21:26:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d5552000000b003332faefd86sm472453wrw.0.2023.12.06.21.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:26:18 -0800 (PST)
Date: Thu, 7 Dec 2023 08:26:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Amarula patchwork <linux-amarula@amarulasolutions.com>,
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	michael@amarulasolutions.com
Subject: Re: [PATCH v4 06/10] drm/panel: Add Synaptics R63353 panel driver
Message-ID: <db6486a4-0a2c-435d-908b-8d61472b51c4@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205105341.4100896-7-dario.binacchi@amarulasolutions.com>

Hi Dario,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/drm-bridge-Fix-bridge-disable-logic/20231205-185455
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231205105341.4100896-7-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v4 06/10] drm/panel: Add Synaptics R63353 panel driver
config: i386-randconfig-r071-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070214.Eyi9T4eq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070214.Eyi9T4eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312070214.Eyi9T4eq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-synaptics-r63353.c:132 r63353_panel_activate() warn: missing unwind goto?

vim +132 drivers/gpu/drm/panel/panel-synaptics-r63353.c

64f91a53613aea Michael Trimarchi 2023-12-05  107  static int r63353_panel_activate(struct r63353_panel *rpanel)
64f91a53613aea Michael Trimarchi 2023-12-05  108  {
64f91a53613aea Michael Trimarchi 2023-12-05  109  	struct mipi_dsi_device *dsi = rpanel->dsi;
64f91a53613aea Michael Trimarchi 2023-12-05  110  	struct device *dev = &dsi->dev;
64f91a53613aea Michael Trimarchi 2023-12-05  111  	int i, ret;
64f91a53613aea Michael Trimarchi 2023-12-05  112  
64f91a53613aea Michael Trimarchi 2023-12-05  113  	ret = mipi_dsi_dcs_soft_reset(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  114  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  115  		dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  116  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  117  	}
64f91a53613aea Michael Trimarchi 2023-12-05  118  
64f91a53613aea Michael Trimarchi 2023-12-05  119  	usleep_range(15000, 17000);
64f91a53613aea Michael Trimarchi 2023-12-05  120  
64f91a53613aea Michael Trimarchi 2023-12-05  121  	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  122  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  123  		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  124  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  125  	}
64f91a53613aea Michael Trimarchi 2023-12-05  126  
64f91a53613aea Michael Trimarchi 2023-12-05  127  	for (i = 0; i < rpanel->pdata->init_length; i++) {
64f91a53613aea Michael Trimarchi 2023-12-05  128  		const struct r63353_instr *instr = &rpanel->pdata->init[i];
64f91a53613aea Michael Trimarchi 2023-12-05  129  
64f91a53613aea Michael Trimarchi 2023-12-05  130  		ret = mipi_dsi_dcs_write_buffer(dsi, instr->data, instr->len);
64f91a53613aea Michael Trimarchi 2023-12-05  131  		if (ret < 0)
64f91a53613aea Michael Trimarchi 2023-12-05 @132  			return ret;

goto fail?

64f91a53613aea Michael Trimarchi 2023-12-05  133  	}
64f91a53613aea Michael Trimarchi 2023-12-05  134  
64f91a53613aea Michael Trimarchi 2023-12-05  135  	msleep(120);
64f91a53613aea Michael Trimarchi 2023-12-05  136  
64f91a53613aea Michael Trimarchi 2023-12-05  137  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  138  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  139  		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  140  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  141  	}
64f91a53613aea Michael Trimarchi 2023-12-05  142  
64f91a53613aea Michael Trimarchi 2023-12-05  143  	usleep_range(5000, 10000);
64f91a53613aea Michael Trimarchi 2023-12-05  144  
64f91a53613aea Michael Trimarchi 2023-12-05  145  	ret = mipi_dsi_dcs_set_display_on(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  146  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  147  		dev_err(dev, "Failed to set display ON (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  148  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  149  	}
64f91a53613aea Michael Trimarchi 2023-12-05  150  
64f91a53613aea Michael Trimarchi 2023-12-05  151  	return 0;
64f91a53613aea Michael Trimarchi 2023-12-05  152  
64f91a53613aea Michael Trimarchi 2023-12-05  153  fail:
64f91a53613aea Michael Trimarchi 2023-12-05  154  	gpiod_set_value(rpanel->reset_gpio, 0);
64f91a53613aea Michael Trimarchi 2023-12-05  155  
64f91a53613aea Michael Trimarchi 2023-12-05  156  	return ret;
64f91a53613aea Michael Trimarchi 2023-12-05  157  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

