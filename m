Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880629476
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 18:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679509794; x=1711045794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPScgBmxozkhtXtM4702X8xKYy21rYqdCXag94+R+Hw=;
  b=WpLBO7v/ZV7sjzuuGQnF6GycwXuXsffily2TL//BrSgcQsjjHu/Ez98G
   DMqDmuTfGGJVpHcom8WIhEeR2cVHXX9iYt1TLAybfWG2loQtK6MmFOicL
   iOzsSeAD7kMXi4EJzdoPgkh8SpO3SYcQbR4g0qj5EhMa3AZGXZ6Dx6k3/
   DKoA5ocQV4SQcix+7FH7vUDTqFIC7YG6YioMoqhOlqlzYko4t1Ls3104f
   5U9Flw6fVJ276UHpxkfSRbQNgjtg2Kzw4E30mSuOz89a5sJKkj1XqBX6j
   TRTO+DPQ43lod+M8wYIRl8+eGwhr4Z8e5vqmIgOzm8P6VRqtwBDmlmCw2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341658725"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="341658725"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 11:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="712357404"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="712357404"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Mar 2023 11:29:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf3DZ-000DZO-2v;
	Wed, 22 Mar 2023 18:29:49 +0000
Date: Thu, 23 Mar 2023 02:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cifs:for-next 3/8] fs/cifs/connect.c:1303 cifs_ipaddr_cmp() error:
 memcmp() '&saddr4->sin_addr.s_addr' too small (4 vs 16)
Message-ID: <202303230210.ufS9gVzi-lkp@intel.com>
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
CC: linux-cifs@vger.kernel.org
CC: samba-technical@lists.samba.org
TO: Shyam Prasad N <sprasad@microsoft.com>
CC: Steve French <stfrench@microsoft.com>
CC: "Paulo Alcantara (SUSE)" <pc@manguebit.com>

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   96114df697dfaef2ce29c14089a83e4a5777e915
commit: 010c4e0a894e6a3dee3176aa2f654fce632d0346 [3/8] cifs: fix sockaddr comparison in iface_cmp
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230323/202303230210.ufS9gVzi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303230210.ufS9gVzi-lkp@intel.com/

New smatch warnings:
fs/cifs/connect.c:1303 cifs_ipaddr_cmp() error: memcmp() '&saddr4->sin_addr.s_addr' too small (4 vs 16)
fs/cifs/connect.c:1318 cifs_ipaddr_cmp() error: memcmp() '&saddr6->sin6_addr' too small (16 vs 28)

Old smatch warnings:
fs/cifs/connect.c:1303 cifs_ipaddr_cmp() error: memcmp() '&vaddr4->sin_addr.s_addr' too small (4 vs 16)
fs/cifs/connect.c:1318 cifs_ipaddr_cmp() error: memcmp() '&vaddr6->sin6_addr' too small (16 vs 28)
fs/cifs/connect.c:2937 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2925)

vim +1303 fs/cifs/connect.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  1278  
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1279  int
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1280  cifs_ipaddr_cmp(struct sockaddr *srcaddr, struct sockaddr *rhs)
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1281  {
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1282  	struct sockaddr_in *saddr4 = (struct sockaddr_in *)srcaddr;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1283  	struct sockaddr_in *vaddr4 = (struct sockaddr_in *)rhs;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1284  	struct sockaddr_in6 *saddr6 = (struct sockaddr_in6 *)srcaddr;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1285  	struct sockaddr_in6 *vaddr6 = (struct sockaddr_in6 *)rhs;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1286  
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1287  	switch (srcaddr->sa_family) {
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1288  	case AF_UNSPEC:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1289  		switch (rhs->sa_family) {
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1290  		case AF_UNSPEC:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1291  			return 0;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1292  		case AF_INET:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1293  		case AF_INET6:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1294  			return 1;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1295  		default:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1296  			return -1;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1297  		}
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1298  	case AF_INET: {
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1299  		switch (rhs->sa_family) {
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1300  		case AF_UNSPEC:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1301  			return -1;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1302  		case AF_INET:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27 @1303  			return memcmp(&saddr4->sin_addr.s_addr,
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1304  			       &vaddr4->sin_addr.s_addr,
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1305  			       sizeof(struct sockaddr_in));
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1306  		case AF_INET6:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1307  			return 1;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1308  		default:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1309  			return -1;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1310  		}
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1311  	}
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1312  	case AF_INET6: {
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1313  		switch (rhs->sa_family) {
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1314  		case AF_UNSPEC:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1315  		case AF_INET:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1316  			return -1;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1317  		case AF_INET6:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27 @1318  			return memcmp(&saddr6->sin6_addr,
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1319  				      &vaddr6->sin6_addr,
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1320  				      sizeof(struct sockaddr_in6));
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1321  		default:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1322  			return -1;
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1323  		}
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1324  	}
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1325  	default:
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1326  		return -1; /* don't expect to be here */
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1327  	}
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1328  }
010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1329  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
