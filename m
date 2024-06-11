Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E917836F
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Jun 2024 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102822; cv=none; b=MZiVNnF4jZUaWeru1A9bkEjRBGGzTIYwcRNpXSwWHnOEcHb+4lAaKVqJcPGmFH7MkWa51u92q+W6WDySPrKnGjg8fsNtjJc0NUDFiX6eGYbViRByOaAuRq/19UO94jhOAT//N7G5pkN6ZFNzzjtsTKizO+MpwApyjETCAET5jmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102822; c=relaxed/simple;
	bh=9v70XV5y4GSnRmoIx0HSZWYeUnRaDfB3X/utGcfIfWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JPK0Er4iNAGmHlKc/FXELkbWr+gSoBiLbAHugqfeZRUJNpHAnNsRqzmz7uHt1sXNdEmRHWpOkbf7RSLAJb/g0jVcyz0dfPmB5kA5S2JIQBUPAOrAe6ecUletk7MHAZxpfeKfLQIyhZR1FZSkxILFlo27MeXr/5E3i8wfLL8nwrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fLYvBMXJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fLYvBMXJ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c84a21c62so2561072e87.1
        for <oe-kbuild@lists.linux.dev>; Tue, 11 Jun 2024 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718102818; x=1718707618; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fp+D+Ajoxcp8Oj4mR/rcn2WCT+/k1rl0VG3rX/u5T2Q=;
        b=fLYvBMXJk+X7SJ1YgMPB7B4Fr9KJOpvuulPJ5LL+p8Aw7ZSvVbSfHGkKUBTG+bEIOR
         meKbqkHS6BpV/ANnAZdn+rlN3auQFIv4YuqDw1dktnoe0jPtNE/Ylh/GSNUy1woQBJvO
         wpJN0ipwEa9OagxOLv0kivgdknYSAHnJjt+CzhuC2YQzldUf00P9nR8YVkOVXhEYbb9/
         V22BseVbn+V8aEISNKACgFyOjOEeoC0ubJSkU6PflFk3uJKbijblfvhI8SO4SEclbJ25
         OaohDelEUC3RprsXFGpXiwS7Ea0Xv9NyNuz52AxwVfogXmsAL5p/m90es3UY4ajWPyeE
         Y10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718102818; x=1718707618;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp+D+Ajoxcp8Oj4mR/rcn2WCT+/k1rl0VG3rX/u5T2Q=;
        b=nRzbo7MRo9Q/CiSLs6Sb63gBSsCqM1jIocSdkXlE+4L+py0VCos7t1KylF+XOvSUcM
         V/w9k04A7Xko4WjlwrhFpbzCEAvV/uxqMTFeoBLN28f4VxQ6qCZvmHFDlM8+rOYn64m+
         aYlA6QF98LHt4esNKf+R2tE2jN/uji6/RbwkhQGScKmF7CE94cnnBAAEZyrzwjWQsMS4
         iaRU3GWm9uM7gj8EGh9k/Wx2WlB7DFXV07lOTjo49WvAFN4esRh+N9r0GmEvqyJM2olB
         ADB3Yr8RAaTB3xDj/dJNfl/ys/NlQphvpz2waeQ8zdoRirMRMPAl5t4K6Ol4sz7dyYdz
         C8MA==
X-Gm-Message-State: AOJu0YzET/NdLWCHSVc5sHAuecPWhv6G93idaD5VaWL5Lea4MTXj0TPT
	2LY8II64BUYv7ywcUC/KPpjVD4CGUl+CjLpoZkuwo/AGFiS+hV8CIuafAyDvNNRvLOG8k+WYbfj
	y
X-Google-Smtp-Source: AGHT+IHtdFqo/9J5gcont3xPpGuqzTIC4OsBhAx07391LfaeWl+GPgTqM/ZWZg+Gl6i65g9CyLwSng==
X-Received: by 2002:a05:6512:318e:b0:52c:9528:55d1 with SMTP id 2adb3069b0e04-52c952856f6mr1061801e87.4.1718102818138;
        Tue, 11 Jun 2024 03:46:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2583bdedsm4755135f8f.72.2024.06.11.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 03:46:57 -0700 (PDT)
Date: Tue, 11 Jun 2024 13:46:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Artur Rojek <contact@artur-rojek.eu>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adc-joystick - move axes data into the main
 structure
Message-ID: <0c098606-aba1-4cc0-9a33-6a68c67b1157@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmYlfKDm5sgB44EU@google.com>

Hi Dmitry,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Torokhov/Input-adc-joystick-move-axes-data-into-the-main-structure/20240610-060124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/ZmYlfKDm5sgB44EU%40google.com
patch subject: [PATCH] Input: adc-joystick - move axes data into the main structure
config: x86_64-randconfig-161-20240611 (https://download.01.org/0day-ci/archive/20240611/202406111750.AXBfJUS3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406111750.AXBfJUS3-lkp@intel.com/

smatch warnings:
drivers/input/joystick/adc-joystick.c:166 adc_joystick_set_axes() error: uninitialized symbol 'axes'.
drivers/input/joystick/adc-joystick.c:241 adc_joystick_probe() error: uninitialized symbol 'joy'.
drivers/input/joystick/adc-joystick.c:241 adc_joystick_probe() warn: passing zero to 'PTR_ERR'

vim +/axes +166 drivers/input/joystick/adc-joystick.c

2c2b364fddd551 Artur Rojek     2020-09-28  131  
2c2b364fddd551 Artur Rojek     2020-09-28  132  static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
2c2b364fddd551 Artur Rojek     2020-09-28  133  {
2c2b364fddd551 Artur Rojek     2020-09-28  134  	struct adc_joystick_axis *axes;
2c2b364fddd551 Artur Rojek     2020-09-28  135  	struct fwnode_handle *child;
815b74328f141f Dmitry Torokhov 2024-06-09  136  	s32 range[2], fuzz, flat;
815b74328f141f Dmitry Torokhov 2024-06-09  137  	unsigned int num_axes;
815b74328f141f Dmitry Torokhov 2024-06-09  138  	int error, i;
2c2b364fddd551 Artur Rojek     2020-09-28  139  
2c2b364fddd551 Artur Rojek     2020-09-28  140  	num_axes = device_get_child_node_count(dev);
2c2b364fddd551 Artur Rojek     2020-09-28  141  	if (!num_axes) {
2c2b364fddd551 Artur Rojek     2020-09-28  142  		dev_err(dev, "Unable to find child nodes\n");
2c2b364fddd551 Artur Rojek     2020-09-28  143  		return -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  144  	}
2c2b364fddd551 Artur Rojek     2020-09-28  145  
2c2b364fddd551 Artur Rojek     2020-09-28  146  	if (num_axes != joy->num_chans) {
2c2b364fddd551 Artur Rojek     2020-09-28  147  		dev_err(dev, "Got %d child nodes for %d channels\n",
2c2b364fddd551 Artur Rojek     2020-09-28  148  			num_axes, joy->num_chans);
2c2b364fddd551 Artur Rojek     2020-09-28  149  		return -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  150  	}
2c2b364fddd551 Artur Rojek     2020-09-28  151  
2c2b364fddd551 Artur Rojek     2020-09-28  152  	device_for_each_child_node(dev, child) {
2c2b364fddd551 Artur Rojek     2020-09-28  153  		error = fwnode_property_read_u32(child, "reg", &i);
2c2b364fddd551 Artur Rojek     2020-09-28  154  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  155  			dev_err(dev, "reg invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  156  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  157  		}
2c2b364fddd551 Artur Rojek     2020-09-28  158  
2c2b364fddd551 Artur Rojek     2020-09-28  159  		if (i >= num_axes) {
2c2b364fddd551 Artur Rojek     2020-09-28  160  			error = -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  161  			dev_err(dev, "No matching axis for reg %d\n", i);
2c2b364fddd551 Artur Rojek     2020-09-28  162  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  163  		}
2c2b364fddd551 Artur Rojek     2020-09-28  164  
2c2b364fddd551 Artur Rojek     2020-09-28  165  		error = fwnode_property_read_u32(child, "linux,code",
2c2b364fddd551 Artur Rojek     2020-09-28 @166  						 &axes[i].code);

axes is unitialized.

2c2b364fddd551 Artur Rojek     2020-09-28  167  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  168  			dev_err(dev, "linux,code invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  169  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  170  		}
2c2b364fddd551 Artur Rojek     2020-09-28  171  
2c2b364fddd551 Artur Rojek     2020-09-28  172  		error = fwnode_property_read_u32_array(child, "abs-range",
815b74328f141f Dmitry Torokhov 2024-06-09  173  						       range, 2);
2c2b364fddd551 Artur Rojek     2020-09-28  174  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  175  			dev_err(dev, "abs-range invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  176  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  177  		}
2c2b364fddd551 Artur Rojek     2020-09-28  178  
815b74328f141f Dmitry Torokhov 2024-06-09  179  		if (range[0] > range[1]) {
6560cfcfb46511 Chris Morgan    2024-01-19  180  			dev_dbg(dev, "abs-axis %d inverted\n", i);
6560cfcfb46511 Chris Morgan    2024-01-19  181  			axes[i].inverted = true;
815b74328f141f Dmitry Torokhov 2024-06-09  182  			swap(range[0], range[1]);
6560cfcfb46511 Chris Morgan    2024-01-19  183  		}
6560cfcfb46511 Chris Morgan    2024-01-19  184  
815b74328f141f Dmitry Torokhov 2024-06-09  185  		fwnode_property_read_u32(child, "abs-fuzz", &fuzz);
815b74328f141f Dmitry Torokhov 2024-06-09  186  		fwnode_property_read_u32(child, "abs-flat", &flat);
2c2b364fddd551 Artur Rojek     2020-09-28  187  
2c2b364fddd551 Artur Rojek     2020-09-28  188  		input_set_abs_params(joy->input, axes[i].code,
815b74328f141f Dmitry Torokhov 2024-06-09  189  				     range[0], range[1], fuzz, flat);
2c2b364fddd551 Artur Rojek     2020-09-28  190  	}
2c2b364fddd551 Artur Rojek     2020-09-28  191  
2c2b364fddd551 Artur Rojek     2020-09-28  192  	return 0;
2c2b364fddd551 Artur Rojek     2020-09-28  193  
2c2b364fddd551 Artur Rojek     2020-09-28  194  err_fwnode_put:
2c2b364fddd551 Artur Rojek     2020-09-28  195  	fwnode_handle_put(child);
2c2b364fddd551 Artur Rojek     2020-09-28  196  	return error;
2c2b364fddd551 Artur Rojek     2020-09-28  197  }
2c2b364fddd551 Artur Rojek     2020-09-28  198  
815b74328f141f Dmitry Torokhov 2024-06-09  199  
815b74328f141f Dmitry Torokhov 2024-06-09  200  /*
815b74328f141f Dmitry Torokhov 2024-06-09  201   * Count how many channels we got. NULL terminated.
815b74328f141f Dmitry Torokhov 2024-06-09  202   * Do not check the storage size if using polling.
815b74328f141f Dmitry Torokhov 2024-06-09  203   */
815b74328f141f Dmitry Torokhov 2024-06-09  204  static int adc_joystick_count_channels(struct device *dev,
815b74328f141f Dmitry Torokhov 2024-06-09  205  				       const struct iio_channel *chans,
815b74328f141f Dmitry Torokhov 2024-06-09  206  				       bool polled,
815b74328f141f Dmitry Torokhov 2024-06-09  207  				       unsigned int *num_chans)
815b74328f141f Dmitry Torokhov 2024-06-09  208  {
815b74328f141f Dmitry Torokhov 2024-06-09  209  	int bits;
815b74328f141f Dmitry Torokhov 2024-06-09  210  	int i;
815b74328f141f Dmitry Torokhov 2024-06-09  211  
815b74328f141f Dmitry Torokhov 2024-06-09  212  	for (i = 0; chans[i].indio_dev; i++) {
815b74328f141f Dmitry Torokhov 2024-06-09  213  		if (polled)
815b74328f141f Dmitry Torokhov 2024-06-09  214  			continue;
815b74328f141f Dmitry Torokhov 2024-06-09  215  		bits = chans[i].channel->scan_type.storagebits;
815b74328f141f Dmitry Torokhov 2024-06-09  216  		if (!bits || bits > 16) {
815b74328f141f Dmitry Torokhov 2024-06-09  217  			dev_err(dev, "Unsupported channel storage size\n");
815b74328f141f Dmitry Torokhov 2024-06-09  218  			return -EINVAL;
815b74328f141f Dmitry Torokhov 2024-06-09  219  		}
815b74328f141f Dmitry Torokhov 2024-06-09  220  		if (bits != chans[0].channel->scan_type.storagebits) {
815b74328f141f Dmitry Torokhov 2024-06-09  221  			dev_err(dev, "Channels must have equal storage size\n");
815b74328f141f Dmitry Torokhov 2024-06-09  222  			return -EINVAL;
815b74328f141f Dmitry Torokhov 2024-06-09  223  		}
815b74328f141f Dmitry Torokhov 2024-06-09  224  	}
815b74328f141f Dmitry Torokhov 2024-06-09  225  
815b74328f141f Dmitry Torokhov 2024-06-09  226  	return i;
815b74328f141f Dmitry Torokhov 2024-06-09  227  }
815b74328f141f Dmitry Torokhov 2024-06-09  228  
2c2b364fddd551 Artur Rojek     2020-09-28  229  static int adc_joystick_probe(struct platform_device *pdev)
2c2b364fddd551 Artur Rojek     2020-09-28  230  {
2c2b364fddd551 Artur Rojek     2020-09-28  231  	struct device *dev = &pdev->dev;
815b74328f141f Dmitry Torokhov 2024-06-09  232  	struct iio_channel *chans;
2c2b364fddd551 Artur Rojek     2020-09-28  233  	struct adc_joystick *joy;
2c2b364fddd551 Artur Rojek     2020-09-28  234  	struct input_dev *input;
815b74328f141f Dmitry Torokhov 2024-06-09  235  	unsigned int poll_interval = 0;
815b74328f141f Dmitry Torokhov 2024-06-09  236  	unsigned int num_chans;
2c2b364fddd551 Artur Rojek     2020-09-28  237  	int error;
2c2b364fddd551 Artur Rojek     2020-09-28  238  
815b74328f141f Dmitry Torokhov 2024-06-09  239  	chans = devm_iio_channel_get_all(dev);
815b74328f141f Dmitry Torokhov 2024-06-09  240  	if (IS_ERR(chans)) {
2c2b364fddd551 Artur Rojek     2020-09-28 @241  		error = PTR_ERR(joy->chans);

s/joy->chans/chans/

2c2b364fddd551 Artur Rojek     2020-09-28  242  		if (error != -EPROBE_DEFER)
2c2b364fddd551 Artur Rojek     2020-09-28  243  			dev_err(dev, "Unable to get IIO channels");
2c2b364fddd551 Artur Rojek     2020-09-28  244  		return error;
2c2b364fddd551 Artur Rojek     2020-09-28  245  	}
2c2b364fddd551 Artur Rojek     2020-09-28  246  
24c06e000e8fa2 Chris Morgan    2022-08-16  247  	error = device_property_read_u32(dev, "poll-interval", &poll_interval);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

