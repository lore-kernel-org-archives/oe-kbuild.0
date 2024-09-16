Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454B24D8C1
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 07:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726472517; cv=none; b=oXRK7v5lmrTxEVgRCXQjAOs6DNBmTTSb090bc05RBhWkEUszSTb0u5EVVbMuOui4+isbx+3MngwBBWL+hY32FqNt/A3ZliLtGo6MQbQEJpKI3udmfCHLEtn4slhqUq4f0GM+nNnwaA9xqmSK6MESk3hzwjrsZt/6xv8ZMc4IzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726472517; c=relaxed/simple;
	bh=WuL7fc3dsUJrzGy++U3w6UI+nK9QBAGR5fSiJTUTGwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7IhNRJopBCdQEAdNBOA9pfPB/SQUsy8ggBzNIuDtV283awMiULrx+b79+IMR+2WerHBi0bOMGWOL1LdJR6ocCBpHnbt/2exAil0L0pqQN64tLOJ4G59W4cwgKhHvZUVLSKfWuGPnb/eC0vZga5wdGpyg9GntQWJEHMVEyUdgao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDod8ggo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDod8ggo"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so511945766b.2
        for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 00:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726472513; x=1727077313; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZS57HTfuqNCpR+j8S0CQPhdJ2cT4uHPD0UI94VxX1s=;
        b=JDod8ggowgaJ8iqLdvj8qmZYIno52ZznRLWVg+FEjP5iSl6SrJ2APhJd+dChpwaOq0
         9O46NChPkGuDxgmgBbKtbUd6lLXjrtAjEjqGHQVxqYQGRGT+M3WL1YcFT0pAg3Z7LiNI
         FQ0Ky2bMFldVPsbKJiGm7ASdY7xphGxXLp6bXMd+3huHY+aqLruGeEB8/uHY7+fvH699
         6SUsC4yuDld4SNQ8CnU0kBa2dldjUyY2gd/olobhunecOhe2zt3Ty2vHcb4Gu8pLjpcL
         pD27JDXrGyTwGSszrop/VRRv8xLkUrERvuT27Rh681h1k1iQBPR7SOy1b0QNAyMhwu7M
         Cj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726472513; x=1727077313;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZS57HTfuqNCpR+j8S0CQPhdJ2cT4uHPD0UI94VxX1s=;
        b=v2nHp4CfpODk/SDtpod37U2kvkFEfystl99DvbVXupMDrNtwfHTIX+yySL8Cpff623
         RfDModT+aQJSugUhBA2Vn+u/N5H9p/4DMisX+kJv/ouIpvCbOvWG+IkMQZtWXKEE+S0r
         gCqEB8PhInDrFsObnY5VJoa2wWBU6Uky5PLfWf7tzg/r6f5C13TwhljQHIEjPOlvrmvQ
         mi2FjmUjnrzqbrBtjAM9qNfmwWXTgxaK54PcJkkH5u2mOyJXJHOrFOG4jqIjQXSmRtgr
         PneEXcmPbpjNDyTqQNwh8rDAIwtKJyS2sSaTlrolDxTW3QwRG/P0iETG/TegyiILGlZU
         JeIQ==
X-Gm-Message-State: AOJu0YyWFUrzNElzxXyXlVaVlv+JF1MGC/JgM96t4mJNowdiVdXMg/P6
	6oFEnC8SCk4hsNF6ipBIOn7jf51Vo20enKhkV1pS1+uwQSjmllKB/yA2/dB2i2LKCJCNBfLy1xY
	B
X-Google-Smtp-Source: AGHT+IH2IjXV5tLpbg5HdvTtKUQ2QaLHwVgTpsT3oW2QM8v5U1x4we3oE+VqW11x3lB9GzSdHkBQBQ==
X-Received: by 2002:a17:907:e26a:b0:a7a:8da1:eb00 with SMTP id a640c23a62f3a-a902941faefmr1333729766b.7.1726472512847;
        Mon, 16 Sep 2024 00:41:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109669fsm274363666b.3.2024.09.16.00.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 00:41:50 -0700 (PDT)
Date: Mon, 16 Sep 2024 10:41:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Meng Wei <wei.meng@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Pan, Kris" <kris.pan@intel.com>, Chang Ying <ying.chang@intel.com>
Subject: [intel-lts:4.19/android_s 677/30000]
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1098 put_v4l2_subdev_routing()
 warn: check for integer overflow 'num_routes'
Message-ID: <904c51ae-9517-44a9-9a60-aaa9490afe1f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: dcdab0d72b69b6291d08483c0baf62cf92e2a1bc [677/30000] v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240916/202409161236.pnGXSCjw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409161236.pnGXSCjw-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1098 put_v4l2_subdev_routing() warn: check for integer overflow 'num_routes'

vim +/num_routes +1098 drivers/media/v4l2-core/v4l2-compat-ioctl32.c

dcdab0d72b69b6 Meng Wei 2018-10-26  1082  static int put_v4l2_subdev_routing(struct v4l2_subdev_routing __user *kp,
dcdab0d72b69b6 Meng Wei 2018-10-26  1083  				   struct v4l2_subdev_routing32 __user *up)
dcdab0d72b69b6 Meng Wei 2018-10-26  1084  {
dcdab0d72b69b6 Meng Wei 2018-10-26  1085  	struct v4l2_subdev_route __user *uroutes;
dcdab0d72b69b6 Meng Wei 2018-10-26  1086  	compat_caddr_t p;
dcdab0d72b69b6 Meng Wei 2018-10-26  1087  	u32 num_routes;
dcdab0d72b69b6 Meng Wei 2018-10-26  1088  
dcdab0d72b69b6 Meng Wei 2018-10-26  1089  	if (!access_ok(VERIFY_WRITE, up, sizeof(*up)) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1090  	    get_user(p, &up->routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1091  	    get_user(num_routes, &kp->num_routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1092  	    assign_in_user(&up->num_routes, &kp->num_routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1093  	    !access_ok(VERIFY_WRITE, up->reserved, sizeof(*up->reserved)))
dcdab0d72b69b6 Meng Wei 2018-10-26  1094  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1095  
dcdab0d72b69b6 Meng Wei 2018-10-26  1096  	uroutes = compat_ptr(p);
dcdab0d72b69b6 Meng Wei 2018-10-26  1097  
dcdab0d72b69b6 Meng Wei 2018-10-26 @1098  	if (!access_ok(VERIFY_WRITE, uroutes,
dcdab0d72b69b6 Meng Wei 2018-10-26  1099  		       num_routes * sizeof(*kp->routes)))
                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This multiplication has an integer overflow bug on 32bit systems.  Just do:

	if (!access_ok(VERIFY_WRITE, uroutes,
		       size_mul(num_routes, sizeof(*kp->routes)))

dcdab0d72b69b6 Meng Wei 2018-10-26  1100  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1101  
dcdab0d72b69b6 Meng Wei 2018-10-26  1102  	return 0;
dcdab0d72b69b6 Meng Wei 2018-10-26  1103  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

