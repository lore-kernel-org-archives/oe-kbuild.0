Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F083148849
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 08:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251493; cv=none; b=EIPI7R1OLt2kgZblcsIPQRtcTTsBZ7lpIPnsR7ypVrgOyO1Mbg6jsBqdnYXgOZ5GvIaPyjtl8STVEAWVzB90tDHUcbswXx3Vvt/3Yn7U1Qm7TntpxBAEPqoEBKw1fZMcRakUioaSFC6JIP9gjKVPlDWGAquIrT5Yse1926On1BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251493; c=relaxed/simple;
	bh=WhQWABjNyyuQ+LGEy3E3HCx8hqIfIoTo+cFgH0oKjJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ClPKhkN6Z1LLUKFF03syRUNvck11uRP9fi9KnjzIay4zpyzrMUNnqYxRafmUkWluCyOyrIP7KksRIHWdf2xGoQZbXT0eJ5iCfhXbcrfokE413GrGF9qzo4Ey5t8UsX6RnW5psfjA5r7gRl7d6UlUZ8zvZtROtvESkNMnkNl8HFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYzH4ivB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYzH4ivB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so52380235e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727251489; x=1727856289; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x69ZvGgafnxxztweYHeelEL1BFimekU4jsu1BE7fwow=;
        b=EYzH4ivBxx2pbbdBUY1vH33m4xP5RnO3H+OUn/UFHSDSZJ0y/lUHHjralgOpcJRQeV
         jvrYzb6iTTVXC37bxD/UuJu4IQ1wLNTeTw3jjFhTscFPipFRyDTlHRQK/zPy3WZnnl64
         zS5if4K/MKKHVBMcAG35GFshEBSNWm/1ikafZWW58ZxkllOcG3BmFqAGVHMWzv4oqasa
         1bkicXIFOzYHp1p37lEmgpBZzGKE72hpT8GOE65IHp1UE9pl0F6q2aKGMQjwTAvE/Eq+
         V5ZGpdlc9vNVXpT/Je76Ipo1GAFctVhf0w/ve7NCWsYkcF2jN1KL6cpjTDzIq/iz9c07
         u3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251489; x=1727856289;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x69ZvGgafnxxztweYHeelEL1BFimekU4jsu1BE7fwow=;
        b=oCcQBmh/IgCr/5Edpsus0QO4hlnOvdVGNhFeqMGA302rnh+WfpScq1nlpPbCl1iqmp
         RouT2VFLL/Y2RaAZvd29yRWuizEblisOXmBWvJEpvlujgvmSL3iR1uC5+RaVTbNmzo1p
         4+BPzJiomdTmaqQtkO0x3HL3/h6L75DXVxYlYI026ljJx6RCwkkx/nQxi8u2B0XYV+1e
         /scVv9kda/AsPZgYAh7s8j8BTsGpgS4UA/+Jl0Qsq27uPDK1T2Mrk7CSsDV2PXgmPL6s
         1yxutGZ3rD1cyQWIVKdpDK3KkPhMaYT74vv/rTVEbAXcmUlzpZwCqZWYbHzz2jeut2SI
         6yZg==
X-Gm-Message-State: AOJu0Yy49bRbB9rjKx3zDR/L38UgR3kaE55uVL6eqiFaekgYmO//0k8P
	HRTC8BOmLSLbwLjExy2ztmhIfW4GY9vevEPlVNJqQMj9NcQRkEw5PO6l1Eer7dS3lq5u0tf1Bs0
	u
X-Google-Smtp-Source: AGHT+IEtVH9oHtfPGO/6+1DLBUdNsXdqpgtgGG8hb/oVeeV7JVSpXS3jY0P5FYgDBzGMiYrrjloJTQ==
X-Received: by 2002:a5d:4350:0:b0:374:ca43:cda5 with SMTP id ffacd0b85a97d-37cc22d3e8amr952225f8f.0.1727251488747;
        Wed, 25 Sep 2024 01:04:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2f9734sm3305047f8f.76.2024.09.25.01.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:04:47 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:04:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Meng Wei <wei.meng@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Pan, Kris" <kris.pan@intel.com>, Chang Ying <ying.chang@intel.com>
Subject: [intel-lts:4.19/android_s 677/30000]
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1098 put_v4l2_subdev_routing()
 warn: check for integer overflow 'num_routes'
Message-ID: <1fbc1d2e-f00f-46f2-84c3-4f362e211d1f@stanley.mountain>
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
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240920/202409201214.doUEuMvs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409201214.doUEuMvs-lkp@intel.com/

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
                                                             ^^^^^^^^^^
num_routes comes from the user

dcdab0d72b69b6 Meng Wei 2018-10-26  1092  	    assign_in_user(&up->num_routes, &kp->num_routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1093  	    !access_ok(VERIFY_WRITE, up->reserved, sizeof(*up->reserved)))
dcdab0d72b69b6 Meng Wei 2018-10-26  1094  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1095  
dcdab0d72b69b6 Meng Wei 2018-10-26  1096  	uroutes = compat_ptr(p);
dcdab0d72b69b6 Meng Wei 2018-10-26  1097  
dcdab0d72b69b6 Meng Wei 2018-10-26 @1098  	if (!access_ok(VERIFY_WRITE, uroutes,
dcdab0d72b69b6 Meng Wei 2018-10-26  1099  		       num_routes * sizeof(*kp->routes)))
                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This can overflow on 32bit systems so it checks less than intended.  Generally,
integer overflows in access_ok() are treated as bugs without further analysis to
see if it can actually be exploited.

dcdab0d72b69b6 Meng Wei 2018-10-26  1100  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1101  
dcdab0d72b69b6 Meng Wei 2018-10-26  1102  	return 0;
dcdab0d72b69b6 Meng Wei 2018-10-26  1103  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

