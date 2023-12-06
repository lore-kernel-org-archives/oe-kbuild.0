Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A823C082
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 14:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUpH051/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701874608; x=1733410608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WetHn5wvKs2GNuqRPa8+kHup3YjzApRECZJrNtjCqxU=;
  b=mUpH051/jTa0GYz2IB35Ujmje4JXQzTZzlUfrArFvUGWzSg8+ynvuC7S
   WVub6t1LQoufz1vtAXrUdcrOilKKaEOvcnrBw7cQw3w5ZUj+0yOSiJr6J
   54do+TwYBhja0dNQqpclDNYZ2f1FVDaafHw5LQjkC231UpnLhm3xtJCxF
   tiADbHsWXylzjmCKG2KCXNf+hwteRgkdIN06pM3q6ySQAPTLW7QiddTCN
   6ZptFKbw8LLcbD1W93RdQuYeCrbHTK6HnZKt+wxWuMSmmuoghZSFjGOVy
   7Glcrb9cE/zZiz519bTkjut7XiKl6Z4v3Hv9kAA+iMrvAlpslmvvXYVpZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="480267799"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="480267799"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 06:56:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775032055"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="775032055"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2023 06:56:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAtKI-000AxW-26;
	Wed, 06 Dec 2023 14:56:39 +0000
Date: Wed, 6 Dec 2023 22:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:525:29-44: ERROR:
 reference preceded by free on line 524
Message-ID: <202312062230.VRAIGrLi-lkp@intel.com>
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
TO: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: b0654e64dbaf62f565b5f2b4fbd92202e88dcba3 virtchnl: fix fake 1-elem arrays for structures allocated as `nents`
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: i386-randconfig-054-20231206 (https://download.01.org/0day-ci/archive/20231206/202312062230.VRAIGrLi-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312062230.VRAIGrLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312062230.VRAIGrLi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:525:29-44: ERROR: reference preceded by free on line 524

vim +525 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c

e3219ce6a77546 Anjali Singhai Jain 2016-01-20  492  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  493  /**
2723f3b5d4ff58 Jesse Brandeburg    2022-12-16  494   * i40e_config_rdma_qvlist
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  495   * @vf: pointer to the VF info
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  496   * @qvlist_info: queue and vector list
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  497   *
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  498   * Return 0 on success or < 0 on error
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  499   **/
2723f3b5d4ff58 Jesse Brandeburg    2022-12-16  500  static int
2723f3b5d4ff58 Jesse Brandeburg    2022-12-16  501  i40e_config_rdma_qvlist(struct i40e_vf *vf,
2723f3b5d4ff58 Jesse Brandeburg    2022-12-16  502  			struct virtchnl_rdma_qvlist_info *qvlist_info)
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  503  {
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  504  	struct i40e_pf *pf = vf->pf;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  505  	struct i40e_hw *hw = &pf->hw;
2723f3b5d4ff58 Jesse Brandeburg    2022-12-16  506  	struct virtchnl_rdma_qv_info *qv_info;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  507  	u32 v_idx, i, reg_idx, reg;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  508  	u32 next_q_idx, next_q_type;
b0654e64dbaf62 Alexander Lobakin   2023-07-28  509  	size_t size;
fae6cad17ce39b Gustavo A. R. Silva 2019-06-05  510  	u32 msix_vf;
0b63644602cfcb Martyna Szapar      2019-04-18  511  	int ret = 0;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  512  
7015ca3df96537 Sergey Nemov        2019-03-29  513  	msix_vf = pf->hw.func_caps.num_msix_vectors_vf;
7015ca3df96537 Sergey Nemov        2019-03-29  514  
7015ca3df96537 Sergey Nemov        2019-03-29  515  	if (qvlist_info->num_vectors > msix_vf) {
7015ca3df96537 Sergey Nemov        2019-03-29  516  		dev_warn(&pf->pdev->dev,
7015ca3df96537 Sergey Nemov        2019-03-29  517  			 "Incorrect number of iwarp vectors %u. Maximum %u allowed.\n",
7015ca3df96537 Sergey Nemov        2019-03-29  518  			 qvlist_info->num_vectors,
7015ca3df96537 Sergey Nemov        2019-03-29  519  			 msix_vf);
0b63644602cfcb Martyna Szapar      2019-04-18  520  		ret = -EINVAL;
0b63644602cfcb Martyna Szapar      2019-04-18  521  		goto err_out;
7015ca3df96537 Sergey Nemov        2019-03-29  522  	}
7015ca3df96537 Sergey Nemov        2019-03-29  523  
0b63644602cfcb Martyna Szapar      2019-04-18 @524  	kfree(vf->qvlist_info);
b0654e64dbaf62 Alexander Lobakin   2023-07-28 @525  	size = virtchnl_struct_size(vf->qvlist_info, qv_info,
b0654e64dbaf62 Alexander Lobakin   2023-07-28  526  				    qvlist_info->num_vectors);
b0654e64dbaf62 Alexander Lobakin   2023-07-28  527  	vf->qvlist_info = kzalloc(size, GFP_KERNEL);
0b63644602cfcb Martyna Szapar      2019-04-18  528  	if (!vf->qvlist_info) {
0b63644602cfcb Martyna Szapar      2019-04-18  529  		ret = -ENOMEM;
0b63644602cfcb Martyna Szapar      2019-04-18  530  		goto err_out;
0b63644602cfcb Martyna Szapar      2019-04-18  531  	}
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  532  	vf->qvlist_info->num_vectors = qvlist_info->num_vectors;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  533  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  534  	msix_vf = pf->hw.func_caps.num_msix_vectors_vf;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  535  	for (i = 0; i < qvlist_info->num_vectors; i++) {
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  536  		qv_info = &qvlist_info->qv_info[i];
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  537  		if (!qv_info)
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  538  			continue;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  539  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  540  		/* Validate vector id belongs to this vf */
d510497b8397ec Sergey Nemov        2019-04-24  541  		if (!i40e_vc_isvalid_vector_id(vf, qv_info->v_idx)) {
0b63644602cfcb Martyna Szapar      2019-04-18  542  			ret = -EINVAL;
0b63644602cfcb Martyna Szapar      2019-04-18  543  			goto err_free;
0b63644602cfcb Martyna Szapar      2019-04-18  544  		}
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  545  
d510497b8397ec Sergey Nemov        2019-04-24  546  		v_idx = qv_info->v_idx;
d510497b8397ec Sergey Nemov        2019-04-24  547  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  548  		vf->qvlist_info->qv_info[i] = *qv_info;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  549  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  550  		reg_idx = ((msix_vf - 1) * vf->vf_id) + (v_idx - 1);
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  551  		/* We might be sharing the interrupt, so get the first queue
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  552  		 * index and type, push it down the list by adding the new
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  553  		 * queue on top. Also link it with the new queue in CEQCTL.
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  554  		 */
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  555  		reg = rd32(hw, I40E_VPINT_LNKLSTN(reg_idx));
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  556  		next_q_idx = ((reg & I40E_VPINT_LNKLSTN_FIRSTQ_INDX_MASK) >>
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  557  				I40E_VPINT_LNKLSTN_FIRSTQ_INDX_SHIFT);
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  558  		next_q_type = ((reg & I40E_VPINT_LNKLSTN_FIRSTQ_TYPE_MASK) >>
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  559  				I40E_VPINT_LNKLSTN_FIRSTQ_TYPE_SHIFT);
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  560  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  561  		if (qv_info->ceq_idx != I40E_QUEUE_INVALID_IDX) {
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  562  			reg_idx = (msix_vf - 1) * vf->vf_id + qv_info->ceq_idx;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  563  			reg = (I40E_VPINT_CEQCTL_CAUSE_ENA_MASK |
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  564  			(v_idx << I40E_VPINT_CEQCTL_MSIX_INDX_SHIFT) |
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  565  			(qv_info->itr_idx << I40E_VPINT_CEQCTL_ITR_INDX_SHIFT) |
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  566  			(next_q_type << I40E_VPINT_CEQCTL_NEXTQ_TYPE_SHIFT) |
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  567  			(next_q_idx << I40E_VPINT_CEQCTL_NEXTQ_INDX_SHIFT));
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  568  			wr32(hw, I40E_VPINT_CEQCTL(reg_idx), reg);
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  569  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  570  			reg_idx = ((msix_vf - 1) * vf->vf_id) + (v_idx - 1);
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  571  			reg = (qv_info->ceq_idx &
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  572  			       I40E_VPINT_LNKLSTN_FIRSTQ_INDX_MASK) |
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  573  			       (I40E_QUEUE_TYPE_PE_CEQ <<
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  574  			       I40E_VPINT_LNKLSTN_FIRSTQ_TYPE_SHIFT);
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  575  			wr32(hw, I40E_VPINT_LNKLSTN(reg_idx), reg);
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  576  		}
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  577  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  578  		if (qv_info->aeq_idx != I40E_QUEUE_INVALID_IDX) {
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  579  			reg = (I40E_VPINT_AEQCTL_CAUSE_ENA_MASK |
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  580  			(v_idx << I40E_VPINT_AEQCTL_MSIX_INDX_SHIFT) |
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  581  			(qv_info->itr_idx << I40E_VPINT_AEQCTL_ITR_INDX_SHIFT));
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  582  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  583  			wr32(hw, I40E_VPINT_AEQCTL(vf->vf_id), reg);
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  584  		}
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  585  	}
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  586  
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  587  	return 0;
0b63644602cfcb Martyna Szapar      2019-04-18  588  err_free:
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  589  	kfree(vf->qvlist_info);
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  590  	vf->qvlist_info = NULL;
0b63644602cfcb Martyna Szapar      2019-04-18  591  err_out:
0b63644602cfcb Martyna Szapar      2019-04-18  592  	return ret;
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  593  }
e3219ce6a77546 Anjali Singhai Jain 2016-01-20  594  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
