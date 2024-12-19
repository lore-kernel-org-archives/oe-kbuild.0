Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDA522371F
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Dec 2024 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734607718; cv=none; b=Qp9TiYstz3L18RKuQ68kLWkA+vOSj4t0cA6hhG8WqEhKb6PcHNxJmarKmdgTT6zpKK+9fi2SRgsGRsKWp2NNUioUjZV5Bj+/UfLDqaBmdTEmEFrK3J8xveN7k6BJOsyEewmtNjYT6ejDTzQjr352XSsmfx8EwrMAs+96DiLPJ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734607718; c=relaxed/simple;
	bh=Rn2ZpBXFJSkcrBt0bHzy2Hci5m3Vfg3h/UGKwBmkFL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rR8wJ/WLMoj9O7hdRHGbY93xf+8Glhb3FR5yLW1D0wouBjKMimq9I12Fr6cdEOvZ8atmnJaU3pAgFoiQxWPAoDm0kcgF/ky+1xuyZIm9pYMqgyA6Es/MjAXxVwcln6lwzd6sd6CWOG0kMOVGk3Jx5FsG0U2JecZXxZZLn4FB/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XkrTn7wc; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XkrTn7wc"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so1086115a12.1
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Dec 2024 03:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734607714; x=1735212514; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OOeztBILv3pJs8OslB3gpiwKZSWXXwGxwA1Hj/M2nz0=;
        b=XkrTn7wciK6T9Dh0cETjbxrK7NMeYmJHs/hHBZbcPWM/3thbWxvW59h+hm+PvF4Rw1
         RG9iQaTtcIjTUNr40/9XqO+q0AKY+frTMfE2ujxXRm4K5gG5n446adHVoxbtyPDPjYJo
         4DX666z8odd2kK0pmyIy0hN4aBVAuhxvnpG8XQ9yuukvLy99ysFqBbchzHgCk7vHLN2T
         qc+aMS7f4T9nrRsitrMcxKBjS6L/kdn3H5kmN6lnzp64Bxi6SdSva4WX7JL9urCsEw8G
         brWG9P5Q5RYlLV8Gn34ykk8M8y2LP5EexELDPQeuHnM+qXKEw9tGwnldzKxo50bgXP3B
         +ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734607714; x=1735212514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOeztBILv3pJs8OslB3gpiwKZSWXXwGxwA1Hj/M2nz0=;
        b=H01RXGo5UFSwDMyNNST1M2q2Vc7SCS3v+zLR5O1w/QHWIq73sZPwV1ZHrTsRWW2L/1
         HOpaqIzj4OY8dsipZxAkOKt8kDkLaiQIpXvAfrDMwPHGTs6uEofMm7t6879pfqQjQmce
         MWn+oAtGrHniYJpfNWKhPJ1yimJbBHJYxciQ/lgew37Zw0rJdgnF+TipRs5pfH9EAeaF
         uZLx8pnGXa8uYpbKPF87Wmx0yZT93Hu4JKWJR81NH4hBCT2Xqqv1b8pyMVhTSNy5YvFZ
         VyyX/xP0Q/ccG1fTN+Vm/h4CefjgAWdmTf0GNNlgVKPqoEU8pBA6bA2rb70gwbdiz4jG
         XumA==
X-Gm-Message-State: AOJu0YzgiVEBVfMEYIlgFOccmk4FbNCUWJG6R7pCQ//rZ1a7rrlsv/tQ
	NzTMDPCb2t4EpZctTr7ddWupbegXmvQ2RkKHf7jhQX52mxac/2PxhsdY+I1KJkz6xqqlJhC9ml4
	r
X-Gm-Gg: ASbGncuzfX1mtJAuVia/o8yq6lbSkTJ+5Hb5edMUoREWjzif20LdhCbaMegyOvjPdMv
	7RPbf55Ans0wmDDVn/855GtHm7aDyRcLlb+DCp4DMTcakYCyTkGpOvnobHkp2gTlTSKqE9HHDpY
	YOe3zJJMZuuRV6I3B644L5wt1IX8MuQ73w6kq5PRx1O0F9clM4LGNhrxxsfdov07NT9KMOvSP6e
	tak87wxG903Kn8SAy2rvlb2nxL8BnplxAIvlORseuE1R60+MPgCA5YE7F1hHg==
X-Google-Smtp-Source: AGHT+IFYWlKPrlMPHYtzOzC5RXOXIxvlzii7QxWTWtpsaIvsQ6CcdA3QHj09PwSdK/kjpbIBT0HhWg==
X-Received: by 2002:a05:6402:2801:b0:5d0:8359:7a49 with SMTP id 4fb4d7f45d1cf-5d80246fbdamr2511850a12.0.1734607714301;
        Thu, 19 Dec 2024 03:28:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679efc9sm550366a12.47.2024.12.19.03.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:28:33 -0800 (PST)
Date: Thu, 19 Dec 2024 14:28:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Antoniu Miclaus <antoniu.miclaus@analog.com>,
	jic23@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: Re: [PATCH v2 3/3] iio: frequency: adf4371: add ref doubler
Message-ID: <bc42978f-e86a-4560-bb4b-8a5fb2df4f4c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241209104201.25205-3-antoniu.miclaus@analog.com>

Hi Antoniu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/iio-frequency-adf4371-add-differential-ref/20241209-184437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20241209104201.25205-3-antoniu.miclaus%40analog.com
patch subject: [PATCH v2 3/3] iio: frequency: adf4371: add ref doubler
config: parisc-randconfig-r073-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191811.lAia02sc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412191811.lAia02sc-lkp@intel.com/

smatch warnings:
drivers/iio/frequency/adf4371.c:545 adf4371_setup() error: uninitialized symbol 'ref_doubler_en'.

vim +/ref_doubler_en +545 drivers/iio/frequency/adf4371.c

7f699bd14913423 Stefan Popa     2019-06-04  487  static int adf4371_setup(struct adf4371_state *st)
7f699bd14913423 Stefan Popa     2019-06-04  488  {
7f699bd14913423 Stefan Popa     2019-06-04  489  	unsigned int synth_timeout = 2, timeout = 1, vco_alc_timeout = 1;
347e385fdd6ecda Antoniu Miclaus 2024-12-09  490  	unsigned int vco_band_div, tmp, ref_doubler_en;
011032df594999f Antoniu Miclaus 2024-12-09  491  	bool ref_diff_en;
7f699bd14913423 Stefan Popa     2019-06-04  492  	int ret;
7f699bd14913423 Stefan Popa     2019-06-04  493  
7f699bd14913423 Stefan Popa     2019-06-04  494  	/* Perform a software reset */
7f699bd14913423 Stefan Popa     2019-06-04  495  	ret = regmap_write(st->regmap, ADF4371_REG(0x0), ADF4371_RESET_CMD);
7f699bd14913423 Stefan Popa     2019-06-04  496  	if (ret < 0)
7f699bd14913423 Stefan Popa     2019-06-04  497  		return ret;
7f699bd14913423 Stefan Popa     2019-06-04  498  
7f699bd14913423 Stefan Popa     2019-06-04  499  	ret = regmap_multi_reg_write(st->regmap, adf4371_reg_defaults,
7f699bd14913423 Stefan Popa     2019-06-04  500  				     ARRAY_SIZE(adf4371_reg_defaults));
7f699bd14913423 Stefan Popa     2019-06-04  501  	if (ret < 0)
7f699bd14913423 Stefan Popa     2019-06-04  502  		return ret;
7f699bd14913423 Stefan Popa     2019-06-04  503  
def914a4c3899b6 Stefan Popa     2019-06-24  504  	/* Mute to Lock Detect */
def914a4c3899b6 Stefan Popa     2019-06-24  505  	if (device_property_read_bool(&st->spi->dev, "adi,mute-till-lock-en")) {
def914a4c3899b6 Stefan Popa     2019-06-24  506  		ret = regmap_update_bits(st->regmap, ADF4371_REG(0x25),
def914a4c3899b6 Stefan Popa     2019-06-24  507  					 ADF4371_MUTE_LD_MSK,
def914a4c3899b6 Stefan Popa     2019-06-24  508  					 ADF4371_MUTE_LD(1));
def914a4c3899b6 Stefan Popa     2019-06-24  509  		if (ret < 0)
def914a4c3899b6 Stefan Popa     2019-06-24  510  			return ret;
def914a4c3899b6 Stefan Popa     2019-06-24  511  	}
def914a4c3899b6 Stefan Popa     2019-06-24  512  
011032df594999f Antoniu Miclaus 2024-12-09  513  	ref_diff_en = device_property_read_bool(&st->spi->dev, "adi,ref-differential-enable");
011032df594999f Antoniu Miclaus 2024-12-09  514  
7f699bd14913423 Stefan Popa     2019-06-04  515  	/* Set address in ascending order, so the bulk_write() will work */
7f699bd14913423 Stefan Popa     2019-06-04  516  	ret = regmap_update_bits(st->regmap, ADF4371_REG(0x0),
7f699bd14913423 Stefan Popa     2019-06-04  517  				 ADF4371_ADDR_ASC_MSK | ADF4371_ADDR_ASC_R_MSK,
7f699bd14913423 Stefan Popa     2019-06-04  518  				 ADF4371_ADDR_ASC(1) | ADF4371_ADDR_ASC_R(1));
7f699bd14913423 Stefan Popa     2019-06-04  519  	if (ret < 0)
7f699bd14913423 Stefan Popa     2019-06-04  520  		return ret;
011032df594999f Antoniu Miclaus 2024-12-09  521  
011032df594999f Antoniu Miclaus 2024-12-09  522  	if ((ref_diff_en && st->clkin_freq > ADF4371_MAX_FREQ_REFIN) ||
011032df594999f Antoniu Miclaus 2024-12-09  523  	    (!ref_diff_en && st->clkin_freq > ADF4371_MAX_FREQ_REFIN_SE))
011032df594999f Antoniu Miclaus 2024-12-09  524  		return -EINVAL;
011032df594999f Antoniu Miclaus 2024-12-09  525  
347e385fdd6ecda Antoniu Miclaus 2024-12-09  526  	if (st->clkin_freq < ADF4371_MAX_CLKIN_DOUB_FREQ &&
347e385fdd6ecda Antoniu Miclaus 2024-12-09  527  	    st->clkin_freq > ADF4371_MIN_CLKIN_DOUB_FREQ)
347e385fdd6ecda Antoniu Miclaus 2024-12-09  528  		ref_doubler_en = 1;

Uninitialized on else path.

347e385fdd6ecda Antoniu Miclaus 2024-12-09  529  
011032df594999f Antoniu Miclaus 2024-12-09  530  	ret = regmap_update_bits(st->regmap,  ADF4371_REG(0x22),
011032df594999f Antoniu Miclaus 2024-12-09  531  				 ADF4371_REFIN_MODE_MASK,
011032df594999f Antoniu Miclaus 2024-12-09  532  				 ADF4371_REFIN_MODE(ref_diff_en));
011032df594999f Antoniu Miclaus 2024-12-09  533  	if (ret < 0)
011032df594999f Antoniu Miclaus 2024-12-09  534  		return ret;
011032df594999f Antoniu Miclaus 2024-12-09  535  
7f699bd14913423 Stefan Popa     2019-06-04  536  	/*
7f699bd14913423 Stefan Popa     2019-06-04  537  	 * Calculate and maximize PFD frequency
7f699bd14913423 Stefan Popa     2019-06-04  538  	 * fPFD = REFIN × ((1 + D)/(R × (1 + T)))
7f699bd14913423 Stefan Popa     2019-06-04  539  	 * Where D is the REFIN doubler bit, T is the reference divide by 2,
7f699bd14913423 Stefan Popa     2019-06-04  540  	 * R is the reference division factor
7f699bd14913423 Stefan Popa     2019-06-04  541  	 * TODO: it is assumed D and T equal 0.
7f699bd14913423 Stefan Popa     2019-06-04  542  	 */
7f699bd14913423 Stefan Popa     2019-06-04  543  	do {
7f699bd14913423 Stefan Popa     2019-06-04  544  		st->ref_div_factor++;
347e385fdd6ecda Antoniu Miclaus 2024-12-09 @545  		st->fpfd = st->clkin_freq * (1 + ref_doubler_en) /
347e385fdd6ecda Antoniu Miclaus 2024-12-09  546  			   st->ref_div_factor;
7f699bd14913423 Stefan Popa     2019-06-04  547  	} while (st->fpfd > ADF4371_MAX_FREQ_PFD);
7f699bd14913423 Stefan Popa     2019-06-04  548  
7f699bd14913423 Stefan Popa     2019-06-04  549  	/* Calculate Timeouts */
7f699bd14913423 Stefan Popa     2019-06-04  550  	vco_band_div = DIV_ROUND_UP(st->fpfd, 2400000U);
7f699bd14913423 Stefan Popa     2019-06-04  551  
7f699bd14913423 Stefan Popa     2019-06-04  552  	tmp = DIV_ROUND_CLOSEST(st->fpfd, 1000000U);
7f699bd14913423 Stefan Popa     2019-06-04  553  	do {
7f699bd14913423 Stefan Popa     2019-06-04  554  		timeout++;
7f699bd14913423 Stefan Popa     2019-06-04  555  		if (timeout > 1023) {
7f699bd14913423 Stefan Popa     2019-06-04  556  			timeout = 2;
7f699bd14913423 Stefan Popa     2019-06-04  557  			synth_timeout++;
7f699bd14913423 Stefan Popa     2019-06-04  558  		}
7f699bd14913423 Stefan Popa     2019-06-04  559  	} while (synth_timeout * 1024 + timeout <= 20 * tmp);
7f699bd14913423 Stefan Popa     2019-06-04  560  
7f699bd14913423 Stefan Popa     2019-06-04  561  	do {
7f699bd14913423 Stefan Popa     2019-06-04  562  		vco_alc_timeout++;
7f699bd14913423 Stefan Popa     2019-06-04  563  	} while (vco_alc_timeout * 1024 - timeout <= 50 * tmp);
7f699bd14913423 Stefan Popa     2019-06-04  564  
7f699bd14913423 Stefan Popa     2019-06-04  565  	st->buf[0] = vco_band_div;
7f699bd14913423 Stefan Popa     2019-06-04  566  	st->buf[1] = timeout & 0xFF;
7f699bd14913423 Stefan Popa     2019-06-04  567  	st->buf[2] = ADF4371_TIMEOUT(timeout >> 8) | 0x04;
7f699bd14913423 Stefan Popa     2019-06-04  568  	st->buf[3] = synth_timeout;
7f699bd14913423 Stefan Popa     2019-06-04  569  	st->buf[4] = ADF4371_VCO_ALC_TOUT(vco_alc_timeout);
7f699bd14913423 Stefan Popa     2019-06-04  570  
7f699bd14913423 Stefan Popa     2019-06-04  571  	return regmap_bulk_write(st->regmap, ADF4371_REG(0x30), st->buf, 5);
7f699bd14913423 Stefan Popa     2019-06-04  572  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

