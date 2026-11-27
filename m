Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795903;
	b=bcjyguth6DXcGYozKpZlqeMnQTl5l7sATUJPzbZZdlfq6Elt2SLpzrWR5wNsTprPI9W2
	 LWIxIPEivQ4+MtLzg0pQhvGEylefRBdm5YE6YP/hZXp5lxOLqIcVfPQ8eg6z6T2GzX+fX
	 ZY9nXnTrU7iqKAH8QPCDbYesmvYFSweojbRjM6g9GUgv1CrAPYOSlj7ivsFOZ/kNYEPmF
	 bRdBH/Tjgz4SX5troE5iT5+NnR3CQSmax37L//xChOny8s0nJBthf62+wzve9EG7QVwhh
	 r3+UTvGHg/i1GS3lHevozfobEG5osX6aAoh5m2dPvzpwpyOrPOm1k6djnGsB0eKax9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795903;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=jU2pQKNoKg/cnR+ZRPJ+fuUai17Ivr4eBOl+9t+mZP0=;
	b=fIro69Se7/dq9jOZ74Yfi7skcpLUXXToyFOww1dPRTDG7rCxJNKqYmh0bOlnovdM8liY
	 FbNp9u5IXn2RtIcUMPrlDkk6u5BVPvo22+xDN0n9jsjcGpOfYtxttSiTerQyAHb3Mx6f5
	 rGnmeNXBIiisZ7Vt/IYIi+hfYSB48PZ3za0Nr7wl19jGe+x9cojSHpJk073pl7Ll5mll5
	 v/sjwD7KvP6z3dHOF82VwcGCU5+SjhKGFCgws8pBPpxVvw+eDimUeOEdJDcczBIt0osKy
	 sDkOUnGDPwRdez2orXZnbLT9SJuJiPB64UxMEAht0A8VXBg/f6DRC0jizhu/gkHz8PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jpc8mDxp;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C10D606A31E
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 16:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C10D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jpc8mDxp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795795904; x=1827331904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9iPS4En4CrxF6t1lVXTaNdl3TgweexnU8TGHX5VLhak=;
  b=Jpc8mDxpiTEQlorxUmdP+5vKg5NdHXp0wshsOchnh+1weOdyRm2cz2qw
   x3r2Sb8uEvF5ulTqCcI7FoKGjQ6IdomATO0xx+meGCouBdUunf5K9uppy
   uj1QepbEbrd1f6zZB14QHBKlY42CapIgAj700peexQnUnPnCSFgIMUYeR
   i8tXiO/UJfiwuy0QezIVps3xVzOmEpq3PnkjfbYYKwDi6uFDyWSXHYKT+
   laCvVQd6zkHND32QDvLcCXVqwrk+u88IzpBynjOpWeGDByd3F12/E0h9H
   41KzunFvjmKDGUrdbeFQJMGtFSAkBeeqHJIY6oOgfYFWQNlqMDSeo4LHu
   A==;
X-CSE-ConnectionGUID: EwSyL2V2R+m+StmY2v9G+Q==
X-CSE-MsgGUID: FeOG+JqqRxmWz/b0Ab2vvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4801461"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4801461"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 08:11:42 -0800
X-CSE-ConnectionGUID: 7xN1Aw1AQ/qzs8DgppvLAg==
X-CSE-MsgGUID: XU9GU4tyQMuqeuZYhzlHVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="13027076"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Nov 2026 08:11:40 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWyXx-000000000E3-3lQU;
	Fri, 27 Nov 2026 16:11:37 +0000
Date: Fri, 27 Nov 2026 17:11:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next 1/7] libbpf: Support CO-RE relocation of tracing
 program arguments
Message-ID: <20261127170440.mE7JCAST-lkp@intel.com>
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

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261123223227.745345-2-almagui@kernel.org>
References: <20261123223227.745345-2-almagui@kernel.org>
TO: Alan Maguire <almagui@kernel.org>
TO: ast@kernel.org
TO: daniel@iogearbox.net
TO: andrii@kernel.org
CC: eddyz87@gmail.com
CC: memxor@gmail.com
CC: martin.lau@linux.dev
CC: song@kernel.org
CC: yonghong.song@linux.dev
CC: jolsa@kernel.org
CC: emil@etsalapatis.com
CC: ihor.solodrai@linux.dev
CC: john.fastabend@gmail.com
CC: bpf@vger.kernel.org
CC: Alan Maguire <almagui@kernel.org>

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Maguire/libbpf-Support-CO-RE-relocation-of-tracing-program-arguments/20261123-223221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20261123223227.745345-2-almagui%40kernel.org
patch subject: [PATCH bpf-next 1/7] libbpf: Support CO-RE relocation of tracing program arguments
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261127/20261127170440.mE7JCAST-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261127170440.mE7JCAST-lkp@intel.com/

smatch warnings:
kernel/bpf/../../tools/lib/bpf/relo_core.c:1337 bpf_core_calc_relo() error: we previously assumed 'targ_spec' could be null (see line 1322)

vim +/targ_spec +1337 kernel/bpf/../../tools/lib/bpf/relo_core.c

2a6fa26be8e26a Alan Maguire       2026-11-23  1292  
b0588390dbcedc Alexei Starovoitov 2021-07-20  1293  static int bpf_core_calc_relo(const char *prog_name,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1294  			      const struct bpf_core_relo *relo,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1295  			      int relo_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1296  			      const struct bpf_core_spec *local_spec,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1297  			      const struct bpf_core_spec *targ_spec,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1298  			      struct bpf_core_relo_res *res)
b0588390dbcedc Alexei Starovoitov 2021-07-20  1299  {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1300  	int err = -EOPNOTSUPP;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1301  
b0588390dbcedc Alexei Starovoitov 2021-07-20  1302  	res->orig_val = 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1303  	res->new_val = 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1304  	res->poison = false;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1305  	res->validate = true;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1306  	res->fail_memsz_adjust = false;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1307  	res->orig_sz = res->new_sz = 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1308  	res->orig_type_id = res->new_type_id = 0;
2a6fa26be8e26a Alan Maguire       2026-11-23  1309  	res->widen_func_arg = false;
2a6fa26be8e26a Alan Maguire       2026-11-23  1310  	res->func_arg_signed = false;
2a6fa26be8e26a Alan Maguire       2026-11-23  1311  	res->func_arg_slot_off = 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1312  
b0588390dbcedc Alexei Starovoitov 2021-07-20  1313  	if (core_relo_is_field_based(relo->kind)) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1314  		err = bpf_core_calc_field_relo(prog_name, relo, local_spec,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1315  					       &res->orig_val, &res->orig_sz,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1316  					       &res->orig_type_id, &res->validate);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1317  		err = err ?: bpf_core_calc_field_relo(prog_name, relo, targ_spec,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1318  						      &res->new_val, &res->new_sz,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1319  						      &res->new_type_id, NULL);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1320  		if (err)
b0588390dbcedc Alexei Starovoitov 2021-07-20  1321  			goto done;
2a6fa26be8e26a Alan Maguire       2026-11-23 @1322  		if (relo->kind == BPF_CORE_FIELD_BYTE_OFFSET && targ_spec &&
2a6fa26be8e26a Alan Maguire       2026-11-23  1323  		    bpf_core_is_be_small_func_arg(targ_spec, &res->func_arg_signed)) {
2a6fa26be8e26a Alan Maguire       2026-11-23  1324  			/* context slots are 8-byte aligned */
2a6fa26be8e26a Alan Maguire       2026-11-23  1325  			res->widen_func_arg = true;
2a6fa26be8e26a Alan Maguire       2026-11-23  1326  			res->func_arg_slot_off = res->new_val & ~7ULL;
2a6fa26be8e26a Alan Maguire       2026-11-23  1327  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1328  		/* Validate if it's safe to adjust load/store memory size.
b0588390dbcedc Alexei Starovoitov 2021-07-20  1329  		 * Adjustments are performed only if original and new memory
b0588390dbcedc Alexei Starovoitov 2021-07-20  1330  		 * sizes differ.
b0588390dbcedc Alexei Starovoitov 2021-07-20  1331  		 */
b0588390dbcedc Alexei Starovoitov 2021-07-20  1332  		res->fail_memsz_adjust = false;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1333  		if (res->orig_sz != res->new_sz) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1334  			const struct btf_type *orig_t, *new_t;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1335  
74753e1462e773 Alexei Starovoitov 2021-12-01  1336  			orig_t = btf_type_by_id(local_spec->btf, res->orig_type_id);
74753e1462e773 Alexei Starovoitov 2021-12-01 @1337  			new_t = btf_type_by_id(targ_spec->btf, res->new_type_id);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1338  
b0588390dbcedc Alexei Starovoitov 2021-07-20  1339  			/* There are two use cases in which it's safe to
b0588390dbcedc Alexei Starovoitov 2021-07-20  1340  			 * adjust load/store's mem size:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1341  			 *   - reading a 32-bit kernel pointer, while on BPF
b0588390dbcedc Alexei Starovoitov 2021-07-20  1342  			 *   size pointers are always 64-bit; in this case
b0588390dbcedc Alexei Starovoitov 2021-07-20  1343  			 *   it's safe to "downsize" instruction size due to
b0588390dbcedc Alexei Starovoitov 2021-07-20  1344  			 *   pointer being treated as unsigned integer with
b0588390dbcedc Alexei Starovoitov 2021-07-20  1345  			 *   zero-extended upper 32-bits;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1346  			 *   - reading unsigned integers, again due to
b0588390dbcedc Alexei Starovoitov 2021-07-20  1347  			 *   zero-extension is preserving the value correctly.
b0588390dbcedc Alexei Starovoitov 2021-07-20  1348  			 *
b0588390dbcedc Alexei Starovoitov 2021-07-20  1349  			 * In all other cases it's incorrect to attempt to
b0588390dbcedc Alexei Starovoitov 2021-07-20  1350  			 * load/store field because read value will be
b0588390dbcedc Alexei Starovoitov 2021-07-20  1351  			 * incorrect, so we poison relocated instruction.
b0588390dbcedc Alexei Starovoitov 2021-07-20  1352  			 */
b0588390dbcedc Alexei Starovoitov 2021-07-20  1353  			if (btf_is_ptr(orig_t) && btf_is_ptr(new_t))
b0588390dbcedc Alexei Starovoitov 2021-07-20  1354  				goto done;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1355  			if (btf_is_int(orig_t) && btf_is_int(new_t) &&
b0588390dbcedc Alexei Starovoitov 2021-07-20  1356  			    btf_int_encoding(orig_t) != BTF_INT_SIGNED &&
b0588390dbcedc Alexei Starovoitov 2021-07-20  1357  			    btf_int_encoding(new_t) != BTF_INT_SIGNED)
b0588390dbcedc Alexei Starovoitov 2021-07-20  1358  				goto done;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1359  
b0588390dbcedc Alexei Starovoitov 2021-07-20  1360  			/* mark as invalid mem size adjustment, but this will
b0588390dbcedc Alexei Starovoitov 2021-07-20  1361  			 * only be checked for LDX/STX/ST insns
b0588390dbcedc Alexei Starovoitov 2021-07-20  1362  			 */
b0588390dbcedc Alexei Starovoitov 2021-07-20  1363  			res->fail_memsz_adjust = true;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1364  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1365  	} else if (core_relo_is_type_based(relo->kind)) {
4b443bc1785f28 Andrii Nakryiko    2021-12-12  1366  		err = bpf_core_calc_type_relo(relo, local_spec, &res->orig_val, &res->validate);
4b443bc1785f28 Andrii Nakryiko    2021-12-12  1367  		err = err ?: bpf_core_calc_type_relo(relo, targ_spec, &res->new_val, NULL);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1368  	} else if (core_relo_is_enumval_based(relo->kind)) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1369  		err = bpf_core_calc_enumval_relo(relo, local_spec, &res->orig_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1370  		err = err ?: bpf_core_calc_enumval_relo(relo, targ_spec, &res->new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1371  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1372  
b0588390dbcedc Alexei Starovoitov 2021-07-20  1373  done:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1374  	if (err == -EUCLEAN) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1375  		/* EUCLEAN is used to signal instruction poisoning request */
b0588390dbcedc Alexei Starovoitov 2021-07-20  1376  		res->poison = true;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1377  		err = 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1378  	} else if (err == -EOPNOTSUPP) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1379  		/* EOPNOTSUPP means unknown/unsupported relocation */
df3153758ddba5 Andrii Nakryiko    2026-06-24  1380  		pr_warn("prog '%s': relo #%d: unrecognized CO-RE relocation %s (%u) at insn #%u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1381  			prog_name, relo_idx, core_relo_kind_str(relo->kind),
b0588390dbcedc Alexei Starovoitov 2021-07-20  1382  			relo->kind, relo->insn_off / 8);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1383  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1384  
b0588390dbcedc Alexei Starovoitov 2021-07-20  1385  	return err;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1386  }
b0588390dbcedc Alexei Starovoitov 2021-07-20  1387  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
