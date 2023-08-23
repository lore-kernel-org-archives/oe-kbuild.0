Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D59D15BC
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Aug 2023 03:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692760863; x=1724296863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gj+DdLrd+U2SOZkM6gbET7ykXxrGOsYNxdSjWbFXjeM=;
  b=f2kXG92PYRfm3FZju+LhiKfP9zddikruJ4ym9vyw5S7x9wH3dg3Tie6t
   SoMZsjPUfO4lRN7T59pP8wylFHNL4seSu8qwwAwagVJXhkLnIiXBuTwhf
   hONH4dC4W1b3QXwzdFfoqCBNMMinxquVbIhRx/UsxxgJROhBioxnMBHH7
   NyXe9rE7Kk4tsnu48hc/NQE+aclzUUPFAlai+QqcgaaMnNvl/uwGK4+VO
   a6uhiDs/qhPxLUkwU+3H1uMvbUHoAJxsr1zOVshAZ+t9cYeWMRHtxPjjN
   ygBOULZd5swNBx1TN0bs0yOZvjvhmdOB+hYfOi9eEFBntTJDwX5mBtGe5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460413665"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="460413665"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 20:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="801926319"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="801926319"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 20:20:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYeOw-0000nw-29;
	Wed, 23 Aug 2023 03:20:18 +0000
Date: Wed, 23 Aug 2023 11:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:tpm_buf 24/25] drivers/char/tpm/tpm-buf.c:159
 tpm_buf_read_u8() error: uninitialized symbol 'value'.
Message-ID: <202308231156.pq8W9dY1-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm_buf
head:   a1d8288229c7c1acfe0b2acf8107eaad8f49e070
commit: 9976c4e1af56380aaa5ac3eb3b717176d70bd2b3 [24/25] tpm: Add tpm_buf_read_{u8,u16,u32}
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-161-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231156.pq8W9dY1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231156.pq8W9dY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308231156.pq8W9dY1-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm-buf.c:159 tpm_buf_read_u8() error: uninitialized symbol 'value'.
drivers/char/tpm/tpm-buf.c:176 tpm_buf_read_u16() error: uninitialized symbol 'value'.
drivers/char/tpm/tpm-buf.c:193 tpm_buf_read_u32() error: uninitialized symbol 'value'.

vim +/value +159 drivers/char/tpm/tpm-buf.c

9976c4e1af5638 Jarkko Sakkinen 2023-08-22  145  
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  146  /**
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  147   * tpm_buf_read_u8() - Read 8-bit word from a TPM buffer
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  148   * @buf:	&tpm_buf instance
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  149   * @offset:	offset within the buffer
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  150   *
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  151   * Return: next 8-bit word
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  152   */
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  153  u8 tpm_buf_read_u8(const struct tpm_buf *buf, off_t *offset)
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  154  {
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  155  	u8 value;
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  156  
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  157  	tpm_buf_read(buf, offset, sizeof(value), &value);
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  158  
9976c4e1af5638 Jarkko Sakkinen 2023-08-22 @159  	return value;
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  160  }
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  161  EXPORT_SYMBOL_GPL(tpm_buf_read_u8);
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  162  
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  163  /**
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  164   * tpm_buf_read_u16() - Read 16-bit word from a TPM buffer
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  165   * @buf:	&tpm_buf instance
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  166   * @offset:	offset within the buffer
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  167   *
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  168   * Return: next 16-bit word
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  169   */
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  170  u16 tpm_buf_read_u16(const struct tpm_buf *buf, off_t *offset)
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  171  {
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  172  	u16 value;
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  173  
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  174  	tpm_buf_read(buf, offset, sizeof(value), &value);
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  175  
9976c4e1af5638 Jarkko Sakkinen 2023-08-22 @176  	return be16_to_cpu(value);
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  177  }
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  178  EXPORT_SYMBOL_GPL(tpm_buf_read_u16);
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  179  
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  180  /**
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  181   * tpm_buf_read_u32() - Read 32-bit word from a TPM buffer
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  182   * @buf:	&tpm_buf instance
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  183   * @offset:	offset within the buffer
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  184   *
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  185   * Return: next 32-bit word
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  186   */
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  187  u32 tpm_buf_read_u32(const struct tpm_buf *buf, off_t *offset)
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  188  {
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  189  	u32 value;
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  190  
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  191  	tpm_buf_read(buf, offset, sizeof(value), &value);
9976c4e1af5638 Jarkko Sakkinen 2023-08-22  192  
9976c4e1af5638 Jarkko Sakkinen 2023-08-22 @193  	return be32_to_cpu(value);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
