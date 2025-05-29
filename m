Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF621ADA3
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 02:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748486241; cv=none; b=MZxKOMQRP8lhsgBSd6B82DimTPgAf0O9uWlHuZP3UZR2WlZpH95WIVYLO3NELN1DiG1cqiIQ8OjG0JwCazuXk9s7xVN6SN6ATze9DlxBWgmGys02Rh2ECFRbiSGyVJwPBw+16MoeRq+pjuqpMUAMPbbS5emBCuHOOgdlehn5YcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748486241; c=relaxed/simple;
	bh=qLbLlcjCKuI6E6njXiOzsZtjmmF3RKoUIgoH0WQ5IQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nEdkW8+NJZQozNlYwFSWp4seOi1GFPOWrQTTgk5Lhyq/RIOYuT5eUV80TxvrIhI2729EzoJF8vyTfdl8sz+GQDDtGg/RjTf8Z95De/V6IA3wweBaEq/nDylzg9Brk+jQuBj47AjU8kluO5TJMEsUnyWBfmAIuIAZ47mUkejbDAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZO2cp4R; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZO2cp4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748486240; x=1780022240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qLbLlcjCKuI6E6njXiOzsZtjmmF3RKoUIgoH0WQ5IQk=;
  b=eZO2cp4RTpqGTTgwQuFqp6fbz2psMRhsN1se+42ZL9PFzpIhuLnq1dQu
   zpehvDrSdQY7MCjhLPJJPMOKIi1awoB8ViQy+bWe/jFod4YkWBqCmE5nR
   uqFzE8AZY5t9CS6q573LoAEm3FdtYHrJrGvtDcT/N2yKmGhDuv0738lps
   US8a/sI/r+09Q01MIF6GNqcY79LT2zEpP9bhEZlW6b6L50NVnakD4l9un
   opPdBmDLBTE252aukkwjzje/3ZdZkx4AA7gOLMiVMC9L6xKuCsNzSzZFm
   a/+H1Gflg2Y4fPkDAPDhfnMWpwzwFmLomPIlch+xZkMHM7R7FEvzQ0vnC
   g==;
X-CSE-ConnectionGUID: VpPnlMW9Toe2/CIWeOv2rQ==
X-CSE-MsgGUID: dNh4OQRsS36vwkV27rvg6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50459447"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="50459447"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 19:37:19 -0700
X-CSE-ConnectionGUID: pK638NacTK+M/wD4aASMPQ==
X-CSE-MsgGUID: zQHWDyUwSZWSJpygubaBkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="144405815"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 May 2025 19:37:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKT8t-000WFQ-0d;
	Thu, 29 May 2025 02:37:15 +0000
Date: Thu, 29 May 2025 10:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V2 19/19] virtio_ring: add in order support
Message-ID: <202505291000.2SXRDeLg-lkp@intel.com>
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
In-Reply-To: <20250528064234.12228-20-jasowang@redhat.com>
References: <20250528064234.12228-20-jasowang@redhat.com>
TO: Jason Wang <jasowang@redhat.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.15 next-20250528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Wang/virtio_ring-rename-virtqueue_reinit_xxx-to-virtqueue_reset_xxx/20250528-144806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20250528064234.12228-20-jasowang%40redhat.com
patch subject: [PATCH V2 19/19] virtio_ring: add in order support
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: nios2-randconfig-r072-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291000.2SXRDeLg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505291000.2SXRDeLg-lkp@intel.com/

New smatch warnings:
drivers/virtio/virtio_ring.c:2109 virtqueue_get_buf_ctx_packed_in_order() error: uninitialized symbol 'id'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
drivers/virtio/virtio_ring.c:2113 virtqueue_get_buf_ctx_packed_in_order() error: uninitialized symbol 'id'.
drivers/virtio/virtio_ring.c:1866 virtqueue_add_packed_in_order() error: uninitialized symbol 'head_flags'.
drivers/virtio/virtio_ring.c:1709 virtqueue_add_packed() error: uninitialized symbol 'prev'.
drivers/virtio/virtio_ring.c:1717 virtqueue_add_packed() error: uninitialized symbol 'head_flags'.

vim +/id +2109 drivers/virtio/virtio_ring.c

52bedb9b5387f0 Jason Wang 2025-05-28  2069  
52bedb9b5387f0 Jason Wang 2025-05-28  2070  static void *virtqueue_get_buf_ctx_packed_in_order(struct vring_virtqueue *vq,
52bedb9b5387f0 Jason Wang 2025-05-28  2071  						   unsigned int *len,
52bedb9b5387f0 Jason Wang 2025-05-28  2072  						   void **ctx)
52bedb9b5387f0 Jason Wang 2025-05-28  2073  {
52bedb9b5387f0 Jason Wang 2025-05-28  2074  	unsigned int num = vq->packed.vring.num;
52bedb9b5387f0 Jason Wang 2025-05-28  2075  	u16 last_used, id, last_used_idx;
52bedb9b5387f0 Jason Wang 2025-05-28  2076  	bool used_wrap_counter;
52bedb9b5387f0 Jason Wang 2025-05-28  2077  	void *ret;
52bedb9b5387f0 Jason Wang 2025-05-28  2078  
52bedb9b5387f0 Jason Wang 2025-05-28  2079  	START_USE(vq);
52bedb9b5387f0 Jason Wang 2025-05-28  2080  
52bedb9b5387f0 Jason Wang 2025-05-28  2081  	if (unlikely(vq->broken)) {
52bedb9b5387f0 Jason Wang 2025-05-28  2082  		END_USE(vq);
52bedb9b5387f0 Jason Wang 2025-05-28  2083  		return NULL;
52bedb9b5387f0 Jason Wang 2025-05-28  2084  	}
52bedb9b5387f0 Jason Wang 2025-05-28  2085  
52bedb9b5387f0 Jason Wang 2025-05-28  2086  	last_used_idx = vq->last_used_idx;
52bedb9b5387f0 Jason Wang 2025-05-28  2087  	used_wrap_counter = packed_used_wrap_counter(last_used_idx);
52bedb9b5387f0 Jason Wang 2025-05-28  2088  	last_used = packed_last_used(last_used_idx);
52bedb9b5387f0 Jason Wang 2025-05-28  2089  
52bedb9b5387f0 Jason Wang 2025-05-28  2090  	if (vq->batch_head == num) {
52bedb9b5387f0 Jason Wang 2025-05-28  2091  		if (!__more_used_packed(vq)) {
52bedb9b5387f0 Jason Wang 2025-05-28  2092  			pr_debug("No more buffers in queue\n");
52bedb9b5387f0 Jason Wang 2025-05-28  2093  			END_USE(vq);
52bedb9b5387f0 Jason Wang 2025-05-28  2094  			return NULL;
52bedb9b5387f0 Jason Wang 2025-05-28  2095  		}
52bedb9b5387f0 Jason Wang 2025-05-28  2096  		/* Only get used elements after they have been exposed by host. */
52bedb9b5387f0 Jason Wang 2025-05-28  2097  		virtio_rmb(vq->weak_barriers);
52bedb9b5387f0 Jason Wang 2025-05-28  2098  		vq->batch_head = le16_to_cpu(vq->packed.vring.desc[last_used].id);
52bedb9b5387f0 Jason Wang 2025-05-28  2099  		vq->batch_len = le32_to_cpu(vq->packed.vring.desc[last_used].len);
52bedb9b5387f0 Jason Wang 2025-05-28  2100  	}
52bedb9b5387f0 Jason Wang 2025-05-28  2101  
52bedb9b5387f0 Jason Wang 2025-05-28  2102  	if (vq->batch_head == last_used) {
52bedb9b5387f0 Jason Wang 2025-05-28  2103  		vq->batch_head = num;
52bedb9b5387f0 Jason Wang 2025-05-28  2104  		*len = vq->batch_len;
52bedb9b5387f0 Jason Wang 2025-05-28  2105  	} else
52bedb9b5387f0 Jason Wang 2025-05-28  2106  		*len = vq->packed.desc_state[last_used].total_len;
52bedb9b5387f0 Jason Wang 2025-05-28  2107  
52bedb9b5387f0 Jason Wang 2025-05-28  2108  	if (unlikely(last_used >= num)) {
52bedb9b5387f0 Jason Wang 2025-05-28 @2109  		BAD_RING(vq, "id %u out of range\n", id);
52bedb9b5387f0 Jason Wang 2025-05-28  2110  		return NULL;
52bedb9b5387f0 Jason Wang 2025-05-28  2111  	}
52bedb9b5387f0 Jason Wang 2025-05-28  2112  	if (unlikely(!vq->packed.desc_state[last_used].data)) {
52bedb9b5387f0 Jason Wang 2025-05-28  2113  		BAD_RING(vq, "id %u is not a head!\n", id);
52bedb9b5387f0 Jason Wang 2025-05-28  2114  		return NULL;
52bedb9b5387f0 Jason Wang 2025-05-28  2115  	}
52bedb9b5387f0 Jason Wang 2025-05-28  2116  
52bedb9b5387f0 Jason Wang 2025-05-28  2117  	/* detach_buf_packed clears data, so grab it now. */
52bedb9b5387f0 Jason Wang 2025-05-28  2118  	ret = vq->packed.desc_state[last_used].data;
52bedb9b5387f0 Jason Wang 2025-05-28  2119  	detach_buf_packed_in_order(vq, last_used, ctx);
52bedb9b5387f0 Jason Wang 2025-05-28  2120  
52bedb9b5387f0 Jason Wang 2025-05-28  2121  	update_last_used_idx_packed(vq, last_used, last_used,
52bedb9b5387f0 Jason Wang 2025-05-28  2122  				    used_wrap_counter);
52bedb9b5387f0 Jason Wang 2025-05-28  2123  
52bedb9b5387f0 Jason Wang 2025-05-28  2124  	LAST_ADD_TIME_INVALID(vq);
52bedb9b5387f0 Jason Wang 2025-05-28  2125  
52bedb9b5387f0 Jason Wang 2025-05-28  2126  	END_USE(vq);
52bedb9b5387f0 Jason Wang 2025-05-28  2127  	return ret;
52bedb9b5387f0 Jason Wang 2025-05-28  2128  }
52bedb9b5387f0 Jason Wang 2025-05-28  2129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
