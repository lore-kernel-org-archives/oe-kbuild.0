Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18B1FBF;
	Tue, 21 Feb 2023 11:34:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id bo30so3507403wrb.0;
        Tue, 21 Feb 2023 03:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6XsM0lGHivc0yEIzrABocCb5n6PCCHzh9jbspZYVW3E=;
        b=d2V2v1iq2xek5TnH5u2vns+V1eoYobLZ5+KZcnvnrbOQTq0OW+YBk+69EmWB4MNwuT
         ZEeYQYVkmKqPFKca2diwEWS8ewGbhFsdLierwD7vQUXdi+m5gfIKGfgZYk0RfJQ3UgLG
         P+8tenUbOcpwX+I/32XYZYoYSt/DPlzjKR9q0+sMxliQaFVWyZexKRhP9xkajvQGbr/T
         1bKVaVhVSqG0Ap/JCj3xqr4jx9wQiT4ToY78lbRCef2tGILfUavpY4Y4OOG0G7fDqpQ6
         pEA7zOmxt6jviuXAflWhafPZMUBfFsOEfeqhbKsNUD/8iL8xvlUNd33y+cEVjTEtNfBC
         yudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XsM0lGHivc0yEIzrABocCb5n6PCCHzh9jbspZYVW3E=;
        b=EaxQqSUGaa43lMW/8+RMGmBhm8tb7bt6NE50MOkWQOsxeivpPOZM2XyFcqCBE1tLvC
         ekRLOuHuyYAleSekjvgAPbi1gR6L/g2XT/5XqG5+7DnBtr/0ZgJiVtOdnVhhsOtop5pR
         QjLIhU2s6VMZy+eGv6Ws4TpCAzflUwF7A2H9FjlP7ONV5duZc/uj9KkjZQtcg0/M6KUG
         e9uFwnp7l+rFzOl3R66RYjNhfPMaulkx+0T99WEBtJwBOrdECocAXdePKIeFBpe7V3kX
         VgVXC8SO7gGY+a4V3NCLLmkJeyIq3vf9Ju59qz9e/f5EOjbazrcgs5UbOv8UBbptaoh3
         FgvA==
X-Gm-Message-State: AO0yUKUW9bgS8TMgmafFoDRJ2AxlS17S+35KbXMlYdRDAVFt9zNP5+HL
	BFmvPN3VqLcoJuHG3XmUpvOF+S68vzY=
X-Google-Smtp-Source: AK7set9wM4xZBZZnPY6KhCGayNouoiFTHLpWSJvXIQA40gwOfeS6c9KABP+9hO4fPX2eVchIxlg39g==
X-Received: by 2002:a5d:58d9:0:b0:2c6:e87f:30cc with SMTP id o25-20020a5d58d9000000b002c6e87f30ccmr2407363wrf.48.1676979243303;
        Tue, 21 Feb 2023 03:34:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b002c567881dbcsm1432993wro.48.2023.02.21.03.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 03:34:02 -0800 (PST)
Date: Tue, 21 Feb 2023 14:33:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6539/7267]
 kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable
 dereferenced before check 'buffer' (see line 2172)
Message-ID: <202302181230.X9lCS0f6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230221113359.xne0kg3UtcorP3lj_HstS8WG3n8Loe7crISAM5gCFwM@z>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   26f2032cc476b6d61f4a694fca4feb8e9e2cb5c7
commit: 5ecbcb61e172d82faf1bd8c00b17837d3c658c59 [6539/7267] ANDROID: ring-buffer: Introducing external writer support
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230218/202302181230.X9lCS0f6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302181230.X9lCS0f6-lkp@intel.com/

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
Patch adds an dereference

5ecbcb61e172d8 Vincent Donnefort         2022-08-24  2173  		return -EINVAL;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2174  	/*
ee51a1de7e3837 Ingo Molnar               2008-11-13  2175  	 * Always succeed at resizing a non-existent buffer:
ee51a1de7e3837 Ingo Molnar               2008-11-13  2176  	 */
ee51a1de7e3837 Ingo Molnar               2008-11-13 @2177  	if (!buffer)
                                                                    ^^^^^^^
Checked too late.

0a1754b2a97efa Qiujun Huang              2020-10-19  2178  		return 0;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2179  
6a31e1f135d1ab Steven Rostedt            2012-05-23  2180  	/* Make sure the requested buffer exists */
6a31e1f135d1ab Steven Rostedt            2012-05-23  2181  	if (cpu_id != RING_BUFFER_ALL_CPUS &&
6a31e1f135d1ab Steven Rostedt            2012-05-23  2182  	    !cpumask_test_cpu(cpu_id, buffer->cpumask))
0a1754b2a97efa Qiujun Huang              2020-10-19  2183  		return 0;
6a31e1f135d1ab Steven Rostedt            2012-05-23  2184  
59643d1535eb22 Steven Rostedt (Red Hat   2016-05-13  2185) 	nr_pages = DIV_ROUND_UP(size, BUF_PAGE_SIZE);
7a8e76a3829f10 Steven Rostedt            2008-09-29  2186  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

