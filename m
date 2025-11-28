Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B612E0902
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 21:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764366822; cv=none; b=S2rmwyKBroYQAqJCrA1QzOTSWDiHFXOC/fKjuLAG+hl2zvAApGTmfTnU76UPVLvggut/MLMdFOBVjemjQTXT2R7TyN5rkXmLVhEw8m8Ee9xY5CAwYQ7dHU2JF4aZjq5IqAy2NT4x/k4U+vSrzU7Ph4Y9wWPeqGB3uPaZYCMhOgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764366822; c=relaxed/simple;
	bh=WqRgsZWPBJ7LOYEe3nyvmNGT0+ga/s0BX813rlp+Dwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qVWWejKaPEvB08kFq7+N9KbjpR7zANqCzGzkQpJhw42r0Hnz44n6IOtodZxtKP9R4dskPtmIzMc7d6Qe2Ho6/vXX2A8R9kJxVlM5q5z5cbk5gBaLzLV30M1LD9HBVzmgu+oWCiXJ0d/aO+og6v88m40SzppkiDZop/CelF1+0gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6dXC8IF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6dXC8IF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764366819; x=1795902819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WqRgsZWPBJ7LOYEe3nyvmNGT0+ga/s0BX813rlp+Dwg=;
  b=W6dXC8IFGrSUyhTsTc5NPRmxsM+/3sK2+rcy3DjLeBQ9ciH27cbOftI+
   LrpHHV1XluSVqfIlvxoTGMyxvFVyc1JBbTDBrjLtUUv7VQLmO16AIVXPF
   l+GkUqnfx5w9yAcWc8ucEHJ1MAeNj0m2DLM/lipP2xehNGFDvkADoN3es
   IbEuqiA3IvAZoXfOZoVhz2Tn/lbJcXVp0ZVO8XM4YkbMPw7khpxgbiwIS
   2KcybZDLS76usudKt9k82MX+JPvRNkm3Yk0l05a4DoJgbXFiQJug1Xaw8
   UAH2Gz5Vy3HMspqdS2pGTquS4SdwL041C4xa/dk3zteuTqMeQZkLGEO/J
   g==;
X-CSE-ConnectionGUID: y1JkHZZsRcKcuNUUs8S2DQ==
X-CSE-MsgGUID: BJqyZeECT12mYtNcXDG6yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77498990"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="77498990"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 13:53:39 -0800
X-CSE-ConnectionGUID: LbBFA3zOQ6SiKOz7j7QzqA==
X-CSE-MsgGUID: WqMtN/+rTLOpi9yaeFgSQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="194325193"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2025 13:53:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP6PH-000000006mT-2jgT;
	Fri, 28 Nov 2025 21:53:35 +0000
Date: Sat, 29 Nov 2025 05:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] ceph: add subvolume metrics collection and reporting
Message-ID: <202511290541.wFDJlRdO-lkp@intel.com>
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
In-Reply-To: <20251127134620.2035796-4-amarkuze@redhat.com>
References: <20251127134620.2035796-4-amarkuze@redhat.com>
TO: Alex Markuze <amarkuze@redhat.com>
TO: ceph-devel@vger.kernel.org
CC: idryomov@gmail.com
CC: linux-fsdevel@vger.kernel.org
CC: amarkuze@redhat.com
CC: vdubeyko@redhat.com

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ceph-client/for-linus]
[also build test WARNING on linus/master v6.18-rc7 next-20251128]
[cannot apply to ceph-client/testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Markuze/ceph-handle-InodeStat-v8-versioned-field-in-reply-parsing/20251127-214928
base:   https://github.com/ceph/ceph-client.git for-linus
patch link:    https://lore.kernel.org/r/20251127134620.2035796-4-amarkuze%40redhat.com
patch subject: [PATCH 3/3] ceph: add subvolume metrics collection and reporting
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290541.wFDJlRdO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511290541.wFDJlRdO-lkp@intel.com/

smatch warnings:
fs/ceph/debugfs.c:436 subvolume_metrics_show() error: we previously assumed 'mdsc' could be null (see line 399)

vim +/mdsc +436 fs/ceph/debugfs.c

247b1f19dbeb485 Xiubo Li     2020-11-11  389  
d469e1da62544e7 Alex Markuze 2025-11-27  390  static int subvolume_metrics_show(struct seq_file *s, void *p)
d469e1da62544e7 Alex Markuze 2025-11-27  391  {
d469e1da62544e7 Alex Markuze 2025-11-27  392  	struct ceph_fs_client *fsc = s->private;
d469e1da62544e7 Alex Markuze 2025-11-27  393  	struct ceph_mds_client *mdsc = fsc->mdsc;
d469e1da62544e7 Alex Markuze 2025-11-27  394  	struct ceph_subvol_metric_snapshot *snapshot = NULL;
d469e1da62544e7 Alex Markuze 2025-11-27  395  	u32 nr = 0;
d469e1da62544e7 Alex Markuze 2025-11-27  396  	u64 total_sent = 0;
d469e1da62544e7 Alex Markuze 2025-11-27  397  	u32 i;
d469e1da62544e7 Alex Markuze 2025-11-27  398  
d469e1da62544e7 Alex Markuze 2025-11-27 @399  	if (mdsc) {
d469e1da62544e7 Alex Markuze 2025-11-27  400  		mutex_lock(&mdsc->subvol_metrics_last_mutex);
d469e1da62544e7 Alex Markuze 2025-11-27  401  		if (mdsc->subvol_metrics_last &&
d469e1da62544e7 Alex Markuze 2025-11-27  402  		    mdsc->subvol_metrics_last_nr) {
d469e1da62544e7 Alex Markuze 2025-11-27  403  			nr = mdsc->subvol_metrics_last_nr;
d469e1da62544e7 Alex Markuze 2025-11-27  404  			snapshot = kmemdup(mdsc->subvol_metrics_last,
d469e1da62544e7 Alex Markuze 2025-11-27  405  					   nr * sizeof(*snapshot),
d469e1da62544e7 Alex Markuze 2025-11-27  406  					   GFP_KERNEL);
d469e1da62544e7 Alex Markuze 2025-11-27  407  			if (!snapshot)
d469e1da62544e7 Alex Markuze 2025-11-27  408  				nr = 0;
d469e1da62544e7 Alex Markuze 2025-11-27  409  		}
d469e1da62544e7 Alex Markuze 2025-11-27  410  		total_sent = mdsc->subvol_metrics_sent;
d469e1da62544e7 Alex Markuze 2025-11-27  411  		mutex_unlock(&mdsc->subvol_metrics_last_mutex);
d469e1da62544e7 Alex Markuze 2025-11-27  412  	}
d469e1da62544e7 Alex Markuze 2025-11-27  413  
d469e1da62544e7 Alex Markuze 2025-11-27  414  	seq_puts(s, "Last sent subvolume metrics:\n");
d469e1da62544e7 Alex Markuze 2025-11-27  415  	if (!nr) {
d469e1da62544e7 Alex Markuze 2025-11-27  416  		seq_puts(s, "  (none)\n");
d469e1da62544e7 Alex Markuze 2025-11-27  417  	} else {
d469e1da62544e7 Alex Markuze 2025-11-27  418  		seq_puts(s, "  subvol_id          rd_ops    wr_ops    rd_bytes       wr_bytes       rd_lat_us      wr_lat_us\n");
d469e1da62544e7 Alex Markuze 2025-11-27  419  		for (i = 0; i < nr; i++) {
d469e1da62544e7 Alex Markuze 2025-11-27  420  			const struct ceph_subvol_metric_snapshot *e = &snapshot[i];
d469e1da62544e7 Alex Markuze 2025-11-27  421  
d469e1da62544e7 Alex Markuze 2025-11-27  422  			seq_printf(s, "  %-18llu %-9llu %-9llu %-14llu %-14llu %-14llu %-14llu\n",
d469e1da62544e7 Alex Markuze 2025-11-27  423  				   e->subvolume_id,
d469e1da62544e7 Alex Markuze 2025-11-27  424  				   e->read_ops, e->write_ops,
d469e1da62544e7 Alex Markuze 2025-11-27  425  				   e->read_bytes, e->write_bytes,
d469e1da62544e7 Alex Markuze 2025-11-27  426  				   e->read_latency_us, e->write_latency_us);
d469e1da62544e7 Alex Markuze 2025-11-27  427  		}
d469e1da62544e7 Alex Markuze 2025-11-27  428  	}
d469e1da62544e7 Alex Markuze 2025-11-27  429  	kfree(snapshot);
d469e1da62544e7 Alex Markuze 2025-11-27  430  
d469e1da62544e7 Alex Markuze 2025-11-27  431  	seq_puts(s, "\nStatistics:\n");
d469e1da62544e7 Alex Markuze 2025-11-27  432  	seq_printf(s, "  entries_sent:      %llu\n", total_sent);
d469e1da62544e7 Alex Markuze 2025-11-27  433  
d469e1da62544e7 Alex Markuze 2025-11-27  434  	mutex_lock(&mdsc->subvol_metrics_last_mutex);
d469e1da62544e7 Alex Markuze 2025-11-27  435  	seq_printf(s, "  non_zero_sends:    %llu\n",
d469e1da62544e7 Alex Markuze 2025-11-27 @436  		   mdsc->subvol_metrics_nonzero_sends);
d469e1da62544e7 Alex Markuze 2025-11-27  437  	mutex_unlock(&mdsc->subvol_metrics_last_mutex);
d469e1da62544e7 Alex Markuze 2025-11-27  438  
d469e1da62544e7 Alex Markuze 2025-11-27  439  	seq_puts(s, "\nPending (unsent) subvolume metrics:\n");
d469e1da62544e7 Alex Markuze 2025-11-27  440  	ceph_subvolume_metrics_dump(&fsc->mdsc->subvol_metrics, s);
d469e1da62544e7 Alex Markuze 2025-11-27  441  	return 0;
d469e1da62544e7 Alex Markuze 2025-11-27  442  }
d469e1da62544e7 Alex Markuze 2025-11-27  443  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
