Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33B228E2;
	Thu, 16 Feb 2023 10:54:51 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id qw12so4218236ejc.2;
        Thu, 16 Feb 2023 02:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9d0PrkqVR7RWwHDAQb7ACiH4nug2M7E1Iiu+Ew45btw=;
        b=oOQtFOZ4rMwIG462fFPhvF0fRSWeGqZRzJQqJlJvB6KU/GVRRBfo3KVtwdFRWjwrjn
         yNkTum0WsAp5TPeimhOLlSkfC5ogTLg4e3p11WMf7oZdEFtC8/h1rszKYNXXtmcWIqu8
         1vUoXh0mW8iGFC67KqVtCxR81gr/FkHuEJsniUR+0DUvOzmZGC7saQK8Yxls8Yi+6SA4
         GMNYxwXH9ONtnDNTBw+r1eQ7LXdxY5ptKcfLFhTrvYhguMNCy5w+rN0rqZGJDB1m3HpI
         J+mpjJiEys+Jek3OdRodV9878Ti6vu07IPBslwqgHArmXZpTnVR1ZLSbzV+gy3YEK7Ol
         gjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9d0PrkqVR7RWwHDAQb7ACiH4nug2M7E1Iiu+Ew45btw=;
        b=M+e8I4u8YoT6GpTDsPobb+5FBqEwUOaDWRvzEHDg8ipVNdk8LRVCdJhR3sqnXCfRTa
         R+lNT+R7OVaFy3yi0OF1nLhad2iX1ZAx/l6qqgRw0LI1N8Be+4WDh/3SORPAwLq1WD/b
         Km2A5w5x469NdEQ8KDFaWlsaLOAxEUD3nl26anRLcac3noQ/xA3Tfl65tbMrKHOKXGgm
         FmUTh5gWuqvWjpZYcuXUIPlMHpGCumPZT647fziTocSuIVgmST3WUbsEGa9KNXRTnURR
         mWnmA5RFa6lzi4b+5zOZxaru0kENxhp6ib2dcj6WmCftBp2pmjLyIRuJ4dH7h/v1AkI6
         yaZw==
X-Gm-Message-State: AO0yUKVfxO+Xg+r+KEQeCksb4SYbDqeJ8le2oUMCVIPqyR6fGDnVV7nG
	oLblCn2ydofga7imLMZDb7dSB/qBnw0=
X-Google-Smtp-Source: AK7set9Oy5S9Yr0n0nlHFC1PAlfEeEbH2+wRc0QeKP4E6Cs5jxyLs1qTlkGK9gKllKR2VYjHmZZr0w==
X-Received: by 2002:a17:907:1303:b0:8b1:2cdb:b8dd with SMTP id vj3-20020a170907130300b008b12cdbb8ddmr4254548ejb.58.1676544889508;
        Thu, 16 Feb 2023 02:54:49 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k26-20020a50ce5a000000b004a2470f920esm670835edj.25.2023.02.16.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 02:54:48 -0800 (PST)
Date: Thu, 16 Feb 2023 13:54:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Riana Tauro <riana.tauro@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anshuman Gupta <anshuman.gupta@intel.com>,
	Badal Nilawar <badal.nilawar@intel.com>,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: drivers/gpu/drm/i915/i915_hwmon.c:69 hwm_in_read() error:
 uninitialized symbol 'reg_value'.
Message-ID: <202302161256.eeoRFhSo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230216105436.EEUjaCLV3SVPwehELp8xWc7f-As7lo0aocA3PmG1Ttg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   033c40a89f55525139fd5b6342281b09b97d05bf
commit: f8572bb675250ee527d9ba35fa1ce17480407399 drm/i915/hwmon: Add HWMON current voltage support
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230216/202302161256.eeoRFhSo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302161256.eeoRFhSo-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:69 hwm_in_read() error: uninitialized symbol 'reg_value'.

vim +/reg_value +69 drivers/gpu/drm/i915/i915_hwmon.c

f8572bb675250e Riana Tauro 2022-10-13  57  static int
f8572bb675250e Riana Tauro 2022-10-13  58  hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
f8572bb675250e Riana Tauro 2022-10-13  59  {
f8572bb675250e Riana Tauro 2022-10-13  60  	struct i915_hwmon *hwmon = ddat->hwmon;
f8572bb675250e Riana Tauro 2022-10-13  61  	intel_wakeref_t wakeref;
f8572bb675250e Riana Tauro 2022-10-13  62  	u32 reg_value;
f8572bb675250e Riana Tauro 2022-10-13  63  
f8572bb675250e Riana Tauro 2022-10-13  64  	switch (attr) {
f8572bb675250e Riana Tauro 2022-10-13  65  	case hwmon_in_input:
f8572bb675250e Riana Tauro 2022-10-13  66  		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
f8572bb675250e Riana Tauro 2022-10-13  67  			reg_value = intel_uncore_read(ddat->uncore, hwmon->rg.gt_perf_status);

The with_intel_runtime_pm() macro is a complicated if statement, but
written as a for loop so it can do a get() and a put()?  reg_value is
not initialized in the without pm case.

f8572bb675250e Riana Tauro 2022-10-13  68  		/* HW register value in units of 2.5 millivolt */
f8572bb675250e Riana Tauro 2022-10-13 @69  		*val = DIV_ROUND_CLOSEST(REG_FIELD_GET(GEN12_VOLTAGE_MASK, reg_value) * 25, 10);
f8572bb675250e Riana Tauro 2022-10-13  70  		return 0;
f8572bb675250e Riana Tauro 2022-10-13  71  	default:
f8572bb675250e Riana Tauro 2022-10-13  72  		return -EOPNOTSUPP;
f8572bb675250e Riana Tauro 2022-10-13  73  	}
f8572bb675250e Riana Tauro 2022-10-13  74  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

