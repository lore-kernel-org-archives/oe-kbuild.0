Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EEF1A732
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYdmJxyB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-332c09c0b0bso1099556f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 05:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700487674; x=1701092474; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XjBkr21Oh+8TyMSbYH6S/sYU1/zxB0sEswwi1F3bVOk=;
        b=QYdmJxyB4MkK2pxQBFtKvfY8t0ZhXv3mpNRRtPBtTATJlr7C3XuhfBve45k91+6qcD
         7hD/hkqkhu9sTWZ9YTGwN8p62dZ21Vo/Y1JnGdyrDYWzVTg05bhGf5fRnPAzzue9IlMD
         CYMq7BzUofeXsYtQ3yivFQRAE8RLeqNvTUYE8favUdPBU1EEh8o+dZ5l9BpsXumExj/b
         lgGnABTlzDvlMRpkdsCTA7kp/DAY44MnNFkDvuaewDHW710oekC9Hc5yQv5nJFRlmTP9
         cw5R+js+pXqsFA++mj8v9bk76AKur/ENL8I/yv6prkcydy2li9064OpU6uqOEG8pHiYT
         bh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700487674; x=1701092474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:date:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjBkr21Oh+8TyMSbYH6S/sYU1/zxB0sEswwi1F3bVOk=;
        b=PDnftq4flPjxx+XCdsCRNvzwMvuhWh68v5MkNaXGOjt0+5chdJKIATfLvQqLaqhdCx
         rhscoob84E1GDxoO6iyGBuuHz0PaWapEQ0m4ayW9Vikt9jjJ+doc3bEk7vdYA0Cu4ILx
         vCnvP2taxC/etR8nWHYrFoRh8C0CMtTlauiKba/qYmIgriXGIvR/ApTKN4KwDXGRlKz9
         SCb0Fr4f/rTfdcHqaDEHUDVW63es4sjsbZT+wx3gRsHlSnovS+dyDpeEpBJxGPt3soDT
         mVLpwJDJwX0165tvJabrjROn6x3btuQTbci+Cp3lYvYyHLTYhNZ2T/jTe7dhp4UgAOim
         SmbA==
X-Gm-Message-State: AOJu0YzNR65wLqJLTwcrHk7L8tT8/njDGQj0ugyYUPZtb2mzsvjd9hf7
	RTb4ZE+kLxo9gA27EU4c1XlbaQy1asPgL9PTAfs=
X-Google-Smtp-Source: AGHT+IFkG+nq+uSb/rp8gDsM+ky0iDyq3HSCnoc332AgQohqOf/1kFe6nt/3O4RgQ/lwfXeGvQ0ryg==
X-Received: by 2002:a5d:64af:0:b0:331:3c88:6fcd with SMTP id m15-20020a5d64af000000b003313c886fcdmr5856385wrp.53.1700487673499;
        Mon, 20 Nov 2023 05:41:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d55cb000000b003143867d2ebsm11229521wrw.63.2023.11.20.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:41:13 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 08:41:10 -0500
To: oe-kbuild@lists.linux.dev, Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next] bpf: Relax tracing prog recursive attach
 rules
Message-ID: <f03d7ce6-e603-4ead-8a67-8d424a4420d6@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114084118.11095-1-9erthalion6@gmail.com>

Hi Dmitrii,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitrii-Dolgov/bpf-Relax-tracing-prog-recursive-attach-rules/20231114-164631
base:   100888fb6d8a185866b1520031ee7e3182b173de
patch link:    https://lore.kernel.org/r/20231114084118.11095-1-9erthalion6%40gmail.com
patch subject: [RFC PATCH bpf-next] bpf: Relax tracing prog recursive attach rules
config: i386-randconfig-141-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191719.Pa8d0Ly9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191719.Pa8d0Ly9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311191719.Pa8d0Ly9-lkp@intel.com/

smatch warnings:
kernel/bpf/syscall.c:3241 bpf_tracing_prog_attach() error: we previously assumed 'tgt_prog' could be null (see line 3186)

vim +/tgt_prog +3241 kernel/bpf/syscall.c

4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3096  static int bpf_tracing_prog_attach(struct bpf_prog *prog,
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3097  				   int tgt_prog_fd,
2fcc82411e74e5 Kui-Feng Lee           2022-05-10  3098  				   u32 btf_id,
2fcc82411e74e5 Kui-Feng Lee           2022-05-10  3099  				   u64 bpf_cookie)
fec56f5890d93f Alexei Starovoitov     2019-11-14  3100  {
a3b80e1078943d Andrii Nakryiko        2020-04-28  3101  	struct bpf_link_primer link_primer;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3102  	struct bpf_prog *tgt_prog = NULL;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3103  	struct bpf_trampoline *tr = NULL;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3104  	struct bpf_tracing_link *link;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3105  	u64 key = 0;
a3b80e1078943d Andrii Nakryiko        2020-04-28  3106  	int err;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3107  
9e4e01dfd3254c KP Singh               2020-03-29  3108  	switch (prog->type) {
9e4e01dfd3254c KP Singh               2020-03-29  3109  	case BPF_PROG_TYPE_TRACING:
fec56f5890d93f Alexei Starovoitov     2019-11-14  3110  		if (prog->expected_attach_type != BPF_TRACE_FENTRY &&
be8704ff07d237 Alexei Starovoitov     2020-01-20  3111  		    prog->expected_attach_type != BPF_TRACE_FEXIT &&
9e4e01dfd3254c KP Singh               2020-03-29  3112  		    prog->expected_attach_type != BPF_MODIFY_RETURN) {
9e4e01dfd3254c KP Singh               2020-03-29  3113  			err = -EINVAL;
9e4e01dfd3254c KP Singh               2020-03-29  3114  			goto out_put_prog;
9e4e01dfd3254c KP Singh               2020-03-29  3115  		}
9e4e01dfd3254c KP Singh               2020-03-29  3116  		break;
9e4e01dfd3254c KP Singh               2020-03-29  3117  	case BPF_PROG_TYPE_EXT:
9e4e01dfd3254c KP Singh               2020-03-29  3118  		if (prog->expected_attach_type != 0) {
9e4e01dfd3254c KP Singh               2020-03-29  3119  			err = -EINVAL;
9e4e01dfd3254c KP Singh               2020-03-29  3120  			goto out_put_prog;
9e4e01dfd3254c KP Singh               2020-03-29  3121  		}
9e4e01dfd3254c KP Singh               2020-03-29  3122  		break;
9e4e01dfd3254c KP Singh               2020-03-29  3123  	case BPF_PROG_TYPE_LSM:
9e4e01dfd3254c KP Singh               2020-03-29  3124  		if (prog->expected_attach_type != BPF_LSM_MAC) {
9e4e01dfd3254c KP Singh               2020-03-29  3125  			err = -EINVAL;
9e4e01dfd3254c KP Singh               2020-03-29  3126  			goto out_put_prog;
9e4e01dfd3254c KP Singh               2020-03-29  3127  		}
9e4e01dfd3254c KP Singh               2020-03-29  3128  		break;
9e4e01dfd3254c KP Singh               2020-03-29  3129  	default:
fec56f5890d93f Alexei Starovoitov     2019-11-14  3130  		err = -EINVAL;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3131  		goto out_put_prog;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3132  	}
fec56f5890d93f Alexei Starovoitov     2019-11-14  3133  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3134  	if (!!tgt_prog_fd != !!btf_id) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3135  		err = -EINVAL;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3136  		goto out_put_prog;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3137  	}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3138  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3139  	if (tgt_prog_fd) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3140  		/* For now we only allow new targets for BPF_PROG_TYPE_EXT */
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3141  		if (prog->type != BPF_PROG_TYPE_EXT) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3142  			err = -EINVAL;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3143  			goto out_put_prog;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3144  		}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3145  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3146  		tgt_prog = bpf_prog_get(tgt_prog_fd);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3147  		if (IS_ERR(tgt_prog)) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3148  			err = PTR_ERR(tgt_prog);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3149  			tgt_prog = NULL;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3150  			goto out_put_prog;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3151  		}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3152  
22dc4a0f5ed11b Andrii Nakryiko        2020-12-03  3153  		key = bpf_trampoline_compute_key(tgt_prog, NULL, btf_id);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3154  	}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3155  
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3156  	link = kzalloc(sizeof(*link), GFP_USER);
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3157  	if (!link) {
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3158  		err = -ENOMEM;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3159  		goto out_put_prog;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3160  	}
f7e0beaf39d386 Kui-Feng Lee           2022-05-10  3161  	bpf_link_init(&link->link.link, BPF_LINK_TYPE_TRACING,
f2e10bff16a0fd Andrii Nakryiko        2020-04-28  3162  		      &bpf_tracing_link_lops, prog);
f2e10bff16a0fd Andrii Nakryiko        2020-04-28  3163  	link->attach_type = prog->expected_attach_type;
2fcc82411e74e5 Kui-Feng Lee           2022-05-10  3164  	link->link.cookie = bpf_cookie;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3165  
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3166  	mutex_lock(&prog->aux->dst_mutex);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3167  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3168  	/* There are a few possible cases here:
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3169  	 *
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3170  	 * - if prog->aux->dst_trampoline is set, the program was just loaded
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3171  	 *   and not yet attached to anything, so we can use the values stored
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3172  	 *   in prog->aux
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3173  	 *
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3174  	 * - if prog->aux->dst_trampoline is NULL, the program has already been
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3175           *   attached to a target and its initial target was cleared (below)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3176  	 *
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3177  	 * - if tgt_prog != NULL, the caller specified tgt_prog_fd +
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3178  	 *   target_btf_id using the link_create API.
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3179  	 *
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3180  	 * - if tgt_prog == NULL when this function was called using the old
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3181  	 *   raw_tracepoint_open API, and we need a target from prog->aux
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3182  	 *
f3a95075549e0e Jiri Olsa              2021-04-14  3183  	 * - if prog->aux->dst_trampoline and tgt_prog is NULL, the program
f3a95075549e0e Jiri Olsa              2021-04-14  3184  	 *   was detached and is going for re-attachment.

There is a giant comment here explaining how tgt_prog can be NULL.
I read it but I lack some context.

4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3185  	 */
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29 @3186  	if (!prog->aux->dst_trampoline && !tgt_prog) {
                                                                                                  ^^^^^^^^^

f3a95075549e0e Jiri Olsa              2021-04-14  3187  		/*
f3a95075549e0e Jiri Olsa              2021-04-14  3188  		 * Allow re-attach for TRACING and LSM programs. If it's
f3a95075549e0e Jiri Olsa              2021-04-14  3189  		 * currently linked, bpf_trampoline_link_prog will fail.
f3a95075549e0e Jiri Olsa              2021-04-14  3190  		 * EXT programs need to specify tgt_prog_fd, so they
f3a95075549e0e Jiri Olsa              2021-04-14  3191  		 * re-attach in separate code path.
f3a95075549e0e Jiri Olsa              2021-04-14  3192  		 */
f3a95075549e0e Jiri Olsa              2021-04-14  3193  		if (prog->type != BPF_PROG_TYPE_TRACING &&
f3a95075549e0e Jiri Olsa              2021-04-14  3194  		    prog->type != BPF_PROG_TYPE_LSM) {
f3a95075549e0e Jiri Olsa              2021-04-14  3195  			err = -EINVAL;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3196  			goto out_unlock;
babf3164095b06 Andrii Nakryiko        2020-03-09  3197  		}
f3a95075549e0e Jiri Olsa              2021-04-14  3198  		btf_id = prog->aux->attach_btf_id;
f3a95075549e0e Jiri Olsa              2021-04-14  3199  		key = bpf_trampoline_compute_key(NULL, prog->aux->attach_btf, btf_id);
f3a95075549e0e Jiri Olsa              2021-04-14  3200  	}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3201  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3202  	if (!prog->aux->dst_trampoline ||
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3203  	    (key && key != prog->aux->dst_trampoline->key)) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3204  		/* If there is no saved target, or the specified target is
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3205  		 * different from the destination specified at load time, we
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3206  		 * need a new trampoline and a check for compatibility
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3207  		 */
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3208  		struct bpf_attach_target_info tgt_info = {};
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3209  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3210  		err = bpf_check_attach_target(NULL, prog, tgt_prog, btf_id,
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3211  					      &tgt_info);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3212  		if (err)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3213  			goto out_unlock;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3214  
31bf1dbccfb0a9 Viktor Malik           2023-03-10  3215  		if (tgt_info.tgt_mod) {
31bf1dbccfb0a9 Viktor Malik           2023-03-10  3216  			module_put(prog->aux->mod);
31bf1dbccfb0a9 Viktor Malik           2023-03-10  3217  			prog->aux->mod = tgt_info.tgt_mod;
31bf1dbccfb0a9 Viktor Malik           2023-03-10  3218  		}
31bf1dbccfb0a9 Viktor Malik           2023-03-10  3219  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3220  		tr = bpf_trampoline_get(key, &tgt_info);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3221  		if (!tr) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3222  			err = -ENOMEM;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3223  			goto out_unlock;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3224  		}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3225  	} else {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3226  		/* The caller didn't specify a target, or the target was the
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3227  		 * same as the destination supplied during program load. This
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3228  		 * means we can reuse the trampoline and reference from program
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3229  		 * load time, and there is no need to allocate a new one. This
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3230  		 * can only happen once for any program, as the saved values in
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3231  		 * prog->aux are cleared below.
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3232  		 */
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3233  		tr = prog->aux->dst_trampoline;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3234  		tgt_prog = prog->aux->dst_prog;

tgt_prog is re-assigned here.  Maybe the this covers all the NULL
cases.

4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3235  	}
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3236  
f7e0beaf39d386 Kui-Feng Lee           2022-05-10  3237  	err = bpf_link_prime(&link->link.link, &link_primer);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3238  	if (err)
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3239  		goto out_unlock;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3240  
26a0833438cdde Dmitrii Dolgov         2023-11-14 @3241  	tgt_prog->aux->followed = true;
                                                                ^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference

26a0833438cdde Dmitrii Dolgov         2023-11-14  3242  	prog->aux->attach_depth = tgt_prog->aux->attach_depth + 1;

Second unchecked dereference here

f7e0beaf39d386 Kui-Feng Lee           2022-05-10  3243  	err = bpf_trampoline_link_prog(&link->link, tr);
babf3164095b06 Andrii Nakryiko        2020-03-09  3244  	if (err) {
a3b80e1078943d Andrii Nakryiko        2020-04-28  3245  		bpf_link_cleanup(&link_primer);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3246  		link = NULL;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3247  		goto out_unlock;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3248  	}
babf3164095b06 Andrii Nakryiko        2020-03-09  3249  
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3250  	link->tgt_prog = tgt_prog;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3251  	link->trampoline = tr;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3252  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3253  	/* Always clear the trampoline and target prog from prog->aux to make
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3254  	 * sure the original attach destination is not kept alive after a
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3255  	 * program is (re-)attached to another target.
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3256  	 */
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3257  	if (prog->aux->dst_prog &&
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3258  	    (tgt_prog_fd || tr != prog->aux->dst_trampoline))
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3259  		/* got extra prog ref from syscall, or attaching to different prog */
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3260  		bpf_prog_put(prog->aux->dst_prog);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3261  	if (prog->aux->dst_trampoline && tr != prog->aux->dst_trampoline)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3262  		/* we allocated a new trampoline, so free the old one */
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3263  		bpf_trampoline_put(prog->aux->dst_trampoline);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3264  
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3265  	prog->aux->dst_prog = NULL;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3266  	prog->aux->dst_trampoline = NULL;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3267  	mutex_unlock(&prog->aux->dst_mutex);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3268  
a3b80e1078943d Andrii Nakryiko        2020-04-28  3269  	return bpf_link_settle(&link_primer);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3270  out_unlock:
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3271  	if (tr && tr != prog->aux->dst_trampoline)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3272  		bpf_trampoline_put(tr);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3273  	mutex_unlock(&prog->aux->dst_mutex);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3274  	kfree(link);
fec56f5890d93f Alexei Starovoitov     2019-11-14  3275  out_put_prog:
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3276  	if (tgt_prog_fd && tgt_prog)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3277  		bpf_prog_put(tgt_prog);
fec56f5890d93f Alexei Starovoitov     2019-11-14  3278  	return err;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3279  }
fec56f5890d93f Alexei Starovoitov     2019-11-14  3280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

