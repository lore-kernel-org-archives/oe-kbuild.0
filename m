Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887849;
	b=oz8GuV0hnjNIWJhEYMg4yrT2MlQB6cYsJUOhdOZE4i019a8vr5HfehY+oPcYPYzZuI2K
	 fnUIyGM9EbQMoHwDuKkbvOdd/N1lha+JBDH/MZJAvd9ZJVIVJD0M9xC4th6BIx6ikCDnk
	 aIhDTrVVfYNw35Gnci51D1/OQYLk6peQ9khGboV8fi6TsVYla6zRWg+Gl90PWHRYMaFAo
	 YJJASCTuzsW9UfzwSV4t9FKWgaT59oopw/1MMmoOSur6STtw1XQQbThvcufU0nv2GNqxv
	 NhIh44aTUVtogDhcrpEdzKlapi+JPZeSVHTh2noBto5KZFjPWPLYQ5U+aOBCfmvvhVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=A9WpazFpM6I0q66z3jQ1jZHrE4ERqM6y4gAesIV9RtI=;
	b=u7TWVqdHIt0dpBJSz29wIrdSvsa0i3h+SPiJjOjS5TlLZzBMOrOLqIzUqOWL+bGrIolI
	 VrRtZkS8S/1mEGvRSPd9R2r+LHMtUOe5RwdvEi8gTjpB4045CuslFqImvK2SpTEjk9mjX
	 0EYh90zdYy1qDkbeKMc8RAgpdZ5AwJzGv4MKVMyIFQ4jlN27Ic3+eq0lxBlqWOhZ9TnWs
	 JfKSrxAa3namg6ML5TXB6DegVXxFSkeGFglvDzMxertqyUPlQdGXDPU4+yai0Obot9MjL
	 9med/pTqilDzVVOaxNG7lxM9hjqDNcm8Wzm6xirBuImO7BONZJ8pR4v8p5H5F42f9kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOTs1obN;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3963606D81D
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 14:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3963606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOTs1obN
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7589385e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 05 Nov 2026 06:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887847; x=1794492647; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9WpazFpM6I0q66z3jQ1jZHrE4ERqM6y4gAesIV9RtI=;
        b=bOTs1obN4TmnAF27c5oPDfuvzlO6j/KIj8+hzmedgkBukqAN/UV7hD0LyV6lLAR7CL
         9l+zthLtFvXkzUT8vT1EU8SlZk/PAfzTYEYND/sm5DY8vwVNPpGEyOjDw37VNMyLoAlT
         oKWnP8NcAoI98tveuwHAteF8d/d29yduFCpuS4V7eFXVYpdrTaj7fVYmfKyGrj0sOVep
         Wbr3UsJr5J1qva7kWUhj6tU/OESB7qGe0EwNf/1V4XsR+sez99fvj2IP3Cmv2ecqDqtM
         OyvYzaVtK2xPVgxiY3EIcYMfnBVzvfI4LiKvr3bEmQ170MYGUOS9CcCiw5m+DiPyKrXV
         6tNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887847; x=1794492647;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9WpazFpM6I0q66z3jQ1jZHrE4ERqM6y4gAesIV9RtI=;
        b=alORW/ofiRlkGy/Gb6rYXVcGKJjuWjixhaFTEEJPOnZ3dZF71fi4MffIvjAbU4/KHr
         J64KVKe7UjDuML7WM3uQBAmxYm97/Capd0utZ5MTi5Bmy7FX1nSQBOjoYzt2qd16lJxf
         26/Mw0sDrurT9Rzc91ZdFvWWrRyWfQCADn5c15ourOFnY/MMhY6TkkdZLH/nr9BIsTL0
         FywzGjYyWDj1b+nntVLr7HIXjCNRAF4PNmbCIqGIzNDHHabqLL8W+hR5LTEzFUYUq8QQ
         JabdB2SEVB0Q2GX8+UVk9Qn+JoprJCFNrZC2tGQNpGYyDMzJLPhNyo3R5McDTTdtpodX
         bRig==
X-Gm-Message-State: APuU4Z8Lmt/kg2dKqHa8SBFOVbptK4S+iL0DE+sXB8Rpj0QZeI0bkiVQ
	+Ic9XtynpTKT/hVKOhVj/Xx2LXgDCRxN8bCWEXSS4GPRpSfqV8J2KUeuic+36eI/EfDbSNk/
X-Gm-Gg: AYBFou1/OKd0UTi3Go+9snBYBJXEffLiGWgsdzGuxa1nfJwN5k2rPgwskj2eQi1eSdt
	uK3Ki/8mf23sVW2/4rMg1SIAW7lwjn/IrzUBK21miDU4leLDt0bOZjOXmODzhoT50AyHW4zMmYm
	zAKplgn5C5HSP4E38BhUQTfnvkprv8ohcP0f3OqCmqLRup9oV9nkjKifTA4i6+RwxPOGv4MOkrt
	XigC1UOkL3uolh9BrnUfRrgd1K/FhpUWPboQrK0s7cxeA5FIh+Jus2s2YtvBMgqLw2zt5p+CBbE
	7bFqypxYy8c5xTrIZEFHse4dZsddFYOyiW4t/mbBlyFBXoj3DbvW/gDhJ5LjXHvDd1b8yXA0ne4
	jVnYMAoV8QrXaQ0FOT/Dz/TC+FqO4jjo6CqKR2LEdy7KQ8cL6cbbk7CCWVYw1/SVFnOK+1HJXeD
	mNMUJnn7xJ//Z/2+Il2LSPhOSYt6FWCcRQeCDy3dPqz+952/TPy+VzdaYou6VPjMmqk4yXouSOK
	ci6XCNU7Y26+ibFR6pCyotx7Ec7F85Bg6XWqZ2UKEQdwOAaT52IyRTUXDbC/Kdhi8qXVqWrAxzP
	vYQRkYrxftN1zqppJAdT90AVF4a9pgVR+CQcSRorYS0zP/g9pP58nB+jbq7F6r3f7Q2jEXKvRKJ
	+1aafa83Bduh94z3FbFWgYzekg0Y2TFtaPosDMVRiT4+g/5gROG1oUd+ZfDezd68Fgg==
X-Received: by 2002:a05:600c:1907:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b55c8743d8mr49455515e9.3.1793887846817;
        Thu, 05 Nov 2026 06:10:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm82347785e9.8.2026.11.05.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:10:45 -0800 (PST)
Date: Thu, 5 Nov 2026 17:10:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 390/390]
 kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable
 dereferenced before check 'buffer' (see line 2172)
Message-ID: <auyOYRv7V49kTSJ5@stanley.mountain>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: 5ecbcb61e172d82faf1bd8c00b17837d3c658c59 [390/390] ANDROID: ring-buffer: Introducing external writer support
config: i386-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051422.WODTXWDt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611051422.WODTXWDt-lkp@intel.com/

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
Unchecked dereference

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

