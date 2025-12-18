Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3214632ED47
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 07:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042380; cv=none; b=oiGQeWSj+MTrlP0HZ5iN6QeoFMScfdjZsR8bFZJTzoLf/LH4/Q6Himr4Td+NVvEsQy3ZjSqoiT8oJLxZ/Uxhtl3qhY8q2wY4R66Lh4TdLA04drqIH6sK2XPxIj1HEV8wba40nJqi9JsYLp3lTn3b4wb09HGJO5HMZCfvHMoXC3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042380; c=relaxed/simple;
	bh=2XAZN4yfY+YxnTEtRiXRky2l9hu9s+c9ZZ5klJhe86k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIBNgKWynDWqxSsSDU9YrhnIWcaNmyroiUWbkAop7SJrcOcCJNMjjMM7PK+39Glf17QiU+WXusyveqA/AHrZvlxkTrEhPfs+kogU+hRS84NOheRzIysFxr6gNUMr242qdf207AhSwtzDN3hoefRMagZuQY2AclWVgIjtgAHbHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=reJouNt5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="reJouNt5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso2491945e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 23:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766042376; x=1766647176; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgDX8RRTzLlxHeg4crYid4bpMw6ddH0fqfjWnakhqlo=;
        b=reJouNt5kFOEiuU3U5M7c6Ngo6LqDUmsGAdauioTF7u1VKvpjEd9pSxKXMrOxivh2R
         GZr+IMTD5wkuekvty9t7TtcEHZaongDrTu4s31yZgQ6Pk/kw7EA/MzG52FSFBzurM0F8
         gJr8Ljo8TumI6gYyKMFrnjr7D73y3PZekrW/YzhsN8tCpa9zlbMAb44pMK30mlqLdNLZ
         43fO8NjY7m8PQEQSFz12kZY3TJFaqmm5ZEOdYQdZ+AhUBGApD194Ap4IMXsL4luCH6vp
         8ASy8AFdDrZOF9PXauoFYaW7mulTJscw3vL0HeNIFTkE7rnm/gwp0zDVyh0DijnDCbUZ
         Vf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766042376; x=1766647176;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgDX8RRTzLlxHeg4crYid4bpMw6ddH0fqfjWnakhqlo=;
        b=opLV7Crv9IZjutw6L+JhRClj0vU43NMUpj4k7JYEfbsjppzsyIvfNFn7i5iR2l9y3P
         oppaSEDDCwrTQE4pl9uxcD79PUfEZSgZh9PU8YYGML6HVu0b+euDysXDj8h2wNOzfZBH
         K1x3bwEnmJ6Ia0cSqBGrUVNUegkhixLe1uWJ26R8YYrZHupOaIg6H5Qp54g6PoqO9fcV
         2CRr3RT73pYyuY+pO9akdnaFfv48gSPYJe9LZKh9SqZtPOKX2LyeUuvDJKsjImlZR+Fh
         jDGy9biiLV/0syF3VceiOhAtmQ36PI5KkkpCNG4GfZkdpuFhbfXE8O2JTNVS/TU/3T0T
         99HQ==
X-Gm-Message-State: AOJu0YxOpvuPCyXWEO1svG2dcnhY+4LO6ecQ+o2Mpylndkg7F1QEoeXi
	jxVnBb7x2TEMkAC1ygAydTyrEvRoU2j85PbUzZ+PqtUqA5NPS/yAm6euQBYYFO8v+RHn32dO/T+
	YuvNy
X-Gm-Gg: AY/fxX6Hk4pmkM3DEFoeAZ7+Hb/TA5eEmSqgmDzP1WmwaZyf1GI1smWRlQJQIzuVuYA
	sI7CAS4adaAkDXQk23YbVn254cfVJ7crv2QSE+HkRa6zu00HhCUcXiQr9iudHBzUqPECJbWacJT
	gApNHW/3I91MoZ8EbgvM60Qagkzo137cUEdA7XbNmCJtjl7GGbOjQLoM4yUfoWNr1UTi9RNbCFk
	jqq0HBVIHfSmYPkU67Goxs8PVRvx1BLdBmI0L9i16O4WHj+9MNFCpQ0uKz48julbqYoIOBTgNjC
	8GZPVfF0dE3YKgRJ/4/Kbuod8i7K28wjgBbNlhNzbxJyzXX/LU1vb554nFsUvfTzcMpPK0VBwKg
	yAABjVzIhJTdX4j3ZLv4aU3CqftahVw7xp3tvOaSNOenhMVQ5s1JF2jaQlT/3bgt8UKPBSz5DDo
	5UOfhsCDQm1iIAGjAS
X-Google-Smtp-Source: AGHT+IGwbf7mQ1WdrnPH46HyySiH44r9KZkX+tyRiOr/VP6+a5FY5gNWMsktIsul821W7jrPcYjxPQ==
X-Received: by 2002:a05:600c:3b84:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-47a8f89babcmr220630665e9.3.1766042375908;
        Wed, 17 Dec 2025 23:19:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3278439sm24779915e9.13.2025.12.17.23.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:19:35 -0800 (PST)
Date: Thu, 18 Dec 2025 10:19:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can
 'dev_data' even be NULL?
Message-ID: <202512181322.nBkDZbGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251218071932.REbCGXbmqQNQb8cVqEEcB8uJe2wiTuLqlxV20rA-e4E@z>

Hi Herbert,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 35c5097f737a164b3afe23d07698db95061f0db8 crypto: ti - Enable compile testing for dthev2
config: s390-randconfig-r071-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181322.nBkDZbGb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512181322.nBkDZbGb-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can 'dev_data' even be NULL?

vim +/dev_data +44 drivers/crypto/ti/dthev2-common.c

52f641bc63a4665 T Pratham 2025-08-20  35  struct dthe_data *dthe_get_dev(struct dthe_tfm_ctx *ctx)
52f641bc63a4665 T Pratham 2025-08-20  36  {
52f641bc63a4665 T Pratham 2025-08-20  37  	struct dthe_data *dev_data;
52f641bc63a4665 T Pratham 2025-08-20  38  
52f641bc63a4665 T Pratham 2025-08-20  39  	if (ctx->dev_data)
52f641bc63a4665 T Pratham 2025-08-20  40  		return ctx->dev_data;
52f641bc63a4665 T Pratham 2025-08-20  41  
52f641bc63a4665 T Pratham 2025-08-20  42  	spin_lock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  43  	dev_data = list_first_entry(&dthe_dev_list.dev_list, struct dthe_data, list);
52f641bc63a4665 T Pratham 2025-08-20 @44  	if (dev_data)
52f641bc63a4665 T Pratham 2025-08-20  45  		list_move_tail(&dev_data->list, &dthe_dev_list.dev_list);

dev_data can't be NULL.  Probably this should use list_first_entry_or_null()

52f641bc63a4665 T Pratham 2025-08-20  46  	spin_unlock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  47  
52f641bc63a4665 T Pratham 2025-08-20  48  	return dev_data;
52f641bc63a4665 T Pratham 2025-08-20  49  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

