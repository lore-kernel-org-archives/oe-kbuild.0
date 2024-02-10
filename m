Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD02923B0
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Feb 2024 04:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707540548; cv=none; b=bxkmr0F9g54fbBardTQ9oePRe3Vh6ce+0KToo/dFSCzaIafcWsAJolxVhn8Z/8zSmz+Jo66e5f3fU4AXwLNpFo313KRY6xj9V/azzXVWOrLhFOgFCgT9hCLCW6Fta9IX8sh669ioytz3lDaoOJE0jOgDDc65I9G/bRC6sLSqrv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707540548; c=relaxed/simple;
	bh=pWaciSDLQcpI5p7FMJQLCb6oDygnWDt6TD4u6m3UjYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWgg1G4Py0EzBJ1DXAdZ5Kb+oHlnPJD8XdPqLEPWc5PUHzzIDXfpCq9MP/RiZuHnQE83x7IbxMrKqCKPLVSxri/slegSPpABfsiiQiYA7AerNzJiML3gWLjmpGShsys/HRDv5zlWPW+st2LCdt/wcUm4QMu4GMNdDaazsu9ddi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCBMERey; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCBMERey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707540546; x=1739076546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pWaciSDLQcpI5p7FMJQLCb6oDygnWDt6TD4u6m3UjYE=;
  b=YCBMERey8EnAXtERQkwj1ZIiUf5byyPdWNrE92WarrC7RFqTeB2/KLZs
   0ZvjapD+OgBywoukdbbrJpksa7c/Ik4sB4tpCw4+FZTXjxs3N2kAu4fIw
   lSnXnHBQSbM2r5w1jPu3HklEQ2fgaTbIDDcCMz0IoNy2XooT+D7Bhxaz3
   6Cu4FyOOfMgsXm1ENhZbdnEXF+qMt7EmgbyvcevG9Ry9iuYU+FHIM8E8M
   umXhXOqJYt69xeCXgWpQ+pWCP2EiA028v9IxnnHr0ACsO5DG5YdsWnZ3H
   /cy62z13u1V2fpOytH7elYswVpu0RBIGChxdWXy1K/pZDP2l22XvH2dfs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1438003"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="1438003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 20:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="2097157"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2024 20:49:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYfIT-0005M6-1W;
	Sat, 10 Feb 2024 04:49:01 +0000
Date: Sat, 10 Feb 2024 12:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-nonmm-unstable 98/98] fs/smb/client/sess.c:467
 cifs_chan_update_iface() warn: iterator used outside loop: 'iface'
Message-ID: <202402101231.WiUVwetp-lkp@intel.com>
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
TO: Wei Yang <richard.weiyang@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   3ecfe35aea92fbe3fb5dbb680daa91365c87a7b2
commit: 231ff099a7527929783cc949e07879ba55ea6cb5 [98/98] list: leverage list_is_head() for list_entry_is_head()
:::::: branch date: 4 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-141-20240209 (https://download.01.org/0day-ci/archive/20240210/202402101231.WiUVwetp-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402101231.WiUVwetp-lkp@intel.com/

New smatch warnings:
fs/smb/client/sess.c:467 cifs_chan_update_iface() warn: iterator used outside loop: 'iface'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1172 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c:126 nvkm_uconn_uevent() warn: iterator used outside loop: 'outp'
drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:311 r535_chan_id_get_locked() warn: iterator used outside loop: 'userd'

Old smatch warnings:
fs/smb/client/sess.c:88 cifs_ses_get_chan_index() warn: variable dereferenced before check 'server' (see line 79)
fs/smb/client/sess.c:277 cifs_try_adding_channels() error: dereferencing freed memory 'iface'
fs/smb/client/sess.c:475 cifs_chan_update_iface() warn: iterator used outside loop: 'iface'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1176 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1182 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1188 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1194 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1200 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1206 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1210 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1216 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1220 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1224 gk104_ram_prog_0() warn: iterator used outside loop: 'cfg'
drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c:130 nvkm_uconn_uevent() warn: iterator used outside loop: 'outp'

vim +/iface +467 fs/smb/client/sess.c

ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N 2023-10-13  362  
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  363  /*
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  364   * update the iface for the channel if necessary.
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  365   * Must be called with chan_lock held.
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  366   */
8d606c311b75e8 fs/smb/client/sess.c Dan Carpenter  2024-01-08  367  void
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  368  cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *server)
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  369  {
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  370  	unsigned int chan_index;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  371  	size_t iface_weight = 0, iface_min_speed = 0;
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  372  	struct cifs_server_iface *iface = NULL;
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  373  	struct cifs_server_iface *old_iface = NULL;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  374  	struct cifs_server_iface *last_iface = NULL;
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  375  	struct sockaddr_storage ss;
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  376  
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  377  	spin_lock(&ses->chan_lock);
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  378  	chan_index = cifs_ses_get_chan_index(ses, server);
0c51cc6f2cb010 fs/smb/client/sess.c Shyam Prasad N 2023-10-13  379  	if (chan_index == CIFS_INVAL_CHAN_INDEX) {
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  380  		spin_unlock(&ses->chan_lock);
8d606c311b75e8 fs/smb/client/sess.c Dan Carpenter  2024-01-08  381  		return;
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  382  	}
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  383  
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  384  	if (ses->chans[chan_index].iface) {
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  385  		old_iface = ses->chans[chan_index].iface;
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  386  		if (old_iface->is_active) {
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  387  			spin_unlock(&ses->chan_lock);
8d606c311b75e8 fs/smb/client/sess.c Dan Carpenter  2024-01-08  388  			return;
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  389  		}
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  390  	}
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  391  	spin_unlock(&ses->chan_lock);
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  392  
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  393  	spin_lock(&server->srv_lock);
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  394  	ss = server->dstaddr;
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  395  	spin_unlock(&server->srv_lock);
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  396  
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  397  	spin_lock(&ses->iface_lock);
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  398  	if (!ses->iface_count) {
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  399  		spin_unlock(&ses->iface_lock);
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  400  		cifs_dbg(VFS, "server %s does not advertise interfaces\n", ses->server->hostname);
8d606c311b75e8 fs/smb/client/sess.c Dan Carpenter  2024-01-08  401  		return;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  402  	}
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  403  
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  404  	last_iface = list_last_entry(&ses->iface_list, struct cifs_server_iface,
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  405  				     iface_head);
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  406  	iface_min_speed = last_iface->speed;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  407  
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  408  	/* then look for a new one */
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  409  	list_for_each_entry(iface, &ses->iface_list, iface_head) {
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  410  		if (!chan_index) {
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  411  			/* if we're trying to get the updated iface for primary channel */
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  412  			if (!cifs_match_ipaddr((struct sockaddr *) &ss,
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  413  					       (struct sockaddr *) &iface->sockaddr))
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  414  				continue;
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  415  
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  416  			kref_get(&iface->refcount);
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  417  			break;
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  418  		}
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  419  
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  420  		/* do not mix rdma and non-rdma interfaces */
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  421  		if (iface->rdma_capable != server->rdma)
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  422  			continue;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  423  
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  424  		if (!iface->is_active ||
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  425  		    (is_ses_using_iface(ses, iface) &&
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  426  		     !iface->rss_capable)) {
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  427  			continue;
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  428  		}
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  429  
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  430  		/* check if we already allocated enough channels */
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  431  		iface_weight = iface->speed / iface_min_speed;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  432  
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  433  		if (iface->weight_fulfilled >= iface_weight)
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  434  			continue;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  435  
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  436  		kref_get(&iface->refcount);
7246210ecdd0cd fs/cifs/sess.c       Shyam Prasad N 2022-12-27  437  		break;
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  438  	}
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  439  
7246210ecdd0cd fs/cifs/sess.c       Shyam Prasad N 2022-12-27  440  	if (list_entry_is_head(iface, &ses->iface_list, iface_head)) {
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  441  		iface = NULL;
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  442  		cifs_dbg(FYI, "unable to find a suitable iface\n");
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  443  	}
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  444  
12d1e301bdfd1f fs/smb/client/sess.c Shyam Prasad N 2023-12-15  445  	if (!iface) {
516eea97f92f1e fs/smb/client/sess.c Shyam Prasad N 2023-12-29  446  		if (!chan_index)
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  447  			cifs_dbg(FYI, "unable to get the interface matching: %pIS\n",
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  448  				 &ss);
516eea97f92f1e fs/smb/client/sess.c Shyam Prasad N 2023-12-29  449  		else {
516eea97f92f1e fs/smb/client/sess.c Shyam Prasad N 2023-12-29  450  			cifs_dbg(FYI, "unable to find another interface to replace: %pIS\n",
516eea97f92f1e fs/smb/client/sess.c Shyam Prasad N 2023-12-29  451  				 &old_iface->sockaddr);
516eea97f92f1e fs/smb/client/sess.c Shyam Prasad N 2023-12-29  452  		}
516eea97f92f1e fs/smb/client/sess.c Shyam Prasad N 2023-12-29  453  
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  454  		spin_unlock(&ses->iface_lock);
8d606c311b75e8 fs/smb/client/sess.c Dan Carpenter  2024-01-08  455  		return;
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  456  	}
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  457  
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  458  	/* now drop the ref to the current iface */
12d1e301bdfd1f fs/smb/client/sess.c Shyam Prasad N 2023-12-15  459  	if (old_iface) {
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  460  		cifs_dbg(FYI, "replacing iface: %pIS with %pIS\n",
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  461  			 &old_iface->sockaddr,
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  462  			 &iface->sockaddr);
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  463  
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  464  		old_iface->num_channels--;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  465  		if (old_iface->weight_fulfilled)
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  466  			old_iface->weight_fulfilled--;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26 @467  		iface->num_channels++;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  468  		iface->weight_fulfilled++;
a6d8fb54a515f0 fs/smb/client/sess.c Shyam Prasad N 2022-12-26  469  
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  470  		kref_put(&old_iface->refcount, release_iface);
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  471  	} else if (!chan_index) {
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  472  		/* special case: update interface for primary channel */
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  473  		cifs_dbg(FYI, "referencing primary channel iface: %pIS\n",
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  474  			 &iface->sockaddr);
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  475  		iface->num_channels++;
fa1d0508bdd4a6 fs/smb/client/sess.c Shyam Prasad N 2023-03-14  476  		iface->weight_fulfilled++;
12d1e301bdfd1f fs/smb/client/sess.c Shyam Prasad N 2023-12-15  477  	}
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  478  	spin_unlock(&ses->iface_lock);
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  479  
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  480  	spin_lock(&ses->chan_lock);
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  481  	chan_index = cifs_ses_get_chan_index(ses, server);
0c51cc6f2cb010 fs/smb/client/sess.c Shyam Prasad N 2023-10-13  482  	if (chan_index == CIFS_INVAL_CHAN_INDEX) {
0c51cc6f2cb010 fs/smb/client/sess.c Shyam Prasad N 2023-10-13  483  		spin_unlock(&ses->chan_lock);
8d606c311b75e8 fs/smb/client/sess.c Dan Carpenter  2024-01-08  484  		return;
0c51cc6f2cb010 fs/smb/client/sess.c Shyam Prasad N 2023-10-13  485  	}
0c51cc6f2cb010 fs/smb/client/sess.c Shyam Prasad N 2023-10-13  486  
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  487  	ses->chans[chan_index].iface = iface;
8da33fd11c05b7 fs/cifs/sess.c       Shyam Prasad N 2022-06-24  488  	spin_unlock(&ses->chan_lock);
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  489  }
b54034a73baf9f fs/cifs/sess.c       Shyam Prasad N 2022-01-03  490  

:::::: The code at line 467 was first introduced by commit
:::::: a6d8fb54a515f0546ffdb7870102b1238917e567 cifs: distribute channels across interfaces based on speed

:::::: TO: Shyam Prasad N <sprasad@microsoft.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
