Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE1D304
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690542382; x=1722078382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kEQ5naTnFLr4aGuk/avCdnYby12+aSXhQRlC0KZOXa4=;
  b=MYD/hxLSaLD7+dApnF7a4wBSNoopsHMSBedczjyFAkpVkkHV1/1V3XVN
   6mn9KlAVwZsOWiP2Qd5Cvh/fRkk+Ho93p0qgp5L0/QC7M1GsgKwx+8GSN
   OJqwxYxLS+PN4ZHwKwVzFWDLMqCLpxLuTkKPBnh8XjsFy5sIidA38vWQx
   wAr6HDgLOhdssWfbl83cixWNRl/3D3MqMXx/HIkN68ZDvXNYYj0VgV0na
   034VumsRIesMuVIOpjzF3Mj0KegTg3bzKkxmgmKJQhBut1sWNx4i0p82M
   JF/vr13OE2XhgiUEt5I/jHrg406ZH/HH5jSqEUPXtdO22wReHosLxjahR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353476613"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="353476613"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901240962"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="901240962"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Jul 2023 04:06:20 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPLIa-00037J-0O;
	Fri, 28 Jul 2023 11:06:20 +0000
Date: Fri, 28 Jul 2023 19:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [alobakin:iavf-pp-frag 3/28]
 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:525:29-44: ERROR:
 reference preceded by free on line 524
Message-ID: <202307281918.q35tlDWz-lkp@intel.com>
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
TO: Alexander Lobakin <aleksander.lobakin@intel.com>

tree:   https://github.com/alobakin/linux iavf-pp-frag
head:   bd8ea2a4f32691ee972ce571a8489aa04e5b08f3
commit: ac8f720051f28c4000cd0f6f080b73b1ce8e89e4 [3/28] virtchnl: fix fake 1-elem arrays for structures allocated as `nents`
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: sparc64-randconfig-r052-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281918.q35tlDWz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281918.q35tlDWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307281918.q35tlDWz-lkp@intel.com/

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
ac8f720051f28c Alexander Lobakin   2023-07-27  509  	size_t size;
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
ac8f720051f28c Alexander Lobakin   2023-07-27 @525  	size = virtchnl_struct_size(vf->qvlist_info, qv_info,
ac8f720051f28c Alexander Lobakin   2023-07-27  526  				    qvlist_info->num_vectors);
ac8f720051f28c Alexander Lobakin   2023-07-27  527  	vf->qvlist_info = kzalloc(size, GFP_KERNEL);
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
