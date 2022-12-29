Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9621C2B;
	Thu, 29 Dec 2022 09:59:35 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id bx10so16999151wrb.0;
        Thu, 29 Dec 2022 01:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bn4HntsaKLTQdip7AHyQp+cV/Iqbq4A7mjOLHD/cq3A=;
        b=oNoV6KZk4xfXVsu7aVrk5wo+peEUiy1BbGBKo3lLCOD0E8yhWOESElxxmbxXRn2gZq
         o7HCMd72yLUzNqVSkmedEdhlu7ljV0gjwzdMlVygRedtHlTnXt8m7g3OGVEZGHX8pD9n
         jyBXCXOIPUxwxgPEDxA3TrLgHBrQ1SKWmwrWhUFjK5Qn74vnHGeBAKMA6l7VI0EVIgME
         /hrsTPL6CAUI9+mBtDCx+/2j7WGoIuXCV2v7XBZCT5d3N0PGe0xnAHcS8TmkuVjm4gVs
         Ben8ZnupFVqEfaLUos0aiKcMZfc6jZvtBX3W8gL4eTaoAspNE6RZyG45zSBZl7GWpJkU
         7cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bn4HntsaKLTQdip7AHyQp+cV/Iqbq4A7mjOLHD/cq3A=;
        b=xy9wzzXwQ2a0T3rRE48TL1dWgqWqnxiGyGxa0KF4T7UZEizdGqYCGxQGimxBIVg5Pt
         jxXLbDQ5vO8ddiA2k14bta65QyyndGQi8458zIcRtpP1zhYRSMAGpZsWeM+IxYO0t4jI
         cyNOSmvpc9W0pxq8bv0SrPqd5mjbBYyMBtRcwvDFJnRuJYBGiQU0KBjoS3k3aS6d5m7L
         1DkdjXTqKKGZR5XvUUWjLdFHzXYZxQlEQsdrD8YXDVucLkeN0IJqf87CEtrNHuKwET8M
         kWxbJuxrNTzkL6xJVSpiabow9Sk8c8l/1fxSZ30o+nWNY63npZDmlrGftIC6SGxZ6XSv
         0JmQ==
X-Gm-Message-State: AFqh2kpO9InPEj0eNj/q10+Zc5O8zQOyijo17xV5GKWJpMH1IKAXSFwG
	ckEE/xb8U8v5UL3XSm9fgjURW76Wle2Gi22o
X-Google-Smtp-Source: AMrXdXtLjgq2koux/A/k/d40m6+3n6ZO4eR8ZysvKNvlrc/Vyf3qeNRIG8+dUsh3OPw6Z5m501IOkg==
X-Received: by 2002:a5d:6910:0:b0:26d:a458:d126 with SMTP id t16-20020a5d6910000000b0026da458d126mr15698071wru.22.1672307973114;
        Thu, 29 Dec 2022 01:59:33 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w14-20020adfee4e000000b002422bc69111sm21174791wro.9.2022.12.29.01.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 01:59:32 -0800 (PST)
Date: Thu, 29 Dec 2022 12:59:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 25/26] drivers/gpu/drm/bridge/panel.c:367
 devm_drm_panel_bridge_add_typed() error: 'bridge' dereferencing possible
 ERR_PTR()
Message-ID: <202212291702.rmA7NAVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221229095929.p9qXtkpWCbfcmhYHBzaLHAi6BZLnxMZAOCzEq1K9hcw@z>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   941aae3263153cea91cb306cc889951486e16634
commit: 5ea6b17027810ffbdb5bea7d0a2b1d312dd1021c [25/26] drm/panel: Add prepare_prev_first flag to drm_panel
config: nios2-randconfig-m041-20221228
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/bridge/panel.c:367 devm_drm_panel_bridge_add_typed() error: 'bridge' dereferencing possible ERR_PTR()

vim +/bridge +367 drivers/gpu/drm/bridge/panel.c

89958b7cd9555a Laurent Pinchart 2019-09-04  348  struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
67022227ffb1f5 Eric Anholt      2017-07-18  349  						   struct drm_panel *panel,
67022227ffb1f5 Eric Anholt      2017-07-18  350  						   u32 connector_type)
67022227ffb1f5 Eric Anholt      2017-07-18  351  {
67022227ffb1f5 Eric Anholt      2017-07-18  352  	struct drm_bridge **ptr, *bridge;
67022227ffb1f5 Eric Anholt      2017-07-18  353  
67022227ffb1f5 Eric Anholt      2017-07-18  354  	ptr = devres_alloc(devm_drm_panel_bridge_release, sizeof(*ptr),
67022227ffb1f5 Eric Anholt      2017-07-18  355  			   GFP_KERNEL);
67022227ffb1f5 Eric Anholt      2017-07-18  356  	if (!ptr)
67022227ffb1f5 Eric Anholt      2017-07-18  357  		return ERR_PTR(-ENOMEM);
67022227ffb1f5 Eric Anholt      2017-07-18  358  
89958b7cd9555a Laurent Pinchart 2019-09-04  359  	bridge = drm_panel_bridge_add_typed(panel, connector_type);
67022227ffb1f5 Eric Anholt      2017-07-18  360  	if (!IS_ERR(bridge)) {
67022227ffb1f5 Eric Anholt      2017-07-18  361  		*ptr = bridge;
67022227ffb1f5 Eric Anholt      2017-07-18  362  		devres_add(dev, ptr);
67022227ffb1f5 Eric Anholt      2017-07-18  363  	} else {
67022227ffb1f5 Eric Anholt      2017-07-18  364  		devres_free(ptr);

return -ENOMEM;

67022227ffb1f5 Eric Anholt      2017-07-18  365  	}
67022227ffb1f5 Eric Anholt      2017-07-18  366  
5ea6b17027810f Dave Stevenson   2022-12-05 @367  	bridge->pre_enable_prev_first = panel->prepare_prev_first;
                                                        ^^^^^^^^^^

5ea6b17027810f Dave Stevenson   2022-12-05  368  
67022227ffb1f5 Eric Anholt      2017-07-18  369  	return bridge;
67022227ffb1f5 Eric Anholt      2017-07-18  370  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

