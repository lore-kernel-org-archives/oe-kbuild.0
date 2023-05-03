Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4F3321E
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 13:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683119911; x=1714655911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xxtTi+nmooFg6td0oxkmYrSV8VgLIYAxZ5Osd8fAwXE=;
  b=Q8ypPEE00qjO8F4U/wPsZBqwhkGqHf+QLjZy58cdbrL2Zui4cTLsHExi
   QV9Ts4l4gw2TwB2WvnfVVjbRyjdrVnJXJVgfu3pK8DkfkGuR6LgnicVSu
   MzwmlkJGTaiq5NFJSTuxc6NF0tjaK66Kkfk83/gu3Eewbr+la/3Bzggnw
   pSLVwhvAXown5O3yP1Eu14LHpzsBmieiNVmXzEb9JIJ0WpcTWf0SVlQsX
   0kMJPiWAE+j3SokiYe/RymQxTCvYTmQtOFs5FWI3x9QTTdnMay+XsbCK4
   EKGsKIubCQj4UtYAdystRbXAagHyTsmDYd0Qh6M1urtPVu4r5Ad715HK3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="434962148"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="434962148"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 06:18:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="820764807"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="820764807"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 May 2023 06:18:23 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puCN7-00021w-2g;
	Wed, 03 May 2023 13:18:17 +0000
Date: Wed, 3 May 2023 21:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 11/36]
 drivers/net/ethernet/intel/ice/ice_base.c:139 ice_vsi_alloc_q_vector() warn:
 passing devm_ allocated variable to kfree. 'q_vector'
Message-ID: <202305032143.6VO9C88R-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Piotr Raczynski <piotr.raczynski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Jacob Keller <jacob.e.keller@intel.com>
CC: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   cf8d73244f3a7bf78ae4042f4d700da212be3dcc
commit: f71fc417ba04cac4a85406e3818e94d60cef82e4 [11/36] ice: add individual interrupt allocation
:::::: branch date: 22 hours ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230503/202305032143.6VO9C88R-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305032143.6VO9C88R-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_base.c:139 ice_vsi_alloc_q_vector() warn: passing devm_ allocated variable to kfree. 'q_vector'

vim +/q_vector +139 drivers/net/ethernet/intel/ice/ice_base.c

eff380aaffedb2 Anirudh Venkataramanan 2019-10-24   93  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24   94  /**
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24   95   * ice_vsi_alloc_q_vector - Allocate memory for a single interrupt vector
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24   96   * @vsi: the VSI being configured
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24   97   * @v_idx: index of the vector in the VSI struct
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24   98   *
118e0e10025866 Michal Swiatkowski     2019-12-12   99   * We allocate one q_vector and set default value for ITR setting associated
118e0e10025866 Michal Swiatkowski     2019-12-12  100   * with this q_vector. If allocation fails we return -ENOMEM.
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  101   */
88865fc4bbd61e Karol Kolacinski       2020-05-07  102  static int ice_vsi_alloc_q_vector(struct ice_vsi *vsi, u16 v_idx)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  103  {
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  104  	struct ice_pf *pf = vsi->back;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  105  	struct ice_q_vector *q_vector;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  106  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  107  	/* allocate q_vector */
4015d11e4b9720 Brett Creeley          2019-11-08  108  	q_vector = devm_kzalloc(ice_pf_to_dev(pf), sizeof(*q_vector),
4015d11e4b9720 Brett Creeley          2019-11-08  109  				GFP_KERNEL);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  110  	if (!q_vector)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  111  		return -ENOMEM;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  112  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  113  	q_vector->vsi = vsi;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  114  	q_vector->v_idx = v_idx;
118e0e10025866 Michal Swiatkowski     2019-12-12  115  	q_vector->tx.itr_setting = ICE_DFLT_TX_ITR;
118e0e10025866 Michal Swiatkowski     2019-12-12  116  	q_vector->rx.itr_setting = ICE_DFLT_RX_ITR;
d59684a07e37b0 Jesse Brandeburg       2021-03-31  117  	q_vector->tx.itr_mode = ITR_DYNAMIC;
d59684a07e37b0 Jesse Brandeburg       2021-03-31  118  	q_vector->rx.itr_mode = ITR_DYNAMIC;
dc23715cf30a9a Maciej Fijalkowski     2021-08-19  119  	q_vector->tx.type = ICE_TX_CONTAINER;
dc23715cf30a9a Maciej Fijalkowski     2021-08-19  120  	q_vector->rx.type = ICE_RX_CONTAINER;
f71fc417ba04ca Piotr Raczynski        2023-03-23  121  	q_vector->irq.index = -ENOENT;
d59684a07e37b0 Jesse Brandeburg       2021-03-31  122  
f71fc417ba04ca Piotr Raczynski        2023-03-23  123  	if (vsi->type == ICE_VSI_VF) {
f71fc417ba04ca Piotr Raczynski        2023-03-23  124  		q_vector->reg_idx = ice_calc_vf_reg_idx(vsi->vf, q_vector);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  125  		goto out;
f71fc417ba04ca Piotr Raczynski        2023-03-23  126  	} else if (vsi->type == ICE_VSI_CTRL && vsi->vf) {
f71fc417ba04ca Piotr Raczynski        2023-03-23  127  		struct ice_vsi *ctrl_vsi = ice_get_vf_ctrl_vsi(pf, vsi);
f71fc417ba04ca Piotr Raczynski        2023-03-23  128  
f71fc417ba04ca Piotr Raczynski        2023-03-23  129  		if (ctrl_vsi) {
f71fc417ba04ca Piotr Raczynski        2023-03-23  130  			if (unlikely(!ctrl_vsi->q_vectors))
f71fc417ba04ca Piotr Raczynski        2023-03-23  131  				return -ENOENT;
f71fc417ba04ca Piotr Raczynski        2023-03-23  132  			q_vector->irq = ctrl_vsi->q_vectors[0]->irq;
f71fc417ba04ca Piotr Raczynski        2023-03-23  133  			goto skip_alloc;
f71fc417ba04ca Piotr Raczynski        2023-03-23  134  		}
f71fc417ba04ca Piotr Raczynski        2023-03-23  135  	}
f71fc417ba04ca Piotr Raczynski        2023-03-23  136  
f71fc417ba04ca Piotr Raczynski        2023-03-23  137  	q_vector->irq = ice_alloc_irq(pf);
f71fc417ba04ca Piotr Raczynski        2023-03-23  138  	if (q_vector->irq.index < 0) {
f71fc417ba04ca Piotr Raczynski        2023-03-23 @139  		kfree(q_vector);
f71fc417ba04ca Piotr Raczynski        2023-03-23  140  		return -ENOMEM;
f71fc417ba04ca Piotr Raczynski        2023-03-23  141  	}
f71fc417ba04ca Piotr Raczynski        2023-03-23  142  
f71fc417ba04ca Piotr Raczynski        2023-03-23  143  skip_alloc:
f71fc417ba04ca Piotr Raczynski        2023-03-23  144  	q_vector->reg_idx = q_vector->irq.index;
f71fc417ba04ca Piotr Raczynski        2023-03-23  145  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  146  	/* only set affinity_mask if the CPU is online */
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  147  	if (cpu_online(v_idx))
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  148  		cpumask_set_cpu(v_idx, &q_vector->affinity_mask);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  149  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  150  	/* This will not be called in the driver load path because the netdev
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  151  	 * will not be created yet. All other cases with register the NAPI
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  152  	 * handler here (i.e. resume, reset/rebuild, etc.)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  153  	 */
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  154  	if (vsi->netdev)
b48b89f9c189d2 Jakub Kicinski         2022-09-27  155  		netif_napi_add(vsi->netdev, &q_vector->napi, ice_napi_poll);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  156  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  157  out:
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  158  	/* tie q_vector and VSI together */
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  159  	vsi->q_vectors[v_idx] = q_vector;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  160  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  161  	return 0;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  162  }
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  163  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
