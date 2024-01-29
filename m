Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFAA524D5
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706517926; cv=none; b=N5wrCTa/AeOTpSlgS+RRbfiigWqAbCpb/L9aLeATsanB6VDbZ4PCBODodlKuSV7dB2fwBuwQpECAn2cZOCmRt5N9Cr8zbiudxGyE+WXYrcTdTfk+anq9BiwTIKNNc4CdcA8GVQNIBNfl0IvAeuqmu3ovgo5uO+3MF+/tjftdyvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706517926; c=relaxed/simple;
	bh=E5wVvdy2Nw7n7I2vURdoJilLY62WSJUV7Vw2Mm8mIs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rvcTho7Grg2OCUSmkSjCPyVVFd0LVHQKYvOv+jwjprkkeoMRz5Ua6mWoTXHag9PwGz0ooYn1m6++qZyfthC9p39GEJ8kFFg5qAgwgcGzlgsIvZvY546M5jLoAH2JQ71HbNcVXtFFdav4Pm/CiUcgffP2UJLHKlUQv9bzcrtORUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ILNk+70R; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ILNk+70R"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51114557c77so400222e87.0
        for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 00:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706517922; x=1707122722; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4F+xlgUGWJsyne8MrXcNfremPz7A1AclLvUOYf/t/Zo=;
        b=ILNk+70RIkMfFzrIz8KrlspBKDxhdQK/T3IBzkr+eLphf0s41dyp3lMYMap9D0cEKn
         OczuMwSZxUb+X14pC/gW8xSrQhgm3I90KkdsBocmyUeoKjxH5BzCrrSLfqrF48KuQmaa
         OUHBvDpshYAlkd5TS7NjzTyspTewCfnLGueCQ5x/Fvb4kJpL6tJ10gAze0l+JPODZqS5
         QxAOnzKp8H6gP5KRQZwkK6NWAgutDu6vcMwPxPCob1m6CdmL4iGjmbxBfJsMoWfyk8JH
         Vd2geSV6LnmzVaeI7LFdp1hwYNocVrQrb9r7PcwjZhtl0vuylUnc8E8OmsLY+es++wOK
         L12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706517922; x=1707122722;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4F+xlgUGWJsyne8MrXcNfremPz7A1AclLvUOYf/t/Zo=;
        b=UlfiWSeX8DIt8IrX2ftWt/91fQ3a/XspFSfVUIeuUsjZW73P11gEvHPNN7uLd84sXv
         IMVAy3cUVMrZ/NN4syQ+jYNa88zKEk78P9DG7VEs3YZLk8ineo/O+0yEp+ScgyLVVIcK
         MJqgtPpFmrecLcEPAgBFLgxJzIHMw39CeRR0YlJ1yC5c3ZoUaBz9F68UcQQqjeG0HKmM
         lgNMk8r0OMO+1s95B090hRQaWDEyMvJmA3Ua/Jf7TgoNIruYfnuVY34j+53hbLcDG/8M
         cgtBBMXuznNVNdayBj3VDH3eDp4po63vVcoV+ZeNiOG/rcf2B00C5WY2MkJ1Gz1Nahoe
         PlGw==
X-Gm-Message-State: AOJu0YxiA5LdCZCArimkOEC/JCsROZfNea4p5IuvZOmjVe7CefN7HsP/
	+E7AaLK0Tbjo3rCnGl79jlz5m+F7gRvKDPXgo0dNdc1ul3q0j14qYmYMlnh8+uX9ZUG2z9RsDBD
	4m5/SfA==
X-Google-Smtp-Source: AGHT+IGCct6200jY/NB+MWQ/+A0vI5pEWaJg5H/oTWwB1XeByQYAHUDMZjxVzfSBIA7MSGYKTrZMBA==
X-Received: by 2002:a19:2d59:0:b0:510:78f:1a65 with SMTP id t25-20020a192d59000000b00510078f1a65mr2996191lft.49.1706517921583;
        Mon, 29 Jan 2024 00:45:21 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c4f0500b0040e5951f199sm9483421wmq.34.2024.01.29.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 00:45:21 -0800 (PST)
Date: Mon, 29 Jan 2024 11:45:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Suma Hegde <suma.hegde@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 11/17]
 drivers/platform/x86/amd/hsmp.c:367 hsmp_metric_tbl_read() error: we
 previously assumed 'sock' could be null (see line 366)
Message-ID: <6e6cde7e-402e-4070-9854-85c6f7405e36@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   d04e52b47ab62cf36fddaa0feb1c5508e420e48d
commit: 7a5a66d63b8fb8ac60ef8e2ad989310c270a4fac [11/17] platform/x86/amd/hsmp: Move dev from platdev to hsmp_socket
config: x86_64-randconfig-161-20240128 (https://download.01.org/0day-ci/archive/20240129/202401291311.gzMCj6SP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401291311.gzMCj6SP-lkp@intel.com/

smatch warnings:
drivers/platform/x86/amd/hsmp.c:367 hsmp_metric_tbl_read() error: we previously assumed 'sock' could be null (see line 366)

vim +/sock +367 drivers/platform/x86/amd/hsmp.c

5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  352  static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  353  				    struct bin_attribute *bin_attr, char *buf,
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  354  				    loff_t off, size_t count)
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  355  {
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  356  	struct hsmp_socket *sock = bin_attr->private;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  357  	struct hsmp_message msg = { 0 };
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  358  	int ret;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  359  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  360  	/* Do not support lseek(), reads entire metric table */
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  361  	if (count < bin_attr->size) {
7a5a66d63b8fb8 drivers/platform/x86/amd/hsmp.c Suma Hegde 2024-01-06  362  		dev_err(sock->dev, "Wrong buffer size\n");
                                                                                                ^^^^^^^^^
Can sock be NULL?  Unchecked dereference

5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  363  		return -EINVAL;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  364  	}
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  365  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10 @366  	if (!sock) {
                                                                                    ^^^^^
Checked for NULL

7a5a66d63b8fb8 drivers/platform/x86/amd/hsmp.c Suma Hegde 2024-01-06 @367  		dev_err(sock->dev, "Failed to read attribute private data\n");
                                                                                                ^^^^^^^^^
NULL dereference in error message

5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  368  		return -EINVAL;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  369  	}
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  370  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  371  	msg.msg_id	= HSMP_GET_METRIC_TABLE;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  372  	msg.sock_ind	= sock->sock_ind;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  373  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  374  	ret = hsmp_send_message(&msg);
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  375  	if (ret)
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  376  		return ret;
02a258ac3ebf8a drivers/platform/x86/amd/hsmp.c Armin Wolf 2023-10-19  377  	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  378  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  379  	return bin_attr->size;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  380  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

