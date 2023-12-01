Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA948791
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4BHWTiE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701444256; x=1732980256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ueh3jnWchfQVJ/64Zl0eG9nQe0HfhJFsxOU7sHFXZUQ=;
  b=E4BHWTiEEhkbzQk3Ez49l2KYIiBA+GgPhHmt+m/vin+TjgFoFFUq/YjF
   uKVcPzyHKPZSiDDCepqpifs6C3NDxUbwZPBgsaIs8+0Q92MEf78W923ZY
   pq2o6VqQYR0CBlqMe5VOxeDb53fzopivgw00h76k31Hin6pcDWta+zIwa
   R4eEABXdt53kIrIqhcP89i+c9kC+7Es+TcZcHFxdrSFADeVj5I8V65m7D
   u9Gpj8fCNY7vxVapy1qYNFFGtBziBGf02aWusJagcazGAjqMGoehho8jO
   TfDCYPTaNqe1FvrFmPvqRg0R31iFRQa7ymKqO+avDnPoUFEMRd2BJ0jGU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="532065"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="532065"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="840220889"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="840220889"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2023 07:24:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r95NA-0003rY-1w;
	Fri, 01 Dec 2023 15:24:08 +0000
Date: Fri, 1 Dec 2023 23:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 04/35] blk-crypto: add a process bio callback
Message-ID: <202312012352.qjTdmkYN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <78be341377e7f0fb0ead3d5167be44ca0c87a944.1695750478.git.josef@toxicpanda.com>
References: <78be341377e7f0fb0ead3d5167be44ca0c87a944.1695750478.git.josef@toxicpanda.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: linux-btrfs@vger.kernel.org
TO: kernel-team@fb.com
TO: ebiggers@kernel.org
TO: linux-fscrypt@vger.kernel.org
TO: ngompa13@gmail.com

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[cannot apply to axboe-block/for-next linus/master v6.7-rc3 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/fscrypt-rename-fscrypt_info-fscrypt_inode_info/20230927-020531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/78be341377e7f0fb0ead3d5167be44ca0c87a944.1695750478.git.josef%40toxicpanda.com
patch subject: [PATCH 04/35] blk-crypto: add a process bio callback
:::::: branch date: 9 weeks ago
:::::: commit date: 9 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312012352.qjTdmkYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312012352.qjTdmkYN-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk-crypto.h: linux/blk_types.h is included more than once.

vim +9 include/linux/blk-crypto.h

     8	
   > 9	#include <linux/blk_types.h>
    10	
    11	enum blk_crypto_mode_num {
    12		BLK_ENCRYPTION_MODE_INVALID,
    13		BLK_ENCRYPTION_MODE_AES_256_XTS,
    14		BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV,
    15		BLK_ENCRYPTION_MODE_ADIANTUM,
    16		BLK_ENCRYPTION_MODE_SM4_XTS,
    17		BLK_ENCRYPTION_MODE_MAX,
    18	};
    19	
    20	typedef blk_status_t (blk_crypto_process_bio_t)(struct bio *orig_bio,
    21							struct bio *enc_bio);
    22	
    23	#define BLK_CRYPTO_MAX_KEY_SIZE		64
    24	/**
    25	 * struct blk_crypto_config - an inline encryption key's crypto configuration
    26	 * @crypto_mode: encryption algorithm this key is for
    27	 * @data_unit_size: the data unit size for all encryption/decryptions with this
    28	 *	key.  This is the size in bytes of each individual plaintext and
    29	 *	ciphertext.  This is always a power of 2.  It might be e.g. the
    30	 *	filesystem block size or the disk sector size.
    31	 * @dun_bytes: the maximum number of bytes of DUN used when using this key
    32	 */
    33	struct blk_crypto_config {
    34		enum blk_crypto_mode_num crypto_mode;
    35		unsigned int data_unit_size;
    36		unsigned int dun_bytes;
    37		blk_crypto_process_bio_t *process_bio;
    38	};
    39	
    40	/**
    41	 * struct blk_crypto_key - an inline encryption key
    42	 * @crypto_cfg: the crypto configuration (like crypto_mode, key size) for this
    43	 *		key
    44	 * @data_unit_size_bits: log2 of data_unit_size
    45	 * @size: size of this key in bytes (determined by @crypto_cfg.crypto_mode)
    46	 * @raw: the raw bytes of this key.  Only the first @size bytes are used.
    47	 *
    48	 * A blk_crypto_key is immutable once created, and many bios can reference it at
    49	 * the same time.  It must not be freed until all bios using it have completed
    50	 * and it has been evicted from all devices on which it may have been used.
    51	 */
    52	struct blk_crypto_key {
    53		struct blk_crypto_config crypto_cfg;
    54		unsigned int data_unit_size_bits;
    55		unsigned int size;
    56		u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
    57	};
    58	
    59	#define BLK_CRYPTO_MAX_IV_SIZE		32
    60	#define BLK_CRYPTO_DUN_ARRAY_SIZE	(BLK_CRYPTO_MAX_IV_SIZE / sizeof(u64))
    61	
    62	/**
    63	 * struct bio_crypt_ctx - an inline encryption context
    64	 * @bc_key: the key, algorithm, and data unit size to use
    65	 * @bc_dun: the data unit number (starting IV) to use
    66	 *
    67	 * A bio_crypt_ctx specifies that the contents of the bio will be encrypted (for
    68	 * write requests) or decrypted (for read requests) inline by the storage device
    69	 * or controller, or by the crypto API fallback.
    70	 */
    71	struct bio_crypt_ctx {
    72		const struct blk_crypto_key	*bc_key;
    73		u64				bc_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
    74	};
    75	
  > 76	#include <linux/blk_types.h>
    77	#include <linux/blkdev.h>
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
