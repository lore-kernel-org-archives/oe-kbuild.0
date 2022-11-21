Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5805863CA
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Nov 2022 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669044385; x=1700580385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JDILFLUEN5RZFxu+K6wvuz44QHUNlf0bTWaHpcdsR0w=;
  b=OeVilAkF3Rbom5uFIuA9Lpbl/RRHR0NbVvUqs7rtq3MjYBx8Wt+10JIm
   cV7Sx8niVLeVCoUWOpA5KjfHtloVSS/PrV17R+21GZ5ZHiXiEUs7w3IKE
   39AaENcx5GO0dBhb8R2rwcux2da4zE9/ma/sMHz2SwJpp/lvb4EGyIo36
   7lAJ3g49mzB6s42/QXEZfMr1fvnF/bqd5Mn9B+g4MajK3qQ1N9nxIf1tz
   28Y/b498ck6iyNSp25JDA8nO2bMiXCkLn8nDyvKc5cDuqR8j01HVnD17E
   0buStIMjJ4tHEOnr5IaiX2qK86ylXJmzM0SrqsymzLRQ3CmS2abXwqBaj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="377843474"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="377843474"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 07:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="641056052"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="641056052"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2022 07:26:23 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ox8gh-0000XV-0R;
	Mon, 21 Nov 2022 15:26:23 +0000
Date: Mon, 21 Nov 2022 23:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1817/9537]
 sound/hda/ext/hdac_ext_controller.c:140:28: warning: Shifting signed 32-bit
 value by 31 bits is implementation-defined behaviour. See condition at line
 160. [shiftTooManyBitsSigned]
Message-ID: <202211212337.yT5KyffS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/hda/ext/hdac_ext_controller.c:140:28: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour. See condition at line 160. [shiftTooManyBitsSigned]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Takashi Iwai <tiwai@suse.de>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e4cd8d3ff7f9efeb97330e5e9b99eeb2a68f5cf9
commit: f90025100fb50552a8281becd8f26aab065d4c31 [1817/9537] ALSA: hda: hdac_ext_controller: remove useless loop
:::::: branch date: 7 hours ago
:::::: commit date: 5 weeks ago
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f90025100fb50552a8281becd8f26aab065d4c31
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/hda/ext/hdac_ext_controller.c:140:28: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour. See condition at line 160. [shiftTooManyBitsSigned]
     if (hlink->lsdiid & (0x1 << addr))
                              ^
   sound/hda/ext/hdac_ext_controller.c:160:23: note: Assuming that condition 'addr>31' is not redundant
    if (addr < 0 || addr > 31)
                         ^
   sound/hda/ext/hdac_ext_controller.c:163:49: note: Calling function 'snd_hdac_ext_bus_get_hlink_by_addr', 2nd argument 'addr' value is 31
    return snd_hdac_ext_bus_get_hlink_by_addr(bus, addr);
                                                   ^
   sound/hda/ext/hdac_ext_controller.c:140:28: note: Shift
     if (hlink->lsdiid & (0x1 << addr))
                              ^

vim +140 sound/hda/ext/hdac_ext_controller.c

bab4445f9a083f Vinod Koul           2015-06-17  127  
fefee954884127 Cezary Rojewski      2022-02-14  128  /**
b0cd60f3e9f532 Pierre-Louis Bossart 2022-10-19  129   * snd_hdac_ext_bus_get_hlink_by_addr - get hlink at specified address
b0cd60f3e9f532 Pierre-Louis Bossart 2022-10-19  130   * @bus: hlink's parent bus device
fefee954884127 Cezary Rojewski      2022-02-14  131   * @addr: codec device address
fefee954884127 Cezary Rojewski      2022-02-14  132   *
b0cd60f3e9f532 Pierre-Louis Bossart 2022-10-19  133   * Returns hlink object or NULL if matching hlink is not found.
fefee954884127 Cezary Rojewski      2022-02-14  134   */
b0cd60f3e9f532 Pierre-Louis Bossart 2022-10-19  135  struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_addr(struct hdac_bus *bus, int addr)
fefee954884127 Cezary Rojewski      2022-02-14  136  {
fefee954884127 Cezary Rojewski      2022-02-14  137  	struct hdac_ext_link *hlink;
fefee954884127 Cezary Rojewski      2022-02-14  138  
fefee954884127 Cezary Rojewski      2022-02-14  139  	list_for_each_entry(hlink, &bus->hlink_list, list)
fefee954884127 Cezary Rojewski      2022-02-14 @140  		if (hlink->lsdiid & (0x1 << addr))
fefee954884127 Cezary Rojewski      2022-02-14  141  			return hlink;
fefee954884127 Cezary Rojewski      2022-02-14  142  	return NULL;
fefee954884127 Cezary Rojewski      2022-02-14  143  }
b0cd60f3e9f532 Pierre-Louis Bossart 2022-10-19  144  EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_hlink_by_addr);
fefee954884127 Cezary Rojewski      2022-02-14  145  
0b00a5615dc40c Jeeja KP             2015-06-11  146  /**
b0cd60f3e9f532 Pierre-Louis Bossart 2022-10-19  147   * snd_hdac_ext_bus_get_hlink_by_name - get hlink based on codec name
6e57188f20ecf3 Keyon Jie            2020-01-13  148   * @bus: the pointer to HDAC bus object
0b00a5615dc40c Jeeja KP             2015-06-11  149   * @codec_name: codec name
0b00a5615dc40c Jeeja KP             2015-06-11  150   */
b0cd60f3e9f532 Pierre-Louis Bossart 2022-10-19  151  struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_name(struct hdac_bus *bus,
0b00a5615dc40c Jeeja KP             2015-06-11  152  							 const char *codec_name)
0b00a5615dc40c Jeeja KP             2015-06-11  153  {
0b00a5615dc40c Jeeja KP             2015-06-11  154  	int bus_idx, addr;
0b00a5615dc40c Jeeja KP             2015-06-11  155  
0b00a5615dc40c Jeeja KP             2015-06-11  156  	if (sscanf(codec_name, "ehdaudio%dD%d", &bus_idx, &addr) != 2)
0b00a5615dc40c Jeeja KP             2015-06-11  157  		return NULL;
76f56fae1cf904 Rakesh Ughreja       2018-06-01  158  	if (bus->idx != bus_idx)
0b00a5615dc40c Jeeja KP             2015-06-11  159  		return NULL;
158e1886b6262c Dan Carpenter        2020-11-03 @160  	if (addr < 0 || addr > 31)
158e1886b6262c Dan Carpenter        2020-11-03  161  		return NULL;
0b00a5615dc40c Jeeja KP             2015-06-11  162  
b0cd60f3e9f532 Pierre-Louis Bossart 2022-10-19  163  	return snd_hdac_ext_bus_get_hlink_by_addr(bus, addr);
0b00a5615dc40c Jeeja KP             2015-06-11  164  }
b0cd60f3e9f532 Pierre-Louis Bossart 2022-10-19  165  EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_hlink_by_name);
0b00a5615dc40c Jeeja KP             2015-06-11  166  

:::::: The code at line 140 was first introduced by commit
:::::: fefee95488412796b293d28c948be6fce63d149b ALSA: hda: Add snd_hdac_ext_bus_link_at() helper

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
