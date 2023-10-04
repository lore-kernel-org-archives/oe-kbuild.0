Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1F101F0
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Oct 2023 08:20:09 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3231d67aff2so1812328f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Oct 2023 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696407608; x=1697012408; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1FE66/eW+DC2Mgz/WgZHuGsRc1n/oZs4CygM2JDRZk=;
        b=gW3lDnC9n6iQN0by20SzTE/bsABxfv7FedMt49kxuSRfCt6pkm5vr0uRPoadLwGVYk
         QqsQHtjNNwsy0y42Q6fNSr/v+Q9Du6Ohupa044Ghc4fYCkF0O4OxSceSkm994dhsInfI
         5GE6wO5EAkI9pCdHOfbsMaKPFEaX9jY0oEC8WODP6qntwjaEueW3kD45jLIUdbE5bbm7
         vWD0+cJK/3knAMUMWTJeGn2/yFH1e/wJj5tl/cXvNc4KP4mk+5kgSgaDfW2Y+5eHDKTH
         ByD9mNpsAXc+1G9hIvpExzSYmY50a2ND2Y4lkZrGlkSgwqkC3y6vaJNADifonYtsIxMQ
         ycUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696407608; x=1697012408;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1FE66/eW+DC2Mgz/WgZHuGsRc1n/oZs4CygM2JDRZk=;
        b=cBT7yMd3kJ9MZpgXjiIySwO8mdRXaPP2BTDnLp8NM+nJTRNiInSGgW0hgICd1Rv4Ht
         5m7+LTd31ZTezjxAwRQjIFG9Hi4N+WY12QAfsyf177NxEOy4DHEjmvrbazquGMgvBbTh
         5wB/KjZnU4ZE5kE2WWsjNvR5//j3/MhyYPZW0wd3BeSeXR6wSoUeeIKa5N2qNxaFaVnN
         s6VgQCvA0I0YUMLNoHwuMeThNJBLnMw7MW9Ht3uyDLx/V2/ipxJhFau3fKRisZWwGvaY
         skxzRNnyYlLUM3MIKawTjcFXRHbHZbVtdjycPmczAz4+dgUkKtfSxeuTKvwm/NaprHC6
         yOBw==
X-Gm-Message-State: AOJu0YwAmJLROa4aM9NUep4Hz0xdt3jyzv7p7/v7cdJ8gPrA/0d2tk0g
	9zTESZzXbtlvoF5y2ajhQDR0yLdfrc6Arln2fXk=
X-Google-Smtp-Source: AGHT+IFLBRPqkQWHipaGsTiCRc5ZBYE2RATtEZz+zndjucKgKUKjoymN6EAQlZfKYDbBzw8XsHkxXA==
X-Received: by 2002:a5d:6986:0:b0:317:3d6c:5b27 with SMTP id g6-20020a5d6986000000b003173d6c5b27mr1420304wru.46.1696407607813;
        Wed, 04 Oct 2023 01:20:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f14-20020adff44e000000b0032318649b21sm3418462wrp.31.2023.10.04.01.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 01:20:07 -0700 (PDT)
Date: Wed, 4 Oct 2023 11:20:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Lechner <dlechner@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 140/154]
 drivers/staging/iio/resolver/ad2s1210.c:560 ad2s1210_initial() warn:
 inconsistent returns '&st->lock'.
Message-ID: <021da855-7b41-4dbc-a1ac-71df9ac86d82@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   a533eeaef80e879b3ad1937eee7a43d1f9961c5d
commit: 0d03d0e6584655a002c4e3aaae657b35f0900921 [140/154] staging: iio: resolver: ad2s1210: rework gpios
config: x86_64-randconfig-161-20231002 (https://download.01.org/0day-ci/archive/20231003/202310030222.iokamE9T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310030222.iokamE9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310030222.iokamE9T-lkp@intel.com/

smatch warnings:
drivers/staging/iio/resolver/ad2s1210.c:560 ad2s1210_initial() warn: inconsistent returns '&st->lock'.

vim +560 drivers/staging/iio/resolver/ad2s1210.c

4ae1c61ff2ba4f Bill Pemberton   2012-11-19  534  static int ad2s1210_initial(struct ad2s1210_state *st)
817e5c65c511d4 Graf Yang        2010-10-27  535  {
817e5c65c511d4 Graf Yang        2010-10-27  536  	unsigned char data;
817e5c65c511d4 Graf Yang        2010-10-27  537  	int ret;
817e5c65c511d4 Graf Yang        2010-10-27  538  
817e5c65c511d4 Graf Yang        2010-10-27  539  	mutex_lock(&st->lock);
0d03d0e6584655 David Lechner    2023-09-29  540  	ret = ad2s1210_set_resolution_gpios(st, st->resolution);
0d03d0e6584655 David Lechner    2023-09-29  541  	if (ret < 0)
0d03d0e6584655 David Lechner    2023-09-29  542  		return ret;

goto error_ret;

b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  543  
b3689e14415a87 David Lechner    2023-09-29  544  	/* Use default config register value plus resolution from devicetree. */
b3689e14415a87 David Lechner    2023-09-29  545  	data = FIELD_PREP(AD2S1210_PHASE_LOCK_RANGE_44, 1);
b3689e14415a87 David Lechner    2023-09-29  546  	data |= FIELD_PREP(AD2S1210_ENABLE_HYSTERESIS, 1);
b3689e14415a87 David Lechner    2023-09-29  547  	data |= FIELD_PREP(AD2S1210_SET_ENRES, 0x3);
b3689e14415a87 David Lechner    2023-09-29  548  	data |= FIELD_PREP(AD2S1210_SET_RES, (st->resolution - 10) >> 1);
817e5c65c511d4 Graf Yang        2010-10-27  549  
b3689e14415a87 David Lechner    2023-09-29  550  	ret = regmap_write(st->regmap, AD2S1210_REG_CONTROL, data);
b3689e14415a87 David Lechner    2023-09-29  551  	if (ret < 0)
817e5c65c511d4 Graf Yang        2010-10-27  552  		goto error_ret;
817e5c65c511d4 Graf Yang        2010-10-27  553  
b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  554  	ret = ad2s1210_update_frequency_control_word(st);
b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  555  	if (ret < 0)
b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  556  		goto error_ret;
b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  557  	ret = ad2s1210_soft_reset(st);
817e5c65c511d4 Graf Yang        2010-10-27  558  error_ret:
817e5c65c511d4 Graf Yang        2010-10-27  559  	mutex_unlock(&st->lock);
817e5c65c511d4 Graf Yang        2010-10-27 @560  	return ret;
817e5c65c511d4 Graf Yang        2010-10-27  561  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

