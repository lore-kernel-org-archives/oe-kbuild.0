Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D26158D6A
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jul 2024 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722266911; cv=none; b=KVRXUie3w1vKWzEsvFk7psaZRMILuH2awHWBGKb9p6433D/If54Gd2WcPFbMp7JM9AcXZyXpAxirQIxXacrcf1wiytCJnHVFL+3RLUSc0hjdQR9krzpuwRuS/LsWHA2Sp4FpEMRDlkQnr3bI6kAj9So8PQVIy5o5n11ZVuWXmPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722266911; c=relaxed/simple;
	bh=2VdueXarTxYaEFkEX0WeN1UrxcchMky9c16EYjnuL+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MIyBHND5ICchILRQrO2Z2+q3zcqKgSnm3+z/SnjWduEja+SYEIToo1km7OKv5xZk+wb4z8wXM+svFcmW0F+ryzbNVC2PeIbLg/IqRdzB9DFU3W/TmBTh4OcRpsKMLJv0YgeW16wc5C77bdctk/Yexr+XOyw5/C2arEO9fbcWxWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YnHzPbS5; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YnHzPbS5"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5d5af7ae388so1628900eaf.0
        for <oe-kbuild@lists.linux.dev>; Mon, 29 Jul 2024 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722266908; x=1722871708; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qOQyuNMTZUfyqAbsLwySAm5kqczSgpJeWoIZn9UUJg=;
        b=YnHzPbS5FbVAkk3nJZSUfJh0CjwaMWgIOtuKxMu3SSGc5RtiMT/s/PxW4mibxFhoke
         aDd060cdMFWbrefjdWQSq8w1CcjlYiUEBdko6RgJkh4a5+A6US0a+4cZbl8izXXvDjG8
         LM7zgRKqfkbLjLEYpXYK/kUejs/3u4cTddBd5+T61vxHHmnbriIt7vHnOePaImIzQWFz
         DwrjOIPUyGlKeaLUy8IA71+Xn91zuKeLcjGdx+hj7YIDn0s3jV4ifvlWc4A8w8R26ZPx
         DgpTd7doy2F8OFdFxATgsGOc6jH6SCEO94W+L13ciYaoY4QvA3r5SxOv1pOQtsb08YCp
         fpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722266908; x=1722871708;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qOQyuNMTZUfyqAbsLwySAm5kqczSgpJeWoIZn9UUJg=;
        b=jobSVEevkXFbnR5ytEAzzBq7i506UvjYf/RLP4Y7M1RQqLvclUa2QPEvY+mqLdWV59
         mM4ZM+cBsnMSRu3UiaV3tF69oRfdVWnJCSHlk54LRh6D19LHjpLZ5twqunqH8LezJTcM
         w85fEtJhZdlWQ0CZPwrsuSlikF75I4FDaa23y/hsGN6kRn9+14v2hPpaw/ywzdB3BaHn
         6SdDMwyMRliMhDVt/onIvBBDpcICPtkFuW8oXm4hrIKpXxVw4el1d+F2mS3mSNVSyvg6
         sWkTvtwELdXCJlPQtLGSOW4gocro+wyuWmO4hvWJgocULJvR7sH8lZHcd5GH6YpgVLLY
         UM7Q==
X-Gm-Message-State: AOJu0Yya2A69POT+18L8Y5d4WkQQA8ICtlh9mr2DNqGRQke9RW2tJxVE
	g3Ib09bC+lpIn8MPX1EvtFwNITp+FCs44qsMsdgXf3q7Bv1rH1RWb23sm4hSb6QbNmectdz3dQ5
	FqQA=
X-Google-Smtp-Source: AGHT+IFgMh59C0XIlRKMyr8wkfMpGdx8PqeQNsD/YBhsvAs4P5UXJrO02yYCLrR7pKKTwqKAlx2f4Q==
X-Received: by 2002:a05:6870:d1ca:b0:254:a218:89e6 with SMTP id 586e51a60fabf-267d67046e1mr3886279fac.23.1722266908048;
        Mon, 29 Jul 2024 08:28:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7093050a3d0sm2136596a34.14.2024.07.29.08.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:28:27 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:28:21 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, wangshuaijie@awinic.com, jic23@kernel.org,
	lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, waqar.hameed@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, wangshuaijie@awinic.com,
	liweilei@awinic.com, kangjiajun@awinic.com
Subject: Re: [PATCH V5 2/2] iio: proximity: aw9610x: Add support for aw9610x
 proximity sensor
Message-ID: <7227ddbf-a851-4997-83ba-b8f8c0fcc722@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726061312.1371450-3-wangshuaijie@awinic.com>

Hi,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-iio-aw9610x-Add-bindings-for-aw9610x-sensor/20240726-141450
base:   1722389b0d863056d78287a120a1d6cadb8d4f7b
patch link:    https://lore.kernel.org/r/20240726061312.1371450-3-wangshuaijie%40awinic.com
patch subject: [PATCH V5 2/2] iio: proximity: aw9610x: Add support for aw9610x proximity sensor
config: x86_64-randconfig-r071-20240728 (https://download.01.org/0day-ci/archive/20240728/202407282339.D0ICTGHF-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407282339.D0ICTGHF-lkp@intel.com/

smatch warnings:
drivers/iio/proximity/aw9610x.c:575 aw9610x_read_chipid() error: uninitialized symbol 'reg_val'.

vim +/reg_val +575 drivers/iio/proximity/aw9610x.c

1e0a5bf0d81329 shuaijie wang 2024-07-26  558  static int aw9610x_read_chipid(struct aw9610x *aw9610x)
1e0a5bf0d81329 shuaijie wang 2024-07-26  559  {
1e0a5bf0d81329 shuaijie wang 2024-07-26  560  	unsigned char cnt = 0;
1e0a5bf0d81329 shuaijie wang 2024-07-26  561  	u32 reg_val;
1e0a5bf0d81329 shuaijie wang 2024-07-26  562  	int ret;
1e0a5bf0d81329 shuaijie wang 2024-07-26  563  
1e0a5bf0d81329 shuaijie wang 2024-07-26  564  	while (cnt < AW_READ_CHIPID_RETRIES) {

if cnt == AW_READ_CHIPID_RETRIES then reg_value is uninitialized

1e0a5bf0d81329 shuaijie wang 2024-07-26  565  		ret = aw9610x_i2c_read(aw9610x, REG_CHIPID, &reg_val);
1e0a5bf0d81329 shuaijie wang 2024-07-26  566  		if (ret < 0) {
1e0a5bf0d81329 shuaijie wang 2024-07-26  567  			cnt++;
1e0a5bf0d81329 shuaijie wang 2024-07-26  568  			usleep_range(2000, 3000);
1e0a5bf0d81329 shuaijie wang 2024-07-26  569  		} else {
1e0a5bf0d81329 shuaijie wang 2024-07-26  570  			reg_val = FIELD_GET(AW9610X_CHIPID_MASK, reg_val);
1e0a5bf0d81329 shuaijie wang 2024-07-26  571  			break;
1e0a5bf0d81329 shuaijie wang 2024-07-26  572  		}
1e0a5bf0d81329 shuaijie wang 2024-07-26  573  	}
1e0a5bf0d81329 shuaijie wang 2024-07-26  574  
1e0a5bf0d81329 shuaijie wang 2024-07-26 @575  	if (reg_val == AW9610X_CHIP_ID)
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
It's harmless but the checker is correct to warn

1e0a5bf0d81329 shuaijie wang 2024-07-26  576  		return 0;
1e0a5bf0d81329 shuaijie wang 2024-07-26  577  
1e0a5bf0d81329 shuaijie wang 2024-07-26  578  	return -EINVAL;
1e0a5bf0d81329 shuaijie wang 2024-07-26  579  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

