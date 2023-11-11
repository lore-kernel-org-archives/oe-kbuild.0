Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0915B8
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 00:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxjGnCpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699664098; x=1731200098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qUrA5/rKyf8nOib/NrLG4Q6c6s68ZkBaBhRYtvdlX2I=;
  b=bxjGnCpv+i5N5CZyyUN6JwEktmQxvnolDollrJry4kWngAfdz1tj9ToK
   Qw1HKh1LYEtCgWkpUpf7cft+UJ1PWf51/KBJQ6qmRBW3mCR7pDaPSe1L+
   J5mMs1yuSN7pPb1IzFGzeqlmZyM9zzHFj5QDcqyCezBDF/sk9r8as4EKm
   XWjVcfwE6RgM/7n74yhbNvJyYQW32pxk5d74OFOb0JqdrC6rGXnYVuVWu
   REzABYyNTWas/i+IaYixuQIneBWAl7idDiTXL0mUFIah3ROPXuXjCzJJJ
   UQ/WnQIYyMNqws2fh6Zyf+wYKjawKGWKnUk87PqELvcfk7d/eUFH1BeSW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="389110990"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="389110990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 16:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="11590824"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Nov 2023 16:54:53 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1cGx-000A6B-23;
	Sat, 11 Nov 2023 00:54:51 +0000
Date: Sat, 11 Nov 2023 08:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cifs:for-next 8/13] fs/smb/client/sess.c:323
 cifs_disable_secondary_channels() error: dereferencing freed memory 'iface'
Message-ID: <202311110815.UJaeU3Tt-lkp@intel.com>
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

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   fd2bd7c0539e28f267a84da8d68f9378511b50a7
commit: aa52cd09620b0ebd34ccae0e7f9f5b773497a499 [8/13] cifs: handle when server stops supporting multichannel
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20231108 (https://download.01.org/0day-ci/archive/20231111/202311110815.UJaeU3Tt-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110815.UJaeU3Tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311110815.UJaeU3Tt-lkp@intel.com/

smatch warnings:
fs/smb/client/sess.c:323 cifs_disable_secondary_channels() error: dereferencing freed memory 'iface'

vim +/iface +323 fs/smb/client/sess.c

d70e9fa5588476 fs/cifs/sess.c       Aurelien Aptel 2019-09-20  292  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  293  /*
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  294   * called when multichannel is disabled by the server.
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  295   * this always gets called from smb2_reconnect
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  296   * and cannot get called in parallel threads.
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  297   */
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  298  void
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  299  cifs_disable_secondary_channels(struct cifs_ses *ses)
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  300  {
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  301  	int i, chan_count;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  302  	struct TCP_Server_Info *server;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  303  	struct cifs_server_iface *iface;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  304  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  305  	spin_lock(&ses->chan_lock);
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  306  	chan_count = ses->chan_count;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  307  	if (chan_count == 1)
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  308  		goto done;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  309  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  310  	ses->chan_count = 1;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  311  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  312  	/* for all secondary channels reset the need reconnect bit */
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  313  	ses->chans_need_reconnect &= 1;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  314  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  315  	for (i = 1; i < chan_count; i++) {
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  316  		iface = ses->chans[i].iface;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  317  		server = ses->chans[i].server;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  318  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  319  		if (iface) {
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  320  			spin_lock(&ses->iface_lock);
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  321  			kref_put(&iface->refcount, release_iface);
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  322  			ses->chans[i].iface = NULL;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13 @323  			iface->num_channels--;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  324  			if (iface->weight_fulfilled)
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  325  				iface->weight_fulfilled--;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  326  			spin_unlock(&ses->iface_lock);
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  327  		}
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  328  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  329  		spin_unlock(&ses->chan_lock);
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  330  		if (server && !server->terminate) {
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  331  			server->terminate = true;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  332  			cifs_signal_cifsd_for_reconnect(server, false);
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  333  		}
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  334  		spin_lock(&ses->chan_lock);
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  335  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  336  		if (server) {
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  337  			ses->chans[i].server = NULL;
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  338  			cifs_put_tcp_session(server, false);
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  339  		}
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  340  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  341  	}
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  342  
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  343  done:
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  344  	spin_unlock(&ses->chan_lock);
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  345  }
aa52cd09620b0e fs/smb/client/sess.c Shyam Prasad N 2023-10-13  346  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
