Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6628EB
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Mar 2023 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679751785; x=1711287785;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l/NMitHy81wli4rANswFv4gAewwCaXj5c60rC2DqwLQ=;
  b=cuD5qXa6hColb3PuInH8BAFnEfimviuSUBor5KYiyT4vRQQIFXwZBHEj
   w6UEAG5nPhcdVWyQM7rC0yYYdQxxsGYafAo9Q6boy7bG7UXCA3usZ0MyQ
   wfcM8sFiP88B0asDP8cd/CpEFpqp6p/kuL3BHDyQ/S0Sglh3fMV+HJaXm
   Sq1Wzvp5SINQXe5YIudf+kYgfH8UIqAs3AwHxix0sdepKdbzHymIqyL+L
   3+lPNAgVEO0IWbOwrPzpsZEo+KmM2chfKuBdV4sfeyZVaS5TFQNwjkIEG
   9z10TQHuyp7Szu2VLHXosSINdQlOb1tAPD+ExZGQs9csKQAhn/0hy1ruy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="367704580"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="367704580"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 06:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="633139530"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="633139530"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Mar 2023 06:43:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pg4Ag-000GIN-2L;
	Sat, 25 Mar 2023 13:43:02 +0000
Date: Sat, 25 Mar 2023 21:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 623/6819]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:138:3: warning:
 Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303252105.g1PWFa26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:138:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hector Martin <marcan@marcan.st>
CC: Kalle Valo <kvalo@kernel.org>
CC: Arend van Spriel <arend.vanspriel@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5dbf24e8b9e6aa0a185d86ce46a7a9c79ebb40f
commit: dd7e55401fec58a2d03e5fdcb0c6d20e8fbe450a [623/6819] wifi: brcmfmac: common: Add support for downloading TxCap blobs
:::::: branch date: 33 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20230322 (https://download.01.org/0day-ci/archive/20230325/202303252105.g1PWFa26-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=dd7e55401fec58a2d03e5fdcb0c6d20e8fbe450a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout dd7e55401fec58a2d03e5fdcb0c6d20e8fbe450a
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303252105.g1PWFa26-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/spmi/spmi-pmic-arb.c:585:3: note: Assuming the condition is true
                   dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqchip transaction on %x\n",
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_ratelimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:207:2: note: expanded from macro 'dev_level_ratelimited'
           if (__ratelimit(&_rs))                                          \
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/spmi/spmi-pmic-arb.c:585:3: note: '?' condition is false
                   dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqchip transaction on %x\n",
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_ratelimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:207:2: note: expanded from macro 'dev_level_ratelimited'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   drivers/spmi/spmi-pmic-arb.c:585:3: note: Taking false branch
                   dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqchip transaction on %x\n",
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_ratelimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:207:2: note: expanded from macro 'dev_level_ratelimited'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/spmi/spmi-pmic-arb.c:585:3: note: Loop condition is false.  Exiting loop
                   dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqchip transaction on %x\n",
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_ratelimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:202:59: note: expanded from macro 'dev_level_ratelimited'
   #define dev_level_ratelimited(dev_level, dev, fmt, ...)                 \
                                                                           ^
   drivers/spmi/spmi-pmic-arb.c:587:1: note: Returning without writing to '*buf'
   }
   ^
   drivers/spmi/spmi-pmic-arb.c:747:2: note: Returning from 'qpnpint_spmi_read'
           qpnpint_spmi_read(d, QPNPINT_REG_EN_SET, &buf[0], 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spmi/spmi-pmic-arb.c:748:15: note: The left operand of '&' is a garbage value
           if (!(buf[0] & BIT(irq))) {
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c:271:4: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err = 0;
                           ^     ~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c:271:4: note: Value stored to 'err' is never read
                           err = 0;
                           ^     ~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:138:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = -ENOMEM;
                   ^     ~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:138:3: note: Value stored to 'err' is never read
                   err = -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:212:12: warning: Potential memory leak [clang-analyzer-unix.Malloc]
           nvp->data = data;
                     ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:549:2: note: Loop condition is false.  Exiting loop
           brcmf_dbg(TRACE, "enter: dev=%s\n", dev_name(fwctx->dev));
           ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.h:74:39: note: expanded from macro 'brcmf_dbg'
   #define brcmf_dbg(level, fmt, ...)                              \
                                                                   ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:553:6: note: Assuming 'fw' is non-null
           if (fw && fw->data) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:553:6: note: Left side of '&&' is true
           if (fw && fw->data) {
               ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:553:2: note: Assuming the condition is false
           if (fw && fw->data) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:553:2: note: '?' condition is false
           if (fw && fw->data) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:553:6: note: 'fw' is non-null
           if (fw && fw->data) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:553:6: note: Left side of '&&' is true
           if (fw && fw->data) {
               ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:553:2: note: '?' condition is true
           if (fw && fw->data) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:553:2: note: Taking true branch
           if (fw && fw->data) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:565:6: note: 'data' is non-null
           if (data)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:565:2: note: '?' condition is false
           if (data)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))

vim +/err +138 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c

fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  119  
dd7e55401fec58 Hector Martin       2023-02-14  120  static int brcmf_c_download_blob(struct brcmf_if *ifp,
dd7e55401fec58 Hector Martin       2023-02-14  121  				 const void *data, size_t size,
dd7e55401fec58 Hector Martin       2023-02-14  122  				 const char *loadvar, const char *statvar)
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  123  {
dcb1471bc6d054 Rafał Miłecki       2019-02-19  124  	struct brcmf_pub *drvr = ifp->drvr;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  125  	struct brcmf_dload_data_le *chunk_buf;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  126  	u32 chunk_len;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  127  	u32 datalen;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  128  	u32 cumulative_len;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  129  	u16 dl_flag = DL_BEGIN;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  130  	u32 status;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  131  	s32 err;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  132  
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  133  	brcmf_dbg(TRACE, "Enter\n");
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  134  
633a9b6f514c12 Gustavo A. R. Silva 2022-11-15  135  	chunk_buf = kzalloc(struct_size(chunk_buf, data, MAX_CHUNK_LEN),
633a9b6f514c12 Gustavo A. R. Silva 2022-11-15  136  			    GFP_KERNEL);
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  137  	if (!chunk_buf) {
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10 @138  		err = -ENOMEM;
dd7e55401fec58 Hector Martin       2023-02-14  139  		return -ENOMEM;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  140  	}
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  141  
dd7e55401fec58 Hector Martin       2023-02-14  142  	datalen = size;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  143  	cumulative_len = 0;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  144  	do {
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  145  		if (datalen > MAX_CHUNK_LEN) {
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  146  			chunk_len = MAX_CHUNK_LEN;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  147  		} else {
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  148  			chunk_len = datalen;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  149  			dl_flag |= DL_END;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  150  		}
dd7e55401fec58 Hector Martin       2023-02-14  151  		memcpy(chunk_buf->data, data + cumulative_len, chunk_len);
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  152  
dd7e55401fec58 Hector Martin       2023-02-14  153  		err = brcmf_c_download(ifp, dl_flag, chunk_buf, chunk_len,
dd7e55401fec58 Hector Martin       2023-02-14  154  				       loadvar);
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  155  
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  156  		dl_flag &= ~DL_BEGIN;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  157  
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  158  		cumulative_len += chunk_len;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  159  		datalen -= chunk_len;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  160  	} while ((datalen > 0) && (err == 0));
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  161  
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  162  	if (err) {
dd7e55401fec58 Hector Martin       2023-02-14  163  		bphy_err(drvr, "%s (%zu byte file) failed (%d)\n",
dd7e55401fec58 Hector Martin       2023-02-14  164  			 loadvar, size, err);
dd7e55401fec58 Hector Martin       2023-02-14  165  		/* Retrieve status and print */
dd7e55401fec58 Hector Martin       2023-02-14  166  		err = brcmf_fil_iovar_int_get(ifp, statvar, &status);
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  167  		if (err)
dd7e55401fec58 Hector Martin       2023-02-14  168  			bphy_err(drvr, "get %s failed (%d)\n", statvar, err);
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  169  		else
dd7e55401fec58 Hector Martin       2023-02-14  170  			brcmf_dbg(INFO, "%s=%d\n", statvar, status);
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  171  		err = -EIO;
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  172  	}
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  173  
fdd0bd88ceaecf Chung-Hsien Hsu     2017-11-10  174  	kfree(chunk_buf);
dd7e55401fec58 Hector Martin       2023-02-14  175  	return err;
dd7e55401fec58 Hector Martin       2023-02-14  176  }
dd7e55401fec58 Hector Martin       2023-02-14  177  

:::::: The code at line 138 was first introduced by commit
:::::: fdd0bd88ceaecf729db103ac8836af5805dd2dc1 brcmfmac: add CLM download support

:::::: TO: Chung-Hsien Hsu <stanley.hsu@cypress.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
