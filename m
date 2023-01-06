Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237E87B;
	Fri,  6 Jan 2023 07:11:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso2928218wms.5;
        Thu, 05 Jan 2023 23:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lpGhRYJaxmtI/yjnQkZLt/0Jz7oT/+CyaSTcffJbcOg=;
        b=nqB4bFsGApMI5i2Y8+sBCr32FWRItSVzk7d4G69jme+Jc/TBU7l+HqHovDTFR4D1Vo
         KMI3/kW3wh94z4ac1qDo1PcnsCoA+e/o42NFvDrKWiB0oWB5rO3vL2rA166p9VricF62
         Bb9wESQnpmWEUc1VVl/m9i8Cu7qv4qXIA6uG2A/71PAqDEbC1mL34i9zaxS8SnqtU3qp
         xasq3FDpLwbtmyzutudEYdc87yXIUbSzRgGzTliPffTdUWaXD7N5GkCtfOzrN7uerEzG
         ZC6ypppSo7XV+kBsE9g/HlRzGBOax5S/JvhvQEagjL8Ohe/CKWg4cLri660gT+WY7YuP
         HoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpGhRYJaxmtI/yjnQkZLt/0Jz7oT/+CyaSTcffJbcOg=;
        b=SJlpu9mmb8eL3UYy9ZlbIDdbSYZNrc74yqLYL/MQ20hk7nlg9LwHVC7k6D26ERq+z5
         on62g1/H6PlODabY8jzO321Qg6L7/BXXvfowWqFqTkgIlrJKBdaKvXOeR95zwf4DUjaj
         S8R9TMS/YGI5ab1LiQWnkktomaipzByg6L7vSTMP+ubUWprSRGxKmOC0jggzZ3XLxzBq
         rVy7Fdl+B/scr7CiVfN39J2BJ9f6mAJSVbNQ7B/OkrYfpKvnbmCLXt3UhS6n8HPUFeQk
         M4zbTi+6i2ljYNLoC17H5G2GqG4SNdq+ExTCLZpGJSBcDcWeiER0j+l889rBJW7P1yrt
         LY+w==
X-Gm-Message-State: AFqh2kr7VyzVPMt73JAq71EF241ui6si5d/wcr+D5G4Skme3a6QXzLsv
	bNn6pWFaP2ylLuwcQ8jNrjzUKHVVYnN65g==
X-Google-Smtp-Source: AMrXdXuU5fNYCWFiCWYLVZFvAo4qlxXdeeEggh+4CF8o9+emnP/Rdmm02Z8r0sISURHsvOtjcD6y6w==
X-Received: by 2002:a05:600c:35d1:b0:3d3:58d1:2588 with SMTP id r17-20020a05600c35d100b003d358d12588mr39851772wmq.41.1672989103024;
        Thu, 05 Jan 2023 23:11:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l27-20020a05600c2cdb00b003a84375d0d1sm5315133wmc.44.2023.01.05.23.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 23:11:42 -0800 (PST)
Date: Fri, 6 Jan 2023 10:11:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jiri Valek - 2N <jiriv@axis.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jiri Valek - 2N <jiriv@axis.com>, Rob Herring <robh+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] Input: cap11xx - add support for cap1203, cap1293
 and cap1298
Message-ID: <202301060047.MIcDVwKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103134105.736346-3-jiriv@axis.com>
Message-ID: <20230106071135.kcjLUnaE1cp63bujHnY51FjEwk3AN-pk8iyb8qPVnZ8@z>

Hi Jiri,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Valek-2N/dt-bindings-input-microchip-cap11xx-add-cap1203-cap1293-and-cap1298/20230103-214328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20230103134105.736346-3-jiriv%40axis.com
patch subject: [PATCH 2/2] Input: cap11xx - add support for cap1203, cap1293 and cap1298
config: loongarch-randconfig-m031-20230101
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/input/keyboard/cap11xx.c:400 cap11xx_i2c_probe() warn: was && intended here instead of ||?

vim +400 drivers/input/keyboard/cap11xx.c

c77fd0a42b24ac Matt Ranostay    2014-10-31  390  	if (!of_property_read_u32(node, "microchip,sensor-gain", &gain32)) {
322a552e195508 Jesse Taube      2021-11-02  391  		if (cap->no_gain)
322a552e195508 Jesse Taube      2021-11-02  392  			dev_warn(dev,
322a552e195508 Jesse Taube      2021-11-02  393  				 "This version doesn't support sensor gain\n");
322a552e195508 Jesse Taube      2021-11-02  394  		else if (is_power_of_2(gain32) && gain32 <= 8)
c77fd0a42b24ac Matt Ranostay    2014-10-31  395  			gain = ilog2(gain32);
c77fd0a42b24ac Matt Ranostay    2014-10-31  396  		else
c77fd0a42b24ac Matt Ranostay    2014-10-31  397  			dev_err(dev, "Invalid sensor-gain value %d\n", gain32);
c77fd0a42b24ac Matt Ranostay    2014-10-31  398  	}
c77fd0a42b24ac Matt Ranostay    2014-10-31  399  
e3f771deec5bca Jiri Valek - 2N  2023-01-03 @400  	if ((id->driver_data != CAP1206) ||
e3f771deec5bca Jiri Valek - 2N  2023-01-03  401  		(id->driver_data != CAP1203) ||
e3f771deec5bca Jiri Valek - 2N  2023-01-03  402  		(id->driver_data != CAP1293) ||
e3f771deec5bca Jiri Valek - 2N  2023-01-03  403  		(id->driver_data != CAP1298)) {

Yep.  && isntead of ||.  ->driver_data can't be equal to *all* of
those at the same time.

6bdd2fd1ed6f66 Matt Ranostay    2014-10-31  404  		if (of_property_read_bool(node, "microchip,irq-active-high")) {
322a552e195508 Jesse Taube      2021-11-02  405  			error = regmap_update_bits(priv->regmap,
322a552e195508 Jesse Taube      2021-11-02  406  						   CAP11XX_REG_CONFIG2,
322a552e195508 Jesse Taube      2021-11-02  407  						   CAP11XX_REG_CONFIG2_ALT_POL,
322a552e195508 Jesse Taube      2021-11-02  408  						   0);
6bdd2fd1ed6f66 Matt Ranostay    2014-10-31  409  			if (error)
6bdd2fd1ed6f66 Matt Ranostay    2014-10-31  410  				return error;
6bdd2fd1ed6f66 Matt Ranostay    2014-10-31  411  		}
322a552e195508 Jesse Taube      2021-11-02  412  	}
6bdd2fd1ed6f66 Matt Ranostay    2014-10-31  413  
c77fd0a42b24ac Matt Ranostay    2014-10-31  414  	/* Provide some useful defaults */
7609a5e973c43a Matt Ranostay    2014-10-31  415  	for (i = 0; i < cap->num_channels; i++)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

