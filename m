Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9342D323D
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042493; cv=none; b=D22G0o9Fcf+vtY8Mc3SqkPO93cNHSgNw7rxpKDdUKxKKlmUoDl9p+kr+vh9dF6eY7jMa2Ej/yoFuZu7rdtfgXpudykmkc40YEuAPgZd+vVdesRuBhS90hPkch78PCoKSXXfwXICA+CSs2VkeS/QBpge0f961Vj+k8vEIrcakXnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042493; c=relaxed/simple;
	bh=fXLtSVk82ESKQOzdshAmeibfIxSRyhMx8s2wTZtSSTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BAgC7M3PPJKEaChOO11HERqsuomlc2bZFQKa7UsdzmQ7bA3oEc5XUa/HZVE6ZbOBlmpJsPnLiA+2jY7LyYTXiQfq1N1avX6N6meJtMh67cFuJ/nljUm5bRS0gRKPZ2NNhS5tOYlNdmwwlTnSTc7WoLBG8Bu6m8MeN5JanrTSnZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bCUyfnYx; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCUyfnYx"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso1788445e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 23:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766042490; x=1766647290; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjftRkgAweItEZkBzFZPCbzdvPthZCUVd118Fzc2bn4=;
        b=bCUyfnYxbHmQeYOXN10RqlLvpn9a3qLfIC31fdH9CjCojGmvBIls+ZCgP3jso+G3A3
         aCTWbZliLp3IW+WozwAVqH/oGFmF991wt/agZot5NfLVtLoW1WWi0XhKL95stuWuSZG6
         wb/6UGEwXn0kXKP4uM/MmJyaLnDjp/AwKE9ZBdGoVDwBEWMvXKI+UdLcmC0wzrYbyL0s
         TSebwFeVDn9jJFagOsDxnPCc8Ras13hjZ6gFc5i5uQHfeb9ovpdkRAjy3vmRP+PhgWs5
         GxJbCG9SxUO58qW+yxxLOOtP5GcaJSx8P8iC4EnUP15Z4whNr7HDFLCUURlfoQsyznog
         RYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766042490; x=1766647290;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjftRkgAweItEZkBzFZPCbzdvPthZCUVd118Fzc2bn4=;
        b=dGZVkx88T5UMWcAQpkvDkVLaCh0epYQKrga2E931scBNNyZ/qYjdt7zwTDz4igZfkR
         TqatH5y7boq9u6yeGydfKlwpye+cJC9w5ZYUeBzVDsoPqw/yoQRJ1N9aWwLn0rARBnp4
         JHxqMMIaxXneO2G6/xv021sAn8TpT1C0xOBhTeQWo2rVU6R4mA4EpNsqGINSSgqeg67+
         wGksPNqXxI4XnrkXOhzzJRbKnqj+990za7zbvmCSKSp3N6SGFkYfhX57rsHxfgn5ECBp
         g584wndm8Zbv0Y9+h7NACOcsN5jLsi/yojRJo2LHeNQQBBFArZ74CjiNgA3qP/j8dHWe
         zhMg==
X-Gm-Message-State: AOJu0YxLlBz4JK7oj6Gm0QQSjgx+mHsRAbH3NnY0n6uvsTgcYaqszpeo
	5UGNiwMNnGKFk/upOfhiaKvFu/zPU0HK02O2q37XV+LrmdIdgDepXuOHUlTLfk8/UDvpR86A+Ko
	ki2rm8iI=
X-Gm-Gg: AY/fxX5YiekJWinijGyDoOu4A6OE0uB902IhCvrGxueQSUriIRYdZX3nHddZkGgoqTd
	zzhCq8NRGIRWwhF7g5oYkirtHH5/86kWna+g2As0AaBfhQSpNvxSIHo2AVE1fD9XFBjzClGlR5T
	jMKxIoCngiroK9AxECOjeejiscqHWHaPscGltE7umTdCllJBsa7GYXcJbviMrLMX9jqel8C/wj4
	pxlb2EmcUeQ3itCRZie1Cnaiik2Z/T7G2w13uC/IG8eG0AWs1x1pHgENlBWGjj18OTnUxl3d8Z2
	M8iPgOOd3T+rJYKf3XGTBEGS3w2osj+7zxHrrch8hWxWIBvEPacdAieRUIz2rZZ5umcBW3EWjOS
	4/o4BoGgjdBOTKFaX1EOT6IaZHFpBpRhGW+KD8LxZoHvRBlGr3dpHX8sJvs2Jx7zv5XEl7N8Wla
	H4ixQYlgWvEZNM8cQb
X-Google-Smtp-Source: AGHT+IG2wYnKF9UcJtAT6tzXqD2LRHXeRY/+PjOkEmoHb+4nvafowC40CKcIOmp6/EX2Aw9ewSX0Kg==
X-Received: by 2002:a05:600c:8115:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-47a8f8a80eemr197952455e9.8.1766042489623;
        Wed, 17 Dec 2025 23:21:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be32832fbsm23362215e9.14.2025.12.17.23.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:21:29 -0800 (PST)
Date: Thu, 18 Dec 2025 10:21:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 14/14]
 drivers/interconnect/debugfs-client.c:121 icc_commit_set() warn: passing
 zero to 'PTR_ERR'
Message-ID: <202512181424.7SYJiB4W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251218072125.SDcoQ7T5dv-HHwRwYRRjhsndyS6NzXT1gnVfsWaWVdo@z>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   8b3c4de1cca2b865619f8662a2f262e499db0e13
commit: 4439db7b8f941e4e418fc4d07e84a2eb31c6f339 [14/14] ANDROID: interconnect: Enable debugfs client
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181424.7SYJiB4W-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512181424.7SYJiB4W-lkp@intel.com/

smatch warnings:
drivers/interconnect/debugfs-client.c:121 icc_commit_set() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +121 drivers/interconnect/debugfs-client.c

770c69f037c18c Mike Tipton 2023-08-07  114  static int icc_commit_set(void *data, u64 val)
770c69f037c18c Mike Tipton 2023-08-07  115  {
770c69f037c18c Mike Tipton 2023-08-07  116  	int ret;
770c69f037c18c Mike Tipton 2023-08-07  117  
770c69f037c18c Mike Tipton 2023-08-07  118  	mutex_lock(&debugfs_lock);
770c69f037c18c Mike Tipton 2023-08-07  119  
770c69f037c18c Mike Tipton 2023-08-07  120  	if (IS_ERR_OR_NULL(cur_path)) {
770c69f037c18c Mike Tipton 2023-08-07 @121  		ret = PTR_ERR(cur_path);
770c69f037c18c Mike Tipton 2023-08-07  122  		goto out;
770c69f037c18c Mike Tipton 2023-08-07  123  	}

Fixed upstream commit 6bfe104fd0f9 ("interconnect: debugfs: Fix
incorrect error handling for NULL path")

770c69f037c18c Mike Tipton 2023-08-07  124  
770c69f037c18c Mike Tipton 2023-08-07  125  	icc_set_tag(cur_path, tag);
770c69f037c18c Mike Tipton 2023-08-07  126  	ret = icc_set_bw(cur_path, avg_bw, peak_bw);
770c69f037c18c Mike Tipton 2023-08-07  127  out:
770c69f037c18c Mike Tipton 2023-08-07  128  	mutex_unlock(&debugfs_lock);
770c69f037c18c Mike Tipton 2023-08-07  129  	return ret;
770c69f037c18c Mike Tipton 2023-08-07  130  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

