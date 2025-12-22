Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02933333446
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766423651; cv=none; b=fi9B2xE2sq4eZmO9KHEOM/CCKTCE+0B6bubOOxSHG4vCs5jjx9SC3mcTFW5hmoKOJqK6m9DyEHmA3LI6VFoQOOCUSkEnnbGjphi/soh2RTl9Tfj3iNOwaq6JTl6kZUIowDB8GHmrw9hEyr2rWS48eyQv+7hJstdg0QZnUJMhOeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766423651; c=relaxed/simple;
	bh=mmDNU98aOIfVVCWklsgoCCpzEKKOKOroSytcwdgFVm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKS9jTUF8L21xCg47l6z8KZ/S/6TPaLziAMecQJITissiXz1d7AieEF5OS7NB68oyPbkqX1kcSUPJnuoRqEhGbqWup23mcMQ0geqpOLAuPpvmG7oU1tzvcIT6EC3T3Iz0j2VcLpi725ru1Py4sz71hr3IeOZd4KB4kKHJ4iv01I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPKLqYBX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPKLqYBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766423649; x=1797959649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mmDNU98aOIfVVCWklsgoCCpzEKKOKOroSytcwdgFVm8=;
  b=RPKLqYBXnLSysHN6YI9rH3kY5xwxtQn9/t+uNCuuCiDpZya+3YH0qc/Z
   enQhX2iKL0hdD85rShWTlTZEuIhg201llu7c+y7Y1cmzljg/lRj3a11YL
   QSnzdL5E0v+HReZgrpOABz48z/G5Gx//UPnpGC2vauQVXuaFUpLhgCJvL
   /T/dBx23lRNhRsgZGGKTC8OX+xMnBFQ68gwRQIOvfxhuEhmTckrda5lqF
   i/anoPvciH2jeJ0fBrAsRqdfsZ2Xn06zu3w5ePtrsen/L8EtMS4FBHB2N
   5FUYy9bCUmxoiEar2+Lr8VD6RRLq9bCTdiu1idbXtfj/wzSfhBS339/oV
   w==;
X-CSE-ConnectionGUID: qYi0G/vLT9iUu3ujSJYLWQ==
X-CSE-MsgGUID: 0ivOxge8Q5OhZlC2YpQtOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="70856967"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="70856967"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:14:07 -0800
X-CSE-ConnectionGUID: G+VGiifUQxKQIvFkJBAGkw==
X-CSE-MsgGUID: DtfATfCvS/6lqA3+xeM0cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199558012"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Dec 2025 09:14:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXjTv-000000000un-1ahZ;
	Mon, 22 Dec 2025 17:14:03 +0000
Date: Tue, 23 Dec 2025 01:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2 11/14] crypto: zynqmp-aes-gcm: Change coherent DMA to
 streaming DMA API
Message-ID: <202512230135.v83tCBwW-lkp@intel.com>
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
In-Reply-To: <20251220155905.346790-12-h.jain@amd.com>
References: <20251220155905.346790-12-h.jain@amd.com>
TO: Harsh Jain <h.jain@amd.com>
TO: herbert@gondor.apana.org.au
TO: davem@davemloft.net
TO: linux-crypto@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mounika.botcha@amd.com
TO: sarat.chand.savitala@amd.com
TO: michal.simek@amd.com
TO: linux-arm-kernel@lists.infradead.org
TO: jay.buddhabhatti@amd.com
CC: Harsh Jain <h.jain@amd.com>

Hi Harsh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.19-rc2 next-20251219]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harsh-Jain/firmware-zynqmp-Move-crypto-API-s-to-separate-file/20251221-000259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20251220155905.346790-12-h.jain%40amd.com
patch subject: [PATCH v2 11/14] crypto: zynqmp-aes-gcm: Change coherent DMA to streaming DMA API
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r062-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230135.v83tCBwW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512230135.v83tCBwW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/xilinx/zynqmp-aes-gcm.c:183:11-12: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 182)
   drivers/crypto/xilinx/zynqmp-aes-gcm.c:185:13-14: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 184)

vim +183 drivers/crypto/xilinx/zynqmp-aes-gcm.c

81a7b01d6b215b Harsh Jain    2025-12-20   85  
4d96f7d48131fe Kalyani Akula 2020-02-17   86  static int zynqmp_aes_aead_cipher(struct aead_request *req)
4d96f7d48131fe Kalyani Akula 2020-02-17   87  {
4d96f7d48131fe Kalyani Akula 2020-02-17   88  	struct crypto_aead *aead = crypto_aead_reqtfm(req);
0e04c861048f99 Harsh Jain    2025-12-20   89  	struct xilinx_aead_tfm_ctx *tfm_ctx = crypto_aead_ctx(aead);
0e04c861048f99 Harsh Jain    2025-12-20   90  	struct xilinx_aead_req_ctx *rq_ctx = aead_request_ctx(req);
ff0be7788f241b Harsh Jain    2025-12-20   91  	dma_addr_t dma_addr_data, dma_addr_hw_req;
4d96f7d48131fe Kalyani Akula 2020-02-17   92  	struct device *dev = tfm_ctx->dev;
4d96f7d48131fe Kalyani Akula 2020-02-17   93  	struct zynqmp_aead_hw_req *hwreq;
4d96f7d48131fe Kalyani Akula 2020-02-17   94  	unsigned int data_size;
4d96f7d48131fe Kalyani Akula 2020-02-17   95  	unsigned int status;
1d9000262b3b80 Rajan Vaja    2020-05-01   96  	int ret;
4d96f7d48131fe Kalyani Akula 2020-02-17   97  	size_t dma_size;
ff0be7788f241b Harsh Jain    2025-12-20   98  	void *dmabuf;
4d96f7d48131fe Kalyani Akula 2020-02-17   99  	char *kbuf;
4d96f7d48131fe Kalyani Akula 2020-02-17  100  
ff0be7788f241b Harsh Jain    2025-12-20  101  	dma_size = req->cryptlen + XILINX_AES_AUTH_SIZE;
ff0be7788f241b Harsh Jain    2025-12-20  102  	kbuf = kmalloc(dma_size, GFP_KERNEL);
4d96f7d48131fe Kalyani Akula 2020-02-17  103  	if (!kbuf)
4d96f7d48131fe Kalyani Akula 2020-02-17  104  		return -ENOMEM;
4d96f7d48131fe Kalyani Akula 2020-02-17  105  
ff0be7788f241b Harsh Jain    2025-12-20  106  	dmabuf = kmalloc(sizeof(*hwreq) + GCM_AES_IV_SIZE, GFP_KERNEL);
ff0be7788f241b Harsh Jain    2025-12-20  107  	if (!dmabuf) {
ff0be7788f241b Harsh Jain    2025-12-20  108  		kfree(kbuf);
4d96f7d48131fe Kalyani Akula 2020-02-17  109  		return -ENOMEM;
4d96f7d48131fe Kalyani Akula 2020-02-17  110  	}
ff0be7788f241b Harsh Jain    2025-12-20  111  	hwreq = dmabuf;
4d96f7d48131fe Kalyani Akula 2020-02-17  112  	data_size = req->cryptlen;
4d96f7d48131fe Kalyani Akula 2020-02-17  113  	scatterwalk_map_and_copy(kbuf, req->src, 0, req->cryptlen, 0);
ff0be7788f241b Harsh Jain    2025-12-20  114  	memcpy(dmabuf + sizeof(struct zynqmp_aead_hw_req), req->iv, GCM_AES_IV_SIZE);
ff0be7788f241b Harsh Jain    2025-12-20  115  	dma_addr_data = dma_map_single(dev, kbuf, dma_size, DMA_BIDIRECTIONAL);
ff0be7788f241b Harsh Jain    2025-12-20  116  	if (unlikely(dma_mapping_error(dev, dma_addr_data))) {
ff0be7788f241b Harsh Jain    2025-12-20  117  		ret = -ENOMEM;
ff0be7788f241b Harsh Jain    2025-12-20  118  		goto freemem;
ff0be7788f241b Harsh Jain    2025-12-20  119  	}
4d96f7d48131fe Kalyani Akula 2020-02-17  120  
4d96f7d48131fe Kalyani Akula 2020-02-17  121  	hwreq->src = dma_addr_data;
4d96f7d48131fe Kalyani Akula 2020-02-17  122  	hwreq->dst = dma_addr_data;
4d96f7d48131fe Kalyani Akula 2020-02-17  123  	hwreq->keysrc = tfm_ctx->keysrc;
4d96f7d48131fe Kalyani Akula 2020-02-17  124  	hwreq->op = rq_ctx->op;
4d96f7d48131fe Kalyani Akula 2020-02-17  125  
0e04c861048f99 Harsh Jain    2025-12-20  126  	if (hwreq->op == XILINX_AES_ENCRYPT)
4d96f7d48131fe Kalyani Akula 2020-02-17  127  		hwreq->size = data_size;
4d96f7d48131fe Kalyani Akula 2020-02-17  128  	else
0e04c861048f99 Harsh Jain    2025-12-20  129  		hwreq->size = data_size - XILINX_AES_AUTH_SIZE;
4d96f7d48131fe Kalyani Akula 2020-02-17  130  
ff0be7788f241b Harsh Jain    2025-12-20  131  	if (hwreq->keysrc == ZYNQMP_AES_KUP_KEY)
ff0be7788f241b Harsh Jain    2025-12-20  132  		hwreq->key = tfm_ctx->key_dma_addr;
ff0be7788f241b Harsh Jain    2025-12-20  133  	else
4d96f7d48131fe Kalyani Akula 2020-02-17  134  		hwreq->key = 0;
4d96f7d48131fe Kalyani Akula 2020-02-17  135  
ff0be7788f241b Harsh Jain    2025-12-20  136  	dma_addr_hw_req = dma_map_single(dev, dmabuf, sizeof(struct zynqmp_aead_hw_req) +
ff0be7788f241b Harsh Jain    2025-12-20  137  					 GCM_AES_IV_SIZE,
ff0be7788f241b Harsh Jain    2025-12-20  138  					 DMA_TO_DEVICE);
ff0be7788f241b Harsh Jain    2025-12-20  139  	if (unlikely(dma_mapping_error(dev, dma_addr_hw_req))) {
ff0be7788f241b Harsh Jain    2025-12-20  140  		ret = -ENOMEM;
ff0be7788f241b Harsh Jain    2025-12-20  141  		dma_unmap_single(dev, dma_addr_data, dma_size, DMA_BIDIRECTIONAL);
ff0be7788f241b Harsh Jain    2025-12-20  142  		goto freemem;
ff0be7788f241b Harsh Jain    2025-12-20  143  	}
ff0be7788f241b Harsh Jain    2025-12-20  144  	hwreq->iv = dma_addr_hw_req + sizeof(struct zynqmp_aead_hw_req);
ff0be7788f241b Harsh Jain    2025-12-20  145  	dma_sync_single_for_device(dev, dma_addr_hw_req, sizeof(struct zynqmp_aead_hw_req) +
ff0be7788f241b Harsh Jain    2025-12-20  146  				   GCM_AES_IV_SIZE, DMA_TO_DEVICE);
1d9000262b3b80 Rajan Vaja    2020-05-01  147  	ret = zynqmp_pm_aes_engine(dma_addr_hw_req, &status);
ff0be7788f241b Harsh Jain    2025-12-20  148  	dma_unmap_single(dev, dma_addr_hw_req, sizeof(struct zynqmp_aead_hw_req) + GCM_AES_IV_SIZE,
ff0be7788f241b Harsh Jain    2025-12-20  149  			 DMA_TO_DEVICE);
ff0be7788f241b Harsh Jain    2025-12-20  150  	dma_unmap_single(dev, dma_addr_data, dma_size, DMA_BIDIRECTIONAL);
1d9000262b3b80 Rajan Vaja    2020-05-01  151  	if (ret) {
1d9000262b3b80 Rajan Vaja    2020-05-01  152  		dev_err(dev, "ERROR: AES PM API failed\n");
1d9000262b3b80 Rajan Vaja    2020-05-01  153  	} else if (status) {
4d96f7d48131fe Kalyani Akula 2020-02-17  154  		switch (status) {
4d96f7d48131fe Kalyani Akula 2020-02-17  155  		case ZYNQMP_AES_GCM_TAG_MISMATCH_ERR:
d7bce7dee0b780 Harsh Jain    2025-12-20  156  			ret = -EBADMSG;
4d96f7d48131fe Kalyani Akula 2020-02-17  157  			break;
4d96f7d48131fe Kalyani Akula 2020-02-17  158  		case ZYNQMP_AES_WRONG_KEY_SRC_ERR:
d7bce7dee0b780 Harsh Jain    2025-12-20  159  			ret = -EINVAL;
4d96f7d48131fe Kalyani Akula 2020-02-17  160  			dev_err(dev, "ERROR: Wrong KeySrc, enable secure mode\n");
4d96f7d48131fe Kalyani Akula 2020-02-17  161  			break;
4d96f7d48131fe Kalyani Akula 2020-02-17  162  		case ZYNQMP_AES_PUF_NOT_PROGRAMMED:
d7bce7dee0b780 Harsh Jain    2025-12-20  163  			ret = -EINVAL;
4d96f7d48131fe Kalyani Akula 2020-02-17  164  			dev_err(dev, "ERROR: PUF is not registered\n");
4d96f7d48131fe Kalyani Akula 2020-02-17  165  			break;
4d96f7d48131fe Kalyani Akula 2020-02-17  166  		default:
d7bce7dee0b780 Harsh Jain    2025-12-20  167  			ret = -EINVAL;
4d96f7d48131fe Kalyani Akula 2020-02-17  168  			break;
4d96f7d48131fe Kalyani Akula 2020-02-17  169  		}
4d96f7d48131fe Kalyani Akula 2020-02-17  170  	} else {
0e04c861048f99 Harsh Jain    2025-12-20  171  		if (hwreq->op == XILINX_AES_ENCRYPT)
d4e5d89967c90e Harsh Jain    2025-12-20  172  			data_size = data_size + crypto_aead_authsize(aead);
4d96f7d48131fe Kalyani Akula 2020-02-17  173  		else
0e04c861048f99 Harsh Jain    2025-12-20  174  			data_size = data_size - XILINX_AES_AUTH_SIZE;
4d96f7d48131fe Kalyani Akula 2020-02-17  175  
4d96f7d48131fe Kalyani Akula 2020-02-17  176  		sg_copy_from_buffer(req->dst, sg_nents(req->dst),
4d96f7d48131fe Kalyani Akula 2020-02-17  177  				    kbuf, data_size);
d7bce7dee0b780 Harsh Jain    2025-12-20  178  		ret = 0;
4d96f7d48131fe Kalyani Akula 2020-02-17  179  	}
4d96f7d48131fe Kalyani Akula 2020-02-17  180  
ff0be7788f241b Harsh Jain    2025-12-20  181  freemem:
4d96f7d48131fe Kalyani Akula 2020-02-17 @182  	memzero_explicit(kbuf, dma_size);
ff0be7788f241b Harsh Jain    2025-12-20 @183  	kfree(kbuf);
ff0be7788f241b Harsh Jain    2025-12-20  184  	memzero_explicit(dmabuf, sizeof(struct zynqmp_aead_hw_req) + GCM_AES_IV_SIZE);
ff0be7788f241b Harsh Jain    2025-12-20  185  	kfree(dmabuf);
d7bce7dee0b780 Harsh Jain    2025-12-20  186  
d7bce7dee0b780 Harsh Jain    2025-12-20  187  	return ret;
4d96f7d48131fe Kalyani Akula 2020-02-17  188  }
4d96f7d48131fe Kalyani Akula 2020-02-17  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
