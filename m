Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6647BE5F
	for <oe-kbuild@lists.linux.dev>; Wed, 31 May 2023 08:26:27 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30aebe2602fso2458979f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 31 May 2023 01:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685521585; x=1688113585;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XdKjPgd3R5woBguqTFGwLAFeeRynVXyhLw91RrXKxqE=;
        b=Vb6qggH957m3EEntu1j0btIeLakAckT8zk5d2LaI3uwZhUjZ4C/zv73lZ1EuBQcnUs
         WjmCXHjPUiIPQpZ1Gcfr3G09wbOhQ5TeYyUZ1y5dNH/D5fsLqA952V8HkT4+Ib2xL2Xh
         itWzDpZEgQkyYJax18AVcXx6yDP74kTYWFTnAwf29MnJvEJ5S+aLgMOA/mAPFuPvwPpU
         Hpy04Sa/4INdzF2HnjFyVRZTVcOPoJTlxgwW0JmTDwF4IPMrgvfdwaWuBWeiMcmiai/3
         5dGMOB4lbBwRfVYBifaUa1WKDl7+al3kqCpRS9JbBQ1+k8RjD0gT7MnKz9mJqGJonTrm
         WWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521585; x=1688113585;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdKjPgd3R5woBguqTFGwLAFeeRynVXyhLw91RrXKxqE=;
        b=NUaGqeW3tVOstFPbfcsfmhoL9CoDIP5LLk26TcpxAtMFy1xU3/j0/Lc7Vdn4FRQE9N
         26csUPlgqfFfcMz9EtYITefO5aZlIYvxutN+USxXMbUNNGtSuEG5twFX3kj75dCh11YI
         gXJ4wox3USjZeGVqLKE5k6kjf0PF0+9w+LgnmS15JnfKCF1G41gyvh5NiaizXItp211k
         DXcL8S6oidRfdSzJiE951wbnZBI6c5VfiQ5HI91z28Rx+vIa+B3L6ixj9Ld9TIteSi5Z
         7LgnbEcjm85IOmQenCkJJphaBvLJqrFU568ajePOs5eDS8N82Nk2Y6JiA3cYNwVlYVZC
         Td9Q==
X-Gm-Message-State: AC+VfDwmXffoEEZoj43RYqE2NAg11E0h3YzyJ6vBvYoGPTTlXJ9I2A1u
	/f36Km9MsRuqBUjZEbthXzrYH65FFdZRw0VXSnA=
X-Google-Smtp-Source: ACHHUZ6yM7cLNNhma00AnGS7k5IS219zdPpNHSL2t2i1VXVqHeJURCnc9X4VDXc5MBIoOAcfmcmiuA==
X-Received: by 2002:a5d:58d8:0:b0:306:2de2:f583 with SMTP id o24-20020a5d58d8000000b003062de2f583mr3382095wrf.53.1685521584906;
        Wed, 31 May 2023 01:26:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020adfeacb000000b0030ae7bd1737sm5924072wrn.45.2023.05.31.01.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:23 -0700 (PDT)
Date: Wed, 31 May 2023 11:26:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2] tpm: tpm_vtpm_proxy: do not reference kernel
 memory as user memory
Message-ID: <df888b86-6749-4ab0-9c20-8925da16760b@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530020133.235765-1-jarkko@kernel.org>

Hi Jarkko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-tpm_vtpm_proxy-do-not-reference-kernel-memory-as-user-memory/20230530-100537
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230530020133.235765-1-jarkko%40kernel.org
patch subject: [PATCH RFC v2] tpm: tpm_vtpm_proxy: do not reference kernel memory as user memory
config: m68k-randconfig-m031-20230530 (https://download.01.org/0day-ci/archive/20230531/202305311050.cYKH2Hfq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305311050.cYKH2Hfq-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_vtpm_proxy.c:83 __vtpm_proxy_read_unlocked() error: uninitialized symbol 'rc'.

vim +/rc +83 drivers/char/tpm/tpm_vtpm_proxy.c

919bd177830a95 Jarkko Sakkinen 2023-05-30  60  static ssize_t __vtpm_proxy_read_unlocked(struct proxy_dev *proxy_dev, char __user *buf,
919bd177830a95 Jarkko Sakkinen 2023-05-30  61  					  size_t count)
6f99612e250041 Stefan Berger   2016-04-18  62  {
6f99612e250041 Stefan Berger   2016-04-18  63  	size_t len;
919bd177830a95 Jarkko Sakkinen 2023-05-30  64  	int rc;
6f99612e250041 Stefan Berger   2016-04-18  65  
919bd177830a95 Jarkko Sakkinen 2023-05-30  66  	if (!(proxy_dev->state & STATE_OPENED_FLAG))
6f99612e250041 Stefan Berger   2016-04-18  67  		return -EPIPE;
6f99612e250041 Stefan Berger   2016-04-18  68  
6f99612e250041 Stefan Berger   2016-04-18  69  	len = proxy_dev->req_len;
6f99612e250041 Stefan Berger   2016-04-18  70  
e52432e1642309 Kees Cook       2022-01-19  71  	if (count < len || len > sizeof(proxy_dev->buffer)) {
6f99612e250041 Stefan Berger   2016-04-18  72  		pr_debug("Invalid size in recv: count=%zd, req_len=%zd\n",
6f99612e250041 Stefan Berger   2016-04-18  73  			 count, len);
6f99612e250041 Stefan Berger   2016-04-18  74  		return -EIO;
6f99612e250041 Stefan Berger   2016-04-18  75  	}
6f99612e250041 Stefan Berger   2016-04-18  76  
919bd177830a95 Jarkko Sakkinen 2023-05-30  77  	if (buf)
6f99612e250041 Stefan Berger   2016-04-18  78  		rc = copy_to_user(buf, proxy_dev->buffer, len);

rc not initialized on the else path.

It must be really embarrassing for the kbuild-bot to be calling
attention to your private trees.  :P

919bd177830a95 Jarkko Sakkinen 2023-05-30  79  
6f99612e250041 Stefan Berger   2016-04-18  80  	memset(proxy_dev->buffer, 0, len);
6f99612e250041 Stefan Berger   2016-04-18  81  	proxy_dev->req_len = 0;
6f99612e250041 Stefan Berger   2016-04-18  82  
6f99612e250041 Stefan Berger   2016-04-18 @83  	if (!rc)
6f99612e250041 Stefan Berger   2016-04-18  84  		proxy_dev->state |= STATE_WAIT_RESPONSE_FLAG;
6f99612e250041 Stefan Berger   2016-04-18  85  
6f99612e250041 Stefan Berger   2016-04-18  86  	if (rc)
6f99612e250041 Stefan Berger   2016-04-18  87  		return -EFAULT;
6f99612e250041 Stefan Berger   2016-04-18  88  
6f99612e250041 Stefan Berger   2016-04-18  89  	return len;
6f99612e250041 Stefan Berger   2016-04-18  90  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

