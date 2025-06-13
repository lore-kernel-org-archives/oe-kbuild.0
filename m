Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB4F1A2632
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 02:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782733; cv=none; b=gKuB5PXQ1WjuQ76Enub/JRekgT1ylbIf+hyQ6N5JSQvBvqGMKDmOBLuLfPUJG5ijS7p6r7qw/A0o/sLH7bqSyTdU1LcK4SHQtwmKeU6372zf6ipScCB/z0rmh67HinjJsqGDTevAoOs9TNj9JRUR7e8Tb4C8e5eXLzgaJNC/EpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782733; c=relaxed/simple;
	bh=LrfgFkWQ0HxiKRSzIMT/HgjqNbpR1oA1yuyPFh7qgXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V5uKi5TMHJ8rWbkhMBceN3rskPX1tx6cj0FQLwhcfEQUfjGBnXkvj8ZfkVxlhzvDy0vjiK020/8HomK46TU3xw/PH0ZpVP/OjjgpLMj3sU7Bdk3mRX6faOCwJUb4s3wK4tlzNcDjARNKkh44u+1EWBP9Zelc5riFDSDGOpGzFyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8+HC7Md; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8+HC7Md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749782731; x=1781318731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrfgFkWQ0HxiKRSzIMT/HgjqNbpR1oA1yuyPFh7qgXE=;
  b=L8+HC7Md07s5gptMf7tvMZd+FRwUWEDceVwo9/w+UK8xLVOqrtzfE/tQ
   XHAvmXByiGh5iNbHZ5ilVHDWbVKlhF7aapIhBvTWxJFRwWM6hWzFibDWI
   8Y17g2Lz4uVxjmPgCix8v5ot8fKGI5kjNBFxDlwrqZWNfzO4VE0HYsVr5
   W0w77PnhhF6f4bw/tHrvyVX2Yq8NsTG45DAez9Pmy6JpVf+/jvhEYKYLx
   QakdF2Z/2QNdDJd4zMhuQKrRSxVX+Uy76bp0oTOsTC41XrqkV0MQvlSWu
   8CIdrwQv3NQV2O1S/Mfpo3JjlvViFYA8kx7eyV3uG1q5hU9xvmzLGJx2E
   A==;
X-CSE-ConnectionGUID: SMMnj9CtRi2KDRkPXhhJ+g==
X-CSE-MsgGUID: wjbNfQB3Swe6YKkZkFfKgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51852447"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="51852447"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 19:45:31 -0700
X-CSE-ConnectionGUID: ++YWM4rNR1avsdYe/jQypw==
X-CSE-MsgGUID: yK03ui53QtOnxkRQXKDRVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="184945457"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2025 19:45:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPuQ1-000C9y-2s;
	Fri, 13 Jun 2025 02:45:25 +0000
Date: Fri, 13 Jun 2025 10:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 86/108]
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1120
 idpf_send_config_tx_queues_msg() error: uninitialized symbol 'buf_sz'.
Message-ID: <202506131009.itpm7bvc-lkp@intel.com>
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
TO: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Michal Kubiak <michal.kubiak@intel.com>
CC: Larysa Zaremba <larysa.zaremba@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   9058ba8cdc822c8b1799d10db1b0f019048f032d
commit: 43bb60cc31afce3091a002583439dc02fd3b7535 [86/108] idpf: refactor idpf to use libie control queues
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131009.itpm7bvc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506131009.itpm7bvc-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1120 idpf_send_config_tx_queues_msg() error: uninitialized symbol 'buf_sz'.
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1121 idpf_send_config_tx_queues_msg() error: uninitialized symbol 'ctq'.
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1276 idpf_send_config_rx_queues_msg() error: uninitialized symbol 'buf_sz'.
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1277 idpf_send_config_rx_queues_msg() error: uninitialized symbol 'crq'.

vim +/buf_sz +1120 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

d4d5587182664b Pavan Kumar Linga 2023-08-07   997  
1c325aac10a82f Alan Brady        2023-08-07   998  /**
1c325aac10a82f Alan Brady        2023-08-07   999   * idpf_send_config_tx_queues_msg - Send virtchnl config tx queues message
9905cc722394fa Pavan Kumar Linga 2025-05-08  1000   * @adapter: adapter pointer used to send virtchnl message
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1001   * @rsrc: pointer to queue and vector resources
9905cc722394fa Pavan Kumar Linga 2025-05-08  1002   * @vport_id: vport identifier used while preparing the virtchnl message
1c325aac10a82f Alan Brady        2023-08-07  1003   *
1c325aac10a82f Alan Brady        2023-08-07  1004   * Send config tx queues virtchnl message. Returns 0 on success, negative on
1c325aac10a82f Alan Brady        2023-08-07  1005   * failure.
1c325aac10a82f Alan Brady        2023-08-07  1006   */
9905cc722394fa Pavan Kumar Linga 2025-05-08  1007  static int idpf_send_config_tx_queues_msg(struct idpf_adapter *adapter,
9905cc722394fa Pavan Kumar Linga 2025-05-08  1008  					  struct idpf_q_vec_rsrc *rsrc,
9905cc722394fa Pavan Kumar Linga 2025-05-08  1009  					  u32 vport_id)
1c325aac10a82f Alan Brady        2023-08-07  1010  {
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1011  	struct libie_ctlq_xn_send_params xn_params = {
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1012  		.timeout_ms	= IDPF_VC_XN_DEFAULT_TIMEOUT_MSEC,
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1013  		.chnl_opcode	= VIRTCHNL2_OP_CONFIG_TX_QUEUES,
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1014  	};
52361a06d3f299 Alan Brady        2024-02-22  1015  	struct virtchnl2_txq_info *qi __free(kfree) = NULL;
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1016  	struct virtchnl2_config_tx_queues *ctq;
1c325aac10a82f Alan Brady        2023-08-07  1017  	u32 config_sz, chunk_sz, buf_sz;
1c325aac10a82f Alan Brady        2023-08-07  1018  	int totqs, num_msgs, num_chunks;
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1019  	int k = 0, err = 0;
1c325aac10a82f Alan Brady        2023-08-07  1020  
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1021  	totqs = rsrc->num_txq + rsrc->num_complq;
1c325aac10a82f Alan Brady        2023-08-07  1022  	qi = kcalloc(totqs, sizeof(struct virtchnl2_txq_info), GFP_KERNEL);
1c325aac10a82f Alan Brady        2023-08-07  1023  	if (!qi)
1c325aac10a82f Alan Brady        2023-08-07  1024  		return -ENOMEM;
1c325aac10a82f Alan Brady        2023-08-07  1025  
1c325aac10a82f Alan Brady        2023-08-07  1026  	/* Populate the queue info buffer with all queue context info */
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1027  	for (u16 i = 0; i < rsrc->num_txq_grp; i++) {
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1028  		struct idpf_txq_group *tx_qgrp = &rsrc->txq_grps[i];
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1029  		int sched_mode;
1c325aac10a82f Alan Brady        2023-08-07  1030  
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1031  		for (u16 j = 0; j < tx_qgrp->num_txq; j++, k++) {
1c325aac10a82f Alan Brady        2023-08-07  1032  			qi[k].queue_id =
1c325aac10a82f Alan Brady        2023-08-07  1033  				cpu_to_le32(tx_qgrp->txqs[j]->q_id);
1c325aac10a82f Alan Brady        2023-08-07  1034  			qi[k].model =
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1035  				cpu_to_le16(rsrc->txq_model);
1c325aac10a82f Alan Brady        2023-08-07  1036  			qi[k].type =
e4891e4687c8dd Alexander Lobakin 2024-06-20  1037  				cpu_to_le32(VIRTCHNL2_QUEUE_TYPE_TX);
1c325aac10a82f Alan Brady        2023-08-07  1038  			qi[k].ring_len =
1c325aac10a82f Alan Brady        2023-08-07  1039  				cpu_to_le16(tx_qgrp->txqs[j]->desc_count);
1c325aac10a82f Alan Brady        2023-08-07  1040  			qi[k].dma_ring_addr =
1c325aac10a82f Alan Brady        2023-08-07  1041  				cpu_to_le64(tx_qgrp->txqs[j]->dma);
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1042  			if (idpf_is_queue_model_split(rsrc->txq_model)) {
e4891e4687c8dd Alexander Lobakin 2024-06-20  1043  				struct idpf_tx_queue *q = tx_qgrp->txqs[j];
1c325aac10a82f Alan Brady        2023-08-07  1044  
1c325aac10a82f Alan Brady        2023-08-07  1045  				qi[k].tx_compl_queue_id =
1c325aac10a82f Alan Brady        2023-08-07  1046  					cpu_to_le16(tx_qgrp->complq->q_id);
1c325aac10a82f Alan Brady        2023-08-07  1047  				qi[k].relative_queue_id = cpu_to_le16(j);
1c325aac10a82f Alan Brady        2023-08-07  1048  
e4891e4687c8dd Alexander Lobakin 2024-06-20  1049  				if (idpf_queue_has(FLOW_SCH_EN, q))
1c325aac10a82f Alan Brady        2023-08-07  1050  					qi[k].sched_mode =
1c325aac10a82f Alan Brady        2023-08-07  1051  					cpu_to_le16(VIRTCHNL2_TXQ_SCHED_MODE_FLOW);
1c325aac10a82f Alan Brady        2023-08-07  1052  				else
1c325aac10a82f Alan Brady        2023-08-07  1053  					qi[k].sched_mode =
1c325aac10a82f Alan Brady        2023-08-07  1054  					cpu_to_le16(VIRTCHNL2_TXQ_SCHED_MODE_QUEUE);
1c325aac10a82f Alan Brady        2023-08-07  1055  			} else {
1c325aac10a82f Alan Brady        2023-08-07  1056  				qi[k].sched_mode =
1c325aac10a82f Alan Brady        2023-08-07  1057  					cpu_to_le16(VIRTCHNL2_TXQ_SCHED_MODE_QUEUE);
1c325aac10a82f Alan Brady        2023-08-07  1058  			}
1c325aac10a82f Alan Brady        2023-08-07  1059  		}
1c325aac10a82f Alan Brady        2023-08-07  1060  
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1061  		if (!idpf_is_queue_model_split(rsrc->txq_model))
1c325aac10a82f Alan Brady        2023-08-07  1062  			continue;
1c325aac10a82f Alan Brady        2023-08-07  1063  
1c325aac10a82f Alan Brady        2023-08-07  1064  		qi[k].queue_id = cpu_to_le32(tx_qgrp->complq->q_id);
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1065  		qi[k].model = cpu_to_le16(rsrc->txq_model);
e4891e4687c8dd Alexander Lobakin 2024-06-20  1066  		qi[k].type = cpu_to_le32(VIRTCHNL2_QUEUE_TYPE_TX_COMPLETION);
1c325aac10a82f Alan Brady        2023-08-07  1067  		qi[k].ring_len = cpu_to_le16(tx_qgrp->complq->desc_count);
1c325aac10a82f Alan Brady        2023-08-07  1068  		qi[k].dma_ring_addr = cpu_to_le64(tx_qgrp->complq->dma);
1c325aac10a82f Alan Brady        2023-08-07  1069  
e4891e4687c8dd Alexander Lobakin 2024-06-20  1070  		if (idpf_queue_has(FLOW_SCH_EN, tx_qgrp->complq))
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1071  			sched_mode = VIRTCHNL2_TXQ_SCHED_MODE_FLOW;
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1072  		else
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1073  			sched_mode = VIRTCHNL2_TXQ_SCHED_MODE_QUEUE;
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1074  		qi[k].sched_mode = cpu_to_le16(sched_mode);
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1075  
1c325aac10a82f Alan Brady        2023-08-07  1076  		k++;
1c325aac10a82f Alan Brady        2023-08-07  1077  	}
1c325aac10a82f Alan Brady        2023-08-07  1078  
1c325aac10a82f Alan Brady        2023-08-07  1079  	/* Make sure accounting agrees */
52361a06d3f299 Alan Brady        2024-02-22  1080  	if (k != totqs)
52361a06d3f299 Alan Brady        2024-02-22  1081  		return -EINVAL;
1c325aac10a82f Alan Brady        2023-08-07  1082  
1c325aac10a82f Alan Brady        2023-08-07  1083  	/* Chunk up the queue contexts into multiple messages to avoid
1c325aac10a82f Alan Brady        2023-08-07  1084  	 * sending a control queue message buffer that is too large
1c325aac10a82f Alan Brady        2023-08-07  1085  	 */
1c325aac10a82f Alan Brady        2023-08-07  1086  	config_sz = sizeof(struct virtchnl2_config_tx_queues);
1c325aac10a82f Alan Brady        2023-08-07  1087  	chunk_sz = sizeof(struct virtchnl2_txq_info);
1c325aac10a82f Alan Brady        2023-08-07  1088  
1c325aac10a82f Alan Brady        2023-08-07  1089  	num_chunks = min_t(u32, IDPF_NUM_CHUNKS_PER_MSG(config_sz, chunk_sz),
1c325aac10a82f Alan Brady        2023-08-07  1090  			   totqs);
1c325aac10a82f Alan Brady        2023-08-07  1091  	num_msgs = DIV_ROUND_UP(totqs, num_chunks);
1c325aac10a82f Alan Brady        2023-08-07  1092  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1093  	for (u16 i = 0, k = 0; i < num_msgs; i++) {
1c325aac10a82f Alan Brady        2023-08-07  1094  		buf_sz = struct_size(ctq, qinfo, num_chunks);
1c325aac10a82f Alan Brady        2023-08-07  1095  		ctq = kzalloc(buf_sz, GFP_KERNEL);
52361a06d3f299 Alan Brady        2024-02-22  1096  		if (!ctq)
52361a06d3f299 Alan Brady        2024-02-22  1097  			return -ENOMEM;
1c325aac10a82f Alan Brady        2023-08-07  1098  
9905cc722394fa Pavan Kumar Linga 2025-05-08  1099  		ctq->vport_id = cpu_to_le32(vport_id);
1c325aac10a82f Alan Brady        2023-08-07  1100  		ctq->num_qinfo = cpu_to_le16(num_chunks);
1c325aac10a82f Alan Brady        2023-08-07  1101  		memcpy(ctq->qinfo, &qi[k], chunk_sz * num_chunks);
1c325aac10a82f Alan Brady        2023-08-07  1102  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1103  		err = idpf_send_mb_msg(adapter, &xn_params, ctq, buf_sz);
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1104  		if (err)
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1105  			goto rel_last_buf;
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1106  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1107  		libie_ctlq_release_rx_buf(&xn_params.recv_mem);
1c325aac10a82f Alan Brady        2023-08-07  1108  
1c325aac10a82f Alan Brady        2023-08-07  1109  		k += num_chunks;
1c325aac10a82f Alan Brady        2023-08-07  1110  		totqs -= num_chunks;
1c325aac10a82f Alan Brady        2023-08-07  1111  		num_chunks = min(num_chunks, totqs);
1c325aac10a82f Alan Brady        2023-08-07  1112  	}
1c325aac10a82f Alan Brady        2023-08-07  1113  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1114  rel_last_buf:
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1115  	/* Only the last buffer might be of size LIBIE_CP_TX_COPYBREAK or less.
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1116  	 * For buffers larger than LIBIE_CP_TX_COPYBREAK, are DMA mapped
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1117  	 * and released on mailbox cleanup. Smaller buffers are memcopied into
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1118  	 * the pre-allocated DMA buffers and are released here.
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1119  	 */
43bb60cc31afce Pavan Kumar Linga 2025-05-23 @1120  	if (num_msgs && libie_cp_can_send_onstack(buf_sz))
43bb60cc31afce Pavan Kumar Linga 2025-05-23 @1121  		kfree(ctq);
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1122  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1123  	return err;
1c325aac10a82f Alan Brady        2023-08-07  1124  }
1c325aac10a82f Alan Brady        2023-08-07  1125  
95af467d9a4e3b Alan Brady        2023-08-07  1126  /**
95af467d9a4e3b Alan Brady        2023-08-07  1127   * idpf_send_config_rx_queues_msg - Send virtchnl config rx queues message
9905cc722394fa Pavan Kumar Linga 2025-05-08  1128   * @adapter: adapter pointer used to send virtchnl message
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1129   * @rsrc: pointer to queue and vector resources
9905cc722394fa Pavan Kumar Linga 2025-05-08  1130   * @vport_id: vport identifier used while preparing the virtchnl message
9905cc722394fa Pavan Kumar Linga 2025-05-08  1131   * @rsc_ena: flag to check if RSC feature is enabled
95af467d9a4e3b Alan Brady        2023-08-07  1132   *
95af467d9a4e3b Alan Brady        2023-08-07  1133   * Send config rx queues virtchnl message.  Returns 0 on success, negative on
95af467d9a4e3b Alan Brady        2023-08-07  1134   * failure.
95af467d9a4e3b Alan Brady        2023-08-07  1135   */
9905cc722394fa Pavan Kumar Linga 2025-05-08  1136  static int idpf_send_config_rx_queues_msg(struct idpf_adapter *adapter,
9905cc722394fa Pavan Kumar Linga 2025-05-08  1137  					  struct idpf_q_vec_rsrc *rsrc,
9905cc722394fa Pavan Kumar Linga 2025-05-08  1138  					  u32 vport_id, bool rsc_ena)
95af467d9a4e3b Alan Brady        2023-08-07  1139  {
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1140  	struct libie_ctlq_xn_send_params xn_params = {
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1141  		.timeout_ms	= IDPF_VC_XN_DEFAULT_TIMEOUT_MSEC,
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1142  		.chnl_opcode	= VIRTCHNL2_OP_CONFIG_RX_QUEUES,
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1143  	};
52361a06d3f299 Alan Brady        2024-02-22  1144  	struct virtchnl2_rxq_info *qi __free(kfree) = NULL;
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1145  	struct virtchnl2_config_rx_queues *crq;
95af467d9a4e3b Alan Brady        2023-08-07  1146  	u32 config_sz, chunk_sz, buf_sz;
95af467d9a4e3b Alan Brady        2023-08-07  1147  	int totqs, num_msgs, num_chunks;
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1148  	int k = 0, err = 0;
95af467d9a4e3b Alan Brady        2023-08-07  1149  
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1150  	totqs = rsrc->num_rxq + rsrc->num_bufq;
95af467d9a4e3b Alan Brady        2023-08-07  1151  	qi = kcalloc(totqs, sizeof(struct virtchnl2_rxq_info), GFP_KERNEL);
95af467d9a4e3b Alan Brady        2023-08-07  1152  	if (!qi)
95af467d9a4e3b Alan Brady        2023-08-07  1153  		return -ENOMEM;
95af467d9a4e3b Alan Brady        2023-08-07  1154  
95af467d9a4e3b Alan Brady        2023-08-07  1155  	/* Populate the queue info buffer with all queue context info */
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1156  	for (u16 i = 0; i < rsrc->num_rxq_grp; i++) {
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1157  		struct idpf_rxq_group *rx_qgrp = &rsrc->rxq_grps[i];
95af467d9a4e3b Alan Brady        2023-08-07  1158  		u16 num_rxq;
95af467d9a4e3b Alan Brady        2023-08-07  1159  
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1160  		if (!idpf_is_queue_model_split(rsrc->rxq_model))
95af467d9a4e3b Alan Brady        2023-08-07  1161  			goto setup_rxqs;
95af467d9a4e3b Alan Brady        2023-08-07  1162  
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1163  		for (u8 j = 0; j < rsrc->num_bufqs_per_qgrp; j++, k++) {
e4891e4687c8dd Alexander Lobakin 2024-06-20  1164  			struct idpf_buf_queue *bufq =
95af467d9a4e3b Alan Brady        2023-08-07  1165  				&rx_qgrp->splitq.bufq_sets[j].bufq;
95af467d9a4e3b Alan Brady        2023-08-07  1166  
95af467d9a4e3b Alan Brady        2023-08-07  1167  			qi[k].queue_id = cpu_to_le32(bufq->q_id);
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1168  			qi[k].model = cpu_to_le16(rsrc->rxq_model);
e4891e4687c8dd Alexander Lobakin 2024-06-20  1169  			qi[k].type =
e4891e4687c8dd Alexander Lobakin 2024-06-20  1170  				cpu_to_le32(VIRTCHNL2_QUEUE_TYPE_RX_BUFFER);
95af467d9a4e3b Alan Brady        2023-08-07  1171  			qi[k].desc_ids = cpu_to_le64(VIRTCHNL2_RXDID_2_FLEX_SPLITQ_M);
95af467d9a4e3b Alan Brady        2023-08-07  1172  			qi[k].ring_len = cpu_to_le16(bufq->desc_count);
95af467d9a4e3b Alan Brady        2023-08-07  1173  			qi[k].dma_ring_addr = cpu_to_le64(bufq->dma);
95af467d9a4e3b Alan Brady        2023-08-07  1174  			qi[k].data_buffer_size = cpu_to_le32(bufq->rx_buf_size);
e4891e4687c8dd Alexander Lobakin 2024-06-20  1175  			qi[k].buffer_notif_stride = IDPF_RX_BUF_STRIDE;
95af467d9a4e3b Alan Brady        2023-08-07  1176  			qi[k].rx_buffer_low_watermark =
95af467d9a4e3b Alan Brady        2023-08-07  1177  				cpu_to_le16(bufq->rx_buffer_low_watermark);
9905cc722394fa Pavan Kumar Linga 2025-05-08  1178  			if (rsc_ena)
95af467d9a4e3b Alan Brady        2023-08-07  1179  				qi[k].qflags |= cpu_to_le16(VIRTCHNL2_RXQ_RSC);
95af467d9a4e3b Alan Brady        2023-08-07  1180  		}
95af467d9a4e3b Alan Brady        2023-08-07  1181  
95af467d9a4e3b Alan Brady        2023-08-07  1182  setup_rxqs:
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1183  		if (idpf_is_queue_model_split(rsrc->rxq_model))
95af467d9a4e3b Alan Brady        2023-08-07  1184  			num_rxq = rx_qgrp->splitq.num_rxq_sets;
95af467d9a4e3b Alan Brady        2023-08-07  1185  		else
95af467d9a4e3b Alan Brady        2023-08-07  1186  			num_rxq = rx_qgrp->singleq.num_rxq;
95af467d9a4e3b Alan Brady        2023-08-07  1187  
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1188  		for (u16 j = 0; j < num_rxq; j++, k++) {
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1189  			const struct idpf_bufq_set *sets;
e4891e4687c8dd Alexander Lobakin 2024-06-20  1190  			struct idpf_rx_queue *rxq;
95af467d9a4e3b Alan Brady        2023-08-07  1191  
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1192  			if (!idpf_is_queue_model_split(rsrc->rxq_model)) {
95af467d9a4e3b Alan Brady        2023-08-07  1193  				rxq = rx_qgrp->singleq.rxqs[j];
95af467d9a4e3b Alan Brady        2023-08-07  1194  				goto common_qi_fields;
95af467d9a4e3b Alan Brady        2023-08-07  1195  			}
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1196  
95af467d9a4e3b Alan Brady        2023-08-07  1197  			rxq = &rx_qgrp->splitq.rxq_sets[j]->rxq;
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1198  			sets = rxq->bufq_sets;
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1199  
74d1412ac8f371 Alexander Lobakin 2024-06-20  1200  			/* In splitq mode, RXQ buffer size should be
74d1412ac8f371 Alexander Lobakin 2024-06-20  1201  			 * set to that of the first buffer queue
74d1412ac8f371 Alexander Lobakin 2024-06-20  1202  			 * associated with this RXQ.
74d1412ac8f371 Alexander Lobakin 2024-06-20  1203  			 */
74d1412ac8f371 Alexander Lobakin 2024-06-20  1204  			rxq->rx_buf_size = sets[0].bufq.rx_buf_size;
74d1412ac8f371 Alexander Lobakin 2024-06-20  1205  
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1206  			qi[k].rx_bufq1_id = cpu_to_le16(sets[0].bufq.q_id);
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1207  			if (rsrc->num_bufqs_per_qgrp > IDPF_SINGLE_BUFQ_PER_RXQ_GRP) {
95af467d9a4e3b Alan Brady        2023-08-07  1208  				qi[k].bufq2_ena = IDPF_BUFQ2_ENA;
95af467d9a4e3b Alan Brady        2023-08-07  1209  				qi[k].rx_bufq2_id =
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1210  					cpu_to_le16(sets[1].bufq.q_id);
95af467d9a4e3b Alan Brady        2023-08-07  1211  			}
95af467d9a4e3b Alan Brady        2023-08-07  1212  			qi[k].rx_buffer_low_watermark =
95af467d9a4e3b Alan Brady        2023-08-07  1213  				cpu_to_le16(rxq->rx_buffer_low_watermark);
9905cc722394fa Pavan Kumar Linga 2025-05-08  1214  			if (rsc_ena)
95af467d9a4e3b Alan Brady        2023-08-07  1215  				qi[k].qflags |= cpu_to_le16(VIRTCHNL2_RXQ_RSC);
95af467d9a4e3b Alan Brady        2023-08-07  1216  
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1217  			rxq->rx_hbuf_size = sets[0].bufq.rx_hbuf_size;
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1218  
e4891e4687c8dd Alexander Lobakin 2024-06-20  1219  			if (idpf_queue_has(HSPLIT_EN, rxq)) {
95af467d9a4e3b Alan Brady        2023-08-07  1220  				qi[k].qflags |=
95af467d9a4e3b Alan Brady        2023-08-07  1221  					cpu_to_le16(VIRTCHNL2_RXQ_HDR_SPLIT);
95af467d9a4e3b Alan Brady        2023-08-07  1222  				qi[k].hdr_buffer_size =
95af467d9a4e3b Alan Brady        2023-08-07  1223  					cpu_to_le16(rxq->rx_hbuf_size);
95af467d9a4e3b Alan Brady        2023-08-07  1224  			}
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1225  
90912f9f4f2d15 Alexander Lobakin 2024-06-20  1226  common_qi_fields:
95af467d9a4e3b Alan Brady        2023-08-07  1227  			qi[k].queue_id = cpu_to_le32(rxq->q_id);
8938f18fb31929 Pavan Kumar Linga 2025-05-08  1228  			qi[k].model = cpu_to_le16(rsrc->rxq_model);
e4891e4687c8dd Alexander Lobakin 2024-06-20  1229  			qi[k].type = cpu_to_le32(VIRTCHNL2_QUEUE_TYPE_RX);
95af467d9a4e3b Alan Brady        2023-08-07  1230  			qi[k].ring_len = cpu_to_le16(rxq->desc_count);
95af467d9a4e3b Alan Brady        2023-08-07  1231  			qi[k].dma_ring_addr = cpu_to_le64(rxq->dma);
95af467d9a4e3b Alan Brady        2023-08-07  1232  			qi[k].max_pkt_size = cpu_to_le32(rxq->rx_max_pkt_size);
95af467d9a4e3b Alan Brady        2023-08-07  1233  			qi[k].data_buffer_size = cpu_to_le32(rxq->rx_buf_size);
95af467d9a4e3b Alan Brady        2023-08-07  1234  			qi[k].qflags |=
95af467d9a4e3b Alan Brady        2023-08-07  1235  				cpu_to_le16(VIRTCHNL2_RX_DESC_SIZE_32BYTE);
95af467d9a4e3b Alan Brady        2023-08-07  1236  			qi[k].desc_ids = cpu_to_le64(rxq->rxdids);
95af467d9a4e3b Alan Brady        2023-08-07  1237  		}
95af467d9a4e3b Alan Brady        2023-08-07  1238  	}
95af467d9a4e3b Alan Brady        2023-08-07  1239  
95af467d9a4e3b Alan Brady        2023-08-07  1240  	/* Make sure accounting agrees */
52361a06d3f299 Alan Brady        2024-02-22  1241  	if (k != totqs)
52361a06d3f299 Alan Brady        2024-02-22  1242  		return -EINVAL;
95af467d9a4e3b Alan Brady        2023-08-07  1243  
95af467d9a4e3b Alan Brady        2023-08-07  1244  	/* Chunk up the queue contexts into multiple messages to avoid
95af467d9a4e3b Alan Brady        2023-08-07  1245  	 * sending a control queue message buffer that is too large
95af467d9a4e3b Alan Brady        2023-08-07  1246  	 */
95af467d9a4e3b Alan Brady        2023-08-07  1247  	config_sz = sizeof(struct virtchnl2_config_rx_queues);
95af467d9a4e3b Alan Brady        2023-08-07  1248  	chunk_sz = sizeof(struct virtchnl2_rxq_info);
95af467d9a4e3b Alan Brady        2023-08-07  1249  
95af467d9a4e3b Alan Brady        2023-08-07  1250  	num_chunks = min_t(u32, IDPF_NUM_CHUNKS_PER_MSG(config_sz, chunk_sz),
95af467d9a4e3b Alan Brady        2023-08-07  1251  			   totqs);
95af467d9a4e3b Alan Brady        2023-08-07  1252  	num_msgs = DIV_ROUND_UP(totqs, num_chunks);
95af467d9a4e3b Alan Brady        2023-08-07  1253  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1254  	for (u16 i = 0, k = 0; i < num_msgs; i++) {
95af467d9a4e3b Alan Brady        2023-08-07  1255  		buf_sz = struct_size(crq, qinfo, num_chunks);
95af467d9a4e3b Alan Brady        2023-08-07  1256  		crq = kzalloc(buf_sz, GFP_KERNEL);
52361a06d3f299 Alan Brady        2024-02-22  1257  		if (!crq)
52361a06d3f299 Alan Brady        2024-02-22  1258  			return -ENOMEM;
95af467d9a4e3b Alan Brady        2023-08-07  1259  
9905cc722394fa Pavan Kumar Linga 2025-05-08  1260  		crq->vport_id = cpu_to_le32(vport_id);
95af467d9a4e3b Alan Brady        2023-08-07  1261  		crq->num_qinfo = cpu_to_le16(num_chunks);
95af467d9a4e3b Alan Brady        2023-08-07  1262  		memcpy(crq->qinfo, &qi[k], chunk_sz * num_chunks);
95af467d9a4e3b Alan Brady        2023-08-07  1263  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1264  		err = idpf_send_mb_msg(adapter, &xn_params, crq, buf_sz);
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1265  		if (err)
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1266  			goto rel_last_buf;
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1267  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1268  		libie_ctlq_release_rx_buf(&xn_params.recv_mem);
95af467d9a4e3b Alan Brady        2023-08-07  1269  
95af467d9a4e3b Alan Brady        2023-08-07  1270  		k += num_chunks;
95af467d9a4e3b Alan Brady        2023-08-07  1271  		totqs -= num_chunks;
95af467d9a4e3b Alan Brady        2023-08-07  1272  		num_chunks = min(num_chunks, totqs);
95af467d9a4e3b Alan Brady        2023-08-07  1273  	}
95af467d9a4e3b Alan Brady        2023-08-07  1274  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1275  rel_last_buf:
43bb60cc31afce Pavan Kumar Linga 2025-05-23 @1276  	if (num_msgs && libie_cp_can_send_onstack(buf_sz))
43bb60cc31afce Pavan Kumar Linga 2025-05-23 @1277  		kfree(crq);
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1278  
43bb60cc31afce Pavan Kumar Linga 2025-05-23  1279  	return err;
95af467d9a4e3b Alan Brady        2023-08-07  1280  }
95af467d9a4e3b Alan Brady        2023-08-07  1281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
