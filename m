Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593419885
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 16:02:51 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so5419575e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 04 Aug 2023 09:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691164969; x=1691769769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOHAPZJIyf1nvT44zbs9xcZKeI5Rx3Lp6m910v0C5nE=;
        b=FCci7qzbL2drmMD/LBqpcM5b7bHBbLOlwDL5VcTKhKfswJwkz+/BO8ZugjiTrcR5Nn
         CSHkzSosjbuUa1FtkIoUAV/73Kr63FhfeRxf14uJjSp7pqqlkPR5JwC8reA4rh1IKMyd
         0+NKF4Ohi+LZ0YiZSex6e7rTwCr6AWmyCBJhMhM+7J+E+La2UWIYYKc3mL44VrMQnBoK
         6rwluKIrAh9lEYJGkU6w61SFzJqnjgTUU3OeZpEWDZYo6HPDrr51eBKS++e/zOu/02jD
         9tKFOIj3Oxm99ku/iJ0yNVhVDaO8GI9kUldzftq1qt+hYM/0IJ6zsJeUFDvAnRfbWgP+
         E5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691164969; x=1691769769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOHAPZJIyf1nvT44zbs9xcZKeI5Rx3Lp6m910v0C5nE=;
        b=TRMr/KJ0F8xM2Bvtz6URZNsGx8Kjhcp5UYa9oQLC3BXPdh+L/SGilOrFm99qxXQeUJ
         fBmBUp/3FRysAN4/gSfePmwOtvd32NemuKhAk7OXb+DpQAHP42E0JFLbizOEyiFb8oPN
         r99iwGvOvtq5PjdSUzzr8jNKYnyVHTcHmyVjvqDSIr1/tbnZM0nxAchV5nzZbkXuTNEv
         juTngXerMgJuDXVS8c2v7UNOcqgX9ZQMBZ5uYOJoLGJxS9epO44sEtaZq3iFw94uk1UF
         XHI+ZAamqNe6zI532D0lQZ9S6Zah0tYGXiwmFZqJWZQN54zmH4R0kQqR0ZQ8eeaHS5SL
         n1RQ==
X-Gm-Message-State: AOJu0YyLmAxujA2PmC8oq/HfAvv9raoVpFZjsd6mxV7maRbZJqHeGgV8
	h40C01V2toojHYH9ZCfjwMma7w==
X-Google-Smtp-Source: AGHT+IGxDY1CYcywGuX0HnIuOGY0yx+9NZTfW7Br7zSQ5hgiDNN/UCDEsDmnF80RF/oItrhVioyJKw==
X-Received: by 2002:a5d:4b03:0:b0:317:5af3:caa4 with SMTP id v3-20020a5d4b03000000b003175af3caa4mr1623600wrq.38.1691164969434;
        Fri, 04 Aug 2023 09:02:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d40c7000000b0031423a8f4f7sm2874664wrq.56.2023.08.04.09.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 09:02:49 -0700 (PDT)
Date: Fri, 4 Aug 2023 19:02:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH v7 5/7] nvmem: core: Rework layouts to become platform
 devices
Message-ID: <15cfd153-314a-4eeb-8de9-97a888905bff@kadam.mountain>
References: <20230801182132.1058707-6-miquel.raynal@bootlin.com>
 <b9040273-aca8-432a-83aa-b0d6b1b88529@kadam.mountain>
 <20230804173903.2b298cd3@xps-13>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804173903.2b298cd3@xps-13>

On Fri, Aug 04, 2023 at 05:39:03PM +0200, Miquel Raynal wrote:
> Hi Dan,
> 
> dan.carpenter@linaro.org wrote on Thu, 3 Aug 2023 13:13:04 +0300:
> 
> > Hi Miquel,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/nvmem-core-Create-all-cells-before-adding-the-nvmem-device/20230802-022331
> > base:   char-misc/char-misc-testing
> > patch link:    https://lore.kernel.org/r/20230801182132.1058707-6-miquel.raynal%40bootlin.com
> > patch subject: [PATCH v7 5/7] nvmem: core: Rework layouts to become platform devices
> > config: x86_64-randconfig-m001-20230730 (https://download.01.org/0day-ci/archive/20230803/202308030002.DnSFOrMB-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030002.DnSFOrMB-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit
> > (i.e. not just a new version of the same patch/commit),
> 
> (Nice addition, a lot of newcomers would always add these tags
> otherwise.)

The Intel kbuild devs add this stuff, I just look it over and hit
forward.

> 
> > kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202308030002.DnSFOrMB-lkp@intel.com/
> > 
> > New smatch warnings:
> > drivers/nvmem/core.c:1003 nvmem_register() warn: 'layout_np' is an error pointer or valid
> > drivers/nvmem/core.c:2130 nvmem_try_loading_layout_driver() warn: 'layout_np' is an error pointer or valid
> > 
> > Old smatch warnings:
> > drivers/nvmem/core.c:761 nvmem_add_cells_from_fixed_layout() warn: 'layout_np' is an error pointer or valid
> > drivers/nvmem/core.c:802 nvmem_layout_get() warn: 'layout_np' is an error pointer or valid
> > 
> > vim +/layout_np +1003 drivers/nvmem/core.c
> > 
> > 266570f496b90d Michael Walle         2023-04-04  1000  
> > 00d059fd6702f0 Miquel Raynal         2023-08-01  1001  	/* Populate layouts as devices */
> > 00d059fd6702f0 Miquel Raynal         2023-08-01  1002  	layout_np = of_nvmem_layout_get_container(nvmem);
> > 00d059fd6702f0 Miquel Raynal         2023-08-01 @1003  	if (layout_np) {
> > 
> > So, ugh, of_nvmem_layout_get_container() return NULL on error or error
> > pointer if either CONFIG_NVMEM or CONFIG_OF is turned off.  I feel like
> > that's a mistake.  Normally when a function returns both error pointers
> > and NULL then the NULL means the feature is disabled and the error
> > pointers mean there was an error.  Here it is the opposite.
> > 
> > I have written a blog about this:
> > https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/
> 
> Nice (besides the huge spider which stared at me unexpectedly :-) )

Those are a species of jumping spiders.  They are shiny and golden in
real life, but it never shows up properly in photos.  :)

> 
> > At first I thought that this was to do with CONFIG_COMPILE_TEST but
> > actually that is disabled.  The issue here is that CONFIG_OF is turned
> > off.  So this is a genuine bug, we're compiling a module which will
> > always crash.
> > 
> > So I guess the fix is easy that this should return NULL if either
> > CONFIG_NVMEM or CONFIG_OF is turned off.  That was a long explanation
> > which is no longer required now that it's not a COMPILE_TEST issue.  :P
> 
> I wanted to disable CONFIG_OF to make the test, I totally forget, I'll
> handle this case and return NULL when this happens.
> 
> However I don't understand why you mention CONFIG_NVMEM, because if it
> is not defined, this file will not compile at all?

Yeah.  You're right.  I wrote this email thinking it was a
CONFIG_COMPILE_TEST issue and didn't edit it properly in the end.

regards,
dan carpenter

