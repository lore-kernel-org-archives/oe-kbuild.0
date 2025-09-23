Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383F030DD25
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 05:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604304; cv=none; b=ABXmGVWjZyLtic1Y7vvY6SxZ0CArIwCSI9RJJlaJrPOOlzZM1pPLuOuAEXikcR7XSG3mMvzgd2Y83Zbu7HYHlkVClubgexFrTZnft6JsYSBiChIqzDnJ1wC6U1Runb/BqZAI37Hi3ipSR2+oh6xKo/H6T1mkD1hvlB9YduaQYSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604304; c=relaxed/simple;
	bh=FSIBCKcDZufJaK3hBNt6v7qW808dk1ovZ1/SMsF4pMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rwO8atvnWTvLoG52zfkkQMrzDmV+QhGkzBcsBnYky7ChIlWfFgApDTzfc+dGHbuZPbd3Rqjcp79hTtKSzq12lmgosLf7k/qWIs16zgM3EmfiULRad+FmoQB+F63xvulIbNjtid8IyEjEkhDbjvHE48CJlKLqOWexhaxsFj8vSRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cv1HxnJ4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cv1HxnJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758604302; x=1790140302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FSIBCKcDZufJaK3hBNt6v7qW808dk1ovZ1/SMsF4pMo=;
  b=cv1HxnJ4Iyg1l84pxRmsjsTdqy6SQwBdO4XR2NT70kExXcX2PRallsTS
   oPg8G0ot1Hff/qMih0UQaTtFRycxnv5Er/BjFn1++jI6UWv5b3EZR7ExU
   S/+5xxWoZjC5HMKsvm58gQ7GcutsE+heZrIJuC86P4FE8rfDBNuGXrRPV
   PiJ6ORTDniSnOs8Wyv42yCyft1V67KpIT+FecWB8HJrxdv58nYxdT3I16
   Aer/EPOGh4x3AdYfepRuPvTE9VDzMmGVI7pcXmHaai8iynSwrYfK9UXY4
   i53KEebIeCd8I5yatB9NOHEsjyrxWZXkbnEOmdvzpfyI1f8ILxnK8gagU
   g==;
X-CSE-ConnectionGUID: 6mDyih/eSjqnzHoD9ZpJ/g==
X-CSE-MsgGUID: 0XkgzRV/RiSOoC6am34zvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60932630"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="60932630"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 22:11:41 -0700
X-CSE-ConnectionGUID: Ity+li/tTDOsQYlm+9JVWQ==
X-CSE-MsgGUID: K18ybBvZQ1eyThfI7ujssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176741940"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Sep 2025 22:11:40 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0vJQ-0002lN-1J;
	Tue, 23 Sep 2025 05:11:36 +0000
Date: Tue, 23 Sep 2025 13:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] cifs: client: allow changing multichannel mount
 options on remount
Message-ID: <202509231242.5ZgtQ3Ye-lkp@intel.com>
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
In-Reply-To: <20250922082417.816331-2-rajasimandalos@gmail.com>
References: <20250922082417.816331-2-rajasimandalos@gmail.com>
TO: rajasimandalos@gmail.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.17-rc7 next-20250922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/rajasimandalos-gmail-com/cifs-client-allow-changing-multichannel-mount-options-on-remount/20250922-162930
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20250922082417.816331-2-rajasimandalos%40gmail.com
patch subject: [PATCH 2/2] cifs: client: allow changing multichannel mount options on remount
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231242.5ZgtQ3Ye-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509231242.5ZgtQ3Ye-lkp@intel.com/

New smatch warnings:
fs/smb/client/sess.c:327 cifs_decrease_secondary_channels() error: uninitialized symbol 'server'.
fs/smb/client/sess.c:327 cifs_decrease_secondary_channels() error: we previously assumed 'server' could be null (see line 314)

Old smatch warnings:
fs/smb/client/sess.c:330 cifs_decrease_secondary_channels() error: uninitialized symbol 'server'.
fs/smb/client/sess.c:448 cifs_chan_update_iface() warn: iterator used outside loop: 'iface'
fs/smb/client/sess.c:456 cifs_chan_update_iface() warn: iterator used outside loop: 'iface'

vim +/server +327 fs/smb/client/sess.c

d70e9fa5588476 fs/cifs/sess.c       Aurelien Aptel   2019-09-20  266  
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  267  /**
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  268   * cifs_decrease_secondary_channels - Reduce the number of active secondary channels
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  269   * @ses: pointer to the CIFS session structure
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  270   * @from_reconfigure: if true, only reduce to chan_max; if false, reduce to a single channel
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  271   *
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  272   * This function disables and cleans up extra secondary channels for a CIFS session.
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  273   * If called during reconfiguration, it reduces the channel count to the new maximum (chan_max).
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  274   * Otherwise, it disables all but the primary channel.
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  275   */
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  276  void cifs_decrease_secondary_channels(struct cifs_ses *ses, bool from_reconfigure)
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  277  {
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  278  	int i, chan_count;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  279  	struct TCP_Server_Info *server;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  280  	struct cifs_server_iface *iface;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  281  
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  282  	spin_lock(&ses->chan_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  283  	chan_count = ses->chan_count;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  284  	if (chan_count == 1)
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  285  		goto done;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  286  
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  287  	// Update the chan_count to the new maximum
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  288  	if (from_reconfigure)
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  289  		ses->chan_count = ses->chan_max;
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  290  	else
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  291  		ses->chan_count = 1;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  292  
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  293  	for (i = ses->chan_max ; i < chan_count; i++) {
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  294  		iface = ses->chans[i].iface;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  295  		server = ses->chans[i].server;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  296  
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  297  		/*
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  298  		 * remove these references first, since we need to unlock
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  299  		 * the chan_lock here, since iface_lock is a higher lock
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  300  		 */
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  301  		ses->chans[i].iface = NULL;
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  302  		ses->chans[i].server = NULL;
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  303  		spin_unlock(&ses->chan_lock);
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  304  
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  305  		if (iface) {
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  306  			spin_lock(&ses->iface_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  307  			iface->num_channels--;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  308  			if (iface->weight_fulfilled)
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  309  				iface->weight_fulfilled--;
a15ccef82d3de9 fs/smb/client/sess.c Ritvik Budhiraja 2023-11-21  310  			kref_put(&iface->refcount, release_iface);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  311  			spin_unlock(&ses->iface_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  312  		}
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  313  
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14 @314  		if (server) {
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  315  			if (!server->terminate) {
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  316  				server->terminate = true;
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  317  				cifs_signal_cifsd_for_reconnect(server, false);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  318  			}
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  319  			cifs_put_tcp_session(server, false);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  320  		}
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  321  
5eef12c4e3230f fs/smb/client/sess.c Shyam Prasad N   2023-11-14  322  		spin_lock(&ses->chan_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  323  	}
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  324  
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  325  	/* For extra secondary channels, reset the need reconnect bit */
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  326  	if (ses->chan_count == 1) {
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22 @327  		cifs_server_dbg(VFS, "server does not support multichannel anymore. Disable all other channels\n");
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  328  		ses->chans_need_reconnect &= 1;
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  329  	} else {
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  330  		cifs_server_dbg(VFS, "Disable extra secondary channels\n");
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  331  		ses->chans_need_reconnect &= ((1UL << ses->chan_max) - 1);
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  332  	}
1fdbd8c19e792a fs/smb/client/sess.c Rajasi Mandal    2025-09-22  333  
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  334  done:
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  335  	spin_unlock(&ses->chan_lock);
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  336  }
ee1d21794e55ab fs/smb/client/sess.c Shyam Prasad N   2023-10-13  337  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
