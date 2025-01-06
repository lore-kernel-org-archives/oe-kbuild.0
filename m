Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BC51DC1A7
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160554; cv=none; b=LlwX6Ppq7USFij7yDdsxSlHdXrRYMAMJxuodgyNM7xSfU3jgD9xmhQt9Qw68eZbm1JKOaoE740Zq+kjLYvbp/6dZxabmpN1bsisfmG7LDfOXuOj8kv6GXE1tE7dZ9QV4zmuWV+tY9Tj1EvoswQjVnqEONuQ6v4a3g/cZVMAJfjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160554; c=relaxed/simple;
	bh=Fmg3O+y0UOMEell7hEITyWauTP9MGkpFDrnXul1+qag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c0stktUzdax2ZshyWDQIkNE1KFcq1yT61Q1Djtx/EVSff0PLjg8DNakbFRP2AsjjW9tH25PnDtBiT9VNHWYpW47NQ+u7lUkBYqRHnCo+jEA1V0yhl9+jal7h23Qd9hXS1Tdf/EdDhHlL1Vbi5Gf5JXKur1A2Vrt1msSOpW794+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTR2Jhhm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTR2Jhhm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385de9f789cso10687719f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 02:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736160547; x=1736765347; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18zTdvei+C+z1n27ha3TrzKqpapBOD4jxRj8hQjQv/I=;
        b=FTR2Jhhm0ffxiLmEQ3S9kkiOINLKmkVn0+gsJE+4qY5GbJ0oXS7f/rU3HDcCxtRk1o
         IKHY5p4BDKajJrrY40Gc+fZK+6+3/Hv31xf1TaUSsrOPNwXPscrR8L59I25fAhO9Bi1W
         pR/S+z8YY1Gg2+soTGu4S0S2iwydT0YM2AhsMMc4pwizRqPxoHKpm5gQUfXAE9h2Y6Vu
         6fpRhshXFnpqWLJSkzcacIjmw5m1whrAjAsY2pKsLSG/TUHV1gr9k6L5AeDBKeFfn9g4
         o10R5sumBFC/jTsjS6lOQ7H2G3QlmwsLp0jt9WxhUdOFQoZawq6SS1dO/nLA5btwRiz/
         DC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160547; x=1736765347;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18zTdvei+C+z1n27ha3TrzKqpapBOD4jxRj8hQjQv/I=;
        b=D0HEZWHrNjHIiX0UKYRGxxhk0ht6s202k6hBkPGgIRMpuwngL8fDCz/zCrvwGuGg1w
         7qMEm3hmFc1FQUbGuiMr8D5Miu/UGT11PQ3/e+FFWUfc01izCeMClcePqm7fHPmQ1TvI
         MWiYHOu3redmuhpimSeoWOpTP7I3v3V0aNvtsBkIQBeprH62cvYVKeH7af3hyie9aM9b
         CJsV7DFfbTaH7FthCThg3fObFkWwbPYkMycrTb4dgm7ap525EqHLw9aRum/mIGfitvGe
         msm/YCX+cykBD0RXMm0WydWMvGWGS+UpPMYMVn83GTW7qm7Y+n7IzbPHze9jgWBaH5Vv
         3tEw==
X-Gm-Message-State: AOJu0Yw0p3NYZa6xNPXK8WWKw2Yq5k21fM0ErD1gUrD34sawHT7F6dOl
	6Fw9ktioPGIwhMXGlOuq1VkNHL3zxdR0DOA//3BGt7vxoFyPE0GGzUk0xJ9UktZuhG9XlXzcdEo
	U
X-Gm-Gg: ASbGncvsJV8tUpaXLn0pettH1OU/8uVFAX7E/c959UhvmaqPqGyzHBZh8Jo8Uvp/tkZ
	ilFeM9zfEOss2yq9JhUiPLEYInGVUjFMcOf/9DBJyYhHQqmFrTlsW6r2ajzn76hfRg9YNNxOyD8
	f+k7MDMQJwlHQmiuDEm0fFA9vowrB1r6KDAAyul/20iz0eF5x+rY5sQk161t3/lzHO8h0jKZa9o
	PhLTSeCcALYhdizvrQ2l9p+J6qeBMzKYvshmYJnOeG072mULQ5wSHgn1+J3Rw==
X-Google-Smtp-Source: AGHT+IFht10cep3Eo7MHGFs8lr9PvkamZ91U38OrURiF8vH4JbUw7kVQftLsAEx3+H/gi8NideG2Rw==
X-Received: by 2002:a5d:64cf:0:b0:385:e374:be1 with SMTP id ffacd0b85a97d-38a221f63abmr48810027f8f.13.1736160547314;
        Mon, 06 Jan 2025 02:49:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2eesm48277927f8f.80.2025.01.06.02.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:49:06 -0800 (PST)
Date: Mon, 6 Jan 2025 13:49:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 2/2]
 drivers/media/v4l2-core/v4l2-loopback.c:1892 vidioc_dqbuf() error:
 uninitialized symbol 'index'.
Message-ID: <b84af1f6-2be9-42f0-8d49-ad7ea28f1113@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   b244bda01c33df5d583f0e2e6517b2bd7f87eb0e
commit: b244bda01c33df5d583f0e2e6517b2bd7f87eb0e [2/2] media: v4l2-loopback
config: powerpc-randconfig-r071-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290916.2X6x53iM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412290916.2X6x53iM-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-loopback.c:1892 vidioc_dqbuf() error: uninitialized symbol 'index'.
drivers/media/v4l2-core/v4l2-loopback.c:2959 v4l2loopback_control_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +/index +1892 drivers/media/v4l2-core/v4l2-loopback.c

b244bda01c33df Jarkko Sakkinen 2024-11-22  1845  static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
b244bda01c33df Jarkko Sakkinen 2024-11-22  1846  {
b244bda01c33df Jarkko Sakkinen 2024-11-22  1847  	struct v4l2_loopback_device *dev;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1848  	struct v4l2_loopback_opener *opener;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1849  	int index;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1850  	struct v4l2l_buffer *b;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1851  
b244bda01c33df Jarkko Sakkinen 2024-11-22  1852  	dev = v4l2loopback_getdevice(file);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1853  	opener = fh_to_opener(fh);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1854  	if (opener->timeout_image_io) {
b244bda01c33df Jarkko Sakkinen 2024-11-22  1855  		*buf = dev->timeout_image_buffer.buffer;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1856  		return 0;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1857  	}
b244bda01c33df Jarkko Sakkinen 2024-11-22  1858  
b244bda01c33df Jarkko Sakkinen 2024-11-22  1859  	switch (buf->type) {
b244bda01c33df Jarkko Sakkinen 2024-11-22  1860  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
b244bda01c33df Jarkko Sakkinen 2024-11-22  1861  		index = get_capture_buffer(file);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1862  		if (index < 0)
b244bda01c33df Jarkko Sakkinen 2024-11-22  1863  			return index;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1864  		dprintkrw("capture DQBUF pos: %lld index: %d\n",
b244bda01c33df Jarkko Sakkinen 2024-11-22  1865  			  (long long)(opener->read_position - 1), index);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1866  		if (!(dev->buffers[index].buffer.flags &
b244bda01c33df Jarkko Sakkinen 2024-11-22  1867  		      V4L2_BUF_FLAG_MAPPED)) {
b244bda01c33df Jarkko Sakkinen 2024-11-22  1868  			dprintk("trying to return not mapped buf[%d]\n", index);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1869  			return -EINVAL;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1870  		}
b244bda01c33df Jarkko Sakkinen 2024-11-22  1871  		unset_flags(&dev->buffers[index]);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1872  		*buf = dev->buffers[index].buffer;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1873  		dprintkrw(
b244bda01c33df Jarkko Sakkinen 2024-11-22  1874  			"dqbuf(CAPTURE)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
b244bda01c33df Jarkko Sakkinen 2024-11-22  1875  			index, buf->index, buf, buf->type, buf->bytesused,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1876  			buf->length, buf->flags, buf->field,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1877  			(long long)buf->timestamp.tv_sec,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1878  			(long int)buf->timestamp.tv_usec, buf->sequence);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1879  		return 0;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1880  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
b244bda01c33df Jarkko Sakkinen 2024-11-22  1881  		spin_lock_bh(&dev->list_lock);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1882  
b244bda01c33df Jarkko Sakkinen 2024-11-22  1883  		b = list_entry(dev->outbufs_list.prev, struct v4l2l_buffer,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1884  			       list_head);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1885  		list_move_tail(&b->list_head, &dev->outbufs_list);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1886  
b244bda01c33df Jarkko Sakkinen 2024-11-22  1887  		spin_unlock_bh(&dev->list_lock);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1888  		dprintkrw("output DQBUF index: %d\n", b->buffer.index);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1889  		unset_flags(b);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1890  		*buf = b->buffer;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1891  		buf->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
b244bda01c33df Jarkko Sakkinen 2024-11-22 @1892  		dprintkrw(
b244bda01c33df Jarkko Sakkinen 2024-11-22  1893  			"dqbuf(OUTPUT)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
b244bda01c33df Jarkko Sakkinen 2024-11-22  1894  			index, buf->index, buf, buf->type, buf->bytesused,


This should be b->buffer.index instead of index?

b244bda01c33df Jarkko Sakkinen 2024-11-22  1895  			buf->length, buf->flags, buf->field,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1896  			(long long)buf->timestamp.tv_sec,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1897  			(long int)buf->timestamp.tv_usec, buf->sequence);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1898  		return 0;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1899  	default:
b244bda01c33df Jarkko Sakkinen 2024-11-22  1900  		return -EINVAL;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1901  	}
b244bda01c33df Jarkko Sakkinen 2024-11-22  1902  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

