Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E447FA
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Feb 2023 04:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676004506; x=1707540506;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zk2WJz3x0agbUX0MGw5o/Tpqdn3syeYIuS4MmUZ/RAE=;
  b=KMU3nwX10qkItDGqmysYJqnYjHhCpFn/nBnCVEYsE6tSMO/qusDWpF0K
   UHtfa3x9dxv+VDRwvjtIItl3p3BM2Lga2X/xeOUibiT2Z9qLlJcE/iz0+
   gySdI/swY3rqpYWgXuiefSE+VNuJEqst2b5HRyg6Pu7BnCimhJAOhgwTs
   eaUNSlEZ2gXjz5T/dCfia8o6N9EyenwBNrmN1IgCcjB20iCsDKd/zKAiU
   kj9TKIiLZMu39b9wFMXp3JeXfURwEc3tLVFzY8253ObqnPbbACj3rT+7O
   9CCvuz/BPEIF79diPxv8o9vbK3zxYcUq03kD+ZxYKYGvQ0HaSzwesppZC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="392736655"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="392736655"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 20:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="669870391"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="669870391"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Feb 2023 20:48:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQLKe-0005Yo-27;
	Fri, 10 Feb 2023 04:48:20 +0000
Date: Fri, 10 Feb 2023 12:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] firmware: bcm47xx_nvram: allow to read from buffered
 nvram data
Message-ID: <202302101250.npfH2mOz-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/sockptr.h:20:3: error: type defaults to 'int' in declaration of 'sockptr_t' [-Werror=implicit-int]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230206100502.20243-2-wdehoog@exalondelft.nl>
References: <20230206100502.20243-2-wdehoog@exalondelft.nl>
TO: "Willem-Jan de Hoog" <arinc9.unal@gmail.com>
TO: "Rafał Miłecki" <zajec5@gmail.com>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: "Willem-Jan de Hoog" <wdehoog@exalondelft.nl>
TO: Florian Fainelli <f.fainelli@gmail.com>
CC: "Arınç ÜNAL" <arinc.unal@arinc9.com>
CC: linux-mips@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: erkin.bozoglu@xeront.com

Hi Willem-Jan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc7 next-20230209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Willem-Jan-de-Hoog/firmware-bcm47xx_nvram-allow-to-read-from-buffered-nvram-data/20230206-180737
patch link:    https://lore.kernel.org/r/20230206100502.20243-2-wdehoog%40exalondelft.nl
patch subject: [PATCH 1/2] firmware: bcm47xx_nvram: allow to read from buffered nvram data
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: nios2-randconfig-s041-20230209 (https://download.01.org/0day-ci/archive/20230210/202302101250.npfH2mOz-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/763f6661565b50b967e4f22e41cf46d27e14e58f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Willem-Jan-de-Hoog/firmware-bcm47xx_nvram-allow-to-read-from-buffered-nvram-data/20230206-180737
        git checkout 763f6661565b50b967e4f22e41cf46d27e14e58f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/net/wireless/broadcom/brcm80211/brcmfmac/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302101250.npfH2mOz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:12:
   include/linux/bcm47xx_nvram.h:56:2: error: expected identifier or '(' before ':' token
      56 | }:
         |  ^
   In file included from include/linux/net.h:25,
                    from drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.h:9,
                    from drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:14:
>> include/linux/sockptr.h:20:3: warning: data definition has no type or storage class
      20 | } sockptr_t;
         |   ^~~~~~~~~
>> include/linux/sockptr.h:20:3: error: type defaults to 'int' in declaration of 'sockptr_t' [-Werror=implicit-int]
>> include/linux/sockptr.h:22:38: error: expected declaration specifiers or '...' before 'sockptr_t'
      22 | static inline bool sockptr_is_kernel(sockptr_t sockptr)
         |                                      ^~~~~~~~~
>> include/linux/sockptr.h:27:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'KERNEL_SOCKPTR'
      27 | static inline sockptr_t KERNEL_SOCKPTR(void *p)
         |                         ^~~~~~~~~~~~~~
>> include/linux/sockptr.h:32:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'USER_SOCKPTR'
      32 | static inline sockptr_t USER_SOCKPTR(void __user *p)
         |                         ^~~~~~~~~~~~
   include/linux/sockptr.h:37:36: error: expected declaration specifiers or '...' before 'sockptr_t'
      37 | static inline bool sockptr_is_null(sockptr_t sockptr)
         |                                    ^~~~~~~~~
   include/linux/sockptr.h:44:55: error: expected declaration specifiers or '...' before 'sockptr_t'
      44 | static inline int copy_from_sockptr_offset(void *dst, sockptr_t src,
         |                                                       ^~~~~~~~~
   include/linux/sockptr.h:53:48: error: expected declaration specifiers or '...' before 'sockptr_t'
      53 | static inline int copy_from_sockptr(void *dst, sockptr_t src, size_t size)
         |                                                ^~~~~~~~~
   include/linux/sockptr.h:58:42: error: expected declaration specifiers or '...' before 'sockptr_t'
      58 | static inline int copy_to_sockptr_offset(sockptr_t dst, size_t offset,
         |                                          ^~~~~~~~~
   include/linux/sockptr.h:67:35: error: expected declaration specifiers or '...' before 'sockptr_t'
      67 | static inline int copy_to_sockptr(sockptr_t dst, const void *src, size_t size)
         |                                   ^~~~~~~~~
   include/linux/sockptr.h:72:36: error: expected declaration specifiers or '...' before 'sockptr_t'
      72 | static inline void *memdup_sockptr(sockptr_t src, size_t len)
         |                                    ^~~~~~~~~
   include/linux/sockptr.h:85:40: error: expected declaration specifiers or '...' before 'sockptr_t'
      85 | static inline void *memdup_sockptr_nul(sockptr_t src, size_t len)
         |                                        ^~~~~~~~~
   include/linux/sockptr.h:99:52: error: expected declaration specifiers or '...' before 'sockptr_t'
      99 | static inline long strncpy_from_sockptr(char *dst, sockptr_t src, size_t count)
         |                                                    ^~~~~~~~~
   include/linux/sockptr.h:110:40: error: expected declaration specifiers or '...' before 'sockptr_t'
     110 | static inline int check_zeroed_sockptr(sockptr_t src, size_t offset,
         |                                        ^~~~~~~~~
>> include/linux/net.h:190:52: error: expected declaration specifiers or '...' before 'sockptr_t'
     190 |                                       int optname, sockptr_t optval,
         |                                                    ^~~~~~~~~
   In file included from include/net/scm.h:8,
                    from include/linux/netlink.h:9,
                    from include/linux/ethtool.h:18,
                    from include/net/cfg80211.h:13,
                    from drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h:13,
                    from drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:16:
>> include/linux/security.h:1588:53: error: expected declaration specifiers or '...' before 'sockptr_t'
    1588 |                                                     sockptr_t optval,
         |                                                     ^~~~~~~~~
   include/linux/security.h:1589:53: error: expected declaration specifiers or '...' before 'sockptr_t'
    1589 |                                                     sockptr_t optlen,
         |                                                     ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +20 include/linux/sockptr.h

ba423fdaa589d97 Christoph Hellwig 2020-07-23  13  
ba423fdaa589d97 Christoph Hellwig 2020-07-23  14  typedef struct {
ba423fdaa589d97 Christoph Hellwig 2020-07-23  15  	union {
ba423fdaa589d97 Christoph Hellwig 2020-07-23  16  		void		*kernel;
ba423fdaa589d97 Christoph Hellwig 2020-07-23  17  		void __user	*user;
ba423fdaa589d97 Christoph Hellwig 2020-07-23  18  	};
ba423fdaa589d97 Christoph Hellwig 2020-07-23  19  	bool		is_kernel : 1;
ba423fdaa589d97 Christoph Hellwig 2020-07-23 @20  } sockptr_t;
ba423fdaa589d97 Christoph Hellwig 2020-07-23  21  
ba423fdaa589d97 Christoph Hellwig 2020-07-23 @22  static inline bool sockptr_is_kernel(sockptr_t sockptr)
ba423fdaa589d97 Christoph Hellwig 2020-07-23  23  {
ba423fdaa589d97 Christoph Hellwig 2020-07-23  24  	return sockptr.is_kernel;
ba423fdaa589d97 Christoph Hellwig 2020-07-23  25  }
ba423fdaa589d97 Christoph Hellwig 2020-07-23  26  
ba423fdaa589d97 Christoph Hellwig 2020-07-23 @27  static inline sockptr_t KERNEL_SOCKPTR(void *p)
ba423fdaa589d97 Christoph Hellwig 2020-07-23  28  {
ba423fdaa589d97 Christoph Hellwig 2020-07-23  29  	return (sockptr_t) { .kernel = p, .is_kernel = true };
ba423fdaa589d97 Christoph Hellwig 2020-07-23  30  }
ba423fdaa589d97 Christoph Hellwig 2020-07-23  31  
519a8a6cf91dda0 Christoph Hellwig 2020-08-10 @32  static inline sockptr_t USER_SOCKPTR(void __user *p)
ba423fdaa589d97 Christoph Hellwig 2020-07-23  33  {
519a8a6cf91dda0 Christoph Hellwig 2020-08-10  34  	return (sockptr_t) { .user = p };
ba423fdaa589d97 Christoph Hellwig 2020-07-23  35  }
ba423fdaa589d97 Christoph Hellwig 2020-07-23  36  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
