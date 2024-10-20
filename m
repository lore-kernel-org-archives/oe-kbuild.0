Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843A518E25
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729410449; cv=none; b=hXtkWpI5qyElbigNeTqaAJkOvA2r6KnkIfiBN1ShMBh3Mlh2nF1QH5y6KJhEI8bkMcbHMBsoWQVYFcl2AMUytxqUPRnquSaMKusm740AzVn9SNqXLpjFxEHDzdCmvQNEks1bhRNW6ZtkGwhGSJU3vJZjCxP1Xyed5bNC5Ren88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729410449; c=relaxed/simple;
	bh=OqVOOHBdPE7nzT80dctDqqdMXN7QeAV2gwVyWhNDor8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DvTGFqBmH4LrmLSih+ZpjzcCuRgzqesZXAxnUzwMiaCE5i4jlyi+ZF9sdDGn+HLjRBGZEEE1KvcwcgvbjpDRQa7hfR+9VIxT5CXhAE/ZhCxeO3xQQ/fSFmk2DXkJEZSWnV+MEFF9n9iSkSykoXcoB1NP1heuijYZFfL7IAK1T2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXBrYOMv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXBrYOMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729410446; x=1760946446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqVOOHBdPE7nzT80dctDqqdMXN7QeAV2gwVyWhNDor8=;
  b=kXBrYOMvoWC/kSR6c8yuiYKqePVB5hYXLYKHiad/jwrgECN0qGHK33CO
   8llnMVPDOlNnWv5fufMcx2RzYMJmgAdaRYOp59f1gyIbKkRC+UwdbJPLO
   FlbxoB9WZv53g4N8Cg5r6Ucpo35mRaaaR8AKOemW2ZMie0sIdruQzjChz
   CIVswIDOgbIi3sNhr80lA71ldaWZqK/CLFEDPgCpy4NEQ1YdrS+YL787E
   iVGMPSIQCVPDl7S+JVNuvUChFcM8SNjhgKGqH8FSGVnZIO7Q/X9eZL4ZT
   sc764ImukWoiLm0V+fXfRFAddRV3WPEZDDSDwhzEPD0xvahVNRYnq5pBq
   g==;
X-CSE-ConnectionGUID: BBkXdA8hTP+7csS1quzRvg==
X-CSE-MsgGUID: k9wpvGSQSBewpHeSZ2UFAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28326824"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="28326824"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 00:47:25 -0700
X-CSE-ConnectionGUID: Y+Lr0BGeRG2EpOLMbb73MQ==
X-CSE-MsgGUID: lR/h4+dmRwmKdPFbdMvB4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="116708903"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2024 00:47:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Qen-000Q3R-2n;
	Sun, 20 Oct 2024 07:47:21 +0000
Date: Sun, 20 Oct 2024 15:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ipv4/tcp_ao.c:689 tcp_ao_del_cmd() error: memcmp() '&key->addr'
 too small (4 vs 16)
Message-ID: <202410201520.f6T10dOt-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Dmitry Safonov <dima@arista.com>
CC: Francesco Ruggeri <fruggeri@arista.com>
CC: Salam Noureddine <noureddine@arista.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: 4954f17ddefc51d218625dcdfaf422a253dad3fa net/tcp: Introduce TCP_AO setsockopt()s
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201520.f6T10dOt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410201520.f6T10dOt-lkp@intel.com/

smatch warnings:
net/ipv4/tcp_ao.c:689 tcp_ao_del_cmd() error: memcmp() '&key->addr' too small (4 vs 16)

vim +689 net/ipv4/tcp_ao.c

4954f17ddefc51 Dmitry Safonov 2023-10-23  599  
4954f17ddefc51 Dmitry Safonov 2023-10-23  600  static int tcp_ao_del_cmd(struct sock *sk, unsigned short int family,
4954f17ddefc51 Dmitry Safonov 2023-10-23  601  			  sockptr_t optval, int optlen)
4954f17ddefc51 Dmitry Safonov 2023-10-23  602  {
4954f17ddefc51 Dmitry Safonov 2023-10-23  603  	struct tcp_ao_key *key, *new_current = NULL, *new_rnext = NULL;
4954f17ddefc51 Dmitry Safonov 2023-10-23  604  	struct tcp_ao_info *ao_info;
4954f17ddefc51 Dmitry Safonov 2023-10-23  605  	union tcp_ao_addr *addr;
4954f17ddefc51 Dmitry Safonov 2023-10-23  606  	struct tcp_ao_del cmd;
4954f17ddefc51 Dmitry Safonov 2023-10-23  607  	int addr_len;
4954f17ddefc51 Dmitry Safonov 2023-10-23  608  	__u8 prefix;
4954f17ddefc51 Dmitry Safonov 2023-10-23  609  	u16 port;
4954f17ddefc51 Dmitry Safonov 2023-10-23  610  	int err;
4954f17ddefc51 Dmitry Safonov 2023-10-23  611  
4954f17ddefc51 Dmitry Safonov 2023-10-23  612  	if (optlen < sizeof(cmd))
4954f17ddefc51 Dmitry Safonov 2023-10-23  613  		return -EINVAL;
4954f17ddefc51 Dmitry Safonov 2023-10-23  614  
4954f17ddefc51 Dmitry Safonov 2023-10-23  615  	err = copy_struct_from_sockptr(&cmd, sizeof(cmd), optval, optlen);
4954f17ddefc51 Dmitry Safonov 2023-10-23  616  	if (err)
4954f17ddefc51 Dmitry Safonov 2023-10-23  617  		return err;
4954f17ddefc51 Dmitry Safonov 2023-10-23  618  
4954f17ddefc51 Dmitry Safonov 2023-10-23  619  	if (cmd.reserved != 0 || cmd.reserved2 != 0)
4954f17ddefc51 Dmitry Safonov 2023-10-23  620  		return -EINVAL;
4954f17ddefc51 Dmitry Safonov 2023-10-23  621  
4954f17ddefc51 Dmitry Safonov 2023-10-23  622  	if (cmd.set_current || cmd.set_rnext) {
4954f17ddefc51 Dmitry Safonov 2023-10-23  623  		if (!tcp_ao_can_set_current_rnext(sk))
4954f17ddefc51 Dmitry Safonov 2023-10-23  624  			return -EINVAL;
4954f17ddefc51 Dmitry Safonov 2023-10-23  625  	}
4954f17ddefc51 Dmitry Safonov 2023-10-23  626  
4954f17ddefc51 Dmitry Safonov 2023-10-23  627  	ao_info = setsockopt_ao_info(sk);
4954f17ddefc51 Dmitry Safonov 2023-10-23  628  	if (IS_ERR(ao_info))
4954f17ddefc51 Dmitry Safonov 2023-10-23  629  		return PTR_ERR(ao_info);
4954f17ddefc51 Dmitry Safonov 2023-10-23  630  	if (!ao_info)
4954f17ddefc51 Dmitry Safonov 2023-10-23  631  		return -ENOENT;
4954f17ddefc51 Dmitry Safonov 2023-10-23  632  
4954f17ddefc51 Dmitry Safonov 2023-10-23  633  	/* For sockets in TCP_CLOSED it's possible set keys that aren't
4954f17ddefc51 Dmitry Safonov 2023-10-23  634  	 * matching the future peer (address/VRF/etc),
4954f17ddefc51 Dmitry Safonov 2023-10-23  635  	 * tcp_ao_connect_init() will choose a correct matching MKT
4954f17ddefc51 Dmitry Safonov 2023-10-23  636  	 * if there's any.
4954f17ddefc51 Dmitry Safonov 2023-10-23  637  	 */
4954f17ddefc51 Dmitry Safonov 2023-10-23  638  	if (cmd.set_current) {
4954f17ddefc51 Dmitry Safonov 2023-10-23  639  		new_current = tcp_ao_established_key(ao_info, cmd.current_key, -1);
4954f17ddefc51 Dmitry Safonov 2023-10-23  640  		if (!new_current)
4954f17ddefc51 Dmitry Safonov 2023-10-23  641  			return -ENOENT;
4954f17ddefc51 Dmitry Safonov 2023-10-23  642  	}
4954f17ddefc51 Dmitry Safonov 2023-10-23  643  	if (cmd.set_rnext) {
4954f17ddefc51 Dmitry Safonov 2023-10-23  644  		new_rnext = tcp_ao_established_key(ao_info, -1, cmd.rnext);
4954f17ddefc51 Dmitry Safonov 2023-10-23  645  		if (!new_rnext)
4954f17ddefc51 Dmitry Safonov 2023-10-23  646  			return -ENOENT;
4954f17ddefc51 Dmitry Safonov 2023-10-23  647  	}
4954f17ddefc51 Dmitry Safonov 2023-10-23  648  
4954f17ddefc51 Dmitry Safonov 2023-10-23  649  	if (family == AF_INET) {
4954f17ddefc51 Dmitry Safonov 2023-10-23  650  		struct sockaddr_in *sin = (struct sockaddr_in *)&cmd.addr;
4954f17ddefc51 Dmitry Safonov 2023-10-23  651  
4954f17ddefc51 Dmitry Safonov 2023-10-23  652  		addr = (union tcp_ao_addr *)&sin->sin_addr;
4954f17ddefc51 Dmitry Safonov 2023-10-23  653  		addr_len = sizeof(struct in_addr);
4954f17ddefc51 Dmitry Safonov 2023-10-23  654  		port = ntohs(sin->sin_port);
4954f17ddefc51 Dmitry Safonov 2023-10-23  655  	} else {
4954f17ddefc51 Dmitry Safonov 2023-10-23  656  		struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *)&cmd.addr;
4954f17ddefc51 Dmitry Safonov 2023-10-23  657  		struct in6_addr *addr6 = &sin6->sin6_addr;
4954f17ddefc51 Dmitry Safonov 2023-10-23  658  
4954f17ddefc51 Dmitry Safonov 2023-10-23  659  		if (ipv6_addr_v4mapped(addr6)) {
4954f17ddefc51 Dmitry Safonov 2023-10-23  660  			addr = (union tcp_ao_addr *)&addr6->s6_addr32[3];
4954f17ddefc51 Dmitry Safonov 2023-10-23  661  			addr_len = sizeof(struct in_addr);
4954f17ddefc51 Dmitry Safonov 2023-10-23  662  			family = AF_INET;
4954f17ddefc51 Dmitry Safonov 2023-10-23  663  		} else {
4954f17ddefc51 Dmitry Safonov 2023-10-23  664  			addr = (union tcp_ao_addr *)addr6;
4954f17ddefc51 Dmitry Safonov 2023-10-23  665  			addr_len = sizeof(struct in6_addr);
4954f17ddefc51 Dmitry Safonov 2023-10-23  666  		}
4954f17ddefc51 Dmitry Safonov 2023-10-23  667  		port = ntohs(sin6->sin6_port);
4954f17ddefc51 Dmitry Safonov 2023-10-23  668  	}
4954f17ddefc51 Dmitry Safonov 2023-10-23  669  	prefix = cmd.prefix;
4954f17ddefc51 Dmitry Safonov 2023-10-23  670  
4954f17ddefc51 Dmitry Safonov 2023-10-23  671  	/* Currently matching is not performed on port (or port ranges) */
4954f17ddefc51 Dmitry Safonov 2023-10-23  672  	if (port != 0)
4954f17ddefc51 Dmitry Safonov 2023-10-23  673  		return -EINVAL;
4954f17ddefc51 Dmitry Safonov 2023-10-23  674  
4954f17ddefc51 Dmitry Safonov 2023-10-23  675  	/* We could choose random present key here for current/rnext
4954f17ddefc51 Dmitry Safonov 2023-10-23  676  	 * but that's less predictable. Let's be strict and don't
4954f17ddefc51 Dmitry Safonov 2023-10-23  677  	 * allow removing a key that's in use. RFC5925 doesn't
4954f17ddefc51 Dmitry Safonov 2023-10-23  678  	 * specify how-to coordinate key removal, but says:
4954f17ddefc51 Dmitry Safonov 2023-10-23  679  	 * "It is presumed that an MKT affecting a particular
4954f17ddefc51 Dmitry Safonov 2023-10-23  680  	 * connection cannot be destroyed during an active connection"
4954f17ddefc51 Dmitry Safonov 2023-10-23  681  	 */
4954f17ddefc51 Dmitry Safonov 2023-10-23  682  	hlist_for_each_entry_rcu(key, &ao_info->head, node) {
4954f17ddefc51 Dmitry Safonov 2023-10-23  683  		if (cmd.sndid != key->sndid ||
4954f17ddefc51 Dmitry Safonov 2023-10-23  684  		    cmd.rcvid != key->rcvid)
4954f17ddefc51 Dmitry Safonov 2023-10-23  685  			continue;
4954f17ddefc51 Dmitry Safonov 2023-10-23  686  
4954f17ddefc51 Dmitry Safonov 2023-10-23  687  		if (family != key->family ||
4954f17ddefc51 Dmitry Safonov 2023-10-23  688  		    prefix != key->prefixlen ||
4954f17ddefc51 Dmitry Safonov 2023-10-23 @689  		    memcmp(addr, &key->addr, addr_len))
4954f17ddefc51 Dmitry Safonov 2023-10-23  690  			continue;
4954f17ddefc51 Dmitry Safonov 2023-10-23  691  
4954f17ddefc51 Dmitry Safonov 2023-10-23  692  		if (key == new_current || key == new_rnext)
4954f17ddefc51 Dmitry Safonov 2023-10-23  693  			continue;
4954f17ddefc51 Dmitry Safonov 2023-10-23  694  
4954f17ddefc51 Dmitry Safonov 2023-10-23  695  		return tcp_ao_delete_key(sk, ao_info, key,
4954f17ddefc51 Dmitry Safonov 2023-10-23  696  					  new_current, new_rnext);
4954f17ddefc51 Dmitry Safonov 2023-10-23  697  	}
4954f17ddefc51 Dmitry Safonov 2023-10-23  698  	return -ENOENT;
4954f17ddefc51 Dmitry Safonov 2023-10-23  699  }
4954f17ddefc51 Dmitry Safonov 2023-10-23  700  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
