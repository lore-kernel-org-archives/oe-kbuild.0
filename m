Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04D1E51D
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742131910; cv=none; b=BzIwiBpNOSV9c/tcI8cK1HE8DV1h/N8Ux14nsESn9fJox1U7C07TQUzAIBhDty6PgF19vwMCnUe4Ljr7S3TjFSkXbN3Hthvy4AX3bU5+cG445vUHuZvzl0WRBEGRVRlPAJOlXX74EK4j6UjVbb4ohSR1BBzJ+HuNF/oX55AjR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742131910; c=relaxed/simple;
	bh=YoWMMnWxLwqDJuAHWtIk+sn/sUHL/obX60Rw78y4IIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EdzwAEvgiEiSm5iBrjsvpb36my5HdgLL/jJtK0D/DyTU6e8ZpKTSIT8Sg7SX8eg+XUtXGehCpJ2oGv7jh9NXqVPP9UAF1botxWZ29jwj+R5ZZML6XNkWk/6QlKYfHoNFnsD1nWghPQwTJNtDS4LNY054Wu9LP/1pFI6lXfWMFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7SkLGhC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7SkLGhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742131908; x=1773667908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YoWMMnWxLwqDJuAHWtIk+sn/sUHL/obX60Rw78y4IIU=;
  b=n7SkLGhCpwDk2WRShvNjMCeBn1A+9k1XCaHvBlD4FsHWIwGhy0jCbSCz
   BR6R+lJ7VmCWEIwMC+dQwHc4rEvjtbGDnOmkIZC+QXlFPZUaS3Z0a1DUD
   WeaBvAyGeZlQf9lcP9VuWkBVwpPpUo22j7RuVDM9v3LSnJRxVJ4zH8iJr
   x/xDFtcKPBry9Qu5fv8FlEv8J3r6w1nznJnD2jeJ/WJ/LbtkC8ZctjJjM
   x9mRP6DgfmmlA0YeuYcMwlgfoQk2TcXyjNnqi2QuCkTpDqa2QK10vDrPS
   OPIZt93dMUDxRz3w5UeVGrg0JsQipKHm2c/Uv19VGO2fy9YtyCQ2oZj8N
   Q==;
X-CSE-ConnectionGUID: diHDvpG9RUySIm9fzs28ow==
X-CSE-MsgGUID: bFjEuqRnQRip/PBEbGmHMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="60628408"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="60628408"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 06:31:47 -0700
X-CSE-ConnectionGUID: QdprgF0FQZqnDWwXJdvw3w==
X-CSE-MsgGUID: kw+bhLNdQgO0KUOEGNwSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="122454378"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Mar 2025 06:31:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tto5f-000C0t-1g;
	Sun, 16 Mar 2025 13:31:43 +0000
Date: Sun, 16 Mar 2025 21:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net 1/2] mlxsw: spectrum_acl_bloom_filter: Expand
 chunk_key_offsets[chunk_index]
Message-ID: <202503162139.LEIr7P4G-lkp@intel.com>
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
In-Reply-To: <78951564F9FEA017+20250311141701.1626533-1-wangyuli@uniontech.com>
References: <78951564F9FEA017+20250311141701.1626533-1-wangyuli@uniontech.com>
TO: WangYuli <wangyuli@uniontech.com>
TO: wangyuli@uniontech.com
CC: andrew+netdev@lunn.ch
CC: chenlinxuan@uniontech.com
CC: czj2441@163.com
CC: davem@davemloft.net
CC: edumazet@google.com
CC: guanwentao@uniontech.com
CC: idosch@nvidia.com
CC: kuba@kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: niecheng1@uniontech.com
CC: pabeni@redhat.com
CC: petrm@nvidia.com
CC: zhanjun@uniontech.com

Hi WangYuli,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/WangYuli/mlxsw-spectrum_acl_bloom_filter-Expand-chunk_key_offsets-chunk_index/20250311-222122
base:   net/main
patch link:    https://lore.kernel.org/r/78951564F9FEA017%2B20250311141701.1626533-1-wangyuli%40uniontech.com
patch subject: [PATCH net 1/2] mlxsw: spectrum_acl_bloom_filter: Expand chunk_key_offsets[chunk_index]
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r073-20250316 (https://download.01.org/0day-ci/archive/20250316/202503162139.LEIr7P4G-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503162139.LEIr7P4G-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlxsw/spectrum_acl_bloom_filter.c:264 __mlxsw_sp_acl_bf_key_encode() error: uninitialized symbol 'enc_key_src_ptr'.

vim +/enc_key_src_ptr +264 drivers/net/ethernet/mellanox/mlxsw/spectrum_acl_bloom_filter.c

7585cacdb978a0c Nir Dotan  2018-12-16  219  
7585cacdb978a0c Nir Dotan  2018-12-16  220  static void
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  221  __mlxsw_sp_acl_bf_key_encode(struct mlxsw_sp_acl_atcam_region *aregion,
7585cacdb978a0c Nir Dotan  2018-12-16  222  			     struct mlxsw_sp_acl_atcam_entry *aentry,
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  223  			     char *output, u8 *len, u8 max_chunks, u8 pad_bytes,
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  224  			     u8 key_offset, u8 chunk_key_len, u8 chunk_len)
7585cacdb978a0c Nir Dotan  2018-12-16  225  {
7585cacdb978a0c Nir Dotan  2018-12-16  226  	struct mlxsw_afk_key_info *key_info = aregion->region->key_info;
7585cacdb978a0c Nir Dotan  2018-12-16  227  	u8 chunk_index, chunk_count, block_count;
7585cacdb978a0c Nir Dotan  2018-12-16  228  	char *chunk = output;
c0a2f6d8b271a37 WangYuli   2025-03-11  229  	char *enc_key_src_ptr;
7585cacdb978a0c Nir Dotan  2018-12-16  230  	__be16 erp_region_id;
7585cacdb978a0c Nir Dotan  2018-12-16  231  
7585cacdb978a0c Nir Dotan  2018-12-16  232  	block_count = mlxsw_afk_key_info_blocks_count_get(key_info);
7585cacdb978a0c Nir Dotan  2018-12-16  233  	chunk_count = 1 + ((block_count - 1) >> 2);
7585cacdb978a0c Nir Dotan  2018-12-16  234  	erp_region_id = cpu_to_be16(aentry->ht_key.erp_id |
7585cacdb978a0c Nir Dotan  2018-12-16  235  				   (aregion->region->id << 4));
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  236  	for (chunk_index = max_chunks - chunk_count; chunk_index < max_chunks;
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  237  	     chunk_index++) {
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  238  		memset(chunk, 0, pad_bytes);
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  239  		memcpy(chunk + pad_bytes, &erp_region_id,
7585cacdb978a0c Nir Dotan  2018-12-16  240  		       sizeof(erp_region_id));
c0a2f6d8b271a37 WangYuli   2025-03-11  241  /* Each chunk contains 4 key blocks. Chunk 2 uses key blocks 11-8,
c0a2f6d8b271a37 WangYuli   2025-03-11  242   * and we need to populate it with 4 key blocks copied from the entry encoded
c0a2f6d8b271a37 WangYuli   2025-03-11  243   * key. The original keys layout is same for Spectrum-{2,3,4}.
c0a2f6d8b271a37 WangYuli   2025-03-11  244   * Since the encoded key contains a 2 bytes padding, key block 11 starts at
c0a2f6d8b271a37 WangYuli   2025-03-11  245   * offset 2. block 7 that is used in chunk 1 starts at offset 20 as 4 key blocks
c0a2f6d8b271a37 WangYuli   2025-03-11  246   * take 18 bytes. See 'MLXSW_SP2_AFK_BLOCK_LAYOUT' for more details.
c0a2f6d8b271a37 WangYuli   2025-03-11  247   * This array defines key offsets for easy access when copying key blocks from
c0a2f6d8b271a37 WangYuli   2025-03-11  248   * entry key to Bloom filter chunk.
c0a2f6d8b271a37 WangYuli   2025-03-11  249   *
c0a2f6d8b271a37 WangYuli   2025-03-11  250   * Define the acceptable values for chunk_index to prevent LLVM from failing
c0a2f6d8b271a37 WangYuli   2025-03-11  251   * compilation in certain circumstances.
c0a2f6d8b271a37 WangYuli   2025-03-11  252   */
c0a2f6d8b271a37 WangYuli   2025-03-11  253  		switch (chunk_index) {
c0a2f6d8b271a37 WangYuli   2025-03-11  254  		case 0:
c0a2f6d8b271a37 WangYuli   2025-03-11  255  			enc_key_src_ptr = &aentry->ht_key.enc_key[2];
c0a2f6d8b271a37 WangYuli   2025-03-11  256  			break;
c0a2f6d8b271a37 WangYuli   2025-03-11  257  		case 1:
c0a2f6d8b271a37 WangYuli   2025-03-11  258  			enc_key_src_ptr = &aentry->ht_key.enc_key[20];
c0a2f6d8b271a37 WangYuli   2025-03-11  259  			break;
c0a2f6d8b271a37 WangYuli   2025-03-11  260  		case 2:
c0a2f6d8b271a37 WangYuli   2025-03-11  261  			enc_key_src_ptr = &aentry->ht_key.enc_key[38];
c0a2f6d8b271a37 WangYuli   2025-03-11  262  			break;
c0a2f6d8b271a37 WangYuli   2025-03-11  263  		}
c0a2f6d8b271a37 WangYuli   2025-03-11 @264  		memcpy(chunk + key_offset, enc_key_src_ptr, chunk_key_len);
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  265  		chunk += chunk_len;
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  266  	}
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  267  	*len = chunk_count * chunk_len;
7585cacdb978a0c Nir Dotan  2018-12-16  268  }
5d5c3ba9e4121b7 Amit Cohen 2022-01-06  269  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
