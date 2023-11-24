Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA3E3065F
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zew4lqNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840546; x=1732376546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cC40hU/cKSv1S7VC1Dp899/QY/0y1BhLmSUXUsHMXM8=;
  b=Zew4lqNr1tKbn8PZiQip7yvh1Xf5rAMH9MRULrsT54rns7NEmjgrRBLn
   bKzzrZdrRJ4enHggPa+g2HToIZIx5KC8C/oYoKld6/lXr2LLMNJWVTl2a
   4AYEchznXsJSPMdFRTHX35h18lHa3qAeCrxsc3Fh7+6y6a7j/DSqqIK4u
   Sy4grumPGBCfiD1qOGP/RG7PG822cSWX8515RS3UdDtRptwhUSbItEqi6
   CsV0CIjY25QbE4ZHb4TRMo6ghLH8iI6afKR0v+C46yygEj0iIwzdhb3P9
   /HhUJiqIZNbAZkHpWA2VW+wCyUD8LjI0C4Ei4GkNAS4CD8uOo4+1FDmmo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="423577206"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="423577206"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911474559"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911474559"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 07:42:24 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YJx-0002yK-32;
	Fri, 24 Nov 2023 15:42:21 +0000
Date: Fri, 24 Nov 2023 23:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1971
 idpf_send_map_unmap_queue_vector_msg() warn: potentially one past the end of
 array 'vqv[k]'
Message-ID: <202311241905.MjUfYV7m-lkp@intel.com>
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
TO: Joshua Hay <joshua.a.hay@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Alan Brady <alan.brady@intel.com>
CC: Madhu Chittim <madhu.chittim@intel.com>
CC: Phani Burra <phani.r.burra@intel.com>
CC: Sridhar Samudrala <sridhar.samudrala@intel.com>
CC: Willem de Bruijn <willemb@google.com>
CC: Pavan Kumar Linga <pavan.kumar.linga@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1a09972a45ae63efbd1587337c4be13b1893330
commit: a251eee62133774cf35ff829041377e721ef9c8c idpf: add SRIOV support and other ndo_ops
date:   2 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 2 months ago
config: csky-randconfig-r081-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241905.MjUfYV7m-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241905.MjUfYV7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311241905.MjUfYV7m-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1971 idpf_send_map_unmap_queue_vector_msg() warn: potentially one past the end of array 'vqv[k]'
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1971 idpf_send_map_unmap_queue_vector_msg() warn: potentially one past the end of array 'vqv[k]'

Old smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1972 idpf_send_map_unmap_queue_vector_msg() warn: potentially one past the end of array 'vqv[k]'
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1972 idpf_send_map_unmap_queue_vector_msg() warn: potentially one past the end of array 'vqv[k]'
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1973 idpf_send_map_unmap_queue_vector_msg() warn: potentially one past the end of array 'vqv[k]'
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1973 idpf_send_map_unmap_queue_vector_msg() warn: potentially one past the end of array 'vqv[k]'
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1974 idpf_send_map_unmap_queue_vector_msg() warn: potentially one past the end of array 'vqv[k]'
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1974 idpf_send_map_unmap_queue_vector_msg() warn: potentially one past the end of array 'vqv[k]'

vim +1971 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

d4d5587182664b Pavan Kumar Linga 2023-08-07  1902  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1903  /**
d4d5587182664b Pavan Kumar Linga 2023-08-07  1904   * idpf_send_map_unmap_queue_vector_msg - Send virtchnl map or unmap queue
d4d5587182664b Pavan Kumar Linga 2023-08-07  1905   * vector message
d4d5587182664b Pavan Kumar Linga 2023-08-07  1906   * @vport: virtual port data structure
d4d5587182664b Pavan Kumar Linga 2023-08-07  1907   * @map: true for map and false for unmap
d4d5587182664b Pavan Kumar Linga 2023-08-07  1908   *
d4d5587182664b Pavan Kumar Linga 2023-08-07  1909   * Send map or unmap queue vector virtchnl message.  Returns 0 on success,
d4d5587182664b Pavan Kumar Linga 2023-08-07  1910   * negative on failure.
d4d5587182664b Pavan Kumar Linga 2023-08-07  1911   */
d4d5587182664b Pavan Kumar Linga 2023-08-07  1912  int idpf_send_map_unmap_queue_vector_msg(struct idpf_vport *vport, bool map)
d4d5587182664b Pavan Kumar Linga 2023-08-07  1913  {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1914  	struct idpf_adapter *adapter = vport->adapter;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1915  	struct virtchnl2_queue_vector_maps *vqvm;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1916  	struct virtchnl2_queue_vector *vqv;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1917  	u32 config_sz, chunk_sz, buf_sz;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1918  	u32 num_msgs, num_chunks, num_q;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1919  	int i, j, k = 0, err = 0;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1920  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1921  	num_q = vport->num_txq + vport->num_rxq;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1922  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1923  	buf_sz = sizeof(struct virtchnl2_queue_vector) * num_q;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1924  	vqv = kzalloc(buf_sz, GFP_KERNEL);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1925  	if (!vqv)
d4d5587182664b Pavan Kumar Linga 2023-08-07  1926  		return -ENOMEM;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1927  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1928  	for (i = 0; i < vport->num_txq_grp; i++) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1929  		struct idpf_txq_group *tx_qgrp = &vport->txq_grps[i];
d4d5587182664b Pavan Kumar Linga 2023-08-07  1930  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1931  		for (j = 0; j < tx_qgrp->num_txq; j++, k++) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1932  			vqv[k].queue_type = cpu_to_le32(tx_qgrp->txqs[j]->q_type);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1933  			vqv[k].queue_id = cpu_to_le32(tx_qgrp->txqs[j]->q_id);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1934  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1935  			if (idpf_is_queue_model_split(vport->txq_model)) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1936  				vqv[k].vector_id =
d4d5587182664b Pavan Kumar Linga 2023-08-07  1937  				cpu_to_le16(tx_qgrp->complq->q_vector->v_idx);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1938  				vqv[k].itr_idx =
d4d5587182664b Pavan Kumar Linga 2023-08-07  1939  				cpu_to_le32(tx_qgrp->complq->q_vector->tx_itr_idx);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1940  			} else {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1941  				vqv[k].vector_id =
d4d5587182664b Pavan Kumar Linga 2023-08-07  1942  				cpu_to_le16(tx_qgrp->txqs[j]->q_vector->v_idx);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1943  				vqv[k].itr_idx =
d4d5587182664b Pavan Kumar Linga 2023-08-07  1944  				cpu_to_le32(tx_qgrp->txqs[j]->q_vector->tx_itr_idx);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1945  			}
d4d5587182664b Pavan Kumar Linga 2023-08-07  1946  		}
d4d5587182664b Pavan Kumar Linga 2023-08-07  1947  	}
d4d5587182664b Pavan Kumar Linga 2023-08-07  1948  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1949  	if (vport->num_txq != k) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1950  		err = -EINVAL;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1951  		goto error;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1952  	}
d4d5587182664b Pavan Kumar Linga 2023-08-07  1953  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1954  	for (i = 0; i < vport->num_rxq_grp; i++) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1955  		struct idpf_rxq_group *rx_qgrp = &vport->rxq_grps[i];
d4d5587182664b Pavan Kumar Linga 2023-08-07  1956  		u16 num_rxq;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1957  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1958  		if (idpf_is_queue_model_split(vport->rxq_model))
d4d5587182664b Pavan Kumar Linga 2023-08-07  1959  			num_rxq = rx_qgrp->splitq.num_rxq_sets;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1960  		else
d4d5587182664b Pavan Kumar Linga 2023-08-07  1961  			num_rxq = rx_qgrp->singleq.num_rxq;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1962  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1963  		for (j = 0; j < num_rxq; j++, k++) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1964  			struct idpf_queue *rxq;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1965  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1966  			if (idpf_is_queue_model_split(vport->rxq_model))
d4d5587182664b Pavan Kumar Linga 2023-08-07  1967  				rxq = &rx_qgrp->splitq.rxq_sets[j]->rxq;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1968  			else
d4d5587182664b Pavan Kumar Linga 2023-08-07  1969  				rxq = rx_qgrp->singleq.rxqs[j];
d4d5587182664b Pavan Kumar Linga 2023-08-07  1970  
d4d5587182664b Pavan Kumar Linga 2023-08-07 @1971  			vqv[k].queue_type = cpu_to_le32(rxq->q_type);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1972  			vqv[k].queue_id = cpu_to_le32(rxq->q_id);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1973  			vqv[k].vector_id = cpu_to_le16(rxq->q_vector->v_idx);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1974  			vqv[k].itr_idx = cpu_to_le32(rxq->q_vector->rx_itr_idx);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1975  		}
d4d5587182664b Pavan Kumar Linga 2023-08-07  1976  	}
d4d5587182664b Pavan Kumar Linga 2023-08-07  1977  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1978  	if (idpf_is_queue_model_split(vport->txq_model)) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1979  		if (vport->num_rxq != k - vport->num_complq) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1980  			err = -EINVAL;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1981  			goto error;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1982  		}
d4d5587182664b Pavan Kumar Linga 2023-08-07  1983  	} else {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1984  		if (vport->num_rxq != k - vport->num_txq) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  1985  			err = -EINVAL;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1986  			goto error;
d4d5587182664b Pavan Kumar Linga 2023-08-07  1987  		}
d4d5587182664b Pavan Kumar Linga 2023-08-07  1988  	}
d4d5587182664b Pavan Kumar Linga 2023-08-07  1989  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1990  	/* Chunk up the vector info into multiple messages */
d4d5587182664b Pavan Kumar Linga 2023-08-07  1991  	config_sz = sizeof(struct virtchnl2_queue_vector_maps);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1992  	chunk_sz = sizeof(struct virtchnl2_queue_vector);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1993  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1994  	num_chunks = min_t(u32, IDPF_NUM_CHUNKS_PER_MSG(config_sz, chunk_sz),
d4d5587182664b Pavan Kumar Linga 2023-08-07  1995  			   num_q);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1996  	num_msgs = DIV_ROUND_UP(num_q, num_chunks);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1997  
d4d5587182664b Pavan Kumar Linga 2023-08-07  1998  	buf_sz = struct_size(vqvm, qv_maps, num_chunks);
d4d5587182664b Pavan Kumar Linga 2023-08-07  1999  	vqvm = kzalloc(buf_sz, GFP_KERNEL);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2000  	if (!vqvm) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  2001  		err = -ENOMEM;
d4d5587182664b Pavan Kumar Linga 2023-08-07  2002  		goto error;
d4d5587182664b Pavan Kumar Linga 2023-08-07  2003  	}
d4d5587182664b Pavan Kumar Linga 2023-08-07  2004  
d4d5587182664b Pavan Kumar Linga 2023-08-07  2005  	mutex_lock(&vport->vc_buf_lock);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2006  
d4d5587182664b Pavan Kumar Linga 2023-08-07  2007  	for (i = 0, k = 0; i < num_msgs; i++) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  2008  		memset(vqvm, 0, buf_sz);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2009  		vqvm->vport_id = cpu_to_le32(vport->vport_id);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2010  		vqvm->num_qv_maps = cpu_to_le16(num_chunks);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2011  		memcpy(vqvm->qv_maps, &vqv[k], chunk_sz * num_chunks);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2012  
d4d5587182664b Pavan Kumar Linga 2023-08-07  2013  		if (map) {
d4d5587182664b Pavan Kumar Linga 2023-08-07  2014  			err = idpf_send_mb_msg(adapter,
d4d5587182664b Pavan Kumar Linga 2023-08-07  2015  					       VIRTCHNL2_OP_MAP_QUEUE_VECTOR,
d4d5587182664b Pavan Kumar Linga 2023-08-07  2016  					       buf_sz, (u8 *)vqvm);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2017  			if (!err)
d4d5587182664b Pavan Kumar Linga 2023-08-07  2018  				err = idpf_wait_for_event(adapter, vport,
d4d5587182664b Pavan Kumar Linga 2023-08-07  2019  							  IDPF_VC_MAP_IRQ,
d4d5587182664b Pavan Kumar Linga 2023-08-07  2020  							  IDPF_VC_MAP_IRQ_ERR);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2021  		} else {
d4d5587182664b Pavan Kumar Linga 2023-08-07  2022  			err = idpf_send_mb_msg(adapter,
d4d5587182664b Pavan Kumar Linga 2023-08-07  2023  					       VIRTCHNL2_OP_UNMAP_QUEUE_VECTOR,
d4d5587182664b Pavan Kumar Linga 2023-08-07  2024  					       buf_sz, (u8 *)vqvm);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2025  			if (!err)
d4d5587182664b Pavan Kumar Linga 2023-08-07  2026  				err =
d4d5587182664b Pavan Kumar Linga 2023-08-07  2027  				idpf_min_wait_for_event(adapter, vport,
d4d5587182664b Pavan Kumar Linga 2023-08-07  2028  							IDPF_VC_UNMAP_IRQ,
d4d5587182664b Pavan Kumar Linga 2023-08-07  2029  							IDPF_VC_UNMAP_IRQ_ERR);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2030  		}
d4d5587182664b Pavan Kumar Linga 2023-08-07  2031  		if (err)
d4d5587182664b Pavan Kumar Linga 2023-08-07  2032  			goto mbx_error;
d4d5587182664b Pavan Kumar Linga 2023-08-07  2033  
d4d5587182664b Pavan Kumar Linga 2023-08-07  2034  		k += num_chunks;
d4d5587182664b Pavan Kumar Linga 2023-08-07  2035  		num_q -= num_chunks;
d4d5587182664b Pavan Kumar Linga 2023-08-07  2036  		num_chunks = min(num_chunks, num_q);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2037  		/* Recalculate buffer size */
d4d5587182664b Pavan Kumar Linga 2023-08-07  2038  		buf_sz = struct_size(vqvm, qv_maps, num_chunks);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2039  	}
d4d5587182664b Pavan Kumar Linga 2023-08-07  2040  
d4d5587182664b Pavan Kumar Linga 2023-08-07  2041  mbx_error:
d4d5587182664b Pavan Kumar Linga 2023-08-07  2042  	mutex_unlock(&vport->vc_buf_lock);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2043  	kfree(vqvm);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2044  error:
d4d5587182664b Pavan Kumar Linga 2023-08-07  2045  	kfree(vqv);
d4d5587182664b Pavan Kumar Linga 2023-08-07  2046  
d4d5587182664b Pavan Kumar Linga 2023-08-07  2047  	return err;
d4d5587182664b Pavan Kumar Linga 2023-08-07  2048  }
d4d5587182664b Pavan Kumar Linga 2023-08-07  2049  

:::::: The code at line 1971 was first introduced by commit
:::::: d4d5587182664b0c4ab6d3556ce881cb975507c2 idpf: initialize interrupts and enable vport

:::::: TO: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
