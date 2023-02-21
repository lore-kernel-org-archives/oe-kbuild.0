Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3320D10F6
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 06:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676959910; x=1708495910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pm2FEYAoaKmDFRZx9XdTmzy4+SUtXURukSjn7yRCA8=;
  b=JGMiGLVQE+6UqAmB1HbQJ7TzCTbo7EuPdN1NvrVuCBOCe4xiOOyML/Ju
   zMAwZBTas/3brc2QBHP+OdZyPoPUxgy1qajEEHjtycmWqrcA8+wcb6FBY
   zV2eDjQei5Py1OalJAk2yy9q1MN19sN/+M4BaY4JGMzpSnG6A6OmgERJ5
   bhUCwkuU4zIMZVXENkxCRhTYKyPj20OLpMZ2QzeWiAV0LihZ88/B5vDtV
   NGvxQzO5tYIcrsK6ZIqKlkOJMO9RknDsuU9OoS7CThYYwyo/taEEYTyOH
   eIBCZeS2kzWfEawZOAQe5umBvUNDBaGwibLFAu/zOJjLq7cpELTJx/+QZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="330272316"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="330272316"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 22:11:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="760399518"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="760399518"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Feb 2023 22:11:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pULsR-000EVh-10;
	Tue, 21 Feb 2023 06:11:47 +0000
Date: Tue, 21 Feb 2023 14:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/drivers/serial-generic.c:303:2: warning: Call to function
 'strcpy' is insecure as it does not provide bounding of the memory buffer.
 Replace unbounded copy functions with analogous functions that support
 length arguments such as 'strlcpy'. CWE-119 [...
Message-ID: <202302211437.NbXiPuyh-lkp@intel.com>
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
head:   1f2d9ffc7a5f916935749ffc6e93fb33bfe94d2f
commit: 542350509499fed057a2a56921a383888a6f4fd3 ALSA: Add generic serial MIDI driver using serial bus API
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20230219 (https://download.01.org/0day-ci/archive/20230221/202302211437.NbXiPuyh-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202302211437.NbXiPuyh-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/media/dvb-frontends/stv6110.c:125:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&priv->regs[start], regs, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv6110.c:206:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(priv->regs, buf0, 8);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv6110.c:206:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(priv->regs, buf0, 8);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv6110.c:421:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&priv->regs, &reg0[1], 8);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv6110.c:421:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&priv->regs, &reg0[1], 8);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv6110.c:423:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &stv6110_tuner_ops,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv6110.c:423:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &stv6110_tuner_ops,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 49 warnings (48 in non-user code, 1 with check filters).
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
   44 warnings generated.
   sound/core/seq/seq_memory.c:118:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(*bufptr, src, size);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   sound/core/seq/seq_memory.c:118:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(*bufptr, src, size);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   sound/core/seq/seq_memory.c:345:5: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&tmp->event, buf, size);
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   sound/core/seq/seq_memory.c:345:5: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(&tmp->event, buf, size);
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   sound/core/seq/seq_memory.c:345:5: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                                   memcpy(&tmp->event, buf, size);
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^                       ~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^                    ~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   sound/core/seq/seq_memory.c:293:6: note: Assuming the condition is true
           if (snd_seq_ev_is_variable(event)) {
               ^
   include/sound/asequencer.h:55:37: note: expanded from macro 'snd_seq_ev_is_variable'
   #define snd_seq_ev_is_variable(ev)      (snd_seq_ev_length_type(ev) == SNDRV_SEQ_EVENT_LENGTH_VARIABLE)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/asequencer.h:53:36: note: expanded from macro 'snd_seq_ev_length_type'
   #define snd_seq_ev_length_type(ev)      ((ev)->flags & SNDRV_SEQ_EVENT_LENGTH_MASK)
                                           ^
   sound/core/seq/seq_memory.c:293:2: note: Taking true branch
           if (snd_seq_ev_is_variable(event)) {
           ^
   sound/core/seq/seq_memory.c:297:6: note: Assuming 'ncells' is < field 'total_elements'
           if (ncells >= pool->total_elements)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
