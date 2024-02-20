Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F434152E01
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Feb 2024 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708467285; cv=none; b=kmd3hYeSro6P85R53eaqnzNWAB+7KHWXWOut9VHqBnJARRLWC3UhW0Bqn9VcJTVkjxVKe4qGxDe2t+JrSl5099MDKHtOKxn3UGcy6avuUZ3RNRGqBC05YF1XDwr+h0X0+EVVm7+cYzGkmOfKkue+ca8rQOxkWQ3/rM294QbTK6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708467285; c=relaxed/simple;
	bh=swJ08s1cbjIKTzsEBSzBVgKxAQnY/f3Q03WR/+TAn5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XZya35hzqka2Begr5Wqf+GrgWW15CNrTO/B6Tj6TLZeSpsMlmeENw+Em8fh4Oj9hIesgVVKOusMcfIEIcea2NhciKQZjmGJ9dJY8vy7P5EvtTt6P14Z4XU7j0Ek/+FAGkoQFgYs6//q6ZjmhHH1nOoBvKHtBbX/uRmEqFAguHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmZd8HRg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmZd8HRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708467283; x=1740003283;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=swJ08s1cbjIKTzsEBSzBVgKxAQnY/f3Q03WR/+TAn5g=;
  b=WmZd8HRgm9vMlr8h3ckz/KcBP1JllMDI/sYWK4u4tmrsBZxrRJ5YJFVE
   GOYvU+t1qe/+ae6WqQGIyK5vCmNwzFbmiU7Rj6B6dfzxzDbUkpO3oBdvf
   +u/FdgLYBGRj76MunWozV+r3H8rRFmzAy1upg2ya6F71/P/pj43mN5TIP
   Xs70zcmayLK4zilQ28aECBVV3lc3hFJt1uzXOi3CwdGX4U/Jw35/nL517
   LgO8mzknakHuhpuL/aAERYEgTvIveGgnjMouHnfGsWkOXwTWOJZaYIbWK
   WEl65dg+XqXIjNa7tpCmZuN5ivXR/J8ZIfVorvPm2hI7FLmthuSVXK6LZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13224148"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="13224148"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 14:14:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5076424"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2024 14:14:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcYNp-0004qh-1c;
	Tue, 20 Feb 2024 22:14:37 +0000
Date: Wed, 21 Feb 2024 06:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next 2/5] bpf: tracing: support to attach program to
 multi hooks
Message-ID: <202402210534.siGKEfus-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240220035105.34626-3-dongmenglong.8@bytedance.com>
References: <20240220035105.34626-3-dongmenglong.8@bytedance.com>
TO: Menglong Dong <dongmenglong.8@bytedance.com>
TO: andrii@kernel.org
CC: ast@kernel.org
CC: daniel@iogearbox.net
CC: martin.lau@linux.dev
CC: eddyz87@gmail.com
CC: song@kernel.org
CC: yonghong.song@linux.dev
CC: john.fastabend@gmail.com
CC: kpsingh@kernel.org
CC: sdf@google.com
CC: haoluo@google.com
CC: jolsa@kernel.org
CC: mykolal@fb.com
CC: shuah@kernel.org
CC: mcoquelin.stm32@gmail.com
CC: alexandre.torgue@foss.st.com
CC: thinker.li@gmail.com
CC: dongmenglong.8@bytedance.com
CC: zhoufeng.zf@bytedance.com
CC: davemarchevsky@fb.com
CC: dxu@dxuuu.xyz
CC: linux-kernel@vger.kernel.org
CC: bpf@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org

Hi Menglong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/bpf-tracing-add-support-to-record-and-check-the-accessed-args/20240220-115317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240220035105.34626-3-dongmenglong.8%40bytedance.com
patch subject: [PATCH bpf-next 2/5] bpf: tracing: support to attach program to multi hooks
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: m68k-randconfig-r071-20240220 (https://download.01.org/0day-ci/archive/20240221/202402210534.siGKEfus-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402210534.siGKEfus-lkp@intel.com/

smatch warnings:
kernel/bpf/syscall.c:3325 bpf_tracing_prog_attach() warn: passing zero to 'PTR_ERR'
kernel/bpf/syscall.c:3485 bpf_tracing_prog_attach() error: uninitialized symbol 'link'.

vim +/PTR_ERR +3325 kernel/bpf/syscall.c

5f80eb32851d7a Menglong Dong          2024-02-20  3254  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3255  static int bpf_tracing_prog_attach(struct bpf_prog *prog,
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3256  				   int tgt_prog_fd,
2fcc82411e74e5 Kui-Feng Lee           2022-05-10  3257  				   u32 btf_id,
2fcc82411e74e5 Kui-Feng Lee           2022-05-10  3258  				   u64 bpf_cookie)
fec56f5890d93f Alexei Starovoitov     2019-11-14  3259  {
a3b80e1078943d Andrii Nakryiko        2020-04-28  3260  	struct bpf_link_primer link_primer;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3261  	struct bpf_prog *tgt_prog = NULL;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3262  	struct bpf_trampoline *tr = NULL;
5f80eb32851d7a Menglong Dong          2024-02-20  3263  	struct btf *attach_btf = NULL;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3264  	struct bpf_tracing_link *link;
5f80eb32851d7a Menglong Dong          2024-02-20  3265  	struct module *mod = NULL;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3266  	u64 key = 0;
a3b80e1078943d Andrii Nakryiko        2020-04-28  3267  	int err;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3268  
9e4e01dfd3254c KP Singh               2020-03-29  3269  	switch (prog->type) {
9e4e01dfd3254c KP Singh               2020-03-29  3270  	case BPF_PROG_TYPE_TRACING:
fec56f5890d93f Alexei Starovoitov     2019-11-14  3271  		if (prog->expected_attach_type != BPF_TRACE_FENTRY &&
be8704ff07d237 Alexei Starovoitov     2020-01-20  3272  		    prog->expected_attach_type != BPF_TRACE_FEXIT &&
9e4e01dfd3254c KP Singh               2020-03-29  3273  		    prog->expected_attach_type != BPF_MODIFY_RETURN) {
9e4e01dfd3254c KP Singh               2020-03-29  3274  			err = -EINVAL;
9e4e01dfd3254c KP Singh               2020-03-29  3275  			goto out_put_prog;
9e4e01dfd3254c KP Singh               2020-03-29  3276  		}
9e4e01dfd3254c KP Singh               2020-03-29  3277  		break;
9e4e01dfd3254c KP Singh               2020-03-29  3278  	case BPF_PROG_TYPE_EXT:
9e4e01dfd3254c KP Singh               2020-03-29  3279  		if (prog->expected_attach_type != 0) {
9e4e01dfd3254c KP Singh               2020-03-29  3280  			err = -EINVAL;
9e4e01dfd3254c KP Singh               2020-03-29  3281  			goto out_put_prog;
9e4e01dfd3254c KP Singh               2020-03-29  3282  		}
9e4e01dfd3254c KP Singh               2020-03-29  3283  		break;
9e4e01dfd3254c KP Singh               2020-03-29  3284  	case BPF_PROG_TYPE_LSM:
9e4e01dfd3254c KP Singh               2020-03-29  3285  		if (prog->expected_attach_type != BPF_LSM_MAC) {
9e4e01dfd3254c KP Singh               2020-03-29  3286  			err = -EINVAL;
9e4e01dfd3254c KP Singh               2020-03-29  3287  			goto out_put_prog;
9e4e01dfd3254c KP Singh               2020-03-29  3288  		}
9e4e01dfd3254c KP Singh               2020-03-29  3289  		break;
9e4e01dfd3254c KP Singh               2020-03-29  3290  	default:
fec56f5890d93f Alexei Starovoitov     2019-11-14  3291  		err = -EINVAL;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3292  		goto out_put_prog;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3293  	}
fec56f5890d93f Alexei Starovoitov     2019-11-14  3294  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3295  	if (tgt_prog_fd) {
5f80eb32851d7a Menglong Dong          2024-02-20  3296  		if (!btf_id) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3297  			err = -EINVAL;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3298  			goto out_put_prog;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3299  		}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3300  		tgt_prog = bpf_prog_get(tgt_prog_fd);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3301  		if (IS_ERR(tgt_prog)) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3302  			tgt_prog = NULL;
5f80eb32851d7a Menglong Dong          2024-02-20  3303  			/* tgt_prog_fd is the fd of the kernel module BTF */
5f80eb32851d7a Menglong Dong          2024-02-20  3304  			attach_btf = btf_get_by_fd(tgt_prog_fd);
5f80eb32851d7a Menglong Dong          2024-02-20  3305  			if (IS_ERR(attach_btf)) {
5f80eb32851d7a Menglong Dong          2024-02-20  3306  				attach_btf = NULL;
5f80eb32851d7a Menglong Dong          2024-02-20  3307  				err = -EINVAL;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3308  				goto out_put_prog;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3309  			}
5f80eb32851d7a Menglong Dong          2024-02-20  3310  			if (!btf_is_kernel(attach_btf)) {
5f80eb32851d7a Menglong Dong          2024-02-20  3311  				btf_put(attach_btf);
5f80eb32851d7a Menglong Dong          2024-02-20  3312  				err = -EOPNOTSUPP;
5f80eb32851d7a Menglong Dong          2024-02-20  3313  				goto out_put_prog;
5f80eb32851d7a Menglong Dong          2024-02-20  3314  			}
5f80eb32851d7a Menglong Dong          2024-02-20  3315  		} else if (prog->type == BPF_PROG_TYPE_TRACING &&
5f80eb32851d7a Menglong Dong          2024-02-20  3316  			   tgt_prog->type == BPF_PROG_TYPE_TRACING) {
5f80eb32851d7a Menglong Dong          2024-02-20  3317  			prog->aux->attach_tracing_prog = true;
5f80eb32851d7a Menglong Dong          2024-02-20  3318  		}
5f80eb32851d7a Menglong Dong          2024-02-20  3319  		key = bpf_trampoline_compute_key(tgt_prog, attach_btf,
5f80eb32851d7a Menglong Dong          2024-02-20  3320  						 btf_id);
5f80eb32851d7a Menglong Dong          2024-02-20  3321  	} else if (btf_id) {
5f80eb32851d7a Menglong Dong          2024-02-20  3322  		attach_btf = bpf_get_btf_vmlinux();
5f80eb32851d7a Menglong Dong          2024-02-20  3323  		if (IS_ERR(attach_btf)) {
5f80eb32851d7a Menglong Dong          2024-02-20  3324  			attach_btf = NULL;
5f80eb32851d7a Menglong Dong          2024-02-20 @3325  			err = PTR_ERR(attach_btf);
5f80eb32851d7a Menglong Dong          2024-02-20  3326  			goto out_unlock;
5f80eb32851d7a Menglong Dong          2024-02-20  3327  		}
5f80eb32851d7a Menglong Dong          2024-02-20  3328  		if (!attach_btf) {
5f80eb32851d7a Menglong Dong          2024-02-20  3329  			err = -EINVAL;
5f80eb32851d7a Menglong Dong          2024-02-20  3330  			goto out_unlock;
5f80eb32851d7a Menglong Dong          2024-02-20  3331  		}
5f80eb32851d7a Menglong Dong          2024-02-20  3332  		btf_get(attach_btf);
5f80eb32851d7a Menglong Dong          2024-02-20  3333  		key = bpf_trampoline_compute_key(NULL, attach_btf, btf_id);
5f80eb32851d7a Menglong Dong          2024-02-20  3334  	} else {
5f80eb32851d7a Menglong Dong          2024-02-20  3335  		attach_btf = prog->aux->attach_btf;
5f80eb32851d7a Menglong Dong          2024-02-20  3336  		/* get the reference of the btf for bpf link */
5f80eb32851d7a Menglong Dong          2024-02-20  3337  		if (attach_btf)
5f80eb32851d7a Menglong Dong          2024-02-20  3338  			btf_get(attach_btf);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3339  	}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3340  
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3341  	link = kzalloc(sizeof(*link), GFP_USER);
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3342  	if (!link) {
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3343  		err = -ENOMEM;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3344  		goto out_put_prog;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3345  	}
f7e0beaf39d386 Kui-Feng Lee           2022-05-10  3346  	bpf_link_init(&link->link.link, BPF_LINK_TYPE_TRACING,
f2e10bff16a0fd Andrii Nakryiko        2020-04-28  3347  		      &bpf_tracing_link_lops, prog);
f2e10bff16a0fd Andrii Nakryiko        2020-04-28  3348  	link->attach_type = prog->expected_attach_type;
2fcc82411e74e5 Kui-Feng Lee           2022-05-10  3349  	link->link.cookie = bpf_cookie;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3350  
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3351  	mutex_lock(&prog->aux->dst_mutex);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3352  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3353  	/* There are a few possible cases here:
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3354  	 *
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3355  	 * - if prog->aux->dst_trampoline is set, the program was just loaded
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3356  	 *   and not yet attached to anything, so we can use the values stored
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3357  	 *   in prog->aux
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3358  	 *
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3359  	 * - if prog->aux->dst_trampoline is NULL, the program has already been
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3360           *   attached to a target and its initial target was cleared (below)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3361  	 *
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3362  	 * - if tgt_prog != NULL, the caller specified tgt_prog_fd +
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3363  	 *   target_btf_id using the link_create API.
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3364  	 *
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3365  	 * - if tgt_prog == NULL when this function was called using the old
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3366  	 *   raw_tracepoint_open API, and we need a target from prog->aux
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3367  	 *
f3a95075549e0e Jiri Olsa              2021-04-14  3368  	 * - if prog->aux->dst_trampoline and tgt_prog is NULL, the program
f3a95075549e0e Jiri Olsa              2021-04-14  3369  	 *   was detached and is going for re-attachment.
715d82ba636cb3 Jiri Olsa              2024-01-03  3370  	 *
715d82ba636cb3 Jiri Olsa              2024-01-03  3371  	 * - if prog->aux->dst_trampoline is NULL and tgt_prog and prog->aux->attach_btf
715d82ba636cb3 Jiri Olsa              2024-01-03  3372  	 *   are NULL, then program was already attached and user did not provide
715d82ba636cb3 Jiri Olsa              2024-01-03  3373  	 *   tgt_prog_fd so we have no way to find out or create trampoline
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3374  	 */
5f80eb32851d7a Menglong Dong          2024-02-20  3375  	if (!prog->aux->dst_trampoline && !tgt_prog && !btf_id) {
f3a95075549e0e Jiri Olsa              2021-04-14  3376  		/*
f3a95075549e0e Jiri Olsa              2021-04-14  3377  		 * Allow re-attach for TRACING and LSM programs. If it's
f3a95075549e0e Jiri Olsa              2021-04-14  3378  		 * currently linked, bpf_trampoline_link_prog will fail.
f3a95075549e0e Jiri Olsa              2021-04-14  3379  		 * EXT programs need to specify tgt_prog_fd, so they
f3a95075549e0e Jiri Olsa              2021-04-14  3380  		 * re-attach in separate code path.
f3a95075549e0e Jiri Olsa              2021-04-14  3381  		 */
f3a95075549e0e Jiri Olsa              2021-04-14  3382  		if (prog->type != BPF_PROG_TYPE_TRACING &&
f3a95075549e0e Jiri Olsa              2021-04-14  3383  		    prog->type != BPF_PROG_TYPE_LSM) {
f3a95075549e0e Jiri Olsa              2021-04-14  3384  			err = -EINVAL;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3385  			goto out_unlock;
babf3164095b06 Andrii Nakryiko        2020-03-09  3386  		}
715d82ba636cb3 Jiri Olsa              2024-01-03  3387  		/* We can allow re-attach only if we have valid attach_btf. */
715d82ba636cb3 Jiri Olsa              2024-01-03  3388  		if (!prog->aux->attach_btf) {
715d82ba636cb3 Jiri Olsa              2024-01-03  3389  			err = -EINVAL;
715d82ba636cb3 Jiri Olsa              2024-01-03  3390  			goto out_unlock;
715d82ba636cb3 Jiri Olsa              2024-01-03  3391  		}
f3a95075549e0e Jiri Olsa              2021-04-14  3392  		btf_id = prog->aux->attach_btf_id;
f3a95075549e0e Jiri Olsa              2021-04-14  3393  		key = bpf_trampoline_compute_key(NULL, prog->aux->attach_btf, btf_id);
f3a95075549e0e Jiri Olsa              2021-04-14  3394  	}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3395  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3396  	if (!prog->aux->dst_trampoline ||
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3397  	    (key && key != prog->aux->dst_trampoline->key)) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3398  		/* If there is no saved target, or the specified target is
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3399  		 * different from the destination specified at load time, we
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3400  		 * need a new trampoline and a check for compatibility
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3401  		 */
5f80eb32851d7a Menglong Dong          2024-02-20  3402  		struct btf *origin_btf = prog->aux->attach_btf;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3403  		struct bpf_attach_target_info tgt_info = {};
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3404  
5f80eb32851d7a Menglong Dong          2024-02-20  3405  		/* use the new attach_btf to check the target */
5f80eb32851d7a Menglong Dong          2024-02-20  3406  		prog->aux->attach_btf = attach_btf;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3407  		err = bpf_check_attach_target(NULL, prog, tgt_prog, btf_id,
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3408  					      &tgt_info);
5f80eb32851d7a Menglong Dong          2024-02-20  3409  		prog->aux->attach_btf = origin_btf;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3410  		if (err)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3411  			goto out_unlock;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3412  
5f80eb32851d7a Menglong Dong          2024-02-20  3413  		mod = tgt_info.tgt_mod;
5f80eb32851d7a Menglong Dong          2024-02-20  3414  		/* the new target and the previous target are in the same
5f80eb32851d7a Menglong Dong          2024-02-20  3415  		 * module, release the reference once.
5f80eb32851d7a Menglong Dong          2024-02-20  3416  		 */
5f80eb32851d7a Menglong Dong          2024-02-20  3417  		if (mod && mod == prog->aux->mod)
5f80eb32851d7a Menglong Dong          2024-02-20  3418  			module_put(mod);
5f80eb32851d7a Menglong Dong          2024-02-20  3419  		err = bpf_tracing_check_multi(prog, tgt_prog, attach_btf,
5f80eb32851d7a Menglong Dong          2024-02-20  3420  					      tgt_info.tgt_type);
5f80eb32851d7a Menglong Dong          2024-02-20  3421  		if (err)
5f80eb32851d7a Menglong Dong          2024-02-20  3422  			goto out_unlock;
31bf1dbccfb0a9 Viktor Malik           2023-03-10  3423  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3424  		tr = bpf_trampoline_get(key, &tgt_info);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3425  		if (!tr) {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3426  			err = -ENOMEM;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3427  			goto out_unlock;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3428  		}
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3429  	} else {
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3430  		/* The caller didn't specify a target, or the target was the
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3431  		 * same as the destination supplied during program load. This
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3432  		 * means we can reuse the trampoline and reference from program
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3433  		 * load time, and there is no need to allocate a new one. This
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3434  		 * can only happen once for any program, as the saved values in
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3435  		 * prog->aux are cleared below.
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3436  		 */
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3437  		tr = prog->aux->dst_trampoline;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3438  		tgt_prog = prog->aux->dst_prog;
5f80eb32851d7a Menglong Dong          2024-02-20  3439  		mod = prog->aux->mod;
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3440  	}
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3441  
f7e0beaf39d386 Kui-Feng Lee           2022-05-10  3442  	err = bpf_link_prime(&link->link.link, &link_primer);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3443  	if (err)
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3444  		goto out_unlock;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3445  
f7e0beaf39d386 Kui-Feng Lee           2022-05-10  3446  	err = bpf_trampoline_link_prog(&link->link, tr);
babf3164095b06 Andrii Nakryiko        2020-03-09  3447  	if (err) {
a3b80e1078943d Andrii Nakryiko        2020-04-28  3448  		bpf_link_cleanup(&link_primer);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3449  		link = NULL;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3450  		goto out_unlock;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3451  	}
babf3164095b06 Andrii Nakryiko        2020-03-09  3452  
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3453  	link->tgt_prog = tgt_prog;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3454  	link->trampoline = tr;
5f80eb32851d7a Menglong Dong          2024-02-20  3455  	link->attach_btf = attach_btf;
5f80eb32851d7a Menglong Dong          2024-02-20  3456  	link->mod = mod;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3457  
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3458  	/* Always clear the trampoline and target prog from prog->aux to make
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3459  	 * sure the original attach destination is not kept alive after a
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3460  	 * program is (re-)attached to another target.
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3461  	 */
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3462  	if (prog->aux->dst_prog &&
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3463  	    (tgt_prog_fd || tr != prog->aux->dst_trampoline))
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3464  		/* got extra prog ref from syscall, or attaching to different prog */
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3465  		bpf_prog_put(prog->aux->dst_prog);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3466  	if (prog->aux->dst_trampoline && tr != prog->aux->dst_trampoline)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3467  		/* we allocated a new trampoline, so free the old one */
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3468  		bpf_trampoline_put(prog->aux->dst_trampoline);
5f80eb32851d7a Menglong Dong          2024-02-20  3469  	if (prog->aux->mod && mod != prog->aux->mod)
5f80eb32851d7a Menglong Dong          2024-02-20  3470  		/* the mod in prog is not used anywhere, move it to link */
5f80eb32851d7a Menglong Dong          2024-02-20  3471  		module_put(prog->aux->mod);
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3472  
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3473  	prog->aux->dst_prog = NULL;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3474  	prog->aux->dst_trampoline = NULL;
5f80eb32851d7a Menglong Dong          2024-02-20  3475  	prog->aux->mod = NULL;
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3476  	mutex_unlock(&prog->aux->dst_mutex);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3477  
a3b80e1078943d Andrii Nakryiko        2020-04-28  3478  	return bpf_link_settle(&link_primer);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3479  out_unlock:
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3480  	if (tr && tr != prog->aux->dst_trampoline)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3481  		bpf_trampoline_put(tr);
5f80eb32851d7a Menglong Dong          2024-02-20  3482  	if (mod && mod != prog->aux->mod)
5f80eb32851d7a Menglong Dong          2024-02-20  3483  		module_put(mod);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29  3484  	mutex_unlock(&prog->aux->dst_mutex);
3aac1ead5eb6b7 Toke Høiland-Jørgensen 2020-09-29 @3485  	kfree(link);
fec56f5890d93f Alexei Starovoitov     2019-11-14  3486  out_put_prog:
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3487  	if (tgt_prog_fd && tgt_prog)
4a1e7c0c63e02d Toke Høiland-Jørgensen 2020-09-29  3488  		bpf_prog_put(tgt_prog);
5f80eb32851d7a Menglong Dong          2024-02-20  3489  	btf_put(attach_btf);
fec56f5890d93f Alexei Starovoitov     2019-11-14  3490  	return err;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3491  }
fec56f5890d93f Alexei Starovoitov     2019-11-14  3492  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
