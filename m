Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C027815D
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 22:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600947; cv=none; b=lQOOWzNgmU8l+S6Do0pdpfFv8IU8MW8zbpyvbByBTZ4tQ+OqPuZ8CJ44tczbx6pN9TYtqcWMhklKUJ/u1nH+o9Yw/diZpANkaBeunawSUMIgod6VQsI3FJ8ZiLNOq8mUt5zXMJsM+vVD3p22bcnCNFW3hfssfMWdQ+A+mcqn98A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600947; c=relaxed/simple;
	bh=uJjK2Di4MkrTUA0H+n1DaathFr47k2wRmlwKkEJRTzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLvXN0e23TpBng0Y/TY5HbKD4WHe0GHn5VrYvzEDfJHBPb42TVpYULsbv0LWsn6vfyXvhwKHLg0ynkvJB4t0nG5c6Xhotbu8w+rW76I/G0aIe0Kn5gwdvdrPlEfCFslJjRCG97ykzZL+bqvPQ7VOWGqPY/1BgcJmNiYMmavM1is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miO8GMYY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miO8GMYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768600945; x=1800136945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uJjK2Di4MkrTUA0H+n1DaathFr47k2wRmlwKkEJRTzg=;
  b=miO8GMYYKUTyY+5D5SvAKGrVj5oyet6gSMYA7n0AqCadGEpAlGYi7CTs
   l3nEkFrc4hW4Wv/AC7UQlUs48NjkDCmIsTc+LexEY3hoh47WYSQG0Ozab
   weWmYWpjZPwX5n20xjp8CYr9YGBoVHLK+NpSqWHTLWs0G5rGM2H0MeZwQ
   meSvCoHdKVnpuc2Zrf9C+Mr3YkviJ5vBPdaaiJMnFicjXJ8jbEwvIiXbk
   sdZtu3pbkhFyvDePh0AKeai1oZ5Ft6nR7SBmXz0jzPmkM35mCtCAc4z1R
   g2/X4sVoHx6cuhL7vRb3jXtCbVwLymuv8ltmS/ALlcU+Duc5tC92WTNsE
   Q==;
X-CSE-ConnectionGUID: jcrSfOAUT36PdCTko1yObg==
X-CSE-MsgGUID: GDhgdWgnQJO5WJto4Yw3Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="72507452"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="72507452"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:02:24 -0800
X-CSE-ConnectionGUID: kJdXVKQeRceNvWe66nrxUQ==
X-CSE-MsgGUID: jV3g9lzHQki+uxqYbQShmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205146705"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jan 2026 14:02:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgrtc-00000000LIC-1grW;
	Fri, 16 Jan 2026 22:02:20 +0000
Date: Sat, 17 Jan 2026 06:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 12/17] firmware: arm_scmi: Add Telemetry components
 view
Message-ID: <202601170503.pgixUrV3-lkp@intel.com>
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
In-Reply-To: <20260114114638.2290765-13-cristian.marussi@arm.com>
References: <20260114114638.2290765-13-cristian.marussi@arm.com>
TO: Cristian Marussi <cristian.marussi@arm.com>

Hi Cristian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on trace/for-next linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Define-a-common-SCMI_MAX_PROTOCOLS-value/20260114-195913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260114114638.2290765-13-cristian.marussi%40arm.com
patch subject: [PATCH v2 12/17] firmware: arm_scmi: Add Telemetry components view
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-randconfig-r073-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170503.pgixUrV3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601170503.pgixUrV3-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/scmi_system_telemetry.c:2238 scmi_telemetry_de_subdir_symlink() error: uninitialized symbol 'ret'.

vim +/ret +2238 drivers/firmware/arm_scmi/scmi_system_telemetry.c

47d6794dcab7828 Cristian Marussi 2026-01-14  2195  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2196  static int scmi_telemetry_de_subdir_symlink(struct super_block *sb,
289dce6d3bc91dc Cristian Marussi 2026-01-14  2197  					    struct scmi_tlm_setup *tsp,
289dce6d3bc91dc Cristian Marussi 2026-01-14  2198  					    const struct scmi_telemetry_de *de,
289dce6d3bc91dc Cristian Marussi 2026-01-14  2199  					    struct dentry *parent)
289dce6d3bc91dc Cristian Marussi 2026-01-14  2200  {
289dce6d3bc91dc Cristian Marussi 2026-01-14  2201  	struct dentry *dentry;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2202  	struct inode *inode;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2203  	int ret;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2204  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2205  	if (IS_ERR(parent))
289dce6d3bc91dc Cristian Marussi 2026-01-14  2206  		return 0;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2207  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2208  	char *name __free(kfree) = kasprintf(GFP_KERNEL, "0x%08X", de->info->id);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2209  	if (!name)
289dce6d3bc91dc Cristian Marussi 2026-01-14  2210  		return -ENOMEM;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2211  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2212  	char *link __free(kfree) =
289dce6d3bc91dc Cristian Marussi 2026-01-14  2213  		kasprintf(GFP_KERNEL, "../../../../../des/0x%08X", de->info->id);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2214  	if (!link)
289dce6d3bc91dc Cristian Marussi 2026-01-14  2215  		return -ENOMEM;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2216  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2217  	dentry = simple_start_creating(parent, name);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2218  	if (IS_ERR(dentry))
289dce6d3bc91dc Cristian Marussi 2026-01-14  2219  		return PTR_ERR(dentry);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2220  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2221  	inode = stlmfs_get_inode(sb);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2222  	if (unlikely(!inode)) {
289dce6d3bc91dc Cristian Marussi 2026-01-14  2223  		dev_err(tsp->dev,
289dce6d3bc91dc Cristian Marussi 2026-01-14  2224  			"out of free dentries, cannot create '%s'", name);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2225  		return stlmfs_failed_creating(dentry);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2226  	}
289dce6d3bc91dc Cristian Marussi 2026-01-14  2227  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2228  	inode->i_mode = S_IFLNK | 0777;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2229  	inode->i_op = &simple_symlink_inode_operations;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2230  	inode_init_owner(&nop_mnt_idmap, inode, NULL, inode->i_mode);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2231  	inode->i_link = no_free_ptr(link);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2232  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2233  	//d_add(dentry, inode);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2234  	d_make_persistent(dentry, inode);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2235  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2236  	simple_done_creating(dentry);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2237  
289dce6d3bc91dc Cristian Marussi 2026-01-14 @2238  	return ret;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2239  }
289dce6d3bc91dc Cristian Marussi 2026-01-14  2240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
