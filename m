Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F832587;
	Sat, 24 Dec 2022 11:04:26 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id co23so6586029wrb.4;
        Sat, 24 Dec 2022 03:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YObuKqKdosJjt8ocU09PZY8MOZyD58Uz2/b6E5NDNk=;
        b=fMdhXU0WuGz6ONHJV3JTj9kK0IbrChCqJdq05ECiJBgB8DCTvlc6s4jRcE9wXNxkpw
         /g9/b2Hi9fC7luj87wCTpZaYnnpw+T7KaGgSJxOcosPFDX5Vs8lYyFjlliiqLDwQClwH
         FKOiccjKi9gFpS+2mEZrMlfXW4KEoM3cWfZ4cJvu/gzE8iRrJ9/OcJq5qZTTZ+Zv/lYO
         ZRY1joiRH8qEuHfIuLXJ7DW/lHBnMaqfjpuSsa4L1E5OhpXsV+Lnc3S6aK4/kezqpXiE
         Y/w3OWjDjWerve9cV5jGyZOUnAbCWe+STO+/F9zaxId7QLFfuOb0ZHRn4gucwQrnKzgS
         I8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YObuKqKdosJjt8ocU09PZY8MOZyD58Uz2/b6E5NDNk=;
        b=PiiArhTvG2pDHPlHhsyHIQe6Q77FJHW+JhqnaAB9nTNxi3H/qV9/WHvuySCHu6vl6q
         WsXS5B1yYlUDCNt8E2nGpFU5i4auBaHJtbEMvKAQsmOBQV5p+hThSZ3EnpBKdMDgDimo
         zFvOct9VceXfNHd+adpp9LDS2qQYypzrhcB0ejuPMb4bVnpYGqOD5TexrY95iuyFG+Y2
         0HJ6csnMu94bfF1+Dl24dyZnTTZpXwV1GKcjvaxCfWHLhy5wL1zjiDopSu2dpTzPb6tf
         5wHCWKTviI7ILKXHEw6xmagXEmE95mW5SsmjOY4mzmN0w2Tle5rrn8qNvIkv0a/2iomq
         NOWw==
X-Gm-Message-State: AFqh2krBMfwLMh21qGxLY5zhPpeC7sTxptzKIRTjlXW44eUW1gB0bTd1
	vEI/N+7eUJTIX6XCP83MhPkuGNlGuYIQd0+h
X-Google-Smtp-Source: AMrXdXsTSu7tzbQtqwOPpwFAhMHXEAppbsBEI3xYQTwegIg7xP32d9GP/Enqyvj0o2PkWeDFl50H1w==
X-Received: by 2002:a5d:4349:0:b0:25d:4dfb:790c with SMTP id u9-20020a5d4349000000b0025d4dfb790cmr7377768wrr.13.1671879864150;
        Sat, 24 Dec 2022 03:04:24 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t5-20020a05600001c500b00242246c2f7csm5251637wrx.101.2022.12.24.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 03:04:23 -0800 (PST)
Date: Sat, 24 Dec 2022 14:04:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philippe Cornu <philippe.cornu@foss.st.com>
Subject: drivers/gpu/drm/stm/ltdc.c:1124 ltdc_crtc_set_crc_source() warn:
 variable dereferenced before check 'crtc' (see line 1119)
Message-ID: <202212241802.zeLFZCXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221224110420.3DPR0BDUd4PFPnVe8lyF9ZWQAKUdJqS3xfQT6hX6KBI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72a85e2b0a1e1e6fb4ee51ae902730212b2de25c
commit: 79b44684a14e363d24c299b772f037344ad8c8dc drm/stm: ltdc: add support for CRC hashing feature
config: arm-randconfig-m041-20221224
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1124 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1119)

Old smatch warnings:
drivers/gpu/drm/stm/ltdc.c:901 ltdc_crtc_mode_set_nofb() warn: iterator used outside loop: 'bridge'
drivers/gpu/drm/stm/ltdc.c:911 ltdc_crtc_mode_set_nofb() warn: pm_runtime_get_sync() also returns 1 on success

vim +/crtc +1124 drivers/gpu/drm/stm/ltdc.c

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1117  static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1118  {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1119  	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
                                                                                                ^^^^
Derefernce

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1120  	int ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1121  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1122  	DRM_DEBUG_DRIVER("\n");
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1123  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1124  	if (!crtc)
                                                            ^^^^^
Checked too late.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1125  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1126  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1127  	if (source && strcmp(source, "auto") == 0) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1128  		ldev->crc_active = true;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1129  		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1130  	} else if (!source) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1131  		ldev->crc_active = false;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1132  		ret = regmap_clear_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1133  	} else {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1134  		ret = -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1135  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1136  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1137  	ldev->crc_skip_count = 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1138  	return ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1139  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

