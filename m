Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C401328B407;
	Mon, 19 Jan 2026 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838842; cv=none; b=ZeeUj/AxstJXcgFD7xjctG0ZNyGpVRtCcVXaMzGGacKPHcj5cFiMI5F7LFIAIWzQypFhH8R1jR3VlgjyocPZftTmEpvDULgqSMVb68XvcNyo8YuqrgUNIi4jVo8JkMDT3gC+v0feXZsL6QplaLVOGk40UaL+PJAHV+8Env0zKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838842; c=relaxed/simple;
	bh=BmR6zH4zI3W6B2CtVQ/dKlk/XfxVbipm1UxD7wboQL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rikqbx5MRScSsa3n8BM+K5TBXT5cg89/VdpkEg0nxV7ulSOsiHpey88FgVZEuyKQjdt7fz21oBOBjVLv3lRSIc5nUUX8RX0gc5RjyAwrfgS6esVQBJjkU55s3iEcwYTuu8ZrgLsDzargpetRDuzpjo9glc0nhB5NEEqojK9W6yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 792C1497;
	Mon, 19 Jan 2026 08:07:13 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B03A3F632;
	Mon, 19 Jan 2026 08:07:19 -0800 (PST)
Date: Mon, 19 Jan 2026 16:07:16 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 12/17] firmware: arm_scmi: Add Telemetry components
 view
Message-ID: <aW5WtAMDcr-Hqs2f@pluto>
References: <20260114114638.2290765-13-cristian.marussi@arm.com>
 <202601170503.pgixUrV3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601170503.pgixUrV3-lkp@intel.com>

On Mon, Jan 19, 2026 at 09:39:05AM +0300, Dan Carpenter wrote:
> Hi Cristian,
> 

Hi,

> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Define-a-common-SCMI_MAX_PROTOCOLS-value/20260114-195913
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> patch link:    https://lore.kernel.org/r/20260114114638.2290765-13-cristian.marussi%40arm.com
> patch subject: [PATCH v2 12/17] firmware: arm_scmi: Add Telemetry components view
> config: sparc-randconfig-r073-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170503.pgixUrV3-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 13.4.0
> smatch version: v0.5.0-8985-g2614ff1a
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601170503.pgixUrV3-lkp@intel.com/
> 
> smatch warnings:
> drivers/firmware/arm_scmi/scmi_system_telemetry.c:2238 scmi_telemetry_de_subdir_symlink() error: uninitialized symbol 'ret'.
> 
> vim +/ret +2238 drivers/firmware/arm_scmi/scmi_system_telemetry.c
> 
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2196  static int scmi_telemetry_de_subdir_symlink(struct super_block *sb,
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2197  					    struct scmi_tlm_setup *tsp,
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2198  					    const struct scmi_telemetry_de *de,
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2199  					    struct dentry *parent)
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2200  {
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2201  	struct dentry *dentry;
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2202  	struct inode *inode;
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2203  	int ret;
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2204  
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2205  	if (IS_ERR(parent))
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2206  		return 0;
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2207  
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2208  	char *name __free(kfree) = kasprintf(GFP_KERNEL, "0x%08X", de->info->id);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2209  	if (!name)
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2210  		return -ENOMEM;
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2211  
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2212  	char *link __free(kfree) =
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2213  		kasprintf(GFP_KERNEL, "../../../../../des/0x%08X", de->info->id);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2214  	if (!link)
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2215  		return -ENOMEM;
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2216  
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2217  	dentry = simple_start_creating(parent, name);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2218  	if (IS_ERR(dentry))
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2219  		return PTR_ERR(dentry);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2220  
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2221  	inode = stlmfs_get_inode(sb);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2222  	if (unlikely(!inode)) {
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2223  		dev_err(tsp->dev,
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2224  			"out of free dentries, cannot create '%s'", name);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2225  		return stlmfs_failed_creating(dentry);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2226  	}
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2227  
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2228  	inode->i_mode = S_IFLNK | 0777;
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2229  	inode->i_op = &simple_symlink_inode_operations;
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2230  	inode_init_owner(&nop_mnt_idmap, inode, NULL, inode->i_mode);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2231  	inode->i_link = no_free_ptr(link);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2232  
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2233  	//d_add(dentry, inode);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2234  	d_make_persistent(dentry, inode);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2235  
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2236  	simple_done_creating(dentry);
> 289dce6d3bc91dc Cristian Marussi 2026-01-14  2237  
> 289dce6d3bc91dc Cristian Marussi 2026-01-14 @2238  	return ret;
> 
> s/ret/0/;

Yes, my bad, a leftover from a last minute refactor causes this...it was
reported by Elif the other day on thhe ML too ...

...I am pretty much puzzled sincerely by the fact that I got no warning
directly from GCC when compiling as usual with W=1 given that this seems
a typical "use of uninitialized variable X"...or the fact that is NOT
used but only returned makes a difference...let me try with LLVM now.

Thanks,
Cristian
