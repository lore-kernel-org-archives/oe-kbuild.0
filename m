Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC41FB1;
	Wed, 22 Mar 2023 07:33:10 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id ew6so6075152edb.7;
        Wed, 22 Mar 2023 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679470388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqNzgWiBUA36Qen24Z9C+QGoIdehi0yPWXL+YEro/V4=;
        b=XcvBZi8vPQ5vdPiAzQfWNqMrwC1jF7MTx6JvUwIbPMBllInDJHxR/IO82RlWL7fT1d
         Ivq0/tfjvK1TQcCb/WVcTcMbTA/XOPUQwvu71IpeKcGFaJQYOp94Fy30CX6tPETHEBIc
         19isc/PrruIXLCQ2x7/YrnGxOzhQLsTi9/pKKgMQwCuWfaDwhvKlAxbGtQZ9azwJJI0z
         y0gQV2TcOsxqi6ZK/bSSi1N9e7jdpb0+LCEbWbqbYsvGkaT2wY3/wLTxZ6o3JriaJdTT
         DgHs69tx/hdc2M1qgNquv2giS5W7339XmPHiVs6Fqq70v0umslSjH1XIe9UxTuPiBYn4
         lQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679470388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqNzgWiBUA36Qen24Z9C+QGoIdehi0yPWXL+YEro/V4=;
        b=hR648PGsKQhQ/utu/SRgN+YYhr9y+hRGaZELg78xf5w7Uc6Q3trqr81ICdjxj5vzem
         oNuxdJuYV7Bmqtl1WXP0HxriNfKL88cQ6lR5cVK4C6joGfhRYw0dz5opWokb/dLNUyCD
         LYRXBh74v8od8Wt0WMv050JuBRZY8eT7nUU5fpAla5NSh1ii472R4PtOf20PmtDxri9o
         KfqrYVWneb9EWcoVBOQMRnmYL2w1OATvnwXS2lwbCKw05d/KZ0svY101YBoP0pesYC5x
         BA8bwqr8gGdl/+vJSKIZhYLt83CevujoEaH5eq2dC039lJ0VGM2/BjWzJq+JiPMbPeE5
         RdIw==
X-Gm-Message-State: AO0yUKX/tTHQVhhCJhmxq35jP1QOFpYgGYPM8HbCjr8LWVTSn/6v2wnY
	l6xI26JUIot91HWnoW+5AWEr84C32mQ=
X-Google-Smtp-Source: AK7set9adudA8KhKVn8L7TAZacyRexVyYlPqsW5vYeBps6Hpo0C++3qZNMAzCmdGTXRphkkAtojNPg==
X-Received: by 2002:a17:907:20e7:b0:932:8dc:5afe with SMTP id rh7-20020a17090720e700b0093208dc5afemr6001272ejb.67.1679470388363;
        Wed, 22 Mar 2023 00:33:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id rh26-20020a17090720fa00b00930ba362216sm6859135ejb.176.2023.03.22.00.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 00:33:07 -0700 (PDT)
Date: Wed, 22 Mar 2023 10:33:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/11] kernel/trace/ring_buffer.c:2141
 ring_buffer_resize() warn: variable dereferenced before check 'buffer' (see
 line 2136)
Message-ID: <c2694580-410a-4860-9c51-2f132751ff0f@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   01e5d4c8d9b1dc42d6b576c3574398c465ea56a4
commit: 13188635cc6b5d06a3c78b1200d28511b7221385 [2/11] ANDROID: ring-buffer: Introducing external writer support
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230322/202303220748.j1ALZI9J-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303220748.j1ALZI9J-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:2141 ring_buffer_resize() warn: variable dereferenced before check 'buffer' (see line 2136)

vim +/buffer +2141 kernel/trace/ring_buffer.c

13292494379f92 Steven Rostedt (VMware    2019-12-13  2129) int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2130  			int cpu_id)
7a8e76a3829f10 Steven Rostedt            2008-09-29  2131  {
7a8e76a3829f10 Steven Rostedt            2008-09-29  2132  	struct ring_buffer_per_cpu *cpu_buffer;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  2133) 	unsigned long nr_pages;
0a1754b2a97efa Qiujun Huang              2020-10-19  2134  	int cpu, err;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2135  
13188635cc6b5d Vincent Donnefort         2022-08-24 @2136  	if (unlikely(has_ext_writer(buffer)))
                                                                                            ^^^^^^
Dereferenced inside function.

13188635cc6b5d Vincent Donnefort         2022-08-24  2137  		return -EINVAL;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2138  	/*
ee51a1de7e3837 Ingo Molnar               2008-11-13  2139  	 * Always succeed at resizing a non-existent buffer:
ee51a1de7e3837 Ingo Molnar               2008-11-13  2140  	 */
ee51a1de7e3837 Ingo Molnar               2008-11-13 @2141  	if (!buffer)
                                                                     ^^^^^^
Checked too late.

0a1754b2a97efa Qiujun Huang              2020-10-19  2142  		return 0;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2143  
6a31e1f135d1ab Steven Rostedt            2012-05-23  2144  	/* Make sure the requested buffer exists */
6a31e1f135d1ab Steven Rostedt            2012-05-23  2145  	if (cpu_id != RING_BUFFER_ALL_CPUS &&
6a31e1f135d1ab Steven Rostedt            2012-05-23  2146  	    !cpumask_test_cpu(cpu_id, buffer->cpumask))
0a1754b2a97efa Qiujun Huang              2020-10-19  2147  		return 0;
6a31e1f135d1ab Steven Rostedt            2012-05-23  2148  
59643d1535eb22 Steven Rostedt (Red Hat   2016-05-13  2149) 	nr_pages = DIV_ROUND_UP(size, BUF_PAGE_SIZE);
7a8e76a3829f10 Steven Rostedt            2008-09-29  2150  
7a8e76a3829f10 Steven Rostedt            2008-09-29  2151  	/* we need a minimum of two pages */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

