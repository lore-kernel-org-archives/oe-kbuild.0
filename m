Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F306FF9E6
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 05:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O33n36xv"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3334d9b57adso284567f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 05 Dec 2023 21:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701840856; x=1702445656; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhwBXXMgpHRCa7LQMG5xlDEGQwNAh/cE1AqtxH7qtbE=;
        b=O33n36xv2EOmjMRJaNULz8j/MMMPuQepMjhCTySX7Ecy+4mUz/q6Ghs2Sk5DOhcm3o
         LVKcArReO4KV0jwDQ4LO3YI9kNm+vH0jxs4yNfFDNOxmTjh2CcVIHIa+IOidSNb7Jo8Z
         zoBfxMF0Ly8bdYCc4vAEBhSTZqQcj2jYErrKPay/vvJy+ENC9gAmILVcoki47rohDGkU
         YTlrEpCuwybyVgJW7z1uQIOtlhSq8jH6JvvAHMZmp1dv0E7DFNhtMsEnLh+aVegWB9Zi
         77MfW/xLXNT+UohUS+CMlM9QGoYs+Eo90b+brzj98ZiFcq9s3vwYN813jacLsiSRnCTN
         Bqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701840856; x=1702445656;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhwBXXMgpHRCa7LQMG5xlDEGQwNAh/cE1AqtxH7qtbE=;
        b=rYXiKpHpRe1SmeDskKL/lXsqtUkmZr2MVZzIQvz58VJhRXokhdNujgAV0xHF/Hotx9
         d9lw6dslcpnjx6f195tyaPefrKwYPeDaKfbq9xCGnKIwoYxYkiPa13BuQFe5woNbGGkI
         m9zdXx84cVUiMz/NfkMAepAE4Z+nrtXjiX1N7htg+6QfbRQASN/prx+9kPXTh7B3fvPv
         oCXKZ0DvqZnhKT+8osDi+LpV6xYgIEuDDdN0emtwdEogL5EbZw91SLkh+IXt6yHC/hLv
         1UOExHiEqdBY5s1MpQLtvvKF1CEPJtkZAPw9wJEJEjozLN4qs7bl3vntCgF/rVUcDNzU
         nKLQ==
X-Gm-Message-State: AOJu0Yz6qcNkLNMshIUR+mJpVYYe6NPmXcVODA2+6ZeyOLPZT7yjY0AO
	pClZEPIVYjhbbqzJIF/KY53KUL2IlYyxq+C4x5A=
X-Google-Smtp-Source: AGHT+IHpS3LVlFkoOpd1qUnn5oCHFYg028Cols201tRqsXQLIZxnZBGkSZ6CSAFX15SvIw4LnExMzw==
X-Received: by 2002:adf:ea50:0:b0:333:47eb:a278 with SMTP id j16-20020adfea50000000b0033347eba278mr138897wrn.80.1701840856558;
        Tue, 05 Dec 2023 21:34:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d17-20020adff851000000b0033335c011e0sm11548261wrq.63.2023.12.05.21.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 21:34:16 -0800 (PST)
Date: Wed, 6 Dec 2023 08:34:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jamal Hadi Salim <jhs@mojatatu.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, deb.chatterjee@intel.com,
	anjali.singhai@intel.com, namrata.limaye@intel.com,
	mleitner@redhat.com, Mahesh.Shirshyad@amd.com,
	tomasz.osinski@intel.com, jiri@resnulli.us,
	xiyou.wangcong@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, vladbu@nvidia.com,
	horms@kernel.org, khalidm@nvidia.com, toke@redhat.com,
	daniel@iogearbox.net, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v9 13/15] p4tc: add runtime table entry create,
 update, get, delete, flush and dump
Message-ID: <9dc10258-a370-4c8f-8099-36edf40b6f80@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201182904.532825-14-jhs@mojatatu.com>

Hi Jamal,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20231202-032940
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231201182904.532825-14-jhs%40mojatatu.com
patch subject: [PATCH net-next v9 13/15] p4tc: add runtime table entry create, update, get, delete, flush and dump
config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-ci/archive/20231205/202312052121.NV57fCuG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312052121.NV57fCuG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312052121.NV57fCuG-lkp@intel.com/

smatch warnings:
net/sched/p4tc/p4tc_tbl_entry.c:2555 p4tc_tbl_entry_dumpit() warn: can 'nl_path_attrs.pname' even be NULL?

vim +2555 net/sched/p4tc/p4tc_tbl_entry.c

0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2529  	pnatt = nla_reserve(skb, P4TC_ROOT_PNAME, P4TC_PIPELINE_NAMSIZ);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2530  	if (!pnatt)
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2531  		return -ENOMEM;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2532  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2533  	ids[P4TC_PID_IDX] = t_new->pipeid;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2534  	arg_ids = nla_data(tb[P4TC_PATH]);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2535  	memcpy(&ids[P4TC_TBLID_IDX], arg_ids, nla_len(tb[P4TC_PATH]));
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2536  	nl_path_attrs.ids = ids;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2537  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2538  	nl_path_attrs.pname = nla_data(pnatt);

nla_data() can't be NULL

0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2539  	if (!p_name) {
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2540  		/* Filled up by the operation or forced failure */
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2541  		memset(nl_path_attrs.pname, 0, P4TC_PIPELINE_NAMSIZ);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2542  		nl_path_attrs.pname_passed = false;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2543  	} else {
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2544  		strscpy(nl_path_attrs.pname, p_name, P4TC_PIPELINE_NAMSIZ);

And we dereference it

0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2545  		nl_path_attrs.pname_passed = true;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2546  	}
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2547  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2548  	root = nla_nest_start(skb, P4TC_ROOT);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2549  	ret = p4tc_table_entry_dump(net, skb, tb[P4TC_PARAMS], &nl_path_attrs,
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2550  				    cb, extack);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2551  	if (ret <= 0)
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2552  		goto out;
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2553  	nla_nest_end(skb, root);
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01  2554  
0d5bbed1381e54 Jamal Hadi Salim 2023-12-01 @2555  	if (nl_path_attrs.pname) {
                                                            ^^^^^^^^^^^^^^^^^^^
This NULL check can be removed.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

