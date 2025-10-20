Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F02DF154
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944410; cv=none; b=GPEdDGNpTd3JQvgHsOvc39pGSr0XNist4Ei9o/AczyejYOKZep6OePzbLuUdkS7XoBIfDn1icRPtCxHQeDB45bK9pqvZCYNIkqhDrsYZoXqV7cBVFB/YelsWWS+AUCjrtH5t6eMYSTdbHd7MCk4AeqI6klz0REJ+e48h/rvqviU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944410; c=relaxed/simple;
	bh=PeGTn3iFxDHG7Zzquzk+8Eb8iZsO1eg0YMwOWsI8x/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RijNPfjJ/y1Z1irtP9Zls1StBL8+uaYVc0WdZvPPy1pve33J4/guX5jNLsPUQ1jo+0NMlvZ8hleWLhecmtuPeLB5w7tTy4SBAmXG17Bomxg649kF59jL+W3lURfrYs+VjH4jujdXexQ+O1UFNOHOCtzmhgJeZBx+K2G6Zxbfpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yea40z+1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yea40z+1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso3807651f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 00:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760944406; x=1761549206; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v29GrQR+ncc3DZUAcuhlbn2tQqEiegD397LZB82cRuo=;
        b=yea40z+1Ja3bzIKh8+mPpiGH8wtrcDV/VMM6cIDAXGiP5l6f76MyItxzsd4Yx4lZwW
         PRg918kQfoVR8+EdUL9Kuex5uiAMyoIG2Jaucg+tDBIqkLoARp990mc8KKvXlj+b0sE5
         lIRzpxLoHXWy7lo3u7wQXRUAMc19Z9O1Wy9LkJ9eUikMI2wPl0cPMBAo3G0VP3reZhl5
         ngOpO2kboeu9zVgZ1rvVN0iILdS5cOcpkfGDwVyNp/aBV/YejEyjiTfQDHSJHGBK0dC3
         u3fgQ/M7/wMOdKSNO6+PvigjQK7W7PB8Fh7R27uNXqbMQalB7xlYeL0imn0lWvewlqzK
         EoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944406; x=1761549206;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v29GrQR+ncc3DZUAcuhlbn2tQqEiegD397LZB82cRuo=;
        b=Y/azr2i5DC9px6RZ8UwzlTN16pzXxlFuKupVs72UAg1S5HPeuAQb1Ym4aRQ1W0txUh
         haYQ3zduom4sM6FDzaWAY/1KavKUVcFZlFQ3lj4hwlECfA6PbsNQD68yy6rmHu4sWXdq
         k99rD6GRA9Sg4Xd3CyRc63RWEU2ZmyZv7dp+rC6V3Cw4lsHaCnCINMjixby7UOMFNEue
         +c+lUmLXacqCdy+Iq8K6vRo8c1oNKKgblNaJwKbyFRGRQgaJbKWPvEEJGBBg5V0pTAnW
         rBCoYAfUGDTrHPPT4DwW6S5eLkj5MeCI9/SlBvBYYTIx6KJ4QqKFEG2RJNDJq0LA81x0
         bleQ==
X-Gm-Message-State: AOJu0YyHvevDh5UmzqWejDYXb+EZkiR7/IxJ9aSu8O+3GcxlIbDdNI3y
	l0r5Nx6V+Ci9i8QrcLVdfNNPpWsINHSUxo5IYt6KzUHCZovT5IPwOtQo+Mizlgd6I9AobSX16nR
	Wg7Q8
X-Gm-Gg: ASbGnctbDU16PIDm6S1/8Qc+u0mdOD94UwvfPbVJi5s9oVPZhNbWcMncGraiIcUjP7l
	PeR+YiC993Nxnj7DN7cONz36Cz8mpKNAQhJVpUriYdCB/GuI0GEKwrmiKJqJNtkzrCGZud2R7dU
	t6wwCjnYF2eGtN5dp8XKeVOE9uCQvRQ+iXjD2wVtwk5mtD1m+QfS4oklCG8Io9J5/MrtdYQxJ0Y
	KW5HUH9IAxCpdYYdwR4GVbzTzCev3S2djIQN7Kb6zFvaW4DFAqLbGZMR8qE+CRYpvo4o8u03G/i
	0iPcxUsJG6QACtPmguPOcWg1HKDVa0FPYpfy5zr8bF22450ST4RkAVn78pWXGnmpk8+DKDXewLl
	RhOel7P+4bw3nZ+oeXvqXcxnr9/JwYcz0PwZoYHmpcAOHvNhoDAGDECt1WObqUojBKgwPwe2rXA
	vc8BEHn3rFUSQvikKn
X-Google-Smtp-Source: AGHT+IGCWcj+ZeSsBGtAZjJoabbi0svPUJxfv7bQF2wz0Kk+abDltn5J9+7dAFKFJ6moPAKqLR/Rtg==
X-Received: by 2002:a05:6000:25fd:b0:427:587:d9ae with SMTP id ffacd0b85a97d-4270587d9c1mr6413104f8f.9.1760944406004;
        Mon, 20 Oct 2025 00:13:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00b9f71sm13715262f8f.37.2025.10.20.00.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:13:25 -0700 (PDT)
Date: Mon, 20 Oct 2025 10:13:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
Message-ID: <202510201457.uOrhkKly-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019092331.49531-5-professorjonny98@gmail.com>
Message-ID: <20251020071322.cdXPBvJcC6dFc76etKhvsm2I5mLMwLenMFWjDWd1XMs@z>

Hi Jonathan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-Add-virtualcolor-class-dt-bindings-documentation/20251019-172647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251019092331.49531-5-professorjonny98%40gmail.com
patch subject: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
config: parisc-randconfig-r072-20251020 (https://download.01.org/0day-ci/archive/20251020/202510201457.uOrhkKly-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510201457.uOrhkKly-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-group-virtualcolor.c:303 parse_monochromatic_leds() warn: 'mono_count' unsigned <= 0
drivers/leds/rgb/leds-group-virtualcolor.c:303 parse_monochromatic_leds() warn: error code type promoted to positive: 'mono_count'

vim +/mono_count +303 drivers/leds/rgb/leds-group-virtualcolor.c

bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  296  static int parse_monochromatic_leds(struct device *dev, struct device_node *child,
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  297  				    struct virtual_led *vled)
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  298  {
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  299  	u32 mono_count;

This needs to be an int.

bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  300  	int ret, i;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  301  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  302  	mono_count = of_property_count_elems_of_size(child, "leds", sizeof(u32));
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19 @303  	if (mono_count <= 0) {
                                                            ^^^^^^^^^^^^^^^

bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  304  		vled->num_monochromatics = 0;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  305  		return 0;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  306  	}
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  307  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  308  	vled->num_monochromatics = mono_count;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  309  	vled->monochromatics = devm_kcalloc(dev, vled->num_monochromatics,
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  310  					    sizeof(*vled->monochromatics), GFP_KERNEL);
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  311  	if (!vled->monochromatics)
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  312  		return -ENOMEM;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  313  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  314  	for (i = 0; i < vled->num_monochromatics; i++) {
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  315  		struct led_classdev *led_cdev;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  316  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  317  		led_cdev = devm_of_led_get(dev, i);
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  318  		if (IS_ERR(led_cdev)) {
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  319  			ret = PTR_ERR(led_cdev);
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  320  			return dev_err_probe(dev, ret,
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  321  					     "Failed to get monochromatic LED %d\n", i);
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  322  		}
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  323  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  324  		vled->monochromatics[i] = led_cdev;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  325  	}
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  326  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  327  	return 0;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  328  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

