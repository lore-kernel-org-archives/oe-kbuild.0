Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC58469
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Nov 2022 19:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668452443; x=1699988443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QuAMv2pSqeiNFvfJuC9En/AhqNj/XBULVY1aRnVLH4=;
  b=NH3EMi3od4cyhtwc4lEUraaKdalxEgwOPiXTjnHZ9RW/o5E48rbbZn9E
   v2l39BLkWF9RDWCf5IvLgOUqYC0Wu/j1qHiTHONWbOJZzBS+nO53Hy91L
   sEPuVvFJX2KbHttzS84CxnsJ1vEv3AcfyTgsaUSya7EvLe2leKDniImp9
   kBwhCs2KlpQAVP3CzlY4FnvT5dzxov3HV3wUgILkbfFX1i9V+lbrpbLik
   axlc38llqSXX1HPalvya3Y4IlFnGY64kF3cO5t7bndlft8aUgnIfyN0GP
   AuwnFIHuijrli5gQy+lojffvXyhSuugpYDAK0tihcCv/3EYSggfaXBXXs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="295416548"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="295416548"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 11:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="883653715"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="883653715"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Nov 2022 11:00:41 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ouehE-0000fn-2s;
	Mon, 14 Nov 2022 19:00:40 +0000
Date: Tue, 15 Nov 2022 03:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/ptp/ptp_ocp.c:1794:18: warning: Boolean result is used in
 bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Message-ID: <202211150222.OOOiJyZm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/ptp/ptp_ocp.c:1794:18: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: WANG Xuerui <git@xen0n.name>
CC: Jianmin Lv <lvjianmin@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   094226ad94f471a9f19e8f8e7140a09c2625abaa
commit: 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb LoongArch: Add PCI controller support
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/ptp/ptp_ocp.c:1794:18: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     if ((!!old_map ^ !!bp->pps_req_map) == 0)
                    ^
>> drivers/ptp/ptp_ocp.c:1033:4: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
      snprintf(buf, sizeof(buf), "OUT: GEN%d", chan);
      ^
>> drivers/ptp/ptp_ocp.c:2060:16: warning: Signed integer overflow for expression '0xffff<<(16-shift)'. [integerOverflow]
    mask = 0xffff << (16 - shift);
                  ^
   drivers/ptp/ptp_ocp.c:2058:21: note: Assignment 'shift=sma_nr&1?0:16', assigned value is 0
    shift = sma_nr & 1 ? 0 : 16;
                       ^
   drivers/ptp/ptp_ocp.c:2060:16: note: Integer overflow
    mask = 0xffff << (16 - shift);
                  ^
   drivers/ptp/ptp_ocp.c:2086:16: warning: Signed integer overflow for expression '0xffff<<(16-shift)'. [integerOverflow]
    mask = 0xffff << (16 - shift);
                  ^
   drivers/ptp/ptp_ocp.c:2084:21: note: Assignment 'shift=sma_nr&1?0:16', assigned value is 0
    shift = sma_nr & 1 ? 0 : 16;
                       ^
   drivers/ptp/ptp_ocp.c:2086:16: note: Integer overflow
    mask = 0xffff << (16 - shift);
                  ^

vim +1794 drivers/ptp/ptp_ocp.c

773bda96492153 Jonathan Lemon 2021-08-03  1777  
773bda96492153 Jonathan Lemon 2021-08-03  1778  static int
a62a56d04e63cf Jonathan Lemon 2021-09-14  1779  ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
773bda96492153 Jonathan Lemon 2021-08-03  1780  {
773bda96492153 Jonathan Lemon 2021-08-03  1781  	struct ptp_ocp_ext_src *ext = priv;
773bda96492153 Jonathan Lemon 2021-08-03  1782  	struct ts_reg __iomem *reg = ext->mem;
a62a56d04e63cf Jonathan Lemon 2021-09-14  1783  	struct ptp_ocp *bp = ext->bp;
a62a56d04e63cf Jonathan Lemon 2021-09-14  1784  
a62a56d04e63cf Jonathan Lemon 2021-09-14  1785  	if (ext == bp->pps) {
a62a56d04e63cf Jonathan Lemon 2021-09-14  1786  		u32 old_map = bp->pps_req_map;
a62a56d04e63cf Jonathan Lemon 2021-09-14  1787  
a62a56d04e63cf Jonathan Lemon 2021-09-14  1788  		if (enable)
a62a56d04e63cf Jonathan Lemon 2021-09-14  1789  			bp->pps_req_map |= req;
a62a56d04e63cf Jonathan Lemon 2021-09-14  1790  		else
a62a56d04e63cf Jonathan Lemon 2021-09-14  1791  			bp->pps_req_map &= ~req;
a62a56d04e63cf Jonathan Lemon 2021-09-14  1792  
a62a56d04e63cf Jonathan Lemon 2021-09-14  1793  		/* if no state change, just return */
a62a56d04e63cf Jonathan Lemon 2021-09-14 @1794  		if ((!!old_map ^ !!bp->pps_req_map) == 0)
a62a56d04e63cf Jonathan Lemon 2021-09-14  1795  			return 0;
a62a56d04e63cf Jonathan Lemon 2021-09-14  1796  	}
773bda96492153 Jonathan Lemon 2021-08-03  1797  
773bda96492153 Jonathan Lemon 2021-08-03  1798  	if (enable) {
773bda96492153 Jonathan Lemon 2021-08-03  1799  		iowrite32(1, &reg->enable);
773bda96492153 Jonathan Lemon 2021-08-03  1800  		iowrite32(1, &reg->intr_mask);
773bda96492153 Jonathan Lemon 2021-08-03  1801  		iowrite32(1, &reg->intr);
773bda96492153 Jonathan Lemon 2021-08-03  1802  	} else {
773bda96492153 Jonathan Lemon 2021-08-03  1803  		iowrite32(0, &reg->intr_mask);
773bda96492153 Jonathan Lemon 2021-08-03  1804  		iowrite32(0, &reg->enable);
773bda96492153 Jonathan Lemon 2021-08-03  1805  	}
773bda96492153 Jonathan Lemon 2021-08-03  1806  
773bda96492153 Jonathan Lemon 2021-08-03  1807  	return 0;
773bda96492153 Jonathan Lemon 2021-08-03  1808  }
773bda96492153 Jonathan Lemon 2021-08-03  1809  

:::::: The code at line 1794 was first introduced by commit
:::::: a62a56d04e63cf0ececb5dd339811f0a14b7e77c ptp: ocp: Enable 4th timestamper / PPS generator

:::::: TO: Jonathan Lemon <jonathan.lemon@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
