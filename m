Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF41B1C13;
	Mon, 14 Nov 2022 08:25:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id i10so17767303ejg.6;
        Mon, 14 Nov 2022 00:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jt9bLyShei+o8NTYd5dKdmx0Fe7MZq46Y2on2pSwGzI=;
        b=jApq52DDpRE1Wb8kzNW4+M+UgmTyPX2v5F+xeJfj/FUVn78Q/M/O61GRNR184c8tdg
         iLOhhBALlP1L0CpOTvzC8DlwAPfjIj/+TJ118qwLkZdLBswuPM82SJt6jWQ7zS3ZsrfY
         RPpVOs1ZYcsfyiuw7H71344ggCpdYalE7rvbL4uNHFIkIYxLCu+cielMHrA4xb8UYV30
         dSRV0lnKe9ftz/lcfQ5EtXQrkZ8LUS8gRj5ePYOuqEmB3n/uTpIhxpU+RByYQufnpWEg
         x2lYeuBmx2MDXrGEF+bDXeCiX5ht5T/1QuWkU0URGwUclSB6Wy7Fdq7LHG594pXuxAav
         wF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jt9bLyShei+o8NTYd5dKdmx0Fe7MZq46Y2on2pSwGzI=;
        b=39QVA86mEoNMlvz1MrpvcDkCXgFE9FsLXDBMl2WB2agyR8Fpqd/TcXphms25WcM09t
         c+tBjHJnCyglKZ4RJ2VpzVljprk7ui93uRe0ws/ODufLYa3OfCYSk6ky6/b3z8HDA7wT
         vkZ/zmXCMPNSCAl7TrO5b7hzj83bmBxgs4QkDNlT+v1zCfCWvSOr6EbD9UdPcjgDyUa6
         7ptG6YFkmU2ZXet37ap4IOLlVYO5xXNwvZUmTZVM8524Vn55f/lBzuLo7PaW8oMnR5BO
         ftWJFn1SvLnKlVKBpQF4aX+5Cz6Oc+U5Zhdc2TtQtR2Q/GN0gwmMI929isNYGvjDGnZE
         wt+Q==
X-Gm-Message-State: ANoB5pmMq6hc83BqwfBCrN3Zvt5V8fb8lWFf/YoDoHkVXo3Xes9LfSH2
	Wwvm7I4zqFnEj7/SH/TEiNYboZe72KQjeQ==
X-Google-Smtp-Source: AA0mqf5gCIN5fyNWs7W2w8SGzESD/MD06+ArAgq4qThB22sIpKj/xFxPzGsQ2GDLmzW9JnLUlbXmZw==
X-Received: by 2002:a17:906:498b:b0:7ad:f270:c128 with SMTP id p11-20020a170906498b00b007adf270c128mr9450997eju.84.1668414305586;
        Mon, 14 Nov 2022 00:25:05 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090618a100b0077d6f628e14sm3838113ejf.83.2022.11.14.00.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 00:25:05 -0800 (PST)
Date: Mon, 14 Nov 2022 11:25:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Dave Marchevsky <davemarchevsky@meta.com>,
	Delyan Kratunov <delyank@meta.com>
Subject: Re: [PATCH bpf-next v6 11/26] bpf: Allow locking bpf_spin_lock in
 allocated objects
Message-ID: <202211140520.Q5kvXPSL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111193224.876706-12-memxor@gmail.com>
Message-ID: <20221114082501.-OcBE2yrl696UIZ34Yy_zOZahHaS96C4Lzz4TagFw48@z>

Hi Kumar,

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/Allocated-objects-BPF-linked-lists/20221112-033643
base:   e5659e4e19e49f1eac58bb07ce8bc2d78a89fe65
patch link:    https://lore.kernel.org/r/20221111193224.876706-12-memxor%40gmail.com
patch subject: [PATCH bpf-next v6 11/26] bpf: Allow locking bpf_spin_lock in allocated objects
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/bpf/verifier.c:5623 process_spin_lock() error: uninitialized symbol 'rec'.

vim +/rec +5623 kernel/bpf/verifier.c

d83525ca62cf8e Alexei Starovoitov      2019-01-31  5588  static int process_spin_lock(struct bpf_verifier_env *env, int regno,
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5589  			     bool is_lock)
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5590  {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5591  	struct bpf_reg_state *regs = cur_regs(env), *reg = &regs[regno];
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5592  	struct bpf_verifier_state *cur = env->cur_state;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5593  	bool is_const = tnum_is_const(reg->var_off);
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5594  	u64 val = reg->var_off.value;
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5595  	struct bpf_map *map = NULL;
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5596  	struct btf_record *rec;
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5597  	struct btf *btf = NULL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5598  
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5599  	if (!is_const) {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5600  		verbose(env,
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5601  			"R%d doesn't have constant offset. bpf_spin_lock has to be at the constant offset\n",
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5602  			regno);
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5603  		return -EINVAL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5604  	}
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5605  	if (reg->type == PTR_TO_MAP_VALUE) {
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5606  		map = reg->map_ptr;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5607  		if (!map->btf) {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5608  			verbose(env,
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5609  				"map '%s' has to have BTF in order to use bpf_spin_lock\n",
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5610  				map->name);
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5611  			return -EINVAL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5612  		}
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5613  		rec = map->record;
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5614  	} else {
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5615  		struct btf_struct_meta *meta;
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5616  
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5617  		btf = reg->btf;
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5618  		meta = btf_find_struct_meta(reg->btf, reg->btf_id);
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5619  		if (meta)
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5620  			rec = meta->record;

No else path.

425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5621  	}
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5622  
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12 @5623  	if (!btf_record_has_field(rec, BPF_SPIN_LOCK)) {
                                                                                          ^^^

425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5624  		verbose(env, "%s '%s' has no valid bpf_spin_lock\n", map ? "map" : "local",
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5625  			map ? map->name : "kptr");
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5626  		return -EINVAL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5627  	}
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5628  	if (rec->spin_lock_off != val + reg->off) {
db559117828d24 Kumar Kartikeya Dwivedi 2022-11-04  5629  		verbose(env, "off %lld doesn't point to 'struct bpf_spin_lock' that is at %d\n",
425ce908da14d5 Kumar Kartikeya Dwivedi 2022-11-12  5630  			val + reg->off, rec->spin_lock_off);
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5631  		return -EINVAL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5632  	}
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5633  	if (is_lock) {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5634  		if (cur->active_spin_lock) {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5635  			verbose(env,
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5636  				"Locking two bpf_spin_locks are not allowed\n");
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5637  			return -EINVAL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5638  		}
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5639  		cur->active_spin_lock = reg->id;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5640  	} else {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5641  		if (!cur->active_spin_lock) {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5642  			verbose(env, "bpf_spin_unlock without taking a lock\n");
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5643  			return -EINVAL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5644  		}
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5645  		if (cur->active_spin_lock != reg->id) {
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5646  			verbose(env, "bpf_spin_unlock of different lock\n");
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5647  			return -EINVAL;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5648  		}
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5649  		cur->active_spin_lock = 0;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5650  	}
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5651  	return 0;
d83525ca62cf8e Alexei Starovoitov      2019-01-31  5652  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

