Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250981BDC9
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gE5L+MBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702996738; x=1734532738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xphCviCgb5Gd2Ka3eDubnzqF3iUeej/EUWLg8RJXYd0=;
  b=gE5L+MBkVys1BV2sA3DDvyLYobU5j8XZ9EsdFWhJFA4Eyauf9U8PtKHh
   LkALAI5PwBihRKoVn1EldAn9UmoOyN8W6QZYoXM/YHkRgcZiiqiJBBX0Z
   0iFnigtJu/+xVvUBAJ3UVBOB7lXrIEvYgiuVAl4TBAwpxJK4nmNyyGmdp
   eq4QyoY8OFGQFU0ZlyuZRvxiLUUVlHyX7kAGislrmABEw+au5un3ic9Qq
   9B5CW65dUIwu7tlwTNVK14Du62PUjoIDgniTxLqnRI+XY5CB9hsRvhnPg
   MpeYqfnbfafhe1y26GS6uIE16sGizNE1r8uRLOvd7tVM1+66vu8byDx3S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="380650303"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="380650303"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:38:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="17898078"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Dec 2023 06:38:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFbFD-0005Sy-1o;
	Tue, 19 Dec 2023 14:38:51 +0000
Date: Tue, 19 Dec 2023 22:38:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath11k/fw.c:91
 ath11k_fw_request_firmware_api_n() warn: we never enter this loop
Message-ID: <202312192211.B9fDK6Q0-lkp@intel.com>
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
TO: Anilkumar Kolli <quic_akolli@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>
CC: P Praneesh <quic_ppranees@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf4f94d8e8646803f8fb0facf134b0cd7fb691a
commit: 7db88b962f06a52af5e9a32971012e8f3427cec0 wifi: ath11k: add firmware-2.bin support
date:   8 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-161-20231114 (https://download.01.org/0day-ci/archive/20231219/202312192211.B9fDK6Q0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312192211.B9fDK6Q0-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath11k/fw.c:91 ath11k_fw_request_firmware_api_n() warn: we never enter this loop

vim +91 drivers/net/wireless/ath/ath11k/fw.c

7db88b962f06a5 Anilkumar Kolli 2023-10-18    9  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   10  static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
7db88b962f06a5 Anilkumar Kolli 2023-10-18   11  					    const char *name)
7db88b962f06a5 Anilkumar Kolli 2023-10-18   12  {
7db88b962f06a5 Anilkumar Kolli 2023-10-18   13  	size_t magic_len, len, ie_len;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   14  	int ie_id, i, index, bit, ret;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   15  	struct ath11k_fw_ie *hdr;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   16  	const u8 *data;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   17  	__le32 *timestamp;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   18  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   19  	ab->fw.fw = ath11k_core_firmware_request(ab, name);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   20  	if (IS_ERR(ab->fw.fw)) {
7db88b962f06a5 Anilkumar Kolli 2023-10-18   21  		ret = PTR_ERR(ab->fw.fw);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   22  		ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   23  		ab->fw.fw = NULL;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   24  		return ret;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   25  	}
7db88b962f06a5 Anilkumar Kolli 2023-10-18   26  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   27  	data = ab->fw.fw->data;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   28  	len = ab->fw.fw->size;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   29  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   30  	/* magic also includes the null byte, check that as well */
7db88b962f06a5 Anilkumar Kolli 2023-10-18   31  	magic_len = strlen(ATH11K_FIRMWARE_MAGIC) + 1;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   32  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   33  	if (len < magic_len) {
7db88b962f06a5 Anilkumar Kolli 2023-10-18   34  		ath11k_err(ab, "firmware image too small to contain magic: %zu\n",
7db88b962f06a5 Anilkumar Kolli 2023-10-18   35  			   len);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   36  		ret = -EINVAL;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   37  		goto err;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   38  	}
7db88b962f06a5 Anilkumar Kolli 2023-10-18   39  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   40  	if (memcmp(data, ATH11K_FIRMWARE_MAGIC, magic_len) != 0) {
7db88b962f06a5 Anilkumar Kolli 2023-10-18   41  		ath11k_err(ab, "Invalid firmware magic\n");
7db88b962f06a5 Anilkumar Kolli 2023-10-18   42  		ret = -EINVAL;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   43  		goto err;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   44  	}
7db88b962f06a5 Anilkumar Kolli 2023-10-18   45  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   46  	/* jump over the padding */
7db88b962f06a5 Anilkumar Kolli 2023-10-18   47  	magic_len = ALIGN(magic_len, 4);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   48  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   49  	/* make sure there's space for padding */
7db88b962f06a5 Anilkumar Kolli 2023-10-18   50  	if (magic_len > len) {
7db88b962f06a5 Anilkumar Kolli 2023-10-18   51  		ath11k_err(ab, "No space for padding after magic\n");
7db88b962f06a5 Anilkumar Kolli 2023-10-18   52  		ret = -EINVAL;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   53  		goto err;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   54  	}
7db88b962f06a5 Anilkumar Kolli 2023-10-18   55  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   56  	len -= magic_len;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   57  	data += magic_len;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   58  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   59  	/* loop elements */
7db88b962f06a5 Anilkumar Kolli 2023-10-18   60  	while (len > sizeof(struct ath11k_fw_ie)) {
7db88b962f06a5 Anilkumar Kolli 2023-10-18   61  		hdr = (struct ath11k_fw_ie *)data;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   62  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   63  		ie_id = le32_to_cpu(hdr->id);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   64  		ie_len = le32_to_cpu(hdr->len);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   65  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   66  		len -= sizeof(*hdr);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   67  		data += sizeof(*hdr);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   68  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   69  		if (len < ie_len) {
7db88b962f06a5 Anilkumar Kolli 2023-10-18   70  			ath11k_err(ab, "Invalid length for FW IE %d (%zu < %zu)\n",
7db88b962f06a5 Anilkumar Kolli 2023-10-18   71  				   ie_id, len, ie_len);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   72  			ret = -EINVAL;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   73  			goto err;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   74  		}
7db88b962f06a5 Anilkumar Kolli 2023-10-18   75  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   76  		switch (ie_id) {
7db88b962f06a5 Anilkumar Kolli 2023-10-18   77  		case ATH11K_FW_IE_TIMESTAMP:
7db88b962f06a5 Anilkumar Kolli 2023-10-18   78  			if (ie_len != sizeof(u32))
7db88b962f06a5 Anilkumar Kolli 2023-10-18   79  				break;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   80  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   81  			timestamp = (__le32 *)data;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   82  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   83  			ath11k_dbg(ab, ATH11K_DBG_BOOT, "found fw timestamp %d\n",
7db88b962f06a5 Anilkumar Kolli 2023-10-18   84  				   le32_to_cpup(timestamp));
7db88b962f06a5 Anilkumar Kolli 2023-10-18   85  			break;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   86  		case ATH11K_FW_IE_FEATURES:
7db88b962f06a5 Anilkumar Kolli 2023-10-18   87  			ath11k_dbg(ab, ATH11K_DBG_BOOT,
7db88b962f06a5 Anilkumar Kolli 2023-10-18   88  				   "found firmware features ie (%zd B)\n",
7db88b962f06a5 Anilkumar Kolli 2023-10-18   89  				   ie_len);
7db88b962f06a5 Anilkumar Kolli 2023-10-18   90  
7db88b962f06a5 Anilkumar Kolli 2023-10-18  @91  			for (i = 0; i < ATH11K_FW_FEATURE_COUNT; i++) {
7db88b962f06a5 Anilkumar Kolli 2023-10-18   92  				index = i / 8;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   93  				bit = i % 8;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   94  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   95  				if (index == ie_len)
7db88b962f06a5 Anilkumar Kolli 2023-10-18   96  					break;
7db88b962f06a5 Anilkumar Kolli 2023-10-18   97  
7db88b962f06a5 Anilkumar Kolli 2023-10-18   98  				if (data[index] & (1 << bit))
7db88b962f06a5 Anilkumar Kolli 2023-10-18   99  					__set_bit(i, ab->fw.fw_features);
7db88b962f06a5 Anilkumar Kolli 2023-10-18  100  			}
7db88b962f06a5 Anilkumar Kolli 2023-10-18  101  
7db88b962f06a5 Anilkumar Kolli 2023-10-18  102  			ath11k_dbg_dump(ab, ATH11K_DBG_BOOT, "features", "",
7db88b962f06a5 Anilkumar Kolli 2023-10-18  103  					ab->fw.fw_features,
7db88b962f06a5 Anilkumar Kolli 2023-10-18  104  					sizeof(ab->fw.fw_features));
7db88b962f06a5 Anilkumar Kolli 2023-10-18  105  			break;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  106  		case ATH11K_FW_IE_AMSS_IMAGE:
7db88b962f06a5 Anilkumar Kolli 2023-10-18  107  			ath11k_dbg(ab, ATH11K_DBG_BOOT,
7db88b962f06a5 Anilkumar Kolli 2023-10-18  108  				   "found fw image ie (%zd B)\n",
7db88b962f06a5 Anilkumar Kolli 2023-10-18  109  				   ie_len);
7db88b962f06a5 Anilkumar Kolli 2023-10-18  110  
7db88b962f06a5 Anilkumar Kolli 2023-10-18  111  			ab->fw.amss_data = data;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  112  			ab->fw.amss_len = ie_len;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  113  			break;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  114  		case ATH11K_FW_IE_M3_IMAGE:
7db88b962f06a5 Anilkumar Kolli 2023-10-18  115  			ath11k_dbg(ab, ATH11K_DBG_BOOT,
7db88b962f06a5 Anilkumar Kolli 2023-10-18  116  				   "found m3 image ie (%zd B)\n",
7db88b962f06a5 Anilkumar Kolli 2023-10-18  117  				   ie_len);
7db88b962f06a5 Anilkumar Kolli 2023-10-18  118  
7db88b962f06a5 Anilkumar Kolli 2023-10-18  119  			ab->fw.m3_data = data;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  120  			ab->fw.m3_len = ie_len;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  121  			break;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  122  		default:
7db88b962f06a5 Anilkumar Kolli 2023-10-18  123  			ath11k_warn(ab, "Unknown FW IE: %u\n", ie_id);
7db88b962f06a5 Anilkumar Kolli 2023-10-18  124  			break;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  125  		}
7db88b962f06a5 Anilkumar Kolli 2023-10-18  126  
7db88b962f06a5 Anilkumar Kolli 2023-10-18  127  		/* jump over the padding */
7db88b962f06a5 Anilkumar Kolli 2023-10-18  128  		ie_len = ALIGN(ie_len, 4);
7db88b962f06a5 Anilkumar Kolli 2023-10-18  129  
7db88b962f06a5 Anilkumar Kolli 2023-10-18  130  		/* make sure there's space for padding */
7db88b962f06a5 Anilkumar Kolli 2023-10-18  131  		if (ie_len > len)
7db88b962f06a5 Anilkumar Kolli 2023-10-18  132  			break;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  133  
7db88b962f06a5 Anilkumar Kolli 2023-10-18  134  		len -= ie_len;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  135  		data += ie_len;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  136  	};
7db88b962f06a5 Anilkumar Kolli 2023-10-18  137  
7db88b962f06a5 Anilkumar Kolli 2023-10-18  138  	return 0;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  139  
7db88b962f06a5 Anilkumar Kolli 2023-10-18  140  err:
7db88b962f06a5 Anilkumar Kolli 2023-10-18  141  	release_firmware(ab->fw.fw);
7db88b962f06a5 Anilkumar Kolli 2023-10-18  142  	ab->fw.fw = NULL;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  143  	return ret;
7db88b962f06a5 Anilkumar Kolli 2023-10-18  144  }
7db88b962f06a5 Anilkumar Kolli 2023-10-18  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
