Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF4F433B9
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Nov 2024 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730565708; cv=none; b=iatgjl2mKeZsxKJ+VXPTxqJeM8fhLiMfXDQ1ZFAC57TwoDIjV89IwXOJyQcmBKhwv/Hy8/dsM88pJjP34dVc34SFWzHeQvnQm9CDoz8dC7hB3wsY2mnRcqKtsJI5t7E9I90p9RcDTiDvQ+ao2AClERTrbkY6kAftetDyAb+N8Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730565708; c=relaxed/simple;
	bh=Fw46zBgBS4MCxUQgdX4pk+WUum1LNC5nyLpTkSNMvls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OBMgjeptLttt8J5b+s07X/6YfoKj2C4ZUCaY4uVjivsQsTMrinunIBnaj7LiIE4CZORGRChtA7j6YYvcDVbaRls64t0cj+gCJyg+8ZW4J0B/8j6k9oxUXES+35Ic1qOZtSpbGkrZNh5jYIzSXucUrrGLtnj578OLi2XPJ/Igyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brJogfFM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brJogfFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730565707; x=1762101707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fw46zBgBS4MCxUQgdX4pk+WUum1LNC5nyLpTkSNMvls=;
  b=brJogfFMsZFn4G1x8b5cKscw33/W+HwmqbRbNYzHo5/L2eOFVx7GHAIH
   XbC0gMIADPi/Uihx3BcS/2HBtYvaY38JHdbKQqprWwiCROQZhCd8qQX/b
   +R2MANeodthWSzSZ9EWKHQgx5OKwlYgKXrUPBhKIFVBmc6drJ/iGs76GR
   m8SsvXfe+MHbpg+i0OGpw/z77agH5nqjaMVdspHbQWKPFWs/wU2npgTiI
   z+f3lJmltquYkuh5ok3mi07tlCvhjitNgLnCLsHmSqOxOQQPidD3n4m3l
   94pSfjAYCeb9PsTwClpcDAwwqCcv1pvuNjw03KwrnkAkxmloJhUK943vq
   A==;
X-CSE-ConnectionGUID: ACJk+518Sl+6u+fhMFslIA==
X-CSE-MsgGUID: SFP/FQuqSpi8xAjWnOEC6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34000597"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34000597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 09:41:46 -0700
X-CSE-ConnectionGUID: K7II8+MbSwGC+JPTBfA2Sw==
X-CSE-MsgGUID: y58UJY0wQcSpA6I0OEXS9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="120697690"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2024 09:41:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7HC2-000jAb-1j;
	Sat, 02 Nov 2024 16:41:42 +0000
Date: Sun, 3 Nov 2024 00:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] bpf: Introduce cpu affinity for sockmap
Message-ID: <202411030036.PSKG1pW3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241101161624.568527-2-mrpre@163.com>
References: <20241101161624.568527-2-mrpre@163.com>
TO: mrpre <mrpre@163.com>
TO: yonghong.song@linux.dev
TO: john.fastabend@gmail.com
TO: martin.lau@kernel.org
TO: edumazet@google.com
TO: jakub@cloudflare.com
TO: davem@davemloft.net
TO: dsahern@kernel.org
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: netdev@vger.kernel.org
TO: bpf@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: mrpre <mrpre@163.com>

Hi mrpre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master net-next/main net/main linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mrpre/bpf-Introduce-cpu-affinity-for-sockmap/20241102-001844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241101161624.568527-2-mrpre%40163.com
patch subject: [PATCH v2 1/2] bpf: Introduce cpu affinity for sockmap
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20241102 (https://download.01.org/0day-ci/archive/20241103/202411030036.PSKG1pW3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411030036.PSKG1pW3-lkp@intel.com/

smatch warnings:
net/core/sock_map.c:511 sock_map_update_common() warn: variable dereferenced before check 'psock' (see line 492)

vim +/psock +511 net/core/sock_map.c

604326b41a6fb9 Daniel Borkmann 2018-10-13  466  
604326b41a6fb9 Daniel Borkmann 2018-10-13  467  static int sock_map_update_common(struct bpf_map *map, u32 idx,
ffed654afa8dc1 mrpre           2024-11-02  468  				  struct sock *sk, u64 flags, s32 target_cpu)
604326b41a6fb9 Daniel Borkmann 2018-10-13  469  {
604326b41a6fb9 Daniel Borkmann 2018-10-13  470  	struct bpf_stab *stab = container_of(map, struct bpf_stab, map);
604326b41a6fb9 Daniel Borkmann 2018-10-13  471  	struct sk_psock_link *link;
604326b41a6fb9 Daniel Borkmann 2018-10-13  472  	struct sk_psock *psock;
604326b41a6fb9 Daniel Borkmann 2018-10-13  473  	struct sock *osk;
604326b41a6fb9 Daniel Borkmann 2018-10-13  474  	int ret;
604326b41a6fb9 Daniel Borkmann 2018-10-13  475  
604326b41a6fb9 Daniel Borkmann 2018-10-13  476  	WARN_ON_ONCE(!rcu_read_lock_held());
604326b41a6fb9 Daniel Borkmann 2018-10-13  477  	if (unlikely(flags > BPF_EXIST))
604326b41a6fb9 Daniel Borkmann 2018-10-13  478  		return -EINVAL;
604326b41a6fb9 Daniel Borkmann 2018-10-13  479  	if (unlikely(idx >= map->max_entries))
604326b41a6fb9 Daniel Borkmann 2018-10-13  480  		return -E2BIG;
604326b41a6fb9 Daniel Borkmann 2018-10-13  481  
604326b41a6fb9 Daniel Borkmann 2018-10-13  482  	link = sk_psock_init_link();
604326b41a6fb9 Daniel Borkmann 2018-10-13  483  	if (!link)
604326b41a6fb9 Daniel Borkmann 2018-10-13  484  		return -ENOMEM;
604326b41a6fb9 Daniel Borkmann 2018-10-13  485  
2004fdbd8a2b56 Cong Wang       2021-03-30  486  	ret = sock_map_link(map, sk);
604326b41a6fb9 Daniel Borkmann 2018-10-13  487  	if (ret < 0)
604326b41a6fb9 Daniel Borkmann 2018-10-13  488  		goto out_free;
604326b41a6fb9 Daniel Borkmann 2018-10-13  489  
604326b41a6fb9 Daniel Borkmann 2018-10-13  490  	psock = sk_psock(sk);
604326b41a6fb9 Daniel Borkmann 2018-10-13  491  	WARN_ON_ONCE(!psock);
ffed654afa8dc1 mrpre           2024-11-02 @492  	psock->target_cpu = target_cpu;
35d2b7ffffc1d9 John Fastabend  2023-08-29  493  	spin_lock_bh(&stab->lock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  494  	osk = stab->sks[idx];
604326b41a6fb9 Daniel Borkmann 2018-10-13  495  	if (osk && flags == BPF_NOEXIST) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  496  		ret = -EEXIST;
604326b41a6fb9 Daniel Borkmann 2018-10-13  497  		goto out_unlock;
604326b41a6fb9 Daniel Borkmann 2018-10-13  498  	} else if (!osk && flags == BPF_EXIST) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  499  		ret = -ENOENT;
604326b41a6fb9 Daniel Borkmann 2018-10-13  500  		goto out_unlock;
604326b41a6fb9 Daniel Borkmann 2018-10-13  501  	}
604326b41a6fb9 Daniel Borkmann 2018-10-13  502  
604326b41a6fb9 Daniel Borkmann 2018-10-13  503  	sock_map_add_link(psock, link, map, &stab->sks[idx]);
604326b41a6fb9 Daniel Borkmann 2018-10-13  504  	stab->sks[idx] = sk;
604326b41a6fb9 Daniel Borkmann 2018-10-13  505  	if (osk)
604326b41a6fb9 Daniel Borkmann 2018-10-13  506  		sock_map_unref(osk, &stab->sks[idx]);
35d2b7ffffc1d9 John Fastabend  2023-08-29  507  	spin_unlock_bh(&stab->lock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  508  	return 0;
604326b41a6fb9 Daniel Borkmann 2018-10-13  509  out_unlock:
35d2b7ffffc1d9 John Fastabend  2023-08-29  510  	spin_unlock_bh(&stab->lock);
604326b41a6fb9 Daniel Borkmann 2018-10-13 @511  	if (psock)
604326b41a6fb9 Daniel Borkmann 2018-10-13  512  		sk_psock_put(sk, psock);
604326b41a6fb9 Daniel Borkmann 2018-10-13  513  out_free:
604326b41a6fb9 Daniel Borkmann 2018-10-13  514  	sk_psock_free_link(link);
604326b41a6fb9 Daniel Borkmann 2018-10-13  515  	return ret;
604326b41a6fb9 Daniel Borkmann 2018-10-13  516  }
604326b41a6fb9 Daniel Borkmann 2018-10-13  517  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
