Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D709149013
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Sep 2024 05:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725512665; cv=none; b=U7Lj2vOiKFO5HVk394HYZP0XnfeMEesjKCYIOjZ7Adsb3PQXhlgw7bbwWcHG+77tXmhsLSOEaw02Kv+caz4vpk/xVIKN8uaSuXfWB25tKrtTlEFdCoqyBIrOdEwn5XzkvRlMKjGK/5O0uWbAHBs/EF3iFqbEVor3fzkfJ8q1v6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725512665; c=relaxed/simple;
	bh=vPyZuIz+7g8chRkaYvo/yQSNPiIPoqFg7u7vFpje8yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MbG49OtLbg48+r0PYwNxsc+H73C4aBPW8ojNrtU79GUYYbuy7BnY4MZoOpO9p5rx6uMGUgQ9DJt8LN9l/4s5qvpgzBPwsr/pJFUTefZV18EuA20lY5WB9QZqVpK0zty7+ZsaVhjgdLazdkD/MTegM01o48GGeJKoukNEikeoLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FwUAE4yY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwUAE4yY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso8007475e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Sep 2024 22:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725512661; x=1726117461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nSDgI/fJFCvwlhr186ujUbs/jDGk2xnBolXbdoqfgYs=;
        b=FwUAE4yYART6q/SmWt8Xxiy0rhFywCpF2skr5b+uCWOmA2R9y/Dxhr2GgQVXMSI+j5
         3LjQFIGPAhCdRyYo8HQiM0rdFHHXQ9XS5cR0/mQM8XpuXa3t8Syag0ZS1llvPUWTi6VC
         aq+4BYBI9i1QJipSnikozc6nSnJPjvg6mqiWDcI4GCndDxDZqkqfsOr+fSJrJqUqX5KL
         26hC0rPXpCuglGrChtR0hlz9FQ6oZazFLAJzxjm/yvKz41Efxx/lCSCGsw0DRZHDvhs0
         Ev9l5rUryDMpfXNvehyqSNdGmPbN//axG1rgaICtdJdCLWWHxFnu/euH5m4hLrDT+La+
         VpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725512661; x=1726117461;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSDgI/fJFCvwlhr186ujUbs/jDGk2xnBolXbdoqfgYs=;
        b=soaZBGYZKmACICFfO53QbigtJxFzYWxiklbl1BfnHdNrCKrH2J9Uy8p5TqFdmHiVkj
         eK/YdjPr/9vGF5i+IlhsIfhDZHrMi48l6jbiPdmxvLSJLNePDlcdtOyz4o2o3PFpg/do
         6en/3mZgpnLupdf65h3T0dnjuXaC4ViFzn9zqN4TA4NJ1yH1EqM7fsdr1cScFtv1rmSL
         wHO2oUKs9tbRCtJxeRJIAUY4yqeST4eJTb6RrGX0lqL0ixvLL4Bcikkc3PVcnLvUr07x
         s77HVEXAX+t8/Y2DQRdZeYRVxJR+z4S086grxmcw0i6QCcdfjI3Jr7bubWepOc7KXIZy
         PG4g==
X-Gm-Message-State: AOJu0YwF+WuMJ2R4uJLKcxf1NsB+/9jMySUlvwhPS3LB+x8OJgsMI5lN
	kRrIaenMa9hQUaivNOyjaqxyI1AFpn6ZqZUYS4HHZ7AP4iR2BVXlVXcQAPTow8ki77ZYc6Dssnw
	k
X-Google-Smtp-Source: AGHT+IHnEpoMCnk9Xc0YEfmXdUGRDKjK3BNw/acf4AQVfjdPEm65KdE0s1RkIjiIj2B4FJHfV7AXSA==
X-Received: by 2002:a5d:634a:0:b0:374:bb1a:eebb with SMTP id ffacd0b85a97d-3779aeafb18mr2317751f8f.25.1725512661190;
        Wed, 04 Sep 2024 22:04:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c5ba7027sm11518202f8f.19.2024.09.04.22.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 22:04:20 -0700 (PDT)
Date: Thu, 5 Sep 2024 08:04:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/3] cxl: Move mailbox related bits to the same context
Message-ID: <c3f7e80e-e52b-47e6-a717-3f8b75e2826e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904000020.1686611-2-dave.jiang@intel.com>

Hi Dave,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/cxl-Move-mailbox-related-bits-to-the-same-context/20240904-080307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240904000020.1686611-2-dave.jiang%40intel.com
patch subject: [PATCH v3 1/3] cxl: Move mailbox related bits to the same context
config: i386-randconfig-141-20240904 (https://download.01.org/0day-ci/archive/20240905/202409051031.WY4y1MhJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409051031.WY4y1MhJ-lkp@intel.com/

smatch warnings:
drivers/cxl/core/mbox.c:1429 cxl_mailbox_init() error: we previously assumed 'cxl_mbox' could be null (see line 1426)

vim +/cxl_mbox +1429 drivers/cxl/core/mbox.c

1390c0beea9575 Dave Jiang       2024-09-03  1424  int cxl_mailbox_init(struct cxl_mailbox *cxl_mbox, struct device *host)
1390c0beea9575 Dave Jiang       2024-09-03  1425  {
1390c0beea9575 Dave Jiang       2024-09-03 @1426  	if (!cxl_mbox && !host)

s/&&/||/

1390c0beea9575 Dave Jiang       2024-09-03  1427  		return -EINVAL;
1390c0beea9575 Dave Jiang       2024-09-03  1428  
1390c0beea9575 Dave Jiang       2024-09-03 @1429  	cxl_mbox->host = host;
1390c0beea9575 Dave Jiang       2024-09-03  1430  	mutex_init(&cxl_mbox->mbox_mutex);
1390c0beea9575 Dave Jiang       2024-09-03  1431  	rcuwait_init(&cxl_mbox->mbox_wait);
1390c0beea9575 Dave Jiang       2024-09-03  1432  
1390c0beea9575 Dave Jiang       2024-09-03  1433  	return 0;
1390c0beea9575 Dave Jiang       2024-09-03  1434  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

