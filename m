Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109A67B;
	Sat, 24 Dec 2022 07:22:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id bs20so4196175wrb.3;
        Fri, 23 Dec 2022 23:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4ShmNi81uuThPTWqnrVAub86y1Jrhc97Rqkpl8I4yM=;
        b=GBcZTATjTAS0eGEoYj3hUawVQgcWMN6jL7P/NxU6L3286rrPR+1cQbwfrg7nUqvUuR
         19oVNYA/ctmb0mFid/MrH3K9LT90nfo2lt+nXtZl3g+QMLKp6nRNLo8YzzFn8IXpMF9q
         akYpEjfO/tvar01MPfKJ4mYLbgB1l0ctVYt5DPVfS+Oe3ebGcXsgluoduZlpARDBOvRM
         waVHfkAM5Xi6Vq9AKztJCrB3Ah0vO56ECo1EtzuavFQddWs4s2WcEWjxP4U1xo3OmegJ
         Y4Vo1nuWFV/HXwFz/vZ4GS1cN9koUA6NTTqctLnLw6sT43EeS5otlO0WvAyec96lByCE
         2fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a4ShmNi81uuThPTWqnrVAub86y1Jrhc97Rqkpl8I4yM=;
        b=IvYA4Xh/swIplTzlU9j49Mf2bafi5M+V858zW1hnDak7+I+OyrVGRNuA8hUZyBp4u7
         /p2o0ILkxd1SyqQkUCKE+xm/TVyGoOcilh3h9jJMj3DyNouLr667veOcAHdKDCMwwAd5
         E4ttJouOZGomCcCVfjeEQRvatSUBqYXq6qbNArwTFzTA2tqjek9bU0mn31SeDgLrKIzg
         acJ4TrCy1hluUrweEwA2lAjMUKeCDSCCZsK01TE2Dzeu7DNxNluMsCKpjMQy+dH5irzl
         i7+502qsTwuE6r5b8m6jM7FKo0wFMIlvhcCryMEhbjcRJiOsYK5C2As5EIRBGjsgyGFN
         PuRw==
X-Gm-Message-State: AFqh2krCl6nBzA+rwnzE1hsuJoEkrTeK4tNk/BAf5irW+gkQmI1X0/Ew
	Nmw6OOACoyu7qf4AG4vA/9Xlj/3x4sigpxKZ
X-Google-Smtp-Source: AMrXdXsIyAtjqvEfF5hAwKkRlpgSa2v3hGvssC24lnnnMVREsNdQHxHQOKrmFpOKXz7itBoksC4Pag==
X-Received: by 2002:a05:6000:694:b0:26c:e7a9:97a9 with SMTP id bo20-20020a056000069400b0026ce7a997a9mr8589637wrb.60.1671866545978;
        Fri, 23 Dec 2022 23:22:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm4923184wrv.1.2022.12.23.23.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 23:22:25 -0800 (PST)
Date: Sat, 24 Dec 2022 10:22:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_ng_2 9/23] kernel/bpf/btf.c:8458
 btf_bitmap_funcs_resolve() error: uninitialized symbol 'err'.
Message-ID: <202212241412.ws2atGo2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221224072222.rSdyaZIsNAbg-Pmm8aVfdM2kivSKD8UCkLQIsTkQOOM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_ng_2
head:   1d05e5fe0fc4ec5ff53db6c6ea0bdf93b00c708f
commit: 0b5c8f05fa46714bf0bd0ad80ed36a268f9b25d2 [9/23] bpf: Add btf_bitmap_funcs_resolve function
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/bpf/btf.c:8458 btf_bitmap_funcs_resolve() error: uninitialized symbol 'err'.
kernel/bpf/btf.c:8458 btf_bitmap_funcs_resolve() warn: possible memory leak of 'addrs'

vim +/err +8458 kernel/bpf/btf.c

0b5c8f05fa4671 Jiri Olsa 2022-12-20  8401  int btf_bitmap_funcs_resolve(struct btf_bitmap *bmap, unsigned long **paddrs)
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8402  {
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8403  	struct kallsyms_data args;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8404  	unsigned long bit, *addrs;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8405  	const struct btf_type *t;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8406  	struct resolve_id *rid;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8407  	const char *name;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8408  	struct btf *btf;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8409  	int i = 0, err;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8410  	u32 id;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8411  
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8412  	btf = bpf_get_btf_vmlinux();
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8413  	if (IS_ERR(btf))
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8414  		return PTR_ERR(btf);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8415  
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8416  	rid = kzalloc(bmap->cnt * sizeof(*rid), GFP_KERNEL);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8417  	addrs = kzalloc(bmap->cnt * sizeof(*addrs), GFP_KERNEL);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8418  	if (!rid || !addrs) {
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8419  		kfree(rid);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8420  		kfree(addrs);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8421  		return -ENOMEM;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8422  	}
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8423  
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8424  	for_each_set_bit(bit, bmap->bm, bmap->size) {
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8425  		id = btf->funcs_ids[bit];
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8426  
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8427  		t = btf_type_by_id(btf, id);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8428  		if (!t)
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8429  			goto out_free;

err not set.  addrs not freed.

0b5c8f05fa4671 Jiri Olsa 2022-12-20  8430  		name = btf_name_by_offset(btf, t->name_off);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8431  		if (!name)
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8432  			goto out_free;

also here.

0b5c8f05fa4671 Jiri Olsa 2022-12-20  8433  		rid[i].name = name;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8434  		rid[i].id = id;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8435  		i++;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8436  	}
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8437  
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8438  	sort(rid, bmap->cnt, sizeof(*rid), rid_name_cmp, NULL);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8439  
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8440  	args.rid = rid;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8441  	args.cnt = bmap->cnt;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8442  	args.found = 0;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8443  	kallsyms_on_each_symbol(kallsyms_callback, &args);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8444  
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8445  	sort(rid, bmap->cnt, sizeof(*rid), rid_id_cmp, NULL);
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8446  
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8447  	for (i = 0; i < bmap->cnt; i++) {
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8448  		if (!rid[i].addr) {
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8449  			err = -EINVAL;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8450  			goto out_free;

addrs not freed.

0b5c8f05fa4671 Jiri Olsa 2022-12-20  8451  		}
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8452  		addrs[i] = rid[i].addr;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8453  	}
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8454  	*paddrs = addrs;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8455  	err = 0;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8456  out_free:
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8457  	kfree(rid);
0b5c8f05fa4671 Jiri Olsa 2022-12-20 @8458  	return err;
0b5c8f05fa4671 Jiri Olsa 2022-12-20  8459  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

