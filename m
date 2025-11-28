Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C231528DB56
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 06:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764310562; cv=none; b=hUbzMwM2qRHM8tnDm8Yuw+p4PxZy/+kSeuGIPN+5LCxKO6Bi0jolHp3Esn6nlt9AbR5q50SOlxtgsZ4isomMuI4su3bNkl68zyRrXdPDDwm1oQGNQvm6EXwPKFl3B75mNw9LK8RgTcWohy0CiJ/Mq2aXopeRA+/UaGal6OO5h4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764310562; c=relaxed/simple;
	bh=ffhTyij1ReNQCxTshYxvVfuBAAWHI7lGZdQHx3iN9O4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=awO6qj84ouX4Um0Y9oU4lQPPpyh1MTQUNF7i8J0eVRLA8JopPuwwq6FNw4utt7STwEfp/nfuVLbe+HH8LF5Edsl4x7lrj8sYAylC4meDwaX6DVUJzB9OABUu5G2P08byt39/6iXmDwfR13rctkCFH8DWWvhvIlGRwT6q8BI28Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3uHuvIu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3uHuvIu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47796a837c7so9329525e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 22:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764310559; x=1764915359; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GzOlZeoUbK5GrmA6UDcAo/pAL66N5+Wh7nDV2nIjmh4=;
        b=k3uHuvIutdL4qU0XPjswJl5cwmJ0qj2XRxeWScGWEINTqm6UxhYYku7T5+cyXfBSJz
         mrmkPrVjqvX6/TGvnjaWcQehs0yd9xbxmHkdQmsFdSjRXewQY1CmK/EDhbvlzm860P1v
         7O4C2o+edHFqHoiHIbU+ZPnk0V99+yB4MAX1kx2YXMACgt3YJThPWPE14nMUtdSBhLrH
         Dayxu+CW1/kttwTl+8G604H+kLgwJhBMySmv1qpVV7cDPc6/haUs7d/sUsFamKmf7k5J
         9acbGzMGgq4t6iUzyoxsUH7VjNqTeIbv/5nFeL58106YcPdRSxFgX+VlQmEoxyZ9F0vw
         7UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310559; x=1764915359;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzOlZeoUbK5GrmA6UDcAo/pAL66N5+Wh7nDV2nIjmh4=;
        b=GW34HEhsVXW2uolxEHDgHciFE0RLT85eijN0l88yk/5CU+4ndbKYdKlqzCTQjRLogU
         1a+xi3a5iWcnkEBF+bnKSotJPNkr1vPByRJ9INz4oYZZ1sTy/VfTjYFEzlWZVGAMqYwu
         kCx2raKmDM0QapBI5RbxZSu2zIjdEIvdADPW2+UiUBfzwf4zuWjuIQV/X8UnMl3cpuDY
         h7P3mt9qA17OzS41mkuJpZogMOsVPOFQ8PeqdWCcJ0x5BwyDB3zyllpt0MjX8yut+YXC
         UBvmcCCTcgXUJk1g8uuIZH5hdDgheCUD/LzNn04rYuiuZ7xlDRHcVB02d4JFqDEqqTL9
         Pi5Q==
X-Gm-Message-State: AOJu0YysdsbhZQqIb1VRiZMR9UkqrPovIJc1BdHQLXYk5xhhNiRR5yef
	JkxH56FdyCBqK6g8953g1KDBl8uDwQnleMHqyqppKPXUXYVnCDGQUFDxy3yPGS57YA1blIm3Fxu
	rFYvQ
X-Gm-Gg: ASbGncsBhZ3vUgJcMJeRUyyLAFDKruD1rjNjYC1Z0FfukGm8L71Yc5zwDeF0KRcxk77
	JORzuIn+kFhWkre1INByql5o3lx/7x/2tzJG5XIK9kqSV83Fgy3n5KPam1IxulkJavxhO+H5+lM
	s5i+y+/J5/USAOK8OuTqJKZLuyKHnL3QIJgiFqa4yOpWVSyDP0Pc/m/Kg7+PJYvBOq+pJrqqMvZ
	GoVBIVrknsBdTm/qF4TVMADYk20UsHeuY3gbOVsgAASvWjUWpms/2gze3iZBYnbmTxQ3ZMPza0j
	4dMHam7m6vHHZVr02Alfm1sJic0ODXo5sxQdU+hSuAoMAjzXysEPVnFkXnu6QYEKgqWTN1I/mym
	+hL/nO5OqiHZ/VVPinngQdD0mTfz96pFzVBhIFgHGARBSB36GbRCF0y90pY/dB8cHSfIYlW1Xn1
	jK+iMTI7Zn8TRvk7Di
X-Google-Smtp-Source: AGHT+IFdIuL1+ag2sXfLUM/g00Zb6LkyXzXLVWwOpnWTkJoN0WxuvEW4Ox+Z1MnircVKNp0kAljDVQ==
X-Received: by 2002:a05:600c:1c85:b0:471:9da:524c with SMTP id 5b1f17b1804b1-477c016eab5mr306888745e9.12.1764310558915;
        Thu, 27 Nov 2025 22:15:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479040d81e4sm88057735e9.3.2025.11.27.22.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:15:58 -0800 (PST)
Date: Fri, 28 Nov 2025 09:15:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Keith Busch <kbusch@meta.com>,
	dm-devel@lists.linux.dev, linux-block@vger.kernel.org,
	snitzer@kernel.org, hch@lst.de, axboe@kernel.dk,
	ebiggers@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCHv2 3/3] dm-crypt: dynamic scatterlist for many segments
Message-ID: <202511281018.FNOzcP4r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124170903.3931792-4-kbusch@meta.com>
Message-ID: <20251128061554.NmosvZfYbo5vthRMqpBwame7hh2Utq5dasgYHBw37RI@z>

Hi Keith,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-remove-stacking-default-dma_alignment/20251125-051340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20251124170903.3931792-4-kbusch%40meta.com
patch subject: [PATCHv2 3/3] dm-crypt: dynamic scatterlist for many segments
config: i386-randconfig-141-20251127 (https://download.01.org/0day-ci/archive/20251128/202511281018.FNOzcP4r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511281018.FNOzcP4r-lkp@intel.com/

New smatch warnings:
drivers/md/dm-crypt.c:1510 crypt_convert_block_skcipher() warn: was || intended here instead of &&?

vim +1510 drivers/md/dm-crypt.c

8f0009a225171c Milan Broz        2017-03-16  1499  	skcipher_request_set_crypt(req, sg_in, sg_out, cc->sector_size, iv);
3a7f6c990ad04e Milan Broz        2008-02-08  1500  
3a7f6c990ad04e Milan Broz        2008-02-08  1501  	if (bio_data_dir(ctx->bio_in) == WRITE)
bbdb23b5d69521 Herbert Xu        2016-01-24  1502  		r = crypto_skcipher_encrypt(req);
3a7f6c990ad04e Milan Broz        2008-02-08  1503  	else
bbdb23b5d69521 Herbert Xu        2016-01-24  1504  		r = crypto_skcipher_decrypt(req);
3a7f6c990ad04e Milan Broz        2008-02-08  1505  
2dc5327d3acb33 Milan Broz        2011-01-13  1506  	if (!r && cc->iv_gen_ops && cc->iv_gen_ops->post)
ef43aa38063a6b Milan Broz        2017-01-04  1507  		r = cc->iv_gen_ops->post(cc, org_iv, dmreq);
ef43aa38063a6b Milan Broz        2017-01-04  1508  
02664d2ac0d3cf Keith Busch       2025-11-24  1509  out:
02664d2ac0d3cf Keith Busch       2025-11-24 @1510  	if (r == -EINPROGRESS && r == -EBUSY) {
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Presumably || was intended as the warning suggests since it can't be
both.

02664d2ac0d3cf Keith Busch       2025-11-24  1511  		kfree(dmreq->__sg_in);
02664d2ac0d3cf Keith Busch       2025-11-24  1512  		kfree(dmreq->__sg_out);
02664d2ac0d3cf Keith Busch       2025-11-24  1513  		dmreq->__sg_in = NULL;
02664d2ac0d3cf Keith Busch       2025-11-24  1514  		dmreq->__sg_out = NULL;
02664d2ac0d3cf Keith Busch       2025-11-24  1515  	}
3a7f6c990ad04e Milan Broz        2008-02-08  1516  	return r;
01482b7671d014 Milan Broz        2008-02-08  1517  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

