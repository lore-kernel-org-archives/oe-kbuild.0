Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4F23D7F
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 06:39:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-402c46c49f4so5903385e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 23:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694673559; x=1695278359; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rryeilmHVsTcYrCE5ypYa65vGftDTEhvKiA4HjqLsnY=;
        b=iYEbrAosXtu9auaEKoTsF+KnWDwXpOiJU6WqC8V3qC9QbqTN5t1emOEm/0N4xCDixS
         JUEy8ihMOgRWQ5FBIeuUHxas9KIsltMlb7RdEhc64yq2lgpBInIPXUO/veP4Ax9VojzR
         lu649eySKy317yLrZzHsbI89qC7eakT0khK1KW43JpZpdJNQRSbLE8Vbi8N1ky5fhTHU
         MXRSNaYydZKXsW/W+/3E7e5FGy0KSSDq4PZSvihahHByZJgrTisLxYSnvfXQVzETqhhB
         GVK9u4D25fgvCcVdDRU4W5fQCxhb1XwTLXrGSmDw+aF1kO7FT86F652Dt8O30bGcsTHV
         KU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694673559; x=1695278359;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rryeilmHVsTcYrCE5ypYa65vGftDTEhvKiA4HjqLsnY=;
        b=GEuih3g1fUEpZMrv6Ao7bkDb2/8QLGm4H/Ww8S+Y1Q42MB2RVU5hsvJrFKExUvZaNd
         +ganaMWC9qweq4CJUMk3yHswfUVzXO9fZtyrgqfqll4JkJF/KUVHO0RjBWQ9B8yWQPxU
         RihnlZ4lfWAoLMgMRe97wZfQcNgQrEeDHia5ueGm6Yz7kV3eO8Db9dtHnSC4NqOSKktT
         vmXtgYGttxoMmZ4L8CkW6KQmlZIuyRv/cjEZDORxZlE6nfrFakz9q9wOQ7T6zZz+YcvY
         lu/JkdIPOuYOpNi47oF3Un+/nbM/JDsI3rSO2PFgvvo8gz0t6APaqHM2/avHM9zTYjOF
         xh6w==
X-Gm-Message-State: AOJu0YzObnJtqUJH/7tLkgm6AvLZa5gCBVr4aYvCq1bZ1c3QynbVtnvM
	RAGCHn+/n7ZdmipFFUrZKrVQi+3erovo/ZjNQBs=
X-Google-Smtp-Source: AGHT+IG+/qdPplJXDD0+lN4yHo05FQxVTl93zDo17Uyz7IvIM31rz3w/2/XB3ia+oEveTVposJWNFg==
X-Received: by 2002:a1c:f717:0:b0:401:23fc:1f92 with SMTP id v23-20020a1cf717000000b0040123fc1f92mr3982730wmh.25.1694673559261;
        Wed, 13 Sep 2023 23:39:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c3-20020a05600c0ac300b003fef6881350sm1052699wmr.25.2023.09.13.23.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 23:39:18 -0700 (PDT)
Date: Thu, 14 Sep 2023 09:39:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6539/11302]
 kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable
 dereferenced before check 'buffer' (see line 2172)
Message-ID: <844e068c-5d8e-489b-9bff-7b98996fa3b9@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   7579b22626ff63d1e755c7afe0e6a82b879f939e
commit: 5ecbcb61e172d82faf1bd8c00b17837d3c658c59 [6539/11302] ANDROID: ring-buffer: Introducing external writer support
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230914/202309140321.8D6yrzxp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309140321.8D6yrzxp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309140321.8D6yrzxp-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable dereferenced before check 'buffer' (see line 2172)

vim +/buffer +2177 kernel/trace/ring_buffer.c

13292494379f92 Steven Rostedt (VMware    2019-12-13  2165) int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2166  			int cpu_id)
7a8e76a3829f10 Steven Rostedt            2008-09-29  2167  {
7a8e76a3829f10 Steven Rostedt            2008-09-29  2168  	struct ring_buffer_per_cpu *cpu_buffer;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  2169) 	unsigned long nr_pages;
0a1754b2a97efa Qiujun Huang              2020-10-19  2170  	int cpu, err;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2171  
5ecbcb61e172d8 Vincent Donnefort         2022-08-24 @2172  	if (unlikely(has_ext_writer(buffer)))
                                                                                            ^^^^^^
Dereferenced inside the function.

5ecbcb61e172d8 Vincent Donnefort         2022-08-24  2173  		return -EINVAL;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2174  	/*
ee51a1de7e3837 Ingo Molnar               2008-11-13  2175  	 * Always succeed at resizing a non-existent buffer:
ee51a1de7e3837 Ingo Molnar               2008-11-13  2176  	 */
ee51a1de7e3837 Ingo Molnar               2008-11-13 @2177  	if (!buffer)
                                                                     ^^^^^^
Too late.

0a1754b2a97efa Qiujun Huang              2020-10-19  2178  		return 0;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2179  
6a31e1f135d1ab Steven Rostedt            2012-05-23  2180  	/* Make sure the requested buffer exists */
6a31e1f135d1ab Steven Rostedt            2012-05-23  2181  	if (cpu_id != RING_BUFFER_ALL_CPUS &&

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

