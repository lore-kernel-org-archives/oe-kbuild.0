Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80307475
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Dec 2022 22:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670885799; x=1702421799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=034KezqQdVPtk2hMj3Hgo5EK1uido7PHD3RyPvU5qhc=;
  b=HNfxVK31pS3rE9iwVksypjuzKQL1xovnFvMdY7W9nqfaKSdT63YGXTA3
   yoPm0CWDHbkWw2r7SU9/TSaAjCeMqVF4z16WxsrZNf8RY0mLXLK8r5Ec8
   iIcz9aftvjqO3i+1ek5tTA4PoJPcRha66W85d8yWl24KhB1m/irJOzkNT
   eHdLpdQ9szP0L8C5CoTJNmQJ0unT7GYgTQSr4MyFWktZFIDakld9hs927
   UuI6gAClcoFOcEUE4+Fd82J2vaG8QXyv3Xj9HkuOdSVKY0CD4CUB6A27T
   5mbeQ8hf8wvFGpzjmeVCjrYpy8mOZD19oUZ/QyN6eok9LhBOKNq67Zec+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="404235918"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; 
   d="scan'208";a="404235918"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 14:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="650512261"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; 
   d="scan'208";a="650512261"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Dec 2022 14:56:38 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p4riv-0003x5-26;
	Mon, 12 Dec 2022 22:56:37 +0000
Date: Tue, 13 Dec 2022 06:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/hw_random/mpfs-rng.c:54:23: warning: Uninitialized
 variable: response_msg [uninitvar]
Message-ID: <202212130626.m7HgsWV9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/char/hw_random/mpfs-rng.c:54:23: warning: Uninitialized variable: response_msg [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ec5a38bf8499f403f81cb81a0e3a60887d1993c
commit: 716a757c83ad6208a743dd8fb1577055d0867ee8 hwrng: mpfs - add polarfire soc hwrng support
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 716a757c83ad6208a743dd8fb1577055d0867ee8
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/char/hw_random/mpfs-rng.c:54:23: warning: Uninitialized variable: response_msg [uninitvar]
     memcpy(buf + count, response_msg, copy_size_bytes);
                         ^
   drivers/char/hw_random/mpfs-rng.c:50:7: note: Assuming condition is false
     if (ret)
         ^
   drivers/char/hw_random/mpfs-rng.c:54:23: note: Uninitialized variable: response_msg
     memcpy(buf + count, response_msg, copy_size_bytes);
                         ^

vim +54 drivers/char/hw_random/mpfs-rng.c

716a757c83ad62 Conor Dooley 2022-04-08  26  
716a757c83ad62 Conor Dooley 2022-04-08  27  static int mpfs_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
716a757c83ad62 Conor Dooley 2022-04-08  28  {
716a757c83ad62 Conor Dooley 2022-04-08  29  	struct mpfs_rng *rng_priv = container_of(rng, struct mpfs_rng, rng);
716a757c83ad62 Conor Dooley 2022-04-08  30  	u32 response_msg[RNG_RESP_BYTES / sizeof(u32)];
716a757c83ad62 Conor Dooley 2022-04-08  31  	unsigned int count = 0, copy_size_bytes;
716a757c83ad62 Conor Dooley 2022-04-08  32  	int ret;
716a757c83ad62 Conor Dooley 2022-04-08  33  
716a757c83ad62 Conor Dooley 2022-04-08  34  	struct mpfs_mss_response response = {
716a757c83ad62 Conor Dooley 2022-04-08  35  		.resp_status = 0U,
716a757c83ad62 Conor Dooley 2022-04-08  36  		.resp_msg = (u32 *)response_msg,
716a757c83ad62 Conor Dooley 2022-04-08  37  		.resp_size = RNG_RESP_BYTES
716a757c83ad62 Conor Dooley 2022-04-08  38  	};
716a757c83ad62 Conor Dooley 2022-04-08  39  	struct mpfs_mss_msg msg = {
716a757c83ad62 Conor Dooley 2022-04-08  40  		.cmd_opcode = CMD_OPCODE,
716a757c83ad62 Conor Dooley 2022-04-08  41  		.cmd_data_size = CMD_DATA_SIZE,
716a757c83ad62 Conor Dooley 2022-04-08  42  		.response = &response,
716a757c83ad62 Conor Dooley 2022-04-08  43  		.cmd_data = CMD_DATA,
716a757c83ad62 Conor Dooley 2022-04-08  44  		.mbox_offset = MBOX_OFFSET,
716a757c83ad62 Conor Dooley 2022-04-08  45  		.resp_offset = RESP_OFFSET
716a757c83ad62 Conor Dooley 2022-04-08  46  	};
716a757c83ad62 Conor Dooley 2022-04-08  47  
716a757c83ad62 Conor Dooley 2022-04-08  48  	while (count < max) {
716a757c83ad62 Conor Dooley 2022-04-08  49  		ret = mpfs_blocking_transaction(rng_priv->sys_controller, &msg);
716a757c83ad62 Conor Dooley 2022-04-08  50  		if (ret)
716a757c83ad62 Conor Dooley 2022-04-08  51  			return ret;
716a757c83ad62 Conor Dooley 2022-04-08  52  
716a757c83ad62 Conor Dooley 2022-04-08  53  		copy_size_bytes = max - count > RNG_RESP_BYTES ? RNG_RESP_BYTES : max - count;
716a757c83ad62 Conor Dooley 2022-04-08 @54  		memcpy(buf + count, response_msg, copy_size_bytes);
716a757c83ad62 Conor Dooley 2022-04-08  55  
716a757c83ad62 Conor Dooley 2022-04-08  56  		count += copy_size_bytes;
716a757c83ad62 Conor Dooley 2022-04-08  57  		if (!wait)
716a757c83ad62 Conor Dooley 2022-04-08  58  			break;
716a757c83ad62 Conor Dooley 2022-04-08  59  	}
716a757c83ad62 Conor Dooley 2022-04-08  60  
716a757c83ad62 Conor Dooley 2022-04-08  61  	return count;
716a757c83ad62 Conor Dooley 2022-04-08  62  }
716a757c83ad62 Conor Dooley 2022-04-08  63  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
