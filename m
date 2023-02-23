Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3482723A5
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Feb 2023 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677145498; x=1708681498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HW5PZ7BlQQ2vvEP/MCHxY6IUogxsQzN3ZfhnbnRHO8s=;
  b=ILGHjgYxnEuPZIOg+UbV6nOgN96ECRj8ZVQOOzw7H49lgoX/OACEfWOH
   +x5dAQwHHLCFaaD8YwDKRKOg3HVPP16upOCi14RJSF0vPh+Gka/PPE29d
   NHP0OEm/EWSYZqvo3nfosUQroheEqDnYcHA5DdGbMZYA5ry87oC12nlHL
   kVfjHNeg2F9Jbo55UBpDYhr8Zmes6jfVF9ngOxk71WNmidkXMH8DfMrAn
   mDmEMG6CwkWcmxt9eNWPecna+IkzqX6iza/UQpbl66DRTkI+Du+3feZ00
   H/GtDk2/S/Id3jUTmPxUAHsqFITxMNbsY0n/dg8OEmESonKqlr2+GTDeA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="360656703"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="360656703"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 01:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="846489147"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="846489147"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Feb 2023 01:44:55 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV89n-0001ED-0F;
	Thu, 23 Feb 2023 09:44:55 +0000
Date: Thu, 23 Feb 2023 17:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/drivers/serial-generic.c:303:2: warning: Call to function
 'strcpy' is insecure as it does not provide bounding of the memory buffer.
 Replace unbounded copy functions with analogous functions that support
 length arguments such as 'strlcpy'. CWE-119 [...
Message-ID: <202302231712.B2Zs3UAJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/drivers/serial-generic.c:303:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniel Kaehn <kaehndan@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5c95ca18a98d742d0a4a04063c32556b5b66378
commit: 542350509499fed057a2a56921a383888a6f4fd3 ALSA: Add generic serial MIDI driver using serial bus API
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20230219 (https://download.01.org/0day-ci/archive/20230223/202302231712.B2Zs3UAJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=542350509499fed057a2a56921a383888a6f4fd3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 542350509499fed057a2a56921a383888a6f4fd3
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302231712.B2Zs3UAJ-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:777:2: note: Taking true branch
           if (val != 0) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:778:7: note: Assuming 'val' is < 5
                   if (val < 5) {
                       ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:778:3: note: Taking true branch
                   if (val < 5) {
                   ^
   sound/soc/codecs/lpass-tx-macro.c:779:4: note: 2nd function call argument is an uninitialized value
                           snd_soc_component_write_field(component, mic_sel_reg,
                           ^                                        ~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:782:4: warning: 2nd function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                           snd_soc_component_write_field(component, mic_sel_reg,
                           ^                                        ~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:744:2: note: 'mic_sel_reg' declared without an initial value
           u16 mic_sel_reg;
           ^~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:750:2: note: 'Default' branch taken. Execution continues on line 777
           switch (e->reg) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:777:6: note: Assuming 'val' is not equal to 0
           if (val != 0) {
               ^~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:777:2: note: Taking true branch
           if (val != 0) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:778:7: note: Assuming 'val' is >= 5
                   if (val < 5) {
                       ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:778:3: note: Taking false branch
                   if (val < 5) {
                   ^
   sound/soc/codecs/lpass-tx-macro.c:782:4: note: 2nd function call argument is an uninitialized value
                           snd_soc_component_write_field(component, mic_sel_reg,
                           ^                                        ~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   49 warnings generated.
   sound/soc/generic/simple-card-utils.c:46:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop, sizeof(prop), "%s%s", prefix, "convert-rate");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:46:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop, sizeof(prop), "%s%s", prefix, "convert-rate");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:50:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop, sizeof(prop), "%s%s", prefix, "convert-channels");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:50:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop, sizeof(prop), "%s%s", prefix, "convert-channels");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:172:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(prop, sizeof(prop), "%sname", prefix);
                   ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:172:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(prop, sizeof(prop), "%sname", prefix);
                   ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:636:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop, sizeof(prop), "%s%s", prefix, "routing");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:636:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop, sizeof(prop), "%s%s", prefix, "routing");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:654:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop, sizeof(prop), "%s%s", prefix, "widgets");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:654:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop, sizeof(prop), "%s%s", prefix, "widgets");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:672:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop, sizeof(prop), "%s%s", prefix, "pin-switches");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:672:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop, sizeof(prop), "%s%s", prefix, "pin-switches");
           ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:697:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(prop, sizeof(prop), "%shp-det-gpio", prefix);
                   ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:697:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(prop, sizeof(prop), "%shp-det-gpio", prefix);
                   ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:702:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(prop, sizeof(prop), "%smic-det-gpio", prefix);
                   ^~~~~~~~
   sound/soc/generic/simple-card-utils.c:702:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(prop, sizeof(prop), "%smic-det-gpio", prefix);
                   ^~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   30 warnings generated.
   sound/drivers/serial-generic.c:283:3: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, substream->number);
                   ^~~~~~~
   sound/drivers/serial-generic.c:283:3: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, substream->number);
                   ^~~~~~~
>> sound/drivers/serial-generic.c:303:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:303:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:333:2: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:333:2: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev->ctrl->nr);
           ^~~~~~~
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/usb/host/r8a66597-hcd.c:657:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(array, 0, sizeof(array));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/r8a66597-hcd.c:657:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(array, 0, sizeof(array));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/r8a66597-hcd.c:2092:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(now_map, 0, sizeof(now_map));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/r8a66597-hcd.c:2092:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(now_map, 0, sizeof(now_map));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/r8a66597-hcd.c:2451:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(r8a66597, 0, sizeof(struct r8a66597));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/r8a66597-hcd.c:2451:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(r8a66597, 0, sizeof(struct r8a66597));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/r8a66597-hcd.c:2457:3: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(clk_name, sizeof(clk_name), "usb%d", pdev->id);
                   ^~~~~~~~
   drivers/usb/host/r8a66597-hcd.c:2457:3: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(clk_name, sizeof(clk_name), "usb%d", pdev->id);
                   ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +303 sound/drivers/serial-generic.c

542350509499fe Daniel Kaehn 2022-05-09  286  
542350509499fe Daniel Kaehn 2022-05-09  287  static int snd_serial_generic_rmidi(struct snd_serial_generic *drvdata,
542350509499fe Daniel Kaehn 2022-05-09  288  				int outs, int ins, struct snd_rawmidi **rmidi)
542350509499fe Daniel Kaehn 2022-05-09  289  {
542350509499fe Daniel Kaehn 2022-05-09  290  	struct snd_rawmidi *rrawmidi;
542350509499fe Daniel Kaehn 2022-05-09  291  	int err;
542350509499fe Daniel Kaehn 2022-05-09  292  
542350509499fe Daniel Kaehn 2022-05-09  293  	err = snd_rawmidi_new(drvdata->card, drvdata->card->driver, 0,
542350509499fe Daniel Kaehn 2022-05-09  294  				outs, ins, &rrawmidi);
542350509499fe Daniel Kaehn 2022-05-09  295  
542350509499fe Daniel Kaehn 2022-05-09  296  	if (err < 0)
542350509499fe Daniel Kaehn 2022-05-09  297  		return err;
542350509499fe Daniel Kaehn 2022-05-09  298  
542350509499fe Daniel Kaehn 2022-05-09  299  	snd_rawmidi_set_ops(rrawmidi, SNDRV_RAWMIDI_STREAM_INPUT,
542350509499fe Daniel Kaehn 2022-05-09  300  				&snd_serial_generic_input);
542350509499fe Daniel Kaehn 2022-05-09  301  	snd_rawmidi_set_ops(rrawmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
542350509499fe Daniel Kaehn 2022-05-09  302  				&snd_serial_generic_output);
542350509499fe Daniel Kaehn 2022-05-09 @303  	strcpy(rrawmidi->name, drvdata->card->shortname);
542350509499fe Daniel Kaehn 2022-05-09  304  
542350509499fe Daniel Kaehn 2022-05-09  305  	snd_serial_generic_substreams(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT],
542350509499fe Daniel Kaehn 2022-05-09  306  					drvdata->serdev->ctrl->nr);
542350509499fe Daniel Kaehn 2022-05-09  307  	snd_serial_generic_substreams(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT],
542350509499fe Daniel Kaehn 2022-05-09  308  					drvdata->serdev->ctrl->nr);
542350509499fe Daniel Kaehn 2022-05-09  309  
542350509499fe Daniel Kaehn 2022-05-09  310  	rrawmidi->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
542350509499fe Daniel Kaehn 2022-05-09  311  			       SNDRV_RAWMIDI_INFO_INPUT |
542350509499fe Daniel Kaehn 2022-05-09  312  			       SNDRV_RAWMIDI_INFO_DUPLEX;
542350509499fe Daniel Kaehn 2022-05-09  313  
542350509499fe Daniel Kaehn 2022-05-09  314  	if (rmidi)
542350509499fe Daniel Kaehn 2022-05-09  315  		*rmidi = rrawmidi;
542350509499fe Daniel Kaehn 2022-05-09  316  	return 0;
542350509499fe Daniel Kaehn 2022-05-09  317  }
542350509499fe Daniel Kaehn 2022-05-09  318  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
