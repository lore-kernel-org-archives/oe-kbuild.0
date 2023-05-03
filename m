Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB1D9479
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 14:24:22 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f37a36b713so12060675e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 03 May 2023 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683123860; x=1685715860;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCCRCGEO9lC/0o2kBg6q5PwQuDajEfzcShoxVu8uqw4=;
        b=DsaVYIMxJme1OoAhEsEN9+ZvloK+hILa2s128efGX8NzlwYH1ehOiTt4ZLfrz3TEOv
         YIKzO87Krpq9he6UuLdRFh+e9m5C+aTjTf/mIZerTNy50GuhFYkcXK5vWycQ9KulRCcv
         /iuqk1TcnUq1rTrMOcrI/8yzUmHi39XeXJTy7V+MXnu8U4fc/Ry0wtRiQf1ymEhsiWVC
         0yFybMvvxnDeI6zt4+bi22J0wq7mAx4R+xGRUb4kbZcOojZnBQ7X/iP+akcjRTo3nGnm
         qFYBbmKqnRCoWl0Qx0RcITS4H7E8Hf6d5KrOrBo0eUkGyYDsCC8z+vNnR0PUP/8TUCG0
         kKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683123860; x=1685715860;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCCRCGEO9lC/0o2kBg6q5PwQuDajEfzcShoxVu8uqw4=;
        b=P0LRL5BXaGMCc5aZsCKoxdDIAHAbZu6Y8zMTVlswR0z2k+605YKu+fHTNUPaC+G0Ow
         ow7HWgspXfRlMjh+CcKiiyI2+vCzBC4+H7GUDKVR0a1EpsUqECnnARlTnLGbXEi6J4XT
         Dz7Z1XOGT+qsz6fjzDjrYjD28HJYtuxez++TIRX6xkXDVPaSUuFzNVvVewcV6DCcKkaK
         sTD7fl2bExpmkIr/JILSl45hlSBy+yQ2lwdCN6gzR18afkx5NMz5gXu0l29zbWsMdRi4
         Mq03unK0N9NFxTP0DUqHN1Kl+Uek5V1fhzWo2uc6guxJ8Iy075Cqh5w79nsyZasluMV6
         ZpLQ==
X-Gm-Message-State: AC+VfDwrJkT7c0kmtPvpAPNQaEio0ZxyqGQruhagMhy84o0w6tmsF6Fy
	6CV3UohiRJwPcHbblt19/73jQntpg5Uo9ki39No=
X-Google-Smtp-Source: ACHHUZ41scODdMRgUPqRoumgUZMSt1S2Xmfr+D0kyeNwRKi6R4YrNLB7UYMfJgvanuwxtCIZBXoX4g==
X-Received: by 2002:a7b:c5d9:0:b0:3f1:8992:3618 with SMTP id n25-20020a7bc5d9000000b003f189923618mr15020143wmk.13.1683123859959;
        Wed, 03 May 2023 07:24:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c0b5700b003ef5bb63f13sm2089181wmr.10.2023.05.03.07.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:24:18 -0700 (PDT)
Date: Wed, 3 May 2023 17:24:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Piotr Raczynski <piotr.raczynski@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Subject: [tnguy-next-queue:dev-queue 11/36]
 drivers/net/ethernet/intel/ice/ice_base.c:139 ice_vsi_alloc_q_vector() warn:
 passing devm_ allocated variable to kfree. 'q_vector'
Message-ID: <a9200e7a-f2aa-446b-8d01-acda194f7ddd@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   cf8d73244f3a7bf78ae4042f4d700da212be3dcc
commit: f71fc417ba04cac4a85406e3818e94d60cef82e4 [11/36] ice: add individual interrupt allocation
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230503/202305032143.6VO9C88R-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305032143.6VO9C88R-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_base.c:139 ice_vsi_alloc_q_vector() warn: passing devm_ allocated variable to kfree. 'q_vector'

vim +/q_vector +139 drivers/net/ethernet/intel/ice/ice_base.c

88865fc4bbd61e Karol Kolacinski       2020-05-07  102  static int ice_vsi_alloc_q_vector(struct ice_vsi *vsi, u16 v_idx)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  103  {
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  104  	struct ice_pf *pf = vsi->back;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  105  	struct ice_q_vector *q_vector;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  106  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  107  	/* allocate q_vector */
4015d11e4b9720 Brett Creeley          2019-11-08  108  	q_vector = devm_kzalloc(ice_pf_to_dev(pf), sizeof(*q_vector),
                                                        ^^^^^^^^^^^^^^^^^^^^^^^

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
                                                                ^^^^^^^^^^^^^^^^
Double free (it's devm_ allocated).

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

