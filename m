Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F197E;
	Wed, 23 Nov 2022 05:54:21 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id e27so274381ejc.12;
        Tue, 22 Nov 2022 21:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAm5d62QkjenIBG033RUZc/dNRbF6IVcc5rILZTrK7w=;
        b=kwKZPE8Qzcj68P+kuMYeKIgx0zFlkHk5G8SwLeLljT9QgAr8+4vH5VVxsdKSyWXVQH
         bIDjwq5gelJZ2MRQ87prQvOGLRLeTRihjY8JcvNICI72Ze2X9/hp+hbQ+bOZGhfTCp6R
         gBTk3NoiBrWOFKSDSOiflWFU9g/pzr1UiBhd4u6l/rzZVEjNdD4ftBA2k0SYCXwDKCgp
         CxfdKPTGLO7x45e/dDFIIcp0q8a91iWNYIKdHnLMZHSJAytnd2vh1AVbeX7zMnZIK9KO
         lfd+SB34/Xby7vs1gm9JiQUM3ulT4ZOjrZIwfTrzKRupMcWSPpHrDJVprO3sVtm+qkXA
         OtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAm5d62QkjenIBG033RUZc/dNRbF6IVcc5rILZTrK7w=;
        b=dt5+tYpXJxSah7KKwC0TbGPcGGukytimiDnwZJuCuFGKIusUrxyiaXN3DK4AfhIajh
         2sorF+mhA7pw2kk9lXYLuTjVDQhkVqtx4AQqg7kxylHM9okDHuK4D1UXltB2oloqrKqq
         4Q5iDTuEHK8eQZxTG5ihIBwNt43VwU+f0FeuMSm+Ve+e3qL6Vu0rkN/1reffVVt4QPWn
         KASqQGn0GJbiCAf/uN5jC4fmn83mnSV1k1EzBlQVgU0WCE1nnlfXDj/Q5NPLQVQuGAct
         leCmCP86MVPiwnGIy35gmujnPQ/zw9Twvg0Qk9hb/RAf6oXUskQnJLai722bg1scJYQq
         ZOVw==
X-Gm-Message-State: ANoB5pmOTZJ81an+UXrPt8bxXs6j4lQA8m3VBV/LUMPqwJYK3oxBLL5r
	UYERKDZtpl/7D3OU3lBE5+gOAPvzWog=
X-Google-Smtp-Source: AA0mqf5W5uB+HHrWyE0Ryp335F40NxhqQqT3HDK0FedGdqa3oeM2q4PI7uq0ylTDo4rgpptx0ucYfg==
X-Received: by 2002:a17:906:1844:b0:77a:4bfe:d6df with SMTP id w4-20020a170906184400b0077a4bfed6dfmr22857427eje.396.1669182859626;
        Tue, 22 Nov 2022 21:54:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n13-20020a17090695cd00b007aea50205a0sm6736501ejy.187.2022.11.22.21.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 21:54:18 -0800 (PST)
Date: Wed, 23 Nov 2022 08:54:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yonghong Song <yhs@fb.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 8575/9540] kernel/bpf/verifier.c:8189
 get_kfunc_ptr_arg_type() error: buffer overflow 'special_kfunc_list' 5 <= 6
Message-ID: <202211230642.lLUVNcin-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221123055415.HpMcEjd8IT-vA8ZIJbiVK5ElAxgM9h3yfz_ixpWjhw0@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   771a207d1ee9f38da8c0cee1412228f18b900bac
commit: fd264ca020948a743e4c36731dfdecc4a812153c [8575/9540] bpf: Add a kfunc to type cast from bpf uapi ctx to kernel ctx
config: nios2-randconfig-m031-20221122
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
kernel/bpf/verifier.c:8189 get_kfunc_ptr_arg_type() error: buffer overflow 'special_kfunc_list' 5 <= 6
kernel/bpf/verifier.c:8679 check_kfunc_args() error: buffer overflow 'special_kfunc_list' 5 <= 6
kernel/bpf/verifier.c:15197 fixup_kfunc_call() error: buffer overflow 'special_kfunc_list' 5 <= 6

vim +/special_kfunc_list +8189 kernel/bpf/verifier.c

00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8177  static enum kfunc_ptr_arg_type
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8178  get_kfunc_ptr_arg_type(struct bpf_verifier_env *env,
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8179  		       struct bpf_kfunc_call_arg_meta *meta,
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8180  		       const struct btf_type *t, const struct btf_type *ref_t,
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8181  		       const char *ref_tname, const struct btf_param *args,
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8182  		       int argno, int nargs)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8183  {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8184  	u32 regno = argno + 1;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8185  	struct bpf_reg_state *regs = cur_regs(env);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8186  	struct bpf_reg_state *reg = &regs[regno];
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8187  	bool arg_mem_size = false;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8188  
fd264ca020948a Yonghong Song           2022-11-20 @8189  	if (meta->func_id == special_kfunc_list[KF_bpf_cast_to_kern_ctx])

KF_bpf_cast_to_kern_ctx is 6 but special_kfunc_list[] only has 5 elements.

fd264ca020948a Yonghong Song           2022-11-20  8190  		return KF_ARG_PTR_TO_CTX;
fd264ca020948a Yonghong Song           2022-11-20  8191  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8192  	/* In this function, we verify the kfunc's BTF as per the argument type,
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8193  	 * leaving the rest of the verification with respect to the register
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8194  	 * type to our caller. When a set of conditions hold in the BTF type of
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8195  	 * arguments, we resolve it to a known kfunc_ptr_arg_type.
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8196  	 */
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8197  	if (btf_get_prog_ctx_type(&env->log, meta->btf, t, resolve_prog_type(env->prog), argno))
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8198  		return KF_ARG_PTR_TO_CTX;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8199  
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  8200  	if (is_kfunc_arg_alloc_obj(meta->btf, &args[argno]))
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  8201  		return KF_ARG_PTR_TO_ALLOC_BTF_ID;
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  8202  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8203  	if (is_kfunc_arg_kptr_get(meta, argno)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8204  		if (!btf_type_is_ptr(ref_t)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8205  			verbose(env, "arg#0 BTF type must be a double pointer for kptr_get kfunc\n");
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8206  			return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8207  		}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8208  		ref_t = btf_type_by_id(meta->btf, ref_t->type);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8209  		ref_tname = btf_name_by_offset(meta->btf, ref_t->name_off);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8210  		if (!btf_type_is_struct(ref_t)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8211  			verbose(env, "kernel function %s args#0 pointer type %s %s is not supported\n",
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8212  				meta->func_name, btf_type_str(ref_t), ref_tname);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8213  			return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8214  		}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8215  		return KF_ARG_PTR_TO_KPTR;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8216  	}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8217  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8218  	if (is_kfunc_arg_dynptr(meta->btf, &args[argno]))
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8219  		return KF_ARG_PTR_TO_DYNPTR;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8220  
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  8221  	if (is_kfunc_arg_list_head(meta->btf, &args[argno]))
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  8222  		return KF_ARG_PTR_TO_LIST_HEAD;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  8223  
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  8224  	if (is_kfunc_arg_list_node(meta->btf, &args[argno]))
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  8225  		return KF_ARG_PTR_TO_LIST_NODE;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  8226  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8227  	if ((base_type(reg->type) == PTR_TO_BTF_ID || reg2btf_ids[base_type(reg->type)])) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8228  		if (!btf_type_is_struct(ref_t)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8229  			verbose(env, "kernel function %s args#%d pointer type %s %s is not supported\n",
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8230  				meta->func_name, argno, btf_type_str(ref_t), ref_tname);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8231  			return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8232  		}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8233  		return KF_ARG_PTR_TO_BTF_ID;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8234  	}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8235  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8236  	if (argno + 1 < nargs && is_kfunc_arg_mem_size(meta->btf, &args[argno + 1], &regs[regno + 1]))
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8237  		arg_mem_size = true;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8238  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8239  	/* This is the catch all argument type of register types supported by
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8240  	 * check_helper_mem_access. However, we only allow when argument type is
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8241  	 * pointer to scalar, or struct composed (recursively) of scalars. When
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8242  	 * arg_mem_size is true, the pointer can be void *.
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8243  	 */
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8244  	if (!btf_type_is_scalar(ref_t) && !__btf_type_is_scalar_struct(env, meta->btf, ref_t, 0) &&
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8245  	    (arg_mem_size ? !btf_type_is_void(ref_t) : 1)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8246  		verbose(env, "arg#%d pointer type %s %s must point to %sscalar, or struct with scalar\n",
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8247  			argno, btf_type_str(ref_t), ref_tname, arg_mem_size ? "void, " : "");
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8248  		return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8249  	}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8250  	return arg_mem_size ? KF_ARG_PTR_TO_MEM_SIZE : KF_ARG_PTR_TO_MEM;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  8251  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

