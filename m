Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2384C64;
	Tue, 21 Feb 2023 14:54:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p18-20020a05600c359200b003dc57ea0dfeso3787499wmq.0;
        Tue, 21 Feb 2023 06:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TyFfwBUaMUtFp6HKd07rm6OPEp5MM4Hsnl/slgK1uVw=;
        b=UNR+Yvgx2zk3p+nJXeUpKX3Z9wPdf9iTdKrtlWiK1VBnn9Z5Ski0M9JfzwUOc4ggKg
         WjM0P/iRLaSkyp9FnMPZU4WjrA59oCiS9J6TOlxlcF6OHucdgpUUnh39R9MlaDGHT80M
         igM3hTgbUsS8S6yJzXHqePEVY5det8ngTxaUd348pJ+Vqs+RlZdiqFmU+TIX1JZh9i0T
         n688GWptgsqVTraO8BSoxNmKWaGgLHnnuVcvyD52Dm8nmFK2I+xwYJmo888UKqXqCTMP
         Tnmb4U+StT1tVhnvp1Hogbe6MRgT2tYdXHdtXq8i7eIXMqSBRefkLIo0rkaVYYwVscgV
         oAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyFfwBUaMUtFp6HKd07rm6OPEp5MM4Hsnl/slgK1uVw=;
        b=sdyjmtKaLxY5PSBFPMHCqYIq7aAAsvej0tFWdnXFKNaY9WjyD1V7eb94qIdwpPIvkj
         VKmkNbDqEL3cFX5ZZ1bKMxD/FZP7PPs2ZvWSYgVI/n3c7raYzrxJ1pNDjqmO4vFXgY+v
         cVpj92R89on8qnc6U8399YOQ/u7hTBC9aiO/Ln2vNW+Z6lTbcxwMHCALgkfssQh03kJM
         oQE5ZRMjqAvABq1lKfZR/NYgLo4JR5zngIpb3N31eT+2X83CtWTa0QFI/On1wp+1fAOz
         Bkg1Yv53BGIb7ZmeETctoYOCUaysZ/P4wspQPTXQyohbn9lProJRluYZNLDhLqJ75g7j
         Vqjw==
X-Gm-Message-State: AO0yUKUcECBffpQtqUZsTOPHNG5mtaZHxhdGoLFqi5hWJUvLODbG39n4
	gX0co2sgwbRkhdJiZWo7NAkpkicaRA4=
X-Google-Smtp-Source: AK7set9O/+nPLl6Dlf5ZZBJJF6UpWCdnUVsdTLpOB+OYLTsqF2S3JzK+TuhGmfR6/aGWocW/154HjQ==
X-Received: by 2002:a05:600c:714:b0:3df:eecc:de2b with SMTP id i20-20020a05600c071400b003dfeeccde2bmr11230627wmn.11.1676991259435;
        Tue, 21 Feb 2023 06:54:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d434e000000b002c5a1bd527dsm4011359wrr.96.2023.02.21.06.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:54:19 -0800 (PST)
From: kernel test robot <error27@gmail.com>
X-Google-Original-From: kernel test robot <lkp@intel.com>
Date: Tue, 21 Feb 2023 17:54:15 +0300
To: oe-kbuild@lists.linux.dev, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [linux-next:master 1866/13664] drivers/gpu/drm/i915/i915_hwmon.c:383
 hwm_power_max_read() error: uninitialized symbol 'r'.
Message-ID: <Y/TbF6xqqoi0xlg6@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   465461cf48465b8a0a54025db5ae2b3df7a04577
commit: d2c3c8c3d3833c45c09be671da48f9d46b79e347 [1866/13664] drm/i915/hwmon: Display clamped PL1 limit
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230221/202302212146.aYzIN9SV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302212146.aYzIN9SV-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:383 hwm_power_max_read() error: uninitialized symbol 'r'.

Old smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:97 hwm_field_read_and_scale() error: uninitialized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:156 hwm_energy() error: uninitialized symbol 'reg_val'.
drivers/gpu/drm/i915/i915_hwmon.c:180 hwm_power1_max_interval_show() error: uninitialized symbol 'r'.
drivers/gpu/drm/i915/i915_hwmon.c:335 hwm_in_read() error: uninitialized symbol 'reg_value'.

vim +/r +383 drivers/gpu/drm/i915/i915_hwmon.c

99f55efb79114f Dale B Stimson 2022-10-13  368  static int
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  369  hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
99f55efb79114f Dale B Stimson 2022-10-13  370  {
99f55efb79114f Dale B Stimson 2022-10-13  371  	struct i915_hwmon *hwmon = ddat->hwmon;
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  372  	intel_wakeref_t wakeref;
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  373  	u64 r, min, max;
99f55efb79114f Dale B Stimson 2022-10-13  374  
99f55efb79114f Dale B Stimson 2022-10-13  375  	*val = hwm_field_read_and_scale(ddat,
99f55efb79114f Dale B Stimson 2022-10-13  376  					hwmon->rg.pkg_rapl_limit,
99f55efb79114f Dale B Stimson 2022-10-13  377  					PKG_PWR_LIM_1,
99f55efb79114f Dale B Stimson 2022-10-13  378  					hwmon->scl_shift_power,
99f55efb79114f Dale B Stimson 2022-10-13  379  					SF_POWER);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  380  
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  381  	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  382  		r = intel_uncore_read64(ddat->uncore, hwmon->rg.pkg_power_sku);

r not initialized on the without path.  I'm kind of drowning in these
with_intel_runtime_pm() warnings.  I've emailed about them before but
never recieved any response so presumably they are false positive.  I
could probably add a special case to say that the without runtime pm
situation is impossible but I wanted to hear back for sure first.

d2c3c8c3d3833c Ashutosh Dixit 2022-12-15 @383  	min = REG_FIELD_GET(PKG_MIN_PWR, r);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  384  	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  385  	max = REG_FIELD_GET(PKG_MAX_PWR, r);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  386  	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  387  
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  388  	if (min && max)
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  389  		*val = clamp_t(u64, *val, min, max);
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  390  
99f55efb79114f Dale B Stimson 2022-10-13  391  	return 0;
d2c3c8c3d3833c Ashutosh Dixit 2022-12-15  392  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
