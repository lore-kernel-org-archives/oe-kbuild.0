Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3418C33DEE9
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 23:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898778; cv=none; b=fik+sPQatt7YrGS0b7PJzi9ZX9xQWztv13uGOc7cUnn+if0rrqqMrqNPdiwy6osRNszwoS+vq7xf4wlWKvx8/NHhI8opBUsgOUF3l6i/kN3BtM4Wh76Z7lkuEnUXL7TkPrViTmrtW1YoqeLM9UsFKBvFFrkylP/aocJhETTbwN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898778; c=relaxed/simple;
	bh=45ff/F2QXoQ6nZiWBXnLw+3oiVyiNndEjt0vPyN6ykY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f7TmZc5aQyEGIPFai3PTU54Y//m/2AhNeuxq1wS/t+whRWVI9qkT5AA9ZsN4mov6VrTFehr3xjzD8BLMcrAj8dB0JBP/Ztti1U02JDGwcSuevmnIKuBPV8hso4g69Y8WKoBC9rM/v95ToBkQUXBk+AHGIJoxwocyzG28M5j3qYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehqxkswp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehqxkswp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790898776; x=1822434776;
  h=date:from:to:cc:subject:message-id;
  bh=45ff/F2QXoQ6nZiWBXnLw+3oiVyiNndEjt0vPyN6ykY=;
  b=ehqxkswpQD4E9qpQGPRKIZoi6UfeRk1KTrsc5jHdF2yYKRkOerbPBTPC
   xgybw4Y1lpNzAMSZ3t3+n1GuuRV595bNo1ckLmcp47DwSrzZKf8LCLwpn
   ZcR1lmJ5MQVrGVQt12vEHBa0b8myCabo3lK2corTclbEUmwUxi2vm3zQ4
   pvlGSzXjQQOhNGa49v/BUcHt9LZd4hZ34IPjTRLoPphJKsQucYxqniRRy
   4ebH7zwtrl6vOTYgKgq5CZVbYH6ZMNSyzKIfdyhV9EToCikBFE5bnUpOi
   EMAnvFRXXh6+Y5fdUF4aF0RB1sHVKfALqdjsMw0Rhu3oPIblDB1LVEQR0
   g==;
X-CSE-ConnectionGUID: fsQidftnSLekobyjvYh/Ww==
X-CSE-MsgGUID: uStF/ABcQPOpzi/5Ui7vjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="113454355"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="113454355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 16:52:56 -0700
X-CSE-ConnectionGUID: Hh6U8zkYRr+doDoXUhMX0w==
X-CSE-MsgGUID: 9JuQEKWZQeqeKNod7AcYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="272539341"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2026 16:52:54 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCQa4-000000000HZ-15zH;
	Thu, 01 Oct 2026 23:52:52 +0000
Date: Fri, 02 Oct 2026 01:52:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.1 18/18] fs/smb/client/sess.c:310
 cifs_disable_secondary_channels() error: dereferencing freed memory 'iface'
 (line 308)
Message-ID: <202610020116.n8KvKthY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   e2d429338ffa976942aba4887d0b8a7e07dc0267
commit: e341b7975bd72d3ebda92b8d747d0aad15ce8717 [18/18] cifs: handle when server stops supporting multichannel
:::::: branch date: 11 hours ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-2200-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020116.n8KvKthY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610020116.n8KvKthY-lkp@intel.com/

smatch warnings:
fs/smb/client/sess.c:310 cifs_disable_secondary_channels() error: dereferencing freed memory 'iface' (line 308)

vim +/iface +310 fs/smb/client/sess.c

d70e9fa5588476 fs/cifs/sess.c       Aurelien Aptel 2019-09-20  279  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  280  /*
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  281   * called when multichannel is disabled by the server.
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  282   * this always gets called from smb2_reconnect
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  283   * and cannot get called in parallel threads.
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  284   */
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  285  void
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  286  cifs_disable_secondary_channels(struct cifs_ses *ses)
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  287  {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  288  	int i, chan_count;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  289  	struct TCP_Server_Info *server;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  290  	struct cifs_server_iface *iface;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  291  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  292  	spin_lock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  293  	chan_count = ses->chan_count;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  294  	if (chan_count == 1)
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  295  		goto done;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  296  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  297  	ses->chan_count = 1;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  298  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  299  	/* for all secondary channels reset the need reconnect bit */
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  300  	ses->chans_need_reconnect &= 1;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  301  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  302  	for (i = 1; i < chan_count; i++) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  303  		iface = ses->chans[i].iface;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  304  		server = ses->chans[i].server;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  305  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  306  		if (iface) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  307  			spin_lock(&ses->iface_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16 @308  			kref_put(&iface->refcount, release_iface);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  309  			ses->chans[i].iface = NULL;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16 @310  			iface->num_channels--;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  311  			if (iface->weight_fulfilled)
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  312  				iface->weight_fulfilled--;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  313  			spin_unlock(&ses->iface_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  314  		}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  315  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  316  		spin_unlock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  317  		if (server && !server->terminate) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  318  			server->terminate = true;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  319  			cifs_signal_cifsd_for_reconnect(server, false);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  320  		}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  321  		spin_lock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  322  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  323  		if (server) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  324  			ses->chans[i].server = NULL;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  325  			cifs_put_tcp_session(server, false);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  326  		}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  327  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  328  	}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  329  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  330  done:
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  331  	spin_unlock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  332  }
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  333  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
