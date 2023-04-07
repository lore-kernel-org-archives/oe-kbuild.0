Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94C81FBC;
	Fri,  7 Apr 2023 08:57:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso4351176wmo.0;
        Fri, 07 Apr 2023 01:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680857834; x=1683449834;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6GPpYPh3lMt8Jxq702YqKcp6EgIgb3GmSgnkbyqHhhg=;
        b=lcfqaUviw/B2WsGO9LXrKXZ1knj+MH2vjHm8I2WDd/el6NSpof/0CyIQklBWA0H8tY
         vUCxpFvuqucpSAraFbcOfg1CL1QVDTwvRKC9wfLgWRVpDW9HKEJDYg8/1fIM7KUj4JvP
         obeTdfkzgmMCJNW3bhMNPcI8NQHJlUckV2MP8A9G1ZuMI2lTmbSjgy348AmeoSo3IYYX
         2O7UtoYc2br1AinxBxGSutp3GVtjiG81mERAno1/5zTVzWM6GttHXjMmspbg52ZZtWFH
         6axLuxmUvDIhFtBS+9Fe7ZbWu+2Fcm59/+0cRQLKeO3ZFPiqthtMDHt6GaYCxUHJZyqg
         zRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857834; x=1683449834;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GPpYPh3lMt8Jxq702YqKcp6EgIgb3GmSgnkbyqHhhg=;
        b=Q7hak8qS225JmnMpwITgjzZDF9WP55dYusJLpHnasvn/eeyt8wKB8KIxgCZqAO7nbg
         M1sZZrYTNVkEF8WeL+eJLvfIZlEIW8y4+rf61wI7Aw4lfatfwHWRKR06QY6hjGOLvO5l
         /Cic79pkWDcc56no7JLi5eBp5RIWukRSIXDd9IKYCdbc3RbpPDfcEJIiwoEdbeI4sXSa
         qL5Z219imZg/0GmDyfCRaAhRIWNVHHFuyp2LPA0SAiuUHGBccCmd8eBwywZCRqXCDbUo
         WFB6Tcy0/AZ44601TIIsJj450bOWzfgQXJLhyAacGS9wa0gape7H/bjMle5/NUH/j/TG
         SkxA==
X-Gm-Message-State: AAQBX9dKTHubQtvX/8ExDPAoYfKb1k8mX845vhiyVuKk1aBeQHKTRqZl
	0pt473euEXMrl9exYSmEBzahk5QUebH+Jg==
X-Google-Smtp-Source: AKy350YSLvJenAJSjxIjfV1WdCXZcuQs7a89dbgmpG5+Y383TCQUT5PugDsyjlvGr7Nv66WqF5Z7Hw==
X-Received: by 2002:a1c:cc11:0:b0:3f0:3377:c15f with SMTP id h17-20020a1ccc11000000b003f03377c15fmr763235wmb.12.1680857834515;
        Fri, 07 Apr 2023 01:57:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c001100b003dd1bd0b915sm7558267wmc.22.2023.04.07.01.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 01:57:14 -0700 (PDT)
Date: Fri, 7 Apr 2023 11:57:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Imre Deak <imre.deak@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mika Kahola <mika.kahola@intel.com>
Subject: [linux-next:master 8027/9787]
 drivers/gpu/drm/i915/display/intel_tc.c:424 icl_tc_phy_hpd_live_status()
 error: uninitialized symbol 'fia_isr'.
Message-ID: <9b05194d-0f98-40ef-a067-a8d6b05c586f@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e134c93f788fb93fd6a3ec3af9af850a2048c7e6
commit: 8979918af711b057620c7c5f9d29a0043f927753 [8027/9787] drm/i915/tc: Get power ref for reading the HPD live status register
config: i386-randconfig-m031-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070402.p78bkshq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070402.p78bkshq-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:424 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'fia_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:436 icl_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:709 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'cpu_isr'.
drivers/gpu/drm/i915/display/intel_tc.c:714 adlp_tc_phy_hpd_live_status() error: uninitialized symbol 'pch_isr'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:660 tgl_tc_phy_init() error: uninitialized symbol 'val'.

vim +/fia_isr +424 drivers/gpu/drm/i915/display/intel_tc.c

3eafcddf766b6b Imre Deak     2023-03-23  409  static u32 icl_tc_phy_hpd_live_status(struct intel_tc_port *tc)
c905eb28bd3f43 Imre Deak     2019-06-28  410  {
3eafcddf766b6b Imre Deak     2023-03-23  411  	struct drm_i915_private *i915 = tc_to_i915(tc);
3eafcddf766b6b Imre Deak     2023-03-23  412  	struct intel_digital_port *dig_port = tc->dig_port;
5a4dd6f0e84654 Jani Nikula   2022-08-24  413  	u32 isr_bit = i915->display.hotplug.pch_hpd[dig_port->base.hpd_pin];
8979918af711b0 Imre Deak     2023-03-23  414  	intel_wakeref_t wakeref;
8979918af711b0 Imre Deak     2023-03-23  415  	u32 fia_isr;
8979918af711b0 Imre Deak     2023-03-23  416  	u32 pch_isr;
c905eb28bd3f43 Imre Deak     2019-06-28  417  	u32 mask = 0;
c905eb28bd3f43 Imre Deak     2019-06-28  418  
8979918af711b0 Imre Deak     2023-03-23  419  	with_intel_display_power(i915, tc_phy_cold_off_domain(tc), wakeref) {
8979918af711b0 Imre Deak     2023-03-23  420  		fia_isr = intel_de_read(i915, PORT_TX_DFLEXDPSP(tc->phy_fia));
8979918af711b0 Imre Deak     2023-03-23  421  		pch_isr = intel_de_read(i915, SDEISR);

What's the story with with_intel_display_power()?  I guess it must
always be true.  I've asked about it several times before but no one
ever responds to my emails about it.

8979918af711b0 Imre Deak     2023-03-23  422  	}
c905eb28bd3f43 Imre Deak     2019-06-28  423  
8979918af711b0 Imre Deak     2023-03-23 @424  	if (fia_isr == 0xffffffff) {
c4d162618216f7 Wambui Karuga 2020-01-30  425  		drm_dbg_kms(&i915->drm,
c4d162618216f7 Wambui Karuga 2020-01-30  426  			    "Port %s: PHY in TCCOLD, nothing connected\n",
3eafcddf766b6b Imre Deak     2023-03-23  427  			    tc->port_name);
424f109f5c5d9c Imre Deak     2019-06-28  428  		return mask;
424f109f5c5d9c Imre Deak     2019-06-28  429  	}
424f109f5c5d9c Imre Deak     2019-06-28  430  
8979918af711b0 Imre Deak     2023-03-23  431  	if (fia_isr & TC_LIVE_STATE_TBT(tc->phy_fia_idx))
c905eb28bd3f43 Imre Deak     2019-06-28  432  		mask |= BIT(TC_PORT_TBT_ALT);
8979918af711b0 Imre Deak     2023-03-23  433  	if (fia_isr & TC_LIVE_STATE_TC(tc->phy_fia_idx))
c905eb28bd3f43 Imre Deak     2019-06-28  434  		mask |= BIT(TC_PORT_DP_ALT);
c905eb28bd3f43 Imre Deak     2019-06-28  435  
8979918af711b0 Imre Deak     2023-03-23 @436  	if (pch_isr & isr_bit)
c905eb28bd3f43 Imre Deak     2019-06-28  437  		mask |= BIT(TC_PORT_LEGACY);
c905eb28bd3f43 Imre Deak     2019-06-28  438  
c905eb28bd3f43 Imre Deak     2019-06-28  439  	return mask;
c905eb28bd3f43 Imre Deak     2019-06-28  440  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

