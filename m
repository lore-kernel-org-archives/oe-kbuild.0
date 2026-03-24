Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D23DBD52
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343462; cv=none; b=I/uORAfBlPdpw5J+bva307I/n4Zg6v5grGRyCao1TrErtgyuxbh7R8Mt4gPCDcLQ7ls9T12R1MDRBq7ilFdJ3sJ29/gkJ74tKtzOU20eF0ByMDRHD2rrm+QXEW38nt/ktNc1G2gFde+oOuklUHK1/irBZkaI5KDFIeN1iz+HQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343462; c=relaxed/simple;
	bh=kdMOtPk2CJNdzK5TAPoFyAepYVoHlWSZWSQYeczlyIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PPyntqTEjR+f76xNKDR+8R43cmv4EGmQ0q1f1dRjzj4LT2Wrp5LZqim4WhWv1YL2BoxHhIFH/WKL6fiFTc327POMhXC/j/WBkMxPOe3u5MqULqiTRRGZGWPBdK/I9KHEgQzAVOF+gfHgVA2e39X4/4+h+IGfWJg8UbTH+2JjdAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eo5BJLvn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eo5BJLvn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso19977195e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774343454; x=1774948254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySFCnBOOL5CefvlohZg7FDp7ZB+X1Q7Muut2F1vaWbU=;
        b=eo5BJLvnO5HzkEInaN1YXqsTUSaRuYjQkm3E0qZe8P5LgVfRzSGgP3BqLSbFJc4/3V
         j9rR9dfLCQmT3uZrso0Ax2sIrBnx7gIHy3JqeMt5VlowFNfCa/KTuZW//NCeZdCUOe2+
         VRVwjnNwYhfbUGZK/6/LfpVDXHaYO7cri5Gyo2NGzITr+z1Ked0ycKL2jq/KDlFxeb4j
         yizfeMNIvPdxANcnFU0/edtaJBQ7KHDOT1xWUYPbaDM+E2dbnZHBQoC8Xi6M0GHO42a5
         ev2UeIy7yvXJn0FVqBxnGa0BJZVaUvZfDvkQfcUE5r/kBE/DBChAgxyaS6z5EdPgUhHw
         G3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343454; x=1774948254;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySFCnBOOL5CefvlohZg7FDp7ZB+X1Q7Muut2F1vaWbU=;
        b=Of440wzSr2MJ4K6acea9m2YHUjAnuQij0yuTgdiSYtIELQMuuqPTsAlTze/POqUbLf
         Ts0GFaIKUMT1D7FvbFmw7UmZvzfkM7deYcNhT/kvvHCmFydqjKW/1NhNrXwfvDo5YQcS
         xToxlU9Tuq+muCDzttfuFdrLxfaT8aw797JQWyPUBOGsqYLNfMA0glXn9rfLcIHcsoTq
         JXHIspnpjlodW07B1ETcafl7vOz0vnSZo2D1amVTdjediVih9qjDgsUQzZS4k0pZx32E
         gXSjyLBq1YfZ0R91bowKD6awwX825x3FXQV4K589/sysNqM84GoyKg4igHMVRVMZ3KYU
         Xiew==
X-Gm-Message-State: AOJu0Yw7BE53BghxaDkhfH7vPA3R4IkfczEIntSA3y4TlsT39Zmu45op
	u/rJwlwlDmyrJvYb0v02GBMEoUSgwfAUpQjqn4vvBDAwIpS29AIubKQopfRIMdOO+JykxycY8EQ
	+Z5Kx
X-Gm-Gg: ATEYQzwYMCk5LineK99qQo5B+gnvXvkoEX6RP2UkD9yAWqKlcX5ugErU5wxCr0fNYo0
	qqG3FkHbCdL5am79673Y4h3f1AGvHCREnjMjlbpJwlmKI2TQ11K1BFi0SCKlZqq2O85uwkRPadf
	KdA2fu4mLdu6V6h+OVqlvHojEpYPfqQ1VNlXG7DDDwuW978bBQJ4zDGwlm0P1p4G0PbO0CIYZPX
	jHDnHEKfs5P64pqJatXhOogav//O8fY9lGXtHujwDcehMq8CEXXANKPJA50Obos0BMI8zjaJ/I7
	mBBgv49hIW9J4Pnp3nlx470cOElsQRVFZbLpX6runoMOXPSRQhiFwIzuaweHEDGl5/ZJCA7Pb8N
	LvnpFytaQ9b5na+yHVoDqWk/UXYT8da2u1hHCHBtmUUHGWF+5xWnenqvojfm8O68yEzIXPJUn6R
	K9nb9SInCiM28j5WFx+CIcqqckIuneS+Q7vq7NG+s=
X-Received: by 2002:a05:600c:154b:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-4870f212c1emr37488815e9.13.1774343454041;
        Tue, 24 Mar 2026 02:10:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871174f2desm44785325e9.9.2026.03.24.02.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:10:53 -0700 (PDT)
Date: Tue, 24 Mar 2026 12:10:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Carlier <devnexen@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Carlier <devnexen@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/memcontrol: fix obj_cgroup leak in
 mem_cgroup_css_online() error path
Message-ID: <202603241635.qNXDPwjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322164943.37460-1-devnexen@gmail.com>
Message-ID: <20260324091049.dIEg2z0s7O4PNYnEXapm_MFGrl_wmZK1X1MUWksWWCg@z>

Hi David,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/David-Carlier/mm-memcontrol-fix-obj_cgroup-leak-in-mem_cgroup_css_online-error-path/20260324-010357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260322164943.37460-1-devnexen%40gmail.com
patch subject: [PATCH] mm/memcontrol: fix obj_cgroup leak in mem_cgroup_css_online() error path
config: arm64-randconfig-r072-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241635.qNXDPwjs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603241635.qNXDPwjs-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:4180 mem_cgroup_css_online() warn: variable dereferenced before check 'pn' (see line 4176)

vim +/pn +4180 mm/memcontrol.c

6f0df8e16eb543 Johannes Weiner  2023-08-23  4168  	 * regular ID destruction during offlining.
6f0df8e16eb543 Johannes Weiner  2023-08-23  4169  	 */
e77786b4682e69 Shakeel Butt     2025-12-25  4170  	xa_store(&mem_cgroup_private_ids, memcg->id.id, memcg, GFP_KERNEL);
6f0df8e16eb543 Johannes Weiner  2023-08-23  4171  
2f7dd7a4100ad4 Johannes Weiner  2014-10-02  4172  	return 0;
098fad3e1621cb Qi Zheng         2026-03-05  4173  free_objcg:
098fad3e1621cb Qi Zheng         2026-03-05  4174  	for_each_node(nid) {
098fad3e1621cb Qi Zheng         2026-03-05  4175  		struct mem_cgroup_per_node *pn = memcg->nodeinfo[nid];
59f75a1877fbf7 David Carlier    2026-03-22 @4176  		objcg = rcu_replace_pointer(pn->objcg, NULL, true);
                                                                                            ^^^^^^^^^
Dereference

59f75a1877fbf7 David Carlier    2026-03-22  4177  		if (objcg)
59f75a1877fbf7 David Carlier    2026-03-22  4178  			percpu_ref_kill(&objcg->refcnt);
098fad3e1621cb Qi Zheng         2026-03-05  4179  
4a2f95f5c79e02 Qi Zheng         2026-03-09 @4180  		if (pn && pn->orig_objcg) {
                                                                    ^^
Checked too late.

098fad3e1621cb Qi Zheng         2026-03-05  4181  			obj_cgroup_put(pn->orig_objcg);
4a2f95f5c79e02 Qi Zheng         2026-03-09  4182  			/*
02b5fc7885d9f8 Andrew Morton    2026-03-09  4183  			 * Reset pn->orig_objcg to NULL to prevent
02b5fc7885d9f8 Andrew Morton    2026-03-09  4184  			 * obj_cgroup_put() from being called again in
02b5fc7885d9f8 Andrew Morton    2026-03-09  4185  			 * __mem_cgroup_free().
4a2f95f5c79e02 Qi Zheng         2026-03-09  4186  			 */
4a2f95f5c79e02 Qi Zheng         2026-03-09  4187  			pn->orig_objcg = NULL;
4a2f95f5c79e02 Qi Zheng         2026-03-09  4188  		}
098fad3e1621cb Qi Zheng         2026-03-05  4189  	}
a0dd8b1942f5bf Muchun Song      2026-03-05  4190  	free_shrinker_info(memcg);
da0efe30944476 Muchun Song      2022-03-22  4191  offline_kmem:
da0efe30944476 Muchun Song      2022-03-22  4192  	memcg_offline_kmem(memcg);
e77786b4682e69 Shakeel Butt     2025-12-25  4193  	mem_cgroup_private_id_remove(memcg);
da0efe30944476 Muchun Song      2022-03-22  4194  	return -ENOMEM;
8cdea7c0545426 Balbir Singh     2008-02-07  4195  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

