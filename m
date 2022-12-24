Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F97B;
	Sat, 24 Dec 2022 07:20:39 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id bg10so4891532wmb.1;
        Fri, 23 Dec 2022 23:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDzcg9ryzCl3sNE6QHz4vlng6AJigncSKLcE77xpo4A=;
        b=NX7lpQo95erVGw6dHzdxh71YB9nwQjnl5hRk3EbAFYieFrVgjJfwhE1N/EXJQNPNEs
         D6PTlLVubnIAzxB1hS2Sxt5I9FAqbFmX7Ozxp0a34DQxXP0imnq7pIxLKkDKIMPmSA0x
         6Pbi2BrW6NYGqxwRE/p04jmOH7Q+N+v71PNFR0a6hPEfEXpU2xpKuRJklbCw9ALHcS83
         Fnz9g2K18xbuVCWMqBJXxhtpF0UDUlrh33SdbCgmJLatrMDP1onW06EJ6KWb1JeEcpmq
         5o1q5RsmYOQkb0RYTyl1+XVIq14DVunTWst5zGMYxD4M6wDOhri8cspvIb3VaENKqVYr
         xTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDzcg9ryzCl3sNE6QHz4vlng6AJigncSKLcE77xpo4A=;
        b=g9jplfcUhKv7Mco/RO8qiISi07nhyP5mWxqDifj76OVoskNQ7Mo2TE5xQtUOgRXIeU
         LSUnKb43NF3oK14qS/63cMpGDu5FnQOtgwolNWWZrABxcEa7MsKUSWAiBFEg0LQeqrU7
         SnDr5Y3eYICOusH//CwQg9Gj3IjBbjW0qehyoALpKDNhZ9FMI9pnD+aD3IgIWkYAIlNA
         LJIpT2mDkRKBkngtqOco5bsHbus0W0jDkpGtsjcS0+TGKdzND6IM9heukCfQeXW+RaDQ
         Vqn7gVQvL0hIzvZJ/uUVjIWdEJK9LWt72OGOhim7ffY8YhSUPN7afHDFD4EX8JTV6fnZ
         rXIA==
X-Gm-Message-State: AFqh2koxVSd5aFRdVR3oGeW9rDKUezgHGXFCNJEgXVWsPUm7V8lGRHWf
	6RjLVb22IMfvKrs9f2+PqyytUyBMEumSCD/F
X-Google-Smtp-Source: AMrXdXvuF3I/qIcSXL9ty9Pa9+SSb7nnNG7LRZPOovDDt0YBLGTyBZwDZQ8CHTYDfG6SaChZ7HUhJA==
X-Received: by 2002:a05:600c:348b:b0:3d1:f16b:30e6 with SMTP id a11-20020a05600c348b00b003d1f16b30e6mr8902772wmq.28.1671866437751;
        Fri, 23 Dec 2022 23:20:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q185-20020a1c43c2000000b003cff309807esm11715715wma.23.2022.12.23.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 23:20:37 -0800 (PST)
Date: Sat, 24 Dec 2022 10:20:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_ng_2 8/23] kernel/bpf/btf.c:8332
 btf_bitmap_funcs_read() error: uninitialized symbol 'err'.
Message-ID: <202212241233.JSU4ZiL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221224072034.WPeTd29ZFczQoAKcLbULIQig7w7G_kQFpOG81EiXkQM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_ng_2
head:   1d05e5fe0fc4ec5ff53db6c6ea0bdf93b00c708f
commit: becc9f8b25473feb2f95a4e0724b03f685c7e9d5 [8/23] bpf: Add bpf_bitmap object
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/bpf/btf.c:8332 btf_bitmap_funcs_read() error: uninitialized symbol 'err'.
kernel/bpf/btf.c:8343 btf_bitmap_funcs_test_bit() warn: signedness bug returning '(-4095)'

vim +/err +8332 kernel/bpf/btf.c

becc9f8b25473f Jiri Olsa 2022-10-10  8290  struct btf_bitmap *btf_bitmap_funcs_read(u32 __user *uids, u32 uids_cnt)
becc9f8b25473f Jiri Olsa 2022-10-10  8291  {
becc9f8b25473f Jiri Olsa 2022-10-10  8292  	struct btf_bitmap *bm;
becc9f8b25473f Jiri Olsa 2022-10-10  8293  	u32 id, i, *func;
becc9f8b25473f Jiri Olsa 2022-10-10  8294  	struct btf *btf;
becc9f8b25473f Jiri Olsa 2022-10-10  8295  	int err;
becc9f8b25473f Jiri Olsa 2022-10-10  8296  
becc9f8b25473f Jiri Olsa 2022-10-10  8297  	btf = bpf_get_btf_vmlinux();
becc9f8b25473f Jiri Olsa 2022-10-10  8298  	if (IS_ERR(btf))
becc9f8b25473f Jiri Olsa 2022-10-10  8299  		return ERR_CAST(btf);
becc9f8b25473f Jiri Olsa 2022-10-10  8300  
becc9f8b25473f Jiri Olsa 2022-10-10  8301  	bm = __btf_bitmap_funcs_alloc(btf);
becc9f8b25473f Jiri Olsa 2022-10-10  8302  	if (IS_ERR(bm))
becc9f8b25473f Jiri Olsa 2022-10-10  8303  		return bm;
becc9f8b25473f Jiri Olsa 2022-10-10  8304  
becc9f8b25473f Jiri Olsa 2022-10-10  8305  	if (uids_cnt >= bm->size)
becc9f8b25473f Jiri Olsa 2022-10-10  8306  		goto error;

err not set.

becc9f8b25473f Jiri Olsa 2022-10-10  8307  
becc9f8b25473f Jiri Olsa 2022-10-10  8308  	for (i = 0; i < uids_cnt; i++) {
becc9f8b25473f Jiri Olsa 2022-10-10  8309  		if (__get_user(id, uids + i)) {
becc9f8b25473f Jiri Olsa 2022-10-10  8310  			err = -EFAULT;
becc9f8b25473f Jiri Olsa 2022-10-10  8311  			goto error;
becc9f8b25473f Jiri Olsa 2022-10-10  8312  		}
becc9f8b25473f Jiri Olsa 2022-10-10  8313  		func = bsearch(&id, btf->funcs_ids, btf->funcs_size,
becc9f8b25473f Jiri Olsa 2022-10-10  8314  			      sizeof(*btf->funcs_ids), funcs_ids_cmp);
becc9f8b25473f Jiri Olsa 2022-10-10  8315  		if (!func) {
becc9f8b25473f Jiri Olsa 2022-10-10  8316  			err = -EINVAL;
becc9f8b25473f Jiri Olsa 2022-10-10  8317  			goto error;
becc9f8b25473f Jiri Olsa 2022-10-10  8318  		}
becc9f8b25473f Jiri Olsa 2022-10-10  8319  		id = func - btf->funcs_ids;
becc9f8b25473f Jiri Olsa 2022-10-10  8320  		if (WARN_ON_ONCE(id >= bm->size)) {
becc9f8b25473f Jiri Olsa 2022-10-10  8321  			err = -EINVAL;
becc9f8b25473f Jiri Olsa 2022-10-10  8322  			goto error;
becc9f8b25473f Jiri Olsa 2022-10-10  8323  		}
becc9f8b25473f Jiri Olsa 2022-10-10  8324  		bitmap_set(bm->bm, id, 1);
becc9f8b25473f Jiri Olsa 2022-10-10  8325  	}
becc9f8b25473f Jiri Olsa 2022-10-10  8326  
becc9f8b25473f Jiri Olsa 2022-10-10  8327  	bm->cnt = uids_cnt;
becc9f8b25473f Jiri Olsa 2022-10-10  8328  	return bm;
becc9f8b25473f Jiri Olsa 2022-10-10  8329  
becc9f8b25473f Jiri Olsa 2022-10-10  8330  error:
becc9f8b25473f Jiri Olsa 2022-10-10  8331  	kvfree(bm);
becc9f8b25473f Jiri Olsa 2022-10-10 @8332  	return ERR_PTR(err);
becc9f8b25473f Jiri Olsa 2022-10-10  8333  }
becc9f8b25473f Jiri Olsa 2022-10-10  8334  
becc9f8b25473f Jiri Olsa 2022-10-10  8335  bool btf_bitmap_funcs_test_bit(struct btf_bitmap *bmap, u32 id, bool clear)
becc9f8b25473f Jiri Olsa 2022-10-10  8336  {
becc9f8b25473f Jiri Olsa 2022-10-10  8337  	struct btf *btf;
becc9f8b25473f Jiri Olsa 2022-10-10  8338  	u32 *func;
becc9f8b25473f Jiri Olsa 2022-10-10  8339  	bool set;
becc9f8b25473f Jiri Olsa 2022-10-10  8340  
becc9f8b25473f Jiri Olsa 2022-10-10  8341  	btf = bpf_get_btf_vmlinux();
becc9f8b25473f Jiri Olsa 2022-10-10  8342  	if (IS_ERR(btf))
becc9f8b25473f Jiri Olsa 2022-10-10 @8343  		return PTR_ERR(btf);

This should be either return true or return false;

becc9f8b25473f Jiri Olsa 2022-10-10  8344  	func = bsearch(&id, btf->funcs_ids, btf->funcs_size,
becc9f8b25473f Jiri Olsa 2022-10-10  8345  		      sizeof(*btf->funcs_ids), funcs_ids_cmp);
becc9f8b25473f Jiri Olsa 2022-10-10  8346  	if (!func)
becc9f8b25473f Jiri Olsa 2022-10-10  8347  		return -EINVAL;
becc9f8b25473f Jiri Olsa 2022-10-10  8348  	id = func - btf->funcs_ids;
becc9f8b25473f Jiri Olsa 2022-10-10  8349  	set = test_bit(id, bmap->bm);
becc9f8b25473f Jiri Olsa 2022-10-10  8350  	if (set && clear)
becc9f8b25473f Jiri Olsa 2022-10-10  8351  		clear_bit(id, bmap->bm);
becc9f8b25473f Jiri Olsa 2022-10-10  8352  	return set;
becc9f8b25473f Jiri Olsa 2022-10-10  8353  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

