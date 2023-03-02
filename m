Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4E1EA1
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Mar 2023 01:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677721917; x=1709257917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jW8kkde1NFoR92fsgOfoIh0s2sXSc6O1UT32Vvx+Twg=;
  b=edutrXiBf72qExAP9KsJyIA7p6B0Osgdx2X5truSZi/Tg6j9cWYkxAuR
   iRKtT96aZI9or101O2dgVZCVooN2TN6EQjpHbYY3jkvpuci9iQxWLMC/d
   xcyArorBjmwvEcw0BwwJojM1oh3se10SSdKgpyNvPiUUN9mwRtrweEBrl
   eXQr1IMhDR7kyG7sdRDGJDojNKRfJ4rRDX6hliPkG/lXIQrn64OpD14V3
   z30gTvAoYAips0HyLYu46GRvSU+oBFP1lEUbYZ1opfGfPo0MMAa72vWSm
   yIsNvmPOmLEt7bMX948E9Hezu+uBSMeWzOi85HtgQmG4Qw5loBFcUORNs
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332063567"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332063567"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 17:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743647481"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="743647481"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2023 17:51:55 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXY6s-00003x-1I;
	Thu, 02 Mar 2023 01:51:54 +0000
Date: Thu, 2 Mar 2023 09:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/staging/media/av7110/sp8870.c:381:2: warning: Value stored
 to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303020904.W7UkzPv3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/staging/media/av7110/sp8870.c:381:2: warning: Value stored to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ee3f96b164688dae21e2466a57f2e806b64e8a37
commit: 0fcb867718519060c90afea2d9af0a7cc1c3bd36 media: Revert "media: av7110: move to staging/media/deprecated/saa7146"
date:   3 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230226 (https://download.01.org/0day-ci/archive/20230302/202303020904.W7UkzPv3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0fcb867718519060c90afea2d9af0a7cc1c3bd36
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0fcb867718519060c90afea2d9af0a7cc1c3bd36
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303020904.W7UkzPv3-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                   ^      ~~~~~~~
   drivers/media/pci/ddbridge/ddbridge-main.c:206:3: note: Value stored to 'stat' is never read
                   stat = -ENOMEM;
                   ^      ~~~~~~~
   drivers/media/pci/ddbridge/ddbridge-main.c:211:3: warning: Value stored to 'stat' is never read [clang-analyzer-deadcode.DeadStores]
                   stat = -ENODEV;
                   ^      ~~~~~~~
   drivers/media/pci/ddbridge/ddbridge-main.c:211:3: note: Value stored to 'stat' is never read
                   stat = -ENODEV;
                   ^      ~~~~~~~
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   sound/firewire/bebob/bebob.c:109:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bebob->card->shortname, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:109:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(bebob->card->shortname, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:110:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bebob->card->mixername, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:110:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(bebob->card->mixername, model);
           ^~~~~~
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (4 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   sound/pci/lola/lola.c:632:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->mixername, card->shortname);
           ^~~~~~
   sound/pci/lola/lola.c:632:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(card->mixername, card->shortname);
           ^~~~~~
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/staging/media/av7110/sp8870.c:381:2: warning: Value stored to 'tmp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp = ret & 0x3F;
           ^     ~~~~~~~~~~
   drivers/staging/media/av7110/sp8870.c:381:2: note: Value stored to 'tmp' is never read
           tmp = ret & 0x3F;
           ^     ~~~~~~~~~~
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   sound/pci/bt87x.c:675:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, name);
           ^~~~~~
   sound/pci/bt87x.c:675:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(pcm->name, name);
           ^~~~~~
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   sound/pci/cmipci.c:2741:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(elem_id.name, cm_saved_mixer[idx].name);
                   ^~~~~~
   sound/pci/cmipci.c:2741:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(elem_id.name, cm_saved_mixer[idx].name);
                   ^~~~~~
   sound/pci/cmipci.c:3035:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(cm->card->driver + strlen(cm->card->driver), "-SWIEC");
                   ^~~~~~
   sound/pci/cmipci.c:3035:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(cm->card->driver + strlen(cm->card->driver), "-SWIEC");
                   ^~~~~~
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   sound/soc/codecs/cs35l33.c:1159:3: warning: Value stored to 'pdata' is never read [clang-analyzer-deadcode.DeadStores]
                   pdata = &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l33.c:1159:3: note: Value stored to 'pdata' is never read
                   pdata = &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   sound/soc/codecs/cs35l34.c:260:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = regmap_update_bits(priv->regmap, CS35L34_PWRCTL1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:260:3: note: Value stored to 'ret' is never read
                   ret = regmap_update_bits(priv->regmap, CS35L34_PWRCTL1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
>> drivers/staging/media/av7110/av7110_av.c:638:2: warning: Value stored to 'c2' is never read [clang-analyzer-deadcode.DeadStores]
           c2 = 0;
           ^    ~
   drivers/staging/media/av7110/av7110_av.c:638:2: note: Value stored to 'c2' is never read
           c2 = 0;
           ^    ~
   Suppressed 28 warnings (16 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (4 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   kernel/trace/trace_printk.c:256:15: warning: Value stored to 'ptr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const char **ptr = __start___tracepoint_str;
                        ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_printk.c:256:15: note: Value stored to 'ptr' during its initialization is never read
           const char **ptr = __start___tracepoint_str;
                        ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/tmp +381 drivers/staging/media/av7110/sp8870.c

^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  368  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  369  static int sp8870_read_ber (struct dvb_frontend* fe, u32 * ber)
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  370  {
b8742700f13163 drivers/media/dvb/frontends/sp8870.c Johannes Stezenbach 2005-05-16  371  	struct sp8870_state* state = fe->demodulator_priv;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  372  	int ret;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  373  	u32 tmp;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  374  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  375  	*ber = 0;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  376  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  377  	ret = sp8870_readreg(state, 0xC08);
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  378  	if (ret < 0)
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  379  		return -EIO;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  380  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16 @381  	tmp = ret & 0x3F;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  382  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  383  	ret = sp8870_readreg(state, 0xC07);
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  384  	if (ret < 0)
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  385  		return -EIO;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  386  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  387  	tmp = ret << 6;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  388  	if (tmp >= 0x3FFF0)
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  389  		tmp = ~0;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  390  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  391  	*ber = tmp;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  392  
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  393  	return 0;
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  394  }
^1da177e4c3f41 drivers/media/dvb/frontends/sp8870.c Linus Torvalds      2005-04-16  395  

:::::: The code at line 381 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
