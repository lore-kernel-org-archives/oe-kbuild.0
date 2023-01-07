Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E78195E9;
	Sat,  7 Jan 2023 08:42:10 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id m7so3245750wrn.10;
        Sat, 07 Jan 2023 00:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTXvAq3zSmq0I6sQ8T0o7ipRdLy24L2DpRJ+dLSqhi4=;
        b=LHbgH9AcQmO9EQflvXO6Efm+vQRDEYv0aSkepmPpy7/0eqhiUXDqkYovHvIinAgjRg
         +pT3u2cK4Qc7+YIHbYjW+qCkjrtEpugRELIJaHR4dLLXtJzCGrQ0/9sZevMh9xU2Zdty
         1geGdCMed1t9DaD/WhyKjghKuw9Uxoge/TvNdkYngiMI/nVlB8XnVu1ZafrvvUL5j90Y
         wnX9FU7gw9ekwrRssFSSvk74aDOLco6hB0Xll+OT3hgEEzG7j50It46JBYu0L1nY/GGB
         WMBD+PEKKSdYAuF7YXhMm+sTwpJxh383fdf95wFe/tg2Toi53aY8RPUL+1DVfY+9lFLm
         zhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTXvAq3zSmq0I6sQ8T0o7ipRdLy24L2DpRJ+dLSqhi4=;
        b=zNR0L1z4DobToODzWv8wZltYFUZO3uIxlXfTYSjY3ITwSyMIbHvVAP/yPTURWwBwXg
         ogf4AHeScnu/YhflswkYWrT109uid+5Y4FTcxkPytMQXq2RiIsbChpDbE/L3HzBB8VRG
         SnfGmOEp2t+3WHjvc8SmCrkOZD5XvLjqpi+t5ZiyTiyg6TouQIQX6dsSFeS0j7azjqBQ
         JBSjlrH590yU+EsaiNC/ndCSYVVqQ0nOM6F5jXvQXHT5JuLPux0XTzS8Ol7o1NhnQWPc
         dT5D6FFKEqmK6YIZrYeQPgGmYajsPavI68rI0PkZMDGDqXRmsomm9Osw5hqYwS9e35gS
         VKYw==
X-Gm-Message-State: AFqh2koPZOabl7uQIROSrdoulHarkscyVlaUAsuxr6RqyUBOtmwNjkts
	hwWDLqNNP+CSt99bWfEocIcqdtrTW1awFEMH
X-Google-Smtp-Source: AMrXdXvdeRIQC8Ez95pk94S6ooycoEvMbEz/kIhMbUftEdqPTglJS8fHRVbWjoWq48aoC7OLNU3DAw==
X-Received: by 2002:adf:eb01:0:b0:242:4c00:f544 with SMTP id s1-20020adfeb01000000b002424c00f544mr34282430wrn.45.1673080928587;
        Sat, 07 Jan 2023 00:42:08 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b0027323b19ecesm3287527wrt.16.2023.01.07.00.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 00:42:08 -0800 (PST)
Date: Sat, 7 Jan 2023 11:42:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 14/27] kernel/bpf/trampoline.c:1276
 trampoline_multi_split() warn: passing zero to 'PTR_ERR'
Message-ID: <202301070944.r0WRbhsk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230107084204.050tug925i_hlv-qC41_pmRBTp3vZAcP7Q_XveWBX88@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   45ca925f42727b7feae7acd15e47534a1f9693b7
commit: e2296e57b24595cf947b9fefa78ef3f73334ed3c [14/27] bpf: Add support to attach multi trampolines
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/bpf/trampoline.c:1276 trampoline_multi_split() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1276 kernel/bpf/trampoline.c

e2296e57b24595 Jiri Olsa 2023-01-04  1262  static int
e2296e57b24595 Jiri Olsa 2023-01-04  1263  trampoline_multi_split(struct bpf_trampoline *tr, struct btf_bitmap *and,
e2296e57b24595 Jiri Olsa 2023-01-04  1264  		       struct bpf_tramp_prog *tp, struct list_head *rollback)
e2296e57b24595 Jiri Olsa 2023-01-04  1265  {
e2296e57b24595 Jiri Olsa 2023-01-04  1266  	struct btf_bitmap *bmap_rollback = NULL;
e2296e57b24595 Jiri Olsa 2023-01-04  1267  	struct bpf_trampoline *tr_new;
e2296e57b24595 Jiri Olsa 2023-01-04  1268  	int err;
e2296e57b24595 Jiri Olsa 2023-01-04  1269  
e2296e57b24595 Jiri Olsa 2023-01-04  1270  	bmap_rollback = btf_bitmap_funcs_alloc();
e2296e57b24595 Jiri Olsa 2023-01-04  1271  	if (!bmap_rollback)
e2296e57b24595 Jiri Olsa 2023-01-04  1272  		return -ENOMEM;
e2296e57b24595 Jiri Olsa 2023-01-04  1273  
e2296e57b24595 Jiri Olsa 2023-01-04  1274  	tr_new = trampoline_multi_split_trampoline(tr, and);
e2296e57b24595 Jiri Olsa 2023-01-04  1275  	if (!tr_new) {
e2296e57b24595 Jiri Olsa 2023-01-04 @1276  		err = PTR_ERR(tr_new);

This is zero.  Needs to be err = -ENOMEM; or something.

e2296e57b24595 Jiri Olsa 2023-01-04  1277  		goto error_bmap;
e2296e57b24595 Jiri Olsa 2023-01-04  1278  	}
e2296e57b24595 Jiri Olsa 2023-01-04  1279  
e2296e57b24595 Jiri Olsa 2023-01-04  1280  	err = bpf_trampoline_link_prog(tp, tr_new);
e2296e57b24595 Jiri Olsa 2023-01-04  1281  	if (err)
e2296e57b24595 Jiri Olsa 2023-01-04  1282  		goto error_tr;
e2296e57b24595 Jiri Olsa 2023-01-04  1283  
e2296e57b24595 Jiri Olsa 2023-01-04  1284  	btf_bitmap_copy(bmap_rollback, tr->multi.bmap);
e2296e57b24595 Jiri Olsa 2023-01-04  1285  	btf_bitmap_andnot(tr->multi.bmap, tr->multi.bmap, and);
e2296e57b24595 Jiri Olsa 2023-01-04  1286  	tr->rollback.bmap = bmap_rollback;
e2296e57b24595 Jiri Olsa 2023-01-04  1287  
e2296e57b24595 Jiri Olsa 2023-01-04  1288  	err = trampoline_multi_reset_bmap(tr, rollback);
e2296e57b24595 Jiri Olsa 2023-01-04  1289  	if (err)
e2296e57b24595 Jiri Olsa 2023-01-04  1290  		goto error_tr;
e2296e57b24595 Jiri Olsa 2023-01-04  1291  
e2296e57b24595 Jiri Olsa 2023-01-04  1292  	tr_new->rollback.free = true;
e2296e57b24595 Jiri Olsa 2023-01-04  1293  	list_add_tail(&tr_new->rollback.list, &tr->rollback.list);
e2296e57b24595 Jiri Olsa 2023-01-04  1294  	return err;
e2296e57b24595 Jiri Olsa 2023-01-04  1295  
e2296e57b24595 Jiri Olsa 2023-01-04  1296  error_tr:
e2296e57b24595 Jiri Olsa 2023-01-04  1297  	bpf_trampoline_free(tr_new);
e2296e57b24595 Jiri Olsa 2023-01-04  1298  error_bmap:
e2296e57b24595 Jiri Olsa 2023-01-04  1299  	btf_bitmap_free(bmap_rollback);
e2296e57b24595 Jiri Olsa 2023-01-04  1300  	return err;
e2296e57b24595 Jiri Olsa 2023-01-04  1301  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

