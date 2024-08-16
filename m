Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2503413B286
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723801115; cv=none; b=GZjiQjAYAxc2UcLoeRUFeIpaz6HUfQSo5MmOjHRt2E9Mv3hJx1NbqIZzOrMJJII5Fsvq1LbSZ4kCpaCq+F/bZqTvMk1rQf0d/IuosM2LMVhbjO8ayVZxQV5Bxz/zm5mXPuGzwr8c2UlXsz7WGSQ2m1Px1QK0qHOo7wwtbW2VZ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723801115; c=relaxed/simple;
	bh=XOoTxRjVtRGFsPK5EWELKkL1XdqOplIH7QBBako0xHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=R43bxYqey4V4FVN1XhRg+OYX3y1dv0zX1wieGk5cSwuqyrNA9YcBinbHkUWBIsAQJh4Q/Lr6uABS/jeikG86aQh8+U//d85Pxpf9ySfT0TsJHMBiiUBcgFMHHFEQJcckE7wf5DQa1FBLAF2esbhfA0odVZ+BIU6I1E0on/xbipY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8Pqb6Fz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8Pqb6Fz"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so309708166b.0
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 02:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723801112; x=1724405912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALCyVUvADEycqvBmVWJgnXOAnW1UV6OFc1I2ge5Btys=;
        b=E8Pqb6FzjxNI1LDc0TC5NbGBU9DK462q/OlZT+mv2c1u/WwiUeVgbj3lrqdV+MkmnA
         7XLmUIRBFUWXRY7sVc3VNfVdmUDPvOVt+gKoLMXIhvMWC+m2RPA4FQzwyDlN3aqmJNA4
         8ijRWQoHVo5vyVnzvQfb4E8JBlbJPZd1FJyPO7r3s8WFQhymAnUayYipEeF571H/HeUo
         +cbiSZQj5t3IqcM8dSvwqQCBuS3A6C9n1vCTYm3XXAhjiiAIvHDL7RkhEWxjcjG40OKE
         ESxM0jwnYASAKXzV6v0F2+GbHTKodyc3+HAKvOC8As9j9/M+XzZn7y5LRY64uwa53+yj
         2Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723801112; x=1724405912;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALCyVUvADEycqvBmVWJgnXOAnW1UV6OFc1I2ge5Btys=;
        b=FeY26I88yWS8NdiLosGcb74Qv8rkuZKIyEoveXzbWxB6V6Etdo6n+xC3EXe+HRGlmv
         Ww6yg9ipsG2/7N1JwomTpE4NdDfA1siJyBVeYEeIiSObm/XRJVaLKUGZG8K9ywHaE3vV
         98E8BA2g3Y2EaY3UkeqRuuCUO/3//uxUar2jTFwYIINumPSC3hRSjZqcuu9hopFiOLka
         jJk0X16BnPugcYwWWfWzhYYNQyoyS6H8eLUJz9w/KeKTZ8x0WQC0UIh4oOzSMnP117Sg
         0ygrlwcHSk8oicqLmPH/+lIOAtgd1ii2lLr9gvc3O8O/zAA+rDpbCHwT/4rr+f1gzZ88
         FmvA==
X-Gm-Message-State: AOJu0YyzM+waeyNg9J5JbZqUKIfITxbd5iBDVL4bw9BJmX6523Jr+tal
	0XQAj2XOyuTWDUnhlY36HfXlkZIW3WrdIz4ch9qOBBW4NPN/Cnx3i7GkwOdVky17mwocMGw+wtn
	D
X-Google-Smtp-Source: AGHT+IE7OStDoG/vZludgrbKFErHeWmhqvPlg8I1Vlpj3pe30rqCybr7fVWmCvcjiGtFHUGfWMMu+Q==
X-Received: by 2002:a17:907:94d4:b0:a7a:8a38:9d99 with SMTP id a640c23a62f3a-a83951c5bb5mr144031666b.35.1723801111976;
        Fri, 16 Aug 2024 02:38:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf03csm227699566b.50.2024.08.16.02.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:38:31 -0700 (PDT)
Date: Fri, 16 Aug 2024 12:38:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	R Kannappan <r.kannappan@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 4/4] thunderbolt: Improve software receiver lane margining
Message-ID: <2ae5c18e-9f43-47d6-9bc4-63da8d3d3da3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813110135.2178900-5-mika.westerberg@linux.intel.com>

Hi Mika,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Westerberg/thunderbolt-Add-missing-usb4_port_sb_read-to-usb4_port_sw_margin/20240815-001205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20240813110135.2178900-5-mika.westerberg%40linux.intel.com
patch subject: [PATCH 4/4] thunderbolt: Improve software receiver lane margining
config: i386-randconfig-141-20240815 (https://download.01.org/0day-ci/archive/20240816/202408161041.jjzazHm4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408161041.jjzazHm4-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/debugfs.c:1014 margining_run_sw() error: uninitialized symbol 'errors'.

vim +/errors +1014 drivers/thunderbolt/debugfs.c

c0188291a5471b R Kannappan     2024-08-13   986  static int margining_run_sw(struct tb_margining *margining,
c0188291a5471b R Kannappan     2024-08-13   987  			    struct usb4_port_margining_params *params)
c0188291a5471b R Kannappan     2024-08-13   988  {
c0188291a5471b R Kannappan     2024-08-13   989  	u32 nsamples = margining->dwell_time / DWELL_SAMPLE_INTERVAL;
c0188291a5471b R Kannappan     2024-08-13   990  	u32 errors;
c0188291a5471b R Kannappan     2024-08-13   991  	int ret, i;
c0188291a5471b R Kannappan     2024-08-13   992  
c0188291a5471b R Kannappan     2024-08-13   993  	ret = usb4_port_sw_margin(margining->port, margining->target, margining->index,
c0188291a5471b R Kannappan     2024-08-13   994  				  params, margining->results);
c0188291a5471b R Kannappan     2024-08-13   995  	if (ret)
c0188291a5471b R Kannappan     2024-08-13   996  		goto out_stop;
c0188291a5471b R Kannappan     2024-08-13   997  
c0188291a5471b R Kannappan     2024-08-13   998  	for (i = 0; i <= nsamples; i++) {
c0188291a5471b R Kannappan     2024-08-13   999  		ret = usb4_port_sw_margin_errors(margining->port, margining->target,
c0188291a5471b R Kannappan     2024-08-13  1000  						 margining->index, &margining->results[1]);
c0188291a5471b R Kannappan     2024-08-13  1001  		if (ret)
c0188291a5471b R Kannappan     2024-08-13  1002  			break;
c0188291a5471b R Kannappan     2024-08-13  1003  
c0188291a5471b R Kannappan     2024-08-13  1004  		if (margining->lanes == USB4_MARGIN_SW_LANE_0)
c0188291a5471b R Kannappan     2024-08-13  1005  			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
c0188291a5471b R Kannappan     2024-08-13  1006  					   margining->results[1]);
c0188291a5471b R Kannappan     2024-08-13  1007  		else if (margining->lanes == USB4_MARGIN_SW_LANE_1)
c0188291a5471b R Kannappan     2024-08-13  1008  			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
c0188291a5471b R Kannappan     2024-08-13  1009  					   margining->results[1]);
c0188291a5471b R Kannappan     2024-08-13  1010  		else if (margining->lanes == USB4_MARGIN_SW_ALL_LANES)
c0188291a5471b R Kannappan     2024-08-13  1011  			errors = margining->results[1];

The static checker wants an else statement.

c0188291a5471b R Kannappan     2024-08-13  1012  
c0188291a5471b R Kannappan     2024-08-13  1013  		/* Any errors stop the test */
c0188291a5471b R Kannappan     2024-08-13 @1014  		if (errors)
c0188291a5471b R Kannappan     2024-08-13  1015  			break;
c0188291a5471b R Kannappan     2024-08-13  1016  
c0188291a5471b R Kannappan     2024-08-13  1017  		fsleep(DWELL_SAMPLE_INTERVAL * USEC_PER_MSEC);
c0188291a5471b R Kannappan     2024-08-13  1018  	}
c0188291a5471b R Kannappan     2024-08-13  1019  
c0188291a5471b R Kannappan     2024-08-13  1020  out_stop:
c0188291a5471b R Kannappan     2024-08-13  1021  	/*
c0188291a5471b R Kannappan     2024-08-13  1022  	 * Stop the counters but don't clear them to allow the
c0188291a5471b R Kannappan     2024-08-13  1023  	 * different error counter configurations.
c0188291a5471b R Kannappan     2024-08-13  1024  	 */
c0188291a5471b R Kannappan     2024-08-13  1025  	margining_modify_error_counter(margining, margining->lanes,
c0188291a5471b R Kannappan     2024-08-13  1026  				       USB4_MARGIN_SW_ERROR_COUNTER_STOP);
c0188291a5471b R Kannappan     2024-08-13  1027  	return ret;
c0188291a5471b R Kannappan     2024-08-13  1028  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

