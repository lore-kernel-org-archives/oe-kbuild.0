Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9F833B6CC
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 04:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768882838; cv=none; b=cCRPSMOjnT77djROA6gsyFfVz5wQQkuBBhCegevDX57giZ4qnKUKMUVpdd995SRE1TpMlV4cnlmnGFznmeTOhx9utMF3ZYKQdJ2IOKOGKPr25mDqiL5ywGO7zGwStlAF2q/4g3y6puPRuVi1XOynYG20uA0WoczyVHEt55UScTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768882838; c=relaxed/simple;
	bh=UWzg960szY6y+i/GhZ2ZR27xd4U8w1tUJMd6mO5jBrE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oaqXIfpdjp55nzMvMFvCckEnAajpySQAccxpSGGMltAq+IdHiSdVqPfwsWe0bOz76Nv0E6wykgOr0IxiDFzlAQfTU1LQYcbfF1atrZXh0UxqR3d/sNprShupVRWbx71t/bVHgE+uKVH0fuSklOamoJfikEWHANGoIkbxqbRPh/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faJNaH2d; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faJNaH2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768882836; x=1800418836;
  h=date:from:to:cc:subject:message-id;
  bh=UWzg960szY6y+i/GhZ2ZR27xd4U8w1tUJMd6mO5jBrE=;
  b=faJNaH2dxVzCeA9WRGbF0TnWFTpCcU/qijQBJe45CqNrtNWpmf7BVbFl
   YKit9m6Jp8Yyn1NCmRIluD6cLb2yoUwd2FqesnCDQhHfEikMAl59LL0SD
   jX26HCpIPspLyPksk5Pmw0PI/00EYT0idOR8gMJypAzcguL40wuv+Hqlw
   RValBvSonSvKqTtTT20T7EAQGxcJvrhjH9jBLan7gqoR9J41dnY82EVLI
   5P382zbsLzK7X4KX0imc0q8lg9RooXPLUHylneGz//rMXt2IbKI7TkEHX
   zaallrlXnI+M9e0euJwsvBiCpN5w4cWOPI0go0ibvQQHQO+bVrHBNPbaY
   w==;
X-CSE-ConnectionGUID: gKIQ1+IFRmGG11HXZCo6FQ==
X-CSE-MsgGUID: QPI5E48RSLqpe1Yo0HxcxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70173181"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="70173181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 20:20:35 -0800
X-CSE-ConnectionGUID: L9nzY/ubRfqDeclKn2+82w==
X-CSE-MsgGUID: toUmtwUoQg6okMk4RPR2sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="205160801"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jan 2026 20:20:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi3EE-00000000OXt-3czx;
	Tue, 20 Jan 2026 04:20:30 +0000
Date: Tue, 20 Jan 2026 12:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 196/196]
 net/core/sock_map.c:294 sock_map_link() warn: 'psock' can also be NULL
Message-ID: <202601201234.6gldmIad-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: 1b2347f3c5fe46d6f20f85ce8fcd92387f97a9f9 [196/196] bpf: Clean up sockmap related Kconfigs
:::::: branch date: 6 days ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260120/202601201234.6gldmIad-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601201234.6gldmIad-lkp@intel.com/

New smatch warnings:
net/core/sock_map.c:294 sock_map_link() warn: 'psock' can also be NULL

Old smatch warnings:
net/core/sock_map.c:301 sock_map_link() warn: 'psock' can also be NULL

vim +/psock +294 net/core/sock_map.c

f747632b608f90 Lorenz Bauer    2020-03-09  231  
604326b41a6fb9 Daniel Borkmann 2018-10-13  232  static int sock_map_link(struct bpf_map *map, struct sk_psock_progs *progs,
604326b41a6fb9 Daniel Borkmann 2018-10-13  233  			 struct sock *sk)
604326b41a6fb9 Daniel Borkmann 2018-10-13  234  {
604326b41a6fb9 Daniel Borkmann 2018-10-13  235  	struct bpf_prog *msg_parser, *skb_parser, *skb_verdict;
604326b41a6fb9 Daniel Borkmann 2018-10-13  236  	struct sk_psock *psock;
604326b41a6fb9 Daniel Borkmann 2018-10-13  237  	int ret;
604326b41a6fb9 Daniel Borkmann 2018-10-13  238  
604326b41a6fb9 Daniel Borkmann 2018-10-13  239  	skb_verdict = READ_ONCE(progs->skb_verdict);
743df8b7749fb5 John Fastabend  2020-10-10  240  	if (skb_verdict) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  241  		skb_verdict = bpf_prog_inc_not_zero(skb_verdict);
604326b41a6fb9 Daniel Borkmann 2018-10-13  242  		if (IS_ERR(skb_verdict))
604326b41a6fb9 Daniel Borkmann 2018-10-13  243  			return PTR_ERR(skb_verdict);
743df8b7749fb5 John Fastabend  2020-10-10  244  	}
83c11c17553c0f Alex Dewar      2020-10-12  245  
83c11c17553c0f Alex Dewar      2020-10-12  246  	skb_parser = READ_ONCE(progs->skb_parser);
743df8b7749fb5 John Fastabend  2020-10-10  247  	if (skb_parser) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  248  		skb_parser = bpf_prog_inc_not_zero(skb_parser);
604326b41a6fb9 Daniel Borkmann 2018-10-13  249  		if (IS_ERR(skb_parser)) {
83c11c17553c0f Alex Dewar      2020-10-12  250  			ret = PTR_ERR(skb_parser);
83c11c17553c0f Alex Dewar      2020-10-12  251  			goto out_put_skb_verdict;
604326b41a6fb9 Daniel Borkmann 2018-10-13  252  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  253  	}
604326b41a6fb9 Daniel Borkmann 2018-10-13  254  
604326b41a6fb9 Daniel Borkmann 2018-10-13  255  	msg_parser = READ_ONCE(progs->msg_parser);
604326b41a6fb9 Daniel Borkmann 2018-10-13  256  	if (msg_parser) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  257  		msg_parser = bpf_prog_inc_not_zero(msg_parser);
604326b41a6fb9 Daniel Borkmann 2018-10-13  258  		if (IS_ERR(msg_parser)) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  259  			ret = PTR_ERR(msg_parser);
83c11c17553c0f Alex Dewar      2020-10-12  260  			goto out_put_skb_parser;
604326b41a6fb9 Daniel Borkmann 2018-10-13  261  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  262  	}
604326b41a6fb9 Daniel Borkmann 2018-10-13  263  
f747632b608f90 Lorenz Bauer    2020-03-09  264  	psock = sock_map_psock_get_checked(sk);
5032d079909d1a John Fastabend  2018-10-18  265  	if (IS_ERR(psock)) {
5032d079909d1a John Fastabend  2018-10-18  266  		ret = PTR_ERR(psock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  267  		goto out_progs;
604326b41a6fb9 Daniel Borkmann 2018-10-13  268  	}
5032d079909d1a John Fastabend  2018-10-18  269  
5032d079909d1a John Fastabend  2018-10-18  270  	if (psock) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  271  		if ((msg_parser && READ_ONCE(psock->progs.msg_parser)) ||
743df8b7749fb5 John Fastabend  2020-10-10  272  		    (skb_parser  && READ_ONCE(psock->progs.skb_parser)) ||
743df8b7749fb5 John Fastabend  2020-10-10  273  		    (skb_verdict && READ_ONCE(psock->progs.skb_verdict))) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  274  			sk_psock_put(sk, psock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  275  			ret = -EBUSY;
604326b41a6fb9 Daniel Borkmann 2018-10-13  276  			goto out_progs;
604326b41a6fb9 Daniel Borkmann 2018-10-13  277  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  278  	} else {
604326b41a6fb9 Daniel Borkmann 2018-10-13  279  		psock = sk_psock_init(sk, map->numa_node);
7b219da43f94a3 Lorenz Bauer    2020-08-21  280  		if (IS_ERR(psock)) {
7b219da43f94a3 Lorenz Bauer    2020-08-21  281  			ret = PTR_ERR(psock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  282  			goto out_progs;
604326b41a6fb9 Daniel Borkmann 2018-10-13  283  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  284  	}
604326b41a6fb9 Daniel Borkmann 2018-10-13  285  
604326b41a6fb9 Daniel Borkmann 2018-10-13  286  	if (msg_parser)
604326b41a6fb9 Daniel Borkmann 2018-10-13  287  		psock_set_prog(&psock->progs.msg_parser, msg_parser);
d19da360ee0f3e Lorenz Bauer    2020-03-09  288  
cb21802b39632b Lorenz Bauer    2020-03-09  289  	ret = sock_map_init_proto(sk, psock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  290  	if (ret < 0)
604326b41a6fb9 Daniel Borkmann 2018-10-13  291  		goto out_drop;
604326b41a6fb9 Daniel Borkmann 2018-10-13  292  
604326b41a6fb9 Daniel Borkmann 2018-10-13  293  	write_lock_bh(&sk->sk_callback_lock);
743df8b7749fb5 John Fastabend  2020-10-10 @294  	if (skb_parser && skb_verdict && !psock->parser.enabled) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  295  		ret = sk_psock_init_strp(sk, psock);
ef5659280eb13e John Fastabend  2020-10-10  296  		if (ret)
ef5659280eb13e John Fastabend  2020-10-10  297  			goto out_unlock_drop;
604326b41a6fb9 Daniel Borkmann 2018-10-13  298  		psock_set_prog(&psock->progs.skb_verdict, skb_verdict);
604326b41a6fb9 Daniel Borkmann 2018-10-13  299  		psock_set_prog(&psock->progs.skb_parser, skb_parser);
604326b41a6fb9 Daniel Borkmann 2018-10-13  300  		sk_psock_start_strp(sk, psock);
ef5659280eb13e John Fastabend  2020-10-10  301  	} else if (!skb_parser && skb_verdict && !psock->parser.enabled) {
ef5659280eb13e John Fastabend  2020-10-10  302  		psock_set_prog(&psock->progs.skb_verdict, skb_verdict);
ef5659280eb13e John Fastabend  2020-10-10  303  		sk_psock_start_verdict(sk,psock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  304  	}
604326b41a6fb9 Daniel Borkmann 2018-10-13  305  	write_unlock_bh(&sk->sk_callback_lock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  306  	return 0;
ef5659280eb13e John Fastabend  2020-10-10  307  out_unlock_drop:
ef5659280eb13e John Fastabend  2020-10-10  308  	write_unlock_bh(&sk->sk_callback_lock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  309  out_drop:
604326b41a6fb9 Daniel Borkmann 2018-10-13  310  	sk_psock_put(sk, psock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  311  out_progs:
604326b41a6fb9 Daniel Borkmann 2018-10-13  312  	if (msg_parser)
604326b41a6fb9 Daniel Borkmann 2018-10-13  313  		bpf_prog_put(msg_parser);
83c11c17553c0f Alex Dewar      2020-10-12  314  out_put_skb_parser:
743df8b7749fb5 John Fastabend  2020-10-10  315  	if (skb_parser)
604326b41a6fb9 Daniel Borkmann 2018-10-13  316  		bpf_prog_put(skb_parser);
83c11c17553c0f Alex Dewar      2020-10-12  317  out_put_skb_verdict:
83c11c17553c0f Alex Dewar      2020-10-12  318  	if (skb_verdict)
83c11c17553c0f Alex Dewar      2020-10-12  319  		bpf_prog_put(skb_verdict);
604326b41a6fb9 Daniel Borkmann 2018-10-13  320  	return ret;
604326b41a6fb9 Daniel Borkmann 2018-10-13  321  }
604326b41a6fb9 Daniel Borkmann 2018-10-13  322  

:::::: The code at line 294 was first introduced by commit
:::::: 743df8b7749fb5a289fc0c7ac94ec15533596839 bpf, sockmap: Check skb_verdict and skb_parser programs explicitly

:::::: TO: John Fastabend <john.fastabend@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
