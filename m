Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A9529D28B
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764698326; cv=none; b=WDppUvnSRy/QFW25QH3fMH67dggATa+3c88uEDI3Qkz+sDxFLYHh1E2ZcnszylA23dexH6QsAtoJHH96nHSUaCM6yCDVWAxyQP9b7033OS98nKGEoyZkkckkyRAoZkKI4pN0Ram9Ib6lvn1IDgWHCEzLwXNxamwDXwENnLc98mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764698326; c=relaxed/simple;
	bh=a84kgl0VDQwW5SQSlWBEqaSlHKgyL2Ih0I8tYJXRs/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pu5FlCervftrXNVcctOTg9KmKuBA+bvhh0c9mzBmZyL/+uoLBmx4GiWHmpc/Yz6p+Yc3GaQPSbCdsnPRqJ3nQ40z5m+5cyakggFcOX981ph++UkEpv/ZQ9bspSY3kbgUXxiCJV6fqQQ5ViAWgswyzVZALQlEps+38oa2jFsIdsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4zpyfsb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4zpyfsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764698324; x=1796234324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a84kgl0VDQwW5SQSlWBEqaSlHKgyL2Ih0I8tYJXRs/s=;
  b=I4zpyfsbg63wQoyr/soSFr9/T+/RaGYb3ZH1M3Du6brmKTuUEwvm0yx2
   BD7AtgACuJ0b19+zJ6++kV3gMgKcBKukTTws5wTyxzAslDsrW3HX3x6lg
   OxXwFTXDY7W8C2O9xWrxgzqTVcfTDuJSNKJRHUkC9m+RKVv9tHc176Qa3
   EbBgyWH6rJU0qAZ9CZhYNfEx3qPaNLuEA5Ubx30oEVPRmPx8D8pTuNyrp
   L4NFrM0mvvx1qigIgZBT0oYVvNkQDKXU4wfPxP7J1kOyEC0R18HdXGXak
   +wo+T+g8O27NZ7Wpf5aPsu/sCYqj4i1NjvZeHfynAK/iRFXFDtCnw2kfd
   Q==;
X-CSE-ConnectionGUID: 4jE8LZQ6Qt6efj6KrbrbRQ==
X-CSE-MsgGUID: NctYp5GnQ3OYjLxApZAddw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66750410"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66750410"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 09:58:43 -0800
X-CSE-ConnectionGUID: B3g3GaAORz6o8LVZRHESbQ==
X-CSE-MsgGUID: l3qBMqvIRKSnF4TYhPIv8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="231782650"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 Dec 2025 09:58:43 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQUe3-000000002wf-2l6v;
	Tue, 02 Dec 2025 17:58:35 +0000
Date: Tue, 2 Dec 2025 18:58:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/tpm/tpm2-cmd.c:210:6: error: assigning to 'int' from
 incompatible type 'void'
Message-ID: <202512021827.04qmHc2z-lkp@intel.com>
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
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Jarkko-Sakkinen/tpm2-sessions-address-out-of-range-indexing/20251202-034236, commit: 991addbbc9ef9c912d1dce90bf0e8a9b83b1704e"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jarkko Sakkinen <jarkko@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm2-sessions-address-out-of-range-indexing/20251202-034236
head:   991addbbc9ef9c912d1dce90bf0e8a9b83b1704e
commit: 991addbbc9ef9c912d1dce90bf0e8a9b83b1704e tpm2-sessions: address out-of-range indexing
date:   22 hours ago
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021827.04qmHc2z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021827.04qmHc2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021827.04qmHc2z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm2-cmd.c:14:
   In file included from drivers/char/tpm/tpm.h:28:
   ./include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-cmd.c:210:6: error: assigning to 'int' from incompatible type 'void'
     210 |                 rc = tpm_buf_fill_hmac_session(chip, &buf);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm2-cmd.c:274:7: error: assigning to 'int' from incompatible type 'void'
     274 |                 err = tpm_buf_fill_hmac_session(chip, &buf);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +210 drivers/char/tpm/tpm2-cmd.c

7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  @14  #include "tpm.h"
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   15  #include <crypto/hash_info.h>
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   16  
27184f8905ba68 Jarkko Sakkinen 2024-11-13   17  static bool disable_pcr_integrity;
27184f8905ba68 Jarkko Sakkinen 2024-11-13   18  module_param(disable_pcr_integrity, bool, 0444);
27184f8905ba68 Jarkko Sakkinen 2024-11-13   19  MODULE_PARM_DESC(disable_pcr_integrity, "Disable integrity protection of TPM2_PCR_Extend");
27184f8905ba68 Jarkko Sakkinen 2024-11-13   20  
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   21  static struct tpm2_hash tpm2_hash_map[] = {
aa042475938f58 Roberto Sassu   2019-02-06   22  	{HASH_ALGO_SHA1, TPM_ALG_SHA1},
aa042475938f58 Roberto Sassu   2019-02-06   23  	{HASH_ALGO_SHA256, TPM_ALG_SHA256},
aa042475938f58 Roberto Sassu   2019-02-06   24  	{HASH_ALGO_SHA384, TPM_ALG_SHA384},
aa042475938f58 Roberto Sassu   2019-02-06   25  	{HASH_ALGO_SHA512, TPM_ALG_SHA512},
aa042475938f58 Roberto Sassu   2019-02-06   26  	{HASH_ALGO_SM3_256, TPM_ALG_SM3_256},
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   27  };
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   28  
70a3199a710142 Tomas Winkler   2018-10-19   29  int tpm2_get_timeouts(struct tpm_chip *chip)
70a3199a710142 Tomas Winkler   2018-10-19   30  {
70a3199a710142 Tomas Winkler   2018-10-19   31  	chip->timeout_a = msecs_to_jiffies(TPM2_TIMEOUT_A);
70a3199a710142 Tomas Winkler   2018-10-19   32  	chip->timeout_b = msecs_to_jiffies(TPM2_TIMEOUT_B);
70a3199a710142 Tomas Winkler   2018-10-19   33  	chip->timeout_c = msecs_to_jiffies(TPM2_TIMEOUT_C);
70a3199a710142 Tomas Winkler   2018-10-19   34  	chip->timeout_d = msecs_to_jiffies(TPM2_TIMEOUT_D);
70a3199a710142 Tomas Winkler   2018-10-19   35  	chip->flags |= TPM_CHIP_FLAG_HAVE_TIMEOUTS;
70a3199a710142 Tomas Winkler   2018-10-19   36  	return 0;
70a3199a710142 Tomas Winkler   2018-10-19   37  }
70a3199a710142 Tomas Winkler   2018-10-19   38  
207696b17f38e8 Jarkko Sakkinen 2025-09-18   39  /*
207696b17f38e8 Jarkko Sakkinen 2025-09-18   40   * Contains the maximum durations in milliseconds for TPM2 commands.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   41   */
207696b17f38e8 Jarkko Sakkinen 2025-09-18   42  static const struct {
207696b17f38e8 Jarkko Sakkinen 2025-09-18   43  	unsigned long ordinal;
207696b17f38e8 Jarkko Sakkinen 2025-09-18   44  	unsigned long duration;
207696b17f38e8 Jarkko Sakkinen 2025-09-18   45  } tpm2_ordinal_duration_map[] = {
207696b17f38e8 Jarkko Sakkinen 2025-09-18   46  	{TPM2_CC_STARTUP, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   47  	{TPM2_CC_SELF_TEST, 3000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   48  	{TPM2_CC_GET_RANDOM, 2000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   49  	{TPM2_CC_SEQUENCE_UPDATE, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   50  	{TPM2_CC_SEQUENCE_COMPLETE, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   51  	{TPM2_CC_EVENT_SEQUENCE_COMPLETE, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   52  	{TPM2_CC_HASH_SEQUENCE_START, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   53  	{TPM2_CC_VERIFY_SIGNATURE, 30000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   54  	{TPM2_CC_PCR_EXTEND, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   55  	{TPM2_CC_HIERARCHY_CONTROL, 2000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   56  	{TPM2_CC_HIERARCHY_CHANGE_AUTH, 2000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   57  	{TPM2_CC_GET_CAPABILITY, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   58  	{TPM2_CC_NV_READ, 2000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   59  	{TPM2_CC_CREATE_PRIMARY, 30000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   60  	{TPM2_CC_CREATE, 30000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   61  	{TPM2_CC_CREATE_LOADED, 30000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   62  };
899102bc451895 Tomas Winkler   2018-10-19   63  
899102bc451895 Tomas Winkler   2018-10-19   64  /**
207696b17f38e8 Jarkko Sakkinen 2025-09-18   65   * tpm2_calc_ordinal_duration() - Calculate the maximum command duration
899102bc451895 Tomas Winkler   2018-10-19   66   * @ordinal: TPM command ordinal.
899102bc451895 Tomas Winkler   2018-10-19   67   *
207696b17f38e8 Jarkko Sakkinen 2025-09-18   68   * Returns the maximum amount of time the chip is expected by kernel to
207696b17f38e8 Jarkko Sakkinen 2025-09-18   69   * take in jiffies.
899102bc451895 Tomas Winkler   2018-10-19   70   */
207696b17f38e8 Jarkko Sakkinen 2025-09-18   71  unsigned long tpm2_calc_ordinal_duration(u32 ordinal)
899102bc451895 Tomas Winkler   2018-10-19   72  {
207696b17f38e8 Jarkko Sakkinen 2025-09-18   73  	int i;
899102bc451895 Tomas Winkler   2018-10-19   74  
207696b17f38e8 Jarkko Sakkinen 2025-09-18   75  	for (i = 0; i < ARRAY_SIZE(tpm2_ordinal_duration_map); i++)
207696b17f38e8 Jarkko Sakkinen 2025-09-18   76  		if (ordinal == tpm2_ordinal_duration_map[i].ordinal)
207696b17f38e8 Jarkko Sakkinen 2025-09-18   77  			return msecs_to_jiffies(tpm2_ordinal_duration_map[i].duration);
899102bc451895 Tomas Winkler   2018-10-19   78  
899102bc451895 Tomas Winkler   2018-10-19   79  	return msecs_to_jiffies(TPM2_DURATION_DEFAULT);
899102bc451895 Tomas Winkler   2018-10-19   80  }
899102bc451895 Tomas Winkler   2018-10-19   81  
91f7f3d773a469 Roberto Sassu   2017-06-23   82  struct tpm2_pcr_read_out {
91f7f3d773a469 Roberto Sassu   2017-06-23   83  	__be32	update_cnt;
91f7f3d773a469 Roberto Sassu   2017-06-23   84  	__be32	pcr_selects_cnt;
91f7f3d773a469 Roberto Sassu   2017-06-23   85  	__be16	hash_alg;
91f7f3d773a469 Roberto Sassu   2017-06-23   86  	u8	pcr_select_size;
91f7f3d773a469 Roberto Sassu   2017-06-23   87  	u8	pcr_select[TPM2_PCR_SELECT_MIN];
91f7f3d773a469 Roberto Sassu   2017-06-23   88  	__be32	digests_cnt;
91f7f3d773a469 Roberto Sassu   2017-06-23   89  	__be16	digest_size;
91f7f3d773a469 Roberto Sassu   2017-06-23   90  	u8	digest[];
91f7f3d773a469 Roberto Sassu   2017-06-23   91  } __packed;
91f7f3d773a469 Roberto Sassu   2017-06-23   92  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   93  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   94   * tpm2_pcr_read() - read a PCR value
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   95   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   96   * @pcr_idx:	index of the PCR to read.
879b589210a9a0 Roberto Sassu   2019-02-06   97   * @digest:	PCR bank and buffer current PCR value is written to.
879b589210a9a0 Roberto Sassu   2019-02-06   98   * @digest_size_ptr:	pointer to variable that stores the digest size.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   99   *
794c6e109b5938 Winkler, Tomas  2016-11-23  100   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  101   */
879b589210a9a0 Roberto Sassu   2019-02-06  102  int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
879b589210a9a0 Roberto Sassu   2019-02-06  103  		  struct tpm_digest *digest, u16 *digest_size_ptr)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  104  {
879b589210a9a0 Roberto Sassu   2019-02-06  105  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  106  	int rc;
91f7f3d773a469 Roberto Sassu   2017-06-23  107  	struct tpm_buf buf;
91f7f3d773a469 Roberto Sassu   2017-06-23  108  	struct tpm2_pcr_read_out *out;
91f7f3d773a469 Roberto Sassu   2017-06-23  109  	u8 pcr_select[TPM2_PCR_SELECT_MIN] = {0};
879b589210a9a0 Roberto Sassu   2019-02-06  110  	u16 digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  111  	u16 expected_digest_size = 0;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  112  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  113  	if (pcr_idx >= TPM2_PLATFORM_PCR)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  114  		return -EINVAL;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  115  
879b589210a9a0 Roberto Sassu   2019-02-06  116  	if (!digest_size_ptr) {
879b589210a9a0 Roberto Sassu   2019-02-06  117  		for (i = 0; i < chip->nr_allocated_banks &&
879b589210a9a0 Roberto Sassu   2019-02-06  118  		     chip->allocated_banks[i].alg_id != digest->alg_id; i++)
879b589210a9a0 Roberto Sassu   2019-02-06  119  			;
879b589210a9a0 Roberto Sassu   2019-02-06  120  
879b589210a9a0 Roberto Sassu   2019-02-06  121  		if (i == chip->nr_allocated_banks)
879b589210a9a0 Roberto Sassu   2019-02-06  122  			return -EINVAL;
879b589210a9a0 Roberto Sassu   2019-02-06  123  
879b589210a9a0 Roberto Sassu   2019-02-06  124  		expected_digest_size = chip->allocated_banks[i].digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  125  	}
879b589210a9a0 Roberto Sassu   2019-02-06  126  
91f7f3d773a469 Roberto Sassu   2017-06-23  127  	rc = tpm_buf_init(&buf, TPM2_ST_NO_SESSIONS, TPM2_CC_PCR_READ);
91f7f3d773a469 Roberto Sassu   2017-06-23  128  	if (rc)
91f7f3d773a469 Roberto Sassu   2017-06-23  129  		return rc;
91f7f3d773a469 Roberto Sassu   2017-06-23  130  
91f7f3d773a469 Roberto Sassu   2017-06-23  131  	pcr_select[pcr_idx >> 3] = 1 << (pcr_idx & 0x7);
91f7f3d773a469 Roberto Sassu   2017-06-23  132  
91f7f3d773a469 Roberto Sassu   2017-06-23  133  	tpm_buf_append_u32(&buf, 1);
879b589210a9a0 Roberto Sassu   2019-02-06  134  	tpm_buf_append_u16(&buf, digest->alg_id);
91f7f3d773a469 Roberto Sassu   2017-06-23  135  	tpm_buf_append_u8(&buf, TPM2_PCR_SELECT_MIN);
91f7f3d773a469 Roberto Sassu   2017-06-23  136  	tpm_buf_append(&buf, (const unsigned char *)pcr_select,
91f7f3d773a469 Roberto Sassu   2017-06-23  137  		       sizeof(pcr_select));
91f7f3d773a469 Roberto Sassu   2017-06-23  138  
879b589210a9a0 Roberto Sassu   2019-02-06  139  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting to read a pcr value");
879b589210a9a0 Roberto Sassu   2019-02-06  140  	if (rc)
879b589210a9a0 Roberto Sassu   2019-02-06  141  		goto out;
879b589210a9a0 Roberto Sassu   2019-02-06  142  
91f7f3d773a469 Roberto Sassu   2017-06-23  143  	out = (struct tpm2_pcr_read_out *)&buf.data[TPM_HEADER_SIZE];
879b589210a9a0 Roberto Sassu   2019-02-06  144  	digest_size = be16_to_cpu(out->digest_size);
879b589210a9a0 Roberto Sassu   2019-02-06  145  	if (digest_size > sizeof(digest->digest) ||
879b589210a9a0 Roberto Sassu   2019-02-06  146  	    (!digest_size_ptr && digest_size != expected_digest_size)) {
879b589210a9a0 Roberto Sassu   2019-02-06  147  		rc = -EINVAL;
879b589210a9a0 Roberto Sassu   2019-02-06  148  		goto out;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  149  	}
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  150  
879b589210a9a0 Roberto Sassu   2019-02-06  151  	if (digest_size_ptr)
879b589210a9a0 Roberto Sassu   2019-02-06  152  		*digest_size_ptr = digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  153  
879b589210a9a0 Roberto Sassu   2019-02-06  154  	memcpy(digest->digest, out->digest, digest_size);
879b589210a9a0 Roberto Sassu   2019-02-06  155  out:
91f7f3d773a469 Roberto Sassu   2017-06-23  156  	tpm_buf_destroy(&buf);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  157  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  158  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  159  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  160  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  161   * tpm2_pcr_extend() - extend a PCR value
794c6e109b5938 Winkler, Tomas  2016-11-23  162   *
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  163   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  164   * @pcr_idx:	index of the PCR.
c1f92b4b04ad70 Nayna Jain      2017-01-30  165   * @digests:	list of pcr banks and corresponding digest values to extend.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  166   *
794c6e109b5938 Winkler, Tomas  2016-11-23  167   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  168   */
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  169  int tpm2_pcr_extend(struct tpm_chip *chip, u32 pcr_idx,
aa042475938f58 Roberto Sassu   2019-02-06  170  		    struct tpm_digest *digests)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  171  {
c1f92b4b04ad70 Nayna Jain      2017-01-30  172  	struct tpm_buf buf;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  173  	int rc;
c1f92b4b04ad70 Nayna Jain      2017-01-30  174  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  175  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  176  	if (!disable_pcr_integrity) {
6519fea6fd372b James Bottomley 2024-04-29  177  		rc = tpm2_start_auth_session(chip);
c1f92b4b04ad70 Nayna Jain      2017-01-30  178  		if (rc)
c1f92b4b04ad70 Nayna Jain      2017-01-30  179  			return rc;
27184f8905ba68 Jarkko Sakkinen 2024-11-13  180  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  181  
6519fea6fd372b James Bottomley 2024-04-29  182  	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_PCR_EXTEND);
6519fea6fd372b James Bottomley 2024-04-29  183  	if (rc) {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  184  		if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  185  			tpm2_end_auth_session(chip);
6519fea6fd372b James Bottomley 2024-04-29  186  		return rc;
6519fea6fd372b James Bottomley 2024-04-29  187  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  188  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  189  	if (!disable_pcr_integrity) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  190  		rc = tpm_buf_append_name(chip, &buf, pcr_idx, NULL);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  191  		if (rc) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  192  			tpm_buf_destroy(&buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  193  			return rc;
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  194  		}
6519fea6fd372b James Bottomley 2024-04-29  195  		tpm_buf_append_hmac_session(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  196  	} else {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  197  		tpm_buf_append_handle(chip, &buf, pcr_idx);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  198  		tpm_buf_append_auth(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  199  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  200  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  201  	tpm_buf_append_u32(&buf, chip->nr_allocated_banks);
c1f92b4b04ad70 Nayna Jain      2017-01-30  202  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  203  	for (i = 0; i < chip->nr_allocated_banks; i++) {
c1f92b4b04ad70 Nayna Jain      2017-01-30  204  		tpm_buf_append_u16(&buf, digests[i].alg_id);
879b589210a9a0 Roberto Sassu   2019-02-06  205  		tpm_buf_append(&buf, (const unsigned char *)&digests[i].digest,
879b589210a9a0 Roberto Sassu   2019-02-06  206  			       chip->allocated_banks[i].digest_size);
c1f92b4b04ad70 Nayna Jain      2017-01-30  207  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  208  
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  209  	if (!disable_pcr_integrity) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01 @210  		rc = tpm_buf_fill_hmac_session(chip, &buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  211  		if (rc) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  212  			tpm_buf_destroy(&buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  213  			return rc;
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  214  		}
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  215  	}
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  216  
47a6c28b6861b1 Jarkko Sakkinen 2018-11-05  217  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting extend a PCR value");
27184f8905ba68 Jarkko Sakkinen 2024-11-13  218  	if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  219  		rc = tpm_buf_check_hmac_response(chip, &buf, rc);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  220  
c1f92b4b04ad70 Nayna Jain      2017-01-30  221  	tpm_buf_destroy(&buf);
c1f92b4b04ad70 Nayna Jain      2017-01-30  222  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  223  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  224  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
