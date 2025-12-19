Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0467F2652AF
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131591; cv=none; b=TqR5SYltl56Fh0VrPBIqmWuq+SbXfkSKRZpRERdkqgp6cZlgZaftsusNSlGsousCfwjtWq0LFbvlEmtaFtMmhpnP8kFxw/1tASiOSz5KwPDxlTs6yYrAutueFxS4bALNM24ADYmzP29eMd2IB1Hx3s+0fU+YY/BLjCmlMO559us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131591; c=relaxed/simple;
	bh=lM5iFd8G0Ace+/s/X/+rVN4FNyVoLU7uwRg8EPb94W8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+MKW1QMwgTX5dFm1gDRJS2AQ355oGbp1wfk6vdUi7ezhQhaHoZ9pYUOYoOiTFWQimr0x8T+BhDs5zW9L6FvMAGtj3QSn15lLjncho3ogyGngMWnf8QcGEmsPZ8FQp7l9racwbLEuu39kI1p91VisyjeWcxQxehQDQ7X6mVoMZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYDAXFj9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYDAXFj9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477632b0621so8889055e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 00:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766131588; x=1766736388; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqDc58J0mJlF6iz/FD8YaZSHglWLc4nJynwRJQT9VB0=;
        b=KYDAXFj9WAlbf+wbDFttxXby1t8V1BnG4cD9OZjANB8zMDCkCoqslUCL3jpGvBMmSM
         Ez2Om2JDWXtFk2f2V+oQFj75g+2P5SxIqQi5dQX9WV1k6OFEkd387ZfdQvmZ8lhsYdzd
         hCWzqC3x9NrLAESl4FXaRkHRaGVMYx1BT5ZlvzNDVYbxXknaXsm+oadxbRgQ3JRahNJX
         tK6EaPAMWpLBCuR4WVy28nv29wdNT5DFuqomMq8MovcvrWIgHcGJFDxvBtSOGFWYGvNH
         UaD1kcKeZuYQ8Gdo0kH/zFykoYOGoCvvgMh+d3yQF2Q4xbyXFNHa0TFVcKOsWQgvM+Lr
         Y8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131588; x=1766736388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqDc58J0mJlF6iz/FD8YaZSHglWLc4nJynwRJQT9VB0=;
        b=jJgQRUdV2VtAvWYPWeIpXvcxfccE1WEmhqYpYhvmBLUNqO5bkKHmbx8xSibUggW0zn
         h2oz7jEshc2kRQyL7j/gDfJNlE36Ndp5yfj1ornakPKI10Eyq6J+nbL9K/W9NFAZt4E2
         d7nw79F5A8pUG2tkQs4Faa8pa/dyxjbHvB/Wu+lMS2F60/xBLDYCRzU+femDHuCSaNVs
         0sRA4b0kHSM3QuJFAjUHJB/rTdv+Sta2TMm0BX4/nzQ1B8GeyDkkzD43NgylukziI1ZU
         fs16rMjIbaDIca/THIlVUlBXuYVFlmq6fT8Yqc1TQdEJJ4MGhloxxj6la8SKxNoSvyd7
         eO4g==
X-Gm-Message-State: AOJu0YyHzqXNxJUSDwoG87eEJ+CdlL32jTDBj3qBywU7QhafGlfIHwvH
	WDpau2mr0cdjdla5MQ8tw+icP3iXgIQBwPikNFB/nwMAl0NfBrAkUC1CD7b6A1mMBd55ruHEuBS
	M6FUt
X-Gm-Gg: AY/fxX5RlrGCi7c6wI0MURi5jKGLjWp4p55ShTGb4CVjJlETnb/cnDF8NcXt5dbOcdw
	GkUVUvFrIrsDrxMKQpzWw5LhfYD4EfwUbvc4xrYNXxhTFZBadb/ghJFNEpXR4pEOCt1LU2Phceq
	2HRD6+YuiPYQSQ0o5EruWwcoWI7xmS+FOhGlC7K7TUpowjffTTvN1EnRDvilkj71FCTikUqI192
	oMpVgIR9VgTiGqbrTrSxzQi3CxD8sG5LWV2fPne4nyjjzny6ureRdcrD+MMVipaFSpIOUCmnM70
	+XtIo4IXBA1+5AD8eKBZrErLRgbJLuOcZoeTBlDxWrgrzTlC0kfIaRLjBmChkSQ29GPnBVdk0j4
	1Z2rifv7WPNWvd7sVaPGIHpAUN7Tx6e4Mvm8x8tiJ/2Ot8IUmLo698cjMlB/BB9+ZSqt8hNa6pF
	GfCwbEJco6qos65SwMlIBXpKXSfxg=
X-Google-Smtp-Source: AGHT+IGDnrg3fAhxrem74CTe/Ql8uGGeqyOVUZ6NLQXko+3T6NwjpJot8e06kUTBU0L/xFNgP4bTqQ==
X-Received: by 2002:a05:600c:1c1a:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47d195780eemr18520105e9.11.1766131587913;
        Fri, 19 Dec 2025 00:06:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm87239355e9.12.2025.12.19.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:06:27 -0800 (PST)
Date: Fri, 19 Dec 2025 11:06:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable
 dereferenced before check 'buffer' (see line 2172)
Message-ID: <202512191559.0oHMB8eD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251219080624.8Lr0kq6URNyx2j53m8LJsUM_hE3AWyMzcQ1lfdvsp8Y@z>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 5ecbcb61e172d82faf1bd8c00b17837d3c658c59 [43/43] ANDROID: ring-buffer: Introducing external writer support
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191559.0oHMB8eD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512191559.0oHMB8eD-lkp@intel.com/

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
Dereferenced here.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

