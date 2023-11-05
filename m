Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898348C13
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GL3oDlKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699186929; x=1730722929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enkKMtZRkaK9L/m2SpToJvPBEPv0WJhrHo9EJVBF+Tk=;
  b=GL3oDlKDzafI1v9I8/kGSpVdjs+dc22R/1ziIRH4nsWxOoG74SxnWcy0
   ydc1GNkelk5xzHrIOksj8FiTQzi8zfuBA0GGLKpvMW0hQyJI9Rl61lPJ4
   rbie1DmyG2mvhlg4Ny2J7SVxfccWcjAKUgCLVhMOcHzzLutPZ6n6dVEao
   pZoTCnM7xOFZ3dkHkTlFBHWnEg58H0mKFk9FSWLfDrZGgQbnHtrtacP36
   zlNhStc6tvvMvE0xiaA5qwo33O2AHlGBVBB7UuoZ5UsYqVui2EdPCfS1t
   javiv1wb2QhlgYkALbJ3VWVE5vjOm+hpQ8YpU/4OP6wvOaRE7u5RjTXu0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="392009501"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392009501"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 04:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="935551882"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="935551882"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Nov 2023 04:22:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzc8i-0005Pk-2c;
	Sun, 05 Nov 2023 12:22:04 +0000
Date: Sun, 5 Nov 2023 20:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.c:159
 handle_blkmsg_req() error: uninitialized symbol 'blk_type'.
Message-ID: <202311052042.vMM1J6uw-lkp@intel.com>
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
TO: Tom Zanussi <tom.zanussi@linux.intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: a4b16dad46576ce08ecb660fc923d0857dcae107 crypto: qat - Move driver to drivers/crypto/intel/qat
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20231104 (https://download.01.org/0day-ci/archive/20231105/202311052042.vMM1J6uw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311052042.vMM1J6uw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311052042.vMM1J6uw-lkp@intel.com/

New smatch warnings:
drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.c:159 handle_blkmsg_req() error: uninitialized symbol 'blk_type'.

Old smatch warnings:
drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.c:159 handle_blkmsg_req() error: uninitialized symbol 'blk_byte'.
drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.c:160 handle_blkmsg_req() error: uninitialized symbol 'byte_max'.
drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.c:168 handle_blkmsg_req() error: uninitialized symbol 'blk_type'.
drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.c:168 handle_blkmsg_req() error: uninitialized symbol 'blk_byte'.
drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.c:169 handle_blkmsg_req() error: uninitialized symbol 'byte_max'.

vim +/blk_type +159 drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.c

673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  122  
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  123  static struct pfvf_message handle_blkmsg_req(struct adf_accel_vf_info *vf_info,
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  124  					     struct pfvf_message req)
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  125  {
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  126  	u8 resp_type = ADF_PF2VF_BLKMSG_RESP_TYPE_ERROR;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  127  	struct pfvf_message resp = { 0 };
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  128  	u8 resp_data = 0;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  129  	u8 blk_type;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  130  	u8 blk_byte;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  131  	u8 byte_max;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  132  
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  133  	switch (req.type) {
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  134  	case ADF_VF2PF_MSGTYPE_LARGE_BLOCK_REQ:
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  135  		blk_type = FIELD_GET(ADF_VF2PF_LARGE_BLOCK_TYPE_MASK, req.data)
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  136  			   + ADF_VF2PF_MEDIUM_BLOCK_TYPE_MAX + 1;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  137  		blk_byte = FIELD_GET(ADF_VF2PF_LARGE_BLOCK_BYTE_MASK, req.data);
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  138  		byte_max = ADF_VF2PF_LARGE_BLOCK_BYTE_MAX;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  139  		break;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  140  	case ADF_VF2PF_MSGTYPE_MEDIUM_BLOCK_REQ:
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  141  		blk_type = FIELD_GET(ADF_VF2PF_MEDIUM_BLOCK_TYPE_MASK, req.data)
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  142  			   + ADF_VF2PF_SMALL_BLOCK_TYPE_MAX + 1;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  143  		blk_byte = FIELD_GET(ADF_VF2PF_MEDIUM_BLOCK_BYTE_MASK, req.data);
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  144  		byte_max = ADF_VF2PF_MEDIUM_BLOCK_BYTE_MAX;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  145  		break;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  146  	case ADF_VF2PF_MSGTYPE_SMALL_BLOCK_REQ:
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  147  		blk_type = FIELD_GET(ADF_VF2PF_SMALL_BLOCK_TYPE_MASK, req.data);
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  148  		blk_byte = FIELD_GET(ADF_VF2PF_SMALL_BLOCK_BYTE_MASK, req.data);
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  149  		byte_max = ADF_VF2PF_SMALL_BLOCK_BYTE_MAX;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  150  		break;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  151  	}
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  152  
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  153  	/* Is this a request for CRC or data? */
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  154  	if (FIELD_GET(ADF_VF2PF_BLOCK_CRC_REQ_MASK, req.data)) {
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  155  		dev_dbg(&GET_DEV(vf_info->accel_dev),
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  156  			"BlockMsg of type %d for CRC over %d bytes received from VF%d\n",
dd3d081b7ea675 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2022-04-07  157  			blk_type, blk_byte + 1, vf_info->vf_nr);
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  158  
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16 @159  		if (!adf_pf2vf_blkmsg_get_data(vf_info, blk_type, blk_byte,
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  160  					       byte_max, &resp_data,
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  161  					       adf_pf2vf_blkmsg_get_crc))
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  162  			resp_type = ADF_PF2VF_BLKMSG_RESP_TYPE_CRC;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  163  	} else {
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  164  		dev_dbg(&GET_DEV(vf_info->accel_dev),
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  165  			"BlockMsg of type %d for data byte %d received from VF%d\n",
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  166  			blk_type, blk_byte, vf_info->vf_nr);
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  167  
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  168  		if (!adf_pf2vf_blkmsg_get_data(vf_info, blk_type, blk_byte,
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  169  					       byte_max, &resp_data,
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  170  					       adf_pf2vf_blkmsg_get_byte))
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  171  			resp_type = ADF_PF2VF_BLKMSG_RESP_TYPE_DATA;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  172  	}
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  173  
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  174  	resp.type = ADF_PF2VF_MSGTYPE_BLKMSG_RESP;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  175  	resp.data = FIELD_PREP(ADF_PF2VF_BLKMSG_RESP_TYPE_MASK, resp_type) |
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  176  		    FIELD_PREP(ADF_PF2VF_BLKMSG_RESP_DATA_MASK, resp_data);
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  177  
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  178  	return resp;
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  179  }
673184a2a58f93 drivers/crypto/qat/qat_common/adf_pfvf_pf_proto.c Marco Chiappero 2021-12-16  180  

:::::: The code at line 159 was first introduced by commit
:::::: 673184a2a58f93f0c170d30247155b3f86ba69ee crypto: qat - introduce support for PFVF block messages

:::::: TO: Marco Chiappero <marco.chiappero@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
