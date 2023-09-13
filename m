Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A61A720
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 14:22:46 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-401f68602a8so74769785e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694614964; x=1695219764; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/cSQ/gn/9BlBHvzxrF6REhvWl10D040ztnlQ5APhF0=;
        b=LE4GoNjtWPG7N4O6Xy25p/pAbi3fYnF9YazQJSYbTiYl9AX5zwDueQF49QmqP5yUXv
         /6evO7JbmY4zSSyNcTxOlRw4bNFGWMo+3QNlFzjLwZnmbqrrNEWrSacTnT4T7plKKKMs
         RBY/hr50qi7ma8gO9IL1RastmnlR/aR2FK0Mxr5uwK00gpHMQ47xsxN5b2lcrNlMqbLM
         8XtbV08g8KyWTCfs5BaOG1dvKG1VhNkMfXsHj1lIs6maxDv5As93j+ES3TrkuhPITjhZ
         cPG8/I009hNeWtmQwNFpc9C6NJH3nx6GZEBX/057wVIxZEsDSRnTYGzEy97He88W76Fw
         DldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694614964; x=1695219764;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/cSQ/gn/9BlBHvzxrF6REhvWl10D040ztnlQ5APhF0=;
        b=VnnTRE75O3qvwVwH8C8wJCFnnmJ9rDbkvjpZPDnm3s5dLqRKXBRNodEDz0WsDDHw79
         2Qe4LKG9KHqENw9zcJCcTHNQUX6iPdyujVeM+8pSTHTzRO1AEMjBtnmJVtJ1Lzqe4KjX
         afX63hSnc/vIJb36Vg3ckpGDbmbHQ7QcJbmhtOogqvGtc/hqdI2ANWeXao5R3/Xs5NXk
         lNixmxzkEy8YU0e6YsIjH42CPjBMM+ZuNAIZFDDDRUcotqUq2twYQMA5enWajhUsmQtG
         K/9lR9chY71xsfx6qF33l+3QLh1JjdntcDbdc9KxPWvdO1/f6t/yYHNrwhE9tI8rsaCy
         KfVw==
X-Gm-Message-State: AOJu0YxNKM1OntavFg9X7rR+P91bpuyb8Q4llDodmOoDHlYKDQxVCzqp
	5zpXcmxYAF+L+nxGu3StTyazOfnny2HeZnwen4k=
X-Google-Smtp-Source: AGHT+IEPwGf+clK4WcSoiNwHgaX+aNXh5YG2dD20Nqb4GRlnoVZ0kOYrGUyvCg+A0teTMnx+yC0k1A==
X-Received: by 2002:a7b:c3cc:0:b0:3fe:1232:93fa with SMTP id t12-20020a7bc3cc000000b003fe123293famr2282744wmj.22.1694614964489;
        Wed, 13 Sep 2023 07:22:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g13-20020a7bc4cd000000b003fc02e8ea68sm2219370wmk.13.2023.09.13.07.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:22:44 -0700 (PDT)
Date: Wed, 13 Sep 2023 15:00:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Leon Hwang <hffilwlqm@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [linux-next:master 4799/4965] kernel/bpf/verifier.c:19778
 check_attach_btf_id() error: 'tr' dereferencing possible ERR_PTR()
Message-ID: <2af3eb60-d4fe-42dd-a34f-b85f2a0607f3@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e143016b56ecb0fcda5bb6026b0a25fe55274f56
commit: 2b5dcb31a19a2e0acd869b12c9db9b2d696ef544 [4799/4965] bpf, x64: Fix tailcall infinite loop
config: i386-randconfig-141-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131936.5Nc8eUD0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309131936.5Nc8eUD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309131936.5Nc8eUD0-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:19778 check_attach_btf_id() error: 'tr' dereferencing possible ERR_PTR()

vim +/tr +19778 kernel/bpf/verifier.c

f1b9509c2fb0ef Alexei Starovoitov     2019-10-30  19770  	}
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19771  
22dc4a0f5ed11b Andrii Nakryiko        2020-12-03  19772  	key = bpf_trampoline_compute_key(tgt_prog, prog->aux->attach_btf, btf_id);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19773  	tr = bpf_trampoline_get(key, &tgt_info);
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19774  	if (!tr)

bpf_trampoline_get() returns error pointers if CONFIG_BPF_JIT is turned
off.  We should make either return NULL in that case, or change
CONFIG_BPF_SYSCALL to depend on or select CONFIG_BPF_JIT.  Probably we
should do both honestly.

Normally when functions return a mix of error pointers and NULL the
error pointer means error and the NULL means the feature is disabled.
This code does is the reverse way.

f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19775  		return -ENOMEM;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19776  
2b5dcb31a19a2e Leon Hwang             2023-09-12  19777  	if (tgt_prog && tgt_prog->aux->tail_call_reachable)
2b5dcb31a19a2e Leon Hwang             2023-09-12 @19778  		tr->flags = BPF_TRAMP_F_TAIL_CALL_CTX;
2b5dcb31a19a2e Leon Hwang             2023-09-12  19779  
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  19780  	prog->aux->dst_trampoline = tr;
f7b12b6fea0098 Toke Høiland-Jørgensen 2020-09-25  19781  	return 0;
38207291604401 Martin KaFai Lau       2019-10-24  19782  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

