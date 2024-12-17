Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607BE13DB9F
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734458887; cv=none; b=C+GvXe9SK7zWRp+fOFV3PmnRK7SMzfF5HfzUjYQn/LencVlRHEyi6Muupg1Jg+7p2sDKj5GnN2ohpXJ3cMqEdGIjUV3VpkYsTs7AzdPKys2ELMyqgtdYclFiPNBEFWs+8NN+kKiVBBBdJzacMYzpafmvxs2zN7rwv7Y63il6YkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734458887; c=relaxed/simple;
	bh=Rt1x+xA4LtLRAuu9CSJgbOgRnKjv/GwOd/BeV6mkSks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t94GGyohpBYP9LvSqWnaF2zIqfu4hLE4jflWAf/Osvmvc8bDAi5kUHdTgLiKb08vFGBGAAhlqlCiwaT0Xltx+hStB44jsK2A19fXtGQQR37Tekk2yjM2HGxmI/rHK3+aBPZbUCS16SLK0yaTtaZQTrlG8N/JPvWF3RAWh8BNBBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGAHvyM9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGAHvyM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734458885; x=1765994885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rt1x+xA4LtLRAuu9CSJgbOgRnKjv/GwOd/BeV6mkSks=;
  b=dGAHvyM9xoF3n6tiN4LNTQ7kenKC7EyFyb4PSLAHjDufKD1WH57rH01c
   Qg6uzJyF0AFo1GUeXQNfi0QFqwjwryMKhQaRTahqxFuhvgHCZiactETI2
   FodwZoSsGNTMMJWpaDPqrCvAl8AGg6BujkMEOanS0St5aBPSZTzPajll7
   WmvOmet1I3MU+8ihIE43zlK98hIa+IbEMaB3K/KwilD/Jo8TlMTO7F+Q5
   7v7WxT7IH9ZDnpeoAwe/2GO8AleWf0L82zCW0XwFfA3CSZRjKG6Pft1bK
   7qAHyg97va4zKXpJmE0ZITMBqj0xHAz1MFKA1LEWMr8+Tnum+J41lA1t5
   A==;
X-CSE-ConnectionGUID: CcDvPCEETF6UY7Abl/QLeA==
X-CSE-MsgGUID: 0vzOZBPVRZOyB5mIaZwZgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38837491"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38837491"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 10:08:04 -0800
X-CSE-ConnectionGUID: up8ADDK8Q+mI1OtiueXy0Q==
X-CSE-MsgGUID: DfYlDImPSkSzDBl3METWrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98045734"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Dec 2024 10:08:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNbzF-000FiQ-0g;
	Tue, 17 Dec 2024 18:08:01 +0000
Date: Wed, 18 Dec 2024 02:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/scsi/mpi3mr/mpi3mr_app.c:1096:14-15: WARNING opportunity for
 min()
Message-ID: <202412180102.cbjJZsnI-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Chandrakanth patil <chandrakanth.patil@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Sathya Prakash <sathya.prakash@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   59dbb9d81adfe07a6f8483269146b407cf9d44d7
commit: fb231d7deffb41fd445929a3b79815277b883fec scsi: mpi3mr: Support for preallocation of SGL BSG data buffers part-2
date:   1 year ago
:::::: branch date: 89 minutes ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-101-20241217 (https://download.01.org/0day-ci/archive/20241218/202412180102.cbjJZsnI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412180102.cbjJZsnI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/mpi3mr/mpi3mr_app.c:1096:14-15: WARNING opportunity for min()

vim +1096 drivers/scsi/mpi3mr/mpi3mr_app.c

fb231d7deffb41f Chandrakanth patil 2023-12-06  1057  
fb231d7deffb41f Chandrakanth patil 2023-12-06  1058  /**
fb231d7deffb41f Chandrakanth patil 2023-12-06  1059   * mpi3mr_map_data_buffer_dma - build dma descriptors for data
fb231d7deffb41f Chandrakanth patil 2023-12-06  1060   *                              buffers
fb231d7deffb41f Chandrakanth patil 2023-12-06  1061   * @mrioc: Adapter instance reference
fb231d7deffb41f Chandrakanth patil 2023-12-06  1062   * @drv_buf: buffer map descriptor
fb231d7deffb41f Chandrakanth patil 2023-12-06  1063   * @desc_count: Number of already consumed dma descriptors
fb231d7deffb41f Chandrakanth patil 2023-12-06  1064   *
fb231d7deffb41f Chandrakanth patil 2023-12-06  1065   * This function computes how many pre-allocated DMA descriptors
fb231d7deffb41f Chandrakanth patil 2023-12-06  1066   * are required for the given data buffer and if those number of
fb231d7deffb41f Chandrakanth patil 2023-12-06  1067   * descriptors are free, then setup the mapping of the scattered
fb231d7deffb41f Chandrakanth patil 2023-12-06  1068   * DMA address to the given data buffer, if the data direction
fb231d7deffb41f Chandrakanth patil 2023-12-06  1069   * of the buffer is DMA_TO_DEVICE then the actual data is copied to
fb231d7deffb41f Chandrakanth patil 2023-12-06  1070   * the DMA buffers
fb231d7deffb41f Chandrakanth patil 2023-12-06  1071   *
fb231d7deffb41f Chandrakanth patil 2023-12-06  1072   * Return: 0 on success, -1 on failure
fb231d7deffb41f Chandrakanth patil 2023-12-06  1073   */
fb231d7deffb41f Chandrakanth patil 2023-12-06  1074  static int mpi3mr_map_data_buffer_dma(struct mpi3mr_ioc *mrioc,
fb231d7deffb41f Chandrakanth patil 2023-12-06  1075  				      struct mpi3mr_buf_map *drv_buf,
fb231d7deffb41f Chandrakanth patil 2023-12-06  1076  				      u16 desc_count)
fb231d7deffb41f Chandrakanth patil 2023-12-06  1077  {
fb231d7deffb41f Chandrakanth patil 2023-12-06  1078  	u16 i, needed_desc = drv_buf->kern_buf_len / MPI3MR_IOCTL_SGE_SIZE;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1079  	u32 buf_len = drv_buf->kern_buf_len, copied_len = 0;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1080  
fb231d7deffb41f Chandrakanth patil 2023-12-06  1081  	if (drv_buf->kern_buf_len % MPI3MR_IOCTL_SGE_SIZE)
fb231d7deffb41f Chandrakanth patil 2023-12-06  1082  		needed_desc++;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1083  	if ((needed_desc + desc_count) > MPI3MR_NUM_IOCTL_SGE) {
fb231d7deffb41f Chandrakanth patil 2023-12-06  1084  		dprint_bsg_err(mrioc, "%s: DMA descriptor mapping error %d:%d:%d\n",
fb231d7deffb41f Chandrakanth patil 2023-12-06  1085  			       __func__, needed_desc, desc_count, MPI3MR_NUM_IOCTL_SGE);
fb231d7deffb41f Chandrakanth patil 2023-12-06  1086  		return -1;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1087  	}
fb231d7deffb41f Chandrakanth patil 2023-12-06  1088  	drv_buf->dma_desc = kzalloc(sizeof(*drv_buf->dma_desc) * needed_desc,
fb231d7deffb41f Chandrakanth patil 2023-12-06  1089  				    GFP_KERNEL);
fb231d7deffb41f Chandrakanth patil 2023-12-06  1090  	if (!drv_buf->dma_desc)
fb231d7deffb41f Chandrakanth patil 2023-12-06  1091  		return -1;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1092  	for (i = 0; i < needed_desc; i++, desc_count++) {
fb231d7deffb41f Chandrakanth patil 2023-12-06  1093  		drv_buf->dma_desc[i].addr = mrioc->ioctl_sge[desc_count].addr;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1094  		drv_buf->dma_desc[i].dma_addr =
fb231d7deffb41f Chandrakanth patil 2023-12-06  1095  		    mrioc->ioctl_sge[desc_count].dma_addr;
fb231d7deffb41f Chandrakanth patil 2023-12-06 @1096  		if (buf_len < mrioc->ioctl_sge[desc_count].size)
fb231d7deffb41f Chandrakanth patil 2023-12-06  1097  			drv_buf->dma_desc[i].size = buf_len;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1098  		else
fb231d7deffb41f Chandrakanth patil 2023-12-06  1099  			drv_buf->dma_desc[i].size =
fb231d7deffb41f Chandrakanth patil 2023-12-06  1100  			    mrioc->ioctl_sge[desc_count].size;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1101  		buf_len -= drv_buf->dma_desc[i].size;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1102  		memset(drv_buf->dma_desc[i].addr, 0,
fb231d7deffb41f Chandrakanth patil 2023-12-06  1103  		       mrioc->ioctl_sge[desc_count].size);
fb231d7deffb41f Chandrakanth patil 2023-12-06  1104  		if (drv_buf->data_dir == DMA_TO_DEVICE) {
fb231d7deffb41f Chandrakanth patil 2023-12-06  1105  			memcpy(drv_buf->dma_desc[i].addr,
fb231d7deffb41f Chandrakanth patil 2023-12-06  1106  			       drv_buf->bsg_buf + copied_len,
fb231d7deffb41f Chandrakanth patil 2023-12-06  1107  			       drv_buf->dma_desc[i].size);
fb231d7deffb41f Chandrakanth patil 2023-12-06  1108  			copied_len += drv_buf->dma_desc[i].size;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1109  		}
fb231d7deffb41f Chandrakanth patil 2023-12-06  1110  	}
fb231d7deffb41f Chandrakanth patil 2023-12-06  1111  	drv_buf->num_dma_desc = needed_desc;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1112  	return 0;
fb231d7deffb41f Chandrakanth patil 2023-12-06  1113  }
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1114  /**
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1115   * mpi3mr_bsg_process_mpt_cmds - MPI Pass through BSG handler
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1116   * @job: BSG job reference
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1117   *
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1118   * This function is the top level handler for MPI Pass through
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1119   * command, this does basic validation of the input data buffers,
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1120   * identifies the given buffer types and MPI command, allocates
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1121   * DMAable memory for user given buffers, construstcs SGL
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1122   * properly and passes the command to the firmware.
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1123   *
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1124   * Once the MPI command is completed the driver copies the data
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1125   * if any and reply, sense information to user provided buffers.
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1126   * If the command is timed out then issues controller reset
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1127   * prior to returning.
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1128   *
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1129   * Return: 0 on success and proper error codes on failure
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1130   */
506bc1a0d6ba626 Sumit Saxena       2022-04-29  1131  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
