Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB89376BC3
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 06:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891585; cv=none; b=ARuimly9m4I89tq45LP2SFNDkCXAeaQsoJPKOZSwygS4tomARnvjuNDGNTc6ekK0l4bgI6M8QeZ1SDkz6RbdtWVQ6C8pPBthNhn/Bxm20PAb/Mqt5hlY6DDCe8KzoiP190ePNF9Sx4B3XvugBZSzNe4WNZYUWSw6zsCooKrJJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891585; c=relaxed/simple;
	bh=zQTauf9+FCZgvacWS319fh01AB/IlHI0j/OyC2KznK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jApz88FrNh6ExbVmTuODNRtJjBpSHz3dK7UwW6wVUY8HjgmZHmD9Rz6P34fGApdCk9jFKPeDUZMC2d5B4dZIljX5sjUfJor4uyTo1+zSI+STMu4M8XOnlaeG2zzAne+soEbfFgl88XODf/0w/hIoSskWjcp2FnjmHY1SpVPA5H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hP1Ce809; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hP1Ce809"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4062922f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 22:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768891573; x=1769496373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=klhXajdbwAk0QXfRXQmCUKn2nPx5fUGc/8woaWQokME=;
        b=hP1Ce809wJ7EEMz7aOjKE4PfFG2hKks7NE0Rl+n4N/R4tHn6+3JbmozInZJ9/f+rn4
         pILDmF9lqkPYaFjTE88l4lmLW5KR88wgABUaoipCeoi7uO5KqAgYzzKT2NAZmcXp4Ykp
         pC86oyA7c4+QvGTYoWpmIEfUsbpRhXJ4tuhpprH35r2c5O2ypnzZqgKocelg3ySBa7En
         1GMsLBU/rsqzkqHbZpMhpF0uLznOl4xFpPqiiAmhLpTloG4gkvgZ8uNIf9pnD8yvhL3Z
         mIqp79ZLtZT9oS2SwEQDZDpcy1tKn02enXOeZNQoANnw7CXrP6yC+BwPu6VuJ3HGqhy6
         9yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891573; x=1769496373;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klhXajdbwAk0QXfRXQmCUKn2nPx5fUGc/8woaWQokME=;
        b=kJqUcBFixtNjLJRQVq8kg2bHr9Gx6d2OI6oWMJuPDY5t0CTvP7IHctUMET0eWN2oMA
         0iJJ1Kb2V8vb/hORwZZJbdQC1eBMPJJUuR4xiWIVHfZIUla2bDK5TXd3rdR/2BcOIQrX
         iTX0k37Ks7RHERDvsUoNCf+7g57oV7ukZS1bs/3m8BvSgBiAqtU3UttaatAPMfOnI2Bq
         VI+3miLI84dSLgkg8TSY/Exgftzw5w+9HcVOosKHiFqTfwY9+WV8r1RSXbzQ0LRPhF42
         9Z19nLqfW6WZqNQlzM2tqFfc1T2WMqM/nkjbzvWj8AE0MoplwRrO8QG/cuhahoxZXCjQ
         JQPA==
X-Gm-Message-State: AOJu0Yy8QhjiFJYGTGgYGLK5OL3IKjj+D4Y9i26OrCJuh7r4U0nPDC9+
	Sh0+jfBJ6Fj8hTiJ8Z2I28hsO7qxA6Drl9YxHMl6j9az43Q/EWzZsR8pAyZdgeUKS5FW0YNlfuK
	G8FVG
X-Gm-Gg: AZuq6aIqS77eTnbAn4E/lXAn0qNMtFbYIrzLnJ0/2cyiTPIsgYbnUzQhFjVlpoXYeNi
	GqMYIeSH4WyEJclbxf8LP9+da0kgWTOT0YLxPixcZIhg8BIFFoB01g3+4vU8wDD7NVzK4PLXkDV
	30BneagNJI9FIvTs2WPrSG0I9uFWPNKdlk876BmTGaS+ujdMfMw/jeAy04tIkiYK571eR0LjuIl
	pKewoMa59dUJRNJFwO1n7nyoPmydYW3SjvlXOohhojVA5dVXlHMYqMTre4VHK93c0NWHdcaSK1+
	aSJygB59/nAcx8afuoC2RPPOPI1k949eksaDmNWL7dgrBy+7CgysPGKJDiIAMNpk0rAEFsQEwMr
	vTY+ivDnbyGa9uto657ZnTnI4M/lGfk5FSxOZSLVq05SK0ILrgv3O0LgtZEhRsoePvZeURE3EMm
	GLeWdl9iG49sAcBnjo
X-Received: by 2002:a05:6000:2c03:b0:431:3a5:d9c1 with SMTP id ffacd0b85a97d-4358ff5692cmr894098f8f.30.1768891572616;
        Mon, 19 Jan 2026 22:46:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356999810bsm27653160f8f.40.2026.01.19.22.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:46:12 -0800 (PST)
Date: Tue, 20 Jan 2026 09:46:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Francesco Lavra <flavra@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/3] iio: imu: st_lsm6dsx: add support for rotation
 sensor
Message-ID: <202601200451.4BeA8JAe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119100449.1559624-4-flavra@baylibre.com>
Message-ID: <20260120064609.aHUbtXCi4rAFh0YeizZY4IF9_xNOvDxi7GXXyHKyRwE@z>

Hi Francesco,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Lavra/iio-imu-st_lsm6dsx-set-FIFO-ODR-for-accelerometer-and-gyroscope-only/20260119-181615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260119100449.1559624-4-flavra%40baylibre.com
patch subject: [PATCH v3 3/3] iio: imu: st_lsm6dsx: add support for rotation sensor
config: sparc-randconfig-r071-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200451.4BeA8JAe-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601200451.4BeA8JAe-lkp@intel.com/

smatch warnings:
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_fusion.c:90 st_lsm6dsx_sf_set_odr() error: uninitialized symbol 'odr_val'.

vim +/odr_val +90 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_fusion.c

aa03865dcb5ed7 Francesco Lavra 2026-01-19   70  int st_lsm6dsx_sf_set_odr(struct st_lsm6dsx_sensor *sensor, bool enable)
aa03865dcb5ed7 Francesco Lavra 2026-01-19   71  {
aa03865dcb5ed7 Francesco Lavra 2026-01-19   72  	struct st_lsm6dsx_hw *hw = sensor->hw;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   73  	const struct st_lsm6dsx_sf_settings *settings;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   74  	u8 data;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   75  	int err;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   76  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   77  	guard(mutex)(&hw->page_lock);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   78  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   79  	err = st_lsm6dsx_sf_set_page(hw, true);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   80  	if (err < 0)
aa03865dcb5ed7 Francesco Lavra 2026-01-19   81  		return err;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   82  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   83  	settings = &hw->settings->sf_settings;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   84  	if (enable) {
aa03865dcb5ed7 Francesco Lavra 2026-01-19   85  		u8 odr_val;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   86  		const struct st_lsm6dsx_reg *reg = &settings->odr_table.reg;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   87  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   88  		st_lsm6dsx_sf_get_odr_val(settings, sensor->hwfifo_odr_mHz,
aa03865dcb5ed7 Francesco Lavra 2026-01-19   89  					  &odr_val);

No error checking on st_lsm6dsx_sf_get_odr_val().  Probably this is
deliberate?

aa03865dcb5ed7 Francesco Lavra 2026-01-19  @90  		data = ST_LSM6DSX_SHIFT_VAL(odr_val, reg->mask);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   91  		err = regmap_update_bits(hw->regmap, reg->addr, reg->mask,
aa03865dcb5ed7 Francesco Lavra 2026-01-19   92  					 data);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   93  		if (err < 0)
aa03865dcb5ed7 Francesco Lavra 2026-01-19   94  			goto out;
aa03865dcb5ed7 Francesco Lavra 2026-01-19   95  	}
aa03865dcb5ed7 Francesco Lavra 2026-01-19   96  
aa03865dcb5ed7 Francesco Lavra 2026-01-19   97  	err = regmap_assign_bits(hw->regmap, settings->fifo_enable.addr,
aa03865dcb5ed7 Francesco Lavra 2026-01-19   98  				 settings->fifo_enable.mask, enable);
aa03865dcb5ed7 Francesco Lavra 2026-01-19   99  	if (err < 0)
aa03865dcb5ed7 Francesco Lavra 2026-01-19  100  		goto out;
aa03865dcb5ed7 Francesco Lavra 2026-01-19  101  
aa03865dcb5ed7 Francesco Lavra 2026-01-19  102  	return st_lsm6dsx_sf_set_page(hw, false);
aa03865dcb5ed7 Francesco Lavra 2026-01-19  103  
aa03865dcb5ed7 Francesco Lavra 2026-01-19  104  out:
aa03865dcb5ed7 Francesco Lavra 2026-01-19  105  	st_lsm6dsx_sf_set_page(hw, false);
aa03865dcb5ed7 Francesco Lavra 2026-01-19  106  
aa03865dcb5ed7 Francesco Lavra 2026-01-19  107  	return err;
aa03865dcb5ed7 Francesco Lavra 2026-01-19  108  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

