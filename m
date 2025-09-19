Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E6F3090DB
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758278487; cv=none; b=JxcpZo/wo247y2CsFMbguGbdPK3EgOi4ExSM77DL+gZeoqCUmPi/VJuBUJz3hyJ1PeJdjQ3jKzzAAuD5vwVRUH6LhOmWFC/m3OrprcHyaadNccPXEUmfpxi0AslRzlLJrKbaeDA48FM/RS/QnZUzj3Ef9UXbOjKpJcsaQHL7mT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758278487; c=relaxed/simple;
	bh=8ugGBTe6/f8KQaEf8W161isZJGhGwarDvnmP9glkPOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lmaESbuWxhMUXOT+fhU+/STm/n9GSXVkuyQ++HMbli6C54SqQf2ky7b4GKVX4LPh6Xru+1kfFBX+1/Q0uu/nSY+o97DiAXHBmuw9COdcNYxgEkjP0sNZInefzKc7rINv7+UL3kgIdJtSvE9oaKOxrWswhbbymaFcax6eSnPz+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJ2kJ7wr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJ2kJ7wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758278482; x=1789814482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ugGBTe6/f8KQaEf8W161isZJGhGwarDvnmP9glkPOE=;
  b=ZJ2kJ7wrH55f63ZcD4POdTemZNuOd2lfFxgY/qKEu1Wmp9hI/k6abwm9
   V8Vzi5ME+FpaUFFJ1KhhP13ZWb2pmITQxDLmJbPJ7MCS+M6HKFLSCpFXd
   5IMlv5+LAUcov86PrK7sSYf5/RFEhlAxKQShO2OEO8dSMMftJ35/N65eM
   JzteJZYlvurtvRMhAhjGApCEIacvnILEdeg0e21qZWZuRFeAMFUfHuUTS
   fkyCpKurJjpzTES8EYVnyO+f0EP93JtE5CSkWXz0pq1eimEGKMR5mLqvC
   uTQF/PCkL0rwl/CqxIAM1iDU7wog+mOB7RLpIR3d6SSdGYSbNPqzi7+7R
   w==;
X-CSE-ConnectionGUID: ciJKQvpvShGZCDPCwqO3Fw==
X-CSE-MsgGUID: j9S6totHRYqYpTazixIu4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="59663870"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="59663870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:41:22 -0700
X-CSE-ConnectionGUID: evqLyRvaRBCafKEqV3aVKA==
X-CSE-MsgGUID: FjGgwjvtQq2eQKLtQsOIig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="175622673"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Sep 2025 03:41:20 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzYYI-0004DL-08;
	Fri, 19 Sep 2025 10:41:18 +0000
Date: Fri, 19 Sep 2025 18:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bytedance:6.6-velinux 5959/5959] drivers/block/nbd.c:1298
 nbd_reconnect_socket() warn: inconsistent returns '&nsock->tx_lock'.
Message-ID: <202509191844.UIjeXrdY-lkp@intel.com>
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
TO: jason.zeng@intel.com

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   267e33ff5e034d9f9222c229e6967b6ceb65e27a
commit: 454e732aaf9bdba6d2183f14939163e6a37dfbd3 [5959/5959] bytedance: nbd: Don't use workqueue to create recv threads
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-161-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191844.UIjeXrdY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509191844.UIjeXrdY-lkp@intel.com/

smatch warnings:
drivers/block/nbd.c:1298 nbd_reconnect_socket() warn: inconsistent returns '&nsock->tx_lock'.

vim +1298 drivers/block/nbd.c

23272a6754b81f Markus Schneider-Pargmann 2015-10-29  1229  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1230  static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
b7aa3d39385dc2 Josef Bacik               2017-04-06  1231  {
b7aa3d39385dc2 Josef Bacik               2017-04-06  1232  	struct nbd_config *config = nbd->config;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1233  	struct socket *sock, *old;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1234  	struct recv_thread_args *args;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1235  	int i;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1236  	int err;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1237  
cf1b2326b73489 Mike Christie             2019-10-17  1238  	sock = nbd_get_socket(nbd, arg, &err);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1239  	if (!sock)
b7aa3d39385dc2 Josef Bacik               2017-04-06  1240  		return err;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1241  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1242  	args = kzalloc(sizeof(*args), GFP_KERNEL);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1243  	if (!args) {
b7aa3d39385dc2 Josef Bacik               2017-04-06  1244  		sockfd_put(sock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1245  		return -ENOMEM;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1246  	}
b7aa3d39385dc2 Josef Bacik               2017-04-06  1247  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1248  	for (i = 0; i < config->num_connections; i++) {
b7aa3d39385dc2 Josef Bacik               2017-04-06  1249  		struct nbd_sock *nsock = config->socks[i];
454e732aaf9bdb Xie Yongji                2021-12-17  1250  		struct task_struct *worker;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1251  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1252  		if (!nsock->dead)
b7aa3d39385dc2 Josef Bacik               2017-04-06  1253  			continue;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1254  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1255  		mutex_lock(&nsock->tx_lock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1256  		if (!nsock->dead) {
b7aa3d39385dc2 Josef Bacik               2017-04-06  1257  			mutex_unlock(&nsock->tx_lock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1258  			continue;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1259  		}
454e732aaf9bdb Xie Yongji                2021-12-17  1260  		worker = kthread_create(recv_work, args, "knbd%d.%d-recv",
454e732aaf9bdb Xie Yongji                2021-12-17  1261  					nbd->index, i);
454e732aaf9bdb Xie Yongji                2021-12-17  1262  		if (!worker) {
454e732aaf9bdb Xie Yongji                2021-12-17  1263  			sockfd_put(sock);
454e732aaf9bdb Xie Yongji                2021-12-17  1264  			kfree(args);
454e732aaf9bdb Xie Yongji                2021-12-17  1265  			return -ENOMEM;
454e732aaf9bdb Xie Yongji                2021-12-17  1266  		}
454e732aaf9bdb Xie Yongji                2021-12-17  1267  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1268  		sk_set_memalloc(sock->sk);
5eafd64a3bd2ab Hou Pu                    2020-11-06  1269  		if (nbd->tag_set.timeout &&
5eafd64a3bd2ab Hou Pu                    2020-11-06  1270  		    !test_bit(NBD_RT_WAIT_ON_TIMEOUT, &config->runtime_flags))
dc88e34d69d87c Josef Bacik               2017-06-08  1271  			sock->sk->sk_sndtimeo = nbd->tag_set.timeout;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1272  		atomic_inc(&config->recv_threads);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1273  		refcount_inc(&nbd->config_refs);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1274  		old = nsock->sock;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1275  		nsock->fallback_index = -1;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1276  		nsock->sock = sock;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1277  		nsock->dead = false;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1278  		args->index = i;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1279  		args->nbd = nbd;
7e62a555d99f2f Li Nan                    2023-09-11  1280  		args->nsock = nsock;
799f9a38bc9f55 Josef Bacik               2017-04-06  1281  		nsock->cookie++;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1282  		mutex_unlock(&nsock->tx_lock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1283  		sockfd_put(old);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1284  
ec76a7b922e42d Xiubo Li                  2019-09-17  1285  		clear_bit(NBD_RT_DISCONNECTED, &config->runtime_flags);
7a362ea96d0df8 Josef Bacik               2017-07-25  1286  
b7aa3d39385dc2 Josef Bacik               2017-04-06  1287  		/* We take the tx_mutex in an error path in the recv_work, so we
b7aa3d39385dc2 Josef Bacik               2017-04-06  1288  		 * need to queue_work outside of the tx_mutex.
b7aa3d39385dc2 Josef Bacik               2017-04-06  1289  		 */
454e732aaf9bdb Xie Yongji                2021-12-17  1290  		wake_up_process(worker);
560bc4b39952ed Josef Bacik               2017-04-06  1291  
560bc4b39952ed Josef Bacik               2017-04-06  1292  		atomic_inc(&config->live_connections);
560bc4b39952ed Josef Bacik               2017-04-06  1293  		wake_up(&config->conn_wait);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1294  		return 0;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1295  	}
b7aa3d39385dc2 Josef Bacik               2017-04-06  1296  	sockfd_put(sock);
b7aa3d39385dc2 Josef Bacik               2017-04-06  1297  	kfree(args);
b7aa3d39385dc2 Josef Bacik               2017-04-06 @1298  	return -ENOSPC;
b7aa3d39385dc2 Josef Bacik               2017-04-06  1299  }
b7aa3d39385dc2 Josef Bacik               2017-04-06  1300  

:::::: The code at line 1298 was first introduced by commit
:::::: b7aa3d39385dc2d95899f9e379623fef446a2acd nbd: add a reconfigure netlink command

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
